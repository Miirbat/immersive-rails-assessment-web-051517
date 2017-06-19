class Episode < ApplicationRecord
  # belongs_to :user #but does an appearance belong to a user??? Is this a personal rating site, or no??
  belongs_to :guest
  belongs_to :episode
  validates :user_id, presence: true
  validates :guest_id, presence: true
  validates :episode_id, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }


end
