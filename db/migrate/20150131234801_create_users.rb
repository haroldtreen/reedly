class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email
      t.string :name
      t.text :feeds
    end
  end
end
