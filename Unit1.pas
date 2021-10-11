unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ExtDlgs,jpeg, ToolWin, ComCtrls, ImgList,DrawingToolTrd;
const
  dtStarCut=1;
  dtRectCut=2;
  dtErase=3;
  dtEllipse=4;
  dtFloodFill=5;
  dtEyedropper=6;
  dtZoom=7;
  dtPencil=8;
  dtBrush=9;
  dtAirbrush=10;
  dtText=11;
  dtLine=12;
  dtBezier=13;
  dtRectangle=14;
  dtPolyLine=15;
  dtRoundRect=16;
type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
{    Pen1: TMenuItem;
    wer1: TMenuItem;}
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N24: TMenuItem;
    ImageList2: TImageList;
    N21: TMenuItem;
    N22: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolBar3: TToolBar;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ColorDialog1: TColorDialog;
    N8: TMenuItem;
    Image1: TImage;
    N23: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    BrushColor: TShape;
    PenColor: TShape;
    N38: TMenuItem;
    TextImage: TImage;
    N45: TMenuItem;
    Airbrush1: TMenuItem;
    Zoom1: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButtonsClick(Sender: TObject);
    procedure SetBrushStyle(Sender: TObject);
    procedure SetPenStyle(Sender: TObject);
    procedure SetBrushColor(Sender: TObject);
    procedure SetPenColor(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BrushColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PenColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TextImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TextImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TextImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MainMenu1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
  private
    { Private declarations }
    FirstWidth,FirstHeight:integer;
    IsRemove:Boolean;
    procedure ImageToClipboard;
    procedure RectangTextImage;
  public
    Drawing: Boolean;
    Origin, MovePt: TPoint;
    DrawingTool: byte;
    DrawingToolThread:TDrawingTool;
    ZoomInterval:integer;
    FloodFillMode:TFillStyle;
    UndoImage:TBitmap;
    TextImageCanvas,Image1Canvas:TCanvas;
    procedure DrawShape(var TopLeft:TPoint; BottomRight: TPoint; AMode: TPenMode);  { Public declarations }
    procedure RealXY(var XY:TPoint);
    procedure CutBitmap;
    procedure SaveImage;
    procedure ReturnImage;
  end;

var
  Form1: TForm1;

implementation

uses Options,CLIPBRD, Unit2;

var
 PenStyle:TPenStyle;
 PenMode:TPenMode;

{$R *.DFM}

procedure TForm1.N3Click(Sender: TObject);
var
 Bitmap:TBitmap;
begin
if OpenPictureDialog1.Execute then
begin
Bitmap := TBitmap.Create;
Bitmap.LoadFromFile(OpenPictureDialog1.FileName);
{Image1.Height:=Bitmap.Height;
Image1.Width:=Bitmap.Width;}
Image1.Canvas.CopyRect(Rect(0,0,Bitmap.Width,Bitmap.Height),Bitmap.Canvas,Rect(0,0,Bitmap.Width,Bitmap.Height));
Bitmap.SaveToFile('NewBit.bmp');
Bitmap.Free;
end;
{Image1.Canvas.
if OpenPictureDialog1.Execute then
Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);}
end;

procedure TForm1.RealXY(var XY:TPoint);
begin
try
XY.x:=round(XY.x*(FirstWidth/Image1.Width));
XY.y:=round(XY.y*(FirstHeight/Image1.Height));
except
on EDivByZero do ShowMessage('Width or Height = 0');
end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var p:TPoint;
begin
p:=Point(X,Y);
RealXY(p);
x:=p.x;
y:=p.y;
if Drawing then
begin
if not (DrawingTool in [dtAirbrush,dtPencil,dtErase,dtBrush,dtStarCut]) then
    DrawShape(Origin, MovePt, pmNotXor);
    MovePt := Point(X, Y);
if not (DrawingTool in [dtAirbrush,dtPencil,dtErase,dtBrush,dtStarCut]) then
    DrawShape(Origin, MovePt, pmNotXor);
end;
end;

