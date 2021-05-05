class BmiLogic {
  final int height;
  final int weight;

  double _bmi;
  BmiLogic({this.height, this.weight});

  String calculateBmi() {
    _bmi = weight / ((height / 100) * (height / 100));
    return _bmi.toStringAsFixed(1);
  }

  String outCome() {
    if (_bmi >= 23) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5 && _bmi < 23) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String comment(){
     if (_bmi >= 25) {
      return "You have a higher body weight than normal weight. Try to Exercise more.😉";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "You have normal BMI. Good Job.😊";
    } else {
      return "You have lower than normal body weight. You can eat more.🙂";
    }
  }
}
