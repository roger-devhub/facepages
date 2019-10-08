class UserMailer < ActionMailer::Base
  default from: "noreply@facepages.com"

  def welcome_email(user)
    @user = user
    attachments.inline["logo.png"] = File.read("app/assets/images/logo.png")
    mail(to: email_with_name(user), subject: "Welcome to Facepages")
  end

  def notification_email(notification)
    @notification = notification
    mail(to: email_with_name(notification.user), 
         subject: "New Notification from Facepages")
  end


  private


  def email_with_name user
    "#{user.name} <#{user.email}>"
  end
end
