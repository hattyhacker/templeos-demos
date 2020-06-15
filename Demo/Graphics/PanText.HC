U0 PanText()
{
  I64 i;
  I64 limit = 7; //jspann added
  for (i=0;i<=limit;i++) {
    gr.pan_text_x=i;
    Sleep(30);
  }
  i--;
  for (;i>=-limit;i--) {
    gr.pan_text_x=i;
    Sleep(30);
  }
  i++;
  for (;i<=0;i++) {
    gr.pan_text_x=i;
    Sleep(30);
  }

  for (i=0;i<=limit;i++) {
    gr.pan_text_y=i;
    Sleep(30);
  }
  i--;
  for (;i>=-limit;i--) {
    gr.pan_text_y=i;
    Sleep(30);
  }
  i++;
  for (;i<=0;i++) {
    gr.pan_text_y=i;
    Sleep(30);
  }
}

PanText;
