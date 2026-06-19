#!/usr/bin/env bash
set -e

if [ -z "$OPENAI_API_KEY" ]; then
  echo "ERROR: OPENAI_API_KEY 환경변수가 설정되어 있지 않습니다."
  echo "1) 터미널에 직접 설정: export OPENAI_API_KEY=your_key"
  echo "2) 또는 Codespaces Secrets에 키를 추가하세요."
  exit 1
fi

echo "OpenAI 연결 테스트 시작..."

curl -s -X POST https://api.openai.com/v1/chat/completions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [{"role": "user", "content": "안녕하세요 — 연결 테스트입니다."}],
    "max_tokens": 80
  }'

echo
