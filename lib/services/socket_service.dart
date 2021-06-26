import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;

  SocketService() {
    _initConfig();
  }
  void _initConfig() {
    _socket = IO.io('http://192.168.0.115:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.on('connect', (_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    // socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo-mensaje:');
    //   print('nombre:${payload['nombre']}');
    //   print('mensaje:${payload['mensaje']}');
    // });
  }
}
