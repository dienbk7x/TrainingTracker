class Employee < ActiveRecord::Base
  belongs_to :department
  has_many :trainings
  has_many :documents, :through => :trainings
  
  validates_presence_of :first_name, :last_name, :username, :department_id, 
    :message => "Can not be empty."
  validates_uniqueness_of :username
  validates_format_of :first_name, :last_name, :with => /\A[a-zA-Z ]+\z/,
    :message => "Name should contain only letters."
  validates_format_of :username, :with => /\A[a-zA-Z]+\z/,
    :message => "Username should contain only letters with no spaces."
    
  def full_name 
      "#{last_name}, #{first_name}" 
  end
end
