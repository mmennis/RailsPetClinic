begin
  GC::Profiler.enable   # for ruby 1.9.2
  NewRelic::Agent.after_fork(:force_reconnect => true) if defined? Unicorn
rescue => e
  Rails.logger.warn "NewRelic agent is not available: #{e.to_s}"
end