class AddTitleAndDescriptionToResources < ActiveRecord::Migration
  def change
    add_column :resources, :title, :string
    add_column :resources, :description, :text
  end
end
