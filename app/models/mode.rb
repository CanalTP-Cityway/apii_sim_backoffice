class Mode < ActiveRecord::Base
  self.table_name = "mode"
  has_and_belongs_to_many :miss, :association_foreign_key => 'mis_id', validate: :false
  validates :code, presence: true, uniqueness: true


end
