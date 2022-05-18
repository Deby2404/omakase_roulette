class ApplicationController < ActionController::Base
  before_action :check_notifications
  def check_notifications
    @unchecked_notifications = Notification.where(checked: false)
    logger.debug @unchecked_notifications.inspect
  end
end
