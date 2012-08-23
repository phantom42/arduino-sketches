#include <Servo.h>

Servo cockatooJaw ;

int initPos = 0 ;
int currentPos = 0 ;
int jawRange = 20 ; //use 25 for small motor
int jawSpeed = 0 ;
int jawMinSpeed = 1 ;
int jawMaxSpeed = 3 ;
int pirPin = 8 ;
int ledPin = 11 ;
int jawPin = 9 ;
int activeStart = 0 ;
int lightLength = 1000 * 5 ;
int pirTrigger ;
int loopCounter ;
int numLoops ;
boolean activeLight = false ;

void setup() {
  cockatooJaw.attach(jawPin) ;
  pinMode(ledPin, OUTPUT) ;
  pinMode(pirPin, INPUT) ;
  initPos = cockatooJaw.read() ;
  activeStart = millis() ;
  digitalWrite(ledPin, LOW) ;
  Serial.begin(9600);
}
void loop() {
  pirTrigger = digitalRead(pirPin) ;
  Serial.println(pirTrigger);
  currentPos = cockatooJaw.read() ;
  //jawSpeed = random(jawMinSpeed,jawMaxSpeed) ;
  numLoops = random(5,15) ;
  if(pirTrigger == HIGH) {
    Serial.println("triggered");
    //Serial.println(millis());
    //activeStart = millis() ;
    digitalWrite(ledPin, HIGH) ;
    //activeLight = true ;
    for (loopCounter = 0; loopCounter < numLoops; loopCounter++) {
      jawSpeed = random(jawMinSpeed,jawMaxSpeed) ;
      Serial.println(loopCounter) ;
      for (currentPos = initPos; currentPos < initPos + jawRange; currentPos += jawSpeed) {
        if (currentPos > initPos + jawRange) {
          currentPos = initPos + jawRange ;
        }
        cockatooJaw.write(currentPos) ;
        delay(15) ;
      }
      for (currentPos = initPos; currentPos >= initPos; currentPos -= jawSpeed) {
        if (currentPos < initPos) {
          currentPos = initPos ;
        }
        cockatooJaw.write(currentPos) ;
        delay(50) ;
      }
    }
    delay(10000);
    digitalWrite(ledPin, LOW) ;
  } else {
    digitalWrite(ledPin, LOW) ;
  }
  /*
  if (activeLight == true && millis() >= activeStart + lightLength) {
    Serial.println(millis());
    digitalWrite(ledPin, LOW) ;
    activeLight = false ;
  }
  */
}
