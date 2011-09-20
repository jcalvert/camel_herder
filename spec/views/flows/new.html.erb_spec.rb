require 'spec_helper'

describe "flows/new.html.erb" do
  before(:each) do
    assign(:flow, stub_model(Flow,
      :from => "",
      :to => "",
      :references => ""
    ).as_new_record)
  end

  it "renders new flow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => flows_path, :method => "post" do
      assert_select "input#flow_from", :name => "flow[from]"
      assert_select "input#flow_to", :name => "flow[to]"
      assert_select "input#flow_references", :name => "flow[references]"
    end
  end
end
