










$TX+CX," "$$SP,"",BI=1,BP="C:/Home/sprites/butterfly2,1"$$ER$







I64 QuietGodBits(I64 num_bits)
{//Return N bits. If low on entropy pop-up okay.
  U8 b;
  I64 res=0;
  while (num_bits) {
    if (FifoU8Rem(god.fifo,&b)) {
      res=res<<1+b;
      num_bits--;
    } else
      GodBitsIns(GOD_GOOD_BITS,RandI64);
  }
  return res;
}


U0 Butterfly()
{
  CDC *dc=DCAlias;
  DCDepthBufAlloc(dc);
  dc->flags|=DCF_TRANSFORMATION;
  DocClear;

  F64 yRotSpeed = 0.05;
  U64 colCount = 0, lineCount = 0;
  U64 msg = "TEMPLE OS ";
  U64 bits = 8;
  U8 finalLine = FALSE;

  I64 colors[15];
   colors[0] = "BLACK";
   colors[1] = "BLUE";
   colors[2] = "GREEN";
   colors[3] = "CYAN";
   colors[4] = "RED";
   colors[5] = "PURPLE";
   colors[6] = "BROWN";
   colors[7] = "LTGREY";
   colors[8] = "DKGREY";
   colors[9] = "LTBLUE";
   colors[10] = "LTGREEN";
   colors[11] = "LTCYAN";
   colors[12] = "LTRED";
   colors[13] = "LYTPURPLE";
   colors[14] = "YELLOW";

  try {
    U64 counter = 100;

    while (!ScanChar) {
      DCDepthBufRst(dc);
      Mat4x4RotY(dc->r,yRotSpeed);

      dc->x=Fs->pix_width/2;	//x-offset: center screen
      dc->y=Fs->pix_height/2;	//y-offet: center screen
      dc->z=GR_Z_ALL;		//Offsets the image Z so that no parts are clipped by contextual pane of screen

      Sprite3(dc,0,0,0,$IB,"<1>",BI=1$);	// We don't need x,y,z set as it's in dc
      Refresh;			// Change val to set "framerate"
      DCFill;			// Stops sprite from persisting in window

      // Writes Random BGText Until last line of docwin
      if (finalLine == TRUE) {
	   U8 continue = 0;
           continue = 8;
      }
      else if (lineCount+1 >= TEXT_ROWS-3){//15) {
            "$$FD$$$$TX+BK+CX+UL,\"TEMPLE OS\"$$$$FD$$\n";
            finalLine = TRUE;
      }
      else if (colCount+StrLen(msg) < TEXT_COLS){//-3) {
        U16 randNum = RandU16%20;
        while (randNum > 14 || randNum < 0) {
          randNum = RandU16%20;
        }
        U32 color = colors[randNum];

        Print("$$%s$$%s", color, msg);

        colCount+=StrLen(msg);
      }
      else {

        colCount = 0;
        lineCount ++;
        "\n";
        I64 godBits = QuietGodBits(bits);
        msg = "";

        while(StrLen(msg) < 3) {
            msg = MStrPrint("%s  ",god.words[(godBits+counter)%god.num_words]);
            // Does the Same as the God Stuff Entropy Popup, but without the msgbox
            GodBitsIns(GOD_GOOD_BITS, (KbdMsEvtTime>>GOD_BAD_BITS));
            counter += Rand+1000;

        }
      }
    }
  } catch
    PutExcept;

  DocClear;		// We want the starting term to auto-boot to clean term
  DCFill;		// Is this really necessary?
  DCDel(dc);
}




//Butterfly;
 
