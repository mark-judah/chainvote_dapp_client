import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:election_app/utils/globalVariables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/key_generators/api.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/random/fortuna_random.dart';

part 'client_config_event.dart';
part 'client_config_state.dart';

class ClientConfigBloc extends Bloc<ClientConfigEvent, ClientConfigState> {
  final storage = const FlutterSecureStorage();

  ClientConfigBloc() : super(ClientConfigInitial()) {
    on<NavigateToConfigurationsEvent>(navigateToConfigurationsPage);
    on<SaveConfiguration>(saveConfiguration);
  }

  Future<FutureOr<void>> navigateToConfigurationsPage(
      NavigateToConfigurationsEvent event,
      Emitter<ClientConfigState> emit) async {
    emit(LoadingState());
    var urlPrefix = GlobalVariables.urlPrefix;
    final url = Uri.parse('$urlPrefix/api/login');

    final headers = {"Content-type": "application/json"};
    final json = jsonEncode({"email": event.email, "password": event.password});
    final response = await http.post(url, headers: headers, body: json);

    var r = response;
    if (response.statusCode == 200) {
      //get regions
      final url = Uri.parse('$urlPrefix/api/secured/get-all-regions');
      var jsonResponse = jsonDecode(r.body);
      var token = jsonResponse["token"];
      await storage.write(key: "token", value: token);

      final headers = {
        "Content-type": "application/json",
        'Authorization': 'Bearer $token',
      };
      final response2 = await http.get(url, headers: headers);
      if (kDebugMode) {
        print("url##: $url");
        print('Status code: ${response2.statusCode}');
        print('Body: ${response2.body}');
      }
      if (response2.statusCode == 200) {
        var data = jsonDecode(response2.body);
        List counties = data["Counties"];
        List constituencies = data["Constituencies"];
        List wards = data["Wards"];
        List polling_station = data["PollingStations"];

        emit(NavigateToConfigActionState(
            counties, constituencies, wards, polling_station));
      }
    }
    if (response.statusCode == 401) {
      emit(Unauthorized());
    }
    if (response.statusCode == 500) {
      emit(Error());
    }
  }

  Future<FutureOr<void>> saveConfiguration(
      SaveConfiguration event, Emitter<ClientConfigState> emit) async {
    var urlPrefix = GlobalVariables.urlPrefix;
    final url = Uri.parse('$urlPrefix/api/secured/new-desktop-client');
    var token = await storage.read(key: "token");
    final headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token',
    };
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final linuxInfo = await deviceInfo.linuxInfo;
    String? deviceId = linuxInfo.machineId;

    final pair = generateKeyPair();
    final publicKey = pair.publicKey;
    final privateKey = pair.privateKey;
    await storage.write(key: "privateKey", value: privateKey.toString());

    final json = jsonEncode({
      "county_id": int.parse(event.countyID),
      "constituency_id": int.parse(event.constituencyID),
      "ward_id": int.parse(event.wardID),
      "polling_station_id": int.parse(event.pollingStationID),
      "serial_number": deviceId,
      "public_key": publicKey.toString(),
    });
    final response = await http.post(url, headers: headers, body: json);
    if (kDebugMode) {
      print("url##: $url");
      print("json##: $json");
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
    }
    if (response.statusCode == 200) {
      print("Device saved");
    }
  }

  AsymmetricKeyPair<PublicKey, PrivateKey> generateKeyPair() {
    var keyParams = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 12);

    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));

    var rngParams = ParametersWithRandom(keyParams, secureRandom);
    var k = RSAKeyGenerator();
    k.init(rngParams);

    return k.generateKeyPair();
  }

  SecureRandom exampleSecureRandom() {
    final secureRandom = FortunaRandom();

    final seedSource = Random.secure();
    final seeds = <int>[];
    for (int i = 0; i < 32; i++) {
      seeds.add(seedSource.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));

    return secureRandom;
  }
}
