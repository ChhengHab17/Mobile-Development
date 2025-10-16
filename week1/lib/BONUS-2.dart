bool checkPair(String str) {
  List<String> list = [];

  for (int i = 0; i < str.length; i++) {
    String char = str[i];

    if (char == '(' || char == '{' || char == '[') {
      list.add(char);
    }
    else if (char == ')' || char == '}' || char == ']') {
      if (list.isEmpty) return false;

      String top = list.removeLast();

      if ((char == ')' && top != '(') || (char == '}' && top != '{') || (char == ']' && top != '[')) {
        return false;
      }
    }
  }

  return list.isEmpty;
}

void main(){
  String str = '{[[(a)b]c]d}';
  print(checkPair(str));
}

