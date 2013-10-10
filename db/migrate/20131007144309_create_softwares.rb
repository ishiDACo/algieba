class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end