FROM examos/grader-base
MAINTAINER Konekoe team dockerhub@examos.fi

# Set timezone
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update package cache and install make
RUN apt-get update && apt-get -y install build-essential valgrind python3