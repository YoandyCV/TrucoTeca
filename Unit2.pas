unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMan, ComCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    Button1: TButton;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
with ListBox1 do begin
    ItemHeight := 20;
    Items      := Screen.Fonts;
    Style      := lbOwnerDrawFixed;
  end;

end;

procedure TForm2.ListBox1MeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
var 
h : integer ; 
begin 
  with Control as TListBox do begin 
     Canvas.Font.Name := Items[Index] ;
     h := Canvas.TextHeight(Items[Index]) ; 
  end ;
  Height := h ; 


end;

procedure TForm2.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
with Control as TListBox do begin 
     Canvas.Font.Name := Items[Index] ; 
     Canvas.FillRect(Rect) ;
     Canvas.TextOut(Rect.Left, Rect.Top, Items[Index]) ; 
  end ; 

end;

procedure TForm2.ListBox1Click(Sender: TObject);
var
x:Integer;
begin
x:=ListBox1.ItemIndex;
Panel1.Font.Name:=ListBox1.Items[x];
end;

procedure TForm2.ListBox2Click(Sender: TObject);
var
x:Integer;
begin
x:=ListBox2.ItemIndex;
Panel1.Font.Size:=StrToInt(ListBox2.Items[x]);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
Form1.Truco2.Font.Size:=Panel1.Font.Size;
Form1.Truco2.Font.Name:=Panel1.Font.Name;
Form1.Enabled:=True;
Form2.close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form1.Enabled:=True;
Form2.close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Enabled:=True;
end;

end.
