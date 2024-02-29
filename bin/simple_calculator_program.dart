import 'dart:io'; // Necessary for input/output operations, used to receive input from the user.
import 'dart:math'
    as math; // Importing Dart's math library for mathematical functions, aliased as 'math' for clarity.

// 1. Composing basic app setup (public class, constructor, etc.)
// This Calculator class demonstrates the basic app setup. It's a public class because it's not prefixed with an underscore.
// The default constructor is used to create instances of the Calculator.
class Calculator {
  Calculator();

  // 2. Creating basic mathematical functions in Dart
  // These methods demonstrate creating basic mathematical functions. They encapsulate functionality for operations.
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) =>
      b != 0 ? a / b : throw Exception('Cannot divide by zero');

  // 6. Implementing recursion
  // This factorial method is an example of implementing recursion, a function calling itself to solve a problem.
  double factorial(double n) => n <= 1 ? 1 : n * factorial(n - 1);

  // Additional mathematical functions using Dart's math library
  double power(double a, double b) => math.pow(a, b).toDouble();
  double sqrt(double a) => math.sqrt(a);
  double log(double a) => math.log(a);
  double sin(double a) => math.sin(a);
  double cos(double a) => math.cos(a);
  double tan(double a) => math.tan(a);

  // Function to operate the calculator based on user input
  void operate() {
    // 3. Receive input from the User
    // These calls to numInput demonstrate receiving input from the user.
    double num1 = numInput("Enter the first number:");
    String choice = operandChoice();
    double answer = 0.0;

    // 4. Conditionals and switch statements
    // This switch statement demonstrates the use of conditionals and switch statements to control flow based on user input.
    switch (choice) {
      case '+':
        {
          double num2 = numInput("Enter the second number:");
          answer = add(num1, num2);
          break;
        }
      // Additional cases for subtract, multiply, divide, etc., omitted for brevity...
      default:
        {
          print("Invalid operation. Please review.");
          return;
        }
    }

    print("Result: $answer");
  }

  // Function to prompt for and read a number input from the user
  double numInput(String prompt) {
    print(prompt);
    // 5. The basics of typecasting
    // This demonstrates typecasting, where the String input from the user is converted to a double.
    double? number = double.tryParse(stdin.readLineSync()!);
    while (number == null) {
      print("Invalid input. Please enter a valid number.");
      number = double.tryParse(stdin.readLineSync()!);
    }
    return number;
  }

  // Function to prompt for and read an operand or operation choice from the user
  String operandChoice() {
    print(
        "Enter the operation (e.g., '+', '-', '*', '/', 'pow', 'sqrt', 'log', 'sin', 'cos', 'tan'): ");
    return stdin.readLineSync()!.trim();
  }
}

void main() {
  // The creation of a Calculator instance and calling its operate method demonstrates the complete app setup and flow.
  Calculator calc = Calculator(); // Instance creation of the Calculator class.
  calc.operate(); // Method call to start the operation of the calculator.
}
