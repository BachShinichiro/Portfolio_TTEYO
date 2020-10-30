User.create!(name: '主催者',
  email: 'kitchen.number@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  client: true
  )

User.create!(name: 'お客様',
  email: 'kitchen.number01@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  client: false
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

10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password,
                client: false
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
  date = Faker::Date.between(from: '2020-09-28', to: '2020-10-15')
  number_of_ticket = rand(0..5)
  ticket_type = rand(0..1)
  user_id = User.last.id,
  event_id = Event.last.id
  Reservation.create!(date: date,
               number_of_ticket: number_of_ticket,
               ticket_type: ticket_type,
               user_id:  user_id,
               event_id: event_id
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

20.times do |n|
  content = "質問#{n + 1}"
  Comment.create!(content: "content",
                  event_id: Event.first.id + n
  )
end