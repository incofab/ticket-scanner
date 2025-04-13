class Url {
  static const bool dev = false;
  static const String baseUrl = dev
      ? 'https://ticketapitest.shopurban.co/'
      : 'https://ticketapi.shopurban.co/';
  static const String baseApiUrl = '${baseUrl}api/';

  static const String login = "${baseApiUrl}login";
  static const String listEvents = "${baseApiUrl}events/index";
  static const String verifyTicket = "${baseApiUrl}tickets/verify";

  static String url(String url, Map<String, dynamic> params) {
    params.forEach((key, value) {
      url = url.replaceAll('{$key}', value.toString());
    });
    return url;
  }
}
