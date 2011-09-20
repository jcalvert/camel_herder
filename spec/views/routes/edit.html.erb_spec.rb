require 'spec_helper'

describe "routes/edit.html.erb" do
  before(:each) do
    @route = assign(:route, stub_model(Route,
      :name => "MyString",
      :xml => "MyText",
      :references => ""
    ))
  end

  it "renders the edit route form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => routes_path(@route), :method => "post" do
      assert_select "input#route_name", :name => "route[name]"
      assert_select "textarea#route_xml", :name => "route[xml]"
      assert_select "input#route_references", :name => "route[references]"
    end
  end
end
