class EntrySerializer < ActiveModel::Serializer
  attributes :id, :date
  has_many :activity_accounts, include_nested_associations: true
  belongs_to :journal
end
