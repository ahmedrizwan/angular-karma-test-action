FROM selenium/node-chrome

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