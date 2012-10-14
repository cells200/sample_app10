class CreateMicropost1s < ActiveRecord::Migration
  def change
    create_table :micropost1s do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
