require_relative '../models/reviews'

def get_app_reviews(app_id)
  url = "#{AppConfig::APP_CONFIG['iTunesCustomerReviewsUrl']}/id=#{app_id}/json"
  
  response = RestClient.get(url)
  json_response = JSON.parse(response)

  reviews = Models::Reviews.new(json_response)
  reviews.to_hash
end

SCHEDULER.every '20m', :first_in => 0 do
  AppConfig::APP_IDS.each do |app_id|
    send_event(app_id + '_reviews', get_app_reviews(app_id))
  end
end
