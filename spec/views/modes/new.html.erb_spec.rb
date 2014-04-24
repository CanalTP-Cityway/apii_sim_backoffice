require 'spec_helper'

describe "modes/new" do
  before(:each) do
    assign(:mode, stub_model(Mode,
      :mode_code => "MyString",
      :mode_description => "MyText"
    ).as_new_record)
  end

  it "renders new mode form" do
    render

    assert_select "form[action=?][method=?]", modes_path, "post" do
      assert_select "input#mode_mode_code[name=?]", "mode[mode_code]"
      assert_select "textarea#mode_mode_description[name=?]", "mode[mode_description]"
    end
  end
end
