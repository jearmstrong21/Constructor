final float versionNumber=2;

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