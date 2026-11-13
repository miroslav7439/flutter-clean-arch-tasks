
class TaskDomainException implements Exception {
  final String message;

  const TaskDomainException(this.message);

  @override
  String toString() => 'TaskDomainException: $message';
}