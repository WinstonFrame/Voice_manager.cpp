object Form1: TForm1
  Left = 192
  Top = 117
  Width = 480
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object TrackBar1: TTrackBar
    Left = 312
    Top = 216
    Width = 150
    Height = 45
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 104
    Top = 72
  end
end
