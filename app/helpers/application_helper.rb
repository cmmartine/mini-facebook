module ApplicationHelper
  def user_avatar(user, size = 40)
    if user.avatar.attached? && user.avatar.persisted?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      hash = Digest::MD5.hexdigest(user.email.downcase)
      "https://secure.gravatar.com/avatar/#{hash}.png?s=#{size}"
    end
  end
end
