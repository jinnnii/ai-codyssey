# 과제1: 내 컴퓨터에 개발자용 '작업실' 꾸미기

## 1. 프로젝트 개요

이번 미션은 로컬 개발 환경과 서버 환경의 일관성을 유지하고, 컨테이너화된 서버 인프라 구동 및 데이터 영속성을 검증하는 것을 목표로 합니다.

- 주요 미션 목표:
    1.  CLI(Git Bash, Ubuntu 등) 기본 명령어 및 권한 체계 검증
    2.  Docker 버전 및 상태 진단, 기본 명령어 제어
    3.  커스텀 Dockerfile 기반 웹서버 이미지 빌드 및 구동
    4.  Docker compose 멀티 컨테이너 통합 관리 및 구동
    5.  포트포워딩을 통한 컨테이너 실행 및 접속 테스트
    6.  마운트를 통한 호스트-컨테이너 파일 동기화 검증
    7.  볼륨 기반 컨테이너 삭제 전/후 데이터 영속성 검증
    8.  Git/Github 연동

## 2. 실행 환경

- OS: Window 11 Home
- Shell : Git Bash
- Docker Engine: 28.4.0
- Git: 2.49.0.windows.1

## 3. 수행 항목 체크리스트

### 1. 실행 환경 및 버전 기록

- [ ] **[환경] 도구 버전 확인**: `git --version`, `docker --version` 명령어로 설치 버전 기록

### 2. 터미널(CLI) 기본 조작

- [ ] **[터미널] 현재 위치 및 목록 확인**: `pwd`로 현재 디렉토리 확인 및 `ls -la`로 숨김 파일 포함 목록 출력 확인
- [ ] **[터미널] 디렉토리 및 파일 제어**: `mkdir -p`로 작업 폴더 생성, `touch`로 빈 파일 생성, `cp`/`mv`로 복사 및 이동·이름 변경 수행
- [ ] **[터미널] 경로 이해**: 절대 경로와 상대 경로의 차이를 인지하고 이동 명령어(`cd`) 수행

### 3. 파일 권한 실습

- [ ] **[권한] 파일 권한 변경 및 검증**: 파일 1개에 대해 `chmod 644` 적용 후 `ls -l`로 `rw-r--r--` 권한 변경 전후 비교 기록
- [ ] **[권한] 디렉토리 권한 변경 및 검증**: 디렉토리 1개에 대해 `chmod 755` 적용 후 `ls -l`로 `rwxr-xr-x` 권한 변경 전후 비교 기록

### 4. Docker 설치 및 데몬 점검

- [ ] **[Docker] 엔진 상태 점검**: `docker --version` 및 `docker info`를 통해 데몬 정상 동작 확인

### 5. Docker 기본 운영 명령 수행

- [ ] **[Docker] 이미지 관리**: `docker images` 및 이미지 다운로드 목록 확인
- [ ] **[Docker] 컨테이너 생명주기 관리**: `docker ps`, `docker ps -a`로 상태 확인 및 중지·삭제 수행
- [ ] **[Docker] 모니터링 및 로그**: `docker logs` 및 `docker stats` 실행

### 6. 컨테이너 실행 및 격리 실습

- [ ] **[컨테이너] hello-world 실행**: `docker run hello-world` 성공 로그 기록
- [ ] **[컨테이너] Ubuntu 인터랙티브 실행**: `docker run -it ubuntu bash`로 컨테이너 내부 진입 후 `ls`, `echo` 명령어 실행 및 탈출 관찰

### 7. Dockerfile 기반 커스텀 이미지 제작

- [ ] **[Dockerfile] 파일 작성**: NGINX(또는 Alpine/Ubuntu 등) 베이스 이미지 선택 및 설정 작성
- [ ] **[Dockerfile] 빌드 및 실행**: `docker build -t <이미지명>:<태그> .` 명령어로 커스텀 이미지 빌드 성공 확인

### 8. 포트 매핑 및 브라우저 접속 증거

- [ ] **[네트워크] 포트 매핑 실행**: `-p <호스트포트>:<컨테이너포트>` 옵션을 이용해 서로 다른 포트(예: 8080, 8081)로 컨테이너 2개 이상 실행
- [ ] **[네트워크] 접속 증거 확보**: 브라우저 주소창(포트 포함)과 응답 화면(또는 `curl` 응답 결과) 스크린샷/로그 첨부

