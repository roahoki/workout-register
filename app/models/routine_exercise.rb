class RoutineExercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise

  validates :position, presence: true
  validates :target_sets, numericality: { greater_than: 0 }, allow_nil: true
end
