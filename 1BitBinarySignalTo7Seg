int lightPinA = 0;  //define a pin for Photo 
int lightPinB = 1;
int lightPinC = 2;
int CLKLED = 11;
int ledPin=12;     //define a pin for LED
int input = 0;
int output = 0;

void zero();
void one();
void two();
void three();
void four();
void five();
void six();
void seven();
void eight();
void nine();

int bits[3];

void setup()
{
    Serial.begin(9600);  //Begin serial communcation
    pinMode( ledPin, OUTPUT );
}
void loop()
{

    
    if (analogRead(lightPinA)>700 || analogRead(lightPinB)>700 || analogRead(lightPinC)>700){
      bits[input]=1;
      Serial.print("1");
      digitalWrite(ledPin, HIGH);
    }
    else {
      bits[input]=0;
      Serial.print("0");
      digitalWrite(ledPin, LOW);
    }
    Serial.print(" ");

    input++;
    if (input == 3){
      input = 0;

     //convert from binary to decimal for 7 seg
     output = bits[2] + bits[1]*2 + bits[0]*4; 

     //7 SEGMENT (ugly)
      switch(output){
        case 0:
          zero();
          break;
        case 1:
          one();
          break;
        case 2:
          two();
          break;
        case 3:
          three();
          break;
        case 4:
          four();
          break;
        case 5:
          five();
          break;
        case 6:
          six();
          break;
        case 7:
          seven();
          break;
        case 8:
          eight();
          break;
        case 9:
          nine();
          break;
        default:
          zero();
          break;
      }
      
      
      Serial.print(" Decoded value:");
      Serial.println(output);
      output = 0;
      for(int r=0;r<3;r++){
        bits[r]=0;
      }
    }
    //CLOCK LED (for timing testing purposes)
    digitalWrite(CLKLED, HIGH);
    delay(10);
    digitalWrite(CLKLED,LOW);
    delay(500);

    //analogWrite(ledPin, analogRead(lightPinA)/4);  //send the value to the ledPin. Depending on value of resistor 
    //Serial.println(ledPin);
                                                
  
 


}
void zero(){
      digitalWrite(2, HIGH);
      digitalWrite(3, HIGH);
      digitalWrite(4, HIGH);
      digitalWrite(5, HIGH);
      digitalWrite(6, HIGH);
      digitalWrite(7, HIGH);
      digitalWrite(8, LOW);
}
void one(){
      digitalWrite(2, LOW);
      digitalWrite(3, HIGH);
      digitalWrite(4, HIGH);
      digitalWrite(5, LOW);
      digitalWrite(6, LOW);
      digitalWrite(7, LOW);
      digitalWrite(8, LOW);
}
void two(){
    digitalWrite(2,HIGH);
    digitalWrite(3,HIGH);
    digitalWrite(4,LOW);
    digitalWrite(5,HIGH);
    digitalWrite(6,HIGH);
    digitalWrite(7,LOW);
    digitalWrite(8,HIGH);
}
void three(){
    digitalWrite(2,HIGH);
    digitalWrite(3,HIGH);
    digitalWrite(4,HIGH);
    digitalWrite(5,HIGH);
    digitalWrite(6,LOW);
    digitalWrite(7,LOW);
    digitalWrite(8,HIGH);
}
void four(){
    digitalWrite(2,LOW);
    digitalWrite(3,HIGH);
    digitalWrite(4,HIGH);
    digitalWrite(5,LOW);
    digitalWrite(6,LOW);
    digitalWrite(7,HIGH);
    digitalWrite(8,HIGH);
}
void five(){
    digitalWrite(2,HIGH);
    digitalWrite(3,LOW);
    digitalWrite(4,HIGH);
    digitalWrite(5,HIGH);
    digitalWrite(6,LOW);
    digitalWrite(7,HIGH);
    digitalWrite(8,HIGH);
}
void six(){
    digitalWrite(2,HIGH);
    digitalWrite(3,LOW);
    digitalWrite(4,HIGH);
    digitalWrite(5,HIGH);
    digitalWrite(6,HIGH);
    digitalWrite(7,HIGH);
    digitalWrite(8,HIGH);
}
void seven(){
    digitalWrite(2,HIGH);
    digitalWrite(3,HIGH);
    digitalWrite(4,HIGH);
    digitalWrite(5,LOW);
    digitalWrite(6,LOW);
    digitalWrite(7,LOW);
    digitalWrite(8,LOW);
}
void eight(){
    digitalWrite(2,HIGH);
    digitalWrite(3,HIGH);
    digitalWrite(4,HIGH);
    digitalWrite(5,HIGH);
    digitalWrite(6,HIGH);
    digitalWrite(7,HIGH);
    digitalWrite(8,HIGH);
}
void nine(){
    digitalWrite(2,HIGH);
    digitalWrite(3,HIGH);
    digitalWrite(4,HIGH);
    digitalWrite(5,HIGH);
    digitalWrite(6,LOW);
    digitalWrite(7,HIGH);
    digitalWrite(8,HIGH);
}
