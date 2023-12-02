abstract class Failure {
  final String message;
  Failure(this.message);
  @override
  String toString() {
    return message;
  }
}

class RemoteServerFailure extends Failure {
  RemoteServerFailure(super.message);
}
