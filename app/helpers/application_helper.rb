module ApplicationHelper
  def username(email)
    email.split("@").first
  end
end
