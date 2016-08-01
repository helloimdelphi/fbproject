program Facebook;

uses
  Forms,
  LoginUnit in 'LoginUnit.pas' {Form1},
  FBfunc in 'FBfunc.pas',
  WriteUnit in 'WriteUnit.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
