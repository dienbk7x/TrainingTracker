class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.xml
  def index
    @departments = Department.all
    @departments_tree = Department.arrange

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departments }
    end    
  end
  
  def moveleft
    @department = Department.find(params[:id])
    
    if @department.left_sibling
      @department.move_left
      redirect_to departments_path, :notice => 'Department was successfully moved.'
    else
      redirect_to departments_path, :alert => 'The you cannot move that department up.'
    end
  end
  
  def moveright
    @department = Department.find(params[:id])
    
    if @department.right_sibling
      @department.move_right
      redirect_to(departments_path, :notice => 'Department was successfully moved.')
    else
      redirect_to(departments_path, :alert => 'The you cannot move that department down.')
    end
  end

  # GET /departments/1
  # GET /departments/1.xml
  def show
    @department = Department.find(params[:id])
    @descendants = @department.descendants.arrange

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.xml
  def new
    @department = Department.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.xml
  def create
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to(departments_path, :notice => 'Department was successfully created.') }
        format.xml  { render :xml => departments_path, :status => :created, :location => @department }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.xml
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to(@department, :notice => 'Department was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.xml
  def destroy
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to(departments_url) }
      format.xml  { head :ok }
    end
  end
end
