class MiSystem < ActiveRecord::Base
	has_and_belongs_to_many :modes, validate: :false
    has_many :stops, dependent: :delete_all, validate: :false

  	validates :name, presence: true, uniqueness: true
  	validates :api_url, presence: true, uniqueness: true
  	#validates :start_date is a Date in [01/01/1970 - 31/12/2030]
  	#validates :end_date is a Date in [01/01/1970 - 31/12/2030]
  	#validates :start_date .lteq :end_date

    def connections
      stop_ids = Stop.where(:mi_system_id => 3).pluck(:id)
      leavings = Connection.where( :stop_1_id => stop_ids )
      arrivings = Connection.where( :stop_2_id => stop_ids )
      leavings + arrivings
    end

end
