FROM messivanio/jruby-with-phantomjs:1.0.5-9.1.5.0-2.1.1

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN bundle install
