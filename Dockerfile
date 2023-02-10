FROM ruby:2.7.0-alpine AS builder
RUN apk add \
	build-base \
	postgresql-dev
COPY Gemfile* ./
RUN gem install bundler -v 2.1.2
RUN bundle install
FROM ruby:2.7.0-alpine AS runner
RUN apk add \
	tzdata \
	nodejs \
	postgresql-dev
WORKDIR /app
# Install yarn
# RUN curl https://deb.nodesource.com/setup_12.x | bash
# RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn
# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . ./
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]