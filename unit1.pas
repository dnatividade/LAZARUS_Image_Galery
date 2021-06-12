unit Unit1;

//SOURCE:
//https://www.youtube.com/watch?v=yX5Y9ytp5K0
//http://www.activedelphi.com.br/forum/viewtopic.php?t=47260&postdays=0&postorder=asc&start=15&sid=0bfcb906248f94b2e563e1934e308dc3


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1SelectionChanged(Sender: TObject);
  private
    procedure Click(Sender: TObject);

  public

  end;

var
  Form1: TForm1;

const
  QT_IMG = 8;
  IMG_WIDTH = 150;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  i, posX: SmallInt;
  P: TPanel;
  Img: TImage;

begin
  //parameters initialize
  ScrollBox1.DestroyComponents;
  posX:= 0;
  //for all images
  for i:= 1 to QT_IMG do
  begin
    //Panel config
    P:= TPanel.Create(ScrollBox1);
    P.Parent:= ScrollBox1;
    P.Left:= posX + 1;
    P.Width:= IMG_WIDTH;
    P.Height:= ScrollBox1.Height-1;
    //Image config
    Img:= TImage.Create(P);
    Img.Name:= 'img1';
    Img.Parent:= P;
    Img.Align:= alClient;
    Img.Proportional:= true;
    Img.Picture.LoadFromFile('.\img\0'+IntToStr(i)+'.jpg');
    //when to click on image
    Img.OnClick:= @Click;
    //update image position
    posX:= posX + IMG_WIDTH + 1;
  end;
end;

procedure TForm1.RadioGroup1SelectionChanged(Sender: TObject);
begin
  Image1.Stretch:= not Image1.Stretch;
  Image1.Proportional:= not Image1.Proportional;
end;

procedure TForm1.Click(Sender: TObject);
begin
  Image1.Picture:= (Sender as TImage).Picture;
end;

end.

