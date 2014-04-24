require 'spec_helper'

describe "modes/edit" do
  before(:each) do
    @mode = assign(:mode, stub_model(Mode,
      :mode_code => "MyString",
      :mode_description => "MyText"
    ))
  end

  it "renders the edit mode form" do
    render

    assert_select "form[action=?][method=?]", mode_path(@mode), "post" do
      assert_select "input#mode_mode_code[name=?]", "mode[mode_code]"
      assert_select "textarea#mode_mode_description[name=?]", "mode[mode_description]"
    end
  end
end
