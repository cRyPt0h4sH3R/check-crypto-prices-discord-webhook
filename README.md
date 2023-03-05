
# Crypto Prices to Discord via Webhook [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)

This simple shell script gets crypto prices from an API and posts them to Discord via Webhook.

Add it to cron to set the schedule when you want it to fire.

## Acknowledgements

 - [Discord Webhooks Guide](https://birdie0.github.io/discord-webhooks-guide/)
 - [How To Use Discord Webhooks to Get Notifications for Your Website Status on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for-your-website-status-on-ubuntu-18-04)

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
Fill in your Discord Webhook, crypto tickers, api_provider_name, api_url, username that will appear in Discord channel, content of message.

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

## License

[GPL v3](https://opensource.org/license/gpl-3-0/)
