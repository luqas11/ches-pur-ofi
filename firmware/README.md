## Firmware

#### How this works
This firmware is developed to run in an *Arduino Leonardo* board and handle up to 8 buttons, 3 axis, and a servo motor. In the emulator, the buttons are mapped to the car shifts and the coin input, the axis are mapped to the steering, brake and accelerator, and the servo moves the physical speedometer pointer.  

#### How to debug analog inputs
By setting the `DEBUG_MODE` constant to `true`, the firmware stops using the `Joystick` object and starts sending the analog inputs raw values to the serial monitor. It's useful to calibrate or debug analog inputs that are not working as expected.

#### How to calibrate analog inputs
The analog inputs are constrained to the effective range of the raw values of the physical potentiometers, and mapped to a range between `0` and `1023`.  
Pedals only use a fraction of the total potentiometer range, so the effective range must be specified to firmware to make it work properly. For example:
```
// A brake pedal works between the raw values of 730 and 960.
// The firmware contrains it to a smaller range to add a tolerance margin, for example between 760 and 940.
// After that, it maps that range to a 0-1023 range to make the Joystick library perform a full range axis movement.
int brake = analogRead(A2);
brake = constrain(brake, 760, 940);
brake = map(brake, 760, 940, 0, 1023);
```  
Similarily, the steering wheel raw reading is not acceptable for the axis emulation. Assuming that the steer uses the whole potentiometer range, the only relevant value for calibration is the centering. Specifying the center raw value, the firmware calculates the widest range it can work, centering and mapping it. For example:
```
// A steering wheel is centered at the 525 raw value
// The firmware calculates the closest border to the center, and takes that distance as the maximum available range for both directions (this makes the final range centered).
// After that, it constrains and maps the reading range to the new calculated range.
int steering = analogRead(A0);
int center = 525;
int range = min(1023 - center, center);
steering = constrain(steering, center - range, center + range);
steering = map(steering, center - range, center + range, 0, 1023);
```

