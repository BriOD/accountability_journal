class JournalSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :entries, include_nested_associations: true
end
