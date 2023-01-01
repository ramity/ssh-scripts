# Setup

- Clone this repo into your .ssh directory

```
cd ~/.ssh/
```

(ssh)

```
git clone git@github.com:ramity/ssh-scripts.git scripts
```

(https)

```
git clone https://github.com/ramity/ssh-scripts.git scripts
```

- Ensure start.bash and stop.bash are executable

```
chmod +x ./start.bash
chmod +x ./stop.bash
```

# Checks

- Make sure your private keys end with the _key format.

# Usage

- Run the start command with the `.` or `source` syntax

```
. start.bash
```

- Stop the agent process

```
. stop.bash
```

# TL;DR setup

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
. ~/.ssh/scripts/stop.bash
```
