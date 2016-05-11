FROM fpco/stack-build
MAINTAINER Michael Litchard
RUN apt-get upgrade && apt-get update
RUN apt-get install git
RUN git clone https://github.com/mlitchard/swiftfizz.git
WORKDIR /swiftfizz
RUN stack install
ENTRYPOINT ["/root/.local/bin/swiftfizz-exe"]
