#!/bin/bash

# define required ssh agent vars
SSH_AGENT_FILE=~/.ssh/agent
SSH_KEYS=~/.ssh/*_key

echo "INFO: Checking for running SSH-agent process."
if [ $(ps ax | grep [s]sh-agent | wc -l) -gt 0 ] ; then
  echo "INFO: Running SSH-agent process was detected."
  echo "INFO: Skipping SSH-agent startup."
  echo "INFO: Checking for SSH-agent file."
  if [ -e $SSH_AGENT_FILE ] ; then
    echo "INFO: SSH-agent file was detected."
    echo "INFO: Loading SSH-agent context."
    source $SSH_AGENT_FILE
    echo "INFO: SSH-agent startup complete."
  else
    echo "ERROR: Dangling SSH-agent process detected."
    echo "ERROR: Resolve by manually stopping SSH-agent process."
  fi
else
  echo "INFO: Creating SSH-agent process."
  ssh-agent > $SSH_AGENT_FILE
  echo "INFO: Loading SSH-agent context."
  source $SSH_AGENT_FILE
  echo "INFO: Loading keys into agent process."
  ssh-add $SSH_KEYS
  echo "INFO: SSH-agent startup complete."
fi
