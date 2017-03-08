int lightPinA=0;
int lightPinB=1;
int lightPinC=2;
int IRpin=3;

int CLKLED=11;
int FLIPVALUE=8;
char bencode[1000];
String prebencode;
void setup() {
  Serial.begin(9600);
  prebencode = Serial.read();

  
}

void loop() {

  Serial.println(analogRead(lightPinA));
  
  
}
