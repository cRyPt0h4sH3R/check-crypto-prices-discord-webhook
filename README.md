
# Crypto Prices to Discord via Webhook [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

This simple shell script gets crypto prices from an API and posts them to Discord via Webhook.

Add it to cron to set the schedule when you want it to fire.

## Acknowledgements

 - [Discord Webhooks Guide by birdie0](https://birdie0.github.io/discord-webhooks-guide/)
 - [How To Use Discord Webhooks to Get Notifications for Your Website Status on Ubuntu 18.04 by Bobby Iliev](https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for-your-website-status-on-ubuntu-18-04)
 - [Cryptocurrency-Discord-Bot-Status by cferreras](https://github.com/cferreras/Cryptocurrency-Discord-Bot-Status)

## Demo

![App Screenshot](https://raw.githubusercontent.com/cRyPt0h4sH3R/check-crypto-prices-discord-webhook/main/demo.png)

## Deployment

```bash
git clone https://github.com/cRyPt0h4sH3R/crypto-prices-to-discord.git
```
```bash
cd crypto-prices-to-discord
```

## Setup

Edit the script:

```bash
nano crypto-prices-to-discord.sh
```
Fill in your Discord Webhook, crypto tickers, api_provider_name, api_url, username that will appear in Discord channel (will override the Webhook name you set in Discord), content of message.

Pay atention to the JSON payload served by the API as you might need to edit ```jq .data.price``` on lines 57 and 74.

Save and exit the editor.

Make the script executable:

```bash
chmod u+x crypto-prices-to-discord.sh
```

## Usage

To run the script:

```bash
./crypto-prices-to-discord.sh
```

To set it on a schedule:

```bash
crontab -e
```

Add a new line in crontab:

```bash
0 */6 * * * <path-to-script>
```
## Donation

Beer money in case you found this useful or helped your project:

BTC: bc1q0rgyswzn57pvqeqnmdlmd2q4tefpgkprfntvsc

ETH: 0x0EB8ed100e3b93c6D822933523Ad63d70D9651b7

BNB: bnb1j95hlvfxeheg2nmdkypl6estknegu2274zkrv4

EGLD: erd1edrd05mf0lxux0udw8an4kjkkr50mmuv33j34glhf79v7fn6k2rsen423n

[GPL v3](https://opensource.org/license/gpl-3-0/)

## License

[GPL v3](https://opensource.org/license/gpl-3-0/)
