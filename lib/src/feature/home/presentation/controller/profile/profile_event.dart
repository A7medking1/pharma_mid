part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class PauseAccountEvent extends ProfileEvent {
  final BuildContext context;

  const PauseAccountEvent({
    required this.context,
  });

  @override
  List<Object> get props => [context];
}

class GetProfileImageFromGalleryEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class GetImageFromPrefEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}
class GetEmailPrefEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

