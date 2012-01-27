class Training < ActiveRecord::Base
  belongs_to :document
  belongs_to :employee
  belongs_to :trainer, :class_name => 'Employee'
  
  validates_presence_of :document_id, :employee_id, :message => "A selection must be made to create a training record."
  validates_presence_of :expires, :message => "Please enter in months how long this training will be valid for from the training date."
  validates_uniqueness_of :employee_id, :scope => [:document_id], :message => "This employee has already been trained to this document."
  validates_format_of :trained_on, :with => /\d{4}-\d{1,2}-\d{1,2}/, :allow_blank => true, :message => "Date should be in the format YYYY-MM-DD."
  validates_presence_of :trainer_id, :unless => "trained_on.blank?", :message => "Please select the person that perfromed the training."

  
  def status    
    if(trained_on.blank?)
        return { :name => "Waiting Training", :class => "default"}
    else
      case
      when trained_on > Date.today
        return { :name => "Scheduled", :class => "notice" }
      when Date.today < trained_on.advance(:months => expires)
        return { :name => "Trained", :class => "success" }
      when Date.today < trained_on.advance(:months => expires-1)
        return { :name => "Re-train Soon", :class => "warning" }
      when Date.today > trained_on.advance(:months => expires)
        return { :name => "Expired!", :class => "important" }
      end
    end
  end
end