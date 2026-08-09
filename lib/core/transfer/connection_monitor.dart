/// Connection Monitor tracking peer socket connection health and latency.
class ConnectionMonitor {
  ConnectionMonitor();

  bool isConnected = true;
  int pingMs = 35;
  double packetLossRatio = 0.0;
  String connectionStatus = 'stable'; // stable, degraded, disconnected

  void updateConnectionHealth({required int ping, required double lossRatio}) {
    pingMs = ping;
    packetLossRatio = lossRatio;

    if (lossRatio > 0.3 || ping > 500) {
      connectionStatus = 'degraded';
    } else if (lossRatio > 0.8) {
      connectionStatus = 'disconnected';
      isConnected = false;
    } else {
      connectionStatus = 'stable';
      isConnected = true;
    }
  }
}
