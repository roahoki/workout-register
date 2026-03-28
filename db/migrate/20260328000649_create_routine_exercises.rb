class CreateRoutineExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :routine_exercises do |t|
      t.references :routine, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :position
      t.integer :target_sets
      t.string :target_reps
      t.string :notes

      t.timestamps
    end
  end
end
