class AddMediaToEvents < ActiveRecord::Migration
  def up
    add_column :events, :media, :string
  end

  def down
    remove_column :events, :media
  end
end
