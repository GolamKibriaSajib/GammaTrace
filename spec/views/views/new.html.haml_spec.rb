require 'rails_helper'

RSpec.describe "views/new", :type => :view do
  before(:each) do
    assign(:view, View.new(
      :name => "MyString",
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders new view form" do
    render

    assert_select "form[action=?][method=?]", views_path, "post" do

      assert_select "input#view_name[name=?]", "view[name]"

      assert_select "textarea#view_body[name=?]", "view[body]"

      assert_select "input#view_user_id[name=?]", "view[user_id]"
    end
  end
end
