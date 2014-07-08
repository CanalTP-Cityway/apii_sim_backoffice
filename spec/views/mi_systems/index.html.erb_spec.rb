require 'spec_helper'

describe "mi_systems/index", :type => :view do
  before(:each) do
    mi_system1 = create(:mi_system)
    mi_system2 = create(:mi_system)
    assign(:mi_systems, [mi_system1, mi_system2
      #stub_model(MiSystem,
      #  :name => "Name",
      #  :comment => "MyText",
      #  :api_url => "MyText",
      #  :api_key => "MyText",
      #  :multiple_starts_and_arrivals => 1
      #),
      #stub_model(MiSystem,
      #  :name => "Name",
      #  :comment => "MyText",
      #  :api_url => "MyText",
      #  :api_key => "MyText",
      #  :multiple_starts_and_arrivals => 1
      #)
    ])
  end

  it "renders a list of mi_systems" do
    render
    #assert_select "tr>td", :text => "Name".to_s, :count => 2
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
    #assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
