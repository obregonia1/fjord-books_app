# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @me = users(:me)
    @she = users(:she)
  end

  test 'name_or_email' do
    assert_equal 'me@example.com', @me.name_or_email

    @me.name = 'hoge'
    assert_equal 'hoge', @me.name_or_email
  end

  test 'follow_following?' do
    assert_not @me.following?(@she)

    @me.follow(@she)
    assert @me.following?(@she)
  end

  test 'unfollow_followed_by?' do
    @me.follow(@she)
    assert @she.followed_by?(@me)

    @me.unfollow(@she)
    assert_not @she.followed_by?(@me)
  end
end
