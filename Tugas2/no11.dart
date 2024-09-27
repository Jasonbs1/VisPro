void main() {
  const initialBattery = 100;
  const chattingConsumption = 0.2; // 1% per 5 minutes
  const videoConsumption = 0.4;    // 2% per 5 minutes
  const gameConsumption = 0.6;     // 3% per 5 minutes

  const chattingMinutes = 60;
  const videoMinutes = 30;
  const gameMinutes = 45;

  var batteryUsed = (chattingConsumption * chattingMinutes / 5) +
                    (videoConsumption * videoMinutes / 5) +
                    (gameConsumption * gameMinutes / 5);

  var remainingBattery = initialBattery - batteryUsed;

  print('Remaining battery: ${remainingBattery.toStringAsFixed(2)}%');
}