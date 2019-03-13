PImage img, imgCropped;
color bgColor = color(0);

void setup() {
  size(256, 256, P2D);

  img = loadImage("test.png");
  imgCropped = resizeImage(squareImage(cropImage(img, bgColor), bgColor), width, height);
  println(img.width + " " + img.height + " -> " + imgCropped.width + " " + imgCropped.height);
}

void draw() {
  image(imgCropped, 0, 0);
}
