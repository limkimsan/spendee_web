module Samples
  class User
    def load
      users = [
        { name: "admin", email: "admin@spendy.com", role: :primary_admin }
      ]

      users.each do |user|
        u = ::User.new(user.merge({password: "123456"}))
        u.save
      end
    end
  end
end