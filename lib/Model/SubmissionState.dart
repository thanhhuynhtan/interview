abstract class SubmissionState {
  const SubmissionState();
}

class InitialSubmissionState extends SubmissionState {
  const InitialSubmissionState();
}

class SubmissionLoading extends SubmissionState {}

class SubmissionSuccess extends SubmissionState {}

class SubmissionFailed extends SubmissionState {
  final Exception exception;

  SubmissionFailed(this.exception);
}
