FROM dart:stable AS build

WORKDIR /app

COPY apps/cw_api ./apps/cw_api
COPY packages/cw_core ./packages/cw_core
COPY packages/cw_types ./packages/cw_types

WORKDIR /app/apps/cw_api
RUN dart pub get
RUN dart_frog build
RUN dart compile exe build/bin/server.dart -o /server

FROM scratch

ENV PORT=8080

COPY --from=build /runtime/ /
COPY --from=build /server /server

EXPOSE $PORT
CMD ["/server"]
