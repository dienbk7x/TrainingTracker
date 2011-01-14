class DocumentGroup < ActiveRecord::Base
  belongs_to :department
  has_many :documents
  
  validates_presence_of :name, :department_id
  
  def display_name 
    "#{department.name} | #{name}" 
  end
end
