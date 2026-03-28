class CreateWorkoutSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :workout_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :routine, null: true, foreign_key: true
      t.datetime :completed_at
      t.text :notes

      t.timestamps
    end
  end
end
