require 'rails_helper'

describe "Blogs" do
  before :each do
    user = FactoryGirl.create(:user)
    puts User.count
  end
  
  it "should be able to visit Blogs Inxed Page without login" do
    visit blogs_path
    expect(page).to have_content 'Title'
    expect(page).to have_selector('table tr')
    #expect(response).to have_http_status(200)
  end
  
  it "should not allow user to Create new blog without log in" do
    visit blogs_path
    click_link "New Blog"
    expect(page).to have_content 'Log in'
  end
  
  it "should allow user to Create new blog after log in" do
    #login_as(user, :scope => :user, :run_callbacks => false)
    visit blogs_path
    click_link "New Blog"
    expect(page).to have_content 'Log in'
    fill_in "Email" , :with => "test@example.com"
    fill_in "Password", :with => "12345678"
    click_button('Log in')
    save_and_open_page
    expect(page).to have_content 'New Blog'
  end
  
  it "should redirect to Blogs Index page after creating Blog" do
    #login_as(user, :scope => :user, :run_callbacks => false)
    visit blogs_path
    click_link "New Blog"
    expect(page).to have_content 'Log in'
    fill_in "Email" , :with => "test@example.com"
    fill_in "Password", :with => "12345678"
    click_button('Log in')
    expect(page).to have_content 'New Blog'
    page.execute_script("$('#blog_title').val("sample blog)") 
  end
  
end
