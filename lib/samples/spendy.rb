require_relative "sample"

module Samples
  class Spendy
    def self.load_samples
      ::Samples::User.new.load
    end
  end
end