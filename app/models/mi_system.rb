class MiSystem < ActiveRecord::Base
	has_and_belongs_to_many :modes, validate: :false
    has_many :stops, dependent: :delete_all, validate: :false 
	has_many :connections, :through => :stops

  	validates :name, presence: true, uniqueness: true
  	validates :api_url, presence: true, uniqueness: true
  	#validates :start_date is a Date in [01/01/1970 - 31/12/2030]
  	#validates :end_date is a Date in [01/01/1970 - 31/12/2030]
  	#validates :start_date .lteq :end_date  	

  	after_find do |mi_system|
  		mi_system.start_date ||= Time.new(1972, 1, 1,  0,  0,  0)
  		mi_system.end_date ||= Time.new(2030, 12, 31,  23,  59,  59)
  	end

end
