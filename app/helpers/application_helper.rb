module ApplicationHelper

  def meta_title
    @meta_title || t('application.meta_info.stub_title')
  end

  def meta_keywords
    @meta_keywords || t('application.meta_info.stub_keywords')
  end

  def meta_description
    @meta_description || t('application.meta_info.stub_description')
  end

  def all_categories
    Rails.cache.fetch("head_all_categories_#{I18n.locale}") do
      Category.all
    end
  end

  def all_types
    Rails.cache.fetch("head_all_types_#{I18n.locale}") do
      Type.all
    end
  end

  def all_regions
    Rails.cache.fetch("admin_all_regions_#{I18n.locale}") do
      Region.all
    end
  end

  def all_cities
    
    Rails.cache.fetch("admin_all_cities_#{I18n.locale}") do
      City.all
    end
  end

  def all_cities1
    Rails.cache.fetch("admin_all_cities_#{I18n.locale}") do
      City.all
    end
  end

  def all_cities2
    Rails.cache.fetch("admin_all_cities_#{I18n.locale}") do
      City.all
    end
  end
end
