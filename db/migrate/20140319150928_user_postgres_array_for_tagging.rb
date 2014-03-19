class UserPostgresArrayForTagging < ActiveRecord::Migration
  # http://rny.io/rails/postgresql/2013/07/28/tagging-in-rails-4-using-postgresql-arrays.html
  def change
    add_column :resources, :tags, :string, array: true, default: []
    drop_table :tags
  end
end
