Refinery::Core.configure do |config|
  # Register extra javascript for backend
  config.register_javascript  "refinery/race_registrations/admin/race_registrations.js"

  #Register extra stylesheet for backend (optional options)
  config.register_stylesheet "refinery/race_registrations/admin/race_registrations.css"
end

