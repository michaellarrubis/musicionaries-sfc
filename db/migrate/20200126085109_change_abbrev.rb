class ChangeAbbrev < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :abbrev, :by
  end
end
