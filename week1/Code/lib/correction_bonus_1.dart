enum Direction {
  north,
  east,
  south,
  west;
}

enum Action {
  advance,
  turnRight,
  turnLeft;

  static List<Action> parse(String text) {
    List<Action> actions = [];
    for (var i = 0; i < text.length; i++) {
      late Action newAction;
      switch (text[i]) {
        case 'A':
          newAction = Action.advance;
          break;
        case 'R':
          newAction = Action.turnRight;
          break;
        case 'L':
          newAction = Action.turnLeft;
          break;
        default:
          throw Exception("Unamanged case : $text[i]");
      }
      actions.add(newAction);
    }
    return actions;
  }
}

class Robot {
  int x;
  int y;
  Direction direction;

  Robot({this.x = 0, this.y = 0, this.direction = Direction.north});

  void turnLeft() {
    switch (direction) {
      case Direction.north:
        direction = Direction.west;
        break;

      case Direction.east:
        direction = Direction.north;
        break;

      case Direction.south:
        direction = Direction.east;
        break;

      case Direction.west:
        direction = Direction.south;
        break;
    }
  }

  void turnRight() {
    switch (direction) {
      case Direction.north:
        direction = Direction.east;
        break;

      case Direction.east:
        direction = Direction.south;
        break;

      case Direction.south:
        direction = Direction.west;
        break;

      case Direction.west:
        direction = Direction.north;
        break;
    }
  }

  void advance() {
    switch (direction) {
      case Direction.north:
        y++;
        break;
      case Direction.east:
        x++;
        break;
      case Direction.south:
        y--;
        break;
      case Direction.west:
        x--;
        break;
    }
  }

  void process(List<Action> actions) {
    for (Action action in actions) {
      switch (action) {
        case Action.advance:
          advance();
          break;
        case Action.turnRight:
          turnRight();
          break;
        case Action.turnLeft:
          turnLeft();
          break;
      }
    }
  }

  @override
  String toString() {
    return "x=$x, y=$y, direction=${direction.name}";
  }
}

main() {
  Robot robot = Robot();
  print(robot);
}
