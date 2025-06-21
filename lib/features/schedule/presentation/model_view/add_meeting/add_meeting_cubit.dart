import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../date/model/meeting_model.dart';
import '../../../date/repository/meeting_repository.dart';

part 'add_meeting_state.dart';

class AddMeetingCubit extends Cubit<AddMeetingState> {
  final MeetingRepository repository;

  AddMeetingCubit(this.repository) : super(AddMeetingInitial());

  Future<void> submitMeeting(MeetingModel meeting) async {
    if (meeting.startTime.isBefore(DateTime.now())) {
      emit(AddMeetingError("Start time must be in the future."));
      return;
    }

    emit(AddMeetingLoading());
    try {
      await repository.createMeeting(meeting);
      emit(AddMeetingSuccess());
    } catch (e) {
      emit(AddMeetingError(e.toString()));
    }
  }
}
