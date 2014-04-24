require 'spec_helper'

describe "stop_searches/index" do
  before(:each) do
    assign(:stop_searches, [
      stub_model(StopSearch,
        :stop_name => "Stop Name",
        :postal_code => "Postal Code",
        :administrative_code => "Administrative Code",
        :stop_code => "Stop Code",
        :stop_id => 1,
        :neighbour_stop_id => 2,
        :mis_id => 3,
        :has_transition => false
      ),
      stub_model(StopSearch,
        :stop_name => "Stop Name",
        :postal_code => "Postal Code",
        :administrative_code => "Administrative Code",
        :stop_code => "Stop Code",
        :stop_id => 1,
        :neighbour_stop_id => 2,
        :mis_id => 3,
        :has_transition => false
      )
    ])
  end

  it "renders a list of stop_searches" do
    render
    assert_select "tr>td", :text => "Stop Name".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Administrative Code".to_s, :count => 2
    assert_select "tr>td", :text => "Stop Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
