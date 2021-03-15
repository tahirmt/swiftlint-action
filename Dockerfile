# Container image that runs your code
# FROM swift:5.2.5-slim

# ARG SWIFTLINT_VERSION="0.43.0"

# RUN apt-get update && \
#     apt-get install curl && \
#     apt-get install unzip

# RUN curl -LO -v "https://github.com/realm/SwiftLint/releases/download/$SWIFTLINT_VERSION/portable_swiftlint.zip" && \
#     unzip portable_swiftlint

# # Code file to execute when the docker container starts up (`entrypoint.sh`)
# ENTRYPOINT ["/swiftlint", "lint"]

# ARG SWIFTLINT_REVISION="0.43.0"

# RUN apt-get update && \
#     apt-get install git

# ENV LINT_WORK_DIR "/swiftlint"

# RUN git clone https://github.com/realm/SwiftLint.git
# WORKDIR "SwiftLint"

# RUN git reset --hard "${SWIFTLINT_REVISION}"
# RUN git submodule update --init --recursive; make install
# RUN cd ../ && rm -rf SwiftLint

# RUN swiftlint version

# VOLUME "${LINT_WORK_DIR}"
# WORKDIR "${LINT_WORK_DIR}"

# ENTRYPOINT ["swiftlint"]

# Container image that runs your code
FROM alpine:latest

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]