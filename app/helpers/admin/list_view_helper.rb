module Admin::ListViewHelper

  def link_or_span_unless_current(text, url, options)
    if current_page?(url)
      content_tag(:span, text)
    else
      link_to text, url, options
    end
  end

  def list_display_attributes
    @list_display_attributes ||= returning %w{title parent_title slug status_name updated_by_name updated_at} do |atts|
      # atts << "group_name" if defined?(PageGroupPermissionsExtension)
    end
  end

  def nicify(value)
    case value
    when String; value.humanize
    when Time; value.strftime(fmt="%m/%d/%Y at %I:%M %p")
    end
  end

  def attribute_header_class(att)
    @saved_order ||= if cookies['table_kit_order']
      ActiveSupport::JSON.decode(CGI.unescape(cookies['table_kit_order']))
    else
      []
    end
    returning %W{page-#{att}} do |classes|
      classes << 'date-us-civil' if att =~ /(updated|created)_(at|on)/
      if @saved_order[0] && @list_display_attributes.index(att) == @saved_order[0]
        direction = @saved_order[1].to_i < 0 ? "desc" : "asc"
        classes << "sortfirst#{direction}"
      end
    end.join(" ")
  end

  def attribute_header_id(att)
    "#{att}-header"
  end
  
  def attribute_cell_class(att)
    returning %w{page} do |classes|
      # classes << 'date-short' if att =~ /(updated|created)_(at|on)/
    end.join(" ")
  end
end