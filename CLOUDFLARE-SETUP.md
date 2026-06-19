# Cloudflare Pages 자동 배포 설정

목표 흐름은 아래와 같습니다.

```text
Codespaces에서 개발
-> GitHub main 브랜치에 업로드
-> GitHub Actions 실행
-> Cloudflare Pages 배포
-> 웹사이트 자동 반영
```

## 1. Cloudflare Pages 프로젝트 만들기

GitHub Actions가 `edu-nice` 프로젝트를 자동 생성하도록 설정되어 있습니다.

Cloudflare에서 직접 만들 경우:

1. Cloudflare에 로그인합니다.
2. 왼쪽 메뉴에서 `Workers & Pages`를 엽니다.
3. `Pages` 탭을 선택합니다.
4. `Create a project`를 누릅니다.
5. 프로젝트 이름을 `edu-nice`로 만듭니다.

이 저장소는 정적 HTML 사이트라 빌드 명령이 필요 없습니다.

설정값은 아래처럼 사용하면 됩니다.

```text
Project name: edu-nice
Production branch: main
Build command: 비워둠
Build output directory: .
```

## 2. Cloudflare Account ID 확인

1. Cloudflare 대시보드 오른쪽 위에서 계정을 선택합니다.
2. `Workers & Pages` 또는 계정 홈 화면으로 이동합니다.
3. 오른쪽 사이드 영역에서 `Account ID`를 복사합니다.

이 값은 GitHub Secret `CLOUDFLARE_ACCOUNT_ID`로 넣습니다.

## 3. Cloudflare API Token 만들기

1. Cloudflare 오른쪽 위 프로필 아이콘을 누릅니다.
2. `My Profile`을 엽니다.
3. `API Tokens`를 선택합니다.
4. `Create Token`을 누릅니다.
5. `Custom Token`에서 `Get started`를 선택합니다.
6. 권한에는 Pages 배포가 가능하도록 아래 권한을 포함합니다.

```text
Account - Cloudflare Pages - Edit
```

만든 토큰은 GitHub Secret `CLOUDFLARE_API_TOKEN`으로 넣습니다.

## 4. GitHub Secrets 넣기

1. GitHub 저장소 `ppoiu0409/Hi.kim`로 이동합니다.
2. `Settings`를 누릅니다.
3. 왼쪽에서 `Secrets and variables` -> `Actions`를 엽니다.
4. `New repository secret`을 누릅니다.
5. 아래 2개를 각각 추가합니다.

```text
CLOUDFLARE_ACCOUNT_ID
CLOUDFLARE_API_TOKEN
```

## 5. 자동 배포 확인

GitHub에 `main` 브랜치로 push가 되면 `.github/workflows/cloudflare-pages.yml`이 자동 실행됩니다.

확인 위치:

```text
GitHub 저장소 -> Actions -> Deploy to Cloudflare Pages
```

초록색 체크가 뜨면 Cloudflare Pages 배포가 성공한 것입니다.
