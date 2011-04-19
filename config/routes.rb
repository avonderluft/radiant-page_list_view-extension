ActionController::Routing::Routes.draw do |map|
  map.pages_view 'admin/pages/:view', :controller => 'admin/pages', :action => 'index'
end