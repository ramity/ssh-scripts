# Quick links

| Section | Description |
| ------- | ----------- |
| [TL;DR](https://github.com/ramity/ssh-scripts#tldr) | A quick and dirty TL;DR for setting up and using this repo. |
| [Motivation](https://github.com/ramity/ssh-scripts#motivation) | The motivation of this repo. |
| [Setup](https://github.com/ramity/ssh-scripts#setup) | A walkthrough of setting up this repo on your system. |
| [Checks](https://github.com/ramity/ssh-scripts#checks) | Some misc checks to perform before usage of provided scripts. |
| [Usage](https://github.com/ramity/ssh-scripts#usage) | Describing how to use the provided scripts. |
| [FAQ](https://github.com/ramity/ssh-scripts#usage) | Some frequently asked questions regarding this repo. |

# TL;DR

#### Setup

```
git clone git@github.com:ramity/ssh-scripts.git ~/.ssh/scripts
chmod +x ~/.ssh/scripts/*.bash
```

#### Start:

```
. ~/.ssh/scripts/start.bash
```

#### Stop:

```
~/.ssh/scripts/stop.bash
```

# Motivation

For years, I've always had the following in my ~/.bashrc or manually ran:

```
eval `ssh-agent -s`
ssh-add ~/.ssh/*_keys
```

I've learned that while this approach works, it's particularly hacky. It often creates problems with other terminal instances not always getting the ssh-agent context, issues with forking during the creation of another terminal, and additionally leaves a dangling ssh-agent process in the event that all terminals are closed.
This repo stores the ssh-agent context into a ~/.ssh/agent file and allows terminals to gain context of the process by sourcing the created agent file rather than creating a separate ssh-agent process.

# Setup

- Clone this repo into the .ssh/scripts directory

(ssh)

```
git clone git@github.com:ramity/ssh-scripts.git ~/.ssh/scripts
```

(https)

```
git clone https://github.com/ramity/ssh-scripts.git ~/.ssh/scripts
```

- Ensure start.bash and stop.bash are executable

```
chmod +x ~/.ssh/scripts/start.bash
chmod +x ~/.ssh/scripts/stop.bash
```

# Checks

- Make sure your private keys follow the `***_key` format.

# Usage

- Run the start command with the `.` or `source` syntax

```
. ~/.ssh/scripts/start.bash
```

- Stop the agent process

```
~/.ssh/scripts/stop.bash
```

- If you trust the code contained within, place `. ~/.ssh/scripts/start.bash` command in your .bashrc file. The start script gracefully handles if the script has already been invoked by checking the presence of a running ssh-agent process and the existence of the `~/.ssh/agent` file.

# FAQ

> "When I try to use ssh/git/etc after running the start command, it doesn't work."

- Make sure you're using the `.` or `source` command syntax when executing the start script:

```
. ~/.ssh/scripts/start.bash
```

> "The start command isn't finding my ssh keys correctly."

- Your private keys may not follow the `***_key` format I use in this repo. Note the [checks section](https://github.com/ramity/ssh-scripts#checks). You can either change how your keys are named or update the SSH_KEYS variables in the start.bash script to target your private keys in a different manner.

> "Putting a repo in my .ssh directory seems kind of fishy."

- Put it elsewhere then. I like having it in my .ssh directory, but because the SSH_AGENT and SSH_KEYS variables are specified relative to the user directory, you can really place the scripts wherever you like.

> "I'm still a bit weary of giving a repo/scripts access to my ssh keys."

- Me too. Nothing I can say here can justify it. Check out the code of the start and stop scripts yourself (less than 70 lines of code with more echos than actual commands). If you trust what you see, clone the repo and remove the .git directory to prevent the possibility of pulling a malicious update. That's what I'd do.
