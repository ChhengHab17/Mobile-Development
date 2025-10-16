import 'package:myLab/correction_bonus_1.dart';
import 'package:test/test.dart';

main() {
  test('Move robot - Case 1', () {
    Robot robot = Robot(x: 7, y: 3, direction: Direction.north);
    robot.process(Action.parse("RAALAL"));

    print("Final state = $robot");

    expect(robot.x, equals(9));
    expect(robot.y, equals(4));
    expect(robot.direction, equals(Direction.west));
  });
}
