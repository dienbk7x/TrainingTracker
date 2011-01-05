class Document < ActiveRecord::Base
  belongs_to :training_type
  has_many :trainings
  
  validates_presence_of :name, :number
  validates_uniqueness_of :number
  
  def full_name 
    "#{number}: #{name}" 
  end
end
