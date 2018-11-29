class Special < ActiveRecord::Base
  belongs_to :comedians
  validates :name, presence: true
end
