void main() {
  const acConsumption = 1.5;
  const tvConsumption = 0.2;
  const lightConsumption = 0.1;

  const acHours = 8;
  const tvHours = 5;
  const lightHours = 12;

  var totalConsumption = (acConsumption * acHours) +
                         (tvConsumption * tvHours) +
                         (lightConsumption * lightHours);

  print('Total daily energy consumption: ${totalConsumption.toStringAsFixed(2)} kWh');
}