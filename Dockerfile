# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y libmysqld-dev --force-yes default-mysql-client

#RUN apt-get update -q -q && \
# apt-get install --yes --force-yes \
#   apt-utils \
#   libmysqld-dev \
#   libdmtx-dev \
#   imagemagick \
#   libmagickwand-dev \
#   pdftk \
#   wget \
#   unzip \
#   python-pip \
#   xfonts-75dpi \
#   xfonts-base \
#   mysql-client \
#   fonts-roboto \
#   cmake \
#   shared-mime-info \
#   nodejs \
#   ca-certificates \
#   openssl


WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]