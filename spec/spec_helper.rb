require 'rspec'
require 'webmock/rspec'
require 'uri'
require_relative '../models/review'
require_relative '../models/reviews'

def require_job path
  require File.expand_path '../../jobs/' + path, __FILE__
end

class SCHEDULER
  def self.every(ignoreme)
  end
end

module Builds
  BUILD_CONFIG = {
    "iTunesAppInfoLookUpUrl" => 'http://itunes.apple.com/lookup',
    "iTunesCustomerReviewsUrl" => 'http://itunes.apple.com/rss/customerreviews'
  }
end

RSpec.configure do |config|
  config.color = true
  config.order = 'random'
end
