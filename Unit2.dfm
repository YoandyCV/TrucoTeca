object Form2: TForm2
  Left = 332
  Top = 241
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fuente'
  ClientHeight = 227
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 102
    Height = 13
    Caption = 'Nombre de fuente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 200
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Tama'#241'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 201
    Top = 176
    Width = 185
    Height = 41
    Caption = 'Texto de muestra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 185
    Height = 193
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnClick = ListBox1Click
    OnDrawItem = ListBox1DrawItem
    OnMeasureItem = ListBox1MeasureItem
  end
  object Button1: TButton
    Left = 312
    Top = 24
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object ListBox2: TListBox
    Left = 200
    Top = 24
    Width = 105
    Height = 137
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      '10'
      '12'
      '14'
      '16'
      '18'
      '21'
      '25'
      '29'
      '34'
      '38'
      '40'
      '50'
      '70'
      '100'
      '')
    ParentFont = False
    TabOrder = 3
    OnClick = ListBox2Click
  end
  object Button2: TButton
    Left = 312
    Top = 64
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = Button2Click
  end
end
