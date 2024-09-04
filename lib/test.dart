import 'dart:io';

class Stack {
  List<int?> _stk = List.filled(10, null);
  int _top = -1;

  void push(int val) {
    if (_top < _stk.length - 1) {
      _top++;
      _stk[_top] = val;
    } else {
      print('Stack Overflow Error!');
    }
  }

  int? pop() {
    if (_top >= 0) {
      int topVal = _stk[_top]!;
      _stk[_top] = null;
      _top--;
      return topVal;
    } else {
      print('Stack Underflow Error!');
      return null;
    }
  }

  void display() {
    if (_top >= 0) {
      for (int i = 0; i <= _top; i++) {
        print(_stk[i]);
      }
    } else {
      print('Stack is Empty');
    }
  }
}

void main() {
  Stack stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.push(5);
  stack.display();

  stack.push(6);
  stack.push(7);
  stack.push(8);
  stack.push(9);
  stack.push(10);
  stack.push(11);
  stack.display();

  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();

  // String inputStr = stdin.readLineSync()!;
  // /*
  // ["30","01","2024"]
  //  */
  // List<String> arr = inputStr.split("/");
  // int month = int.parse(arr[1]) - 1;

  // List<String> months = [
  //   "Jan",
  //   "Feb",
  //   "Mar",
  //   "Apr",
  //   "May",
  //   "Jun",
  //   "Jul",
  //   "Aug",
  //   "Sep",
  //   "Oct",
  //   "Nov",
  //   "Dec"
  // ];

  // String monthStr = months[month];
  // String formattedDate = "$monthStr-${arr[0]}-${arr[2]}";
  // print(formattedDate);
}
