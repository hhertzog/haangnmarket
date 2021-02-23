class NotificationsController < ApplicationController
	before_action :authenticate_user!
	
  def index
   	@notifications = current_user.notifications

   	# Mark all notifications on page as 'read' when user opens notification index
   	@notifications.each do |notification|
   		notification.update(read: true)
   	end
  end
end
