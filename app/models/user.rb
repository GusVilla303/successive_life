class User < ActiveRecord::Base
  # validates :name, :twitter_pic, presence: true
  # has_many :github_goals
  #
  # def self.find_or_create_by_auth(auth_data)
  #   user = self.find_or_initialize_by(provider: auth_data["provider"], uid: auth_data['uid'])
  #   unless user.persisted? && user.name == auth_data['info']['uid']
  #     user.name        = auth_data['info']['name']
  #     user.email       = auth_data['info']['email']
  #     user.twitter_pic = auth_data['info']['image']
  #     user.save!
  #   end
  #   user
  # end



#fitbit data
  def self.from_omniauth(auth)
    current_user        = where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider     = auth.provider
      user.uid          = auth.uid
      user.oauth_token  = auth['credentials']['token']
      user.oauth_secret = auth['credentials']['secret']
    end

    if current_user.oauth_token != auth['credentials']['token'] && current_user.oauth_secret != auth['credentials']['secret']
      current_user.oauth_token  = auth['credentials']['token']
      current_user.oauth_secret = auth['credentials']['secret']
      current_user.save
    end

    current_user
  end


  def linked?
    oauth_token.present? && oauth_secret.present?
  end

  def fitbit_data
    raise "Account is not linked with a Fitbit account" unless linked?
    @client ||= Fitgem::Client.new(
                :consumer_key => ENV["consumer_key"],
                :consumer_secret => ENV["consumer_secret"],
                :token => oauth_token,
                :secret => oauth_secret,
                :user_id => uid
              )
  end

  def has_fitbit_data?
    !@client.nil?
  end
end
