class Department < ActiveRecord::Base
  has_many :employees
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name, :with => /\A[a-zA-Z ]+\z/,
    :message => "Name should contain only letters."
end
