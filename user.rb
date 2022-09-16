# frozen_string_literal: true

require './encryptor'

# The user that is being used in our application
class User
  @@newest_id = 0

  def initialize(name, pass)
    @id = @@newest_id
    @@newest_id += 1
    @name = name
    encrypted = encrypt(pass)
    @pass = encrypted[:result]
    @salt = encrypted[:salt]
    puts @pass
  end

  def login(input)
    compare(input, @pass, @salt)
  end
end
