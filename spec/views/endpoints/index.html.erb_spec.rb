require 'spec_helper'

describe "endpoints/index.html.erb" do
  before(:each) do
    assign(:endpoints, [
      stub_model(Endpoint,
        :uri => "Uri"
      ),
      stub_model(Endpoint,
        :uri => "Uri"
      )
    ])
  end

  it "renders a list of endpoints" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
  end
end
