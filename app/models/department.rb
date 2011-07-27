class Department < ActiveRecord::Base
  has_and_belongs_to_many :employees
  has_many :documents
  has_many :trainings, :through => :documents
  acts_as_nested_set
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def display_name 
    out = ''
    self.self_and_ancestors.each do |a| 
      out << "#{a.name} > "
    end 
    return out.sub(/ *>* *\z/,'')
  end
end
