class Detail < ApplicationRecord
  belongs_to :event
  has_many :selected_songs, dependent: :destroy

  accepts_nested_attributes_for :selected_songs, allow_destroy: true
end
