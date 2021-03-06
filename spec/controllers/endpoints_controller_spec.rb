require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EndpointsController do

  # This should return the minimal set of attributes required to create a valid
  # Endpoint. As you add validations to Endpoint, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all endpoints as @endpoints" do
      endpoint = Endpoint.create! valid_attributes
      get :index
      assigns(:endpoints).should eq([endpoint])
    end
  end

  describe "GET show" do
    it "assigns the requested endpoint as @endpoint" do
      endpoint = Endpoint.create! valid_attributes
      get :show, :id => endpoint.id.to_s
      assigns(:endpoint).should eq(endpoint)
    end
  end

  describe "GET new" do
    it "assigns a new endpoint as @endpoint" do
      get :new
      assigns(:endpoint).should be_a_new(Endpoint)
    end
  end

  describe "GET edit" do
    it "assigns the requested endpoint as @endpoint" do
      endpoint = Endpoint.create! valid_attributes
      get :edit, :id => endpoint.id.to_s
      assigns(:endpoint).should eq(endpoint)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Endpoint" do
        expect {
          post :create, :endpoint => valid_attributes
        }.to change(Endpoint, :count).by(1)
      end

      it "assigns a newly created endpoint as @endpoint" do
        post :create, :endpoint => valid_attributes
        assigns(:endpoint).should be_a(Endpoint)
        assigns(:endpoint).should be_persisted
      end

      it "redirects to the created endpoint" do
        post :create, :endpoint => valid_attributes
        response.should redirect_to(Endpoint.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved endpoint as @endpoint" do
        # Trigger the behavior that occurs when invalid params are submitted
        Endpoint.any_instance.stub(:save).and_return(false)
        post :create, :endpoint => {}
        assigns(:endpoint).should be_a_new(Endpoint)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Endpoint.any_instance.stub(:save).and_return(false)
        post :create, :endpoint => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested endpoint" do
        endpoint = Endpoint.create! valid_attributes
        # Assuming there are no other endpoints in the database, this
        # specifies that the Endpoint created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Endpoint.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => endpoint.id, :endpoint => {'these' => 'params'}
      end

      it "assigns the requested endpoint as @endpoint" do
        endpoint = Endpoint.create! valid_attributes
        put :update, :id => endpoint.id, :endpoint => valid_attributes
        assigns(:endpoint).should eq(endpoint)
      end

      it "redirects to the endpoint" do
        endpoint = Endpoint.create! valid_attributes
        put :update, :id => endpoint.id, :endpoint => valid_attributes
        response.should redirect_to(endpoint)
      end
    end

    describe "with invalid params" do
      it "assigns the endpoint as @endpoint" do
        endpoint = Endpoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Endpoint.any_instance.stub(:save).and_return(false)
        put :update, :id => endpoint.id.to_s, :endpoint => {}
        assigns(:endpoint).should eq(endpoint)
      end

      it "re-renders the 'edit' template" do
        endpoint = Endpoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Endpoint.any_instance.stub(:save).and_return(false)
        put :update, :id => endpoint.id.to_s, :endpoint => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested endpoint" do
      endpoint = Endpoint.create! valid_attributes
      expect {
        delete :destroy, :id => endpoint.id.to_s
      }.to change(Endpoint, :count).by(-1)
    end

    it "redirects to the endpoints list" do
      endpoint = Endpoint.create! valid_attributes
      delete :destroy, :id => endpoint.id.to_s
      response.should redirect_to(endpoints_url)
    end
  end

end
