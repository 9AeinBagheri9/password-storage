# frozen_string_literal: true

require './user'

u = User.new('anes', 'securepass')

puts 'Your user, with an encrypted password'
puts u.inspect

puts 'Logging in with wrong password: '
puts u.login('wrongpass')

puts 'Logging in with correct password: '
puts u.login('securepass')