### 9. 바인드 마운트 및 볼륨 영속성 검증

- [ ] **[스토리지] 바인드 마운트 검증**: 호스트의 소스 파일 변경 시 컨테이너 내부(웹 화면)에 실시간 반영되는지 확인
- [ ] **[스토리지] Docker 볼륨 생성 및 연결**: `docker volume create`로 볼륨 생성 후 컨테이너에 `-v` 옵션으로 마운트 -> docker compose 에 옵션 정의
- [ ] **[스토리지] 데이터 영속성 증거**: 컨테이너 삭제 전/후로 데이터가 유실되지 않고 새 컨테이너에서 유지되는지 확인

### 10. Git 설정 및 GitHub 연동

- [ ] **[Git/GitHub] 사용자 및 브랜치 설정**: `git config` 설정 후 `git config --list` 결과 기록
- [ ] **[Git/GitHub] 원격 저장소 연동**: GitHub에 Public Repository 생성 후 로컬 저장소 연결 및 초기 코드 푸시 완료 증거 남기기

### 11. 보너스 과제(선택)

- [ ] docker-compose.yml 단일 서비스 실행 및 검증
- [ ] 웹 서버 + 보조 API 서비스 연결 및 서비스 디스커버리 확인
- [ ] Docker Compose up, down, ps, logs 모니터링 관찰
- [ ] .env 파일을 활용한 포트 및 실행 모드 주입

## 4. 디렉토리 구조

```
ai-codyssey/
├── app/
│   └── src/
│       └── index.html      # 기본 웹 소스 파일이자, 호스트-컨테이너 바인드 마운트용 소스 파일
│       └── main.html       # 복사, 이름변경/이동 테스트 파일
├── logs/
│   └── mission_1.txt          # 전체 실행 로그 (CLI 수행 결과 기록)
├── Dockerfile              # Nginx 커스텀 이미지 빌드 파일
├── docker-compose.yml      # 도커 컴포즈 파일
└── .env                    # 환경 변수 설정 파일
```

## 5. 단계별 수행 검증 로그

- 전체 실행 로그:

### 1. 실행 환경 및 버전 기록

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ git --version
git version 2.49.0.windows.1

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker --version
Docker version 28.4.0, build d8eb465
```

### 2. 터미널(CLI) 기본 조작

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ pwd
/d/02.Projects/17.codyssey

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ mkdir -p app/src

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ touch app/src/index.html

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ vi app/src/index.html

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ cat app/src/index.html
<h1>Hello Codyssey!</h1>

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ cp app/src/index.html app/src/copy.html

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ mv app/src/copy.html app/src/main.html

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ ls -al app/src
total 2
drwxr-xr-x 1 jinnnii 197121  0 Nov  5 12:17 ./
drwxr-xr-x 1 jinnnii 197121  0 Nov  5 12:16 ../
-rw-r--r-- 1 jinnnii 197121 25 Nov  5 12:16 index.html
-rw-r--r-- 1 jinnnii 197121 25 Nov  5 12:17 main.html

```

#### ※ 절대 경로 vs 상대경로

