class ApplicationController < ActionController::Base
  before_action :check_notifications
  def check_notifications
    @unchecked_notifications = Notification.where(checked: false)
  end
end
