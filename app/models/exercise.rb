class Exercise < ApplicationRecord
  belongs_to :user, optional: true

  has_many :routine_exercises, dependent: :destroy
  has_many :routines, through: :routine_exercises
  has_many :workout_sets, dependent: :destroy

  enum :muscle_group, { push: 0, pull: 1, legs: 2, core: 3, full_body: 4 }

  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :muscle_group, presence: true

  scope :ordered, -> { order(:muscle_group, :name) }
  scope :global, -> { where(user_id: nil) }
  scope :for_user, ->(user) { where(user_id: [ nil, user.id ]) }
end
