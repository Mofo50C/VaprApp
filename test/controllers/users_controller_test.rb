require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

    test "should sign up if not logged in" do
        get register_url
        assert_response :success
        
        assert_difference 'User.count' do
            post register_url, params: {user: {username: "test2", email: "test2@test", password: "Password2", password_confirmation: "Password2"}}
        end
        assert_response :redirect
        follow_redirect!
        assert flash[:account_created]
    end

    test "should not sign up if already logged in" do
        sign_in_with
        get register_url
        assert_response :redirect
        assert flash[:login_present]
        
        assert_no_difference 'User.count' do
            post register_url, params: {user: {username: "test2", email: "test2@test", password: "Password2", password_confirmation: "Password2"}}
        end
        
        assert_response :redirect
        follow_redirect!
        assert_not flash[:account_created]
    end

    test "should not sign up if username or email duplicated" do
        assert_equal users(:one).username, "test1"
        assert_no_difference 'User.count' do
            post register_url, params: {user: {username: "test1", email: "test2@test", password: "Password2", password_confirmation: "Password2"}}
        end
        assert_response :success
        assert flash.now[:alert]
        assert_select ".username-dupe"

        assert_equal users(:one).email, "test1@test"
        assert_no_difference 'User.count' do
            post register_url, params: {user: {username: "test2", email: "test1@test", password: "Password2", password_confirmation: "Password2"}}
        end
        assert_response :success
        assert flash.now[:alert]
        assert_select ".email-dupe"
    end

end