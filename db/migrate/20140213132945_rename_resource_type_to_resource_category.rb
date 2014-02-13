class RenameResourceTypeToResourceCategory < ActiveRecord::Migration
  def change
    rename_column :resources, :resource_type_id, :resource_category_id
  end
end
