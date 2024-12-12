FROM redis/redis-stack:latest
EXPOSE 6379
COPY redis_rag.conf /usr/local/etc/redis/redis_rag.conf
CMD ["redis-server", "/usr/local/etc/redis/redis_rag.conf"]
# Docker ps에 docker를 찾을 수 없다고 나올때...(e.g. bash: docker: command not found)
#(venv) (base) gim-wontaes-MacBook-Pro:LLMOps kim-wontae$ echo 'export PATH=$PATH:/usr/local/bin' >> ~/.zshrc
#(venv) (base) gim-wontaes-MacBook-Pro:LLMOps kim-wontae$ source ~/.zshrc
#(base) (venv) gim-wontaes-MacBook-Pro:LLMOps kim-wontae$ which docker
# 출력결과 /opt/homebrew/bin/docker <---다시 docker ps 해보면 docker 떠 있을것임

# docker build -f ./examples/redis_rag.dockerfile -t redis_rag ./examples
# docker run -d -p 6379:6379 --name redis-rag redis_rag:latest