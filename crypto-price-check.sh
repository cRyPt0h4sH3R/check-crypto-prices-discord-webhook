#!/bin/bash
# Crypto Price Check Discord Webhook Script
# Author: cRyPt0h4sH3R
# Date: 04/03/2023
#
# Discord webhook
# Change the 'your_discord_webhook_name' with your actual Discord Webhook
# name=Crypto Alerton
webhook="<discord-webhook>"

# List of cryptocurrencies tickers to check
# To add more tickers just use space as a separator
# Ex: tickers=("BTC-USDT" "HNT-USDT" "XCH-USDT" "EGLD-USDT")
tickers=("ticker1" "ticker2" "ticker3")
# Get lenght of tickers array
len_tickers=${#tickers[@]}
# API provider
# Ex: api_name=KuCoin
api_name=<api_provider_name>
# API URL
# Ex: api_url=https://api.kucoin.com/api/v1/market/stats
api_url=<api_url>
# Content of Discord message
content='Daily crypto price check'
title=''
description=''
# Use a temporary file to compose the JSON payload
TEMP_FILE="/tmp/webhook.json"
# JSON data header
cat > "${TEMP_FILE}" << EOF
{
    "content": "$content",
    "embeds": [
        {
            "title": "$title",
            "description": "$description",
            "fields": [
EOF

#Cycle through ticker array
for i in "${!tickers[@]}"; do
    # Ignore first array item, it will be parsed after the loop
    if [ $i == 0 ]; then
    continue;
    fi
        # Get prices from API
        price_raw=$(curl --silent -L ${api_url}?symbol=${tickers[$i]} | jq .data.averagePrice | xargs)
        # Trim price to 2 decimals
        price=$(printf "%9.2f" "$price_raw")
        if [[ "$price" ]] ; then
            # JSON data
            cat >> "${TEMP_FILE}" << EOF
                {
                    "name": "${tickers[$i]}",
                    "value": "$price",
                    "inline": true
                },
EOF
        else
            echo "API down?"
        fi
done
        # Get prices from API for first ticker
        price_raw=$(curl --silent -L ${api_url}?symbol=${tickers[0]} | jq .data.averagePrice | xargs)
        # Trim price to 2 decimals
        price=$(printf "%9.2f" "$price_raw")
        if [[ "$price" ]] ; then
            # JSON data first ticker
            cat >> "${TEMP_FILE}" << EOF
                {
                    "name": "${tickers[0]}",
                    "value": "$price",
                    "inline": true
                }
EOF
        else
            echo "API down?"
        fi
# JSON data footer
cat >> "${TEMP_FILE}" << EOF
        ],
        "footer": {
            "text": "API by KuCoin",
            "icon_url": "https://assets.staticimg.com/cms/media/3gfl2DgVUqjJ8FnkC7QxhvPmXmPgpt42FrAqklVMr.png"
        }
    }
    ]
}
EOF
# Send to Discord
curl -L $webhook \
-X POST \
-H "Content-Type: application/json" \
--data-binary "@${TEMP_FILE}"
# Remove the temporary file
rm -f "${TEMP_FILE}"
