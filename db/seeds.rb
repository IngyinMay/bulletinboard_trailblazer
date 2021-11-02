# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create!([
               {
                 name: 'Super User1',
                 email: 'superuser1@gmail.com',
                 password: 'superuser1@gmail.com1',
                 super_user_flag: true,
                 role: 1,
                 phone: '0911111111',
                 address: 'No 111. 11th Street Lanmadaw Township. Yangon.',
                 birthday: '2012-02-07'
               },
               {
                 name: 'User A',
                 email: 'user1@gmail.com',
                 password: 'user1@gmail.com1',
                 super_user_flag: false,
                 role: 1,
                 phone: '0711111111',
                 address: 'No 111. 11th Street Lanmadaw Township. Dump Text.',
                 birthday: '2000-02-07'
               },
               {
                 name: 'User B',
                 email: 'user2@gmail.com',
                 password: 'user2@gmail.com2',
                 super_user_flag: false,
                 role: 2,
                 phone: '07222222222',
                 address: 'No 111. 51st Street Botahtaung Township. Dump Text.',
                 birthday: '1999-02-07'
               },
               {
                 name: 'User C',
                 email: 'user3@gmail.com',
                 password: 'user3@gmail.com3',
                 super_user_flag: false,
                 role: 1,
                 phone: '07333333333',
                 address: 'No 111. 51st Street Botahtaung Dump Text. Dump Text.',
                 birthday: '1999-02-07'
               }
             ])

Post.destroy_all
Post.create!([
               {
                 title: 'First Post of Ruby',
                 description: 'Hello ruby. This is my first post. zzzzzzz Hello ruby. This is my first post. zzzzzzzHello ruby. This is my first post. zzzzzzzHello ruby. This is my first post. zzzzzzzHello ruby. This is my first post. zzzzzzzHello ruby. This is my first post. zzzzzzz',
                 public_flag: true,
                 created_by: 1
               },
               {
                 title: 'Second Post of Ruby',
                 description: 'Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. Dummy Text for post second post blah blah. ',
                 public_flag: false,
                 created_by: 1
               },
               {
                 title: 'Post of the day POTD blah',
                 description: 'Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. Dummy Text for post third post blah blah. ',
                 public_flag: true,
                 created_by: 2
               },
               {
                 title: 'Post post post ruby post',
                 description: 'Dummy Text for post forth post blah blah. Dummy Text for post forth post blah blah. Dummy Text for post forth post blah blah. Dummy Text for post forth post blah blah. Dummy Text for post forth post blah blah. dummy Text for post forth post blah blah. Dummy Text for post forth post blah blah. Dummy Text for post forth post blah blah. Dummy Text for post forth post blah blah. ',
                 public_flag: false,
                 created_by: 2
               },
               {
                 title: 'Post create from seeder',
                 description: 'Post create from seederPost create from seederPost create from seederPost create from seeder  Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah. Dummy Text for post  seeding post blah blah. Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah.  Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah. Dummy Text for post  seeding post blah blah. Dummy Text for post seeding post blah blah. ',
                 public_flag: true,
                 created_by: 3
               },
               {
                 title: 'Post create from seederPost create from seeder',
                 description: 'Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah.   Dummy Text for post seeding post blah blah. Dummy Text for post seeding post blah blah. Dummy Text for post  seeding post blah blah. Dummy Text for post seeding post blah blah. ',
                 public_flag: false,
                 created_by: 3
               }
             ])

p "Created #{User.count} users"
p "Created #{Post.count} posts"
