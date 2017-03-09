import processing.serial.*;
import java.io.*;
int mySwitch=0;
int counter=0;
int [] doneEncoding;
String completeRawString;
String[] subtext;
Serial myPort;

int[] encode(String s){
  int bitCount = s.length()*8;
  //each letter requires 8 bit to represent
  int encodedvalue[] = new int[bitCount];
  for(int r=0;r<bitCount;r++){
    //sketchy way to convert char at string element to binary in 1 line.
    encodedvalue[r]=Integer.parseInt(Integer.toBinaryString(s.charAt(r/8)));
  }
  
  
  return encodedvalue;
}

void setup(){
 mySwitch=1;

 //Make sure the COM port is correct
 myPort = new Serial(this, "COM3", 9600);
 myPort.bufferUntil('\n');
}

void draw() {
 myPort.write('0');
 if (mySwitch>0){
 readData("C:/Users/andrewseto/Desktop/mySensorData.txt");
 
 mySwitch=0;
 }

 if(counter<completeRawString.length()*8){
   //System.out.print(subtext[counter]);
   
   doneEncoding = encode(completeRawString);
   System.out.println(doneEncoding[counter]);
   if (doneEncoding[counter]==1)
     myPort.write('4');
   if (doneEncoding[counter]==0)
     myPort.write('0');
     
   //myPort.write(doneEncoding[counter]);
   delay(100);
   counter++;
 } 
 else{
   delay(5000);
   mySwitch=1;
   }
} 

// THE FILEREADER
void readData(String myFileName){
  File file=new File(myFileName);
  BufferedReader br=null;
 
  try{
    br=new BufferedReader(new FileReader(file));
    String text=null;
    
    while((text=br.readLine())!=null){
      completeRawString=text;
      subtext = splitTokens(text,",");
      //System.out.print(text);
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
}