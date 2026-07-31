### 1. 제출 저장소 및 기술 문서
*프로젝트 개요*
기본 터미널 조작 및 개발 환경을 구축

*실행환경*
OS : Debian # 리눅스 기반 운영체제 dockerfile에서 python3.13-slim으로 베이스 이미지를 사용하면 설치되는 os
Shell : 기본값 dash, bash도 사용 가능
docker version: 29.4.0
git version: 2.52.0

*수행항목 체크리스트*
- [x] 터미널 기본 조작 및 폴더 구성
- [x] 권한 변경 실습
- [x] Docker 설치/점검
- [x] hello-world 실행
- [x] Dockerfile 빌드/실행
- [x] 포트 매핑 접속(2회)
- [x] 바인드 마운트 반영
- [x] 볼륨 영속성
- [x] Git 설정 + VSCode GitHub 연동


### 2. 터미널 조작 로그 기록
    다음 작업을 터미널로 수행하고, 명령어 + 출력 결과를 기술 문서에 기록한다.
    현재 위치 확인, 목록 확인(숨김 파일 포함), 이동, 생성, 복사, 이동/이름변경, 삭제, 파일 내용 확인, 빈 파일 생성

1 - 현재 위치 확인 : 
```
pwd
```
루트부터 현재 위치를 표시
```
/Users/yimiro/Desktop/cds/cds_workstation
```

2 - 목록 확인
```
ls -al 
```
현재 목록에 전체 파일 및 디렉토리를 표시
```
total 8
drwxr-xr-x@  3 yimiro  staff   96 Jul 28 11:45 ..
drwxr-xr-x   4 yimiro  staff  128 Jul 28 11:46 .
drwxr-xr-x  14 yimiro  staff  448 Jul 28 11:50 .git
-rw-r--r--   1 yimiro  staff  372 Jul 28 11:52 README.md
```

3 - 이동
```
mv
```
이동 명령어, mv 경로_및_이동할_파일 이동할_경로_및_파일명 순으로 입력하여 이동, 위치에 따라 경로를 유동적으로 입력이나 제외가 필요
```
#예)
mv move_file num1_dir
```


4 - 생성 :
```
touch # 빈 파일 생성 명령어 및 타임스탬프 갱신 명령어
mkdir # 빈 디렉토리 생성 명령어
```
```
touch file_name # 파일이 없을 경우 생성, 있을 경우 타임스탬프가 갱신
mkdir dir_name
```

5 - 복사
```
cp
```
복사 명령어, cp 경로_및_복사할_파일 복사할_경로_및_파일명 순으로 입력하여 이동, 위치에 따라 경로를 유동적으로 입력이나 제외가 필요
디렉토리 이동시 -r 필요
```
# 예)
cp cp_file ./num2_dir/cp1_file
```

6 - 이동/이름변경 : mv 활용
3번 내용 참조 (./는 생략 가능)
```
# 예) 
mv move2_file ./num1_dir/move_a_file
```

7 - 삭제
```
rm
```
디렉토리 삭제시 -r 필요
확인 없는 강제 삭제 -f 필요
강력한 주의 필요 정말로 다 지워지기 때문에
```
# 예)
rm cp_file
```

8 - 파일 내용 확인
cat : 전체 내용 확인 
```
# 명령어
cat text_5_line
# 결과
line 1
line 2
line 3
line 4
line 5
```

less : 스크롤을 할 수 있게 확인
```
# 명령어 
less text_5_line

# 결과
line 1
line 2
line 3
line 4
line 5
~
~
~
~
~
~
(END)
```

head : 상단 부분 확인 | -n 5 윗 부분부터 5줄
```
# 명령어
head -n 3 text_5_line

# 결과 
line 1
line 2
line 3
```

tail : 하단 부분 확인 | -n 5 하단부터 5줄 | -f 실시간 추가 내용 조회
```
# 명령어
tail -n 3 text_5_line
# 결과
line 3
line 4
line 5
```

9 - 빈파일 생성 : 
```
touch
```
4번 내용과 동일

### 3. 권한 실습 및 증거 기록
권한을 확인/변경하는 명령을 수행하고, 변경 전/후 비교를 기술 문서에 남긴다.
최소 요구: 파일 1개, 디렉토리 1개에 대해 권한 변경 실험을 수행한다.

