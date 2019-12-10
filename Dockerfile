FROM node:lts-alpine

ENV PORT=8080
ENV HOST=0.0.0.0

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install -g npm@latest
RUN npm install -g @vue/cli
RUN npm install -g @vue/cli-service-global
RUN npm install -g serve
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "npm", "run", "serve" ]

# install and cache app dependencies
# COPY package.json /usr/src/app/package.json

# RUN npm install
# start app
# CMD ["npm", "run", "serve"]