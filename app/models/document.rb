class Document < ActiveRecord::Base
  belongs_to :document_group
  has_many :trainings
  
  validates_presence_of :name, :number, :document_group
  validates_uniqueness_of :number
  
  def full_name 
    "#{number}: #{name}" 
  end
end
