require 'spec_helper'

describe "modes/index" do
  before(:each) do
    assign(:modes, [
      stub_model(Mode,
        :mode_code => "Mode Code",
        :mode_description => "MyText"
      ),
      stub_model(Mode,
        :mode_code => "Mode Code",
        :mode_description => "MyText"
      )
    ])
  end

  it "renders a list of modes" do
    render
    assert_select "tr>td", :text => "Mode Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
