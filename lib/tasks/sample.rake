require "samples/spendy"

if Rails.env.development? || Rails.env.test?
  namespace :sample do
    desc "Load sample data"
    task load: :environment do
      Samples::Spendy.load_samples
    end
  end
end