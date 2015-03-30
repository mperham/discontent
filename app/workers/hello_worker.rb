class HelloWorker
  include Sidekiq::Worker

  def perform(msg)
    logger.info "Hello, #{msg}"
  end
end
