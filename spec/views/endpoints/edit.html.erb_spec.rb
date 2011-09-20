require 'spec_helper'

describe "endpoints/edit.html.erb" do
  before(:each) do
    @endpoint = assign(:endpoint, stub_model(Endpoint,
      :uri => "MyString"
    ))
  end

  it "renders the edit endpoint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => endpoints_path(@endpoint), :method => "post" do
      assert_select "input#endpoint_uri", :name => "endpoint[uri]"
    end
  end
end
