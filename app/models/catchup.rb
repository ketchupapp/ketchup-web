class Catchup < ApplicationRecord
  belongs_to :friend
  validates_presence_of :happened_at
end
