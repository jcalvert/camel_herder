require 'spec_helper'

describe "endpoints/show.html.erb" do
  before(:each) do
    @endpoint = assign(:endpoint, stub_model(Endpoint,
      :uri => "Uri"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uri/)
  end
end
