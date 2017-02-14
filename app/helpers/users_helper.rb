module UsersHelper
  def user_gravatar_url(email, size=35)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
  end
end
