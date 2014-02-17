class AddLicenseIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :license_id, :integer
  end
end
