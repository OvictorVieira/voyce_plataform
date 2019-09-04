module ApplicationHelper

  STATUSES = {
    success: 'Sucesso!',
    danger: 'Erro!',
    warning: 'Atenção!',
  }

  def flash_message
    messages = ""
    [:success, :danger, :warning].each do |type|
      if flash[type]
        messages << "<div class=\"alert alert-#{type}\" role=\"alert\">
                       <strong>#{STATUSES[type]}</strong> #{flash[type]}
                     </div>"
      end
    end

    messages.html_safe
  end
end
