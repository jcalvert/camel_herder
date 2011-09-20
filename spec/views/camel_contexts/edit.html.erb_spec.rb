require 'spec_helper'

describe "camel_contexts/edit.html.erb" do
  before(:each) do
    @camel_context = assign(:camel_context, stub_model(CamelContext,
      :name => "MyString",
      :context_name => "MyString",
      :server => nil
    ))
  end

  it "renders the edit camel_context form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => camel_contexts_path(@camel_context), :method => "post" do
      assert_select "input#camel_context_name", :name => "camel_context[name]"
      assert_select "input#camel_context_context_name", :name => "camel_context[context_name]"
      assert_select "input#camel_context_server", :name => "camel_context[server]"
    end
  end
end
