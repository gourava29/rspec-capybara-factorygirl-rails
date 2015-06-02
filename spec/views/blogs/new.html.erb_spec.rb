require 'rails_helper'

RSpec.describe "blogs/new", type: :view do
  before(:each) do
    assign(:blog, Blog.new(
      :title => "MyString",
      :content => "MyString",
      :author => "MyString"
    ))
  end

  it "renders new blog form" do
    render

    assert_select "form[action=?][method=?]", blogs_path, "post" do

      assert_select "input#blog_title[name=?]", "blog[title]"

      assert_select "input#blog_content[name=?]", "blog[content]"

      assert_select "input#blog_author[name=?]", "blog[author]"
    end
  end
end
