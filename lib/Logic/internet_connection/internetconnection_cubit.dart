import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity/connectivity.dart';
part 'internetconnection_state.dart';

class InternetconnectionCubit extends Cubit<InternetconnectionState> {
  StreamSubscription subscription;
  InternetconnectionCubit()
      : super(InternetconnectionState(
          isConnected: false,
        )) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      result != ConnectivityResult.none
          ? emit(InternetconnectionState(isConnected: true))
          : emit(InternetconnectionState(isConnected: false));
    });
  }

  Future<void> checkConnection() async {
    await Connectivity().checkConnectivity().then((value) {
      value == ConnectivityResult.none
          ? emit(InternetconnectionState(isConnected: false))
          : emit(InternetconnectionState(isConnected: true));
    });
  }

  @override
  close() {
    subscription.cancel();
    return super.close();
  }
}
