require 'spec_helper'

describe "miss/index", :type => :view do
  before(:each) do
    mis1 = create(:mis)
    mis2 = create(:mis)
    assign(:miss, [mis1, mis2
      #stub_model(Mis,
      #  :name => "Name",
      #  :comment => "MyText",
      #  :api_url => "MyText",
      #  :api_key => "MyText",
      #  :multiple_start_and_arrivals => 1
      #),
      #stub_model(Mis,
      #  :name => "Name",
      #  :comment => "MyText",
      #  :api_url => "MyText",
      #  :api_key => "MyText",
      #  :multiple_start_and_arrivals => 1
      #)
    ])
  end

  it "renders a list of miss" do
    render
    #assert_select "tr>td", :text => "Name".to_s, :count => 2
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
    #assert_select "tr>td", :text => "MyText".to_s, :count => 2
    #assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
