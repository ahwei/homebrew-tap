# ahwei/homebrew-tap

[Homebrew](https://brew.sh) tap for [@ahwei](https://github.com/ahwei)'s tools.

## Install

```bash
brew tap ahwei/tap
```

## Available casks

| Cask | Description |
|---|---|
| [`agent-teams`](Casks/agent-teams.rb) | Local read-only dashboard for monitoring [Claude Code](https://claude.ai/code) sessions, agent teams, tokens/cost and tasks |

## Usage

```bash
brew install --cask agent-teams
```

Cask files in this repo are **auto-generated** by the CI workflow in the source
project ([ahwei/agent-teams-releases](https://github.com/ahwei/agent-teams-releases)).
Don't edit the cask files here by hand — they'll be overwritten on the next release.

## Updates

```bash
brew update
brew upgrade --cask agent-teams
```
