cd ./assets/js
npm install
npm run build


# Go back to /web_app:
cd ../../

echo '..........................................'
echo 'Finished building. Server is up'
echo '..........................................'

apache2ctl -D FOREGROUND