class Player{
  //l and w stand for length and width.
  int x, y, l, w;
  boolean collisionFound = false;
  boolean moveCollision = false;
  float fallspeed;
  
  Player (int playerX, int playerY, int playerL, int playerW) {
    x = playerX;
    y = playerY;
    w = playerW;
    l = playerL;
    fallspeed = 1;
  }
  
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
  void setX(int playerX){
    x = playerX;
  }
  void setY(int playerY){
    y = playerY;
  }
  //end setters
  void display(){
    fill(255, 0, 0);
    rect(x, y, l, w);
    fill(255, 255, 255);
  }//end display()
  
  void move(String direction, ArrayList<Platform> platformList){
    if (direction == "a"){
      if (x > 0){
        //boolean moveCollision = false;
        for (int i = 0; i < platformList.size(); i++){
          if (collisionCheck("a", platformList.get(i).getX(), platformList.get(i).getY(), platformList.get(i).getL(), platformList.get(i).getW())){
            moveCollision = true;
            break;
          }//end if
        }//end for
        if (!moveCollision){
          x-=5;
        }
      }//end if
      moveCollision = false;
    }//end if "a"
    if (direction == "d"){
      if (x < 600 - w){
        //boolean moveCollision = false;
        for (int i = 0; i < platformList.size(); i++){
          if (collisionCheck("d", platformList.get(i).getX(), platformList.get(i).getY(), platformList.get(i).getL(), platformList.get(i).getW())){
            moveCollision = true;
            break;
          }//end if
        }//end for
        if (!moveCollision){
          x+=5;
        }//end if
        moveCollision = false;
      }//end if
    }//end if "d"
    if (direction == "w"){
      if(x > w){
        for (int i = 0; i < 3; i++){
          for (int j = 0; j < platformList.size(); j++){
            if (collisionCheck("w", platformList.get(i).getX(), platformList.get(i).getY(), platformList.get(i).getL(), platformList.get(i).getW())){
              moveCollision = true;
              break;
            }//end if
          }//end for j
          if (!moveCollision){
            y-=5;
          }//end if
          moveCollision = false;
        }//end for i
      }//end if
    }//end direction = w
  }//end move()
  
  void fall(ArrayList<Platform> platformList){
    if (y   < 600 - w){
      //boolean collisionFound = false;
      for (int i = 0; i < platformList.size(); i++){
        if(collisionCheck("gravity", platformList.get(i).getX(), platformList.get(i).getY(), platformList.get(i).getL(), platformList.get(i).getW())){
          collisionFound = true;
          break;
        }//end if
        if(!collisionFound){
          y += fallspeed;
        }//end collision found
        collisionFound = false;
      }//end for
    }//end if
  }//end fall()
  
  boolean collisionCheck(String direction, int rectX, int rectY, int rectL, int rectW){
    if (direction == "a"){
      if ((x-5 < rectX + rectL) && (x-5 + l > rectX) && (y < rectY + rectW) && (y + w > rectY)){
        return true;
      }
      else {
        return false;
      }
    }//end if "a"
    
    if (direction == "d"){
      if ((x+5 < rectX + rectL) && (x+5 + l > rectX) && (y < rectY + rectW) && (y + w > rectY)){
        return true;
      }//end if
      else{
        return false;
      }//end else
    }//end direction = d
    
    if (direction == "w"){
      if ((x < rectX + rectL) && (x + l > rectX) && (y-5 < rectY + rectW) && (y-5 + w > rectY)){
        return true;
      }//end if
      else{
        return false;
      }
    }//end if
    if (direction == "gravity"){
      if ((x < rectX + rectL) && (x + l > rectX) && (y+ (fallspeed * 1.5) < rectY + rectW) && (y + (fallspeed * 1.5) + w > rectY)){
        return true;
      }//end if
      else {
        return false;
      }//end else
    }//end if gravity
    else {
      return false;
    }

  }
}
