require "test_helper"

class ContactControllerTest < ActionDispatch::IntegrationTest

    test "should get contact page" do
        get contact_url
        assert_response :success
    end

    test "should send email" do
        post contact_url, params: {name: "Test User", email: "test1@tes", subject: "testing controller", body: "body of test email"}
        assert_response :success
        assert flash[:notice]
        assert_select ".text-success"
    end

end