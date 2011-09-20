require 'spec_helper'

describe "camel_contexts/index.html.erb" do
  before(:each) do
    assign(:camel_contexts, [
      stub_model(CamelContext,
        :name => "Name",
        :context_name => "Context Name",
        :server => nil
      ),
      stub_model(CamelContext,
        :name => "Name",
        :context_name => "Context Name",
        :server => nil
      )
    ])
  end

  it "renders a list of camel_contexts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Context Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
