class RepositoryHelper {
  static String handleError(Exception error) {
    if (error.toString().contains('SocketException')) {
      return 'No internet connection';
    } else if (error.toString().contains('TimeoutException')) {
      return 'Request timed out';
    } else {
      return 'Something went wrong';
    }
  }

  static T? parseResponse<T>(dynamic json, T Function(dynamic) fromJson) {
    try {
      return fromJson(json);
    } catch (e) {
      print('Parsing error: $e');
      return null;
    }
  }
}
