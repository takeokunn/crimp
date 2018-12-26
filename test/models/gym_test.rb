# frozen_string_literal: true

require 'test_helper'

class GymTest < ActiveSupport::TestCase
	def setup
    @gym = Gym.new(gym_name: "Example User", place: "sibuyaの近く", access: "駅から5分", station: "渋谷")
  end

  test "should be valid" do
    assert @gym.valid?
  end

  test "name should be present" do
    @gym.gym_name = "     "
    assert_not @gym.valid?
  end

end
