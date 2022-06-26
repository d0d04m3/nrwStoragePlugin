FROM nodered/node-red:latest


#COPY package.json .
USER root
RUN chown -R node-red:root /data
USER node-red
RUN npm install --no-fund --no-update-notifier --save node-red-contrib-storage-mongodb
COPY settings.js /data/
COPY flows.json  /data/flows.json
COPY package.json  /data/package.json
#RUN npm install --no-fund --no-update-notifier --save node-red-mongo-storage-plugin
ENTRYPOINT npm start --  --userDir /data
#CMD ["npm", "start"]
