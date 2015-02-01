require 'open-uri'

class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def show
		@user = User.find_by(id: params[:id])
		render json: @user
	end

	def update_feeds
		@user = User.find_by(id: params[:id])
		@user.feeds = @user.feeds + ";#{params[:feed].gsub(/\'/, "")}"
		@user.save
		render json: @user
	end

	def feeds
		feed_urls = User.find(params[:id]).feeds_arr
		feeds = FeedsManager.get_feeds(feed_urls)
		render json: FeedsManager.format_feed_data(feeds)
	end

end
