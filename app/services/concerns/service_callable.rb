module ServiceCallable
  extend ActiveSupport::Concern

  class_methods do
    def call(*args)
      obj = new(*args)
      obj.call

      obj
    end
  end
end