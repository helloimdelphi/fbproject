unit LoginUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
If FBLogin(Edit1.Text,Edit2.Text) = True then begin
 self.Hide;
 Form3.Show;
end
else begin
 Messagebox(0,'Your ID or Password is Wrong !','ERROR',MB_OK+MB_ICONERROR);
end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
If Edit2.Text <> 'Password' then Edit2.PasswordChar := '*';
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
if Edit1.Text = 'ID' Then Edit1.Text := '';
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if Edit1.Text = '' Then Edit1.Text := 'ID';
end;

procedure TForm1.Edit2Enter(Sender: TObject);
begin
if Edit2.Text = 'Password' Then Edit2.Text := '';
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
if Edit2.Text = '' Then
 Edit2.Text := 'Password';
 Edit2.PasswordChar := #0;
end;

end.
