import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:twilio/twilio.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final storage = const FlutterSecureStorage();
  final String accountSid = "AC2be90d382b1dd94267518c9411e23636";
  final String authToken = "89e20b90f5fdd82af955556c70267ccd";
  final String twilioNumber = "+12314032879";

  late Twilio twilio;

  LoginBloc() : super(LoginInitial()) {
    on<EnterMobileNumberEvent>(enterMobileNumberEvent);
    on<EnterOTPEvent>(enterOTPEvent);
    on<ProcessOTPEvent>(processOTPEvent);
    on<NavigateToConfigurationsLoginEvent>(navigateToConfigurationsLoginPage);
  }

  FutureOr<void> enterMobileNumberEvent(
      EnterMobileNumberEvent event, Emitter<LoginState> emit) {
    emit(EnterMobileNumberState());
  }

  Future<FutureOr<void>> enterOTPEvent(
      EnterOTPEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    //generate and store otp locally
    String otp = Random().nextInt(999999).toString().padLeft(6, '0');
    await storage.write(key: "otp", value: otp);
    //send otp to mobile number
    twilio = Twilio(
        accountSid: accountSid,
        authToken: authToken,
        twilioNumber: twilioNumber);
    twilio.messages.sendMessage("+254708573898", otp);
    emit(EnterOTPState());
  }

  Future<FutureOr<void>> processOTPEvent(
      ProcessOTPEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    //check if enteredOtp matches the stored version
    String? storedOTP = await storage.read(key: "otp");
    if (storedOTP == event.otp) {
      print("OTP: " + storedOTP!);
      emit(NavigateToElectionTypeState());
    }
  }

 

  FutureOr<void> navigateToConfigurationsLoginPage(NavigateToConfigurationsLoginEvent event, Emitter<LoginState> emit) {
    emit(LoadingState());
    emit(NavigateToConfigLoginActionState());
  }
}
