module ApplicationHelper
  def full_title(page_title = '')
    base_title = "#{current_title} Events - Singles For Christ"
    return page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def current_title
    return "Musicionaries"
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

  def current_timestamp
    return Time.new.strftime('%d%m%y-%k%M%S')
  end

  def current_base_url
    return request.base_url
  end
end
