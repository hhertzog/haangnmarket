class NotificationsController < ApplicationController
	before_action :authenticate_user!
	
  def index
   	@notifications = current_user.notifications

   	# Mark all notifications on page as 'read' when user opens notification index
   	@notifications.each do |notification|
   		notification.update(read: true)
   	end
  end

  def delete_all
   	@notifications = current_user.notifications
   	@notifications.destroy_all
   	respond_to do |format|
      format.html { redirect_to notifications_index_path, notice: "Cleared all notifications successfully." }
      format.json { head :no_content }
    end
  end

end
