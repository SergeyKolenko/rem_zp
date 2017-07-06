module BootstrapFlashHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?
      type = case type.to_sym
               when :notice then :success
               when :alert || :error then :danger
               else type.to_sym
             end
      next unless ALERT_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = { class: "alert fade in alert-#{type} #{tag_class} col-xs-12 col-sm-8 col-sm-offset-2" }.merge(options)
      close_button = content_tag(:button, raw('&times;'), type: 'button', class: 'close', data: { dismiss: 'alert' })

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg, tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join('\n').html_safe
  end
end