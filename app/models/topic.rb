class Topic < ActiveRecord::Base
  # t.string :name
  # t.text :description
  # t.timestamps

  has_many :events
  belongs_to :user

  validates :name, presence: true, uniqueness: true, length:  { minimum: 3 }

end
