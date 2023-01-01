# Setup

- Clone this repo into your .ssh directory

```
cd ~/.ssh/
```

(ssh)

```
git clone git@github.com:ramity/ssh-scripts.git
```

(https)

```
git clone https://github.com/ramity/ssh-scripts.git
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
