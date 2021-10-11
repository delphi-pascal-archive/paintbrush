object frOptions: TfrOptions
  Left = 265
  Top = 109
  Width = 514
  Height = 286
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 506
    Height = 258
    ActivePage = PenProperty
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Image size'
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 39
        Top = 49
        Width = 34
        Height = 16
        Caption = 'Width'
      end
      object Label2: TLabel
        Left = 39
        Top = 89
        Width = 39
        Height = 16
        Caption = 'Height'
      end
      object Label3: TLabel
        Left = 226
        Top = 49
        Width = 35
        Height = 16
        Caption = 'pixels'
      end
      object Label4: TLabel
        Left = 226
        Top = 89
        Width = 35
        Height = 16
        Caption = 'pixels'
      end
      object edWidth: TEdit
        Left = 89
        Top = 39
        Width = 119
        Height = 24
        TabOrder = 0
        Text = '300'
      end
      object edHeight: TEdit
        Left = 89
        Top = 79
        Width = 119
        Height = 24
        TabOrder = 1
        Text = '300'
      end
      object Button1: TButton
        Left = 266
        Top = 158
        Width = 149
        Height = 30
        Caption = 'OK'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object BrushProperty: TTabSheet
      Caption = #1050#1080#1089#1090#1100
      ImageIndex = 1
      OnShow = BrushPropertyShow
      object BrushShape: TShape
        Left = 266
        Top = 20
        Width = 90
        Height = 90
      end
      object Label15: TLabel
        Left = 30
        Top = 256
        Width = 88
        Height = 16
        Caption = #1056#1072#1076#1080#1091#1089' '#1082#1080#1089#1090#1080
      end
      object Label16: TLabel
        Left = 246
        Top = 256
        Width = 35
        Height = 16
        Caption = 'pixels'
      end
      object lbBS: TListBox
        Left = 0
        Top = 0
        Width = 159
        Height = 139
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        Items.Strings = (
          'bsSolid'
          'bsClear'
          'bsHorizontal'
          'bsVertical'
          'bsFDiagonal'
          'bsBDiagonal'
          'bsCross'
          'bsDiagCross.')
        ParentFont = False
        TabOrder = 0
        OnClick = lbBSClick
      end
      object Button3: TButton
        Left = 256
        Top = 118
        Width = 119
        Height = 31
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 256
        Top = 158
        Width = 119
        Height = 30
        Caption = 'OK'
        TabOrder = 2
        OnClick = Button4Click
      end
      object edBrushRadius: TEdit
        Left = 138
        Top = 246
        Width = 100
        Height = 24
        TabOrder = 3
      end
    end
    object PenProperty: TTabSheet
      Caption = #1055#1077#1088#1086
      ImageIndex = 2
      OnShow = PenPropertyShow
      object PenShape: TShape
        Left = 256
        Top = 30
        Width = 90
        Height = 89
      end
      object Label9: TLabel
        Left = 0
        Top = 158
        Width = 58
        Height = 16
        Caption = #1058#1086#1083#1097#1080#1085#1072
      end
      object Label10: TLabel
        Left = 158
        Top = 158
        Width = 35
        Height = 16
        Caption = 'pixels'
      end
      object lbPS: TListBox
        Left = 0
        Top = 0
        Width = 169
        Height = 110
        ItemHeight = 16
        Items.Strings = (
          'SolidPen'
          'DashPen'
          'DotPen'
          'DashDotPen'
          'DashDotDotPen'
          'ClearPen')
        TabOrder = 0
        OnClick = lbPSClick
      end
      object Button11: TButton
        Left = 236
        Top = 138
        Width = 149
        Height = 31
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 236
        Top = 177
        Width = 149
        Height = 31
        Caption = 'OK'
        TabOrder = 2
        OnClick = Button12Click
      end
      object edPenThickness: TEdit
        Left = 69
        Top = 148
        Width = 70
        Height = 24
        TabOrder = 3
        Text = '1'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Airbrush'
      ImageIndex = 3
      OnShow = ShapeShow
      object Label7: TLabel
        Left = 20
        Top = 49
        Width = 101
        Height = 16
        Caption = #1056#1072#1076#1080#1091#1089' '#1092#1072#1082#1077#1083#1072
      end
      object Label8: TLabel
        Left = 217
        Top = 49
        Width = 35
        Height = 16
        Caption = 'pixels'
      end
      object AirbrushShape: TShape
        Left = 286
        Top = 20
        Width = 89
        Height = 90
      end
      object Label11: TLabel
        Left = 20
        Top = 108
        Width = 82
        Height = 16
        Caption = #1047#1072#1084#1077#1076#1083#1077#1085#1080#1077
      end
      object Label12: TLabel
        Left = 217
        Top = 108
        Width = 22
        Height = 16
        Caption = #1091'.'#1077'.'
      end
      object edAirRadius: TEdit
        Left = 128
        Top = 39
        Width = 70
        Height = 24
        TabOrder = 0
        Text = '10'
      end
      object Button14: TButton
        Left = 266
        Top = 128
        Width = 139
        Height = 31
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
        TabOrder = 1
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 266
        Top = 177
        Width = 139
        Height = 31
        Caption = 'OK'
        TabOrder = 2
        OnClick = Button15Click
      end
      object edAirDelay: TEdit
        Left = 118
        Top = 98
        Width = 80
        Height = 24
        TabOrder = 3
        Text = '1000'
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Zoom'
      ImageIndex = 4
      object Label5: TLabel
        Left = 10
        Top = 118
        Width = 25
        Height = 16
        Caption = #1064#1072#1075
      end
      object Label6: TLabel
        Left = 148
        Top = 118
        Width = 12
        Height = 16
        Caption = '%'
      end
      object RadioGroup1: TRadioGroup
        Left = 10
        Top = 10
        Width = 159
        Height = 70
        Caption = #1056#1077#1078#1080#1084
        ItemIndex = 0
        Items.Strings = (
          #1091#1074#1077#1083#1080#1095#1077#1085#1080#1077
          #1091#1084#1077#1085#1100#1096#1077#1085#1080#1077)
        TabOrder = 0
      end
      object edZoomStep: TEdit
        Left = 49
        Top = 108
        Width = 80
        Height = 24
        TabOrder = 1
        Text = '10'
      end
      object Button6: TButton
        Left = 295
        Top = 167
        Width = 110
        Height = 31
        Caption = 'OK'
        TabOrder = 2
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 295
        Top = 207
        Width = 110
        Height = 31
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = CancelClick
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1064#1088#1080#1092#1090
      Enabled = False
      ImageIndex = 5
      OnHide = TextOKClick
      OnShow = TabSheet6Show
      object Button8: TButton
        Left = 305
        Top = 167
        Width = 120
        Height = 31
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1096#1088#1080#1092#1090
        TabOrder = 0
        OnClick = Button8Click
      end
      object TextOK: TButton
        Left = 305
        Top = 207
        Width = 120
        Height = 31
        Caption = 'OK'
        TabOrder = 1
        OnClick = TextOKClick
      end
      object Button10: TButton
        Left = 305
        Top = 246
        Width = 120
        Height = 31
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = CancelClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 284
        BevelOuter = bvNone
        TabOrder = 3
        object Editor: TMemo
          Left = 0
          Top = 0
          Width = 297
          Height = 284
          TabOrder = 0
          OnChange = EditorChange
        end
      end
    end
    object ErasePriperty: TTabSheet
      Caption = #1051#1072#1089#1090#1080#1082
      ImageIndex = 6
      OnShow = ErasePripertyShow
      object Label13: TLabel
        Left = 59
        Top = 49
        Width = 106
        Height = 16
        Caption = #1056#1072#1079#1084#1077#1088' '#1083#1072#1089#1090#1080#1082#1072
      end
      object Label14: TLabel
        Left = 325
        Top = 49
        Width = 35
        Height = 16
        Caption = 'pixels'
      end
      object edEraseRadius: TEdit
        Left = 167
        Top = 39
        Width = 139
        Height = 24
        TabOrder = 0
      end
      object Button9: TButton
        Left = 266
        Top = 148
        Width = 139
        Height = 30
        Caption = 'OK'
        TabOrder = 1
        OnClick = Button9Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1047#1072#1083#1080#1074#1082#1072
      ImageIndex = 7
      OnShow = TabSheet2Show
      object ComboBox1: TComboBox
        Left = 69
        Top = 59
        Width = 228
        Height = 24
        ItemHeight = 16
        TabOrder = 0
        Items.Strings = (
          'fsSurface'
          'fsBorder')
      end
      object Button2: TButton
        Left = 352
        Top = 176
        Width = 139
        Height = 31
        Caption = 'OK'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 204
    Top = 48
  end
end
