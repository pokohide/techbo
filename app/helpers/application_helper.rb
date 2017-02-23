module ApplicationHelper
  def flash_message(flash: flash, notice: notice, alert: alert)
    msg = flash.map do |type, message|
      content_tag :div, class: "ui #{type} message" do
        concat content_tag :i, '', class: 'close icon'
        concat content_tag :p, message
      end
    end
    safe_join(msg)
  end

  def lazy_image_tag(source, options = {})
    options['data-original'] = asset_path(source)
    if options[:class].blank?
      options[:class] = 'lazy'
    else
      options[:class] = "lazy #{options[:class]}"
    end
    image_tag('loader.gif', options)
  end
end