procedure TForm1.DrawShape(var TopLeft:TPoint; BottomRight: TPoint; AMode: TPenMode);
begin
  with Image1.Canvas do
  begin
    Pen.Mode := AMode;
    case DrawingTool of
      dtLine:
        begin
          Image1.Canvas.MoveTo(TopLeft.X, TopLeft.Y);
          Image1.Canvas.LineTo(BottomRight.X, BottomRight.Y);
        end;
      dtRectangle: Image1.Canvas.Rectangle(TopLeft.X, TopLeft.Y, BottomRight.X,
        BottomRight.Y);
      dtEllipse: Image1.Canvas.Ellipse(Topleft.X, TopLeft.Y, BottomRight.X,
        BottomRight.Y);
      dtRoundRect: Image1.Canvas.RoundRect(TopLeft.X, TopLeft.Y, BottomRight.X,
        BottomRight.Y, (TopLeft.X - BottomRight.X) div 2,
        (TopLeft.Y - BottomRight.Y) div 2);
      dtBezier: Image1.Canvas.PolyBezier([TopLeft,Point(TopLeft.X,BottomRight.Y),
      Point(BottomRight.X,TopLeft.Y),BottomRight]);
      dtText:
      begin
      Image1.Canvas.Brush.Style:=bsClear;
      Image1.Canvas.Pen.Style:=psDot;
      Image1.Canvas.Pen.Color:=clBlack;
      Image1.Canvas.Rectangle(TopLeft.X, TopLeft.Y, BottomRight.X,
        BottomRight.Y);
      end;
      dtZoom:
      begin
      Image1.Height:=round((Image1.Height/100)*ZoomInterval)+Image1.Height;
      Image1.Width:=round((Image1.Width/100)*ZoomInterval)+Image1.Width;
      end;
      dtEyedropper:
      begin
      PenColor.Brush.Color:=Image1.Canvas.Pixels[BottomRight.x,BottomRight.y];
      Image1.Canvas.Pen.Color:=PenColor.Brush.Color;
      end;
      dtFloodFill:
      case FloodFillMode of
      fsSurface:FloodFill(BottomRight.x,BottomRight.y,Image1.Canvas.Pixels[BottomRight.x,BottomRight.y],FloodFillMode);
      fsBorder:FloodFill(BottomRight.x,BottomRight.y,Image1.Canvas.Pen.Color,FloodFillMode);
      end; {case}
      dtPolyLine:
      begin
      Image1.Canvas.MoveTo(TopLeft.X, TopLeft.Y);
      Image1.Canvas.LineTo(BottomRight.X, BottomRight.Y);
      TopLeft:=BottomRight;
      end;
      dtRectCut:
      begin
        if TextImage.Visible then
        begin
        PenMode:=TextImage.Canvas.Pen.Mode;
        PenStyle:=TextImage.Canvas.Pen.Style;
        TextImage.Canvas.Pen.Style:=psDot;
        TextImage.Canvas.Pen.Mode:=pmNotXor;
        TextImage.Canvas.Rectangle(0,0,TextImage.Width,TextImage.Height);
        TextImage.Canvas.Pen.Mode:=PenMode;
        TextImage.Canvas.Pen.Style:=PenStyle;
        Image1.Canvas.CopyRect(
        Rect(TextImage.Left-Image1.Left,TextImage.Top-Image1.Top,
        TextImage.Left-Image1.Left+TextImage.Width,TextImage.Top-Image1.Top+TextImage.Height),
        TextImage.Canvas,
        Rect(0,0,TextImage.Width,TextImage.Height)
        );
        TextImage.Visible:=false;
        end;
        PenStyle:=Image1.Canvas.Pen.Style;
        Image1.Canvas.Pen.Style:=psDot;
        Image1.Canvas.Rectangle(TopLeft.X, TopLeft.Y, BottomRight.X,
        BottomRight.Y);
      end;
    end;
  end;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p:TPoint;
