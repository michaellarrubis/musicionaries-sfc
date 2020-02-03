class EventSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :by

  attributes :details do |event|
    DetailSerializer.new(event.details)
  end
end