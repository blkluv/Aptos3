module my_addrx::ScholarshipPlatformTests {
    use my_addrx::StudyScholarships;
    use std::signer;
    use std::vector;
    use std::string::String;
    use std::timestamp;
    use std::string::utf8;

    // Helper function to create a signer
    public fun create_signer(): address {
        return @donor_addrx
    }

    // Test account setup
    public fun setup() {
        // Create a signer for testing
        let donor = create_signer();
        let applicant = create_signer();

        // Initialize balances for donor and applicant
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::initialize_balance(&applicant);

        // Fund the donor with tokens for scholarship creation
        StudyScholarships::issue_tokens(&donor, 1000);
    }

    // Test initialize_global_donor_list
    public fun test_initialize_global_donor_list() {
        let admin = create_signer();
        StudyScholarships::initialize_global_donor_list(&admin);
        // Check the donor list is initialized
    }

    // Test create_scholarship
    public fun test_create_scholarship() {
        let donor = create_signer();
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::issue_tokens(&donor, 1000);
        
        StudyScholarships::initialize_scholarships(&donor);
        StudyScholarships::create_scholarship(&donor, utf8(b"Test Scholarship"), 500, 3, utf8(b"Engineering"), 3600);
        // Assert that the scholarship is created with expected values
    }

    // Test get_scholarship_by_id (valid ID)
    public fun test_get_scholarship_by_id_valid() {
        let donor = create_signer();
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::issue_tokens(&donor, 1000);
        
        StudyScholarships::initialize_scholarships(&donor);
        StudyScholarships::create_scholarship(&donor, utf8(b"Test Scholarship"), 500, 3, utf8(b"Engineering"), 3600);

        let scholarship = StudyScholarships::get_scholarship_by_id(&mut StudyScholarships::get_scholarships_created_by(signer::address_of(&donor)), 1000);
        // Assert that the scholarship details are as expected
    }

    // Test get_scholarship_by_id (invalid ID)
    public fun test_get_scholarship_by_id_invalid() {
        let donor = create_signer();
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::issue_tokens(&donor, 1000);
        
        StudyScholarships::initialize_scholarships(&donor);
        StudyScholarships::create_scholarship(&donor, utf8(b"Test Scholarship"), 500, 3, utf8(b"Engineering"), 3600);

        let scholarship = StudyScholarships::get_scholarship_by_id(&mut StudyScholarships::get_scholarships_created_by(signer::address_of(&donor)), 9999);
        // Assert that scholarship_id is 0 or the scholarship has empty/default values
    }

    // Test apply_for_scholarship
    public fun test_apply_for_scholarship() {
        let donor = create_signer();
        let applicant = create_signer();
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::initialize_balance(&applicant);
        StudyScholarships::issue_tokens(&donor, 1000);

        StudyScholarships::initialize_scholarships(&donor);
        StudyScholarships::create_scholarship(&donor, utf8(b"Test Scholarship"), 500, 3, utf8(b"Engineering"), 3600);

        StudyScholarships::apply_for_scholarship(&applicant, 1000, 3, utf8(b"Engineering"));
        // Assert that the application was created successfully
    }

    // Test distribute_scholarship
    public fun test_distribute_scholarship() {
        let donor = create_signer();
        let applicant = create_signer();
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::initialize_balance(&applicant);
        StudyScholarships::issue_tokens(&donor, 1000);

        StudyScholarships::initialize_scholarships(&donor);
        StudyScholarships::create_scholarship(&donor, utf8(b"Test Scholarship"), 500, 3, utf8(b"Engineering"), 3600);

        StudyScholarships::apply_for_scholarship(&applicant, 1000, 3, utf8(b"Engineering"));
        StudyScholarships::distribute_scholarship(&donor, 1000);
        // Assert that the scholarship has been distributed to the applicant
    }

    // Test emergency_close_scholarship
    public fun test_emergency_close_scholarship() {
        let donor = create_signer();
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::issue_tokens(&donor, 1000);

        StudyScholarships::initialize_scholarships(&donor);
        StudyScholarships::create_scholarship(&donor, utf8(b"Test Scholarship"), 500, 3, utf8(b"Engineering"), 3600);

        StudyScholarships::emergency_close_scholarship(&donor, 1000);
        // Assert that the scholarship is closed and the funds refunded to the donor
    }

    // Test view functions
    public fun test_view_functions() {
        let donor = create_signer();
        StudyScholarships::initialize_balance(&donor);
        StudyScholarships::issue_tokens(&donor, 1000);

        StudyScholarships::initialize_scholarships(&donor);
        StudyScholarships::create_scholarship(&donor, utf8(b"Test Scholarship"), 500, 3, utf8(b"Engineering"), 3600);

        let balance = StudyScholarships::view_account_balance(signer::address_of(&donor));
        // Assert that the balance is correct

        let all_scholarships = StudyScholarships::view_all_scholarships();
        // Assert that the scholarships retrieved match what was created
    }
}