- 절대 경로: 최상위 루트 디렉토리에서 시작하는 고유한 전체 주소
    - Windows: C 나 D 드라이브에서 시작, `\` 으로 경로 표현, `D:\\Users\Admin\Documents\test.py`
    - Linux/MacOS: `/` 으로 경로 시작 및 표현, `/home/admin/test.py`
    - 예시: `vi /home/admin/test.py`
- 상대경로: 현재 위치한 디렉토리 기준으로 한 주소
    - 현재 디렉토리: `./`
    - 상위 디렉토리: `../`
    - 예시: `vi ./test.py`

### 3. 파일 권한 실습

- 기존 파일
    - 생성자: 읽기, 쓰기, 실행
    - 그룹: 읽기, 실행
    - 기타: 읽기, 실행
- 변경 파일: 파일 자체가 실행파일이 아닌, 코드파일이므로 권한을 다음과 같이 변경
    - 생성자: 읽기, 쓰기, 실행
    - 그룹: 읽기, 쓰기
    - 기타: 읽기, 쓰기

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker exec -it compose-web-1 sh
/ # ls -al /usr/share/nginx/html
total 20
drwxr-xr-x    1 root     root          4096 Nov  5 03:12 .
drwxr-xr-x    1 root     root          4096 Oct 21 22:47 ..
-rw-r--r--    1 root     root           497 Oct 21 17:54 50x.html
-rwxr-xr-x    1 root     root            25 Nov  5 03:08 index.html
-rwxr-xr-x    1 root     root            25 Nov  5 03:08 main.html
/ # chmod -R 644 /usr/share/nginx/html
/ # ls -al /usr/share/nginx/html
total 28
drw-r--r--    1 root     root          4096 Nov  5 03:12 .
drwxr-xr-x    1 root     root          4096 Oct 21 22:47 ..
-rw-r--r--    1 root     root           497 Oct 21 17:54 50x.html
-rw-r--r--    1 root     root            25 Nov  5 03:08 index.html
-rw-r--r--    1 root     root            25 Nov  5 03:08 main.html
/ # chmod 755 /usr/share/nginx/html
/ # ls -al /usr/share/nginx/html
total 28
drwxr-xr-x    1 root     root          4096 Nov  5 03:12 .
drwxr-xr-x    1 root     root          4096 Oct 21 22:47 ..
-rw-r--r--    1 root     root           497 Oct 21 17:54 50x.html
-rw-r--r--    1 root     root            25 Nov  5 03:08 index.html
-rw-r--r--    1 root     root            25 Nov  5 03:08 main.html
/ # ls -ld /usr/share/nginx/html
drwxr-xr-x    1 root     root          4096 Nov  5 03:12 /usr/share/nginx/html
/ # ls -l /usr/share/nginx/html/index.html
-rw-r--r--    1 root     root            25 Nov  5 03:08 /usr/share/nginx/html/index.html
```

#### ※ 파일 권한

- 권한 자리의 의미
    - 첫번째: 나(Owner), 이 파일을 만든 본인(소유자)의 권한
    - 두번째: 그룹(Group), 나와 같은 그룹원들의 권한
    - 세번째: 기타(Others), 그 외 다른 사람들의 권한
- 권한 숫자의 의미
    - 읽기/쓰기/실행의 이진수 > 십진수 숫자
    - 실행 = 읽기:0, 쓰기:0, 실행:1 = 001 = 1
    - 쓰기 = 읽기:0, 쓰기:1, 실행:0 = 010 = 2
    - 읽기 = 읽기:1, 쓰기:0, 실행:0 = 100 = 4
- 자주 쓰는 숫자 조합
    - `755`: 7(읽기+쓰기+실행), 5(읽기+실행), 5(읽기+실행)
        - 보통 `폴더` 에서 많이 사용, 파일에서 실행은 프로그램 실행이지만, 폴더에서의 실행은 폴더로 들어갈 수 있느냐(cd) 이기 때문
    - `644`: 6(읽기+쓰기), 4(읽기), 4(읽기)
        - 보통 `파일` 에서 많이 사용
    - `777`/`666`: 보안상 매우 위험하므로, 상용에서는 사용하지 않음
- 권한 보기
    - `ls -al`
    - `d`: 맨 처음 문자, 디렉토리의 약자, 일반 파일일 경우 (`-`) 로 표시
    - `rwx`: 읽기+쓰기+실행
    - 예시) `-rw-r--r--`: `-` + `rw-` + `r--` + `r--` (파일, 읽기/쓰기, 읽기, 읽기)

