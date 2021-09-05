import org.gicentre.handy.*;
 
HandyRenderer h;
 
void setup()
{
  size(900, 600);
  h = new HandyRenderer(this);
}
 
void draw()
{
  background(245, 215, 200);
  h.rect(width/4, height/4, 450, 300);
}
