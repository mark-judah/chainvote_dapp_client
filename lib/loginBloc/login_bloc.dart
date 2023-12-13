import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:twilio/twilio.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final storage = const FlutterSecureStorage();
  final String accountSid = "";
  final String authToken = "";
  final String twilioNumber = "";

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
    print(otp);
    await storage.write(key: "otp", value: otp);
    //send otp to mobile number
    twilio = Twilio(
        accountSid: accountSid,
        authToken: authToken,
        twilioNumber: twilioNumber);
    twilio.messages.sendMessage("+254${event.phone_number}", otp);
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
    }else{
      print("OTP mismatch");
      emit(InvalidOTPState());
      var duration = const Duration(seconds: 5);
      sleep(duration);
      emit(EnterOTPState());
    }
  }

 

  FutureOr<void> navigateToConfigurationsLoginPage(NavigateToConfigurationsLoginEvent event, Emitter<LoginState> emit) {
    emit(LoadingState());
    emit(NavigateToConfigLoginActionState());
  }
}
