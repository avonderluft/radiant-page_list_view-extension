require File.dirname(__FILE__) + '/../spec_helper'

Admin::PageController.module_eval { def rescue_action(e); raise e; end }

describe Admin::PageController, 'list view' do
  scenario :users_and_pages
  before :each do
    login_as :existing
  end
  
  describe "alias chain" do
    it "should be set up" do
      controller.should respond_to(:index_without_page_list_view)
      controller.should respond_to(:index_with_page_list_view)
      controller.should respond_to(:index)
    end
  end
  
  describe "GET to /index" do
    it "should display the tree view by default" do
      get :index
      assigns[:homepage].should_not be_nil
      response.should render_template("index")
    end
    
    it "should display the list view" do
      get :index, :view => 'list'
      assigns[:pages].should_not be_blank
      response.should be_success
      response.should render_template("page_list_view")
    end
    
    it "should redirect to the list view when the page_view cookie is set to list" do
      request.cookies['page_view'] = CGI::Cookie.new('page_view', 'list')
      get :index
      response.should be_redirect
      response.should redirect_to(:view => 'list')
    end
  end
  
  after :each do
    logout
  end
end