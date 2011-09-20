require 'spec_helper'

describe "flows/index.html.erb" do
  before(:each) do
    assign(:flows, [
      stub_model(Flow,
        :from => "",
        :to => "",
        :references => ""
      ),
      stub_model(Flow,
        :from => "",
        :to => "",
        :references => ""
      )
    ])
  end

  it "renders a list of flows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
