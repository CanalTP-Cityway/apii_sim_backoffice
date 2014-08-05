class Mis < ActiveRecord::Base
  include RgeoExt  
  self.table_name = "mis"
  
  has_and_belongs_to_many :modes, foreign_key: 'mis_id', validate: :false
  has_many :stops, foreign_key: 'mis_id', dependent: :delete_all, validate: :false

  validates :name, presence: true, uniqueness: true
  validates :api_url, presence: true, uniqueness: true

  def connections
    leavings = Connection.where( :stop1_id => stops )
    arrivings = Connection.where( :stop2_id => stops )
    leavings + arrivings
  end

  def envelope
    envelope ||= Mis.geos_factory.multi_point(stops.collect(&:geog).flatten).envelope
  end
  
end
