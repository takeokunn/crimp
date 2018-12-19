# frozen_string_literal: true

class OverallGymReview < ApplicationRecord
	belongs_to :gym

	#indexをOverallGymReviewの全てのカラムに追加することが必要なのではないか？
	#そもそもOverallGymReviewとGymモデルを分けたことはよかったのか。

	def calculate_overall_score_rank
		overall_scores = OverallGymReview.all.order(overall_score: :desc).pluck(:overall_score)
		overall_score_rank = 1
		overall_score_rank += 1 while overall_scores[overall_score_rank - 1] > self.overall_score
		return overall_score_rank
	end

	def calculate_problems_quality_rank
		overall_problems_qualities = OverallGymReview.all.order(problems_quality: :desc).pluck(:problems_quality)
		rank = 1
		rank += 1 while overall_problems_qualities[rank - 1] > self.problems_quality
		return rank
	end

	def calculate_cost_par_fee_rank
		overall_cost_par_fees = OverallGymReview.all.order(cost_par_fee: :desc).pluck(:cost_par_fee)
		cost_par_fee_rank = 1
		cost_par_fee_rank += 1 while overall_cost_par_fees[cost_par_fee_rank - 1] > self.cost_par_fee
		return cost_par_fee_rank
	end

	def calculate_comfortableness_rank
		overall_comfortablenesses = OverallGymReview.all.order(comfortableness: :desc).pluck(:comfortableness)
		comfortableness_rank = 1
		comfortableness_rank += 1 while overall_comfortablenesses[comfortableness_rank - 1] > self.comfortableness
		return comfortableness_rank
	end

	def calculate_service_rank
		overall_servicies = OverallGymReview.all.order(service: :desc).pluck(:service)
		service_rank = 1
		service_rank += 1 while overall_servicies[service_rank - 1] > self.service
		return service_rank
	end

end
