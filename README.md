<h1 align="center"> <p>🤗 Redis를 활용한 RAG 시스템 구축</p></h1>
<h3 align="center">
    <p>Redis with RAG (Lexical(BM25) & Semantic Search)</p>
</h3>

대표적인 NoSQL DataBase인 Redis는 최근 RediSearch 기능을 통해 VectorDB의 다양한 기능을 제공하고 있습니다. <br>
특히, Redis의 기존 장점인 빠른 검색속도와 간편한 사용방법을 유지하면서도 RedisVL과 간단한 Query를 통해<br>
Lexical Search와 Semantic Search기능을 모두 제공하며, 두가지 검색 방식을 함께 사용하는 Hybrid Search 채택 시,<br>
각 검색방식의 스코어 반영 비율 세부조정을 통해, 데이터 특성에 맞는 정확한 검색 시스템을 구축할 수 있습니다.<br>

이번 Tutorial에서는 RediSearch를 통해 아래 몇가지 Use Case를 실행하는 과정을 설명합니다.<br>

### Use Case
>1) docker-compose를 통한 redis server 실행
>2) Redis를 활용한 VectorDB 구축
>3) VectorDB(Redis Index Schema)에 정의된 필드를 활용하여 적재 데이터에 대한 CRUD 및 복합 조건 검색
>4) Embedding Model을 활용한 Semantic Search
>5) Lexcal(BM25) & Semantic Search를 함꼐 사용한 Hybrid Search 구현
<br>

### TIP
> 자세한 학습방법 및 학습코드에 대한 해설을 아래 블로그에 정리해 두었습니다.<br>
> 학습코드를 사용하기 전 아래 포스팅 내용을 꼭 한번 읽어보시기를 권장드립니다.<br>
> > * BLOG :  {...작성중...}

## Quickstart

### Redis Docker Container Setting<br>
1) Docker Compose
```bash
docker-compose up
```
2) or Docker File을 통해 직접 실행
```bash
docker build -f ./examples/redis_rag.dockerfile -t redis_rag ./examples
docker run -d -p 6379:6379 --name redis-rag redis_rag:latest
```
### Caution<br>
- Local에서 테스트 진행 시, docker를 찾을 수 없다는 오류 발생 시 (e.g. bash: docker: command not found)
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.zshrc
source ~/.zshrc
which docker # Mac 로컬 기준(homebrew)경로 확인 : /opt/homebrew/bin/docker
```