//1-0-0 - add edges,points,fixed,remove points,save/open
//2-0-0 - add muscles smoothCos and jerkyCos
//2-0-1 - add more controls, info, ability to rem edges
//2-0-2 - add ability to cycle through "isMuscle" and "muscleType" 
final String versionNumber="2-0-2";
final String versionNumberFormatted="2.0.2";

PFont fontNormal;
PFont fontBold;
//PFont fontItalic;
//PFont fontUnderlined;

void setup() {
  size(500, 500);
  //key=' ';
  fontNormal=loadFont("Monospaced-10-normal.vlw");
  fontBold=loadFont("Monospaced-15-normal.vlw");
  //fontItalic=loadFont("Monospaced-10-italic.vlw");
  //fontUnderlined=loadFont("Monospaced-10-underlined.vlw");
  textFont(fontNormal);
}