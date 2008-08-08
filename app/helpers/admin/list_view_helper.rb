module Admin::ListViewHelper
  
  def list_display_attributes
    atts = ["title", "parent_title", "updated_by_name", "updated_at", "status_name"]
    atts << "group_name" unless Dir[RADIANT_ROOT + '/vendor/extensions/page_group_permissions'].nil?
    atts
  end  
  
  def nicify(value)
    case value
    when String; value.humanize 
    when Time; value.to_s :short
    end
  end  

end