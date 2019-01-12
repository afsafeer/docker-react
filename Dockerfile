FROM node:alpine as buidler 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=buidler /app/build /usr/share/nginx/html
