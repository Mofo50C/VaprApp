require "test_helper"

class ContactMailerTest < ActionMailer::TestCase

    setup do
        @email_params = {name: "Test", email: "test1@test", subject: "test subject", body: "test body"}
    end
    
    test "support_email" do
        email = ContactMailer.with(@email_params).support_email

        assert_emails 1 do
            email.deliver_now
        end
        
        assert_equal ["no-reply@vapor.org"], email.from
        assert_equal ["support@vapor.org"], email.to
        assert_equal [@email_params[:email]], email.cc
        assert_equal @email_params[:subject], email.subject

        assert_select_email do
            assert_select "body > p#email_body", @email_params[:body]
        end
    end

end
