2. 터미널 조작 로그 기록
    다음 작업을 터미널로 수행하고, 명령어 + 출력 결과를 기술 문서에 기록한다.
    현재 위치 확인, 목록 확인(숨김 파일 포함), 이동, 생성, 복사, 이동/이름변경, 삭제, 파일 내용 확인, 빈 파일 생성

1 - 현재 위치 확인 : pwd
루트부터 현재 위치를 표시
/Users/yimiro/Desktop/cds/cds_workstation

2 - 목록 확인 : ls -al 
현재 목록에 전체 파일 및 디렉토리를 표시
total 8
drwxr-xr-x@  3 yimiro  staff   96 Jul 28 11:45 ..
drwxr-xr-x   4 yimiro  staff  128 Jul 28 11:46 .
drwxr-xr-x  14 yimiro  staff  448 Jul 28 11:50 .git
-rw-r--r--   1 yimiro  staff  372 Jul 28 11:52 README.md

3 - 이동 : mv
이동 명령어, mv 경로_및_이동할_파일 이동할_경로_및_파일명 순으로 입력하여 이동, 위치에 따라 경로를 유동적으로 입력이나 제외가 필요
예) mv move_file num1_dir

4 - 생성 : touch, mkdir
touch: 빈 파일 생성 명령어 및 타임스탬프 갱신 명령어
예) touch file_name (파일이 없을 경우 생성, 있을 경우 타임스탬프가 갱신)
mkdir: 빈 디렉토리 생성 명령어
예) mkdir dir_name

5 - 복사 : cp
복사 명령어, cp 경로_및_복사할_파일 복사할_경로_및_파일명 순으로 입력하여 이동, 위치에 따라 경로를 유동적으로 입력이나 제외가 필요
디렉토리 이동시 -r 필요
예) cp cp_file ./num2_dir/cp1_file

6 - 이동/이름변경 : mv 활용
3번 내용 참조 (./는 생략 가능)
예) mv move2_file ./num1_dir/move_a_file

7 - 삭제: rm
디렉토리 삭제시 -r 필요
확인 없는 강제 삭제 -f 필요
강력한 주의 필요 정말로 다 지워지기 때문에
예) rm cp_file

8 - 파일 내용 확인
cat : 전체 내용 확인 
예) cat text_5_line
line 1
line 2
line 3
line 4
line 5

less : 스크롤 확인
예) less text_5_line
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

head : 상단 부분 확인 | -n 5 윗 부분부터 5줄
예) head -n 3 text_5_line
line 1
line 2
line 3

tail : 하단 부분 확인 | -n 5 하단부터 5줄 | -f 실시간 추가 내용 조회
예) tail -n 3 text_5_line
line 3
line 4
line 5

9 - 빈파일 생성 : touch
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

변경 모두 rw로 변경
chmod 666 permission_dir/permission_file
변경 전
-rw-r--r--  1 yimiro  staff  0 Jul 28 13:13 permission_dir/permission_file
변경 후
-rw-rw-rw-  1 yimiro  staff  0 Jul 28 13:13 permission_dir/permission_file