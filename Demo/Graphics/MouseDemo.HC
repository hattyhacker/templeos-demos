U0 Mouse()
{
  "Press left mouse bttn to exit.\n";
  while (!ms.lb) { //Left bttn to exit.
    GrPlot(ms.pos.x,ms.pos.y);
    GrPlot(ms.pos.x+10,ms.pos.y-10,ms.pos.x-10,ms.pos.y+20);
    Refresh;
  }
  DCFill;
}

Mouse;
