class Connection < ActiveRecord::Base 
  self.table_name = "transfer"
  belongs_to :stop1, :class_name => "Stop"
  validates :stop1, presence: true
  belongs_to :stop2, :class_name => "Stop"
  validates :stop2, presence: true
end
