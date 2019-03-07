
Player player = new Player(300, 300, 20, 20);
boolean[] keys = new boolean [128];
//creating an arraylist of platforms
Platform platform1 = new Platform(100, 300, 50, 50, "r");
Platform platform2 = new Platform(200, 400, 300, 50, "b");
Platform platform3 = new Platform(200, 200, 50, 400, "g");
Platform platform4 = new Platform( 100, 100, 50, 50, "r");
ArrayList <Platform> platformList = new ArrayList <Platform>();



void setup() {
  size(600,600);
  frameRate(60);
  platformList.add(platform1);
  platformList.add(platform2);
  platformList.add(platform3);
  //platformList.add(platform4);
}

void draw() {
  background(0);
  player.fall(platformList);
  keyTest();
  for (int i = 0; i < platformList.size(); i++){
    platformList.get(i).display();
  }
  player.display();
  
}

void keyTest(){
  if (keys['a']){
      player.move("a", platformList);
    }//end if
  if (keys['w']){
    player.move("w", platformList);
  }
  if (keys['d']){
    player.move("d", platformList);
  }
}//end keyTest()
void keyPressed() {
  keys[key] = true;
}
void keyReleased() {
  keys[key] = false;
}
