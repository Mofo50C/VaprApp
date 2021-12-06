require "test_helper"

class UserTest < ActiveSupport::TestCase

    setup do
        @user_params = {username: "test2", email: "test2@test", password: "Password1", password_confirmation: "Password1"}
    end

    test "valid user" do
        user = User.new(@user_params)
        assert user.valid?
    end

    test "no username provided" do
        user = User.new(email: "test2@test", password: "Password1", password_confirmation: "Password1")
        assert_not user.valid?
    end

    test "no email provided" do
        user = User.new(username: "test2", password: "Password1", password_confirmation: "Password1")
        assert_not user.valid?
    end

    test "no password provided" do
        user = User.new(username: "test2", email: "test2@test", password_confirmation: "Password1")
        assert_not user.valid?
    end

    test "password must match confirmation" do
        user = User.new(username: "test2", email: "test2@test", password: "Password1", password_confirmation: "jagshdasuhda")
        assert_not user.valid?
    end

    test "duplicate username" do
        user = User.new(username: "test1", email: "test2@test", password: "Password1", password_confirmation: "Password1")
        assert_not user.valid?
    end

    test "duplicate email" do
        user = User.new(username: "test2", email: "test1@test", password: "Password1", password_confirmation: "Password1")
        assert_not user.valid?
    end

end