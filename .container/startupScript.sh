CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    source ~/.zshrc
    cd /var/www
    git clone https://github.com/magento/magento2.git
    cd magento
    git checkout tags/2.4.3-p1
    rm -rf .git
    cp -rf ./* ..
    cd ..
    rm -rf magento
    cp .container/env.php magento/app/etc/
    cp auth.json.sample ./auth.json
else
    echo "-- Not first container startup --"
fi