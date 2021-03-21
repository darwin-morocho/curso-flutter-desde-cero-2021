import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class HomeController {
  final Connectivity connectivity;
  HomeController(this.connectivity);

  StreamController<bool> _streamController = StreamController.broadcast();
  late StreamSubscription _connectivitySubscription;
  StreamSubscription? _internetSubscription;
  bool? _isConnected;
  Timer? _timer;

  Stream<bool> get onConnectedChanged => _streamController.stream;

  void init() async {
    final initialResult = await this.connectivity.checkConnectivity();
    if (initialResult == ConnectivityResult.none) {
      print(" ✅ connected false");
      _notify(false);
    }
    _connectivitySubscription = this.connectivity.onConnectivityChanged.listen(this._onListerner);
  }

  void _onListerner(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      _notify(false);
      print("🚫 connected false");
    } else {
      print("connected to wifi or mobile");
      _checkInternet();
    }
  }

  void _checkInternet() async {
    await _internetSubscription?.cancel();
    _internetSubscription = http
        .get(Uri.parse('https://google.com'))
        .timeout(
          Duration(seconds: 10),
        )
        .asStream()
        .listen((http.Response response) {
      final isConnected = response.statusCode == 200;
      print("🐶 isConnected $isConnected");
      _notify(isConnected);
    }, onError: (e) async {
      print("😦 isConnected false");
      _notify(false);
    });
  }

  void _notify(bool isConnected) async {
    await _internetSubscription?.cancel();
    if (isConnected != this._isConnected) {
      this._isConnected = isConnected;
      this._streamController.sink.add(this._isConnected!);
    }
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(seconds: 20),
      (_) {
        print("🤡 timer");
        _checkInternet();
      },
    );
  }

  Future<void> dispose() async {
    _timer?.cancel();
    await _streamController.close();
    await _internetSubscription?.cancel();
    return _connectivitySubscription.cancel();
  }
}
