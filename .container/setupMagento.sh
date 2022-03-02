cd /var/www
php bin/magento module:enable --all
magerun2 db:import -c gzip .container/bare.database.sql.gz
magerun2 db:import -c gzip .container/sample.database.sql.gz
php bin/magento setup:install
php bin/magento setup:upgrade
php bin/magento maintenance:disable
php bin/magento cache:clean && php bin/magento cache:flush