class TemperatureConverter {
  // Celsius to Réaumur conversion (°Re = °C × 0.8)
  double celsiusToReaumur(double celsius) {
    return celsius * 0.8;
  }

  // Celsius to Fahrenheit conversion (°F = °C × 9/5 + 32)
  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  // Celsius to Kelvin conversion (K = °C + 273.15)
  double celsiusToKelvin(double celsius) {
    return celsius + 273.15;
  }
}