권한 확인 방법
*ls -l 개체명*
ls -l permission_dir/permission_file 
-rw-r--r--  1 yimiro  staff  0 Jul 28 13:13 permission_dir/permission_file

*stat 개체명*
stat permission_dir/permission_file 
16777233 36777845 -rw-r--r-- 1 yimiro staff 0 0 "Jul 28 13:13:57 2026" "Jul 28 13:13:57 2026" "Jul 28 13:14:38 2026" "Jul 28 13:13:57 2026" 4096 0 0 permission_dir/permission_file

*숨김파일 포함해서 전체 보기*
ls -al
total 16
drwxr-xr-x   8 yimiro  staff   256 Jul 28 13:14 .
drwxr-xr-x@  3 yimiro  staff    96 Jul 28 11:45 ..
drwxr-xr-x  14 yimiro  staff   448 Jul 28 13:10 .git
-rw-r--r--   1 yimiro  staff  2928 Jul 28 16:01 README.md
drwxr-xr-x   5 yimiro  staff   160 Jul 28 12:17 num1_dir
drwxr-xr-x   3 yimiro  staff    96 Jul 28 12:06 num2_dir
drwxr-xr-x   3 yimiro  staff    96 Jul 28 13:14 permission_dir
-rw-r--r--   1 yimiro  staff    35 Jul 28 12:47 text_5_line


권한 변경 명령어 chmod 옵션 파일명
옵션 설명
r - 읽기(목록 표시 및 내부 코드를 읽을 수 있는 권한) 표시 4
w - 쓰기(내부 코드를 작성하고 수정할 수 있는 권한) 표시 2
x - 실행(프로그램을 프로세스에 올려서 실행 가능한 권한) 표시 1

옵션 순서 : 오너, 그룹, 기타
필요한 권한만큼 숫자를 더해서 옵션에 입력
예) 오너 rwx 그외 rx 일때 chmod 755 파일명

권한 변경 파일 모두 rw로 변경
chmod 666 permission_dir/permission_file
변경 전
-rw-r--r--  1 yimiro  staff  0 Jul 28 13:13 permission_dir/permission_file
변경 후
-rw-rw-rw-  1 yimiro  staff  0 Jul 28 13:13 permission_dir/permission_file

권한 변경 디렉토리 사용자만 rwx 나머지 모두 접근 불가
chmod 700 permission_dir
변경 전
drwxr-xr-x  3 yimiro  staff    96 Jul 28 13:14 permission_dir
변경 후
drwx------  3 yimiro  staff    96 Jul 28 13:14 permission_dir


### 4. Docker 설치 및 기본 점검
Docker 버전 확인 결과를 기록한다. (docker --version)
Docker 데몬 동작 여부 확인 결과를 기록한다. (docker info 또는 동등 점검)

```
# 명령어
docker --version

# 결과
Docker version 29.4.0, build 9d7ad9f
```
```
# 명령어
docker info

# 결과
Client:
 Version:    29.4.0
 Context:    orbstack
 Debug Mode: false
 Plugins:
  agent: Docker AI Agent Runner (Docker Inc.)
    Version:  v1.32.4
    Path:     /Users/yimiro/.docker/cli-plugins/docker-agent
  ai: Docker AI Agent - Ask Gordon (Docker Inc.)
  --중간 생략--
```

### 5. Docker 기본 운영 명령 수행
이미지: 다운로드/목록 확인 (예: docker images)
컨테이너: 실행/중지/목록 확인 (예: docker ps, docker ps -a)
운영: 로그 확인 (예: docker logs), 리소스 확인 (예: docker stats)
수행 명령과 출력 결과를 기술 문서에 남긴다.

```
# 다운로드
docker pull postgres:16

# 목록 확인
docker images

# 결과
IMAGE         ID             DISK USAGE   CONTENT SIZE   EXTRA
postgres:16   eb9fe6b58155        474MB             0B    U   
```


```
# 컨테이너 실행
docker run -d \
  --name my-postgres \
  -e POSTGRES_PASSWORD=mysecret \
  -e POSTGRES_USER=testuser \
  -e POSTGRES_DB=testdb \
  -p 5432:5432 \
  postgres:16
```