### 4. Docker 설치 및 데몬 점검

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker --version
Docker version 28.4.0, build d8eb465

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker info
Client:
 Version:    28.4.0
 Context:    desktop-linux
 Debug Mode: false
 Plugins:
  ai: Docker AI Agent - Ask Gordon (Docker Inc.)
    Version:  v1.9.11
    Path:     C:\Program Files\Docker\cli-plugins\docker-ai.exe
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.28.0-desktop.1
    Path:     C:\Program Files\Docker\cli-plugins\docker-buildx.exe
  cloud: Docker Cloud (Docker Inc.)
    Version:  v0.4.27
    Path:     C:\Program Files\Docker\cli-plugins\docker-cloud.exe
  compose: Docker Compose (Docker Inc.)
    Version:  v2.39.2-desktop.1
    Path:     C:\Program Files\Docker\cli-plugins\docker-compose.exe
  debug: Get a shell into any image or container (Docker Inc.)
    Version:  0.0.42
    Path:     C:\Program Files\Docker\cli-plugins\docker-debug.exe
  desktop: Docker Desktop commands (Docker Inc.)
    Version:  v0.2.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-desktop.exe
  extension: Manages Docker extensions (Docker Inc.)
    Version:  v0.2.31
    Path:     C:\Program Files\Docker\cli-plugins\docker-extension.exe
  init: Creates Docker-related starter files for your project (Docker Inc.)
    Version:  v1.4.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-init.exe
  mcp: Docker MCP Plugin (Docker Inc.)
    Version:  v0.18.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-mcp.exe
  model: Docker Model Runner (Docker Inc.)
    Version:  v0.1.40
    Path:     C:\Program Files\Docker\cli-plugins\docker-model.exe
  sbom: View the packaged-based Software Bill Of Materials (SBOM) for an image (Anchore Inc.)
    Version:  0.6.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-sbom.exe
  scout: Docker Scout (Docker Inc.)
    Version:  v1.18.3
    Path:     C:\Program Files\Docker\cli-plugins\docker-scout.exe

