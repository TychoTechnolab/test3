FROM dart:stable AS build

WORKDIR /workspace

COPY apps/cw_api ./apps/cw_api
COPY packages/cw_core ./packages/cw_core
COPY packages/cw_types ./packages/cw_types
COPY api_pubspec.yaml ./pubspec.yaml

WORKDIR /workspace/apps/cw_api
RUN dart pub get

RUN dart pub global activate dart_frog_cli
ENV PATH="$PATH:/root/.pub-cache/bin"
RUN dart_frog build
RUN dart compile exe build/bin/server.dart -o /server

FROM scratch AS runtime

COPY --from=build /runtime/ /  # Dart runtime
COPY --from=build /server /server

EXPOSE 8080
CMD ["/server"]
