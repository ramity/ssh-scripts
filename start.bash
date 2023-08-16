#!/bin/bash

# Define vars
SSH_AGENT_FILE=~/.ssh/scripts/agent
SSH_KEYS=~/.ssh/*_key
SSH_SESSIONS_FILE=~/.ssh/scripts/sessions

# Check if there is a ssh-agent process running
if [ $(ps ax | grep [s]sh-agent | wc -l) -gt 0 ] ; then

  # Check if there exists a ssh-agent file
  if [ -e $SSH_AGENT_FILE ] ; then
    source $SSH_AGENT_FILE
    tput setaf 2
    echo "Attached to existing ssh-agent process"

  # Notify user there is a dangling ssh-agent process
  else
    tput setaf 1
    echo "ERROR: $(tput setaf 3)Dangling SSH-agent process detected."
    tput setaf 1
    echo "ERROR: $(tput setaf 3)Resolve by relogging."
  fi

# Go through the process of starting, attaching, and adding keys to a ssh-agent process
else
  tput setaf 6
  echo "Starting ssh-agent"
  ssh-agent -s | head -n -1 > $SSH_AGENT_FILE
  source $SSH_AGENT_FILE

  tput setaf 5
  ssh-add $SSH_KEYS
  tput setaf 2
  echo "Complete"
fi

# Reset terminal colors
tput sgr0

# Get, increment, and update the number of ssh sessions
echo $(($(<"$SSH_SESSIONS_FILE") + 1)) > "$SSH_SESSIONS_FILE"
