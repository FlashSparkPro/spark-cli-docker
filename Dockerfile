FROM node:18-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN corepack enable && \
    corepack prepare yarn@4.5.0 --activate

RUN git clone https://github.com/buildonspark/spark.git

WORKDIR /app/spark/sdks/js
RUN yarn && yarn build

WORKDIR /app/spark/sdks/js/examples/spark-cli

RUN yarn

CMD ["yarn", "cli:mainnet"]