unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormShow(Sender: TObject);
begin
RichEdit1.Lines.LoadFromFile(
ExtractFilePath(Application.ExeName)+'help.rtf');
end;

end.
