class DocumentGroupsController < ApplicationController
  # GET /document_groups
  # GET /document_groups.xml
  def index
    @document_groups = DocumentGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @document_groups }
    end
  end

  # GET /document_groups/1
  # GET /document_groups/1.xml
  def show
    @document_group = DocumentGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document_group }
    end
  end

  # GET /document_groups/new
  # GET /document_groups/new.xml
  def new
    @document_group = DocumentGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document_group }
    end
  end

  # GET /document_groups/1/edit
  def edit
    @document_group = DocumentGroup.find(params[:id])
  end

  # POST /document_groups
  # POST /document_groups.xml
  def create
    @document_group = DocumentGroup.new(params[:document_group])

    respond_to do |format|
      if @document_group.save
        format.html { redirect_to(@document_group, :notice => 'Document group was successfully created.') }
        format.xml  { render :xml => @document_group, :status => :created, :location => @document_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /document_groups/1
  # PUT /document_groups/1.xml
  def update
    @document_group = DocumentGroup.find(params[:id])

    respond_to do |format|
      if @document_group.update_attributes(params[:document_group])
        format.html { redirect_to(@document_group, :notice => 'Document group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @document_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /document_groups/1
  # DELETE /document_groups/1.xml
  def destroy
    @document_group = DocumentGroup.find(params[:id])
    @document_group.destroy

    respond_to do |format|
      format.html { redirect_to(document_groups_url) }
      format.xml  { head :ok }
    end
  end
end