begin
SaveImage;
p:=Point(X,Y);
RealXY(p);
x:=p.x;
y:=p.y;
Drawing := True;
Image1.Canvas.MoveTo(X, Y);
Origin := Point(X, Y);
MovePt := Origin;
if DrawingTool in [dtAirbrush,dtPencil,dtErase,dtBrush,dtStarCut] then
begin
DrawingToolThread:=TDrawingTool.Create(False);
DrawingToolThread.Priority:=tpNormal;
end
else
begin
DrawShape(Origin,MovePt,pmNotXor);
DrawShape(Origin,MovePt,pmNotXor);
end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p:TPoint;
begin
p:=Point(X,Y);
RealXY(p);
x:=p.x;
y:=p.y;
 if Drawing then
  begin
    if DrawingTool<>dtRectCut then
    DrawShape(Origin, Point(X, Y), pmCopy);
    Drawing := False;
    case DrawingTool of
    dtStarCut:
    begin
    DrawingToolThread.WaitFor;
    Image1.Canvas.LineTo(Origin.x,Origin.y);
    Image1.Canvas.Pen.Color:=PCol;
    CutBitmap;
    end;
    dtText:
    frOptions.PaintText(Origin,Point(X, Y));
    dtRectCut:
    begin
        DrawShape(Origin, Point(X, Y), pmNotXor);
        Image1.Canvas.Pen.Style:=PenStyle;
        TextImage.Visible:=true;
        frOptions.TopBottom(Origin,p);
        TextImage.Top:=Origin.y+Image1.Top;
        TextImage.Left:=Origin.x+Image1.Left;
        TextImage.Width:=abs(Origin.x-p.x);
        TextImage.Height:=abs(Origin.y-p.y);
        TextImage.Transparent:=false;
        PatBlt(TextImage.Canvas.Handle,0,0,TextImage.Width,TextImage.Height,WHITENESS);
        TextImage.Refresh;
        TextImage.Repaint;
        TextImage.Canvas.CopyRect(
        Rect(0,0,TextImage.Width,TextImage.Height),
        Image1.Canvas,
        Rect(Origin.x,Origin.y,p.x,p.y)
        );
        Image1.Canvas.Pen.Mode:=pmCopy;
        TextImage.Canvas.Pen.Mode:=pmNotXor;
TextImage.Canvas.Pen.Style:=psDot;
TextImage.Canvas.Rectangle(
0,0,TextImage.Width,TextImage.Height
);
    end;
    end;{case}
    Origin:=Point(X, Y);
  end;
end;

procedure TForm1.ToolButtonsClick(Sender: TObject);
begin
with Sender as TToolButton do
DrawingTool:=Tag;
if TextImage.Visible then
TextImage.Visible:=false;
end;

procedure TForm1.SetBrushStyle(Sender: TObject);
begin
with Image1.Canvas.Brush do
   Style := TBrushStyle((Sender as TComponent).Tag - 1);
with FindComponent('N'+IntToStr(12+(Sender as TComponent).Tag)) as TMenuItem do
Checked:=true;
if (Sender is TMenuItem) or (Sender is TListBox) then
with FindComponent('ToolButton'+IntToStr(16+(Sender as TComponent).Tag)) as TToolButton do
Down:=true;
end;

procedure TForm1.SetPenStyle(Sender: TObject);
begin
 with Image1.Canvas.Pen do
   Style := TPenStyle((Sender as TComponent).Tag - 1);
 with FindComponent('N'+IntToStr(6+(Sender as TComponent).Tag)) as TMenuItem do
Checked:=true;
if (Sender is TMenuItem) or (Sender is TListBox) then
with FindComponent('ToolButton'+IntToStr(24+(Sender as TComponent).Tag)) as TToolButton do
Down:=true;
end;

procedure TForm1.SetBrushColor(Sender: TObject);
begin
if Sender is TBrush then
begin
ColorDialog1.Color :=(Sender as TBrush).Color;
  if ColorDialog1.Execute then
(Sender as TBrush).Color:= ColorDialog1.Color;
BrushColor.Brush.Color:= ColorDialog1.Color;
end
else
begin
ColorDialog1.Color :=Image1.Canvas.Brush.Color;
  if ColorDialog1.Execute then
Image1.Canvas.Brush.Color:=ColorDialog1.Color;
end;
end;

procedure TForm1.SetPenColor(Sender: TObject);
begin
if Sender is TPen then
begin
ColorDialog1.Color := (Sender as TPen).Color;
  if ColorDialog1.Execute then
(Sender as TPen).Color:= ColorDialog1.Color;
PenColor.Brush.Color:= ColorDialog1.Color;
end
else
begin
ColorDialog1.Color := Image1.Canvas.Pen.Color;
  if ColorDialog1.Execute then
