class Special < ActiveRecord::Base
  has_many :comedians
  validates :name, presence: true
end
