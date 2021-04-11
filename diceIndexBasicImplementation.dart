void main() {
  String a = "Now is the time get back to study";
  String b = "There is the no time to study";

  print(findDiceIndex(a, b));
}

double findDiceIndex(String a, String b) {
  int alen = a.length - 1;
  int blen = b.length - 1;

  //condition where either of LICENSE file is empty
  if (alen < 0 || blen < 0) {
    return 0;
  }
  //if both are exactly identical
  if (a == b) return 1;

  //if both the licenses don’t match exactly, we’ll find Dice Index using Bigram
  final stringBigrams = <String, int>{};
  for (var i = 0; i < alen; i++) {
    final bigram = a.substring(i, i + 2);
    final counts =
        stringBigrams.containsKey(bigram) ? stringBigrams[bigram]! + 1 : 1;
    stringBigrams[bigram] = counts;
  }

  var intersections = 0;
  for (var i = 0; i < blen; i++) {
    final bigram = b.substring(i, i + 2);
    final counts =
        stringBigrams.containsKey(bigram) ? stringBigrams[bigram]! : 0;

    if (counts > 0) {
      stringBigrams[bigram] = counts - 1;
      intersections++;
    }
  }
  return (2.0 * intersections) / (alen + blen);
}
