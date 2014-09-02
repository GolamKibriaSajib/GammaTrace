require 'rails_helper'

RSpec.describe "views/show", :type => :view do
  before(:each) do
    @view = assign(:view, View.create!(
      :name => "Name",
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
