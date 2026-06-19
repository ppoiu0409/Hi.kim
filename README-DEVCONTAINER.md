# Hi.kim — Codespaces 개발 안내

간단히 Codespaces에서 개발을 시작하는 방법입니다.

1. GitHub에서 Codespace를 열거나 로컬에서 컨테이너를 빌드하세요.
2. 컨테이너가 준비되면 터미널에서 다음을 실행하여 로컬 서버를 엽니다:

```bash
live-server --port=8080 --host=0.0.0.0
```

3. 포트 8080이 포워딩되어 있으면 브라우저에서 사이트를 확인할 수 있습니다.

추가: `ritwickdey.LiveServer` 확장도 설치되어 있어 바로 사용할 수 있습니다.

OpenAI API 연결 테스트
1. 작업공간에 `.env` 파일을 만들고 `OPENAI_API_KEY` 값을 넣습니다(또는 Codespaces Secrets 사용).
2. 테스트 스크립트를 실행합니다:

```bash
chmod +x openai_test.sh
./openai_test.sh
```

성공하면 OpenAI로부터 간단한 응답(JSON)이 출력됩니다.

Cloudflare Pages 자동 배포
1. `.github/workflows/cloudflare-pages.yml`이 `main` 브랜치 push를 감지합니다.
2. GitHub Actions가 Cloudflare Pages 프로젝트 `niceamc-ncipedu`로 정적 사이트를 배포합니다.
3. 최초 1회 Cloudflare API Token과 Account ID를 GitHub Secrets에 등록해야 합니다.

자세한 순서는 `CLOUDFLARE-SETUP.md`를 확인하세요.

변경사항 GitHub 업로드
1. 수정이 끝나면 아래 명령을 실행합니다.

```bash
./scripts/publish.sh "수정 내용 설명"
```

2. GitHub `main`에 올라가면 Cloudflare Pages 자동 배포가 이어서 실행됩니다.
