class Song < ApplicationRecord
  belongs_to :user
  has_many :song_assigns, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.search(search)
    search.nil? ? self.all : self.where("lower(title) LIKE '%#{search}%'")
  end
end
