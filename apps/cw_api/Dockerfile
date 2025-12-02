FROM dart:stable AS build

WORKDIR /workspace
COPY . .

WORKDIR /workspace/apps/cw_api

RUN dart pub get
RUN dart pub global activate dart_frog_cli
ENV PATH="$PATH:/root/.pub-cache/bin"

RUN dart_frog build
RUN dart compile exe build/bin/server.dart -o /server

FROM scratch

COPY --from=build /runtime/ /

COPY --from=build /server /app/server

ENV PORT=8080
EXPOSE 8080

CMD ["/app/server"]
