class Mode < ActiveRecord::Base
	has_and_belongs_to_many :mi_systems, validate: :false

	validates :mode_code, presence: true, uniqueness: true
end
