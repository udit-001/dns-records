#!/bin/bash

# Check if domain name is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a domain name"
    echo "Usage: $0 <domain-name>"
    exit 1
fi

DOMAIN=$1
OUTPUT_FILE="dns-records-${DOMAIN}.txt"

# Get current date in the format used by the original workflow
DATE=$(date +'%b-%Y')

# Create the output file with timestamp
echo "DNS Records for ${DOMAIN} - $(date)" > "${OUTPUT_FILE}"

# Fetch A Records
echo -e "\n=== A Records ===" >> "${OUTPUT_FILE}"
dig "${DOMAIN}" A +short >> "${OUTPUT_FILE}"

# Fetch AAAA Records
echo -e "\n=== AAAA Records ===" >> "${OUTPUT_FILE}"
dig "${DOMAIN}" AAAA +short >> "${OUTPUT_FILE}"

# Fetch MX Records
echo -e "\n=== MX Records ===" >> "${OUTPUT_FILE}"
dig "${DOMAIN}" MX +short >> "${OUTPUT_FILE}"

# Fetch TXT Records
echo -e "\n=== TXT Records ===" >> "${OUTPUT_FILE}"
dig "${DOMAIN}" TXT +short >> "${OUTPUT_FILE}"

# Fetch NS Records
echo -e "\n=== NS Records ===" >> "${OUTPUT_FILE}"
dig "${DOMAIN}" NS +short >> "${OUTPUT_FILE}"

# Fetch CNAME Records
echo -e "\n=== CNAME Records ===" >> "${OUTPUT_FILE}"
dig "${DOMAIN}" CNAME +short >> "${OUTPUT_FILE}"

echo "DNS records have been saved to ${OUTPUT_FILE}" 