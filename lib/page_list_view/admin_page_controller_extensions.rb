module PageListView::AdminPageControllerExtensions
  def self.included(base)
    base.class_eval { alias_method_chain :index, :page_list_view }
  end
  
  def index_with_page_list_view
    if params[:view] == 'list'
      @pages = Page.find(:all, :order => params[:sort]||'title')
      @template_name = 'index'
      render :action => "page_list_view"
    else
      index_without_page_list_view
    end  
  end
  
end