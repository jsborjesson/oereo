class UpdateApiAccessTokenToAuthToken < ActiveRecord::Migration
  def change
    rename_column :api_keys, :access_token, :auth_token
  end
end
