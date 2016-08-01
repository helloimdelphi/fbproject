unit WriteUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Memo1: TMemo;
    ListBox1: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
Form3.Caption := FormatDateTime('[접속시간 : HH:MM] ' + myName + ' 님 환영 합니다 !',NOW);
end;

procedure TForm3.Button1Click(Sender: TObject);
var
TypeSelect : Byte;
begin
if Radiobutton1.Checked = True then TypeSelect := 1
else if Radiobutton2.Checked = True then TypeSelect := 2
else if Radiobutton3.Checked = True then TypeSelect := 3;

if FBWriteMe(Memo1.Text,TypeSelect) then begin
 Messagebox(0,'Done.','OK',MB_OK);
 Memo1.Clear;
end;

end;

end.
