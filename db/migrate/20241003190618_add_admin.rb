class AddAdmin < ActiveRecord::Migration[6.1]
  def change
    # pass = SecureRandom.alphanumeric(10)
    pass = "kJlzpzqYzm"
    User.create(login: "admin", password: pass, password_confirmation: pass, admin: true)
  end
end
