class EventSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :event_category

  attributes :id, :title, :by

  attributes :details do |event|
    DetailSerializer.new(event.details)
  end
end