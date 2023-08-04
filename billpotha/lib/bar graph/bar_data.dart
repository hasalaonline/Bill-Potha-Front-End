import 'individual_bar.dart';

class BarData {
  final double janUnits;
  final double febUnits;
  final double marUnits;
  final double aprUnits;
  final double mayUnits;
  final double junUnits;
  final double julUnits;
  final double augUnits;
  final double sepUnits;
  final double octUnits;
  final double novUnits;
  final double decUnits;

  

  BarData(
    this.janUnits,
    this.febUnits,
    this.marUnits,
    this.aprUnits,
    this.mayUnits,
    this.junUnits,
    this.julUnits,
    this.augUnits,
    this.sepUnits,
    this.octUnits,
    this.novUnits,
    this.decUnits,
    
  );

  List<IndividualBar> barData = [];
  
  void initialiseBarData() {
    barData = [
      IndividualBar(1, janUnits),
      IndividualBar(2, febUnits),
      IndividualBar(3, marUnits),
      IndividualBar(4, aprUnits),
      IndividualBar(5, mayUnits),
      IndividualBar(6, junUnits),
      IndividualBar(7, julUnits),
      IndividualBar(8, augUnits),
      IndividualBar(9, sepUnits),
      IndividualBar(10, octUnits),
      IndividualBar(11, novUnits),
      IndividualBar(12, decUnits),
    ];

  }
}
