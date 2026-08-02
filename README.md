# CDS Workstation - 제출 저장소 및 기술 문서

## 개요
기본 터미널 조작 및 개발 환경 구축을 연습하기 위한 자료입니다.

## 실행 환경
- OS: Debian 계열 (Dockerfile에서 python3.13-slim 사용 예시)
- Shell: dash (기본), bash 사용 가능
- Docker: 29.4.0
- Git: 2.52.0

## 수행 항목 체크리스트
- [x] 터미널 기본 조작 및 폴더 구성
- [x] 권한 변경 실습
- [x] Docker 설치/점검
- [x] hello-world 실행
- [x] Dockerfile 빌드/실행
- [x] 포트 매핑 접속(2회)
- [x] 바인드 마운트 반영
- [x] 볼륨 영속성
- [x] Git 설정 + VSCode GitHub 연동

---

## 1. 터미널 조작 로그 기록
다음 작업을 터미널로 수행하고, 명령어와 출력 결과를 기술 문서에 기록합니다.
- 현재 위치 확인
- 목록 확인(숨김 파일 포함)
- 이동, 생성, 복사, 이동/이름 변경, 삭제
- 파일 내용 확인, 빈 파일 생성

예시 명령과 결과:

현재 위치 확인
```
pwd
```
결과 예시:
```
/Users/yimiro/Desktop/cds/cds_workstation
```

목록 확인
```
ls -al
```
결과 예시:
```
total 8
drwxr-xr-x@  3 yimiro  staff   96 Jul 28 11:45 ..
drwxr-xr-x   4 yimiro  staff  128 Jul 28 11:46 .
drwxr-xr-x  14 yimiro  staff  448 Jul 28 11:50 .git
-rw-r--r--   1 yimiro  staff  372 Jul 28 11:52 README.md
```

이동
```
mv <source> <destination>
```
예시:
```
mv move_file num1_dir
```

생성
```
touch <file>    # 빈 파일 생성 또는 타임스탬프 갱신
mkdir <dir>      # 디렉토리 생성
```

복사
```
cp <source> <destination>
# 디렉토리 복사 시 -r 필요
```

이동/이름 변경 (mv 사용)
```
mv move2_file ./num1_dir/move_a_file
```

삭제
```
rm <file>
# 디렉토리 삭제 시 -r 필요
# 강제 삭제는 -f (주의)
```

파일 내용 확인
- cat: 전체 출력
- less: 스크롤 가능
- head/tail: 상/하단 일부 출력

예시:
```
cat text_5_line
less text_5_line
head -n 3 text_5_line
tail -n 3 text_5_line
```

빈 파일 생성 (중복)
```
touch <file>
```

---

## 2. 권한 실습 및 증거 기록
파일 및 디렉토리 권한을 확인·변경하고 변경 전/후를 문서화합니다.

권한 확인 예시:
```
ls -l permission_dir/permission_file
stat permission_dir/permission_file
```

권한 변경 예시:
```
# 모든 사용자에게 읽기/쓰기 권한 부여
chmod 666 permission_dir/permission_file
# 디렉토리 오너만 접근(700)
chmod 700 permission_dir
```

권한 비트 설명:
- r: 읽기 (4)
- w: 쓰기 (2)
- x: 실행 (1)
(순서: 소유자, 그룹, 기타)

---

## 3. Docker 설치 및 기본 점검
Docker 버전 및 데몬 동작 여부를 확인하고 결과를 기술 문서에 남깁니다.

예시:
```
docker --version
# Docker version 29.4.0, build 9d7ad9f

docker info
# (데몬 정보 및 플러그인 등 출력)
```

---

## 4. Docker 기본 운영 명령 수행
- 이미지: 다운로드/목록 확인 (docker pull, docker images)
- 컨테이너: 실행/중지/목록 확인 (docker run, docker ps, docker ps -a)
- 운영: 로그(docker logs), 리소스(docker stats)

예시 명령:
```
docker pull postgres:16
docker images
```

컨테이너 실행 예시:
```
docker run -d \
  --name my-postgres \
  -e POSTGRES_PASSWORD=mysecret \
  -e POSTGRES_USER=testuser \
  -e POSTGRES_DB=testdb \
  -p 5432:5432 \
  postgres:16
```

