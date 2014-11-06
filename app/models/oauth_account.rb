class OauthAccount < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_by_auth(auth_data, user_id)
    oauth_account = self.find_or_initialize_by(fitbit_token: auth_data['token'], fitbit_secret: auth_data['secret'])
    unless oauth_account.persisted? && oauth_account.fitbit_secret == auth_data['secret']
      oauth_account.fitbit_token   = auth_data['token']
      oauth_account.fitbit_secret  = auth_data['secret']
      oauth_account.user_id = user_id
      oauth_account.save!
    end
  end
end
