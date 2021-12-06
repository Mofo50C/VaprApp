require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest

    test "should get orders" do
        sign_in_with
        get orders_url
        assert_response :success
    end

    test "should not get orders without auth" do
        get orders_url
        assert_response :redirect
        follow_redirect!
        assert flash[:login_required]
        assert_select ".login-alert"
    end

    test "should get checkout" do
        sign_in_with
        post add_cart_url(games(:among_us))
        
        get checkout_url
        assert_response :success
    end

    test "should proceed with checkout" do
        sign_in_with
        post add_cart_url(games(:among_us))

        post checkout_url
        assert_response :success
        assert controller.current_cart.games.empty?
    end

    test "should not place order without auth" do
        post checkout_url
        assert_response :redirect
        follow_redirect!
        assert flash[:login_required]
        assert_select ".login-alert"
    end

end