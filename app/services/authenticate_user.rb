class AuthenticateUser < BaseService
  attr_reader :user

  def initialize(attrs:)
    @attrs = attrs
  end

  def call
    find_user
    check_user_password

    self
  end

  private

  attr_reader :attrs

  def find_user
    @user = User.find_by(email: attrs[:email])
    puts @user

    raise UnauthorizedError unless @user
  end

  def check_user_password
    raise UnauthorizedError unless user.authenticate(attrs[:password])
  end
end