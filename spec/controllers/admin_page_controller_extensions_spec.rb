# require File.dirname(__FILE__) + '/../spec_helper'
require 'spec_helper'

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
      response.should be_success
      response.should render_template("index")
    end
    
    %w(list).each do |view|
      it "should display the #{view} view" do
        get :index, :view => view
        assigns[:pages].should_not be_blank
        response.should be_success
        response.should render_template('page_list_view')
      end
    end
  end

  describe "paginatation" do
    it "should be paginated" do
      Admin::PagesController.paginated.should be_true
      controller.paginated?.should be_true
    end

    it "should have pagination defaults" do
      controller.pagination_parameters.should == {:page => 1, :per_page => 50}
      controller.will_paginate_options.should == {:param_name => :p}
    end

    it "should override defaults with pagination settings from config" do
      Radiant::Config['admin.pagination.per_page'] = 23
      controller.pagination_parameters.should == {:page => 1, :per_page => 23}
    end

    ## I need to redo these with mock classes
    # it "should override configuration with pagination settings from paginate_models" do
    #   Admin::PagesController.send :paginate_models, {:per_page => 5, :inner_window => 12}
    #   controller.pagination_parameters.should == {:page => 1, :per_page => 5}
    #   controller.will_paginate_options.should == {:inner_window => 12, :param_name => :p}
    # end
  end
  
  after :each do
    logout
  end
end