## NOTE: adapted from
## - https://github.com/Selleo/pattern
## - https://medium.com/selleo/essential-rubyonrails-patterns-part-1-service-objects-1af9f9573ca1

class BaseService
  include ServiceCallable
  include ErrorRaisable

  def call
    raise NotImplementedError, 'Method #call must be defined.'
  end
end