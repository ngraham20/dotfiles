#!/bin/sh

# --- UTILITY ---
ispowered() {
  echo $(bluetoothctl show | grep "Powered" | awk '{print $2}')
}

connected() {
  local con=$(bluetoothctl info | grep "Missing device address argument")
  if [ -z "$con" ]; then
    echo "yes"
  else
    echo "no"
  fi
}

# --- VARIABLES ---
device=$(cat "./device")
power=$(ispowered)
discovering=$(bluetoothctl show | grep "Discovering" | awk '{print $2}')

# --- FUNCTIONS ---

connected=$(connected)

connect() {
  poweron

    # timeout after 5 seconds
  local timeout=5
  while [[ $timeout -gt 0 ]]; do
    local p=$(ispowered)
    if [[ $p == "yes" ]]; then
      break
    fi
    ((p+=1))
    sleep 1
  done

  if [[ $p == 0 ]]; then
    echo "Timed out while waiting for Bluetooth to power on"
    poweroff
    exit
  fi

  if [[ $connected == "no" ]]; then
    bluetoothctl connect $device
  fi
}

disconnect() {
  if [[ $connected == "yes" ]]; then
    bluetoothctl disconnect
  fi
}

poweroff() {
  if [[ $power == "yes" ]]; then
    bluetoothctl power off
    power="no"
  fi 
}

poweron() {
  if [[ $power == "no" ]]; then
    bluetoothctl power on
    power="yes"
  fi
}

togglepower() {
  if [[ $power == "no" ]]; then
    bluetoothctl power on
  else
    bluetoothctl power off
  fi
}

case $1 in
  "connect") connect
    ;;
  "disconnect") disconnect
    ;;
  "poweron") poweron
    ;;
  "poweroff") poweroff
    ;;
  "togglepower") togglepower
    ;;
esac