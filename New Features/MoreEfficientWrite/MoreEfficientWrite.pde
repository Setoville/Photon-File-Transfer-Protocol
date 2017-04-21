import processing.serial.*;
import java.io.*;

String completeRawString;
String[] subtext;
char[] myCharArray;
Serial myPort;
int chararrayiterator = 0;
boolean write = true;
int globalClk = 0;
int [] encodedBits;


int[] encode(char s){
  int ascii = (int) s;
  int encodedvalue[] = new int [8];
  int startBitPosition = 128;
  bigloop:for(int r=0;r<8;r++){
    
    if (ascii - startBitPosition < 0){
      encodedvalue[r]=0;
    }
    else if (ascii - startBitPosition > 0){
       encodedvalue[r]=1;
       ascii=ascii-startBitPosition;

    }
    else if (ascii - startBitPosition == 0){
      encodedvalue[r]=1;
      ascii=ascii-startBitPosition;

      break bigloop;
    }

    startBitPosition = startBitPosition/2;

  }
  for(int r=0;r<8;r++)
    System.out.print(encodedvalue[r]);
    
    System.out.println();

  return encodedvalue;
}

void setup(){

 //Make sure the COM port is correct
 myPort = new Serial(this, "COM3", 9600);
 myPort.bufferUntil('\n');
}

void draw() {
readData("C:/Users/andrewseto/Desktop/mySensorData.txt");
//System.out.print(chararrayiterator);

//System.out.println(myCharArray[chararrayiterator]);


encodedBits = encode(myCharArray[chararrayiterator]);

if (write && globalClk<3){
 myPort.write('1');
 myPort.write('2');
 myPort.write('3');
 myPort.write('4');
 myPort.write('5');
 myPort.write('6');
 myPort.write('7');
 myPort.write('8');
 myPort.write('9');
}
else{
myPort.write('0');
}

chararrayiterator++;

globalClk++;
if (globalClk>6)globalClk=0;
if (chararrayiterator >= completeRawString.length()){
  chararrayiterator = 0;
}

} 

void readData(String myFileName){
  File file=new File(myFileName);
  BufferedReader br=null;
 
  try{
    br=new BufferedReader(new FileReader(file));
    String text=null;
    
    while((text=br.readLine())!=null){
      completeRawString=text;
    }
  }catch(FileNotFoundException e){
    e.printStackTrace();
}catch(IOException e){
    e.printStackTrace();
}finally{
  try {
  if (br != null){
  br.close();
    }
  } catch (IOException e) {
        e.printStackTrace();
      }
    }
   
   myCharArray = completeRawString.toCharArray();  
   
}