abstract class ApiConstants {
  static const String baseUrl = 'https://vcare.integration25.com/api/';
  static const String loginEndpoint = 'auth/login';
  static const String signUpEndpoint = '/auth/register';
  // static const String userProfileEndpoint = '/user/profile';
  // static const String updateProfileEndpoint = '/user/update';
  
  
}
class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}