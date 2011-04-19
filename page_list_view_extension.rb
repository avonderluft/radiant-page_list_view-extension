# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'

class PageListViewExtension < Radiant::Extension
  version "0.9.1"
  description "Enables viewing site pages in a list sortable by attibute"
  url "https://github.com/avonderluft/radiant-page_list_view-extension"
  
  def activate
    tab "Content" do
      add_item "Page List", '/admin/pages/list', :after => "Pages"
    end
    Page.send :include, PageListView::PageExtensions
    Admin::PagesController.send :include, PageListView::AdminPageControllerExtensions
    Admin::PagesController.send :helper, Admin::ListViewHelper
  end

end