module BootstrapFlashHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?
      type = normalize_type(type.to_sym)
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg, tag_options(type, options))
        flash_messages << text if msg
      end
    end
    flash_messages.join('\n').html_safe
  end

  private
  def normalize_type(type)
    case type
      when :notice then :success
      when :alert || :error then :danger
      else type
    end
  end

  def close_button
    content_tag(:button, raw('&times;'), type: 'button', class: 'close', data: { dismiss: 'alert' })
  end

  def tag_options(type, options)
    tag_class = options.extract!(:class)[:class]
    { class: "alert fade in alert-#{type} #{tag_class} col-xs-12 col-sm-8 col-sm-offset-2" }.merge(options)
  end
end