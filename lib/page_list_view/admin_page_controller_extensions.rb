module PageListView::AdminPageControllerExtensions
  def self.included(base)
    base.class_eval { 
      alias_method_chain :index, :page_list_view
      model_class Page
      paginate_models
    }
  end

  def index_with_page_list_view
    if params[:view] && params[:view] == 'list'
      render :action => "page_list_view" and return
    else
      index_without_page_list_view
    end
  end
end