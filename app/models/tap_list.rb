class TapList < ActiveRecord::Base
  has_many :taps
  belongs_to :user
end
