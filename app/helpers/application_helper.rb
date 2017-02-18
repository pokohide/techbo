module ApplicationHelper
  def flash_message(flash: flash, notice: notice, alert: alert)
    msg = flash.map do |type, message|
      content_tag :div, class: "notification is-#{type}" do
        concat content_tag :button, '', class: 'delete'
        concat message
      end
    end
    safe_join(msg)
  end
end
