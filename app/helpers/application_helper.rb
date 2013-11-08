module ApplicationHelper
  def things_to_do (links)
    # key = URL, value = body

    str = "<ul>"
    links.each do |url, body|
      str << "\t<li>" << link_to(body, url) << "</li>\n"
    end
    str << "</ul>"    
    return str.html_safe
  end

  def show_params
    str = "<div style='border: 1px red solid;margin: 10px;padding: 10px;'>"
    str << "\t<heading>Params</heading><br/>"
    params.each do |key, value|
      str << "#{key}: #{value}<br/>" if key != "authenticity_token" && key != "utf8"
    end
    str << "</div>" 
    return str.html_safe
  end

end
