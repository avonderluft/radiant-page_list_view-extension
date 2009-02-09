require File.dirname(__FILE__) + '/../spec_helper'

Admin::PagesController.module_eval { def rescue_action(e); raise e; end }

describe Admin::PagesController, 'list view' do
  dataset :users_and_pages
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
    
    %w(paginated_list full_list).each do |view|
      it "should display the #{view} view" do
        get :index, :view => view
        assigns[:pages].should_not be_blank
        response.should be_success
        response.should render_template('page_list_view')
      end
    
      it "should redirect to #{view} view when page_view cookie is set to #{view}" do
        request.cookies['page_view'] = CGI::Cookie.new('page_view', view)
        get :index
        response.should be_redirect
        response.should redirect_to(:view => view)
      end
    end
  end
  
  after :each do
    logout
  end
end