FROM node:11.0-alpine

# Installs latest Chromium package
RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk add --no-cache bash chromium@edge nss@edge

# This line is to tell karma-chrome-launcher where
# chromium was downloaded and installed to.
ENV CHROME_BIN /usr/bin/chromium-browser

# Tell Puppeteer to skip installing Chrome.
# We'll be using the installed package instead.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Telling node-sass which pre-built binary to fetch.
# This way we don't need rebuilding node-sass each time!
ENV SASS_BINARY_NAME=linux-x64-67t

LABEL "com.github.actions.name"="angular-karma-test-action"
LABEL "com.github.actions.description"="Run Angular Karma Tests"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/ahmedrizwan/angular-karma-test-action.git"
LABEL "homepage"="https://github.com/ahmedrizwan/angular-karma-test-action"

LABEL "maintainer"="Ahmed Rizwan <ahmedrizwan@outlook.com>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]