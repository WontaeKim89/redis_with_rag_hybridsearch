FROM redis/redis-stack:latest
EXPOSE 6379
COPY redis_rag.conf /usr/local/etc/redis/redis_rag.conf
CMD ["redis-server", "/usr/local/etc/redis/redis_rag.conf"]