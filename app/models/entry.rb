class Entry < ApplicationRecord
  belongs_to :journal, optional: true
  has_many :activity_accounts
end
