class ApplicationController < ActionController::Base
  protect_from_forgery

  def menu
    # Retrieve the department tree
    @departments_tree = Department.arrange
    
    # Each department get count of number of training records
    @departments_tree.each do |d|
      d.training_count = Training.count.where(d.id = document.department.id)
    end
  end
end
