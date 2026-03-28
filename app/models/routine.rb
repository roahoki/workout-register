class Routine < ApplicationRecord
  belongs_to :user
  has_many :routine_exercises, -> { order(:position) }, dependent: :destroy
  has_many :exercises, through: :routine_exercises
  has_many :workout_sessions, dependent: :nullify

  validates :name, presence: true
end
