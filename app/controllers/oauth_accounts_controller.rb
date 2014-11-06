class OauthAccountsController < ApplicationController
  def save
    OauthAccount.find_or_create_by_auth(request.env['omniauth.auth']['credentials'], current_user.id)
    redirect_to goals_path
  end
end
