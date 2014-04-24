require 'spec_helper'

describe "modes/show" do
  before(:each) do
    @mode = assign(:mode, stub_model(Mode,
      :mode_code => "Mode Code",
      :mode_description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mode Code/)
    expect(rendered).to match(/MyText/)
  end
end