Server:
 Containers: 9
  Running: 6
  Paused: 0
  Stopped: 3
 Images: 13
 Server Version: 28.4.0
 Storage Driver: overlayfs
  driver-type: io.containerd.snapshotter.v1
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Discovered Devices:
...(생략)
```

### 5. Docker 기본 운영 명령 수행

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker images
REPOSITORY                    TAG         IMAGE ID       CREATED         SIZE
my-custom-nginx               1.0         ee7b611c1d6c   6 minutes ago   93.6MB
python                        3.12-slim   b18b261e1b49   8 days ago      177MB
cloudflare/cloudflared        latest      9b49eed8f628   4 weeks ago     97.6MB
gvenzl/oracle-free            latest      7ed34d0ade89   2 months ago    4.07GB
hello-world                   latest      c567b231f656   7 months ago    20.4kB
redis                         latest      acb90ced0bd7   14 months ago   200MB
provectuslabs/kafka-ui        latest      8f2ff02d64b0   2 years ago     449MB
confluentinc/cp-kafka         7.6.0       24cdd3a7fa89   2 years ago     1.31GB
confluentinc/cp-kafka         7.5.0       fbbb6fa11b25   3 years ago     1.33GB
mariadb                       10.4.24     988c5e2073c8   4 years ago     552MB
ngrok/ngrok                   latest      14d80d083e5b   56 years ago    418MB
ubuntu                        latest      6a06111c3b0a   56 years ago    159MB

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker ps
CONTAINER ID   IMAGE                           COMMAND                   CREATED        STATUS        PORTS                                             NAMES
c3f2f1c85cda   provectuslabs/kafka-ui:latest   "/bin/sh -c 'java --…"   5 months ago   Up 26 hours   0.0.0.0:8989->8080/tcp, [::]:8989->8080/tcp       local-kafka-ui
1ff81457f493   confluentinc/cp-kafka:7.5.0     "/etc/confluent/dock…"   5 months ago   Up 26 hours   0.0.0.0:9094->9094/tcp, [::]:9094->9094/tcp       local-kafka2
62d475f27754   confluentinc/cp-kafka:7.5.0     "/etc/confluent/dock…"   5 months ago   Up 26 hours   0.0.0.0:9092->9092/tcp, [::]:9092->9092/tcp       local-kafka1
ba269a89fd29   redis:latest                    "docker-entrypoint.s…"   5 months ago   Up 26 hours   6379/tcp                                          01redis-redis-slave-1
afc98d5e6df0   redis:latest                    "docker-entrypoint.s…"   6 months ago   Up 26 hours   0.0.0.0:26379->26379/tcp, [::]:26379->26379/tcp   01redis-redis-sentinel-1
85335e144c63   redis:latest                    "docker-entrypoint.s…"   6 months ago   Up 26 hours   0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp       redis-master

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker ps -a
CONTAINER ID   IMAGE                           COMMAND                   CREATED              STATUS                          PORTS
                NAMES
a4204fc8e26a   ubuntu                          "bash"                    About a minute ago   Exited (0) About a minute ago
                boring_shaw
ed9bdc1e05fa   hello-world                     "/hello"                  About a minute ago   Exited (0) About a minute ago
                thirsty_tu
52f39b05f583   mariadb:10.4.24                 "docker-entrypoint.s…"   7 days ago           Exited (0) 2 days ago
f2a26590d5d3   gvenzl/oracle-free              "container-entrypoin…"   8 weeks ago          Exited (255) 3 weeks ago        0.0.0.0:1521->1521/tcp
               oracle-temp
c3f2f1c85cda   provectuslabs/kafka-ui:latest   "/bin/sh -c 'java --…"   5 months ago         Up 26 hours                     0.0.0.0:8989->8080/tcp, [::]:8989->8080/tcp       local-kafka-ui
1ff81457f493   confluentinc/cp-kafka:7.5.0     "/etc/confluent/dock…"   5 months ago         Up 26 hours                     0.0.0.0:9094->9094/tcp, [::]:9094->9094/tcp       local-kafka2
62d475f27754   confluentinc/cp-kafka:7.5.0     "/etc/confluent/dock…"   5 months ago         Up 26 hours                     0.0.0.0:9092->9092/tcp, [::]:9092->9092/tcp       local-kafka1
ba269a89fd29   redis:latest                    "docker-entrypoint.s…"   5 months ago         Up 26 hours                     6379/tcp
               01redis-redis-slave-1
afc98d5e6df0   redis:latest                    "docker-entrypoint.s…"   6 months ago         Up 26 hours                     0.0.0.0:26379->26379/tcp, [::]:26379->26379/tcp   01redis-redis-sentinel-1
85335e144c63   redis:latest                    "docker-entrypoint.s…"   6 months ago         Up 26 hours                     0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp       redis-master

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker rm -f ed9bdc1e05fa
ed9bdc1e05fa

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker stats --no-stream
CONTAINER ID   NAME                       CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
c3f2f1c85cda   local-kafka-ui             0.12%     718.8MiB / 15.35GiB   4.57%     61.7MB / 6.84MB   97.8MB / 21.5MB   87
1ff81457f493   local-kafka2               1.00%     1.174GiB / 15.35GiB   7.65%     17.7MB / 42.2MB   130MB / 1.18GB    114
62d475f27754   local-kafka1               1.09%     1.18GiB / 15.35GiB    7.68%     19.1MB / 56.4MB   140MB / 1.03GB    112
ba269a89fd29   01redis-redis-slave-1      0.27%     6.32MiB / 15.35GiB    0.04%     24.1MB / 13.3MB   422kB / 47.1MB    6
afc98d5e6df0   01redis-redis-sentinel-1   0.48%     3.535MiB / 15.35GiB   0.02%     20kB / 13.8kB     299kB / 4.1kB     6
85335e144c63   redis-master               0.29%     11.8MiB / 15.35GiB    0.08%     46.9MB / 1.12GB   28.6MB / 47MB     6
```

#### ※ Docker Images: 이미지 목록

- TAG: 이미지의 버전, 동일한 이름의 이미지라도, 태그를 통해 배포 버전을 다르게 관리할 수 있음
- IMAGE ID: 이미지의 고유 식별자
- CREATED: 이미지가 빌드된 시점, 최신 빌드 여부 확인

#### ※ Docker Containers: 컨테이너 목록

- STATUS: 컨테이너 상태(Up: 실행 중, Exited: 종료)
- NAMES: 컨테이너 별칭, 직접 지정하지 않으면 무작위로 생성되며, Container ID 대신 사용이 가능
- PORTS: 호스트와 컨테이너 간의 포트포워딩 연결 정보

#### ※ Docker Images vs Container

- Image: 애플리케이션 실행에 필요한 모든 환경이 포함된 **읽기전용** 스냅샷 (정적 상태)
- Container: 이미지를 실행한 **런타임 인스턴스**. 쓰기 가능한 레이어가 추가된 상태 (동적 상태)
-

