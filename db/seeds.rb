User.create!(name: '主催者',
  email: 'syusaisya@example.com',
  password: 'password',
  password_confirmation: 'password',
  client: true,
  confirmed_at: Time.now
  )

User.create!(name: 'お客様',
  email: 'okyakusama@example.com',
  password: 'password',
  password_confirmation: 'password',
  client: false,
  confirmed_at: Time.now
  )

20.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password,
                client: true
                )
end



20.times do |n|
  event_name = "イベント#{n + 1}"
  company_name = "劇団#{n + 1}"
  place = "劇場#{n + 1}"
  period = DateTime.now
  period_end = DateTime.now
  price = "2000"
  direction = Faker::Games::Pokemon.name
  status = rand(0..2)
  remarks  = "特になし"
  user_id = User.last.id
  Event.create!(event_name: event_name,
               company_name: company_name,
               place: place,
               period: period,
               period_end: period_end,
               price: price,
               direction: direction, 
               status: status,
               remarks: remarks,
               user_id:  user_id
               )
end

20.times do |n|
  Reservation.create!(
    date: Date.today.since(1.weeks),
    number_of_ticket: 2,
    ticket_type: 0,
    user_id: User.first.id + n,
    event_id: Event.first.id + n
  )
end
