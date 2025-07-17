def addition(a, b):
  return a + b

def subtraction(a, b):
  return a - b

def multiplication(a, b):
  return a * b

def division(a, b):
  if b == 0:
    return "Cannot divide by zero"
  return a / b

def main():
  print("hello world")
  add_result = addition(1, 2)
  print(f"The result of 1 + 2 is {add_result}")
  sub_result = subtraction(5, 3)
  print(f"The result of 5 - 3 is {sub_result}")
  mult_result = multiplication(4, 5)
  print(f"The result of 4 * 5 is {mult_result}")
  div_result = division(10, 2)
  print(f"The result of 10 / 2 is {div_result}")


if __name__ == "__main__":
  main()