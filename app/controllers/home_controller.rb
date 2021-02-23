class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def my_posts
  	@posts = current_user.posts  	
  end
end
