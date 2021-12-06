require "test_helper"

class LoginsControllerTest < ActionDispatch::IntegrationTest

    test "should login if not already" do
        get login_url
        assert_response :success
        
        post login_url, params: {username: "test1", password: "Password1"}
        assert_response :redirect
        follow_redirect!
        assert flash[:logged_in]
        assert session[:user_id]
        assert controller.current_user
    end

    test "should not login if username or password wrong" do
        post login_url, params: {username: "test2", password: "Password1"} # only user in db is username: test1
        assert_response :success
        assert flash.now[:alert]
        assert_select ".userpass-error"

        post login_url, params: {username: "test1", password: "aksdhahsjdbsa"} # test1 password is "Password1"
        assert_response :success
        assert flash.now[:alert] 
        assert_select ".userpass-error"
    end

    test "should not login if already logged in" do
        sign_in_with
        get login_url
        assert_response :redirect
        follow_redirect!
        assert flash[:login_present]
    end

    test "should logout if logged in" do
        sign_in_with
        delete logout_url
        assert_response :redirect
        follow_redirect!
        assert_equal root_path, path
        assert flash[:logged_out]
        assert_not session[:user_id]
        assert_not controller.current_user
    end

    test "should not logout if already logged out" do
        delete logout_url
        assert_response :redirect
        follow_redirect!
        assert_equal root_path, path
        assert_not flash[:logged_out]
    end

end