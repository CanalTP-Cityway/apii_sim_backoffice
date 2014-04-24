class Connection < ActiveRecord::Base
  belongs_to :stop_1, :class_name => "Stop"
  belongs_to :stop_2, :class_name => "Stop"
end
