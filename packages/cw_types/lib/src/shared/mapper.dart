import 'package:either_dart/either.dart';

class TypeMapper {

  const TypeMapper._();

  static Either<String, int> asInt(dynamic value) {
    if (value == null) {
      return const Left("Parameter with name: 'value' cannot be null.");
    }

    if (value is int) {
      return Right(value);
    }

    if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) {
        return Right(parsed);
      }

      return Left("Unable to cast parameter with value: '$value' to int.");
    }

    if (value is double) {
      return Right(value.toInt());
    }

    return Left("Unable to convert type with value: '${value.runtimeType}' to int.");
  }

  static Either<String, double> asDouble(dynamic value) {
    if (value == null) {
      return const Left("Parameter with name: 'value' cannot be null.");
    }

    if (value is double) {
      return Right(value);
    }

    if (value is int) {
      return Right(value.toDouble());
    }

    if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null) {
        return Right(parsed);
      }

      return Left("Unable to cast parameter with value: '$value' to double.");
    }

    return Left("Unable to convert type with value: '${value.runtimeType}' to double.");
  }

  static Either<String, bool> asBool(dynamic value) {
    if (value == null) {
      return const Left("Parameter with name: 'value' cannot be null.");
    }

    if (value is bool) {
      return Right(value);
    }

    if (value is String) {
      final lower = value.toLowerCase().trim();
      if (lower == 'true' || lower == 'yes' || lower == '1') {
        return const Right(true);
      }

      if (lower == 'false' || lower == 'no' || lower == '0') {
        return const Right(false);
      }

      return Left("Unable to cast parameter with value: '$value' to bool.");
    }

    if (value is int) {
      if (value == 1) {
        return const Right(true);
      }

      if (value == 0) {
        return const Right(false);
      }

      return Left("Unable to cast int with value: '$value' to bool (must be 0 or 1).");
    }

    return Left("Unable to convert type with value: '${value.runtimeType}' to bool.");
  }

  static Either<String, String> asString(dynamic value) {
    if (value == null) {
      return const Left("Parameter with name: 'value' cannot be null.");
    }

    return Right(value.toString());
  }

  static Either<String, DateTime> asDateTime(dynamic value) {
    if (value == null) {
      return const Left("Parameter with name: 'value' cannot be null.");
    }

    if (value is DateTime) {
      return Right(value);
    }

    if (value is String) {
      try {
        final parsed = DateTime.parse(value);
        return Right(parsed);
      } on FormatException catch (e) {
        return Left("Unable to cast parameter with value: '$value' to DateTime: ${e.message}");
      }
    }

    if (value is int) {
      try {
        final parsed = DateTime.fromMillisecondsSinceEpoch(value);
        return Right(parsed);
      } on Exception catch (e) {
        return Left("Parameter with value: '$value' has an invalid format: $e");
      }
    }

    return Left("Unable to convert type with value: '${value.runtimeType}' to DateTime.");
  }

  static Either<String, List<T>> asList<T>(dynamic value) {
    if (value == null) {
      return const Left("Parameter with name: 'value' cannot be null.");
    }

    if (value is List) {
      try {
        final typedList = value.cast<T>(); // Throws an Exception if types don't match.
        return Right(typedList);
      } on Exception catch (e) {
        return Left('Unable to cast to List<$T>: $e');
      }
    }

    return Left("Unable to convert type with value: '${value.runtimeType}' to List<$T>.");
  }

  static Either<String, Map<K, V>> asMap<K, V>(dynamic value) {
    if (value == null) {
      return const Left("Parameter with name: 'value' cannot be null.");
    }

    if (value is Map) {
      try {
        final typedMap = value.cast<K, V>(); // Throws an Exception if types don't match.
        return Right(typedMap);
      } on Exception catch (e) {
        return Left('Unable to cast to Map<$K, $V>: $e');
      }
    }

    return Left("Unable to convert type with value: '${value.runtimeType}' to Map<$K, $V>.");
  }
}
