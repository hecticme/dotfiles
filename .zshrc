# Key bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Aliases
alias glog='git log'
alias g1='git log --oneline'
alias gg='git log --graph --oneline --decorate --all'
alias gfp='git fetch --prune'
alias gtus='git status'
alias gpr='git pull --rebase'
alias gp='git push'
alias gpo='git push origin'
alias gpofwl='git push origin --force-with-lease'
alias gbr='git branch'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gskip='git update-index --skip-worktree'
alias gunskip='git update-index --no-skip-worktree'
alias grb='git rebase'
alias gst='git stash'
alias gcm='git commit'
alias gcme='git commit --allow-empty'
alias gcma='git commit --amend'
alias gcmea='git commit --allow-empty --amend'
alias greset='git restore . && git clean -df'
alias gcleanbr="git branch | grep -vE '^\*|main$|dev$' | xargs -n 1 git branch -D"
alias gcleanbrsoft="git branch | grep -vE '^\*|main$|dev$' | xargs -n 1 git branch -d"
alias src='source ~/.zshrc'

# Functions
whatp () {
  if [[ -e "yarn.lock" ]]; then echo "yarn"
  elif [[ -e "pnpm-lock.yaml" ]]; then echo "pnpm"
  elif [[ -e "bun.lockb" ]]; then echo "bun"
  elif [[ -e "package-lock.json" ]]; then echo "npm"
  else echo "Can't find lock file."
  fi
}

pci () {
  if [[ -e "yarn.lock" ]]; then yarn install --immutable "$@"
  elif [[ -e "pnpm-lock.yaml" ]]; then pnpm install --frozen-lockfile "$@"
  elif [[ -e "bun.lockb" ]]; then bun install --no-save "$@"
  elif [[ -e "package-lock.json" ]]; then npm ci "$@"
  else echo "Can't find lock file."
  fi
}

px () {
  if [[ -e "yarn.lock" ]]; then yarn exec "$@"
  elif [[ -e "pnpm-lock.yaml" ]]; then pnpm exec "$@"
  elif [[ -e "bun.lockb" ]]; then bunx "$@"
  elif [[ -e "package-lock.json" ]]; then npx "$@"
  else echo "Can't find lock file."
  fi
}

run () {
  if [[ -e "yarn.lock" ]]; then yarn run "$@"
  elif [[ -e "pnpm-lock.yaml" ]]; then pnpm run "$@"
  elif [[ -e "bun.lockb" ]]; then bun run "$@"
  elif [[ -e "package-lock.json" ]]; then npm run -- "$@"
  else echo "Can't find lock file."
  fi
}

dev () {
  run dev "$@"
}

lint () {
  run lint "$@"
}

lintf () {
  run lint --fix "$@"
}
