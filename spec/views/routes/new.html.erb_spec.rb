require 'spec_helper'

describe "routes/new.html.erb" do
  before(:each) do
    assign(:route, stub_model(Route,
      :name => "MyString",
      :xml => "MyText",
      :references => ""
    ).as_new_record)
  end

  it "renders new route form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => routes_path, :method => "post" do
      assert_select "input#route_name", :name => "route[name]"
      assert_select "textarea#route_xml", :name => "route[xml]"
      assert_select "input#route_references", :name => "route[references]"
    end
  end
end