로그 확인 예시:
```
docker logs my-postgres --tail 5
```

리소스 확인:
```
docker stats
```

---

## 5. 컨테이너 실행 실습
- hello-world 실행 및 출력 기록
- ubuntu 컨테이너 실행 후 내부에서 명령 실행(ls, echo 등)
- 컨테이너의 attach/exec 차이 관찰 및 정리

예시:
```
docker run hello-world

docker run -it ubuntu bash
# 내부에서: ls, echo "test text" > ubuntu_test_file
```

attach vs exec 요약:
- exec: 새로운 쉘을 실행하여 접속, exit해도 컨테이너는 계속 실행
- attach: 기존 표준 입력/출력에 연결, exit 시 컨테이너가 종료될 수 있음

---

## 6. 기존 Dockerfile 기반 커스텀 이미지 제작
선택 예시:
- (A) 웹 서버 베이스 이미지 (NGINX/Apache) + 정적 콘텐츠/설정 교체
- (B) Linux 베이스 이미지(ubuntu/alpine) + 패키지, 사용자, 환경변수, 헬스체크 등 추가

요구사항:
- 커스텀 이미지 빌드 및 컨테이너 실행 성공
- 기술 문서에 선택한 베이스, 적용 포인트 목적, 빌드/실행 명령과 핵심 결과 포함

Dockerfile 예시:
```
FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y python3 curl && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -m appuser
USER appuser
ENV APP_PORT=8000
WORKDIR /home/appuser
RUN echo "<h1>ubuntu base custom image</h1>" > index.html
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:${APP_PORT}/ || exit 1
CMD python3 -m http.server ${APP_PORT}
```

빌드 및 실행 예시:
```
docker build -t my-ubuntu .
docker run -d -p 8000:8000 my-ubuntu
curl http://localhost:8000
```

헬스체크 출력 예시 및 컨테이너 상태도 문서화합니다.

---

## 7. 바인드 마운트 & 볼륨 영속성 검증
- 바인드 마운트: 호스트 파일 변경이 컨테이너에 반영되는지 확인
- 볼륨: 컨테이너 삭제 후에도 데이터가 유지되는지 확인

바인드 마운트 예시:
```
docker run -it -d --name bind -v $(pwd)/bind_host:/data my-ubuntu
# 컨테이너에서 /data/bind_file 확인
# 호스트에서 bind_host/bind_file 변경 후 컨테이너에서 확인
```

볼륨 예시:
```
docker volume create my-vol
docker run -it -d --name my-ubuntu-data -v my-vol:/data my-ubuntu
# 컨테이너에서 파일 생성 -> 컨테이너 삭제 -> 재생성 후 데이터 확인
``` 

---

## 8. Git 설정 및 GitHub 연동
### 기본 설정
```
git config --global user.name "your-github-username"
# (이메일은 선택)
```

### SSH 방식 (권장)
1. SSH 키 생성
   - ssh-keygen -t ed25519 -C "optional-comment" -f ~/.ssh/id_ed25519
2. 에이전트에 추가 (선택)
   - eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519
3. 공개키 복사 및 GitHub에 등록
   - cat ~/.ssh/id_ed25519.pub
4. 연결 테스트
   - ssh -T git@github.com
5. 리모트 추가 및 푸시
   - git remote add origin git@github.com:OWNER/REPO.git
   - git push -u origin main
```

### HTTPS 방식 (토큰 사용)
- 개인 액세스 토큰(PAT) 발급 후 리모트 추가 및 푸시
- credential helper 사용 권장 (macOS 예: osxkeychain)

유용한 명령:
```
git remote -v
git status
git config --list
```

---

## 보너스: Docker Compose 기초
- 문서화된 설정으로 여러 컨테이너를 한 번에 실행하고 관리할 수 있습니다.

예시 실행:
```
docker compose up -d --build
```

자주 쓰는 명령 요약:
- up: 설정대로 컨테이너 실행
- -d: 백그라운드 실행
- --build: 이미지 재빌드 후 실행
- down: 컨테이너 정리
- -v: 볼륨까지 삭제
- logs: 로그 확인 (-f 실시간, --tail N 최근 N줄)

