class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :position_name

      t.timestamps null: false
    end
  end
end
