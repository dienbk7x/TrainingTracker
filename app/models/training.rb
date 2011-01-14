class Training < ActiveRecord::Base
  belongs_to :document
  belongs_to :employee
  belongs_to :trainer, :class_name => 'Employee'
  belongs_to :status
  
  validates_presence_of :document_id, :employee_id, :status_id
  validates_uniqueness_of :employee_id, :scope => [:document_id], :message => "This employee has already been trained to this document."
end
