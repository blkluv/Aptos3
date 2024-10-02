module my_addrx::PublicOpinionPoll {

    use std::signer;
    use std::vector;
    use std::string;
    use aptos_framework::event;

    const EPOLL_ALREADY_EXISTS: u64 = 1;
    const EPOLL_NOT_FOUND: u64 = 2;
    const EPOLL_CLOSED: u64 = 3;
    const EALREADY_VOTED: u64 = 4;
    const EINVALID_OPTION: u64 = 5;
    const ENOT_POLL_CREATOR: u64 = 6;

    struct Poll has key, store {
        id: u64,
        creator: address,
        question: string::String,
        options: vector<string::String>,
        votes: vector<u64>,
        total_votes: u64,
        is_open: bool
    }

    struct PollManager has key {
        polls: vector<Poll>,
        next_poll_id: u64
    }

    struct PollCreatedEvent has copy, drop, store {
        poll_id: u64,
        creator: address,
        question: string::String,
    }

    struct VoteEvent has copy, drop, store {
        poll_id: u64,
        voter: string::String,  // Replacing address with DID string for identity verification
        option_index: u64
    }

    struct EventHandles has key, store {
        poll_created_handle: event::EventHandle<PollCreatedEvent>,
        vote_handle: event::EventHandle<VoteEvent>,
    }

    public entry fun initialize(account: &signer) {
        assert!(!exists<PollManager>(signer::address_of(account)), EPOLL_ALREADY_EXISTS);
        move_to(account, PollManager { polls: vector::empty<Poll>(), next_poll_id: 0 });
    }

    public entry fun create_poll(
        account: &signer,
         question: string::String,
          options: vector<string::String>
          ) acquires PollManager, EventHandles {
        let manager = borrow_global_mut<PollManager>(signer::address_of(account));
        let poll_id = manager.next_poll_id;

        // Create a new options vector
        let new_options = vector::empty<string::String>();
        let len = vector::length(&options);
        for (i in 0..len) {
            let option = vector::borrow(&options, i);
            vector::push_back(&mut new_options, *option);
        };

        // Create the poll
        let new_poll = Poll {
            id: poll_id,
            creator: signer::address_of(account),
            question: question,
            options: new_options,
            votes: vector::empty<u64>(),
            total_votes: 0,
            is_open: true
        };

        // Initialize votes with 0 count for each option
        let num_options = vector::length(&new_poll.options);
        for (i in 0..num_options) {
            vector::push_back(&mut new_poll.votes, 0);
        };

        // Add poll to the list
        vector::push_back(&mut manager.polls, new_poll);
        manager.next_poll_id = poll_id + 1;

        // Emit PollCreated event
        let event_handle = borrow_global_mut<EventHandles>(signer::address_of(account));
        event::emit_event(&mut event_handle.poll_created_handle, PollCreatedEvent {
            poll_id,
            creator: signer::address_of(account),
            question
        });
    }

    public entry fun vote(did: string::String, poll_id: u64, option_index: u64) acquires PollManager, EventHandles {
        let manager = borrow_global_mut<PollManager>(@my_addrx);  // Replace with your contract address
        let poll = vector::borrow_mut(&mut manager.polls, poll_id);

        assert!(poll.is_open, EPOLL_CLOSED);
        assert!(option_index < vector::length(&poll.options), EINVALID_OPTION);

        // Increment the vote count for the chosen option
        let vote_count = vector::borrow_mut(&mut poll.votes, option_index);
        *vote_count = *vote_count + 1;
        poll.total_votes = poll.total_votes + 1;

        // Emit VoteEvent with DID for voter identification
        let event_handle = borrow_global_mut<EventHandles>(@my_addrx);  
        event::emit_event(&mut event_handle.vote_handle, VoteEvent {
            poll_id,
            voter: did,
            option_index
        });
    }

    public entry fun close_poll(account: &signer, poll_id: u64) acquires PollManager {
        let manager = borrow_global_mut<PollManager>(signer::address_of(account));
        let poll = vector::borrow_mut(&mut manager.polls, poll_id);

        assert!(poll.creator == signer::address_of(account), ENOT_POLL_CREATOR);
        poll.is_open = false;
    }

    #[view]
    public fun get_poll_results(poll_id: u64): (vector<u64>, u64) acquires PollManager {
        let manager = borrow_global<PollManager>(@my_addrx);  
        let poll = vector::borrow(&manager.polls, poll_id);
        (poll.votes, poll.total_votes)
    }

    #[view]
    public fun get_poll(poll_id: u64): (string::String, vector<string::String>, bool) acquires PollManager {
        let manager = borrow_global<PollManager>(@my_addrx);  
        let poll = vector::borrow(&manager.polls, poll_id);
        (poll.question, poll.options, poll.is_open)
    }
}
