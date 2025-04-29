import Placeholder1 from "@/assets/placeholders/jersey-club-1.png";
import Placeholder2 from "@/assets/placeholders/jersey-club-2.png";
import Placeholder3 from "@/assets/placeholders/jersey-club-3.png";

export const config: Config = {

  socials: {
    twitter: "https://twitter.com/jerseyclubtv",
    homepage: "https://poll.jersey.fm",
  },

  defaultCollection: {
    name: "Jersey Club Music Polls",
    description: "Decentralized polls where Jersey Club music fans vote for their favorite tracks, artists, and events using emoji-based options.",
    image: Placeholder1,
  },

  ourStory: {
    title: "Our Story",
    subTitle: "Bringing Jersey Club to the Blockchain",
    description:
      "Jersey Club Music Polls is a unique platform where fans of Jersey Club music can participate in decentralized polls. Fans can vote on their favorite tracks, artists, and events using emoji-based options like 💃🏽, 🎶, or 🔥. The power of blockchain ensures that every vote is securely recorded, tamper-proof, and transparent.",
    discordLink: "https://discord.com/invite/jerseyclub",
    images: [Placeholder1, Placeholder2, Placeholder3],
  },

  ourTeam: {
    title: "Our Team",
    members: [
      {
        name: "Alex",
        role: "Blockchain Developer",
        img: Placeholder1,
        socials: {
          twitter: "https://twitter.com/jerseyclubdev",
        },
      },
      {
        name: "Jordan",
        role: "Jersey Club Expert & Curator",
        img: Placeholder2,
      },
      {
        name: "Taylor",
        role: "Community Manager",
        img: Placeholder3,
        socials: {
          twitter: "https://twitter.com/jerseyclubfans",
        },
      },
    ],
  },

  faqs: {
    title: "F.A.Q.",

    questions: [
      {
        title: "Is this platform free to use for creators and voters?",
        description: "Yes! Both creators and voters can participate in Jersey Club music polls free of charge.",
      },
      {
        title: "How do I create a Jersey Club poll?",
        description:
          "To create a poll, simply connect your wallet, enter a question about Jersey Club music, provide emoji-based options (like 💃🏽 for dance tracks or 🎶 for favorite beats), and submit. Your poll will be securely added to the blockchain for others to vote on.",
      },
      {
        title: "How do I vote in a Jersey Club poll?",
        description:
          "Select a poll that interests you, choose an emoji to represent your favorite Jersey Club track, artist, or event (💃🏽 for dance anthems, 🔥 for hype tracks, or 🎶 for smooth beats), and submit your vote. All votes are transparently recorded on the blockchain.",
      },
      {
        title: "Is it safe to vote and create polls?",
        description:
          "Absolutely! Our platform uses blockchain technology to ensure that all votes are secure, transparent, and tamper-proof.",
      },
      {
        title: "Can I close a poll after it's done?",
        description: "Yes, as a poll creator, you can close your poll to prevent further votes once the voting period ends.",
      },
    ],
  },

  nftBanner: [Placeholder1, Placeholder2, Placeholder3],
};

export interface Config {
  socials?: {
    twitter?: string;
    discord?: string;
    homepage?: string;
  };

  defaultCollection?: {
    name: string;
    description: string;
    image: string;
  };

  ourTeam?: {
    title: string;
    members: Array<ConfigTeamMember>;
  };

  ourStory?: {
    title: string;
    subTitle: string;
    description: string;
    discordLink: string;
    images?: Array<string>;
  };

  faqs?: {
    title: string;
    questions: Array<{
      title: string;
      description: string;
    }>;
  };

  nftBanner?: Array<string>;
}

export interface ConfigTeamMember {
  name: string;
  role: string;
  img: string;
  socials?: {
    twitter?: string;
    discord?: string;
  };
}
