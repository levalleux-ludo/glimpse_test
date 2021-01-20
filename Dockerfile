FROM node:lts-alpine
RUN apk add --update git

ENV USER=adsManager
ENV UID=12345
ENV GID=23456

RUN adduser \
    --disabled-password \
    "$USER"

USER adsManager
RUN mkdir -p /home/adsManager/api
WORKDIR /home/adsManager/api
COPY --chown=adsManager package.json .
COPY --chown=adsManager scripts scripts
COPY --chown=adsManager .env.example .
RUN ls -la
RUN npm install -y
COPY --chown=adsManager . .

ENV NODE_ENV production
CMD npm run start
