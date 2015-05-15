class Topic < ActiveRecord::Base
  # t.string :name
  # t.text :description
  # t.timestamps

  has_many :events

end
