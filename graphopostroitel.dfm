object Form1: TForm1
  Left = 192
  Top = 117
  AutoScroll = False
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 450
  ClientWidth = 914
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 1
    Width = 313
    Height = 449
    Caption = 'GroupBox1'
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 627
    Top = 1
    Width = 287
    Height = 447
    Lines.Strings = (
      'Vectordata{'
      'v 0.1,0.1,0.1'
      '}')
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 314
    Top = 0
    Width = 313
    Height = 450
    Caption = 'GroupBox1'
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 408
    Top = 104
  end
  object Timer2: TTimer
    Interval = 100
    OnTimer = Timer2Timer
    Left = 362
    Top = 55
  end
end
