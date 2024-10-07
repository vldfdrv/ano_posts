psql --u postgres

CREATE USER ano_national_posts SUPERUSER;
CREATE DATABASE ano_national_posts WITH OWNER ano_national_posts;

bundle install

bundle exec rake db:migrate

rails s

redis-server

bundle exec sidekiq

sudo apt-get install shared-mime-info


#post_id = Post.first.id
#StatusChangingWorker.perform_async(post_id, Post::STATUS_APPROVED)


