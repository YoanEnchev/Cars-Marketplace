cd ./assets/js

if [ ! -d "node_modules" ]; then
    # There is no node_modules folder. So install modules.
    npm install
fi


if [ ! -f "../../static/js/app.bundle.js" ]; then
    # There is no bundle file. So build it.
    echo "Not existing";
    npm run build
fi

# Go back to /web_app:
cd ../../

# Wait a few secoonds before showing a message that script finished so it doesn't overlap with other seconds.
sleep 3 && 
    echo '..........................................' &&
    echo 'Finished building. Server is up.' &&
    echo '..........................................'

apache2ctl -D FOREGROUND