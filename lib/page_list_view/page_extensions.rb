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
  
  def content_owner
    co_part = parts.select{ |pp| pp.name=="content_owner"}
    co_part.empty? ? "" : co_part[0].content
  end
end