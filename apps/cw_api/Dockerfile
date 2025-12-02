FROM dart:stable AS build

WORKDIR /workspace

COPY pubspec.yaml ./pubspec.yaml
COPY packages/cw_core ./packages/cw_core
COPY packages/cw_types ./packages/cw_types
COPY apps/cw_api ./apps/cw_api

RUN dart pub global activate melos
RUN melos bootstrap --filter=apps/cw_api --ignore-missing
RUN melos run api:prod
RUN dart compile exe apps/cw_api/build/bin/server.dart -o /server

FROM scratch

ENV PORT=8080

COPY --from=build /runtime/ /
COPY --from=build /server /server

EXPOSE $PORT
CMD ["/server"]
