#!/bin/sh

echo "\n**Installing Angular CLI**\n"
npm install -g @angular/cli --latest
ng config -g cli.warnings.versionMismatch false

echo "\n**Installing Dependencies**\n"
npm install

echo "\n**Running Karma Tests**\n"
npm run test --browsers ChromeHeadless --watch=false
