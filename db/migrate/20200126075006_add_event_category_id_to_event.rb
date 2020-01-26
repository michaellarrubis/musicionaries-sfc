class AddEventCategoryIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :event_category, foreign_key: true
  end
end
