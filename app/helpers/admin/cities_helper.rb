module Admin::CitiesHelper

  def cities_for_select
    Rails.cache.fetch("admin_select_cities_#{I18n.locale}") do
      City.all.collect {|city| [city.name, city.id]}
    end
  end
end
