# frozen_string_literal: true

require 'digest'

PEPPER = 'mypepper'

# Encrypts our password
def encrypt(pass)
  salt = random_salt
  to_be_encrypted = "#{PEPPER}0#{salt}0#{pass}"
  result = Digest::SHA2.new(256).hexdigest(to_be_encrypted)
  { salt:, result: }
end

def compare(input, pass, salt)
  to_be_encrypted = "#{PEPPER}0#{salt}0#{input}"
  result = Digest::SHA2.new(256).hexdigest(to_be_encrypted)
  result == pass
end

private

# Creates a random Stirng with numbers and letters
def random_salt
  ('a'..'z').to_a.sample(8).join
end
