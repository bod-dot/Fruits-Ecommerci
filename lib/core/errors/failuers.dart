abstract class Failures {
  final String message;

  Failures({required this.message});
}

class ServerFailures extends Failures {
  ServerFailures({required super.message});
}
