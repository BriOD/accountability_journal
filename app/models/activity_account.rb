class ActivityAccount < ApplicationRecord
  belongs_to :entry, optional: true

  validates :daily_activity, :completion, :duration, presence: true
end
