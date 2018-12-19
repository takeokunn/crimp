# frozen_string_literal: true

class OverallGymReview < ApplicationRecord
	belongs_to :gym


	def calculate_overall_score_rank
		@overall_scores = OverallGymReview.all.order(overall_score: :desc).pluck(:overall_score)
		overall_score_rank = 1
		overall_score_rank += 1 while @overall_scores[@overall_score_rank - 1] > self.overall_score
		return overall_score_rank
	end
end
