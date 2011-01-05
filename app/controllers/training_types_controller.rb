class TrainingTypesController < ApplicationController
  # GET /training_types
  # GET /training_types.xml
  def index
    @training_types = TrainingType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @training_types }
    end
  end

  # GET /training_types/1
  # GET /training_types/1.xml
  def show
    @training_type = TrainingType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @training_type }
    end
  end

  # GET /training_types/new
  # GET /training_types/new.xml
  def new
    @training_type = TrainingType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @training_type }
    end
  end

  # GET /training_types/1/edit
  def edit
    @training_type = TrainingType.find(params[:id])
  end

  # POST /training_types
  # POST /training_types.xml
  def create
    @training_type = TrainingType.new(params[:training_type])

    respond_to do |format|
      if @training_type.save
        format.html { redirect_to(@training_type, :notice => 'Training type was successfully created.') }
        format.xml  { render :xml => @training_type, :status => :created, :location => @training_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @training_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /training_types/1
  # PUT /training_types/1.xml
  def update
    @training_type = TrainingType.find(params[:id])

    respond_to do |format|
      if @training_type.update_attributes(params[:training_type])
        format.html { redirect_to(@training_type, :notice => 'Training type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @training_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /training_types/1
  # DELETE /training_types/1.xml
  def destroy
    @training_type = TrainingType.find(params[:id])
    @training_type.destroy

    respond_to do |format|
      format.html { redirect_to(training_types_url) }
      format.xml  { head :ok }
    end
  end
end
