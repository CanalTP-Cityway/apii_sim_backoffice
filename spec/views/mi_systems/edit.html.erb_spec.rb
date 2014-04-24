require 'spec_helper'

describe "mi_systems/edit" do
  before(:each) do
    @mi_system = assign(:mi_system, stub_model(MiSystem,
      :name => "MyString",
      :comment => "MyText",
      :api_url => "MyText",
      :api_key => "MyText",
      :multiple_starts_and_arrivals => 1
    ))
  end

  it "renders the edit mi_system form" do
    render

    assert_select "form[action=?][method=?]", mi_system_path(@mi_system), "post" do
      assert_select "input#mi_system_name[name=?]", "mi_system[name]"
      assert_select "textarea#mi_system_comment[name=?]", "mi_system[comment]"
      assert_select "textarea#mi_system_api_url[name=?]", "mi_system[api_url]"
      assert_select "textarea#mi_system_api_key[name=?]", "mi_system[api_key]"
      assert_select "input#mi_system_multiple_starts_and_arrivals[name=?]", "mi_system[multiple_starts_and_arrivals]"
    end
  end
end
