require File.dirname(__FILE__) + '/../spec_helper'

describe Page, "with list view extensions" do
  dataset :users_and_pages
  it "should display the user who last updated the page" do
    pages(:home).updated_by_name.should == users(:admin).name
  end

  if defined?(PageGroupPermissionsExtension)
    # TODO: Create a scenario for groups
    it "should display the group name" do
      @page = pages(:home)
      @page.group = Group.new(:name => "Testing")
      @page.group_name.should == "Testing"
    end
  end
  
  it "should display the status" do
    pages(:home).status_name.should == "Published"
  end
  
  it "should display the parent page's title" do
    pages(:radius).parent_title.should == pages(:home).title
  end
end