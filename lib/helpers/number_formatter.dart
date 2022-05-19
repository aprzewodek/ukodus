class NumberFormatter {
  static String formatPoints(int points) {
    const emptyPoints = '----';

    if (points > 999) {
      return emptyPoints;
    }

    if (points > 99) {
      return '0$points';
    }

    if (points > 9) {
      return '00$points';
    }

    if (points > 0) {
      return '000$points';
    }

    return emptyPoints;
  }
}
