program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  DrawingToolTrd in 'DrawingToolTrd.pas',
  Options in 'Options.pas' {frOptions},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrOptions, frOptions);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
