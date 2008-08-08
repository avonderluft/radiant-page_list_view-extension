module PageListView::PageExtensions
  def parent_title
    parent.title if parent
  end
  
  def group_name
    group.name if group
  end
  
  def updated_by_name
    updated_by.name if updated_by
  end
  
  def status_name
    status.name if status
  end
end