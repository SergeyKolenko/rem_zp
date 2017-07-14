module LocaleValidations
  extend ActiveSupport::Concern

  def has_translate?(locale)
    translations.map(&:locale).include?(locale.to_sym)
  end
end