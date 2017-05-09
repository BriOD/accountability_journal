class Entry < ApplicationRecord
  belongs_to :journal, optional: true
  has_one :user, through: :journal
  has_many :activity_accounts

  validates :date, presence: true


def next
  user.entries.where("id > ?", id).first
end

end
