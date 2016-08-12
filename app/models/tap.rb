class Tap < ActiveRecord::Base
  belongs_to :beverage
  belongs_to :tap_list
end
