require "test_helper"

class CartControllerTest < ActionDispatch::IntegrationTest

    test "should not get cart without auth" do
        get current_cart_url
        assert_response :redirect
        follow_redirect!
        assert_equal login_path, path
    end

    test "should get cart" do
        sign_in_with
        get current_cart_url
        assert_response :success
    end

    test "should add to cart" do
        sign_in_with
        assert_difference 'controller.current_cart.games.count' do
            post add_cart_url(games(:among_us).id)
        end
        assert_response :redirect
        follow_redirect!
        assert_equal current_cart_path, path
    end

    test "should not add existing item to cart" do
        sign_in_with
        post add_cart_url(games(:among_us).id)
        assert_no_difference 'controller.current_cart.games.count' do
            post add_cart_url(games(:among_us).id)
        end
        assert_response :redirect
        follow_redirect!
        assert_equal root_path, path
    end

    test "should remove from cart" do 
        sign_in_with
        post add_cart_url(games(:among_us).id)
        assert_difference 'controller.current_cart.games.count', -1 do
            patch remove_cart_url(games(:among_us).id)
        end
        assert_response :redirect
        follow_redirect!
        assert_equal current_cart_path, path
    end

    test "should not remove non existent item from cart" do
        sign_in_with
        assert_no_difference 'controller.current_cart.games.count' do
            patch remove_cart_url(games(:among_us).id)
        end
        assert_response :redirect
        follow_redirect!
        assert_equal current_cart_path, path
    end

end