module WelcomeHelper
  def my_calendar(month, year)
    prev_month = link_to "Previous", welcome_index_path(:month => month.to_i - 1, :year => 2012)
    next_month = link_to "Next", welcome_index_path(:month => month.to_i + 1, :year => 2012)
    str = "<div id='cal'>"
    str << "<table>"
    str << "<tr>"
    str << "<td>#{prev_month}</td>"
    str << "<td colspan=5>October</td>"
    str << "<td>#{next_month}</td></tr>"
    str << "<tr>"
    str << "<td> &nbsp; </td>"
    6.times do |day|
      str << "<td>#{day +1}</td>"
    end
    str << "</tr>"
    str << "</table>"
    str << "</div>"
    str << "<br/> month: #{month}<br/>year: #{year}"
    return str.html_safe
  end
end
