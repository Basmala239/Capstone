part of 'add_meeting_cubit.dart';

abstract class AddMeetingState {}

class AddMeetingInitial extends AddMeetingState {}
class AddMeetingLoading extends AddMeetingState {}
class AddMeetingSuccess extends AddMeetingState {}
class AddMeetingError extends AddMeetingState {
  final String message;
  AddMeetingError(this.message);
}
