-- Definir la función haceFrioF/1, indica si una temperatura expresada en grados Fahrenheit es fría.
-- Nota: Decimos que hace frío si la temperatura es menor a 8 grados Celsius.

fahrToCelsius temp = (5 / 9) * (temp - 32)

haceFrio = (<= 8).fahrToCelsius
