module PageHelper
  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  def days_in_month(month, year = now.year)

    if month == 2 && ::Date.gregorian_leap?(year)
      29
    else
      COMMON_YEAR_DAYS_IN_MONTH[month]
    end
  end

  def my_calendar(month, year)

    if month.nil? 
      now_time = Time.now
      month = now_time.month
      year = now_time.year
    else
      month = month.to_i
      year = year.to_i
    end

    if month == 12
      month_plus = 1
      year_plus = year + 1
      month_minus = month - 1
      year_minus = year
    elsif month == 1
      month_plus = month +1
      year_plus = year
      month_minus = 12
      year_minus =  year - 1
    else
      month_plus = month + 1
      year_plus = year
      month_minus = month - 1
      year_minus =  year
    end
    
    first_month_day_value = Time.local(year, month, 1).wday
    month_days = days_in_month(month, year)
    day_of_week = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]
    first_month_day = Time.local(year, month).strftime("%A")
    prev_month = link_to "Previous", page_calendar_path(:month => month_minus, :year => year_minus)
    next_month = link_to "Next", page_calendar_path(:month => month_plus, :year => year_plus)
    
    str = "<div id='cal'><br/>"
    str << "<table>"
    str << "<tr>"
    str << "<td>#{prev_month}</td>"
    str << "<td colspan=5>#{Time.local(year, month).strftime("%B")} #{year}</td>"
    str << "<td>#{next_month}</td></tr>\n"
    str << "<tr>"
    day_of_week.each do |day|
      str << "<td>#{day}</td>"
    end
    str << "</tr>\n"

      current_day = 0
      if first_month_day_value != 0
        str << "<tr>"
        for i in 0...first_month_day_value
          str << "<td>&nbsp;</td>"
          current_day += 1
        end
      end

      for day in 1..month_days
        if current_day == 0
          str << "<tr>"
        end
        
        str << "<td>#{day}</td>"

        if current_day == 6
          str << "</tr>\n"
          current_day = 0
        elsif day == month_days
          for i in current_day...6
            str << "<td>&nbsp;</td>"
          end
          str << "</tr>"
        else
          current_day += 1
        end
      end

    str << "</table><br/>"
    str << "</div>"
    return str.html_safe
  end
end
