FROM node:alpine as buidler 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=buidler /app/build /usr/share/nginx/html
