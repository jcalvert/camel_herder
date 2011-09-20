require 'spec_helper'

describe "servers/index.html.erb" do
  before(:each) do
    assign(:servers, [
      stub_model(Server,
        :name => "Name",
        :uri => "Uri",
        :username => "Username",
        :password => "Password"
      ),
      stub_model(Server,
        :name => "Name",
        :uri => "Uri",
        :username => "Username",
        :password => "Password"
      )
    ])
  end

  it "renders a list of servers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
