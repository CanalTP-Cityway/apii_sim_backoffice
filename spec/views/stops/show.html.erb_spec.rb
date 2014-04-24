require 'spec_helper'

describe "stops/show" do
  before(:each) do
    @stop = assign(:stop, stub_model(Stop,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
