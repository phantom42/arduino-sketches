#include <Servo.h>

Servo cockatooJaw ;

int initPos = 0 ;

void setup() {
  cockatooJaw.attach(9) ;
  Serial.begin(9600) ;
  initPos = cockatooJaw.read() ;
  Serial.println(initPos) ;
  cockatooJaw.write(0) ;
}
void loop() {
  delay(250) ;
}
