enum Direction { north, east, south, west }
Direction turnRight(Direction direction){
  switch(direction){
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
  return direction;
}
Direction turnLeft(Direction direction){
  switch(direction){
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
  return direction;
}
Map<String, int> moveForward(Direction direction, int x, int y){
  switch(direction){
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
  return {'x': x, 'y': y};
}


Map<String, dynamic> robotMove(Direction direction, String instruction, int x, int y){

  for(int i = 0; i < instruction.length; i++){
    if(instruction[i] == "R"){
      direction = turnRight(direction);
    }
    else if(instruction[i] == "L"){
      direction = turnLeft(direction);
    }
    else if(instruction[i] == "A"){
      Map<String, int> newPosition = moveForward(direction, x, y);
      x = newPosition['x']!;
      y = newPosition['y']!;
    }
  }
  return {'x' : x, 'y': y, 'direction': direction.name};
}
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  Map<String, dynamic> robotFinalPosition = robotMove(direction, instructions, x, y);

  // Print the final position and direction
  print("Final position (${robotFinalPosition['x']}, ${robotFinalPosition['y']})");
  print("Facing: ${robotFinalPosition['direction']}");
}


