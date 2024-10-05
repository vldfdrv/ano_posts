psql --u postgres

CREATE USER ano_national_posts SUPERUSER;
CREATE DATABASE ano_national_posts WITH OWNER ano_national_posts;

bundle install

bundle exec rake db:migrate

rails s
