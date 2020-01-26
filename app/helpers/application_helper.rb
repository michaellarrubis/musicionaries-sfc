module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Musicionaries' Events - Singles For Christ"
    return page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def current_title
    return "Musicionaries Events"
  end

  def anchor_text(text)
    text = text.downcase
    if text.match(/\s/)
      return text.gsub!(/\ +/, '-')
    end

    return text
  end

  def toastr_flash_class(type)
    case type
    when "alert"
      "toastr.error"
    when "notice"
      "toastr.success"
    else
      "toastr.info"
    end
  end
end
