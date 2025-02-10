# Firmware

### How this works
This firmware handles up to 8 buttons, 3 axes, and a servo motor. In the emulator, the buttons are mapped to the car shifts and the coin input, the axes are mapped to the steering, brake and accelerator, and the servo moves the physical speedometer pointer. The [Arduino Joystick Library](https://github.com/MHeironimus/ArduinoJoystickLibrary) makes this possible by configuring the *Leonardo* to appear as a PC Joystick to the PC, and giving an API that allows the Joystick buttons and axes to be pressed and moved from the board.  

### How to debug analog inputs
By setting the `DEBUG_MODE` constant to `true`, the firmware stops using the `Joystick` object and starts sending the analog inputs raw values to the serial monitor. It's useful to calibrate or debug analog inputs that are not working as expected, or to recalibrate an input after a potentiometer replacement.

### How to calibrate analog inputs
The analog inputs are constrained to the effective range of the raw values of the physical potentiometers, and mapped to a range between `0` and `1023`. Neither the wheel nor the pedals make perfect use of the whole potentiometer rotation range, so the constraining and the mapping are always necessary to normalize the raw values.  

For the pedals, the effective range must be specified in the firmware to make it work properly. For example:
```
// A brake pedal works between the raw values of 730 and 960.
// The firmware constrains it to a smaller range to add a tolerance margin, for example between 750 and 940.
// After that, it maps that range to a 0-1023 range to make the Joystick library perform a full range axis movement.
int brake = analogRead(A2);
brake = constrain(brake, 750, 940);
brake = map(brake, 750, 940, 0, 1023);
```  
Similarily, the steering wheel raw reading is not acceptable for the axis emulation. Assuming that the wheel uses the whole potentiometer range, the only relevant value for calibration is the centering. Even if it's using the whole range, the center is sometimes mechanically deviated, so by specifying the center raw value the firmware calculates the widest range it can work, centering and mapping it. For example:
```
// A steering wheel is centered at the 525 raw value.
// The firmware calculates the closest border to the center, and takes that distance as the maximum available range for both directions (this makes the final range centered).
// After that, it constrains and maps the reading range to the new calculated range.
int steering = analogRead(A0);
int center = 525;
int range = min(1023 - center, center);
steering = constrain(steering, center - range, center + range);
steering = map(steering, center - range, center + range, 0, 1023);
```

### How to calibrate the speedometer
For the speedometer, since the rotation range of the servo is 180°, the received speed value must be mapped to a value between 180 and 0. The physical assembly of the speedometer could left the zero rotation point slightly displaced from the zero mark in the graphic scale, so an offset must be considered to correct it. At the maximum rotation point, the pointer will be at an arbitrary speed value, that will be the maximum speed value to be used in the speed range mapping. For example:
```
// When the servo is set to zero rotation, the pointer is displaced by 6 degrees from the zero speed mark in the scale.
// An offset of 6 degrees is added to the minimum rotation value, so it will rotate between 180 - offset and 0 (180 means minimum rotation because the servo rotation direction is the opossite of the scale increasing direction).
// With the offset applied, rotating the servo to its maximum rotation point leaves the pointer at the 334 speed mark of the scale.
// The maximum speed value for the speed mapping is set to 334, to match the 0-334 effective range of the pointer over the scale.
int offset = 6;
int maxSpeed = 334;
int angle = map(min(speed.toInt(), maxSpeed), 0, maxSpeed, 180 - offset, 0);
```
