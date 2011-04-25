ActionController::Routing::Routes.draw do |map|
  map.pages_view 'admin/pages/list', :controller => 'admin/pages', :action => 'index', :view => 'list'
end