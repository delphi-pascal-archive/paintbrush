unit DrawingToolTrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ExtDlgs,jpeg, ToolWin, ComCtrls, ImgList;

type
  TDrawingTool = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;
var   AirBrushRadius,AirBrushIntens:integer;
MaxCut,MinCut:TPoint;
PCol:TColor;
implementation

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TAirbrushThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TAirbrushThread }
uses Unit1,Options;
procedure TDrawingTool.Execute;
var x,y,delay:integer;
Rectan:TRect;
Bitmap:TBitmap;
PenWidth:integer;
begin
  { Place thread code here }
PCol:=Form1.Image1.Canvas.Pen.Color;
Form1.SaveImage;
Form1.Image1.Canvas.Pen.Mode:=pmCopy;
case Form1.DrawingTool of
dtErase:
begin
x:=frOptions.EraseRadius*2;
Bitmap:=TBitmap.Create;
Bitmap.Height:=x;
Bitmap.Width:=x;
Rectan:=Rect(0,0,x,x);
end;
dtPencil:
begin
x:=Form1.Origin.x;
y:=Form1.Origin.y;
Form1.Image1.Canvas.Pixels[x,y]:=Form1.Image1.Canvas.Pen.Color;
Form1.Canvas.MoveTo(x,y);
end;
dtStarCut:
begin
if Form1.TextImage.Visible then
begin
Form1.TextImage.Canvas.Pen.Mode:=pmNotXor;
Form1.TextImage.Canvas.Pen.Style:=psDot;
Form1.TextImage.Canvas.Rectangle(
0,0,Form1.TextImage.Width,Form1.TextImage.Height
);
Form1.TextImage.Canvas.Pen.Mode:=pmCopy;
Form1.TextImage.Canvas.Pen.Style:=psSolid;
Form1.Image1.Canvas.CopyRect(
Rect(Form1.TextImage.Left-Form1.Image1.Left,
Form1.TextImage.Top-Form1.Image1.Top,
Form1.TextImage.Left-Form1.Image1.Left+Form1.TextImage.Width,
Form1.TextImage.Top-Form1.Image1.Top+Form1.TextImage.Height),
Form1.TextImage.Canvas,
Rect(0,0,Form1.TextImage.Width,Form1.TextImage.Height)
);
Form1.TextImage.Visible:=false;
Form1.SaveImage;
end;
Form1.Image1.Canvas.Pen.Color:=$02010203;
PenWidth:=Form1.Image1.Canvas.Pen.Width;
Form1.Image1.Canvas.Pen.Width:=3;
x:=Form1.Origin.x;
y:=Form1.Origin.y;
Form1.Canvas.MoveTo(x,y);
MaxCut.x:=0;
MaxCut.y:=0;
MinCut.x:=Form1.Image1.Width;
MinCut.y:=Form1.Image1.Height;
if x>MaxCut.x then
MaxCut.x:=x;
if x<MinCut.x then
MinCut.x:=x;
if y>MaxCut.y then
MaxCut.y:=y;
if y<MinCut.y then
MinCut.y:=y;
end;
end;{case}
While Form1.Drawing do
begin
case Form1.DrawingTool of
dtAirbrush:
if delay>AirBrushintens then
begin
x:=Random(2*AirBrushradius+1)-AirBrushradius;
y:=round(sqrt(AirBrushradius*AirBrushradius-x*x));
y:=Random(round(2*y)+1)-y;
Form1.Image1.Canvas.Pixels[Form1.MovePt.x+x,Form1.MovePt.y+y]:=Form1.Image1.Canvas.Pen.Color;
delay:=0;
end
else
inc(delay);
dtStarCut:
begin
x:=Form1.MovePt.x;
y:=Form1.MovePt.y;
Form1.Image1.Canvas.LineTo(x,y);
Form1.Canvas.MoveTo(x,y);
if x>MaxCut.x then
MaxCut.x:=x;
if x<MinCut.x then
MinCut.x:=x;
if y>MaxCut.y then
MaxCut.y:=y;
if y<MinCut.y then
MinCut.y:=y;
Form1.TextImage.Transparent:=true;
end;
dtPencil:
begin
x:=Form1.MovePt.x;
y:=Form1.MovePt.y;
Form1.Image1.Canvas.LineTo(x,y);
Form1.Canvas.MoveTo(x,y);
end;
dtErase:
begin
x:=Form1.MovePt.x;
y:=Form1.MovePt.y;
Bitmap.Canvas.CopyRect(
Rectan,
Form1.Image1.Canvas,
Rect(x-frOptions.EraseRadius,y-frOptions.EraseRadius,
x+frOptions.EraseRadius,y+frOptions.EraseRadius)
);
Form1.Image1.Canvas.BrushCopy(
Rect(x-frOptions.EraseRadius,y-frOptions.EraseRadius,
x+frOptions.EraseRadius,y+frOptions.EraseRadius),
Bitmap,
Rectan,
Form1.Image1.Canvas.Pen.Color
);
end;
dtBrush:
begin
Form1.Image1.Canvas.FillRect(
Rect(Form1.MovePt.x-frOptions.BrushRadius,Form1.MovePt.y-frOptions.BrushRadius,
Form1.MovePt.x+frOptions.BrushRadius,Form1.MovePt.y+frOptions.BrushRadius));
end;
end;{case}
end;
if Form1.DrawingTool=dtStarCut then
Form1.Image1.Canvas.Pen.Width:=PenWidth;
end;
end.

