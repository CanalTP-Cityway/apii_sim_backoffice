class Connection < ActiveRecord::Base 
  self.table_name = "transfer"
  belongs_to :stop1, :class_name => "Stop"
  validates :stop1, presence: true
  belongs_to :stop2, :class_name => "Stop"
  validates :stop2, presence: true
  
  before_save :update_state
  
  def self.ransackable_attributes(auth_object = nil)
    (column_names + ['stop_id_search1', 'mis_id_search1', 'stop_id_search2', 'mis_id_search2']) + _ransackers.keys
  end
  
  def mis1
    if stop1
      Mis.find(stop1.mis_id)
    end
  end
  
  def mis2
    if stop2
      Mis.find(stop2.mis_id)
    end
  end
  
  private
  def update_state
    self.modification_state = 'manual'
  end
end
