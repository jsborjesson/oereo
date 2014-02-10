class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :title
      t.text :agreement

      t.timestamps
    end
  end
end
