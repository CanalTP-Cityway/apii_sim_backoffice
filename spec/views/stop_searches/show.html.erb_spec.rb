require 'spec_helper'

describe "stop_searches/show" do
  before(:each) do
    @stop_search = assign(:stop_search, stub_model(StopSearch,
      :stop_name => "Stop Name",
      :postal_code => "Postal Code",
      :administrative_code => "Administrative Code",
      :stop_code => "Stop Code",
      :stop_id => 1,
      :neighbour_stop_id => 2,
      :mis_id => 3,
      :has_transition => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Stop Name/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Administrative Code/)
    expect(rendered).to match(/Stop Code/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
