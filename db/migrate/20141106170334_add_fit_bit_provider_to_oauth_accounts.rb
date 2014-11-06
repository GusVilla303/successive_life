class AddFitBitProviderToOauthAccounts < ActiveRecord::Migration
  def change
    add_column :oauth_accounts, :fitbit_provider, :string
    add_column :oauth_accounts, :fitbit_uid, :string
  end
end
