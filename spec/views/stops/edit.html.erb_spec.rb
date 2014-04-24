require 'spec_helper'

describe "stops/edit" do
  before(:each) do
    @stop = assign(:stop, stub_model(Stop,
      :stop_code => 1,
      :mi_system => nil,
      :name => "MyString",
      :type => 1,
      :administrative_code => "MyText",
      :site_ref => 1,
      :transport_mode => "MyText",
      :quay_type => "MyText",
      :lat => "9.99",
      :lon => "9.99",
      :shape => ""
    ))
  end

  it "renders the edit stop form" do
    render

    assert_select "form[action=?][method=?]", stop_path(@stop), "post" do
      assert_select "input#stop_stop_code[name=?]", "stop[stop_code]"
      assert_select "input#stop_mi_system[name=?]", "stop[mi_system]"
      assert_select "input#stop_name[name=?]", "stop[name]"
      assert_select "input#stop_type[name=?]", "stop[type]"
      assert_select "textarea#stop_administrative_code[name=?]", "stop[administrative_code]"
      assert_select "input#stop_site_ref[name=?]", "stop[site_ref]"
      assert_select "textarea#stop_transport_mode[name=?]", "stop[transport_mode]"
      assert_select "textarea#stop_quay_type[name=?]", "stop[quay_type]"
      assert_select "input#stop_lat[name=?]", "stop[lat]"
      assert_select "input#stop_lon[name=?]", "stop[lon]"
      assert_select "input#stop_shape[name=?]", "stop[shape]"
    end
  end
end
