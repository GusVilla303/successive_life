class OauthAccount < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_by_auth(auth_data, user_id)

    oauth_account = self.find_or_initialize_by(fitbit_provider: auth_data["provider"], fitbit_uid: auth_data['uid'])
    unless oauth_account.persisted? && oauth_account.fitbit_secret == auth_data['credentials']['secret']
      oauth_account.fitbit_token   = auth_data['credentials']['token']
      oauth_account.fitbit_secret  = auth_data['credentials']['secret']
      oauth_account.user_id = user_id
      oauth_account.save!
    end
  end
end
