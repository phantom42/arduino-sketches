const int sensorPin = 2 ;
const int minLEDPin = 3 ;
const int maxLEDPin = 7 ;

const int sampleWindow = 50 ;
unsigned int sample ;

int buttonState = 0 ;
int randPin = 0 ;
int alreadyActive = 0 ;

void setup() {
  pinMode(sensorPin, INPUT) ;
  turnOff() ;
}
void loop(){
  unsigned long startMillis = millis() ; // start of sample window
  unsigned int peakToPeak = 0 ; // peak-to-peak level
  
  unsigned int signalMax = 0 ;
  unsigned int signalMin = 1024 ;
  
  //collect data for 50 ms
  while (millis() - startMillis < sampleWindow)
  {
    sample = analogRead(2) ;
    //Serial.println(sample) ;
    if (sample < 1024) // dump spurious readings
    {
      signalMax = max(signalMax, sample) ;
      signalMin = min(signalMin, sample) ;
    }
  }
  peakToPeak = signalMax - signalMin ; // get the delta 
  if (peakToPeak > 10)
  {
    activateRandomLEDs() ;
    delay(sampleWindow * 3) ;
  }
  turnOff() ;
}
void turnOff(){
   for (int i = minLEDPin; i <= maxLEDPin ; i++) {
    pinMode(i, OUTPUT) ;
    digitalWrite(i, LOW) ;
  }
}
void activateRandomLEDs()
{
  int onOff = 0 ;
  for (int i = minLEDPin ; i <= maxLEDPin;i++) {
    onOff = random(0,2) ;
    if (onOff > 0) {
      digitalWrite(i,HIGH) ;
    }
  }
}
