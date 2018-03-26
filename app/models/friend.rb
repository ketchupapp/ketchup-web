class Friend < ApplicationRecord
  belongs_to :user
  has_many :catchups, dependent: :destroy
  has_one :last_catchup, -> { order(happened_at: :desc) }, class_name: 'Catchup'
  has_one_attached :avatar

  scope :longest_ago_first, -> {
    includes(:last_catchup).
    order("catchups.happened_at DESC NULLS LAST").
    reverse
  }

  validates_presence_of :name

  def display_name
    nickname || name
  end

  def last_seen_at
    last_catchup&.happened_at
  end
end
