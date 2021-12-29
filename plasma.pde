// http://studio.sketchpad.cc/sp/pad/view/ro.9UsliAr0oIAAh/rev.638
// created by Zach Denton
// is licensed under a Creative Commons Attribution-Share Alike 3.0 License.
int count = 0;
int saveCount = 0;
int t = 0;
int f = 100;
float scale=0.0002;
int[] plasma;
color palette[];
void setup() {
  size(5500, 5500);
  smooth();

  colorMode(HSB);
  palette = new color[256];
  for (int i = 0; i < 256; i++) {
    palette[i] = color(i, 255, 255);
  }

  plasma = new int[width*height];
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      plasma[y*width+x] = int(255*abs(sin(noise(x*scale, y*scale)*f)));
    }
  }
}
void draw() {
  loadPixels();
  for (int i = 0; i < plasma.length; i++) {
    pixels[i] = palette[(plasma[i] + t) % 256];
  }
  updatePixels();
  t++;

  count ++;
  if (count == 20) {
    saveCount ++;
    count = 0;
   // save("plasma_" + saveCount + ".png");
  }
}
