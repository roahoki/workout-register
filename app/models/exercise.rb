class Exercise < ApplicationRecord
  has_many :routine_exercises, dependent: :destroy
  has_many :routines, through: :routine_exercises
  has_many :workout_sets, dependent: :destroy

  enum :muscle_group, { push: 0, pull: 1, legs: 2, core: 3, full_body: 4 }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :muscle_group, presence: true

  scope :ordered, -> { order(:muscle_group, :name) }
end
