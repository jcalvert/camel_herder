class FlowsController < ApplicationController
  # GET /flows
  # GET /flows.xml
  def index
    @flows = Flow.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flows }
    end
  end

  # GET /flows/1
  # GET /flows/1.xml
  def show
    @flow = Flow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flow }
    end
  end

  # GET /flows/new
  # GET /flows/new.xml
  def new
    @flow = Flow.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flow }
    end
  end

  # GET /flows/1/edit
  def edit
    @flow = Flow.find(params[:id])
  end

  # POST /flows
  # POST /flows.xml
  def create
    @flow = Flow.new(params[:flow])

    respond_to do |format|
      if @flow.save
        format.html { redirect_to(@flow, :notice => 'Flow was successfully created.') }
        format.xml  { render :xml => @flow, :status => :created, :location => @flow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flows/1
  # PUT /flows/1.xml
  def update
    @flow = Flow.find(params[:id])

    respond_to do |format|
      if @flow.update_attributes(params[:flow])
        format.html { redirect_to(@flow, :notice => 'Flow was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flows/1
  # DELETE /flows/1.xml
  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy

    respond_to do |format|
      format.html { redirect_to(flows_url) }
      format.xml  { head :ok }
    end
  end
end
