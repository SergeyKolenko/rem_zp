module CapybaraHelper
  # @example
  #   select2 "Item", from: "select_id"
  #   select2 /^Item/, from: "select_id"
  #
  # @note Works with Select2 version 3.4.1.

  # def select2(text, options)
  #   find("#s2id_#{options[:from]}").click
  #   all(".select2-result-label").find do |result|
  #     result.text =~ Regexp.new(text)
  #   end.click
  # end

  def select2_select(value, **options)
    first("#select2-#{options[:from]}-container").click
    find(".select2-results__option", text: value).click
  end

  RSpec.configure do |config|
    config.include CapybaraHelper, type: :feature
  end
end