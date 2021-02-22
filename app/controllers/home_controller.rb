class HomeController < ApplicationController
  def index
  end

  def my_posts
  	@posts = current_user.posts  	
  end
end
