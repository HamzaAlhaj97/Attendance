import 'package:attendance_item/features/attendance/data/models/attendance_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final List<Attendance> attendance;
  AttendanceBloc({required this.attendance}) : super(LoadingState()) {
    on<AttendanceEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await Future.delayed(const Duration(seconds: 5));
        emit(LoadedState(attendance: attendance));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
