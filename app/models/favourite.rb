class Favourite < ActiveRecord::Base
  validates :number, presence: true
end
