class DioServiceError {
  DioServiceError({
    this.needRetry,
    this.isSuccess,
    this.message,
  });

  bool? needRetry;
  bool? isSuccess;
  String? message;
}
