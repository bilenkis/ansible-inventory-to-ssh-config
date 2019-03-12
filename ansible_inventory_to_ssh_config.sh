#!/bin/bash

if [[ -z $1 ]]; then
    echo "Usage: $0 path/to/inventory"
    exit 1
fi

while read line; do
  line=$(echo "$line" | grep -Ev '^(;|#)' | grep 'ansible_host=')
  port="";
  hostname=$(echo "$line" | awk '{print $1}');
  ip_address=$(echo "$line" | sed 's/^.*ansible_host=\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*/\1/');
  if [[ "$line" =~ ansible_port ]]; then
    port=$(echo "$line" | sed 's/^.*ansible_port=\([0-9]*\).*/\1/');
  fi
  if [[ ! -z $port && ! -z $hostname ]]; then
    echo -e "Host $hostname\nHostname $ip_address\nPort $port\n"
  fi
  if [[ ! -z $hostname ]]; then
    echo -e "Host $hostname\nHostname $ip_address\n"
  fi
done < $1
