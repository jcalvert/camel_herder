class CamelContextsController < ApplicationController
  # GET /camel_contexts
  # GET /camel_contexts.xml
  def index
    @camel_contexts = CamelContext.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @camel_contexts }
    end
  end

  # GET /camel_contexts/1
  # GET /camel_contexts/1.xml
  def show
    @camel_context = CamelContext.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @camel_context }
    end
  end

  # GET /camel_contexts/new
  # GET /camel_contexts/new.xml
  def new
    @camel_context = CamelContext.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @camel_context }
    end
  end

  # GET /camel_contexts/1/edit
  def edit
    @camel_context = CamelContext.find(params[:id])
  end

  # POST /camel_contexts
  # POST /camel_contexts.xml
  def create
    @camel_context = CamelContext.new(params[:camel_context])

    respond_to do |format|
      if @camel_context.save
        format.html { redirect_to(@camel_context, :notice => 'Camel context was successfully created.') }
        format.xml  { render :xml => @camel_context, :status => :created, :location => @camel_context }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @camel_context.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /camel_contexts/1
  # PUT /camel_contexts/1.xml
  def update
    @camel_context = CamelContext.find(params[:id])

    respond_to do |format|
      if @camel_context.update_attributes(params[:camel_context])
        format.html { redirect_to(@camel_context, :notice => 'Camel context was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @camel_context.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /camel_contexts/1
  # DELETE /camel_contexts/1.xml
  def destroy
    @camel_context = CamelContext.find(params[:id])
    @camel_context.destroy

    respond_to do |format|
      format.html { redirect_to(camel_contexts_url) }
      format.xml  { head :ok }
    end
  end
end
