unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.Grids, Vcl.Menus, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, REST.Types,
  REST.Client, REST.Authenticator.OAuth, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid,
  Vcl.StdCtrls, System.JSON, System.Generics.Collections;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private êÈåæ }
    procedure writejson(JSON: TJSONArray);
    procedure init;
    function calc(temp: integer): integer;
    procedure answer(temp: integer);
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Math;

const
  teisu = 289;

var
  Data: TArray<integer>;

procedure TForm1.answer(temp: integer);
begin
  StringGrid1.Cells[5, 0] := 'ãcê»êî';
  StringGrid1.Cells[5, 48] := teisu.ToString;
  for var i := 1 to 47 do
    StringGrid1.Cells[5, i] := Ceil(Data[i - 1] / temp).ToString;
end;

function TForm1.calc(temp: integer): integer;
begin
  result := 0;
  for var int in Data do
    inc(result, Ceil(int / temp));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Initialize(Data);
  SetLength(Data, 47);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Finalize(Data);
end;

procedure TForm1.init;
var
  s: string;
begin
  for var i := 1 to 47 do
  begin
    s := StringReplace(StringGrid1.Cells[4, i], ',', '', [rfReplaceAll]);
    Data[i - 1] := s.Trim.ToInteger;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
  jArray: TJSONArray;
  jObj: TJSONObject;
begin
  if RESTResponse1.Content = '' then
    RESTRequest1.Execute;
  RESTResponse1.RootElement := 'valueRanges';
  jArray := RESTResponse1.JSONValue as TJSONArray;
  with jArray.GetEnumerator do
    while MoveNext do
    begin
      jObj := Current as TJSONObject;
      writejson(jObj.Values['values'] as TJSONArray);
    end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  left, right: integer;
  param, giseki, goukei: integer;
begin
  init;
  goukei := 0;
  giseki := teisu;
  for var int in Data do
    inc(goukei, int);
  left := 1;
  right := goukei div (teisu - 100);
  while left <= right do
  begin
    param := (right - left) div 2 + left;
    giseki := calc(param);
    if giseki > teisu then
      left := param + 1
    else if giseki < teisu then
      right := param - 1
    else
    begin
      answer(param);
      Caption := 'Ç§Ç‹Ç≠Ç¢Ç´Ç‹ÇµÇΩ';
      Exit;
    end;
  end;
  Caption := Format('Ç≈Ç´Ç‹ÇπÇÒÇ≈ÇµÇΩ : %d ÅÇ %d', [giseki, teisu]);
  Beep;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  RESTRequest1.Execute;
  N1Click(nil);
end;

procedure TForm1.writejson(JSON: TJSONArray);
var
  jArray: TJSONArray;
begin
  for var i := 0 to JSON.Count - 1 do
  begin
    jArray := JSON.Items[i] as TJSONArray;
    StringGrid1.Cells[0, i] := i.ToString;
    for var j := 0 to jArray.Count - 1 do
      StringGrid1.Cells[j + 1, i] := jArray.Items[j].Value;
  end;
end;

end.
