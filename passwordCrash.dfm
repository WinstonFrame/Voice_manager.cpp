object Form1: TForm1
  Left = 15
  Top = 117
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 345
  ClientWidth = 305
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 240
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 264
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 305
    Height = 225
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 184
    Top = 304
    Width = 97
    Height = 41
    Caption = 'start'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 288
    Width = 105
    Height = 25
    Cursor = crDrag
    Caption = 'set Passwd inputwindow'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    WordWrap = True
  end
  object Button3: TButton
    Left = 8
    Top = 320
    Width = 129
    Height = 25
    Caption = 'set apply button window'
    TabOrder = 3
    WordWrap = True
  end
  object Timer1: TTimer
    Interval = 5
    OnTimer = Timer1Timer
    Left = 32
    Top = 8
  end
  object Timer2: TTimer
    Interval = 10
    OnTimer = Timer2Timer
    Left = 72
    Top = 8
  end
end
