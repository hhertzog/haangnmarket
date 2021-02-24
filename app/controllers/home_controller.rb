class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def my_posts
  	@posts = current_user.posts.order("created_at DESC")
  end

  def delete_all_user_posts
   	@posts = current_user.posts
   	@posts.destroy_all
   	respond_to do |format|
      format.html { redirect_to home_my_posts_path, notice: "성공적으로 삭제되었습니다." }
      format.json { head :no_content }
    end
  end
end
