class Employee < ActiveRecord::Base
  has_and_belongs_to_many :departments
  has_many :trainings
  has_many :documents, :through => :trainings
  
  validates_presence_of :first_name, :last_name, :username, 
    :message => "Can not be empty."
  validates_uniqueness_of :username
  validates_format_of :first_name, :last_name, :with => /\A[a-zA-Z ]+\z/,
    :message => "Name should contain only letters."
  validates_format_of :username, :with => /\A[A-Z]+\z/,
    :message => "Username should contain only capital letters with no spaces."
    
  def full_name 
      "#{last_name}, #{first_name}" 
  end
end
