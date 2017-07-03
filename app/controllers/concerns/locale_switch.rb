module LocaleSwitch
  extend ActiveSupport::Concern

  def set_locale
    if params[:locale].present? && %w(ru uk en).include?(params[:locale])
      current_user.update(locale: params[:locale]) if current_user
      I18n.locale = params[:locale]
      session[:current_locale] = params[:locale]
    elsif current_user
      I18n.locale = current_user.locale
      session[:current_locale] = current_user.locale
    else
      I18n.locale = session[:current_locale] || I18n.default_locale
    end
  end
end
