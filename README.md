# dotfiles

## Usage

```sh
./install.sh
```

To skip prompts and overwrite existing files:

```sh
./install.sh --yes
```

## Private Git identity

This repo does **not** store your name/email. Put them in a local file that is
not tracked by Git:

`~/.gitconfig.local`

Example:

```ini
[user]
    name = Your Name
    email = you@example.com
```
