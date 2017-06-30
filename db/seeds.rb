I18n.with_locale(:ru) do
  Region.transaction do
    regions = {
        crimea:          'АР Крым',
        vinnytsya:       'Винницкая',
        volyn:           'Волынская',
        dnipro:          'Днепровская',
        donetsk:         'Донецкая',
        zhytomyr:        'Житомирская',
        zakarpattia:     'Закарпатская',
        zaporozhye:      'Запорожская',
        ivano_frankivsk: 'Ивано-Франковская',
        kiev:            'Киевская',
        kropivnicky:     'Кропивницкий',
        luhansk:         'Луганская',
        lviv:            'Львовская',
        mykolayiv:       'Николаевская',
        odessa:          'Одесская',
        poltava:         'Полтавская',
        rovno:           'Ровненская',
        sumy:            'Сумская',
        ternopil:        'Тернопольская',
        kharkiv:         'Харьковская',
        kherson:         'Херсонская',
        khmelnitskiy:    'Хмельницкая',
        cherkasy:        'Черкасская',
        chernihiv:       'Черниговская',
        chernivtsi:      'Черновицкая'
    }
    regions.each do |key, value|
      r = Region.find_or_create_by(code: key)
      r.update(name: value)
    end

    zp_cities = { zaporozhye: 'Запорожье'}
    zp_region = Region.find_by(code: 'zaporozhye')
    zp_cities.each do |code, name|
      city = City.find_or_create_by(code: code, region_id: zp_region.id)
      city.update name: name
    end

    zp_city =  City.find_by(code: 'zaporozhye')
    zp_districts = {
        aleksandrovsky: 'Александровский',
        zavodsky:       'Заводской',
        kommunarsky:    'Коммунарский',
        dneprovsky:     'Днепровский',
        voznesenovsky:  'Вознесеновский',
        khortytsky:     'Хортицкий',
        shevchenkovsky: 'Шевченковский'
    }
    zp_districts.each do |code, name|
      District.find_or_create_by(code: code, city_id: zp_city).update(name: name)
    end
  end

  Category.transaction do
    categories = {
        flat:     'Квартира',
        house:    'Дом',
        garage:   'Гараж',
        dacha:    'Дача',
        area:     'Участок',
        office:   'Офис',
        business: 'Бизнес'
    }
    categories.each do |code, name|
      Category.find_or_create_by(code: code, weight: 1).update(name: name)
    end
  end

  Option.transaction do
    option = Option.create code: 'total_area', name: 'Общая площадь', unit: 'м<sup>2</sup>'
    option.categories << Category.find_by_code('flat')
    option.categories << Category.find_by_code('house')
    option.categories << Category.find_by_code('dacha')
  end


  Role.transaction do
    Role::NAMES.each { |rn| Role.find_or_create_by name: rn }
  end

  Type.transaction do
    types = {
        sale: 'Продажа',
        buy: 'Покупка',
        rent: 'Аренда',
        swap: 'Обмен',
        lifetime_content: 'Пожизненное содержание',
        free: 'Даром',
        pladge: 'Залог'
    }
    types.each { |code, name| Type.find_or_create_by(code: code).update(name: name) }
  end
end


