PImage cropImage(PImage _img, color _bgColor) {
  ArrayList<Integer> allX = new ArrayList<Integer>();
  ArrayList<Integer> allY = new ArrayList<Integer>();
  _img.loadPixels();
  
  for (int y=0; y<_img.height; y++) {
    for (int x=0; x<_img.width; x++) {
      int loc = x + y * _img.width;
      color c = _img.pixels[loc];
      if (c != _bgColor) {
        allX.add(x);
        allY.add(y);
      }
    }  
  }
  
  Collections.sort(allX);
  Collections.sort(allY);
  
  int minX = allX.get(0);
  int minY = allY.get(0);
  int maxX = allX.get(allX.size()-1) - minX;
  int maxY = allY.get(allY.size()-1) - minY;

  return _img.get(minX, minY, maxX, maxY);  
}

PImage squareImage(PImage _img, color _bgColor) {
  PGraphics gfx = createGraphics(_img.width, _img.width, P2D);
  if (_img.width < _img.height) {
    gfx = createGraphics(_img.height, _img.height, P2D);
  } else if (_img.width == _img.height) {
    return _img;
  }
  gfx.beginDraw();
  gfx.background(_bgColor);
  gfx.imageMode(CENTER);
  gfx.image(_img, gfx.width/2, gfx.height/2);
  gfx.endDraw();
  
  return gfx;
}

PImage resizeImage(PImage _img, int w, int h) {
  PGraphics gfx = createGraphics(w, h, P2D);
  
  gfx.beginDraw();
  gfx.image(_img, 0, 0, gfx.width, gfx.height);
  gfx.endDraw();
  
  return gfx;
}
