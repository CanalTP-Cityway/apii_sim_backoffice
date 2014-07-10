class Connection < ActiveRecord::Base 
  belongs_to :stop_1, :class_name => "Stop"
  validates :stop_1, presence: true
  belongs_to :stop_2, :class_name => "Stop"
  validates :stop_2, presence: true
end
