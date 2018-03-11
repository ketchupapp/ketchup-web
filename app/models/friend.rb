class Friend < ApplicationRecord
  belongs_to :user
  has_many :catchups
  has_one :last_catchup, -> { order(happened_at: :desc) }, class_name: 'Catchup'

  validates_presence_of :name

  def last_seen_at
    last_catchup&.happened_at
  end
end
