class WorkoutSet < ApplicationRecord
  belongs_to :workout_session
  belongs_to :exercise

  enum :unit, { kg: 0, lbs: 1, bodyweight: 2 }, default: :bodyweight

  validates :set_number, presence: true, numericality: { greater_than: 0 }
  validates :reps, numericality: { greater_than: 0 }, allow_nil: true

  scope :completed, -> { where(completed: true) }
  scope :for_exercise, ->(exercise) { where(exercise: exercise) }
end
