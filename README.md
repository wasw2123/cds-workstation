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
이동 명령어, mv 경로_및_이동할_객체 이동할_경로_및_객체명 순으로 입력하여 이동, 위치에 따라 경로를 유동적으로 입력이나 제외가 필요
예) mv move_file num1_dir

4 - 생성 : touch, mkdir
touch: 빈 파일 생성 명령어 및 타임스탬프 갱신 명령어
예) touch file_name (파일이 없을 경우 생성, 있을 경우 타임스탬프가 갱신)
mkdir: 빈 디렉토리 생성 명령어
예) mkdir dir_name

5 - 복사 : cp
복사 명령어, cp 경로_및_복사할_객체 복사할_경로_및_객체명 순으로 입력하여 이동, 위치에 따라 경로를 유동적으로 입력이나 제외가 필요
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