# Higher version may cause crash
# Reference: https://github.com/docker-library/mysql/issues/69
FROM mysql:5.7

# copy required files
COPY setup.sh /mysql/setup.sh
COPY blog.sql /mysql/blog.sql
COPY password.sql /mysql/password.sql

CMD ["bash", "/mysql/setup.sh"]

