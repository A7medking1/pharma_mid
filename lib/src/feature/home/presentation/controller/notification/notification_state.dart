part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class GetNotificationLoading extends NotificationState {}

class GetNotificationSuccess extends NotificationState {}


class RemoveALlNotificationSuccess extends NotificationState {}
class RemoveNotificationSuccess extends NotificationState {}


class GetError extends NotificationState {}
