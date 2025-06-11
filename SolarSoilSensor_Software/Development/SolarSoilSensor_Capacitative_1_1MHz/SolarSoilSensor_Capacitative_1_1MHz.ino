/*
   Solar Soil Sensor code
   by:    Matt Little
   date:  9/4/2020
   w:     www.curiouselectric.co.uik
   e:     hello@curiouselectric.co.uk

  This code is for an ATTiny85 unit to measure soil moisture for a plant.
  This has the following connections:
  LED         2    This is for both the LED (when pulled down) and Switch (pull down)
  SOIL_POWER  1    This controls the voltage to the moisture sensor - to save energy
  SOIL_READ   A3   This is the analog read for the soil mositure reading (0-1024)
  SOLAR       A2   This is to measure the solar PV voltage (is it sunny or not?)
  BUZZER      0    This is a piezo buzzer for output beeps!

  Fuses are:
  EXT: FF, HIGH: D6, LOW: 62

  The code does the following:

  Wake up. Put power to mositure sensor
  Check mositure reading - is it within soilDistance (set to 50) of the stored EEPROM value?

  If yes then - Do a warning (LED flash if dark, beep (if activated) and LED flash if sunny)

  If no then do nothing

  Go to sleep

  Wake on either WDT (every 2/4/8 seconds?) or button press (INT0)
  Set INT0 on LED pin.

  If button pressed one short click: Store mositure level
  (store the moisture reading into EEPROM.- beep 5 times)

  Press and hold - goes through the modes at 1 second intervals. Wrap around at max mode
  Mode is stored into EEPROM

  Modes:
  1 = Mositure Sensor with sound

  2 = Mositure Sensor no sound

  TO DO:

*/

// To implement software serial we must use 8MHz
//// *********** SERIAL DEBUG *******************//
//#define F_CPU 8000000  // This is used by delay.h library
#define F_CPU 1000000  // This is used by delay.h library

#include <stdlib.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <EEPROM.h>        // For writing values to the EEPROM
#include <avr/eeprom.h>    // For writing values to EEPROM
#include <avr/io.h>        // Adds useful constants
#include <util/delay.h>    // Adds delay_ms and delay_us functions

#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

#define LED         2     // Use this for both output and reading switch. INT0    
#define SOIL_POWER  1
#define SOIL_READ   A3    // D3
#define SOLAR       A2    // D4
#define BUZZER      0

//// *********** SERIAL DEBUG *******************//
//#include <SoftwareSerial.h>
//#define rxPin       5     // This is not needed - we are only sending
//#define txPin       BUZZER  // Want it the same as BUZZER - use the BUZZER for both.
//SoftwareSerial serial(rxPin, txPin);

// Varibales for writing to EEPROM
int hiByte;      // These are used to store longer variables into EEPROM
int loByte;
long int number;

long int soilReading;
int soilSamples = 20;
int soilSetpoint;
int soilDifference = 50;

int sleep_time = 9; // 0=16ms, 1=32ms,2=64ms,3=128ms,4=250ms,5=500ms
                    // 6=1 sec,7=2 sec, 8=4 sec, 9= 8sec

float Vsolar;

volatile boolean f_wdt = 1;
volatile boolean f_int0 = 0;

byte mode;              // This holds the mode value 1 to maxMode
int maxMode = 3;        // This is the maximum number of modes

int chirpCounter = 0;   // For holding the time until the next chirp
int chirpCycles = 5;    // Number os WDT cycles before next sound

boolean updateCheckValue = false; // This updates the soil check value