I18n.with_locale(:uk) do
  Region.transaction do
    regions = {
        crimea:          'АР Крим',
        vinnytsya:       'Вінницька',
        volyn:           'Волинська',
        dnipro:          'Дніпровська',
        donetsk:         'Донецька',
        zhytomyr:        'Житомирська',
        zakarpattia:     'Закарпатська',
        zaporozhye:      'Запорізька',
        ivano_frankivsk: 'Івано-Франківська',
        kiev:            'Київська',
        kropivnicky:     'Кропивницкая',
        luhansk:         'Луганська',
        lviv:            'Львівська',
        mykolayiv:       'Миколаївська',
        odessa:          'Одеська',
        poltava:         'Полтавська',
        rovno:           'Рівненська',
        sumy:            'Сумська',
        ternopil:        'Тернопільська',
        kharkiv:         'Харківська',
        kherson:         'Херсонська',
        khmelnitskiy:    'Хмельницька',
        cherkasy:        'Черкаська',
        chernihiv:       'Чернігівська',
        chernivtsi:      'Чернівецька'
    }
    regions.each do |key, value|
      r = Region.find_or_create_by(code: key)
      r.update(name: value)
    end

    zp_cities = { zaporozhye: 'Запоріжжя'}
    zp_region = Region.find_by(code: 'zaporozhye')
    zp_cities.each do |code, name|
      city = City.find_or_create_by(code: code, region_id: zp_region.id)
      city.update name: name
    end

    zp_city =  City.find_by(code: 'zaporozhye')
    zp_districts = {
        aleksandrovsky: 'Олександрівський',
        zavodsky:       'Заводський',
        kommunarsky:    'Комунарський',
        dneprovsky:     'Дніпровський',
        voznesenovsky:  'Вознесенівський',
        khortytsky:     'Хортицький',
        shevchenkovsky: 'Шевченківський'
    }
    zp_districts.each do |code, name|
      District.find_or_create_by(code: code, city_id: zp_city).update(name: name)
    end
  end

  Category.transaction do
    categories = {
        flat:     'Квартира',
        house:    'Будинок',
        garage:   'Гараж',
        dacha:    'Дача',
        area:     'Ділянка',
        office:   'Офіс',
        business: 'Бізнес'
    }
    categories.each do |code, name|
      Category.find_or_create_by(code: code, weight: 1).update(name: name)
    end
  end

  Option.transaction do
    option = Option.create code: 'total_area', name: 'Загальна площа', unit: 'м<sup>2</sup>'
    option.categories << Category.find_by_code('flat')
    option.categories << Category.find_by_code('house')
    option.categories << Category.find_by_code('dacha')
  end


  Role.transaction do
    Role::NAMES.each { |rn| Role.find_or_create_by name: rn }
  end

  Type.transaction do
    types = {
        sale: 'Продаж',
        buy: 'Покупка',
        rent: 'Оренда',
        swap: 'Обмін',
        lifetime_content: 'Довічне утримання',
        free: 'Задарма',
        pladge: 'Застава'
    }
    types.each { |code, name| Type.find_or_create_by(code: code).update(name: name) }
  end
end


I18n.with_locale(:en) do
  Region.transaction do
    regions = {
        crimea:          'AR Crimea',
        vinnytsya:       'Vinnytsia',
        volyn:           'Volyn',
        dnipro:          'Dnipro',
        donetsk:         'Donetsk',
        zhytomyr:        'Zhytomyr',
        zakarpattia:     'Zakarpattia',
        zaporozhye:      'Zaporizhzhia',
        ivano_frankivsk: 'Ivano-Frankivsk',
        kiev:            'Kyiv',
        kropivnicky:     'Kropivnichy',
        luhansk:         'Luhansk',
        lviv:            'Lviv',
        mykolayiv:       'Mykolaiv',
        odessa:          'Odesa',
        poltava:         'Poltava',
        rovno:           'Rivne',
        sumy:            'Sumy',
        ternopil:        'Ternopil',
        kharkiv:         'Kharkiv',
        kherson:         'Kherson',
        khmelnitskiy:    'Khmelnytsk',
        cherkasy:        'Cherkasy',
        chernihiv:       'Chernihiv',
        chernivtsi:      'Chernivtsi'
    }
    regions.each do |key, value|
      r = Region.find_or_create_by(code: key)
      r.update(name: value)
    end

    zp_cities = { zaporozhye: 'Zaporizhzhia'}
    zp_region = Region.find_by(code: 'zaporozhye')
    zp_cities.each do |code, name|
      city = City.find_or_create_by(code: code, region_id: zp_region.id)
      city.update name: name
    end

    zp_city =  City.find_by(code: 'zaporozhye')
    zp_districts = {
        aleksandrovsky: 'Oleksandrivsky',
        zavodsky:       'Zavodsky',
        kommunarsky:    'Komunarsky',
        dneprovsky:     'Dniprovsky',
        voznesenovsky:  'Voznesenivsky',
        khortytsky:     'Khortytsky',
        shevchenkovsky: 'Shevchenkivsky'
    }
    zp_districts.each do |code, name|
      District.find_or_create_by(code: code, city_id: zp_city).update(name: name)
    end
  end

  Category.transaction do
    categories = {
        flat:     'Flat',
        house:    'House',
        garage:   'Garage',
        dacha:    'Cottage',
        area:     'Area',
        office:   'Office',
        business: 'Business'
    }
    categories.each do |code, name|
      Category.find_or_create_by(code: code, weight: 1).update(name: name)
    end
  end

  Option.transaction do
    option = Option.create code: 'total_area', name: 'Total area', unit: 'м<sup>2</sup>'
    option.categories << Category.find_by_code('flat')
    option.categories << Category.find_by_code('house')
    option.categories << Category.find_by_code('dacha')
  end


  Role.transaction do
    Role::NAMES.each { |rn| Role.find_or_create_by name: rn }
  end

  Type.transaction do
    types = {
        sale: 'Sale',
        buy: 'Buy',
        rent: 'Rent',
        swap: 'Exchange',
        lifetime_content: 'Life retention',
        free: 'Free',
        pladge: 'Pladge'
    }
    types.each { |code, name| Type.find_or_create_by(code: code).update(name: name) }
  end
end