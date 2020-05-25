# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# gives us a clean slate, remove all entries in table
# start off by removing all stale data
Location.destroy_all
User.destroy_all
Squeak.destroy_all
Like.destroy_all

# locations
# why use create! here? seeds would fail silently without the !.
  # create! fails loudly, will raise error and stop execution entirely
ldn = Location.create!(name: 'London, England')
pa = Location.create!(name: 'Pennsylvania, USA')
va = Location.create!(name: 'Virginia, USA')
ma = Location.create!(name: 'Massachusetts, USA')
ca = Location.create!(name: 'California, USA')
tn = Location.create!(name: 'Tennessee, USA')
cdmx = Location.create!(name: 'Mexico City, Mexico')

# users
lovelace = User.create!(username: "Ada Lovelace", birth_year: 1815, location_id: ldn.id, password: 'hunter2')
hopper = User.create!(username: "Grace Hopper", birth_year: 1906, location_id: pa.id, password: 'hunter2')
vaughan = User.create!(username: "Dorothy Vaughan", birth_year: 1910, location_id: va.id, password: 'hunter2')
turing = User.create!(username: "Alan Turing", birth_year: 1912, location_id: ldn.id, password: 'hunter2')
booth = User.create!(username: "Kathleen Booth", birth_year: 1922, location_id: ldn.id, password: 'hunter2')
landin = User.create!(username: "Peter Landin", birth_year: 1930, location_id: ldn.id, password: 'hunter2')
hamilton = User.create!(username: "Margaret Hamilton", birth_year: 1936, location_id: ma.id, password: 'hunter2')
stallman = User.create!(username: "Richard Stallman", birth_year: 1953, location_id: ma.id, password: 'hunter2')
horton = User.create!(username: "Mary Ann Horton", birth_year: 1955, location_id: ca.id, password: 'hunter2')
dean = User.create!(username: "Mark Dean", birth_year: 1957, location_id: tn.id, password: 'hunter2')
lam = User.create!(username: "Monica Lam", birth_year: 1958, location_id: ca.id, password: 'hunter2')
de_icaza = User.create!(username: "Miguel de Icaza", birth_year: 1972, location_id: cdmx.id, password: 'hunter2')

# squeaks
s0 = Squeak.create!(
  body: "who is screaming \"log off\" at my house. show yourself, coward. i will never log off",
  author_id: lovelace.id
)
s1 = Squeak.create!(
  body: "hear this trolls: ive been secretly respecting the flag in the privacy of my garage for 12 hrs a day , maxing out its power to insane levels",
  author_id: hopper.id
)
s2 = Squeak.create!(
  body: "every morning I ask the dog \“the usual?\” before pouring her food into her bowl & neither of us thinks it’s funny but that’s showbiz baby",
  author_id: vaughan.id
)
s3 = Squeak.create!(
  body: "How dare you drive the speed limit when I’m late to something due to my own poor time management skills",
  author_id: turing.id
)
s4 = Squeak.create!(
  body: "it is with a heavy heart that i must announce that the celebs are at it again",
  author_id: booth.id
)
s5 = Squeak.create!(
  body: "Food $200\nData $150\nRent $800\nCandles $3,600\nUtility $150\nsomeone who is good at the economy please help me budget this. my family is dying",
  author_id: landin.id
)
s6 = Squeak.create!(
  body: "passed a dog wearing a vest that said \“careful! i’m still learning how to be around people\” and experienced a borderline-spiritual \“same\”",
  author_id: hamilton.id
)
s7 = Squeak.create!(
  body: "hi, grandma? can u come pick me up from my rap battle? it's over. no, i lost. he saw u drop me off & did a pretty devastating rhyme about it",
  author_id: stallman.id
)
s8 = Squeak.create!(
  body: "is there anything more capitalist than a peanut with a top hat, cane, and monocle selling you other peanuts to eat",
  author_id: horton.id
)
s9 = Squeak.create!(
  body: "[burglar gently waking me] you live like this?",
  author_id: dean.id
)
s10 = Squeak.create!(
  body: "How Can Mirrors Be Real If Our Eyes Aren't Real",
  author_id: lam.id
)
s11 = Squeak.create!(
  body: "awfully bold of you to fly the Good Year blimp on a year that has been extremely bad thus far",
  author_id: de_icaza.id
)

# likes
l0 = Like.create!(squeak_id: s0.id, user_id: hopper.id)
l1 = Like.create!(squeak_id: s0.id, user_id: vaughan.id)
l2 = Like.create!(squeak_id: s0.id, user_id: turing.id)
l3 = Like.create!(squeak_id: s0.id, user_id: stallman.id)
l4 = Like.create!(squeak_id: s0.id, user_id: horton.id)
l5 = Like.create!(squeak_id: s0.id, user_id: dean.id)
l6 = Like.create!(squeak_id: s0.id, user_id: lam.id)

l7 = Like.create!(squeak_id: s2.id, user_id: hamilton.id)
l8 = Like.create!(squeak_id: s2.id, user_id: de_icaza.id)

l9 = Like.create!(squeak_id: s3.id, user_id: booth.id)
l10 = Like.create!(squeak_id: s3.id, user_id: horton.id)
l11 = Like.create!(squeak_id: s3.id, user_id: dean.id)
l12 = Like.create!(squeak_id: s3.id, user_id: lam.id)

l13 = Like.create!(squeak_id: s5.id, user_id: lovelace.id)
l14 = Like.create!(squeak_id: s5.id, user_id: hopper.id)
l15 = Like.create!(squeak_id: s5.id, user_id: turing.id)

l15 = Like.create!(squeak_id: s6.id, user_id: landin.id)
l16 = Like.create!(squeak_id: s6.id, user_id: stallman.id)
l17 = Like.create!(squeak_id: s6.id, user_id: dean.id)
l18 = Like.create!(squeak_id: s6.id, user_id: lam.id)

l19 = Like.create!(squeak_id: s9.id, user_id: horton.id)
l20 = Like.create!(squeak_id: s9.id, user_id: dean.id)
l21 = Like.create!(squeak_id: s9.id, user_id: de_icaza.id)