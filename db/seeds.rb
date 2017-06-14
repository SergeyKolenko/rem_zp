Region.transaction do
  regions = ['АР Крым', 'Винницкая область', 'Волынская область', 'Днепропетровская область',
             'Донецкая область', 'Житомирская область', 'Закарпатская область',
             'Запорожская область', 'Ивано-Франковская область', 'Киевская область',
             'Кировоградская область', 'Луганская область', 'Львовская область',
             'Николаевская область', 'Одесская область', 'Полтавская область',
             'Ровненская область', 'Сумская область', 'Тернопольская область',
             'Харьковская область', 'Херсонская область', 'Хмельницкая область',
             'Черкасская область', 'Черниговская область', 'Черновицкая область']
  regions.each { |region| Region.find_or_create_by(name: region) }

  zp_cities = ['Запорожье']
  zp_region = Region.find_by(name: 'Запорожская область')
  zp_cities.each { |cities| City.find_or_create_by(name: cities, region_id: zp_region.id) }

  zp_city =  City.find_by(name: 'Запорожье')
  zp_districts = %w(Александровский Заводский Коммунарский Днепровский Вознесеновский Хортицкий Шевченковский)
  zp_districts.each { |district| District.find_or_create_by(name: district, city_id: zp_city) }
end

Category.transaction do
  categories = %w(Квартира Дом Гараж Дача Участок Офис Бизнес)
  categories.each { |category| Category.find_or_create_by(name: category, weight: 1) }
end

Option.transaction do
  option = Option.create name: 'Общая площадь', unit: 'м<sup>2</sup>'
  option.categories << Category.find_by_code('Квартира')
end


Role.transaction do
  Role::NAMES.each { |rn| Role.find_or_create_by name: rn }
end

User.transaction do
  super_admin = User.find_or_initialize_by email: 'admin@user.com', role: Role.super_admin
  if super_admin.new_record?
    super_admin.confirmed_at = Date.today
    super_admin.password = '12345689'
    super_admin.password_confirmation = '12345689'
    super_admin.first_name = 'Super'
    super_admin.last_name = 'Admin'
    super_admin.save!
  end
end