void setup() {
  pinMode(LED, OUTPUT);
  pinMode(SOIL_POWER, OUTPUT);
  pinMode(BUZZER, OUTPUT);

  pinMode(SOIL_READ, OUTPUT);
  digitalWrite(SOIL_READ, HIGH);

  //analogReference(INTERNAL);  // Reference 1.1V
  digitalWrite(LED, HIGH);

  // Read in the soilSetpoint
  hiByte = EEPROM.read(0);
  loByte = EEPROM.read(1);
  soilSetpoint = (hiByte << 8) + loByte; // Get the sensor calibrate value
  mode = EEPROM.read(10);  // What mode is the unit in?
  if (mode > maxMode)
  {
    mode = 1;
  }

  //  // *********** SERIAL DEBUG *******************//
  //  serial.begin(2400);
  //  _delay_ms(50);
  //  serial.print("SP: ");
  //  serial.println(soilSetpoint);
  //  serial.println("M: ");
  //  serial.println(mode);

  MCUCR &= ~(_BV(ISC01) | _BV(ISC00));    // INT0 on falling level (button press)
  setup_watchdog(sleep_time);                      // WDT on approximately 2 seconds sleep
}

void loop() {

  if (f_int0 == 1) {
    // Entered here with button press
    f_int0 = 0;   //Reset flag
    pinMode(LED, INPUT_PULLUP);     // Switch the LED pin to an input, so can be read as the switch press
    delay(10);  // Settling time

    int pressTime = 0;
    int oldPressTime = 0;

    while (digitalRead(LED) == LOW)
    {
      pressTime++;
      delay(10);  // 10mS delay
      if (pressTime >= oldPressTime + 100)
      {
        oldPressTime = pressTime;
        mode++;     // Increment the mode
        if (mode >= maxMode + 1)
        {
          mode = 1; // Reset the mode
        }
        buzz(mode);
      }
    }
    // If the press time is less than 100 then this is a quick press
    // - update the soil sense value
    if (pressTime < 100)
    {
      updateCheckValue = true;
    }
    // If the press time has been longer and the mode has changed
    // Store the mode we end on
    else if (pressTime >= 100)
    {
      // In this case store the mode in EEPROM
      EEPROM.write(10, (byte)mode);
    }

    if (updateCheckValue == true)
    {
      //If the switch has been pressed:
      // Here want to set the reading as the soil OK threshold
      pinMode(SOIL_READ, INPUT);
      digitalWrite(SOIL_POWER, HIGH);
      delay(2);    // Wait for setting
      for (int n = 0; n <= soilSamples; n++)
      {
        soilReading += analogRead(SOIL_READ);
        delay(2);
      }
      digitalWrite(SOIL_POWER, LOW);
      pinMode(SOIL_READ, OUTPUT);
      digitalWrite(SOIL_READ, HIGH);

      soilSetpoint = soilReading / soilSamples;

      // Also want to store this into EEPROM
      EEPROM.write(0, soilSetpoint >> 8);
      EEPROM.write(1, soilSetpoint & 0xff);
      flash(5, false);   // Lets us know its been stored
      updateCheckValue = false; // Reset the value

      //      // *********** SERIAL DEBUG *******************//
      //      serial.print("SP: ");
      //      serial.println(soilSetpoint);
    }
    f_wdt = 0;  // Reset this value, as WDT will have triggered here
    f_int0 = 0;   //Reset flag
  }
  else if (f_wdt == 1)
  {
    // wait for timed out watchdog / flag is set when a watchdog timeout occurs
    // WAKE UP
    f_wdt = 0;     // reset flag

    if (mode <= maxMode)
    {
      // Only use the buzzer/output if there is some sun!
      Vsolar = analogRead(SOLAR) * (4.0 / 1024.0) * (1000.0 / 100.0); //Turn into a real (ish) voltage
      //Vsolar = 3.0; // DEBUG LINE

      // Read the soil mositure
      // Set power to sensor high
      pinMode(SOIL_READ, INPUT);
      digitalWrite(SOIL_POWER, HIGH);
      soilReading = 0;           // Reset the value

      delay(10);    // Wait for settling

      for (int n = 0; n <= soilSamples; n++)
      {
        soilReading += analogRead(SOIL_READ);
        delay(10);
      }
      soilReading = soilReading / soilSamples;    // This is the soil moisture reading
      pinMode(SOIL_READ, OUTPUT);
      digitalWrite(SOIL_READ, HIGH);
      digitalWrite(SOIL_POWER, LOW);

      //        // *********** SERIAL DEBUG *******************//
      //        serial.print("SR: ");
      //        serial.println(soilReading);

      if (soilReading >= soilSetpoint + soilDifference )
      {
        if (mode == 1 || mode == 3)
        {
          // Only chirp if solar available
          if (Vsolar >= 2.0)
          {
            // Only want it to chirp every 30 seconds or so?
            if (chirpCounter <= 1)
            {
              chirpHigh();
              //chirpLow();
              chirpCounter = chirpCycles;  // Number of 2 second WDT to wait until next chirp
            }
            chirpCounter--;
          }
          flash(4, false);
        }
        else if (mode == 2)
        {
          flash(4, false);
        }
      }
      if (soilReading <= soilSetpoint - soilDifference )
      {
        if (mode == 3)
        {
          // Only chirp if solar available
          if (Vsolar >= 2.0)
          {
            // Only want it to chirp every 30 seconds or so?
            if (chirpCounter <= 1)
            {
              //chirpHigh();
              chirpLow();
              chirpCounter = chirpCycles;  // Number of 2 second WDT to wait until next chirp
            }
            chirpCounter--;
          }
          flash(4, false);
        }
      }
    }
    f_wdt = 0;     // reset flag
  }
  system_sleep();
}

