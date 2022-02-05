FROM ruby:3.1.0-alpine

RUN apk add --no-cache zsh entr build-base sqlite-dev postgresql-dev

COPY ethereum_tracker-load-profile.sh /etc/profile.d

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN addgroup $USERNAME -g $USER_GID \
    && adduser $USERNAME -D -h $USERNAME -u $USER_UID -G $USERNAME

WORKDIR /workspace
