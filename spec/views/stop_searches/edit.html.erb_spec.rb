require 'spec_helper'

describe "stop_searches/edit" do
  before(:each) do
    @stop_search = assign(:stop_search, stub_model(StopSearch,
      :stop_name => "MyString",
      :postal_code => "MyString",
      :administrative_code => "MyString",
      :stop_code => "MyString",
      :stop_id => 1,
      :neighbour_stop_id => 1,
      :mis_id => 1,
      :has_transition => false
    ))
  end

  it "renders the edit stop_search form" do
    render

    assert_select "form[action=?][method=?]", stop_search_path(@stop_search), "post" do
      assert_select "input#stop_search_stop_name[name=?]", "stop_search[stop_name]"
      assert_select "input#stop_search_postal_code[name=?]", "stop_search[postal_code]"
      assert_select "input#stop_search_administrative_code[name=?]", "stop_search[administrative_code]"
      assert_select "input#stop_search_stop_code[name=?]", "stop_search[stop_code]"
      assert_select "input#stop_search_stop_id[name=?]", "stop_search[stop_id]"
      assert_select "input#stop_search_neighbour_stop_id[name=?]", "stop_search[neighbour_stop_id]"
      assert_select "input#stop_search_mis_id[name=?]", "stop_search[mis_id]"
      assert_select "input#stop_search_has_transition[name=?]", "stop_search[has_transition]"
    end
  end
end
