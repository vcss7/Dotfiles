#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if ! ping -c 1 mullvad.net &> /dev/null; then
  echo "Could not connect to Mullvad server. Check connections."
  exit 1
fi

MULLVAD_JSON="$(curl -SsL https://am.i.mullvad.net/json)"

PROJECT_OWNER="mullvad"
PROJECT_NAME="mullvadvpn-app"

declare -A MULLVAD_2D_ARR

DEPS=(
  curl
  jq
)

NO_COLOR="\033[0m"
GREEN="\033[0;32m"
RED="\033[0;31m"

check_dependencies() {
  if ! command -v mullvad &> /dev/null; then
    echo "Mullvad VPN is not installed." # TODO
    exit 1
  fi
  
  for dep in "${DEPS[@]}"; do
    if ! command -v "$dep" &> /dev/null; then
      echo "This script depends on $dep, please install."
      exit 1
    fi
  done
}

check_latest_version() {
  CURRENT_VERSION=$(mullvad --version)
  REGEX="[0-9][A-Za-z0-9\.-]*" # TODO: Optimize for quicker search
  LATESTVERSION_URL="https://github.com/${PROJECT_OWNER}/${PROJECT_NAME}/releases/latest"
  LATESTVERSION_TAG=$(curl -SsL "$LATESTVERSION_URL" | grep -o "<title>Release $REGEX · ${PROJECT_OWNER}/${PROJECT_NAME}" | grep -o "$REGEX")

  if [ "$LATESTVERSION_TAG" = "" ]; then
    echo "Cannot determine latest tag."
    exit 1
  fi

  if [[ $CURRENT_VERSION =~ $LATESTVERSION_TAG ]]; then
    echo -e "$GREEN"Mullvad VPN is up to date"$NO_COLOR"
  else
    echo -e "$RED"Mullvad VPN is not up to date"$NO_COLOR"
  fi
}

# TODO: probably a better way to do this
parse_json() {
  local MULLVAD_FIELDS
  MULLVAD_FIELDS=$(echo "${MULLVAD_JSON}" | jq -c 'keys' | tr -d '[:blank:][]"')

  local oIFS=$IFS
  IFS=, read -ra MULLVAD_FIELDS <<< "$MULLVAD_FIELDS"
  IFS=$oIFS
  
  for field  in "${MULLVAD_FIELDS[@]}"; do
    MULLVAD_2D_ARR["$field"]="$(echo "${MULLVAD_JSON}" | jq -r ."$field")"
  done

  # handle special case: nested object
  MULLVAD_2D_ARR["blacklisted"]="$(echo "${MULLVAD_JSON}" | jq -r .blacklisted.blacklisted)"
}

print_output() {
  fmt="%-26s%-10s\n"

  printf "                        __         __      \n" 
  printf " |\/||  ||   |  \  //\ |  \   \  /|__)|\ | \n" 
  printf " |  |\__/|___|___\//~~\|__/    \/ |   | \| \n" 
  printf "===========================================\n"
  printf "$fmt" Field Status
  for field in "${!MULLVAD_2D_ARR[@]}"; do
    printf "$fmt" "$field" "${MULLVAD_2D_ARR["$field"]}"
  done
}

check_dependencies
#check_latest_version
parse_json
print_output
