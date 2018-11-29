class Special < ActiveRecord::Base
  belongs_to :comedians
  validates :name, presence: true

  def self.average_runtime
    average(:runtime)
  end
end
