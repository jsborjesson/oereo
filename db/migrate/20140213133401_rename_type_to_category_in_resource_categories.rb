class RenameTypeToCategoryInResourceCategories < ActiveRecord::Migration
  def change
    rename_table :resource_types, :resource_categories
    rename_column :resource_categories, :type, :category
  end
end
