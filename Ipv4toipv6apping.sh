#!/bin/bash

# Function to convert IPv4 to Cloudflare IPv6
convert_ipv4_to_cloudflare_ipv6() {
    IFS='.' read -ra ADDR <<< "$1"
    printf "2606:4700:4700::%02x%02x:%02x%02x\n" "${ADDR[0]}" "${ADDR[1]}" "${ADDR[2]}" "${ADDR[3]}"
}

# Prompt user for IPv4 address
read -p "Enter the IPv4 address: " ipv4_address

# Validate the IPv4 address (basic validation)
if [[ $ipv4_address =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    # Convert the IPv4 address to Cloudflare IPv6
    ipv6_address=$(convert_ipv4_to_cloudflare_ipv6 "$ipv4_address")
    echo "The Cloudflare IPv6 address is: $ipv6_address"
else
    echo "Invalid IPv4 address format."
fi
