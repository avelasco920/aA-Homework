class Person < ActiveRecord::Base
  validates :name, present: true, uniqueness: true
  validates :house_id, present: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
end
