
import 'package:get/get.dart';

import '../../app_pkg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class SocketDBService extends GetxService {
  SocketDBService(this.socketUrl);

  final String socketUrl;


  late IO.Socket socket;
  final RxBool isConnected = false.obs;
  final RxString receivedData = ''.obs;

  @override
  void onInit() {
    super.onInit();
    connectToServer();

    printLog('Socket db service initialized==');
  }

  void connectToServer() {
    // socket = IO.io(socketUrl, <String, dynamic>{
    //   'transports': ['websocket'],
    //   'autoConnect': false,
    //   // 'reconnection': true, // Enable reconnection
    //   // 'reconnectionAttempts': 5, // Number of reconnection attempts
    //   // 'reconnectionDelay': 1000, // Delay between reconnection attempts (in milliseconds)
    //   // 'reconnectionDelayMax': 5000, // Maximum delay between reconnection attempts (in milliseconds)
    //   // 'randomizationFactor': 0.5, // Randomization factor for reconnection delay
    // });
   socket = IO.io(socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            // .setExtraHeaders({'foo': 'bar'}) // optional
            .enableReconnection()
            .build()
    );

    socket.connect();
    socket.onConnect((_) {
      print('connect================================');
      socket.emit('msg', 'test');
    });
    socket.on('event', (data) => printLog(data));
    socket.onDisconnect((_){
      printLog('socket disconnect');
      reconnectToServer();
    });
    socket.on('fromServer', (_) => printLog(_));
    socket.onError((data) {
      printLog('socket error ::: $data');
    });
    socket.on('message', (data) {
      print('Message from server: $data');
    });
  }

  void disconnectFromServer() {
    if (socket.connected) {
      socket.disconnect();
    }
  }

  // Method to manually reconnect to the Socket.IO server
  void reconnectToServer() {
    if (socket.disconnected) {
      socket.connect();
    }
  }

}
