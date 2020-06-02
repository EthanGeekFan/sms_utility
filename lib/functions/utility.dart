import 'package:sms/sms.dart';

Future<List<SmsMessage>> getSmsOf(String address) async {
  SmsQuery query = new SmsQuery();

  List<SmsMessage> messages = await query.querySms(
    address: address,
    kinds: [SmsQueryKind.Inbox, SmsQueryKind.Sent],
  );

  return messages;
}
