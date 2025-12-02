FROM dart:stable AS build

WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN dart pub global activate dart_frog_cli
RUN dart pub global run dart_frog_cli:dart_frog build

# Ensure packages are still up-to-date if anything has changed.
RUN dart pub get --offline
RUN dart compile exe build/bin/server.dart -o build/bin/server

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/build/bin/server /app/bin/
# Uncomment the following line if you are serving static files.
# COPY --from=build /app/build/public /public/

# Start the server.
CMD ["/app/bin/server"]








#FROM dart:stable AS build
#
#WORKDIR /app
#
#COPY apps/cw_api ./apps/cw_api
#COPY packages/cw_core ./packages/cw_core
#COPY packages/cw_types ./packages/cw_types
#
#WORKDIR /app/apps/cw_api
#RUN dart pub get
#RUN dart_frog build
#RUN dart compile exe build/bin/server.dart -o /server
#
#FROM scratch
#
#ENV PORT=8080
#
#COPY --from=build /runtime/ /
#COPY --from=build /server /server
#
#EXPOSE $PORT
#CMD ["/server"]
