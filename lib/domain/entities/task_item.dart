import '../exceptions/task_domain_exception.dart';

/// Сутність завдання в предметній області.
class TaskItem {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  TaskItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now() {
    if (title.trim().isEmpty) {
      throw const TaskDomainException('Назва завдання не може бути порожньою.');
    }
  }

  /// Фабричний конструктор для створення нового невиконаного завдання.
  factory TaskItem.create(String title) {
    return TaskItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
    );
  }

  /// Бізнес-правило переведення завдання у статус виконаного.
  TaskItem markAsCompleted() {
    if (isCompleted) {
      throw const TaskDomainException('Завдання вже позначене як виконане.');
    }
    return TaskItem(
      id: id,
      title: title,
      isCompleted: true,
      createdAt: createdAt,
    );
  }
}