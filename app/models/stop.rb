class Stop < ActiveRecord::Base
  include Geography
  
  belongs_to :mi_system
  has_many :primary_connections, :class_name => "Connection", :foreign_key => "stop_1_id"
  has_many :secondary_connections, :class_name => "Connection", :foreign_key => "stop_2_id"
end
