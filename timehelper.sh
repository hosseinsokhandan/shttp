#!/bin/ash


format_seconds() {
  local seconds=$1
  output=""
  
  leftover_seconds=$((seconds % 60))
  leftover_minutes=$(((seconds / 60) % 60))
  leftover_hours=$(((seconds / 3600) % 24))
  leftover_days=$(((seconds / 86400) % 7))
  leftover_weeks=$(((seconds / 604800) % 4))
  leftover_months=$((seconds / 2592000))
  
  if [ "$leftover_months" != 0 ]; then
    output="$output$leftover_months month, "
  fi

  if [ "$leftover_weeks" != 0 ]; then
    output="$output$leftover_weeks week, "
  fi

  if [ "$leftover_days" != 0 ]; then
    output="$output$leftover_days day, "
  fi

  if [ "$leftover_hours" != 0 ]; then
    output="$output$leftover_hours hour, "
  fi
  
  if [ "$leftover_minutes" != 0 ]; then
    output="$output$leftover_minutes min, "
  fi

  if [ "$leftover_seconds" != 0 ]; then
    if [ "$output" == "" ]; then
      output="$output$leftover_seconds sec"
    fi
  fi

  echo "${output%, }"
}
