unit Ris;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Spin, ExtDlgs, Jpeg;


type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Edit2: TEdit;
    ScrollBar2: TScrollBar;
    Label3: TLabel;
    Edit3: TEdit;
    ScrollBar3: TScrollBar;
    Button3: TButton;
    Edit4: TEdit;
    Button4: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label4: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Image1: TImage;
    Label5: TLabel;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
var
 drag:boolean=false;
 i:integer=0;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Image1.Canvas.FillRect(ClientRect);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Image1.Canvas.FillRect(ClientRect);
 Image1.Canvas.Pen.Width:=5;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 drag:=true;
 Image1.Canvas.MoveTo(x,y);
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if drag then Image1.Canvas.LineTo(x,y);
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 drag:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if SavePictureDialog1.Execute then
  Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var
 red,green,blue:byte;
 c:TColor;
begin
 red:=ScrollBar1.Position;
 green:=ScrollBar2.Position;
 blue:=ScrollBar3.Position;
 Edit1.Text:=IntToStr(red);
 Edit2.Text:=IntToStr(green);
 Edit3.Text:=IntToStr(blue);
 c:=RGB(red,green,blue);
 Panel2.Color:=c;
 Edit4.Text:=IntToStr(c);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
 with Image1.Canvas do
  Pen.Color:=clRed;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
 with Image1.Canvas do
  Pen.Color:=clLime;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
 with Image1.Canvas do
  Pen.Color:=clBlue;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 Image1.Canvas.Pen.Width:=10;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
 Image1.Canvas.Pen.Width:=15;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
 Image1.Canvas.Pen.Width:=20;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
 Image1.Canvas.Pen.Width:=25;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
 Image1.Canvas.Pen.Width:=30;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 Image1.Canvas.Pen.Width:=5;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 if (i mod 2=0) then
  begin
   Image1.Stretch:=true;
   i:=i+1;
  end
 else
  begin
   Image1.Stretch:=false;
   i:=i+1;
  end; 
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
 with Image1.Canvas do
  Pen.Color:=Panel2.Color;
end;

end.
