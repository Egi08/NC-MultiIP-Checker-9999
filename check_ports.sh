#!/bin/bash

# File yang berisi daftar IP
IP_LIST="ip_list.txt"

# Port yang akan dicek
PORT=9999

# Loop melalui setiap IP dalam file
while IFS= read -r ip; do
  echo "Checking IP: $ip on port $PORT"
  nc -zv "$ip" "$PORT" 2>&1 | grep -E "succeeded|open"
done < "$IP_LIST"
