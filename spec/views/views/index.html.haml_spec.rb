require 'rails_helper'

RSpec.describe "views/index", :type => :view do
  before(:each) do
    assign(:views, [
      View.create!(
        :name => "Name",
        :body => "MyText",
        :user => nil
      ),
      View.create!(
        :name => "Name",
        :body => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of views" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
