class MiSystem < ActiveRecord::Base
  include RgeoExt
  
	has_and_belongs_to_many :modes, validate: :false
  has_many :stops, dependent: :delete_all, validate: :false

  validates :name, presence: true, uniqueness: true
  validates :api_url, presence: true, uniqueness: true

  def connections
    leavings = Connection.where( :stop_1_id => stops )
    arrivings = Connection.where( :stop_2_id => stops )
    leavings + arrivings
  end

  def envelope
    envelope ||= MiSystem.geos_factory.multi_point(stops.collect(&:shape).flatten).envelope
  end
  
end
