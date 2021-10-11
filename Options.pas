unit Options;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrOptions = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BrushProperty: TTabSheet;
    PenProperty: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edWidth: TEdit;
    edHeight: TEdit;
    Button1: TButton;
    lbBS: TListBox;
    BrushShape: TShape;
    Button3: TButton;
    Button4: TButton;
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    edZoomStep: TEdit;
    Label6: TLabel;
    Button6: TButton;
    Button7: TButton;
    FontDialog1: TFontDialog;
    Button8: TButton;
    TextOK: TButton;
    Button10: TButton;
    lbPS: TListBox;
    PenShape: TShape;
    Button11: TButton;
    Button12: TButton;
    Label7: TLabel;
    edAirRadius: TEdit;
    Label8: TLabel;
    AirbrushShape: TShape;
    Button14: TButton;
    Button15: TButton;
    Label9: TLabel;
    edPenThickness: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edAirDelay: TEdit;
    Label12: TLabel;
    Panel1: TPanel;
    Editor: TMemo;
    ErasePriperty: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    edEraseRadius: TEdit;
    Button9: TButton;
    Label15: TLabel;
    Label16: TLabel;
    edBrushRadius: TEdit;
    TabSheet2: TTabSheet;
    ComboBox1: TComboBox;
    Button2: TButton;
    procedure CancelClick(Sender: TObject);
    procedure PenPropertyShow(Sender: TObject);
    procedure lbBSClick(Sender: TObject);
    procedure lbPSClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure ShapeShow(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button8Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure TextOKClick(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure ErasePripertyShow(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BrushPropertyShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
procedure TextUpdate;
  public
    { Public declarations }
    EraseRadius,BrushRadius:integer;
    procedure TopBottom(var TopLeft,BottomRight:TPoint);
    procedure PaintText(TopLeft,BottomRight:TPoint);
  end;

var
  frOptions: TfrOptions;

implementation

uses Unit1, DrawingToolTrd;

{$R *.DFM}
procedure TfrOptions.CancelClick(Sender: TObject);
begin
frOptions.Close;
end;

procedure TfrOptions.PenPropertyShow(Sender: TObject);
begin
PenShape.Brush.Color:=Form1.Image1.Canvas.Pen.Color;
PenShape.Pen.Style:=Form1.Image1.Canvas.Pen.Style;
edPenThickness.Text:=IntToStr(Form1.Image1.Canvas.Pen.Width);
lbPS.ItemIndex:=Integer(Form1.Image1.Canvas.Pen.Style);
end;

procedure TfrOptions.BrushPropertyShow(Sender: TObject);
begin
BrushShape.Brush.Style:=Form1.Image1.Canvas.Brush.Style;
BrushShape.Brush.Color:=Form1.Image1.Canvas.Brush.Color;
lbBS.ItemIndex:=Integer(Form1.Image1.Canvas.Brush.Style);
edBrushRadius.Text:=IntToStr(BrushRadius);
end;
procedure TfrOptions.lbBSClick(Sender: TObject);
begin
(Sender as TListBox).Tag:=lbBS.ItemIndex+1;
Form1.SetBrushStyle(Sender);
BrushPropertyShow(self);
end;

procedure TfrOptions.lbPSClick(Sender: TObject);
begin
(Sender as TListBox).Tag:=lbPS.ItemIndex+1;
Form1.SetPenStyle(Sender);
PenPropertyShow(Sender);
end;

procedure TfrOptions.Button11Click(Sender: TObject);
begin
Form1.SetPenColor(PenShape.Pen);
PenShape.Brush.Color:=PenShape.Pen.Color;
end;

procedure TfrOptions.ShapeShow(Sender: TObject);
begin
AirbrushShape.Brush.Style:=bsSolid;
AirbrushShape.Brush.Color:=Form1.Image1.Canvas.Pen.Color;
edAirRadius.Text:=IntToStr(AirBrushRadius);
edAirDelay.Text:=IntToStr(AirBrushIntens);
end;

procedure TfrOptions.Button14Click(Sender: TObject);
begin
Form1.SetBrushColor(AirbrushShape.Brush);
end;

procedure TfrOptions.TabSheet1Show(Sender: TObject);
begin
edWidth.Text:=IntToStr(Form1.Image1.Width);
edHeight.Text:=IntToStr(Form1.Image1.Height);
end;

procedure TfrOptions.Button12Click(Sender: TObject);
begin
Form1.Image1.Canvas.Pen.Width:=StrToInt(edPenThickness.Text);
frOptions.Hide;
end;

procedure TfrOptions.Button15Click(Sender: TObject);
begin
AirBrushRadius:=StrToInt(edAirRadius.Text);
AirBrushIntens:=StrToInt(edAirDelay.Text);
frOptions.Hide;
end;

procedure TfrOptions.Button6Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
0:Form1.ZoomInterval:=StrToInt(edZoomStep.Text);
1:Form1.ZoomInterval:=-1*StrToInt(edZoomStep.Text);
end;{case}
frOptions.Hide;
end;

procedure TfrOptions.FormShow(Sender: TObject);
begin
Form1.Enabled:=false;
end;

procedure TfrOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if (PageControl1.ActivePageIndex=5) and
(TabSheet6.Enabled)
then
frOptions.TextOKClick(Sender);
Form1.Enabled:=true;
end;
procedure TfrOptions.Button8Click(Sender: TObject);
begin
if FontDialog1.Execute then
Editor.Font:=FontDialog1.Font;
frOptions.EditorChange(self);
end;
var Bitmap:TBitmap;
procedure TfrOptions.TextUpdate;
var i,HPos:integer;
begin
Form1.TextImage.Canvas.Font:=Editor.Font;
HPos:=0;
for i:=1 to Editor.Lines.Count do
begin
Form1.TextImage.Canvas.TextOut(0,HPos,Editor.Lines[i-1]);
HPos:=HPos+Form1.TextImage.Canvas.TextHeight(Editor.Lines[i]);
end;
end;
procedure TfrOptions.FormHide(Sender: TObject);
begin
Form1.Enabled:=true;
end;
procedure TfrOptions.TopBottom(var TopLeft,BottomRight:TPoint);
var RealTop,RealBottom:TPoint;
begin
if (TopLeft.x<BottomRight.x)
then
begin
if (TopLeft.y<BottomRight.y) then
begin
RealTop:=TopLeft;
RealBottom:=BottomRight;
end
else
begin
RealTop.x:=TopLeft.x;
RealTop.y:=BottomRight.y;
RealBottom.x:=BottomRight.x;
RealBottom.y:=TopLeft.y;
end;
end
else
if TopLeft.y<BottomRight.y then
begin
RealTop.x:=BottomRight.x;
RealTop.y:=TopLeft.y;
RealBottom.x:=TopLeft.x;
RealBottom.y:=BottomRight.y;
end
else
begin
RealTop:=BottomRight;
RealBottom:=TopLeft;
end;
TopLeft:=RealTop;
BottomRight:=RealBottom;
end;
procedure TfrOptions.PaintText(TopLeft,BottomRight:TPoint);
begin
Form1.TextImage.Visible:=true;
TopBottom(TopLeft,BottomRight);
Form1.TextImage.Top:=Form1.Image1.Top+TopLeft.y;
Form1.TextImage.Left:=Form1.Image1.Left+TopLeft.x;
Form1.TextImage.Width:=abs(BottomRight.x-TopLeft.x);
Form1.TextImage.Height:=abs(BottomRight.y-TopLeft.y);
PatBlt(Form1.TextImage.Canvas.Handle,0,0,Form1.TextImage.ClientWidth,Form1.TextImage.ClientHeight,WHITENESS);
Bitmap:=TBitmap.Create;
Bitmap.Width:=Form1.TextImage.Width;
Bitmap.Height:=Form1.TextImage.Height;
Bitmap.Canvas.CopyRect(
Rect(0,0,Bitmap.Width,
Bitmap.Height),
Form1.Image1.Canvas,
Rect(Form1.TextImage.Left-Form1.Image1.Left,Form1.TextImage.Top-Form1.Image1.Top,
Form1.TextImage.Left-Form1.Image1.Left+Form1.TextImage.Width,
Form1.TextImage.Top-Form1.Image1.Top+Form1.TextImage.Height));
Editor.Width:=Form1.TextImage.Width;
Editor.Height:=Form1.TextImage.Height;
frOptions.PageControl1.ActivePageIndex:=5;
TabSheet6.Enabled:=true;
frOptions.Show;
frOptions.EditorChange(self);
end;

procedure TfrOptions.EditorChange(Sender: TObject);
begin
Form1.TextImage.Canvas.CopyRect(
Rect(0,0,Form1.TextImage.Width,
Form1.TextImage.Height),
Bitmap.Canvas,
Rect(0,0,Form1.TextImage.Width,
Form1.TextImage.Height)
);
TextUpdate;
end;

procedure TfrOptions.TextOKClick(Sender: TObject);
var PenMode:TPenMode;
begin
Form1.Image1.Canvas.CopyRect(
Rect(Form1.TextImage.Left-Form1.Image1.Left,
Form1.TextImage.Top-Form1.Image1.Top,
Form1.TextImage.Left-Form1.Image1.Left+Form1.TextImage.Width,
Form1.TextImage.Top-Form1.Image1.Top+Form1.TextImage.Height),
Form1.TextImage.Canvas,
Rect(0,0,
Form1.TextImage.Width,
Form1.TextImage.Height));
PenMode:=Form1.Image1.Canvas.Pen.Mode;
Form1.Image1.Canvas.Pen.Mode:=pmNotXor;
Form1.Image1.Canvas.Rectangle(
Form1.TextImage.Left-Form1.Image1.Left,
Form1.TextImage.Top-Form1.Image1.Top,
Form1.TextImage.Left-Form1.Image1.Left+Form1.TextImage.Width,
Form1.TextImage.Top-Form1.Image1.Top+Form1.TextImage.Height
);
Form1.Image1.Canvas.Pen.Mode:=PenMode;
Editor.Text:='';
if Sender is TButton then
frOptions.Close;
TabSheet6.Enabled:=false;
Form1.TextImage.Visible:=false;
end;
procedure TfrOptions.TabSheet6Show(Sender: TObject);
begin
Form1.TextImage.Canvas.Brush.Style:=bsClear;
end;

procedure TfrOptions.ErasePripertyShow(Sender: TObject);
begin
edEraseRadius.Text:=IntToStr(EraseRadius);
end;

procedure TfrOptions.Button9Click(Sender: TObject);
begin
EraseRadius:=StrToInt(edEraseRadius.Text);
frOptions.Hide;
end;

procedure TfrOptions.Button1Click(Sender: TObject);
begin
Form1.Image1.Width:=StrToInt(edWidth.Text);
Form1.Image1.Height:=StrToInt(edHeight.Text);
Form1.FormShow(self);
end;


procedure TfrOptions.Button3Click(Sender: TObject);
begin
Form1.SetBrushColor(BrushShape.Brush);
end;

procedure TfrOptions.Button4Click(Sender: TObject);
begin
BrushRadius:=StrToInt(edBrushRadius.Text);
frOptions.Hide;
end;

procedure TfrOptions.TabSheet2Show(Sender: TObject);
begin
ComboBox1.ItemIndex:=Integer(Form1.FloodFillMode);
end;

procedure TfrOptions.Button2Click(Sender: TObject);
begin
Form1.FloodFillMode:=TFillStyle(ComboBox1.ItemIndex);
frOptions.Hide;
end;

end.