### 6. 컨테이너 실행 및 격리 실습

- hello-world

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
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

- ubuntu(Linux)

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker run -it ubuntu bash
root@a4204fc8e26a:/# ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr
root@a4204fc8e26a:/# echo "hello world"
hello world
root@a4204fc8e26a:/# exit
exit
```

**※ hello-world 동작 원리:**

1. Docker 클라이언트가 데몬에 요청
2. 데몬이 로컬에 이미지가 없으면 Docker Hub에서 Pull
3. 이미지를 기반으로 컨테이너 생성
4. 컨테이너 내부 실행 결과를 터미널로 출력.

### 7. Dockerfile 기반 커스텀 이미지 제작

- Dockerfile
- `Dockerfile` 파일 생성 및 내용:

```Dockerfile
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ vi Dockerfile

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ cat Dockerfile
# 기초 도커 이미지
FROM nginx:alpine
# 도커 이미지 라벨(타이틀) 설정
LABEL org.opencontainers.image.title="my-custom-nginx"
# 컨테이너에서 사용되는 환경 변수 설정
ENV APP_ENV=dev
COPY ./app/src /usr/share/nginx/html
```

- 빌드 수행:

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker build -t my-custom-nginx:1.0 .
[+] Building 2.2s (7/7) FINISHED                           docker:desktop-linux
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 290B                                       0.0s
 => [internal] load metadata for docker.io/library/nginx:alpine            1.3s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [internal] load build context                                          0.1s
 => => transferring context: 195B                                          0.0s
 => [1/2] FROM docker.io/library/nginx:alpine@sha256:785835ea65db4bba6f02  0.1s
 => => resolve docker.io/library/nginx:alpine@sha256:785835ea65db4bba6f02  0.1s
 => CACHED [2/2] COPY ./app/src /usr/share/nginx/html                      0.0s
 => exporting to image                                                     0.3s
 => => exporting layers                                                    0.0s
 => => exporting manifest sha256:bbd9df7960c567c84fb484ed9314fd440259b42d  0.0s
 => => exporting config sha256:c91f222682c0fef96b97ebbbd6ac2378f7c62b9ba3  0.0s
 => => exporting attestation manifest sha256:a797d7f6bf9b3c23db2fb3083026  0.1s
 => => exporting manifest list sha256:ee7b611c1d6c8dab33f8cbf61d47b0bed18  0.0s
 => => naming to docker.io/library/my-custom-nginx:1.0                     0.0s
 => => unpacking to docker.io/library/my-custom-nginx:1.0                  0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/z2tq59dndie5e089o9uga47cy

```

#### ※ Dockerfile 이미지 태그

- `1.0` 등 명시적으로 버전 태그를 달아두는 경우, 변경 이력을 관리하기에 안전
- `latest` 태그만 사용될 경우, 나중에 이미지가 업데이트되었을 때 어떤 버전이 실행 중인지 파악하기 어렵고, 롤백이 불가능해짐

#### ※ Dockerfile 빌드 캐시 활용

- 도커는 빌드 시, 변경되지 않은 파일에 대해 재사용을하여 빌드 속도를 줄임 (캐싱)
- 그러나, 최신 상태를 강제로 반영해야할 때는 빌드 명령어에 `--no-cahce` 옵션을 추가

### 8. 포트 매핑 및 브라우저 접속 증거

- 도커 컴포즈 파일(docker-compose.yml) 을 통해 웹 서비스 2개를 서로 다른 포트로 매핑하여 구동 및 검증

1. `.env` 파일로 환경 변수 설정:

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ vi .env

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ cat .env
WEB_PORT1=8888
WEB_PORT2=8889
APP_MODE=dev

```

2.  `docker-compose.yml` 설정정:

```yml
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ vi docker-compose.yml

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ cat docker-compose.yml
version: '3.8'
services:
  web-service-1:
    image: my-custom-nginx:1.0
    container_name: compose-web-1
    ports:
      - "${WEB_PORT1:-8081}:80"
    environment:
      - NODE_ENV=${APP_MODE}
    networks:
      - app-network
  web-service-2:
    image: nginx:alpine
    container_name: compose-web-2
    ports:
      - "${WEB_PORT2:-8082}:80"
    networks:
      - app-network
    volumes:
      - ./app/src:/usr/share/nginx/html
