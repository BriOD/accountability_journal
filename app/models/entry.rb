class Entry < ApplicationRecord
  belongs_to :journal
  has_many :activity_accounts
end
