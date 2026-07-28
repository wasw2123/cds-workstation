2. 터미널 조작 로그 기록
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

less : 스크롤 확인
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

3. 권한 실습 및 증거 기록
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


4. Docker 설치 및 기본 점검
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

5. Docker 기본 운영 명령 수행
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
