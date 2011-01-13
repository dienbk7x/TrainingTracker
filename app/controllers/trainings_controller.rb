class TrainingsController < ApplicationController
  # GET /trainings
  # GET /trainings.xml
  def index
    @trainings = Training.order('trained_on ASC').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trainings }
    end
  end

  # GET /trainings/grid/1
  # GET /trainings/grid/1.xml
  def grid
    @department = Department.find(params[:department])
    
    @document_groups = DocumentGroup.where('department_id' => params[:department]).includes(:documents => :trainings)
    @document_groups = @document_groups.order('trainings.trained_on DESC')
   
    @employees = Employee.includes(:departments, { :trainings => { :document => :document_group } })
    @employees = @employees.where('document_groups.department_id' => params[:department]).order('last_name ASC')
    
    respond_to do |format|
      format.html # grid.html.erb
      format.xml  { render :xml => @trainings }
    end
  end

  # GET /trainings/1
  # GET /trainings/1.xml
  def show
    @training = Training.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @training }
    end
  end

  # GET /trainings/new
  # GET /trainings/new.xml
  def new
    @training = Training.new
    @training.trained_on = Time.now 

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @training }
    end
  end

  # GET /trainings/1/edit
  def edit
    @training = Training.find(params[:id])
    @training.trained_on ||= Time.now
  end

  # POST /trainings
  # POST /trainings.xml
  def create
    @training = Training.new(params[:training])

    respond_to do |format|
      if @training.save
        format.html { redirect_to(@training, :notice => 'Training was successfully created.') }
        format.xml  { render :xml => @training, :status => :created, :location => @training }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trainings/1
  # PUT /trainings/1.xml
  def update
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update_attributes(params[:training])
        format.html { redirect_to(@training, :notice => 'Training was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.xml
  def destroy
    @training = Training.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to(trainings_url) }
      format.xml  { head :ok }
    end
  end
end
