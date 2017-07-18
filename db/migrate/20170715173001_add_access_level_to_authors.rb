class AddAccessLevelToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :access_level, :string
    add_index :authors, :access_level
  end
end
