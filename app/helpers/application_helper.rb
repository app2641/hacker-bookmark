module ApplicationHelper
  def pretty_date date
    date = DateTime.parse(date)
    diff = (DateTime.now.to_i - date.to_i)
    date_diff = (diff / 86400).floor

    if date_diff == 0
      if diff < 60
        'just now'
      elsif diff < 120
        '1 minute ago'
      elsif diff < 3600
        "#{(diff / 60).floor} minutes ago"
      elsif diff < 7200
        '1 hour ago'
      elsif diff < 86400
        "#{(diff / 3600).floor} hours ago"
      end
    elsif date_diff == 1
      'yesterday'
    elsif date_diff < 7
      "#{date_diff} days ago"
    elsif date_diff == 7
      "1 week ago"
    elsif date_diff < 31
      "#{(date_diff / 7).floor} weeks ago"
    end
  end
end
