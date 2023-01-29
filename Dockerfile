FROM node:16 AS frontend-build
WORKDIR /usr/src/app
COPY frontend/ ./frontend/
RUN cd frontend && npm install && npm run build

FROM node:16 AS backend-build
WORKDIR /root/
COPY --from=frontend-build /usr/src/app/frontend/dist ./frontend/dist
COPY backend/ ./backend/
RUN npm config set registry https://registry.npmjs.cf
RUN cd backend && npm install && npm run build

EXPOSE 3000

CMD ["node", "./backend/dist/main"]
