import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:election_app/utils/globalVariables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:twilio/twilio.dart';

part 'presidential_event.dart';
part 'presidential_state.dart';

final storage = const FlutterSecureStorage();
final String accountSid = "AC2be90d382b1dd94267518c9411e23636";
final String authToken = "89e20b90f5fdd82af955556c70267ccd";
final String twilioNumber = "+12314032879";
late Twilio twilio;

class PresidentialBloc extends Bloc<PresidentialEvent, PresidentialState> {
  PresidentialBloc() : super(PresidentialInitial()) {
    on<FetchCandidates>(fetchCandidates);
    on<NewVoteEvent>(newVoteEvent);
  }

  Future<FutureOr<void>> fetchCandidates(
      FetchCandidates event, Emitter<PresidentialState> emit) async {
    emit(LoadingState());
    var urlPrefix = GlobalVariables.urlPrefix;
    final url = Uri.parse('$urlPrefix/api/get-all-candidates');
    var token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print("url##: $url");
      print("json##: $json");
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
    }
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data is List<dynamic>) {
        List candidates = data;
        emit(CandidatesFetchedState(candidates));
      } else {
        emit(NoCandidatesState());
      }
    }
  }

  Future<FutureOr<void>> newVoteEvent(
      NewVoteEvent event, Emitter<PresidentialState> emit) async {
    var urlPrefix = GlobalVariables.urlPrefix;
    final url = Uri.parse('$urlPrefix/api/new-vote');

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final linuxInfo = await deviceInfo.linuxInfo;
    String? deviceId = linuxInfo.machineId;

    var countyId = await storage.read(key: "county_id");
    var constituencyId = await storage.read(key: "constituency_id");
    var wardId = await storage.read(key: "ward_id");
    var pollingStationId = await storage.read(key: "polling_station_id");
    var txid=generateTransactionID(deviceId);
    final json = jsonEncode([
      {
        "txid":txid ,
        "nodeId": deviceId,
        "candidateId": event.candidate_id,
        "county_id": int.parse(countyId!),
        "constituency_id": int.parse(constituencyId!),
        "ward_id": int.parse(wardId!),
        "polling_station_id": int.parse(pollingStationId!),
      }
    ]);

    final response = await http.post(url, body: json);
    if (kDebugMode) {
      print("url##: $url");
      print("json##: $json");
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
    }
    if (response.statusCode == 201) {
      print("vote submitted");

      twilio = Twilio(
          accountSid: accountSid,
          authToken: authToken,
          twilioNumber: twilioNumber);
      twilio.messages.sendMessage("+254708573898", "Your vote has been cast with transaction id $txid. Use this id to verify your ballot on the chainvote block explorer");
      emit(VoteCastState());
    } else {
      print(response.reasonPhrase);
    }
  }

  String generateTransactionID(String? deviceId) {
    // -generate a random string in the client 8 characters long
    // -get the devices serial number
    // -create a string from both starting with the random string
    // -hash the string, the hash is the txid

    // -on the backend, unhash the txid
    // -remove the first 8 characters
    // -check if the remaining string matches the devices serial number
    var serialNumber = deviceId;
    var randomString = generateRandomString(8);
    var combinedString = randomString + serialNumber!;

    var bytes = utf8.encode(combinedString);
    var sha256Digest = sha256.convert(bytes);

    return sha256Digest.toString();
  }
}

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
