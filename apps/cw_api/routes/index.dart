import 'package:cw_core/cw_core.dart';
import 'package:cw_types/cw_types.dart';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: {
      'message': 'TL-CIRCULAIRE-WANDELING',
      'version': Api.version,
      'timestamp': DateTime.now().millisecondsSinceEpoch as Timestamp,
    },
  );
}
