require 'open-uri'

class UsersController < ApplicationController

	def show
		@user = User.find_by(id: params[:id])
		render json: @user
	end

	def feeds
		feed_urls = User.find(params[:id]).feeds_arr
		feeds = FeedsManager.get_feeds(feed_urls)
		render json: FeedsManager.format_feed_data(feeds)
	end

end
