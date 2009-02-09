# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class PageListViewExtension < Radiant::Extension
  version "1.2"
  description "Enables viewing site pages in a list view sortable by attibute, paginated or full; Radiant 0.7.0 compatible"
  url "http://github.com/avonderluft/radiant-page_list_view-extension"
  
  # define_routes do |map|
  #   map.connect 'admin/page_list_view/:action', :controller => 'admin/page_list_view'
  # end
  
  def activate
    Page.send :include, PageListView::PageExtensions
    Admin::PagesController.send :include, PageListView::AdminPageControllerExtensions
    Admin::PagesController.send :helper, Admin::ListViewHelper
    admin.pages.index.add :top, "page_view_toggle"
  end
  
  def deactivate
  end
  
end