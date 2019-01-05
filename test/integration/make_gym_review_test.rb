require 'test_helper'

class MakeGymReviewTest < ActionDispatch::IntegrationTest
	Devise::Test::IntegrationHelpers

	def setup
		@user = users(:john)
		@gym = gyms(:one)
	end
#課題： assert_template 'gym_reviews/new' の部分expecting <"gym_reviews/new"> but rendering with <[]>とでる。原因不明
#memo: どうやら、ユーザーとしてログインするとassert_templateがうまくいかない。deviseを使用したテストに問題がありそう。
	test "make_valid_gym_review" do
		sign_in users(:john)
		get new_gym_review_path(@gym)
		assert_template 'gym_reviews/new'
		assert_difference 'Gym_review.count', 1 do
			post gym_review_path(@gym), params: { gym_review: {problems_quality: 1, cost_par_fee: 3, comfortableness: 3, service: 2}}
		end
		assert_no_difference 'Gym_review.count' do
			post gym_review_path(@gym), params: {gym_review: {problems_quality: 1, cost_par_fee: 3}}
		end
  end
end
