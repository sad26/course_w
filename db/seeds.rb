
if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

# Авто:
if (a1 = Automobile.find_by_state_number('ах14797')).nil?
  a1 = Automobile.create!(
    automobile_model: 'Nissan Almera', automobile_type: 'Эконом',
    state_number: 'ах14797', color: 'Чёрный', release: '2004'
  )
end
if (a2 = Automobile.find_by_state_number('аа49597')).nil?
  a2 = Automobile.create!(
    automobile_model: 'Nissan Almera', automobile_type: 'Эконом',
    state_number: 'аа49597', color: 'Чёрный', release: '2005'
  )
end
if (a3 = Automobile.find_by_state_number('ат45597')).nil?
  a3 = Automobile.create!(
    automobile_model: 'Peugeot 308', automobile_type: 'Бизнес',
    state_number: 'ат45597', color: 'Белый', release: '2016'
  )
end
if (a4 = Automobile.find_by_state_number('рт10597')).nil?
  a4 = Automobile.create!(
    automobile_model: 'Peugeot 308', automobile_type: 'Бизнес',
    state_number: 'рт10597', color: 'Белый', release: '2016'
  )
end
if (a5 = Automobile.find_by_state_number('тт78277')).nil?
  a5 = Automobile.create!(
    automobile_model: 'Toyota Camry', automobile_type: 'Бизнес',
    state_number: 'тт78277', color: 'Красный', release: '2017'
  )
end

# Водители:
if (d1 = Driver.find_by_passport('4546456889')).nil?
  d1 = Driver.create!(
    last_name: 'Иванов', first_name: 'Василий', patronymic: 'Петрович',
    date_of_birth: '01.05.1970', itn: '778965000512', passport: '4546456889',
    automobile: a1
  )
end
if (d2 = Driver.find_by_passport('4332756880')).nil?
  d2 = Driver.create!(
    last_name: 'Ефремов', first_name: 'Захар', patronymic: 'Александрович',
    date_of_birth: '07.12.1985', itn: '778065000273', passport: '4332756880',
    automobile: a2
  )
end
if (d3 = Driver.find_by_passport('4955632789')).nil?
  d3 = Driver.create!(
    last_name: 'Фёдорова', first_name: 'Маргарита', patronymic: 'Семёновна',
    date_of_birth: '31.12.1989', itn: '778065004008', passport: '4955632789',
    automobile: a3
  )
end
if (d3 = Driver.find_by_passport('4975702719')).nil?
  d3 = Driver.create!(
    last_name: 'Козлов', first_name: 'Алексей', patronymic: 'Германович',
    date_of_birth: '04.12.1969', itn: '778065074852', passport: '4975702719'
  )
end
if (d4 = Driver.find_by_passport('4975702223')).nil?
  d4 = Driver.create!(
    last_name: 'Орлов', first_name: 'Кузьма', patronymic: 'Владимирович',
    date_of_birth: '01.01.1955', itn: '771762084851', passport: '4975702223',
    automobile: a4
  )
end
if (d5 = Driver.find_by_passport('4995102753')).nil?
  d5 = Driver.create!(
    last_name: 'Гордеев', first_name: 'Олег', patronymic: 'Алексеевич',
    date_of_birth: '12.05.1972', itn: '712065859833', passport: '4995102753',
    automobile: a5
  )
end

# Тарифы:
if (t1 = Tariff.find_by_name('T1')).nil?
  t1 = Tariff.create!(
    name: 'Т1', time_of_day: 'День', range: 'в пределах МКАД', price_per_kilometer: '50'
  )
end
if (t2 = Tariff.find_by_name('T2')).nil?
  t2 = Tariff.create!(
    name: 'Т2', time_of_day: 'День', range: 'за МКАД', price_per_kilometer: '70'
  )
end
if (t3 = Tariff.find_by_name('T3')).nil?
  t3 = Tariff.create!(
    name: 'Т3', time_of_day: 'День', range: 'Подмосковье', price_per_kilometer: '100'
  )
end
if (t4 = Tariff.find_by_name('T4')).nil?
  t4 = Tariff.create!(
    name: 'Т4', time_of_day: 'Ночь', range: 'в пределах МКАД', price_per_kilometer: '40'
  )
end

# Заказы:
if (o1 = Order.find_by_departure_address('Москва, ул. Бол. Якиманка, 55')).nil?
  o1 = Order.create!(
    time_of_travel: '30.04.2018 11:00', departure_address: 'Москва, ул. Бол. Якиманка, 55',
    arrival_address: 'Москва, м. Парк Победы', number_of_passengers: '2',
    length_of_route: '5', automobile: a1, tariff: t1
  )
end
if (o2 = Order.find_by_departure_address('Москва, ул. Академика Королёва, 1')).nil?
  o2 = Order.create!(
    time_of_travel: '01.05.2018 15:45', departure_address: 'Москва, ул. Академика Королёва, 1',
    arrival_address: 'Москва, Ярославское ш., 186к1', number_of_passengers: '1',
    length_of_route: '10', automobile: a2, tariff: t2
  )
end
if (o3 = Order.find_by_departure_address('Москва, Спортивный пр-д, 15/2')).nil?
  o3 = Order.create!(
    time_of_travel: '05.05.2018 16:45', departure_address: 'Москва, Спортивный пр-д, 15/2',
    arrival_address: 'Серпухов, ул. Советская, 10', number_of_passengers: '1',
    length_of_route: '120', automobile: a3, tariff: t3
  )
end
if (o4 = Order.find_by_departure_address('Москва, ул. Вешних Вод, 1')).nil?
  o4 = Order.create!(
    time_of_travel: '12.05.2018 11:10', departure_address: 'Москва, ул. Вешних Вод, 1',
    arrival_address: 'Москва, ул. Барклая, 14', number_of_passengers: '3',
    length_of_route: '24', automobile: a3, tariff: t1
  )
end
if (o5 = Order.find_by_departure_address('Москва, м. Юго-западная')).nil?
  o4 = Order.create!(
    time_of_travel: '13.05.2018 23:40', departure_address: 'Москва, м. Юго-западная',
    arrival_address: 'Москва, ул. Кантемировская, 29к2', number_of_passengers: '1',
    length_of_route: '18', automobile: a5, tariff: t4
  )
end
