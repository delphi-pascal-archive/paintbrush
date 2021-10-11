object Form1: TForm1
  Left = 196
  Top = 117
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Paint Brush'
  ClientHeight = 282
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 376
    Top = 152
    Width = 83
    Height = 25
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = ' –¿—Õ€…'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 376
    Top = 184
    Width = 81
    Height = 25
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '«≈À≈Õ€…'
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label2Click
  end
  object Label3: TLabel
    Left = 376
    Top = 216
    Width = 81
    Height = 25
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '—»Õ»…'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label3Click
  end
  object Label4: TLabel
    Left = 376
    Top = 256
    Width = 64
    Height = 16
    Caption = 'Brush size:'
  end
  object Label5: TLabel
    Left = 528
    Top = 16
    Width = 72
    Height = 16
    Caption = ' Ó‰ ˆ‚ÂÚ‡:'
  end
  object Button1: TButton
    Left = 376
    Top = 8
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 376
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 480
    Top = 152
    Width = 65
    Height = 24
    TabOrder = 2
  end
  object ScrollBar1: TScrollBar
    Left = 568
    Top = 152
    Width = 121
    Height = 20
    Max = 255
    PageSize = 0
    TabOrder = 3
    OnChange = ScrollBar1Change
  end
  object Edit2: TEdit
    Left = 480
    Top = 184
    Width = 65
    Height = 24
    TabOrder = 4
  end
  object ScrollBar2: TScrollBar
    Left = 568
    Top = 184
    Width = 121
    Height = 20
    Max = 255
    PageSize = 0
    TabOrder = 5
    OnChange = ScrollBar1Change
  end
  object Edit3: TEdit
    Left = 480
    Top = 216
    Width = 65
    Height = 24
    TabOrder = 6
  end
  object ScrollBar3: TScrollBar
    Left = 568
    Top = 216
    Width = 121
    Height = 20
    Max = 255
    PageSize = 0
    TabOrder = 7
    OnChange = ScrollBar1Change
  end
  object Button3: TButton
    Left = 376
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 616
    Top = 8
    Width = 73
    Height = 24
    TabOrder = 9
  end
  object Button4: TButton
    Left = 376
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 10
    OnClick = Button4Click
  end
  object RadioButton1: TRadioButton
    Left = 464
    Top = 256
    Width = 25
    Height = 17
    Caption = '5'
    Checked = True
    TabOrder = 11
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 496
    Top = 256
    Width = 41
    Height = 17
    Caption = '10'
    TabOrder = 12
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 536
    Top = 256
    Width = 41
    Height = 17
    Caption = '15'
    TabOrder = 13
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 576
    Top = 256
    Width = 41
    Height = 17
    Caption = '20'
    TabOrder = 14
    OnClick = RadioButton4Click
  end
  object RadioButton5: TRadioButton
    Left = 616
    Top = 256
    Width = 41
    Height = 17
    Caption = '25'
    TabOrder = 15
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Left = 656
    Top = 256
    Width = 33
    Height = 17
    Caption = '30'
    TabOrder = 16
    OnClick = RadioButton6Click
  end
  object CheckBox1: TCheckBox
    Left = 528
    Top = 40
    Width = 65
    Height = 17
    Caption = 'Strach'
    TabOrder = 17
    OnClick = CheckBox1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 345
    Height = 265
    BevelOuter = bvLowered
    TabOrder = 18
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 343
      Height = 263
      Align = alClient
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
    end
  end
  object Panel2: TPanel
    Left = 616
    Top = 40
    Width = 73
    Height = 73
    BevelOuter = bvLowered
    TabOrder = 19
    OnClick = Panel2Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = 'BMP'
    Left = 432
    Top = 32
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'BMP'
    InitialDir = 'D:/'
    Left = 432
    Top = 64
  end
end
