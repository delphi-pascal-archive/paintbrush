program PrRis;

uses
  Forms,
  Ris in 'Ris.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
