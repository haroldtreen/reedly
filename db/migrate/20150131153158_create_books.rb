class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.timestamps null: false
      t.string :title
      t.text :description
      t.text :links
      t.string :filepath
    end
  end
end
