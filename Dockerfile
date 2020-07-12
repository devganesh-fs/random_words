FROM ruby:2.6.2
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN /bin/bash -l -c "/root/.yarn/bin/yarn install"
RUN gem install bundler
ENV RAILS_ENV production
RUN bundle config set without development test
RUN bundle install
ADD . /app
EXPOSE 3000

RUN bundle exec rails db:create
RUN bundle exec rails db:migrate
RUN bundle exec rails words:populate

RUN /bin/bash -l -c "bundle exec rails assets:precompile"

CMD /bin/bash -l -c "bundle exec puma -p 3000"
