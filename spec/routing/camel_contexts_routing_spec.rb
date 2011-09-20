require "spec_helper"

describe CamelContextsController do
  describe "routing" do

    it "routes to #index" do
      get("/camel_contexts").should route_to("camel_contexts#index")
    end

    it "routes to #new" do
      get("/camel_contexts/new").should route_to("camel_contexts#new")
    end

    it "routes to #show" do
      get("/camel_contexts/1").should route_to("camel_contexts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/camel_contexts/1/edit").should route_to("camel_contexts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/camel_contexts").should route_to("camel_contexts#create")
    end

    it "routes to #update" do
      put("/camel_contexts/1").should route_to("camel_contexts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/camel_contexts/1").should route_to("camel_contexts#destroy", :id => "1")
    end

  end
end