Image1.Canvas.Pen.Color:= ColorDialog1.Color;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if SavePictureDialog1.Execute then
Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Application.Terminate;
end;
procedure TForm1.N2Click(Sender: TObject);
begin
frOptions.PageControl1.ActivePageIndex:=0;
frOptions.Show;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
frOptions.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
UndoImage:=TBitmap.Create;
PatBlt(Image1.Canvas.Handle,0,0,Image1.ClientWidth,Image1.ClientHeight,WHITENESS);
Form1.ZoomInterval:=10;
DrawingTool:=dtStarCut;
frOptions.BrushRadius:=10;
frOptions.EraseRadius:=10;
FloodFillMode:=fsSurface;
AirBrushIntens:=1000;
AirBrushRadius:=10;
IsRemove:=false;
FirstWidth:=Form1.Image1.Width;
FirstHeight:=Form1.Image1.Height;
end;

procedure TForm1.BrushColorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button=mbLeft then
begin
ColorDialog1.Color:=Image1.Canvas.Brush.Color;
if ColorDialog1.Execute then
begin
Image1.Canvas.Brush.Color:=ColorDialog1.Color;
BrushColor.Brush.Color:=ColorDialog1.Color;
end;
end;
end;

procedure TForm1.PenColorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button=mbLeft then
begin
ColorDialog1.Color:=Image1.Canvas.Pen.Color;
if ColorDialog1.Execute then
begin
Image1.Canvas.Pen.Color:=ColorDialog1.Color;
PenColor.Brush.Color:=ColorDialog1.Color;
end;
end;
end;
var MDP:TPoint;
procedure TForm1.TextImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
IsRemove:=true;
MDP.x:=x;
MDP.y:=y;
end;

procedure TForm1.TextImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  begin
IsRemove:=false;
end;

procedure TForm1.CutBitmap;
var Max,Min:TPoint;
Bitmap:TBitmap;
RCT:TRect;
begin
{Delphi-очень большой глюк, даже больше
чем Windows}
TextImage.Visible:=true;
TextImage.Canvas.Brush.Color:=clWhite;
Max:=MaxCut;
Min:=MinCut;
TextImage.Width:=Max.x-Min.x+20;
TextImage.Height:=Max.y-Min.y+20;
PatBlt(TextImage.Canvas.Handle,0,0,TextImage.Width,TextImage.Height,WHITENESS);
TextImage.Canvas.CopyRect(
Rect(9,9,TextImage.Width-9,TextImage.Height-9),
Image1.Canvas,
Rect(Min.x-1,Min.y-1,
Max.x+1,Max.y+1)
);
TextImage.Canvas.FloodFill(
5,5,$02010203,fsBorder);
Bitmap:=TBitmap.Create;
Bitmap.Width:=TextImage.Width;
Bitmap.Height:=TextImage.Height;
RCT:=Rect(0,0,Bitmap.Width,Bitmap.Height);
Bitmap.Canvas.CopyRect(RCT,TextImage.Canvas,RCT);
TextImage.Canvas.BrushCopy(
RCT,
Bitmap,
RCT,
$02010203
);
TextImage.Top:=Min.y+Image1.Top-10;
TextImage.Left:=Min.x+Image1.Left-10;
Form1.ReturnImage;
PenMode:=TextImage.Canvas.Pen.Mode;
PenStyle:=TextImage.Canvas.Pen.Style;
TextImage.Canvas.Pen.Mode:=pmNotXor;
TextImage.Canvas.Pen.Style:=psDot;
TextImage.Canvas.Rectangle(
0,0,TextImage.Width,TextImage.Height
);
TextImage.Canvas.Pen.Mode:=PenMode;
TextImage.Canvas.Pen.Style:=PenStyle;
end;
procedure TForm1.TextImageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if IsRemove then
begin
x:=x-MDP.x;
y:=y-MDP.y;
TextImage.Left:=TextImage.Left+x;
TextImage.Top:=TextImage.Top+y;
PenMode:=TextImage.Canvas.Pen.Mode;
PenStyle:=TextImage.Canvas.Pen.Style;
TextImage.Canvas.Pen.Mode:=pmNotXor;
TextImage.Canvas.Pen.Style:=psDot;
TextImage.Canvas.Rectangle(
0,0,TextImage.Width,TextImage.Height
);
TextImage.Canvas.Rectangle(
0,0,TextImage.Width,TextImage.Height
);
TextImage.Canvas.Pen.Mode:=PenMode;
TextImage.Canvas.Pen.Style:=PenStyle;
end;
end;

