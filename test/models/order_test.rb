require "test_helper"

class OrderTest < ActiveSupport::TestCase

    test "valid order" do
        order = Order.new(user: users(:one), game: games(:among_us), total: games(:among_us).calculate_price)
        assert order.valid?
    end

    test "no user provided" do
        order = Order.new(game: games(:among_us), total: games(:among_us).calculate_price)
        assert_not order.valid?
    end

    test "no game provided" do
        order = Order.new(user: users(:one), total: games(:among_us).calculate_price)
        assert_not order.valid?
    end

    test "no total provided" do
        order = Order.new(user: users(:one), game: games(:among_us))
        assert_not order.valid?
    end

end