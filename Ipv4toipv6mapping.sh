#!/bin/bash

# Function to map IPv4 address to IPv6
map_ipv4_to_ipv6() {
    IFS='.' read -ra ADDR <<< "$1"
    printf "::ffff:%02x%02x:%02x%02x\n" "${ADDR[0]}" "${ADDR[1]}" "${ADDR[2]}" "${ADDR[3]}"
}

# Prompt user for IPv4 address
read -p "Enter the IPv4 address: " ipv4_address

# Validate the IPv4 address (basic validation)
if [[ $ipv4_address =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    # Map the IPv4 address to IPv6
    ipv6_address=$(map_ipv4_to_ipv6 "$ipv4_address")
    echo "The IPv6 mapped address is: $ipv6_address"
else
    echo "Invalid IPv4 address format."
fi
