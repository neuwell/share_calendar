class Schedule < ApplicationRecord
  has_many :schedule_items
  accepts_nested_attributes_for :schedule_items
end
