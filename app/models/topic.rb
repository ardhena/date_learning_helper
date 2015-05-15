class Topic < ActiveRecord::Base
  # t.string :name
  # t.text :description
  # t.timestamps

  has_many :events

  validates :name, presence: true, uniqueness: true, length:  { minimum: 3 }

end
