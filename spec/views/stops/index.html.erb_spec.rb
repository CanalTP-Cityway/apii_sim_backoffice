require 'spec_helper'

describe "stops/index" do
  before(:each) do
    assign(:stops, [
      stub_model(Stop,
        :stop_code => 1,
        :mi_system => nil,
        :name => "Name",
        :type => 2,
        :administrative_code => "MyText",
        :site_ref => 3,
        :transport_mode => "MyText",
        :quay_type => "MyText",
        :lat => "9.99",
        :lon => "9.99",
        :shape => ""
      ),
      stub_model(Stop,
        :stop_code => 1,
        :mi_system => nil,
        :name => "Name",
        :type => 2,
        :administrative_code => "MyText",
        :site_ref => 3,
        :transport_mode => "MyText",
        :quay_type => "MyText",
        :lat => "9.99",
        :lon => "9.99",
        :shape => ""
      )
    ])
  end

  it "renders a list of stops" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
