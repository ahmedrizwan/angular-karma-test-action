#!/bin/sh

echo "\n**Installing Angular CLI**\n"
npm install -g @angular/cli --latest
ng config -g cli.warnings.versionMismatch false

echo "\n**Installing Dependencies**\n"
yarn

echo "\n**Running Karma Tests**\n"
yarn run test --browsers ChromeHeadless --watch=false
