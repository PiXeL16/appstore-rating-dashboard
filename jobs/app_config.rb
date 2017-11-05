module AppConfig
  APP_CONFIG = JSON.parse(File.read('config/config.json'))
  DASHBOARD_TITLE = APP_CONFIG['dashboardTitle']
  APP_IDS = APP_CONFIG['app_ids']
end
