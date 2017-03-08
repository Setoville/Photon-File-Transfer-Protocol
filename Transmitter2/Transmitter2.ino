void setup() { 
 pinMode(2, OUTPUT);
 pinMode(3, OUTPUT);
 pinMode(4, OUTPUT);
 pinMode(5, OUTPUT);
 pinMode(6, OUTPUT);
 pinMode(7, OUTPUT);
 pinMode(8, OUTPUT);
 pinMode(9, OUTPUT);
 pinMode(10, OUTPUT);
 Serial.begin(9600);
}

void loop() {
 byte byteRead;

 if (Serial.available()) {
 
 byteRead = Serial.read();
 byteRead=byteRead-'0';
 
 //Turn off all LEDs if the byte Read = 0
 if(byteRead==0){
 //Turn off all LEDS
 digitalWrite(2, LOW);
 digitalWrite(3, LOW);
 digitalWrite(4, LOW);
 digitalWrite(5, LOW);
 digitalWrite(6, LOW);
 digitalWrite(7, LOW);
 digitalWrite(8, LOW);
 digitalWrite(9, LOW);
 digitalWrite(10, LOW);
 }
 
 //Turn LED ON depending on the byte Read.
 if(byteRead>0){
 digitalWrite((byteRead+1), HIGH); // set the LED on
 }
 }
 }
