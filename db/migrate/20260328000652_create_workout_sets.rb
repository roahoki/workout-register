class CreateWorkoutSets < ActiveRecord::Migration[8.1]
  def change
    create_table :workout_sets do |t|
      t.references :workout_session, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :set_number
      t.integer :reps
      t.decimal :weight
      t.integer :unit
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
