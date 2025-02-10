#include <Servo.h>
#include <Joystick.h>

// Joystick object
Joystick_ Joystick;
// Servo motor object
Servo myServo;
// Offset of the first connected input pin
const int PIN_OFFSET = 5;
// Number of connected pins
const int PIN_COUNT = 8;
// Pin where the servo motor is connected
const int SERVO_PIN = 4;
// If true, disables the joystick and sends the input data to the serial monitor instead
const bool DEBUG_MODE = false;

void setup() {
  // Initialize objects
  Serial.begin(9600);
  myServo.attach(SERVO_PIN);
  if (!DEBUG_MODE) {
    Joystick.begin();
  }

  // Initialize input pins
  for (int i = PIN_OFFSET; i < PIN_OFFSET + PIN_COUNT; i++) {
    pinMode(i, INPUT_PULLUP);
  }
}

void loop() {
  // Read the current car speed value from the serial port, and move the servo to that speed position
  if (Serial.available()) {
    String value = Serial.readStringUntil('a');
    setServoPosition(value);
  }

  // Read the analog inputs and map the raw values to acceptable values for the Joystick object
  int steering = analogRead(A0);
  int center = 525;
  int range = min(1023 - center, center);
  steering = constrain(steering, center - range, center + range);
  steering = map(steering, center - range, center + range, 0, 1023);

  int accelerator = analogRead(A1);
  accelerator = constrain(accelerator, 90, 180);
  accelerator = map(accelerator, 90, 180, 0, 1023);

  int brake = analogRead(A2);
  brake = constrain(brake, 760, 940);
  brake = map(brake, 760, 940, 0, 1023);

  if (DEBUG_MODE) {
    // Print the raw input values in the serial monitor
    Serial.println();
    Serial.println("Raw analog inputs values:");
    Serial.println("Steering: " + (String)(analogRead(A0)));
    Serial.println("Accelerator: " + (String)(analogRead(A1)));
    Serial.println("Brake: " + (String)(analogRead(A2)));
    delay(200);
  } else {
    // Set the mapped input values to the Joystick axes
    Joystick.setRxAxis(steering);
    Joystick.setRyAxis(accelerator);
    Joystick.setRzAxis(brake);

    // Read the digital inputs and update the state of it's corresponding joystick buttons
    for (int i = PIN_OFFSET; i < PIN_OFFSET + PIN_COUNT; i++) {
      if (digitalRead(i) == LOW) {
        Joystick.pressButton(i);
      } else {
        Joystick.releaseButton(i);
      }
    }
  }
}

// Sets the servo position for a given car speed value
void setServoPosition(String speed) {
  int offset = 6;
  int maxSpeed = 334;
  int angle = map(min(speed.toInt(), maxSpeed), 0, maxSpeed, 180 - offset, 0);
  
  myServo.write(angle);
}