```
# 컨테이너 목록 확인
docker ps # 현재 실행중인 컨테이너
docker ps -a # 종료된 컨테이너 포함 전체

CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                                         NAMES
026c3caefe99   postgres:16   "docker-entrypoint.s…"   15 minutes ago   Up 15 minutes   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp   my-postgres
```

```
# 컨테이너 중지
docker stop my-postgres

# 결과
my-postgres
```

```
# 로그 확인
docker logs my-postgres --tail 5
# 도커, 명령어, 컨테이너, 옵션

# 결과
2026-07-28 22:53:59.704 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2026-07-28 22:53:59.706 UTC [64] LOG:  database system was shut down at 2026-07-28 22:53:59 UTC
2026-07-28 22:53:59.707 UTC [1] LOG:  database system is ready to accept connections
2026-07-28 22:58:59.811 UTC [62] LOG:  checkpoint starting: time
2026-07-28 22:59:04.217 UTC [62] LOG:  checkpoint complete: wrote 45 buffers (0.3%); 0 WAL file(s) added, 0 removed, 0 recycled; write=4.368 s, sync=0.023 s, total=4.406 s; sync files=12, longest=0.007 s, average=0.002 s; distance=260 kB, estimate=260 kB; lsn=0/1960498, redo lsn=0/1960460
```

```
# 도커 리소스 확인
docker stats


# Result
CONTAINER ID   NAME          CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
026c3caefe99   my-postgres   0.60%     19.95MiB / 11.73GiB   0.17%     1.66kB / 126B   349MB / 59.3MB   6
```


### 6. 컨테이너 실행 실습
hello-world 실행 성공을 기록한다.
ubuntu 컨테이너를 실행하고 내부 진입 후 간단 명령(예: ls, echo) 수행 결과를 기록한다.
컨테이너 종료/유지(attach/exec 등)의 차이를 스스로 관찰하고 간단히 정리한다.

```
# hello-world 실행
docker run hello-world

# 결과물
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (arm64v8)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

```
docker images

# Result
IMAGE                ID             DISK USAGE   CONTENT SIZE   EXTRA
hello-world:latest   eb84fdc6f2a3        5.2kB             0B    U   
postgres:16          eb9fe6b58155        474MB             0B    U   
```

```
docker ps -a

# Result
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS                      PORTS     NAMES
89167479ab90   hello-world   "/hello"                 11 minutes ago   Exited (0) 11 minutes ago             xenodochial_stonebraker
98b46ddb2178   hello-world   "/hello"                 30 minutes ago   Exited (0) 30 minutes ago             admiring_tharp
026c3caefe99   postgres:16   "docker-entrypoint.s…"   2 hours ago      Exited (0) 29 minutes ago             my-postgres
```


```
# ubuntu 컨테이너
docker run -it ubuntu bash

# Discription
bash: 리눅스 쉘에 접근
-i: 키보드 입력을 컨테이너 안의 bash까지 전달하기 위해 사용
-t: 출력을 현재 터미널로 전달 받기 위해서 사용

# Result
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
55237ac9880d: Pull complete 
693710ba2039: Pull complete 
Digest: sha256:3131b4cc82a783df6c9df078f86e01819a13594b865c2cad47bd1bca2b7063bb
Status: Downloaded newer image for ubuntu:latest
root@4f2d03e65179:/# 
```

```
# 우분투 간단 명령 사용 및 결과
# 파일 목록 조회
ls

# Result
bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var


# 파일 생성 및 목록 조회
echo "test text" > ubuntu_test_file
ls  

# Result
bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  ubuntu_test_file  usr  var

# 내용 조회
cat ubuntu_test_file 

# Result
test text
```

```
# 컨테이너 유지 종료 차이
# 도커 백그라운드 실행
docker run -it -d --name test_u ubuntu bash

# 도커 컨테이너 확인
docker ps

# Result
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS          PORTS     NAMES
dffe773928e2   ubuntu    "bash"    25 seconds ago   Up 20 seconds             test_u

# exec 접근
docker exec -it test_u bash

# 간단한 명령어 실행
ls

# Result
bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

# 종료 및 상태 확인
exit, docker ps

# Result
CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS         PORTS     NAMES
dffe773928e2   ubuntu    "bash"    5 minutes ago   Up 5 minutes             test_u

# attach로 접근
docker attach test_u

# 간단한 명령어 실행
bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

# 종료 및 상태 확인
exit, docker ps

# Result
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

