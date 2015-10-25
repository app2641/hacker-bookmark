class Tag < ActiveRecord::Base
  validates :name, presence: true
  validates :official_name, presence: true
end
