require 'rails_helper'

describe "connections/show", :type => :view do
  before(:each) do
    @connection = assign(:connection, stub_model(Connection,
      :stop1_id => nil,
      :stop2_id => nil,
      :distance => 1,
      :duration => 2,
      :prm_duration => 3,
    ))
  end

  #it "renders attributes in <p>" do
  #  render
  #  expect(rendered).to match(//)
  #  expect(rendered).to match(//)
  #  expect(rendered).to match(/1/)
  #  expect(rendered).to match(/2/)
  #  expect(rendered).to match(/3/)
  #  expect(rendered).to match(//)
  #end
end
