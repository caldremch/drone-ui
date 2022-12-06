FROM caldremch/ubuntu-node14-py2
WORKDIR /app
#COPY package*.json ./

#RUN npm config set registry https://registry.npm.taobao.org -g
#RUN npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass
#RUN npm install --legacy-peer-deps
#RUN npm audit fix --force
COPY ./*.* /app
RUN ls -la
RUN npm install
RUN npm build

FROM nginx:stable-alpine
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
