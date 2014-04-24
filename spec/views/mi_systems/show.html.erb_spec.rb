require 'spec_helper'

describe "mi_systems/show" do
  before(:each) do
    @mi_system = assign(:mi_system, stub_model(MiSystem,
      :name => "Name",
      :comment => "MyText",
      :api_url => "MyText",
      :api_key => "MyText",
      :multiple_starts_and_arrivals => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
