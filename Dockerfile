FROM cirrusci/flutter:beta AS boke

RUN useradd --user-group --create-home --system --skel /dev/null --home-dir /app cirrus
RUN export PUB_HOSTED_URL=https://pub.flutter-io.cn
RUN export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
WORKDIR /app
RUN sudo chown -R cirrus:cirrus /app
RUN flutter config --enable-web
COPY lib /app/lib
COPY assets /app/assets
COPY plugins /app/plugins
COPY web /app/web
COPY pubspec.yaml /app/pubspec.yaml

RUN flutter build web  -v

FROM nginx
EXPOSE 80
COPY --from=boke /app/build/web /usr/share/nginx/html