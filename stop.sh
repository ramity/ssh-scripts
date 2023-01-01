#!/bin/bash

# define required ssh agent vars
SSH_AGENT_FILE=~/.ssh/agent

echo "INFO: Checking for running SSH-agent process."
if [ $(ps ax | grep [s]sh-agent | wc -l) -gt 0 ] ; then
  echo "INFO: Running SSH-agent process was detected."
  echo "INFO: Checking for SSH-agent file."
  if [ -e $SSH_AGENT_FILE ] ; then
    echo "INFO: SSH-agent file was detected."
    echo "INFO: Loading SSH-agent context."
    source $SSH_AGENT_FILE
    echo "INFO: Removing SSH-agent file."
    rm $SSH_AGENT_FILE
    echo "INFO: Closing SSH-agent process."
    ssh-agent -k
    echo "INFO: SSH-agent shutdown complete."
  else
    echo "ERROR: Dangling SSH-agent process detected."
    echo "ERROR: Resolve by manually stopping SSH-agent process."
  fi
else
  echo "INFO: No running SSH-agent detected."
  echo "INFO: Checking for SSH-agent file."
  if [ -e $SSH_AGENT_FILE ] ; then
    echo "INFO: SSH-agent file was detected with no running process."
    echo "INFO: Removing dangling SSH-agent file."
    rm $SSH_AGENT_FILE
    echo "INFO: SSH-agent shutdown complete."
  else
    echo "INFO: SSH-agent file was not detected."
    echo "INFO: SSH-agent shutdown complete."
  fi
fi

read