void system_sleep()
{
  GIMSK |= _BV(INT0);                   //enable INT0 (for wake up from button press)
  cbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter OFF
  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
  sleep_enable();
  sleep_mode();                        // System sleeps here
  sleep_disable();                     // System continues execution here when watchdog timed out
  sbi(ADCSRA, ADEN);                   // switch Analog to Digitalconverter ON
  GIMSK &= ~(_BV(INT0));               // disable INT0
}

// 0=16ms, 1=32ms,2=64ms,3=128ms,4=250ms,5=500ms
// 6=1 sec,7=2 sec, 8=4 sec, 9= 8sec
void setup_watchdog(int ii) {

  byte bb;
  int ww;
  if (ii > 9 ) ii = 9;
  bb = ii & 7;
  if (ii > 7) bb |= (1 << 5);
  bb |= (1 << WDCE);
  ww = bb;

  MCUSR &= ~(1 << WDRF);
  // start timed sequence
  WDTCR |= (1 << WDCE) | (1 << WDE);
  // set new watchdog timeout value
  WDTCR = bb;
  WDTCR |= _BV(WDIE);
}

// Watchdog Interrupt Service / is executed when watchdog timed out
ISR(WDT_vect) {
  f_wdt = 1; // set global flag
}

ISR(INT0_vect)
{
  //Wakes up here - goes to main loop to carry on
  f_int0 = 1; // set global flag
}

void flash(int flash, boolean buzzOn)
{
  pinMode(LED, OUTPUT);   // Want the LED as an output

  for (int i = 1; i <= flash; i++)
  {
    digitalWrite(LED, LOW);
    delay(10);
    digitalWrite(LED, HIGH);
    delay(100);
  }
}

void chirpHigh()  // Not enough water
{
  for (int i = 1000; i < 3000; i += 200)
  {
    tone(BUZZER, i);
    _delay_ms(5);
  }
  noTone();
}

void chirpLow()  // Too much water
{
  for (int i = 3000; i > 1000; i -= 200)
  {
    tone(BUZZER, i);
    _delay_ms(5);
  }
  noTone();
}

void buzz(byte flash)
{
  for (int i = 1; i <= flash; i++)
  {
    tone(BUZZER, 1000);       // This needs to be 8 x actual frequency - as clock is 1MHz
    delay(50);
    noTone(BUZZER);
    delay(50);
  }
}

// Common code for both sources of an ADC conversion
int getADC() {
  ADCSRA  |= _BV(ADSC);          // Start conversion
  while ((ADCSRA & _BV(ADSC)));   // Wait until conversion is finished
  return ADC;
}
