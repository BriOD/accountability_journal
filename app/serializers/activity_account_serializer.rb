class ActivityAccountSerializer < ActiveModel::Serializer
  attributes :id, :daily_activity, :completion, :duration, :notes
  belongs_to :entry
end
