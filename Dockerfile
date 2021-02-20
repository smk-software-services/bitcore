FROM node:10.23.1

WORKDIR /bitcore

COPY  ./packages/bitcore-wallet-service/package.json ./packages/bitcore-wallet-service/package.json
COPY  ./packages/bitcore-wallet-service/package-lock.json ./packages/bitcore-wallet-service/package-lock.json

WORKDIR /bitcore/packages/bitcore-wallet-service

RUN npm install

WORKDIR /bitcore

ADD . .

ARG SENDGRID_API_KEY
ENV SENDGRID_API_KEY=${SENDGRID_API_KEY}
ARG SENDGRID_API_KEY
ENV DB_CONNECTION=${DB_CONNECTION}
ARG SENDGRID_API_KEY
ENV NODE_ENV=${NODE_ENV}

EXPOSE 3232

WORKDIR /bitcore/packages/bitcore-wallet-service

CMD ["npm", "start"]
# ENTRYPOINT ["sh", "./entrypoint.sh" ]