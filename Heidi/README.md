# Issue Tracker iOS

이슈관리 서비스 iOS 앱

## 단계별 구현 내용

### 로그인 기능 구현

> [PR #12 [Heidi] Sign In with GitHub 구현][pr12]

* 로그인 화면 구성
* 다크모드 지원
* GitHub OAuth를 활용한 회원가입 구현
* GitHubAuthTask 테스트 작성

**실행 결과**

![oauth](ScreenShots/oauth.png)

#### 개선한 내용

* 테스트코드 가독성 개선 및 하드코딩 줄임
* 네트워크 에러 alert 추가
* 인증 실패할 경우 에러 핸들링을 위해 Failure handler 추가

[pr12]: https://github.com/codesquad-member-2020/issue-tracker-11/pull/12

