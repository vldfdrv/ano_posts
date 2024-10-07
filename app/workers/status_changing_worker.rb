class StatusChangingWorker
  include Sidekiq::Worker

  def perform(post_id, status_const)
    post = Post.find(post_id)
    post.update(status: status_const)
  end
end

# job = Sidekiq::Cron::Job.new(
#     name:
#       'WorkerName: StatusChangingWorker. Change post status.',
#     cron: '*/5 * * * *',
#     class: 'StatusChangingWorker'
#   )
#
# unless job.save
#   Rails.logger.info '>>> DEBUG: something wrong in worker StatusChangingWorker'
#   Rails.logger.info job.errors
# end
