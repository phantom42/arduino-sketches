const int sensorPin = 2 ;
const int minLEDPin = 3 ;
const int maxLEDPin = 7 ;

const int sampleWindow = 50 ;
unsigned int sample ;
unsigned int activeCount = 0 ;
unsigned long lastTrigger ;

int counter = 0 ;
int buttonState = 0 ;
int randPin = 0 ;
void setup() {
  pinMode(sensorPin, INPUT) ;
  turnOff() ;
}
void loop(){
  unsigned long startMillis = millis() ; // start of sample window
  unsigned int peakToPeak = 0 ; // peak-to-peak level
  
  unsigned int signalMax = 0 ;
  unsigned int signalMin = 1024 ;
  turnOff() ;
  //collect data for 50 ms
  while (millis() - startMillis < sampleWindow)
  {
    sample = analogRead(2) ;
    if (sample < 1024) // dump spurious readings
    {
      signalMax = max(signalMax, sample) ;
      signalMin = min(signalMin, sample) ;
    }
  }
  
    peakToPeak = signalMax - signalMin ; // get the delta 
    if (peakToPeak > 10)
    {
      if (activeCount == 0)
      {
        lastTrigger = millis() ;
        activateRandomLEDs() ;
      }
      activeCount += 1 ;
      
    } 
    if (activeCount > 3) {
       activeCount = 0 ;
    }
    if (millis() - lastTrigger > sampleWindow * 3)
    {
      activeCount = 0 ;
    }
    //alreadyActive = false ;
 
  
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
  delay(sampleWindow * 3) ;
}
void flash()
{
  for (int i = minLEDPin ; i <= maxLEDPin ; i++) {
    digitalWrite(i,HIGH) ;
  }
  delay(sampleWindow * 10) ;
}
