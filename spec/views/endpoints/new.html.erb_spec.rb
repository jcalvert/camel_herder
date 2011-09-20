require 'spec_helper'

describe "endpoints/new.html.erb" do
  before(:each) do
    assign(:endpoint, stub_model(Endpoint,
      :uri => "MyString"
    ).as_new_record)
  end

  it "renders new endpoint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => endpoints_path, :method => "post" do
      assert_select "input#endpoint_uri", :name => "endpoint[uri]"
    end
  end
end
