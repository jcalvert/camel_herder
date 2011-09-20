require 'spec_helper'

describe "flows/show.html.erb" do
  before(:each) do
    @flow = assign(:flow, stub_model(Flow,
      :from => "",
      :to => "",
      :references => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
