regions = ['Autonomous Republic of Crimea', 'Cherkasy', 'Chernihiv', 'Chernivtsi',
           'Dnipropetrovsk', 'Donetsk', 'Ivano-Frankivsk', 'Kharkiv', 'Kherson',
           'Khmelnytskyi', 'Kiev', 'Kirovohrad', 'Luhansk', 'Lviv', 'Mykolaiv',
           'Odessa', 'Poltava', 'Rivne', 'Sumy', 'Ternopil', 'Vinnytsia',
           'Volyn', 'Zakarpattia', 'Zaporizhia', 'Zhytomyr']
regions.each { |region| Region.find_or_create_by(name: region) }




