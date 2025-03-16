FROM node:20.12.0-alpine3.19

WORKDIR /Users/sneiden/100x-devs-cohort-2/full-stack/week-18/week-18-2-ci-cd

COPY package.json package-lock.json turbo.json tsconfig.json ./

COPY apps ./apps
COPY packages ./packages

# Install dependencies
RUN npm install
# Can you add a script to the global package.json that does this?
RUN npm run db:generate

# Can you filter the build down to just one app?
RUN npm run build

CMD ["npm", "run", "start-user-app"]