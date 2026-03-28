class CreateExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :muscle_group
      t.text :description

      t.timestamps
    end
  end
end
