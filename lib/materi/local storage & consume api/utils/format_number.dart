String formatNumber(int number) {
  if (number >= 1000000) {
    double result = number / 1000000.0;
    return '${result.toStringAsFixed(1)}M';
  } else if (number >= 1000) {
    double result = number / 1000.0;
    return '${result.toStringAsFixed(1)}K';
  } else {
    return number.toString();
  }
}
