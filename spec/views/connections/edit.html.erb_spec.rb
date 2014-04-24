require 'spec_helper'

describe "connections/edit" do
  before(:each) do
    @connection = assign(:connection, stub_model(Connection,
      :stop_1_id => nil,
      :stop_2_id => nil,
      :distance => 1,
      :duration => 1,
      :prm_duration => 1,
      :shape => ""
    ))
  end

  it "renders the edit connection form" do
    render

    assert_select "form[action=?][method=?]", connection_path(@connection), "post" do
      assert_select "input#connection_stop_1_id[name=?]", "connection[stop_1_id]"
      assert_select "input#connection_stop_2_id[name=?]", "connection[stop_2_id]"
      assert_select "input#connection_distance[name=?]", "connection[distance]"
      assert_select "input#connection_duration[name=?]", "connection[duration]"
      assert_select "input#connection_prm_duration[name=?]", "connection[prm_duration]"
      assert_select "input#connection_shape[name=?]", "connection[shape]"
    end
  end
end
