class Platform{
  //l and w stand for length and width, just to be clear.
  //tone is a place holder for color, since... color is used by processing.
  //c stands for color
  int x, y, l, w;
  String c;
  
  Platform(int platX, int platY, int platL, int platW, String tone){
    x = platX;
    y = platY;
    l = platL;
    w = platW;
    c = tone;
  }// end constructor
  //getters
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getL(){
    return l;
  }
  int getW(){
    return w;
  }
  //end getters
  //setters
  void setX(int platX){
    x = platX;
  }
  void setY(int platY){
    y = platY;
  }
  void setL(int platL){
    l = platL;
  }
  void setW(int platW){
    w = platW;
  }
  //end setters
  void display(){
    rect(x, y, l, w);
  }
}
