FROM apploversoftwarehouse/android-cicd:latest
LABEL maintainer="Applover Software House <docker-hub@applover.pl>"

ENV FLUTTER_HOME "/flutter"
ENV PATH "$PATH:$FLUTTER_HOME/bin"

RUN git clone https://github.com/flutter/flutter.git -b 2.5.0 --depth 1 && \
    flutter config --no-analytics && flutter precache && \
    flutter config --android-sdk $ANDROID_HOME && flutter doctor -v && \
    bundle update && gem install danger-flutter_lint
