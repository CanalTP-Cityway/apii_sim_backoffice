require 'spec_helper'

describe "stop_searches/new", :type => :view do
  before(:each) do
    assign(:stop_search, stub_model(StopSearch,
      :stop_name => "MyString",
      :postal_code => "MyString",
      :administrative_code => "MyString",
      :code => "MyString",
      :stop_id => 1,
      :neighbour_stop_id => 1,
      :mis_id => 1,
      :has_transition => false
    ).as_new_record)
  end

  it "renders new stop_search form" do
    render

    assert_select "form[action=?][method=?]", stop_searches_path, "post" do
      assert_select "input#stop_search_stop_name[name=?]", "stop_search[stop_name]"
      assert_select "input#stop_search_postal_code[name=?]", "stop_search[postal_code]"
      assert_select "input#stop_search_administrative_code[name=?]", "stop_search[administrative_code]"
      assert_select "input#stop_search_code[name=?]", "stop_search[code]"
      assert_select "input#stop_search_stop_id[name=?]", "stop_search[stop_id]"
      assert_select "input#stop_search_neighbour_stop_id[name=?]", "stop_search[neighbour_stop_id]"
      assert_select "input#stop_search_mis_id[name=?]", "stop_search[mis_id]"
    end
  end
end
