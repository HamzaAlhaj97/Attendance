part of 'attendance_bloc.dart';

sealed class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class LoadingState extends AttendanceState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AttendanceState {
  final List<Attendance> attendance;

  const LoadedState({required this.attendance});
  @override
  List<Object> get props => [attendance];
}

class ErrorState extends AttendanceState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
