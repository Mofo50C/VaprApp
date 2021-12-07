require "test_helper"

class GameTest < ActiveSupport::TestCase

    test "valid game" do
        game = Game.new(title: "testGame", description: "desd", release_date: Date.new(2021, 12, 2), price: 12.99)
        assert game.valid?
    end

    test "duplicate title" do
        game = Game.new(title: "Among Us", description: "desc", release_date: Date.new(2021, 12, 2), price: 13.99)
        assert_not game.valid?
    end

end