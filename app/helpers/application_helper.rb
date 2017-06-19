module ApplicationHelper

  def meta_title
    @meta_title || 'Недвижимость в Украине'
  end

  def meta_keywords
    @meta_keywords || 'Покупка, продажа, аренда, жилье, склад, квартира, комната, дача, гараж'
  end

  def meta_description
    @meta_description || 'Покупка, продажа, аренда жилья в Украине'
  end

  def all_categories
    Rails.cache.fetch("all_categories_#{I18n.locale}", expired_at: 24.hours) do
      Categories.all
    end
  end

end
