class AddUserIdToExercises < ActiveRecord::Migration[8.1]
  def change
    add_column :exercises, :user_id, :integer
    add_index :exercises, :user_id
  end
end
