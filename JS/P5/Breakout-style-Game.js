let rx, ry;
const rw = 150, rh = 30
let r, g, b;

let cnt = 0;

let cx, cy;
let cdirx, cdiry, cspeed;
const cr = 15;

function arrow() {
  if (keyIsDown(LEFT_ARROW)) {
      rx -= 5;
  } 
  else if (keyIsDown(RIGHT_ARROW)) {
      rx += 5;
  }
  return rx;
}

function circleDraw(){
  
  if((cx >= rx && cx <= rx + rw) && (cy >= ry - cr)){
     cdiry = -cdiry;
     cy = ry - cr;
  }
  
  
  
  
  //fill(0,0,255)
  //왼쪽
  if(cx < cr){
   cdirx = -cdirx;  
  }
  
  //오른쪽
  if(cx >= width -cr){
    cdirx = -cdirx;
  }
  
  //위
  if(cy <= cr){
     cdiry = -cdiry;
  }
  
  //아래
  if(cy >= height - cr){
     cdiry = -cdiry;
  }
  
  cy = cy + cdiry * cspeed;
  cx = cx + cdirx * cspeed;
  circle(cx, cy, cr*2);
}

function setup() {
  createCanvas(720, 540);
  
  rx = width / 2 - rw / 2;
  ry = height - rh;
  
  cx = floor(width / 2);
  cy = floor(height / 2);
  
  cdirx = -1;
  cdiry = -1;
  cspeed = 5;
}

function rectDraw(){
  rx = arrow();
  ry = height - rh - 1;  
  
  if(rx >= width - rw -1){
     rx = width - rw -1;
  }
  else if(rx <= 0){
     rx = 0;     
  }
  
  if(cnt % 10 == 0){
    r = random(255);
    g = random(255);
    b = random(255);    
  }

  fill(r, g, b);
  noStroke();
  rect(rx, ry, rw, rh);
}

function draw() {
  background(220);
  //cnt++;
  //print(cnt);
  circleDraw();
  rectDraw();
}
