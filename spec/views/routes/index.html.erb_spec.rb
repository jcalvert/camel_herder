require 'spec_helper'

describe "routes/index.html.erb" do
  before(:each) do
    assign(:routes, [
      stub_model(Route,
        :name => "Name",
        :xml => "MyText",
        :references => ""
      ),
      stub_model(Route,
        :name => "Name",
        :xml => "MyText",
        :references => ""
      )
    ])
  end

  it "renders a list of routes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
