FROM fpco/stack-build
MAINTAINER Michael Litchard
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install git
RUN git clone https://github.com/mlitchard/swiftfizz.git
WORKDIR /swiftfizz
RUN stack setup
RUN stack install
ENTRYPOINT ["/root/.local/bin/swiftfizz-exe"]
