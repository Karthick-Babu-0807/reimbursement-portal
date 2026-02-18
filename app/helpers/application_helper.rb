module ApplicationHelper
  def status_badge_class(status)
    case status
    when 'approved' then 'bg-success'
    when 'rejected' then 'bg-danger'
    else 'bg-warning text-dark'
    end
  end
end