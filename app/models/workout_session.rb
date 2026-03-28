class WorkoutSession < ApplicationRecord
  belongs_to :user
  belongs_to :routine, optional: true
  has_many :workout_sets, dependent: :destroy

  scope :completed, -> { where.not(completed_at: nil) }
  scope :in_progress, -> { where(completed_at: nil) }
  scope :recent, -> { order(created_at: :desc) }

  def completed?
    completed_at.present?
  end

  def complete!
    update!(completed_at: Time.current)
  end
end
