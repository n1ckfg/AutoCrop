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
