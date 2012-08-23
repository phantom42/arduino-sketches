int pirPin = 8 ;
int ledPin = 11 ;
int activeSwitch = 0  ;
int readVal ;

void setup() {
  pinMode(ledPin, OUTPUT) ;
  pinMode(pirPin, INPUT) ;
}

void loop(){
    readVal = digitalRead(pirPin) ;

    if (readVal == HIGH) {
        digitalWrite(ledPin,HIGH) ;
        delay(450) ;
        digitalWrite(ledPin,LOW) ;
        delay(250) ;
        digitalWrite(ledPin,HIGH) ;
        delay(100) ;
        digitalWrite(ledPin,LOW) ;
        delay(100) ;
        digitalWrite(ledPin,HIGH) ;
        delay(250) ;
        digitalWrite(ledPin,LOW) ;
        delay(100) ;
        digitalWrite(ledPin,HIGH) ;
        delay(20000) ;
        digitalWrite(ledPin,LOW) ;
    } else {
      digitalWrite(ledPin, LOW) ;
    }
    
}
