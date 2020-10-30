FROM examos/grader-base
MAINTAINER Konekoe team dockerhub@examos.fi

# Set timezone
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update package cache and install make
RUN apt-get update && apt-get -y install build-essential valgrind python3

# Add the gcheck sources to the grader, build and copy the shared lib over
COPY gcheck/ /opt/grader/gcheck
RUN cd /opt/grader/gcheck/ && make shared && cp /opt/grader/gcheck/lib/libgcheck.so /usr/lib/libgcheck.so && \
	mkdir -p /usr/include/gcheck && cp -R /opt/grader/gcheck/include/gcheck /usr/include