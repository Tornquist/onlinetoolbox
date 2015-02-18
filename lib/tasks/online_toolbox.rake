namespace :online_toolbox do
  desc "Cleares Expired Session Data"
  task clear_expired_sessions: :environment do
    sql = 'DELETE FROM sessions WHERE updated_at < DATE_SUB(NOW(), INTERVAL 1 DAY);'
    ActiveRecord::Base.connection.execute(sql)
  end

end
