class AddTagsIndexToResources < ActiveRecord::Migration
  def change
    add_index :resources, :tags, using: 'gin'
  end
end
