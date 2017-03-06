int lightPinA = 0;  //define a pin for Photo 
int lightPinB = 1;
int lightPinC = 2;
int CLKLED = 11;
int ledPin=12;     //define a pin for LED
int input = 0;
int output = 0;
int FLIPVALUE = 8;

int bits[8];
int process(int bits[8]);
void setup()
{
    Serial.begin(9600);  //Begin serial communcation
    pinMode( ledPin, OUTPUT );
}
void loop()
{

    //reader
    if (analogRead(lightPinA)>700 || analogRead(lightPinB)>700 || analogRead(lightPinC)>700){
      bits[input]=1;
      digitalWrite(ledPin, HIGH);
      
    }
    else {
      bits[input]=0;
      digitalWrite(ledPin, LOW);
    }
    
    input++;
    if (input == FLIPVALUE){
      for(int r=0;r<FLIPVALUE;r++){
        Serial.print(bits[r]);
        Serial.print(" ");
      }

      int decodedAscii = process(bits);
      Serial.print("Decoded:");
      Serial.print(decodedAscii);
      Serial.print(" ASCII:");
      Serial.print((char)decodedAscii);
      for(int r=0;r<FLIPVALUE;r++){
        bits[r]=0;
      }
      Serial.println(" ");

      input = 0;

    }
    //CLOCK LED (for timing testing purposes)
    //set at 10Hz
    digitalWrite(CLKLED, HIGH);
    delay(100);
    digitalWrite(CLKLED,LOW);
    delay(100);

   
}
int process(int bits[8]){
  int total = 0;
  for(int r=0;r<8;r++){
      total = total << 1 | bits[r];
  }
  return total;
}
