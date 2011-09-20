require 'spec_helper'

describe "flows/edit.html.erb" do
  before(:each) do
    @flow = assign(:flow, stub_model(Flow,
      :from => "",
      :to => "",
      :references => ""
    ))
  end

  it "renders the edit flow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => flows_path(@flow), :method => "post" do
      assert_select "input#flow_from", :name => "flow[from]"
      assert_select "input#flow_to", :name => "flow[to]"
      assert_select "input#flow_references", :name => "flow[references]"
    end
  end
end