# exec로 접근하면 exit으로 나와도 해당 컨테이너는 백그라운드에서 작동
# attach로 접근하면 exit으로 나왔을 때 해당 컨테이너는 종료

# 종료된 컨테이너까지 확인
docker ps -a

# Result
CONTAINER ID   IMAGE         COMMAND                  CREATED             STATUS                          PORTS     NAMES
dffe773928e2   ubuntu        "bash"                   11 minutes ago      Exited (0) About a minute ago             test_u
4f2d03e65179   ubuntu        "bash"                   29 minutes ago      Exited (0) 14 minutes ago                 brave_gauss
89167479ab90   hello-world   "/hello"                 50 minutes ago      Exited (0) 50 minutes ago                 xenodochial_stonebraker
98b46ddb2178   hello-world   "/hello"                 About an hour ago   Exited (0) About an hour ago              admiring_tharp
026c3caefe99   postgres:16   "docker-entrypoint.s…"   2 hours ago         Exited (0) About an hour ago              my-postgres
```

### 7. 기존 Dockerfile 기반 커스텀 이미지 제작
아래 방식 중 하나를 선택하여 기존 Dockerfile/이미지 기반의 커스텀 이미지를 만든다.
(A) 웹 서버 베이스 이미지 활용(예: NGINX/Apache 등) + 정적 콘텐츠/설정만 교체
(B) Linux 베이스 이미지(예: ubuntu/alpine 등) + 기본 기능(패키지/사용자/환경변수/헬스체크 등) 추가
제작 결과는 아래 조건을 만족해야 한다.
커스텀 이미지 빌드 성공 및 컨테이너 실행 성공
기술 문서에 다음을 포함한다.
어떤 “기존 베이스(이미지/예시 Dockerfile)”를 선택했는지
내가 적용한 커스텀 포인트 각각의 목적(간단 요약)
빌드/실행 명령 + 핵심 결과(출력/스크린샷)

```
FROM ubuntu:22.04
# 기본 베이스 이미지 우분투는 순수 os와 루트 유저만 존재

