# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
#review: crimpはそもそも現在の段階では、ユーザーが操作することがめちゃくちゃ少ない。
#review: post機能とoverall_review機能くらいではないのだろうか？
#review: そもそもログインしてなくても投稿ができてしまう？
#explanation: 投稿する一連の流れはintegration_testに回す
	def setup
		@post = Post.new(overall_caption: "楽しかった")
	end


    test "valid post" do
		assert @post.valid?
	end

	test "overall_caption should be present" do
		@post.overall_caption = "   "
		assert_not @post.valid?
	end
end
