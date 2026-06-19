#!/usr/bin/env bash
set -euo pipefail

message="${1:-Update site}"

current_branch="$(git branch --show-current)"
if [ "$current_branch" != "main" ]; then
  echo "ERROR: main 브랜치에서 실행하세요. 현재 브랜치: $current_branch"
  exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
  echo "변경사항이 없습니다."
  exit 0
fi

git add .
git commit -m "$message"
git push origin main

echo "GitHub main 브랜치에 업로드했습니다."
