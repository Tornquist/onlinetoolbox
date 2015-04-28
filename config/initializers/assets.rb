# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( jquery.dataTables.css )
Rails.application.config.assets.precompile += %w( jquery.jsonview.css )

Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'flash')

%w( comments contact_types ensembles favorite_instruments fields gds gigs instruments
    rank_members recruit_statuses scores seasons section_notes sections static students
    announcements favorites helps users/registrations users/sessions accountability).each do |controller|
#  Rails.application.config.assets.precompile += ["#{controller}.css"]
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end
