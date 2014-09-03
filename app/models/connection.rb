class Connection < ActiveRecord::Base 
  self.table_name = "transfer"
  belongs_to :stop1, :class_name => "Stop"
  validates :stop1, presence: true
  belongs_to :stop2, :class_name => "Stop"
  validates :stop2, presence: true
  
  before_save :update_state
  
  MODIFICATION_STATES = %w( auto manual recalculate validation_needed )
  validates_inclusion_of :modification_state, :in => MODIFICATION_STATES

  # TODO
  #def initialize
  #fix the initial state
  #end

  def self.ransackable_attributes(auth_object = nil)
    (column_names + ['stop_id_search1', 'mis_id_search1', 'stop_id_search2', 'mis_id_search2']) + _ransackers.keys
  end
  
  private
  def update_state
    # switch on the states of the connection
  end
end
