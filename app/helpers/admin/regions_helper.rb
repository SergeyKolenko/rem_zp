module Admin::RegionsHelper

  def regions_for_select
    Rails.cache.fetch("admin_select_regions_#{I18n.locale}") do
      Region.all.collect {|region| [region.name, region.id]}
    end
  end
end
