class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.text :details
      t.integer :topic_id

      t.timestamps
    end
  end
end
