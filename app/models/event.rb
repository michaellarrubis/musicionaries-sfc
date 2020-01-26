class Event < ApplicationRecord
  belongs_to :user
  belongs_to :event_category
  has_many :details, dependent: :destroy
end
