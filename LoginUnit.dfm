object Form1: TForm1
  Left = 261
  Top = 374
  BorderStyle = bsSingle
  Caption = 'Test Form'
  ClientHeight = 194
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 136
    Width = 337
    Height = 49
    Caption = 'LOG IN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = '@'#44417#49436
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 337
    Height = 53
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'ID'
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 8
    Top = 72
    Width = 337
    Height = 53
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'Password'
    OnChange = Edit2Change
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
end
