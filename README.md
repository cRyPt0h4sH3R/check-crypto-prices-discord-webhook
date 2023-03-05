
# Check Crypto Prices to Discord via Webhook [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

This simple shell script gets crypto prices from an API and posts them to Discord via Webhook.
Add it to cron to set the schedule you want it to fire.



## Acknowledgements

 - [Discord Webhooks Guide](https://birdie0.github.io/discord-webhooks-guide/)
 - [How To Use Discord Webhooks to Get Notifications for Your Website Status on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for-your-website-status-on-ubuntu-18-04)

## Demo



Get crypto prices from API and post to Discord via webhook

This simple shell script allows you to post crypto prices to Discord channel on a schedule.
To achieve this just create a new shell script file, ending with .sh:
```
nano check-crypto-prices.sh
```
Copy the code and save the file.
Set file as executable:
```
chmod u+x check-crypto-prices.sh
```
