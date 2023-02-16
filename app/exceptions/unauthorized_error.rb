class UnauthorizedError < BaseError
  def initialize
    super(
      title: "Unauthorized",
      status: 401,
      detail: message || "You need to login to authorize this request.",
      source: { pointer: "/request/headers/authorization" }
    )
  end
end