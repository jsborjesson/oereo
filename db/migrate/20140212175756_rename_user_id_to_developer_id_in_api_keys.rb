class RenameUserIdToDeveloperIdInApiKeys < ActiveRecord::Migration
  def change
    rename_column :api_keys, :user_id, :developer_id
  end
end
