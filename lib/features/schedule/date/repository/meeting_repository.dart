import '../model/meeting_model.dart';

abstract class MeetingRepository {
  Future<void> createMeeting(MeetingModel meeting);
}
