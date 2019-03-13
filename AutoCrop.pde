import java.util.*;

PImage img, imgCropped;
color bgColor = color(0);

void setup() {
  size(50, 50, P2D);

  img = loadImage("test.png");
  imgCropped = cropImage(img, bgColor);
  println(img.width + " " + img.height + " -> " + imgCropped.width + " " + imgCropped.height);
  surface.setSize(imgCropped.width, imgCropped.height);
}

void draw() {
  image(imgCropped, 0, 0);
}