networks:
  app-network:
    driver: bridge
```

3. 도커 컴포즈 파일 실행:

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker compose up -d
time="2026-11-05T12:24:24+09:00" level=warning msg="D:\\02.Projects\\17.codyssey\\docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion"
[+] Running 1/1
 ✔ web-service-2 Pulled                                                    2.1s
[+] Running 3/3
 ✔ Network 17codyssey_app-network  Cre...                                  0.1s
 ✔ Container compose-web-2         Started                                 0.7s
 ✔ Container compose-web-1         Started                                 0.7s

```

- 도커 컴포즈 명령:

```bash

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker compose ps
time="2026-11-05T12:24:34+09:00" level=warning msg="D:\\02.Projects\\17.codyssey\\docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion"
NAME            IMAGE                 COMMAND                   SERVICE
CREATED         STATUS         PORTS
compose-web-1   my-custom-nginx:1.0   "/docker-entrypoint.…"   web-service-1   7 seconds ago   Up 6 seconds   0.0.0.0:8888->80/tcp, [::]:8888->80/tcp
compose-web-2   nginx:alpine          "/docker-entrypoint.…"   web-service-2   7 seconds ago   Up 6 seconds   0.0.0.0:8889->80/tcp, [::]:8889->80/tcp

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker compose logs
time="2026-11-05T12:24:47+09:00" level=warning msg="D:\\02.Projects\\17.codyssey\\docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion"
compose-web-2  | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
compose-web-2  | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
compose-web-2  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
compose-web-2  | 10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
compose-web-2  | 10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
compose-web-2  | /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
compose-web-2  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
(생략)
```

4. 웹 서버 접속 테스트 (컨테이너 간 접속, 80번):

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ docker exec -it compose-web-1 sh
/ # wget -qO- http://compose-web-2
<h1>Hello Codyssey!</h1>
/ # wget -qO- http://compose-web-1
<h1>Hello Codyssey!</h1>
/ # exit
```

5. 웹 서버 접속 테스트 (호스트-컨테이너 접속, 8888번 , 8889번):

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ curl -s http://localhost:8888
<h1>Hello Codyssey!</h1>

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ curl -s http://localhost:8889
<h1>Hello Codyssey!</h1>
```

#### ※ 포트 매핑 (=포트 포워딩)

- 도커 컨테이너는 가상 서버안에서 실행되므로, 외부(내 PC, 호스트)에서 컨테이너 내부의 서비스에 접속하려면 포워딩이 필요
- 예를 들어, 컨테이너 내부의 80번 포트와 내 PC의 8080번 포트로 연결을 해야, 내 PC의 localhost:8080 으로 접속했을 때, 컨테이너 안의 웹서버(80)로 연결된다.

#### ※ 포트 사용 전 사전 점검

- 도커 컨테이너에 포트를 할당하기 전, 호스트 PC 에서 해당 포트(예:8888) 가 이미 사용 중인지 확인해야함
- 특정 포트를 점유 중인 프로세스 확인:

```bash
jinnnii@USERO MINGW64 /d/02.Projects/17.codyssey (main)
$ netstat -ano | findstr 8888
  TCP    0.0.0.0:8888           0.0.0.0:0              FIN_WAIT_1      32060
  TCP    [::]:8888              [::]:0                 FIN_WAIT_1      32060
```

- 점유 중인 프로세스 강제 종료:

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ kill -9 32060
```

#### ※ 네트워크 종류

- `bridge`: 독립된 가상 공유기(네트워크 대역), 포트포워딩이 필수, 내 컴퓨터 내부 컨테이너끼리들만 통신 가능
- `host`: 실제 공유기(네트워크 대역) , 포트포워딩없이 내 PC포트를 그대로 사용
- `none`: 외부와 완전 격리
- `overlay`: 여러 대의 서로 다른 물리 서버에 물린 컨테이너들을 묶어주는 네트워크(대규모)

### 9. 바인드 마운트 및 볼륨 영속성 검증

- 마찬가지로 도커 컴포즈 파일(docker-compose.yml) 을 통해 바인드 마운트 설정을 진행했고, 파일 수정 시 실시간 반영 확인
- 도커 컴포즈 파일 내용 발췌:

```yaml
web-service-2:
    volumes:
        - ./app/src:/usr/share/nginx/html
