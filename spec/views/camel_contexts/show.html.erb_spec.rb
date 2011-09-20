require 'spec_helper'

describe "camel_contexts/show.html.erb" do
  before(:each) do
    @camel_context = assign(:camel_context, stub_model(CamelContext,
      :name => "Name",
      :context_name => "Context Name",
      :server => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Context Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
