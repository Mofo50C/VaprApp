require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest

    test "get index" do
        get games_url
        assert_response :success
    end

    test "get show" do
        get game_url(games(:among_us))
        assert_response :success
    end

end