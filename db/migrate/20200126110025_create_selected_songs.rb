class CreateSelectedSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_songs do |t|
      t.references :song, foreign_key: true
      t.references :detail, foreign_key: true

      t.timestamps
    end
  end
end
