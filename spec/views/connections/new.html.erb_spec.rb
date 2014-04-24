require 'spec_helper'

describe "connections/new" do
  before(:each) do
    assign(:connection, stub_model(Connection,
      :stop_1_id => nil,
      :stop_2_id => nil,
      :distance => 1,
      :duration => 1,
      :prm_duration => 1,
      :shape => ""
    ).as_new_record)
  end

  it "renders new connection form" do
    render

    assert_select "form[action=?][method=?]", connections_path, "post" do
      assert_select "input#connection_stop_1_id[name=?]", "connection[stop_1_id]"
      assert_select "input#connection_stop_2_id[name=?]", "connection[stop_2_id]"
      assert_select "input#connection_distance[name=?]", "connection[distance]"
      assert_select "input#connection_duration[name=?]", "connection[duration]"
      assert_select "input#connection_prm_duration[name=?]", "connection[prm_duration]"
      assert_select "input#connection_shape[name=?]", "connection[shape]"
    end
  end
end
