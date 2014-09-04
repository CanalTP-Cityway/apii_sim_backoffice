class Stop < ActiveRecord::Base
  include RgeoExt
  self.table_name = "stop"
  set_rgeo_factory_for_column(:geog, @@geos_factory)

  belongs_to :mis, :class_name => "Mis", :foreign_key => 'mis_id'
  has_many :primary_connections, :class_name => "Connection", :foreign_key => "stop1_id"
  has_many :secondary_connections, :class_name => "Connection", :foreign_key => "stop2_id"

  scope :mis, ->(mis_id) { where( mis_id: mis_id ) unless mis_id.blank? }
  scope :mis_n, ->(mis_name) { where( mis_id: Mis.where( name: mis_name ).map(&:id) ) unless mis_name.blank? }
  scope :identifier, ->(stop_id) { where( id: stop_id ) unless stop_id.blank? }
  scope :named_like, ->(reg_name) { where( "name like ?", "%#{reg_name}%" ) unless reg_name.blank? }
  scope :admin_code, ->(admin_code) { where( administrative_code: admin_code ) unless admin_code.blank? }
  scope :postal_code, ->(postal_code) { where( administrative_code: postal_code ) unless postal_code.blank? }
  scope :st_code, ->(st_code) { where( code: st_code ) unless st_code.blank? }
  scope :neighbours, ->(neighbour_stop_id, dist) { where ( "ST_DWithin(geog, '#{ Stop.find(neighbour_stop_id).geog.as_text}', #{dist})") unless neighbour_stop_id.blank? }
  scope :neighbours_n, ->(neighbour_stop_code, dist) { where ( "ST_DWithin(geog, '#{ Stop.where(code: neighbour_stop_code).geog.as_text}', #{dist})") unless neighbour_stop_code.blank? }

  scope :has_connection, ->(boolean) { where( "#{boolean} AND (id IN (?))", Connection.all.map(&:stop1_id) + Connection.all.map(&:stop2_id) ) }

  scope :searching, ->(args){mis(args[:mis_id]).mis_n(args[:mis_name]).identifier(args[:stop_id]).named_like(args[:stop_name]).admin_code(args[:administrative_code]).postal_code(args[:postal_code]).st_code(args[:code]).neighbours(args[:neighbour_stop_id], args[:dist]).neighbours_n(args[:neighbour_stop_code], args[:dist]).has_transtions(args[:has_transition])}

  #attr_accessor :origin, :distance, :having_connection
  def self.ransackable_attributes(auth_object = nil)
    (column_names + ['origin', 'distance', 'having_connection']) + _ransackers.keys
  end

  def short_name
    "#{name} (#{code})"
  end

  def connections
    Connection.where("stop1_id = ? OR stop2_id = ?", id, id).order(:id)
  end

  def connections_with_stop ( stop1_id )
    Connection.where("stop1_id IN (?) AND stop2_id IN (?)", [id, stop1_id], [id, stop1_id]).order(:id)
  end

  def connections_with_mis ( mis1_id )
    Connection.where( '(stop1_id = ?  AND stop2_id IN (SELECT id FROM stop WHERE mis_id = ?)) OR (stop2_id = ?  AND stop1_id IN (SELECT id FROM stop WHERE mis_id IN (?)))', id, mis1_id, id, mis1_id)
  end

  def self.near_from(point, distance)
    where "ST_DWithin(geom, '#{point.as_text}', #{distance})"
  end

  def having_connections
    #.join()
  end

  def self.ransackable_scopes(auth_object = nil)
    [:has_connection ]
  end

end
