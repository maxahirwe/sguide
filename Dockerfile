FROM ruby:2.7.0-alpine AS builder
RUN apk add \
	build-base \
	postgresql-dev \
	yarn
COPY Gemfile* ./
RUN gem install bundler -v 2.1.2
RUN bundle install

RUN yarn install
FROM ruby:2.7.0-alpine AS runner
RUN apk add \
	tzdata \
	nodejs \
	postgresql-dev \
	yarn
WORKDIR /app

# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . ./
EXPOSE 3000
ENV [OPEN_KEY]=[default-value]
CMD ["rails", "server", "-b", "0.0.0.0"]