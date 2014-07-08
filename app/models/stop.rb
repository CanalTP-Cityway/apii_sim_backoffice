class Stop < ActiveRecord::Base
  include RgeoExt
  set_rgeo_factory_for_column(:shape, @@geos_factory)
  
  belongs_to :mi_system
  has_many :primary_connections, :class_name => "Connection", :foreign_key => "stop_1_id"
  has_many :secondary_connections, :class_name => "Connection", :foreign_key => "stop_2_id"

  scope :mis, ->(mis_id) { where( "mi_system_id = ?", mis_id ) unless mis_id.blank? }
  scope :identifier, ->(stop_id) { where( "id = ?", stop_id ) unless stop_id.blank? }
  scope :named_like, ->(reg_name) { where( "name like ?", "%#{reg_name}%" ) unless reg_name.blank? }
  scope :admin_code, ->(admin_code) { where( "administrative_code = ?", admin_code ) unless admin_code.blank? }
  scope :postal_code, ->(postal_code) { where( "administrative_code = ?", postal_code ) unless postal_code.blank? }
  scope :st_code, ->(st_code) { where( "stop_code = ?", st_code ) unless st_code.blank? }
  scope :neighbours, ->(neighbour_stop_id, dist) { where ( "ST_DWithin(shape, '#{ Stop.find(neighbour_stop_id).shape.as_text}', #{dist})") unless neighbour_stop_id.blank? }

  scope :has_transtions, ->(has_transition) { where( "id IN (?)", Connection.all.map(&:stop_1_id) + Connection.all.map(&:stop_2_id) ) unless (has_transition.to_i == 0) || (Connection.all.map(&:stop_1_id).empty? && Connection.all.map(&:stop_2_id).empty?) }

  scope :searching, ->(args){mis(args[:mis_id]).identifier(args[:stop_id]).named_like(args[:stop_name]).admin_code(args[:administrative_code]).postal_code(args[:postal_code]).st_code(args[:stop_code]).neighbours(args[:neighbour_stop_id], args[:dist]).has_transtions(args[:has_transition])}

  def connections
  	Connection.where("stop_1_id = ? OR stop_2_id = ?", id, id).order(:id)
  end
end
