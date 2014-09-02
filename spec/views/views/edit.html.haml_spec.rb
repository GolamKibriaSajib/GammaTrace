require 'rails_helper'

RSpec.describe "views/edit", :type => :view do
  before(:each) do
    @view = assign(:view, View.create!(
      :name => "MyString",
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders the edit view form" do
    render

    assert_select "form[action=?][method=?]", view_path(@view), "post" do

      assert_select "input#view_name[name=?]", "view[name]"

      assert_select "textarea#view_body[name=?]", "view[body]"

      assert_select "input#view_user_id[name=?]", "view[user_id]"
    end
  end
end
