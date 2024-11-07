import sympy
from sympy.abc import x


expression = 2 * sympy.pi * (sympy.sin(x) ** 3)

value = sympy.integrate(expression, (x, 0, sympy.pi / 4))

print(value)
