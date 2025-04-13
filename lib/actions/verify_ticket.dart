import 'package:ticket_scanner/models/event.dart';
import 'package:ticket_scanner/support/prefs_handler.dart';
import 'package:ticket_scanner/util/helpers.dart';
import 'package:ticket_scanner/util/network/base_response.dart';
import 'package:ticket_scanner/util/network/network_request.dart';
import 'package:ticket_scanner/util/url.dart';

class VerifyTicket {
  static const String SLUG_VERIFIED = 'verified';
  static const String SLUG_INVALID_TICKET = 'invalid_ticket';
  static const String SLUG_ALREADY_VERIFIED = 'already_verified';

  final Event event;
  VerifyTicket(this.event);

  Future<dynamic> run({
    required int ticketPaymentId,
    required String hash,
    required Function(bool) isLoading,
  }) async {
    final res = await NetworkRequest.post<BaseResponse>(
      Url.verifyTicket,
      params: {
        'hash': hash,
        'ticket_payment_id': ticketPaymentId,
        'reference': Helpers.generateReference(),
        'event_id': event.id,
        'device_no': PrefsHandler.getDeviceId(),
      },
      isLoading: (isLoadingValue) {
        isLoading(isLoadingValue);
      },
      responseHandler: (response) async {},
      onFail: (message) => Helpers.showMessage(message),
    );
    // print(['res', res, 'slug', res['slug']]);
    return res ?? {};
  }
}
