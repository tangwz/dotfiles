# dotfiles

Small dotfiles repo focused on Git configuration.

## What this repo does

- Symlinks `gitconfig` to `~/.gitconfig`
- Expects a local override at `~/.gitconfig.local` for private user info

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
