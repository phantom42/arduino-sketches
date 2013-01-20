const int sensorPin = 2 ;
const int minLEDPin = 3 ;
const int maxLEDPin = 5 ;

int buttonState = 0 ;
int randPin = 0 ;
int alreadyActive = 0 ;

void setup() {
  pinMode(sensorPin, INPUT) ;
  turnOff() ;
}
void loop(){
  buttonState = digitalRead(sensorPin) ;
  
  if (buttonState == HIGH && alreadyActive == 0) {
     randPin = random(minLEDPin, maxLEDPin+1) ; // random returns between x and y-1
     digitalWrite(randPin, HIGH) ;
     alreadyActive = 1 ;
     
  } else if (buttonState == HIGH){
    // button still pressed, leave LED on 
  } else {
    // button is not pressed. shut off all led's
    turnOff() ;
    alreadyActive = 0 ;
  }
}
void turnOff(){
   for (int i = minLEDPin; i <= maxLEDPin ; i++) {
    pinMode(i, OUTPUT) ;
    digitalWrite(i, LOW) ;
  }
}