procedure TForm1.ReturnImage;
begin
Image1.Width:=UndoImage.Width;
Image1.Height:=UndoImage.Height;
Image1.Canvas.CopyRect(
Rect(0,0,Image1.Width,Image1.Height),
UndoImage.Canvas,
Rect(0,0,UndoImage.Width,UndoImage.Height)
);
end;

procedure TForm1.SaveImage;
begin
UndoImage.Width:=Image1.Width;
UndoImage.Height:=Image1.Height;
UndoImage.Canvas.CopyRect(
Rect(0,0,UndoImage.Width,UndoImage.Height),
Image1.Canvas,
Rect(0,0,Image1.Width,Image1.Height)
);
end;

procedure TForm1.MainMenu1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
if (TextImage.Visible) and
(DrawingTool in [dtRectCut,dtStarCut]) then
begin
N30.Enabled:=true;
N31.Enabled:=true;
N36.Enabled:=true;
end
else
begin
N30.Enabled:=false;
N31.Enabled:=false;
N36.Enabled:=false;
end;
if Clipboard.HasFormat(CF_BITMAP) then
N32.Enabled:=true
else
N32.Enabled:=false;
end;

procedure TForm1.RectangTextImage;
begin
PenStyle:=TextImage.Canvas.Pen.Style;
PenMode:=TextImage.Canvas.Pen.Mode;
TextImage.Canvas.Pen.Style:=psDot;
TextImage.Canvas.Pen.Mode:=pmNotXor;
TextImage.Canvas.Rectangle(0,0,TextImage.Width,TextImage.Height);
TextImage.Canvas.Pen.Style:=PenStyle;
TextImage.Canvas.Pen.Mode:=PenMode;
end;

procedure TForm1.ImageToClipboard;
begin
RectangTextImage;
Clipboard.Assign(TextImage.Picture);
end;

procedure TForm1.N30Click(Sender: TObject);
begin
ImageToClipboard;
TextImage.Visible:=false;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
ImageToClipboard;
RectangTextImage;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
if TextImage.Visible then
begin
RectangTextImage;
Image1.Canvas.CopyRect(
Rect(TextImage.Left-Image1.Left,TextImage.Top-Image1.Top,
TextImage.Left-Image1.Left+TextImage.Width,TextImage.Top-Image1.Top+TextImage.Height),
TextImage.Canvas,
Rect(0,0,TextImage.Width,TextImage.Height)
);
end
else
TextImage.Visible:=true;
TextImage.Top:=Image1.Top;
TextImage.Left:=Image1.Left;
TextImage.Picture.Assign(Clipboard);
RectangTextImage;
DrawingTool:=dtRectCut;
ToolButton2.Down:=true;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
TextImage.Top:=Image1.Top;
TextImage.Left:=Image1.Left;
TextImage.Width:=Image1.Width;
TextImage.Height:=Image1.Height;
TextImage.Visible:=true;
RectangTextImage;
DrawingTool:=dtRectCut;
ToolButton2.Down:=true;
end;

procedure TForm1.N36Click(Sender: TObject);
begin
if TextImage.Visible then
begin
RectangTextImage;
if SavePictureDialog1.Execute then
TextImage.Picture.SaveToFile(SavePictureDialog1.FileName);
end;
RectangTextImage;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
TextImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
TextImage.Visible:=true;
DrawingTool:=dtRectCut;
ToolButton2.Down:=true;
end;

procedure TForm1.N38Click(Sender: TObject);
begin
if N38.Checked then
begin
N38.Checked:=false;
ControlBar1.Visible:=false;
end
else
begin
N38.Checked:=true;
ControlBar1.Visible:=true;
end;
end;


procedure TForm1.N48Click(Sender: TObject);
begin
ShowMessage(
'Автор: Кяргин Руслан Юрьевич'+#10+
'группа 5К-I-47'+#10+
'Задание: простейший графический редактор'
);
end;

procedure TForm1.N41Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N27Click(Sender: TObject);
begin
ReturnImage;
end;

end.
