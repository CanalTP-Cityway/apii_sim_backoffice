module Geography
  extend ActiveSupport::Concern
  
  def self.included(base)
    base.class_eval do
      cattr_accessor :geographical_factory, :geos_factory, :cartesian_factory     
      
      self.geos_factory = ::RGeo::Geos.factory(:native_interface => :ffi, :srid => 4326,
                                               :wkt_parser => {:support_ewkt => true, :default_srid => 4326},
                                               :wkt_generator => {:tag_format => :ewkt, :emit_ewkt_srid => true},
                                               :wkb_parser => {:support_ewkb => true, :default_srid => 4326},
                                               :wkb_generator => {:type_format => :ewkb, :emit_ewkt_srid => true}
                                               )
      self.geographical_factory = ::RGeo::Geographic.spherical_factory
      self.cartesian_factory = ::RGeo::Cartesian.factory()
    end
  end

  module ClassMethods
  end     
  
end