RUN apt-get update && \ # 받을 수 있는 패키지 목록 갱신
    apt-get install -y python3 curl && \ # -y 물음에 yes 체크, python curl 패키지 설치
    rm -rf /var/lib/apt/lists/* # update를 하면서 생긴 목록 삭제

RUN useradd -m appuser # 유저 생성
USER appuser # 유저 변경
# 보안을 위해 유저를 생성하고 변경함으로 루트 계정만이 할 수 있는 기능 제외
# 시스템파일 삭제, 변경이나 특정 포트 사용 등이 제한된다

ENV APP_PORT=8000 # 환경변수에 포트 추가

WORKDIR /home/appuser # 작업 공간
RUN echo "<h1>ubuntu base custom image</h1>" > index.html # html문서 생성

HEALTHCHECK --interval=30s --timeout=3s \ # 헬스체크 실행 및 주기 설정
    CMD curl -f http://localhost:${APP_PORT}/ || exit 1 # 어떤 명령으로 체크할지 입력 -f 에러일 때 실패로 처리 및 호출이 불가할 때 실패 처리

CMD python3 -m http.server ${APP_PORT} # 서버실행: 환경변수에 있는 포트로 서버 동작
```

```
# 도커 빌드 명령어
docker build -t my-ubuntu .
# 도커, 빌드 명령어, 이름생성 옵션, 이름, 도커파일 경로

# Result
[+] Building 1.5s (9/9) FINISHED                                                docker:orbstack
 => [internal] load build definition from Dockerfile                                       0.0s
 => => transferring dockerfile: 430B                                                       0.0s
 => [internal] load metadata for docker.io/library/ubuntu:22.04                            1.4s
 => [internal] load .dockerignore                                                          0.0s
 => => transferring context: 2B                                                            0.0s
 => [1/5] FROM docker.io/library/ubuntu:22.04@sha256:0e0a0fc6d18feda9db1590da249ac93e8d5a  0.0s
 => CACHED [2/5] RUN apt-get update &&     apt-get install -y python3 curl &&     rm -rf   0.0s
 => CACHED [3/5] RUN useradd -m appuser                                                    0.0s
 => CACHED [4/5] WORKDIR /home/appuser                                                     0.0s
 => CACHED [5/5] RUN echo "<h1>ubuntu base custom image</h1>" > index.html                 0.0s
 => exporting to image                                                                     0.0s
 => => exporting layers                                                                    0.0s
 => => writing image sha256:219a3812e6247819a95e6c78a056b2691d15173cd67a018b0a4d31934ade0  0.0s
 => => naming to docker.io/library/my-ubuntu                                               0.0s

 1 warning found (use docker --debug to expand):
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 18)

View build details: docker-desktop://dashboard/build/orbstack/orbstack/l2sy81ehjnph0xrbjtmr1bi4s
```

```
# 생성된 이미지 목록 확인
docker images

# Result
IMAGE                ID             DISK USAGE   CONTENT SIZE   EXTRA
hello-world:latest   eb84fdc6f2a3        5.2kB             0B    U   
my-ubuntu:latest     219a3812e624        105MB             0B    U   
postgres:16          eb9fe6b58155        474MB             0B    U   
ubuntu:latest        9238bf8bb4a4        120MB             0B    U   

```

포트 접속 확인
```
# 실행
docker run -d -p 8000:8000 my-ubuntu
```
![localhost 접속하여 확인](https://github.com/user-attachments/assets/e25ba2f3-6ce8-4810-8bfb-ade5c7313e98)

```
# curl 실행
curl http://localhost:8000
```
![curl로 실행 확인](https://github.com/user-attachments/assets/538c5bde-4a0c-4c9e-9161-432f311dffb8)

```
# 헬스체크 확인
cds_workstation (main) $ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS                             PORTS                                         NAMES
5670228b6eb6   my-ubuntu   "/bin/sh -c 'python3…"   21 seconds ago   Up 20 seconds (health: starting)   0.0.0.0:8000->8000/tcp, [::]:8000->8000/tcp   nifty_galois
cds_workstation (main) $ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED              STATUS                        PORTS                                         NAMES
5670228b6eb6   my-ubuntu   "/bin/sh -c 'python3…"   About a minute ago   Up About a minute (healthy)   0.0.0.0:8000->8000/tcp, [::]:8000->8000/tcp   nifty_galois
cds_workstation (main) $ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS                    PORTS                                         NAMES
5670228b6eb6   my-ubuntu   "/bin/sh -c 'python3…"   27 minutes ago   Up 27 minutes (healthy)   0.0.0.0:8000->8000/tcp, [::]:8000->8000/tcp   nifty_galois
```

### Docker 바인드 마운트 & 볼륨 영속성 검증
Docker 볼륨을 생성하고 컨테이너에 연결한다.
컨테이너 삭제 전/후로 데이터를 확인하여 데이터가 유지됨을 증명한다.
기술 문서에 생성/연결/검증 절차(명령+출력)를 포함한다.

```
# 바인드 테스트용 컨테이너 실행
docker run -it -d --name bind -v $(pwd)/bind_host:/data my-ubuntu

docker exec -it bind bash # 컨테이너 접근

cat /data/bind_file 
before

호스트로 이동 후 변경
echo "after" > bind_host/bind_file

# 컨테이너 재 진입 후 확인
cat /data/bind_file 
after
```



```
# docker 볼륨 생성 및 컨테이너 실행
docker volume create my-vol
docker run -it -d --name my-ubuntu-data -v my-vol:/data my-ubuntu
```

```
# 컨테이너 접속 및 데이터 생성, 확인
cds_workstation (main) $ docker exec -ti my-ubuntu-data bash
appuser@dc27757aee1a:~$ ls
index.html
root@135b13589d1b:/data# ls
new_file_1
root@135b13589d1b:/data# cat new_file_1 
new file 1
```

컨테이너 삭제
![컨테이너 삭제](https://github.com/user-attachments/assets/906ec91e-5af5-4c78-8898-872cb2b7c1f2)

컨테이너 재생성 및 데이터 확인 
```
cds_workstation (main) $ docker run -it -d --name new-ubuntu -v my-vol:/data my-ubuntu
98777e6c244e4e2067c993ed2ed8306621148acc2490d77a18e51dbb96dc0c56
cds_workstation (main) $ docker exec -it new-ubuntu bash    
appuser@98777e6c244e:/data$ ls
new_file_1
appuser@98777e6c244e:/data$ cat new_file_1 
new file 1

docker volume ls
DRIVER    VOLUME NAME
local     1fd46b7710cb81319b2d75c5a5db8c89480ee397093c1cf8bedd3843cef3e0bf
local     df57ff209d9b7b997090e7081808e66606e54feef04ddb9cf25de54a4c34abd4
local     my-vol

docker volume inspect my-vol
[
    {
        "CreatedAt": "2026-07-30T09:43:27+09:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/my-vol/_data",
        "Name": "my-vol",
        "Options": null,
        "Scope": "local"
    }
]
```

### Git 설정 및 Github 연동
```
git config --list
credential.helper=osxkeychain
user.name=yimiro
user.email= #이메일이 입력돼 있었으나 제거함
core.excludesfile=/Users/yimiro/.gitignore_global
difftool.sourcetree.cmd=opendiff "$LOCAL" "$REMOTE"
difftool.sourcetree.path=
mergetool.sourcetree.cmd=/Applications/Sourcetree.app/Contents/Resources/opendiff-w.sh "$LOCAL""$REMOTE" -ancestor "$BASE" -merge "$MERGED"
mergetool.sourcetree.trustexitcode=true
init.defaultbranch=main
alias.lg=log --oneline --graph --all --decorate
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
core.precomposeunicode=true
remote.origin.url=git@github.com:wasw2123/cds-workstation.git
:
```


## 보너스
### docker compose 기초
*문서화된 실행 설정으로 바뀌는 이유*
명령어로 실행을 한다면 복잡한 설정을 매번 작성해야하고 한번에 1개씩 따로 생성해야함
반면 문서화를 한다면 여러개를 한번에 명령어로 실행시킬 수 있고 설정또한 파일에 보관되며
깃을 통해 히스토리를 관리할 수 있다.

```
docker compose up -d --build

[+] Building 1.4s (16/16) FINISHED
 => [internal] load local bake definitions           0.0s
 => => reading from stdin 538B                       0.0s
 => [internal] load build definition from Dockerfil  0.0s
 => => transferring dockerfile: 369B                 0.0s
 => [internal] load metadata for docker.io/library/  0.7s
 => [internal] load metadata for ghcr.io/astral-sh/  0.7s
 => [internal] load .dockerignore                    0.0s
 => => transferring context: 2B                      0.0s
 => [stage-0 1/7] FROM docker.io/library/python:3.1  0.0s
 => [internal] load build context                    0.1s
 => => transferring context: 195.90kB                0.1s
 => FROM ghcr.io/astral-sh/uv:0.11@sha256:77280f2f7  0.0s
 => CACHED [stage-0 2/7] WORKDIR /app                0.0s
 => CACHED [stage-0 3/7] COPY --from=ghcr.io/astral  0.0s
 => CACHED [stage-0 4/7] COPY pyproject.toml uv.loc  0.0s
 => CACHED [stage-0 5/7] RUN uv sync --frozen --no-  0.0s
 => [stage-0 6/7] COPY . .                           0.2s
 => [stage-0 7/7] RUN chmod +x entrypoint.sh         0.1s
 => exporting to image                               0.1s
 => => exporting layers                              0.1s
 => => writing image sha256:dc6e719903b5e802827c019  0.0s
 => => naming to docker.io/library/cds_workstation-  0.0s
 => resolving provenance for metadata file           0.0s
[+] up 8/8
 ✔ Image cds_workstation-app            Built         1.4s
 ✔ Network cds_workstation_default      Created       0.0s
 ✔ Volume cds_workstation_postgres_data Created       0.0s
 ✔ Volume cds_workstation_caddy_data    Created       0.0s
 ✔ Volume cds_workstation_caddy_config  Created       0.0s
 ✔ Container cds_workstation-db-1       Healthy       5.6s
 ✔ Container cds_workstation-app-1      Healthy      11.2s
 ✔ Container cds_workstation-caddy-1    Started      11.2s
```

![도커 실행 환경](https://github.com/user-attachments/assets/b1a4164c-7fb4-4a94-bc90-31b108a65526)

```
# caddy로 접속하여 app(fastapi와 통신)
docker compose exec caddy wget -qO- http://app:8000/health
{"status":"ok"}
```

# docker compose 명령어
up: docker compose 내에 설정대로 실행
-d 백그라운드 실행
--build 이미지를 새로 빌드한 후 실행
--force-recreate 강제 재생성

down 컨테이너 삭제
-v 볼륨까지 삭제 (db 데이터 제거)

logs 로그 확인
(logs 개체명을 입력할 경우) 개체명에 대한 로그만 확인
-f 실시간 로그 확인
--tail 100 최근 100줄의 로그 확인


```
#도커 컴포즈 컨테이너 현황 파악
docker compose ps

NAME                      IMAGE                 COMMAND                  SERVICE   CREATED          STATUS                    PORTS
cds_workstation-app-1     cds_workstation-app   "./entrypoint.sh"        app       25 minutes ago   Up 25 minutes (healthy)   8000/tcp
cds_workstation-caddy-1   caddy:2-alpine        "caddy run --config …"   caddy     25 minutes ago   Up 25 minutes             0.0.0.0:80->80/tcp, [::]:80->80/tcp, 0.0.0.0:443->443/tcp, [::]:443->443/tcp, 443/udp, 2019/tcp
cds_workstation-db-1      postgres:16           "docker-entrypoint.s…"   db        25 minutes ago   Up 25 minutes (healthy)   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp
```

```
# docker 사용량 체크
docker stats 

CONTAINER ID   NAME                      CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O        PIDS
b2d32f39ad0b   cds_workstation-caddy-1   0.00%     13.52MiB / 11.73GiB   0.11%     2.95kB / 2.23kB   517MB / 303kB    13
3b97c405d984   cds_workstation-app-1     0.18%     75.25MiB / 11.73GiB   0.63%     2.02kB / 1.29kB   167MB / 14.5MB   22
08be99e0c374   cds_workstation-db-1      0.00%     19.81MiB / 11.73GiB   0.16%     2.05kB / 126B     221MB / 59.7MB   6

```

*상태 확인 루틴*
docker compose ps 로 서버가 정상동작 중인지 확인
docker compose logs 로 재시작 혹은 문제가 있었는지 확인

문제있을 경우 우선 해결

docker stats 사용량 체크 후 상황에 따라 대응

*HTTPS와 SSH방식의 차이*
HTTPS는 푸시할 때 토큰과 비밀번호를 받음
SSH는 특정 키 파일을 만들고 깃허브에 등록 이후 키를 통해 인증

*변경 확인*
```
 ssh -T git@github.com
 
Hi wasw2123! You've successfully authenticated, but GitHub does not provide shell access.
```

### 트러블 슈팅

1. 특정 터미널 복귀 조작 명령어
#### 문제
docker stats, up 등 터미널을 통해 실시간으로 진행상황이나 로그를 볼 때 복귀 명령어를 알 수 없음

#### 원인
실시간으로 현황을 표시하기에 복귀 명령어를 제외하곤 입력이 안되며 표기가 안돼 알 수 없음

#### 해결
전체 통일은 안 돼 있지만 q, exit, control + c, esc등 통상적으로 지원을 한다
만약 없을 경우 ai에게 물어보거나 추가 터미널 실행으로 향후 작업을 이어갈 수 있음


2. 볼륨 마운트 권한 문제
#### 문제
도커파일로 보안을 위해 신규 유저를 생성 후 미션을 위해 호스트에서 생성하였고 신규 컨테이너를 만들어서 볼륨에 접근 후 파일 수정을 하려했으나 권한이 755로 설정돼 있어 수정이 불가하였음

#### 원인
외부에서 접근하여 파일을 수정할 경우 시스템 다운 등 문제가 발생할 수 있음 이를 막기위한 권한이지만 이번 미션 수행을 제한됨

#### 해결
수정과 확인을 할 수 있는 쓰기 읽기 권한을 부여하는 방법으로 해결하였음

3. AI네이토를 통한 평가 문제
#### 문제
도커파일로 보안을 위해 신규 유저를 생성 후 미션을 위해 호스트에서 생성하였고 신규 컨테이너를 만들어서 볼륨에 접근 후 파일 수정을 하려했으나 권한이 755로 설정돼 있어 수정이 불가하였음

#### 원인
외부에서 접근하여 파일을 수정할 경우 시스템 다운 등 문제가 발생할 수 있음 이를 막기위한 권한이지만 이번 미션 수행을 제한됨

#### 해결
수정과 확인을 할 수 있는 쓰기 읽기 권한을 부여하는 방법으로 해결하였음