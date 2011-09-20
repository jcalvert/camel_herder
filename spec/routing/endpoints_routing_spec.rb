require "spec_helper"

describe EndpointsController do
  describe "routing" do

    it "routes to #index" do
      get("/endpoints").should route_to("endpoints#index")
    end

    it "routes to #new" do
      get("/endpoints/new").should route_to("endpoints#new")
    end

    it "routes to #show" do
      get("/endpoints/1").should route_to("endpoints#show", :id => "1")
    end

    it "routes to #edit" do
      get("/endpoints/1/edit").should route_to("endpoints#edit", :id => "1")
    end

    it "routes to #create" do
      post("/endpoints").should route_to("endpoints#create")
    end

    it "routes to #update" do
      put("/endpoints/1").should route_to("endpoints#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/endpoints/1").should route_to("endpoints#destroy", :id => "1")
    end

  end
end
