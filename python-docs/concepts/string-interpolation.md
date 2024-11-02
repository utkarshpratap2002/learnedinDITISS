# String Interpolation

**String interpolation** in Python refers to the process of embedding expressions or variables within a string and evaluating them to produce a formatted string. Python provides several ways to perform string interpolation, each with its own advanced usage. Let's explore some of the advanced features and techniques you can use with string interpolation in Python.

### 1. **f-Strings (Formatted String Literals) - Advanced Usage**

f-Strings, introduced in Python 3.6, are the most modern and efficient way to perform string interpolation. They allow you to embed expressions directly inside string literals, making them concise and readable.

#### **a. Embedding Expressions and Function Calls**

You can embed any valid Python expression inside an f-string, including function calls, arithmetic operations, and more.

- **Example:**
  ```python
  name = "Alice"
  age = 30
  def greet(name):
      return f"Hello, {name}!"

  greeting = f"{greet(name)}, you are {age + 1} years old next year."
  print(greeting)
  # Output: Hello, Alice!, you are 31 years old next year.
  ```

#### **b. Formatting Numbers**

f-Strings provide powerful number formatting options, including specifying decimal places, padding, and formatting numbers as percentages, currencies, etc.

- **Example:**
  ```python
  pi = 3.141592653589793
  formatted_pi = f"{pi:.2f}"  # Limit to 2 decimal places
  print(formatted_pi)  # Output: 3.14

  percentage = 0.85
  formatted_percentage = f"{percentage:.1%}"  # Format as percentage
  print(formatted_percentage)  # Output: 85.0%

  amount = 1234567.89
  formatted_amount = f"${amount:,.2f}"  # Format with commas and 2 decimal places
  print(formatted_amount)  # Output: $1,234,567.89
  ```

#### **c. Nested and Complex Expressions**

f-Strings allow you to use nested and complex expressions, including conditionals, inside the interpolation brackets.

- **Example:**
  ```python
  score = 95
  grade = f"A{'+' if score > 90 else ''}"
  print(f"Your grade is {grade}.")
  # Output: Your grade is A+.
  ```

#### **d. Using Dictionaries with f-Strings**

You can directly access dictionary values within an f-string.

- **Example:**
  ```python
  student = {"name": "Alice", "age": 21, "grade": "A"}
  print(f"Student: {student['name']}, Age: {student['age']}, Grade: {student['grade']}")
  # Output: Student: Alice, Age: 21, Grade: A
  ```

#### **e. Alignment and Width Specification**

f-Strings allow you to align text and specify a minimum width for strings, which is useful for creating neatly formatted tables or console output.

- **Example:**
  ```python
  name = "Alice"
  age = 30
  print(f"|{'Name':<10}|{'Age':^5}|")
  print(f"|{name:<10}|{age:^5}|")
  # Output:
  # |Name      | Age |
  # |Alice     |  30 |
  ```

### 2. **`str.format()` Method - Advanced Usage**

The `str.format()` method, while slightly older than f-strings, still offers powerful formatting capabilities.

#### **a. Reusing Format Specifiers**

You can use the same value multiple times within a string by referring to the same index in the `str.format()` method.

- **Example:**
  ```python
  name = "Alice"
  message = "Welcome {0}, {0}, {0}!".format(name)
  print(message)
  # Output: Welcome Alice, Alice, Alice!
  ```

#### **b. Custom Formatting with Objects**

You can define custom `__format__` methods in your classes to control how they are formatted when passed to `str.format()` or f-strings.

- **Example:**
  ```python
  class Coordinate:
      def __init__(self, x, y):
          self.x = x
          self.y = y

      def __format__(self, format_spec):
          if format_spec == 'r':  # Rectangular format
              return f"({self.x}, {self.y})"
          elif format_spec == 'p':  # Polar format
              return f"({(self.x**2 + self.y**2)**0.5:.2f} at {math.atan2(self.y, self.x):.2f} radians)"
          return str(self)

  point = Coordinate(3, 4)
  print("Point in rectangular format: {:r}".format(point))
  print("Point in polar format: {:p}".format(point))
  # Output:
  # Point in rectangular format: (3, 4)
  # Point in polar format: (5.00 at 0.93 radians)
  ```

### 3. **Template Strings - Advanced Usage**

Template strings, found in the `string` module, offer a simple, safe way to perform string interpolation, especially useful when dealing with user-generated content.

#### **a. Safe Substitutions with Template Strings**

You can use `Template` strings for safe substitutions, avoiding issues like missing or extra placeholders.

- **Example:**
  ```python
  from string import Template

  template = Template("Hello, $name! Welcome to $place.")
  message = template.substitute(name="Alice", place="Wonderland")
  print(message)
  # Output: Hello, Alice! Welcome to Wonderland.

  # Safe substitute to avoid KeyError
  safe_message = template.safe_substitute(name="Alice")
  print(safe_message)
  # Output: Hello, Alice! Welcome to $place.
  ```

#### **b. Custom Delimiters in Template Strings**

You can create a subclass of `Template` to customize the delimiter used for substitutions.

- **Example:**
  ```python
  from string import Template

  class CustomTemplate(Template):
      delimiter = '#'

  template = CustomTemplate("Hello, #name! Welcome to #place.")
  message = template.substitute(name="Alice", place="Wonderland")
  print(message)
  # Output: Hello, Alice! Welcome to Wonderland.
  ```

### Summary

**Advanced string interpolation** in Python allows you to:
- Embed complex expressions and function calls directly in strings.
- Format numbers, including specifying precision, alignment, and different bases.
- Handle dictionaries, custom objects, and nested data structures within formatted strings.
- Align and format text neatly for console output.
- Use `str.format()` for reusing format specifiers and custom formatting.
- Employ `Template` strings for safe and customizable string formatting, particularly in user-generated contexts.

### Resources for Learning Advanced String Interpolation:
- **Official Python Documentation:** [Formatted String Literals](https://docs.python.org/3/reference/lexical_analysis.html#f-strings)
- **Real Python - String Formatting Best Practices:** [Real Python Guide](https://realpython.com/python-string-formatting/)
- **Python 3 String Formatting Cookbook:** [Examples and Patterns](https://mkaz.blog/code/python-string-format-cookbook/)
  
Mastering these techniques will allow you to create powerful, flexible, and highly readable code, which is crucial when working with console applications, logging, or any form of dynamic text output.