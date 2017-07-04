module Admin::CitiesHelper

  def available_regions
    Region.all.collect {|region| [region.name, region.id]}
  end
end
