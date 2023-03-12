#!/bin/bash
# Crypto Price Check Discord Webhook Script
# Author: cRyPt0h4sH3R
# Date: 04/03/2023
#
# Discord webhook
# Change the 'your_discord_webhook_name' with your actual Discord Webhook
webhook=<discord webhook>
# List of cryptocurrencies symbols to check
# To add more symbols just use space as a separator
# Ex: symbols=("BTC-USDT" "HNT-USDT" "XCH-USDT" "EGLD-USDT")
symbols=("helium" "chia" "elrond-erd-2" "bitcoin")
# API URL
# Check API documentation at https://www.coingecko.com/en/api/documentation
api_url="https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&sparkline=false&ids="
# Cryptocurrency data
data_symbols=https://www.coingecko.com/en/coins/
# Use a temporary file to compose the JSON payload
TEMP_FILE="/tmp/webhook.json"
#Cycle through symbols
for i in "${!symbols[@]}"; do
    # Compose API request
    api_request=${api_url}${symbols[$i]}
    # Save JSON response
    json_response=$(curl --silent -X GET -L --url ${api_request})
    # Extract name from JSON response
    id=$(jq -r '.[].id' <<< $json_response)
    # Extract name from JSON response
    name=$(jq -r '.[].name' <<< $json_response)
    # Extract image from JSON response
    image=$(jq -r '.[].image' <<< $json_response)
    # Extract current_price from JSON response
    current_price=$(jq -r '.[].current_price' <<< $json_response)
    # Extract price_change_percentage_24h from JSON response
    price_change_percentage_24h_raw=$(jq -r '.[].price_change_percentage_24h' <<< $json_response)
    # Trim price_change_percentage_24h to 2 decimals
    price_change_percentage_24h=$(printf "%9.2f" "$price_change_percentage_24h_raw")
    if [[ "$current_price" ]] ; then
        # Continue building JSON data
        # JSON data header
        cat > "${TEMP_FILE}" << EOF
        {
            "username": "$name",
            "avatar_url": "$image",
            "content": "$current_price USD",
            "embeds": [
                {
                    "title": "Price change 24h $price_change_percentage_24h%",
                    "url": "$data_symbols$id"
                }
            ]
        }
EOF
    sleep 1
    # Send to Discord
    curl -L $webhook \
    -X POST \
    -H "Content-Type: application/json" \
    --data-binary "@${TEMP_FILE}"
    # Remove the temporary file
    rm -f "${TEMP_FILE}"
    else
        echo "API down?"
    fi
    sleep 1
done
