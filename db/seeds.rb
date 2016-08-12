require 'faker'

# Create main user

user = User.create!(
  email: 'paul@gmail.com',
  password: 'paul'
)
user = User.create!(
  email: 'flora@hotmail.com',
  password: 'flora'
)
user = User.create!(
  email: 'bettyrubble@bedrock.com',
  password: 'betty'
)
user = User.create!(
  email: 'fredflintstone@hannabarbera.org',
  password: 'fred'
)
