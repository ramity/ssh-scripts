#!/bin/bash

# Define vars
SSH_AGENT_FILE=~/.ssh/scripts/agent
SSH_SESSIONS_FILE=~/.ssh/scripts/sessions

# Get, decrement, store, and update the number of ssh sessions
updated_sessions=$(($(<"$SSH_SESSIONS_FILE") - 1))
echo "$updated_sessions" > "$SSH_SESSIONS_FILE"

# Exit script early if there are still more sessions
if [ "$updated_sessions" -ne 0 ]; then
  exit
fi

# Check if there is a ssh-agent process running
if [ $(ps ax | grep [s]sh-agent | wc -l) -gt 0 ] ; then

  # Check if there exists a ssh-agent file
  if [ -e $SSH_AGENT_FILE ] ; then
    source $SSH_AGENT_FILE
    rm $SSH_AGENT_FILE
    ssh-agent -k
    echo "Removed agent file and killed ssh-agent process"

  # Close dangling ssh-agent process
  else
    echo "Closing dangling ssh-agent process."
    ssh-agent -k
  fi
else
  if [ -e $SSH_AGENT_FILE ] ; then
    rm $SSH_AGENT_FILE
  fi
fi
