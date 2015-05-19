class Event < ActiveRecord::Base
  # t.date :start_date
  # t.date :end_date
  # t.string :name
  # t.text :details
  # t.string :media
  # t.integer :topic_id
  # t.timestamps

  belongs_to :topic

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 255 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  default_scope { order("start_date asc, end_date asc") }

end
