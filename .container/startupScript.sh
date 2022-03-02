CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    cd /var/www
    git clone https://github.com/magento/magento2.git
    cd magento2
    git checkout tags/2.4.3-p1
    rm -rf .git
    rm .gitignore
    rm README.md
    cp -rf ./* ..
    cd ..
    rm -rf magento2
    cp .container/env.php app/etc/
    cp .container/auth.json ./auth.json
else
    echo "-- Not first container startup --"
fi