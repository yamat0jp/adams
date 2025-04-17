object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 865
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 746
    Height = 865
    Align = alClient
    ColCount = 7
    DefaultColWidth = 100
    FixedCols = 2
    RowCount = 60
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
    ColAligments = (
      0
      0
      0
      0
      0
      0
      0)
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 152
    object N5: TMenuItem
      Caption = #12487#12540#12479
      object N1: TMenuItem
        Caption = #21462#24471
        OnClick = N1Click
      end
      object N4: TMenuItem
        Caption = #26356#26032
        OnClick = N4Click
      end
      object N6: TMenuItem
        Caption = #20445#23384
        Enabled = False
      end
    end
    object N2: TMenuItem
      Caption = #23455#34892
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #32066#20102
      OnClick = N3Click
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://sheets.googleapis.com'
    Params = <>
    SynchronizedEvents = False
    Left = 304
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Name = 'ranges'
        Value = 'sheet1!A9:D57'
      end
      item
        Name = 'key'
        Value = 'AIzaSyAPePOzL_pv3-SHabW0gKEkQqpKmQKjl9I'
      end>
    Resource = 
      'v4/spreadsheets/1W90yE_-F2a3OKNQKKMShJ6FW-UOqdTxQM8_J_5iJe0I/val' +
      'ues:batchGet'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 424
    Top = 16
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 424
    Top = 88
  end
end
