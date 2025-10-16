class CustomDuration {
  final int _milliseconds;

  CustomDuration(this._milliseconds) : assert(_milliseconds >= 0, 'Duration cannot be negative');

  CustomDuration.fromHours(int hours) : _milliseconds = hours * 60 * 60 * 1000 {
    assert(hours >= 0, 'Duration cannot be negative');
  }
  CustomDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60 * 1000 {
    assert(minutes >= 0, 'Duration cannot be negative');
  }
  CustomDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000 {
    assert(seconds >= 0, 'Duration cannot be negative');
  }
  bool operator > (CustomDuration other){
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(_milliseconds + other._milliseconds);
  }
  CustomDuration operator -(CustomDuration other) {
    if (_milliseconds - other._milliseconds < 0) {
      throw Exception('Duration can not be negative');
    }
    return CustomDuration(_milliseconds - other._milliseconds);
  }

}

void main (){
  CustomDuration duration1 = CustomDuration.fromHours(2);
  CustomDuration duration2 = CustomDuration.fromMinutes(30);
  CustomDuration duration3 = CustomDuration.fromSeconds(45);

  print(duration1 > duration2);

  CustomDuration totalDuration = duration1 + duration2 + duration3;
  print('Total Duration in milliseconds: ${totalDuration._milliseconds}');

  try {
    CustomDuration negativeDuration = duration2 - duration1;
    print(negativeDuration);
  } catch (e) {
    print(e);
  }
}