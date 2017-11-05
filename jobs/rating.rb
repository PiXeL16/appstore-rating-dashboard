
def get_app_info(app_id)
  url = "#{AppConfig::APP_CONFIG['iTunesAppInfoLookUpUrl']}?id=#{app_id}"

  response = RestClient.get(url)
  json_response = JSON.parse(response)

  app_info = json_response['results'][0]

  return app_info
end

SCHEDULER.every '20m', :first_in => 0 do
  AppConfig::APP_IDS.each do |app_id|
    send_event(app_id+'_rating', get_app_info(app_id))
  end
end
