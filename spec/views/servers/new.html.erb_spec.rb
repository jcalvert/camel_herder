require 'spec_helper'

describe "servers/new.html.erb" do
  before(:each) do
    assign(:server, stub_model(Server,
      :name => "MyString",
      :uri => "MyString",
      :username => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new server form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => servers_path, :method => "post" do
      assert_select "input#server_name", :name => "server[name]"
      assert_select "input#server_uri", :name => "server[uri]"
      assert_select "input#server_username", :name => "server[username]"
      assert_select "input#server_password", :name => "server[password]"
    end
  end
end
