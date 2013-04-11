#! /bin/bash

########################################################################
# piping.sh
# Run this script in a cron job to download data from data providers
# and pipe the data to GSDs automatically.
########################################################################

# Download ENA and IUCN DwC
php /var/www/piping_devel/php/dwc.php ENA > /var/www/piping_devel/php/log/dwc.log
php /var/www/piping_devel/php/dwc.php IUCN >> /var/www/piping_devel/php/log/dwc.log
php /var/www/piping_devel/php/dwc.php GBIF >> /var/www/piping_devel/php/log/dwc.log

# Download the rest of other data provider (disabled)
# php /var/www/piping_devel/php/dwc.php CBOL >> /var/www/piping_devel/php/log/dwc.log

# Start scheduler
php /var/www/piping_devel/php/scheduler.php > /var/www/piping_devel/php/log/scheduler.log

# Start scheduler_pm 
php /var/www/piping_devel/php/scheduler_pmonit.php > /var/www/piping_devel/php/log/scheduler_pm.log