```

- 마운트된 파일 내용 변경:

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ vi app/src/index.html

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ cat app/src/index.html
<h1>Hello Codyssey! with docker</h1>
```

- 웹 서버 변동 테스트:

```bash
# web-service-1
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ curl -s http://localhost:8888
<h1>Hello Codyssey!</h1>

# web-service-2
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ curl -s http://localhost:8889
<h1>Hello Codyssey! with docker</h1>

```

#### ※ 볼륨 영속성

- 도커 컨테이너는 삭제되면 그 안의 데이터도 같이 사라진다는 '휘발성' 특징이 있다.
- 이때, 데이터를 영구적으로 보관하기 위해 볼륨을 사용

#### ※ 명시적 볼륨 설정

- 바운드 마운트 외에 도커가 직접 관리하는 Named Volume 을 사용할 수도 있다.
- 도커 볼륨 생성:

```bash
$ docker volume create my-volume
```

- 볼륨 마운트 설정 및 컨테이너 실행

```bash
$ docker run -d --name compose-web-2 -v my-volume:/usr/share/nginx/html

# 또는 yaml 에서
volumes:
  my-volume:
    external: true # 이미 생성된 볼륨 사용 시
```

### 10. Git 설정 및 GitHub 연동

```bash
jinnnii@USER MINGW64 /d/02.Projects/17.codyssey
$ git clone https://github.com/jinnnii/ai-codyssey.git .
Cloning into '.'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (3/3), done.

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ git config --global user.name "jinnnii"

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ git config --global user.email "jinnnii@naver.com"

jinnnii@USER MINGW64 /d/02.Projects/17.codyssey (main)
$ git config --list
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=schannel
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
user.email=jinnnii@naver.com
user.name=jinnnii
init.defaultbranch=main
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true

```

#### ※ Git 과 Github 차이

- Git: 로컬 버전 관리 도구, 내 컴퓨터 안에서 파일의 변경 이력을 기록, 관리
- Github: 원격 협업 플랫폼, Git 으로 관리하는 프로젝트를 올릴 수 있는 클라우드 서비스

## 6. 트러블슈팅 (Troubleshooting)

### 이슈 1. `git clone` 시 마침표(`.`) 붙였을 때 기존 파일로 인한 클론 실패

- **현상:** `git clone <URL> .` 명령어로 현재 작업 디렉터리에 직접 클론을 시도했으나, `fatal: destination path '.' already exists and is not an empty directory` 에러가 발생하며 클론이 진행되지 않음.
- **원인:** Git은 마침표(`.`)를 이용해 현재 디렉터리에 직접 클론할 때, 해당 디렉터리가 완벽히 비어있는 상태여야만 안전하게 파일들을 풀도록 안전 장치가 되어 있음. 기존에 생성해둔 폴더나 숨김 파일 등이 존재하여 발생.
- **해결:** 작업 중이던 기존 폴더 내부의 불필요한 파일을 정리하여 완전히 빈 디렉터리로 만든 후, `git clone <URL> .`을 다시 실행하여 정상적으로 로컬 저장소를 동기화함.

### 이슈 2. `docker-compose.yml` 작성 시 배열 항목의 `-` 누락 구문 에러

- **현상:** `docker compose up -d` 구동 시 YAML 파싱 오류가 발생하며 컨테이너가 정상적으로 구동되지 않음.
- **원인:** `docker-compose.yml` 내에서 여러 개를 정의해야 하는 속성들(예: `ports`, `volumes`, `networks` 등)은 YAML 스펙상 리스트 형태인 대시(`-`) 기호로 작성해야 하나, 단일 문자열로 작성하여 구문 해석 실패함.
- **해결:** 리스트 형태가 필요한 속성 하단에 대시(`-`) 포맷을 올바르게 기입하여 리스트 배열 형태로 구문을 정정함.

    ```yaml
    # [수정 전]
    ports: "8888:80"

    # [수정 후]
    ports:
      - "8888:80"
    ```
