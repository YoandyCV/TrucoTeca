unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, ValEdit, ComCtrls, ToolWin, ImgList, IniFiles,
  StdActns, BandActn, ExtActns, ActnList, StdStyleActnCtrls, ActnMan,
  ActnCtrls, WinSkinData, AppEvnts, Menus, ShellApi;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Truco2: TRichEdit;
    Truco1: TRichEdit;
    Busqueda: TComboBox;
    TituloIn: TComboBox;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Listado: TListBox;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    SkinData1: TSkinData;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    Left1: TToolButton;
    ToolButton20: TToolButton;
    Center1: TToolButton;
    ToolButton22: TToolButton;
    Right1: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton19: TToolButton;
    ToolButton21: TToolButton;
    ApplicationEvents1: TApplicationEvents;
    StatusBar1: TStatusBar;
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    ToolButton23: TToolButton;
    ToolButton32: TToolButton;
    PopupMenu1: TPopupMenu;
    Cortar1: TMenuItem;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    Deshacer1: TMenuItem;
    Eliminarseleccin1: TMenuItem;
    ColorBox1: TColorBox;
    ToolButton33: TToolButton;
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure TituloInKeyPress(Sender: TObject; var Key: Char);
    procedure CargandoDatos;
    procedure CargandoTruco;
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BusquedaChange(Sender: TObject);
    procedure ListadoDblClick(Sender: TObject);
    procedure Left1Click(Sender: TObject);
    procedure Center1Click(Sender: TObject);
    procedure Right1Click(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ToolButton25Click(Sender: TObject);
    procedure ToolButton27Click(Sender: TObject);
    procedure ToolButton29Click(Sender: TObject);
    procedure CustomizeDlg1Close(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton31Click(Sender: TObject);
    procedure Eliminarseleccin1Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure Truco2SelectionChange(Sender: TObject);
    procedure BusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure EditarTruco;
    procedure TituloInChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Ini:TIniFile;
  i,j:Integer;
  CuantosHay:Integer;
  NombreTruco:Integer;
  MiDir:String;
  LocalDir:String;

implementation

uses Unit2, FileCtrl;

{$R *.dfm}

//Cargando los datos
procedure TForm1.CargandoDatos;
var
a,b:Integer;
begin
if not fileexists(Localdir+'db\Datos.dat') then
ForceDirectories(Localdir+'db\')
else
begin
Ini:=TIniFile.Create(MiDir+'db\Datos.dat');
ini.ReadSections(Busqueda.Items);
Ini.Free;
a:=Busqueda.Items.Count;
for b:=0 to a do
if Busqueda.Items[b]='Datos' then
Busqueda.Items.Delete(b);
TituloIn.Items:=Busqueda.Items;
Listado.Items:=Busqueda.Items;
end;
end;

//Cargamos el truco seleccionado
procedure TForm1.CargandoTruco;
var
Pos:Integer;
TDir:String;
begin
Pos:=TituloIn.ItemIndex;
Ini:=TIniFile.Create(MiDir+'db\Datos.dat');
Tdir:=Ini.ReadString(TituloIn.Items[Pos],'Dir','');
Ini.Free;
if (TDir<>'') and (FileExists(MiDir+Tdir)) then
begin
Truco2.Clear;
Truco2.Lines.LoadFromFile(MiDir+Tdir);
end;
end;

//Editamos el truco
procedure TForm1.EditarTruco;
var
Pos:Integer;
TDir:String;
begin
Pos:=TituloIn.ItemIndex;
Ini:=TIniFile.Create(MiDir+'db\Datos.dat');
Tdir:=Ini.ReadString(TituloIn.Items[Pos],'Dir','');
Ini.Free;
if (TDir<>'') and (FileExists(MiDir+Tdir)) then
begin
Truco2.Clear;
Truco2.Lines.LoadFromFile(MiDir+Tdir);
end;
end;

//Guardando los trucos nuevos
procedure TForm1.ToolButton5Click(Sender: TObject);
begin
Ini:=TIniFile.Create(MiDir+'db\Datos.dat');
NombreTruco:=Ini.ReadInteger('Datos','NombreTruco',0);
Ini.WriteString(TituloIn.Text,'Dir','db\'+IntToStr(NombreTruco)+'.dat');
Truco2.Lines.SaveToFile(MiDir+'db\'+IntToStr(NombreTruco)+'.dat');
inc(NombreTruco);
Ini.WriteInteger('Datos','NombreTruco',NombreTruco);
Ini.Free;

TituloIn.Text:='';
Truco2.Clear;
Application.MessageBox('Añadido  satisfactoriamente',
   'Añadiendo',mb_IconInformation or mb_OK);
CargandoDatos;
end;

// Al comenzar mandamos a catgar los datos y creamos otros
procedure TForm1.FormCreate(Sender: TObject);
begin
LocalDir:=ExtractFilePath(ParamStr(0));
MiDir:=ExtractFilePath(Application.exeName);
CargandoDatos;

Image1.Picture.Icon:=Application.Icon;
Label1.Caption:='    TrucoTeca es un programa diseñado para coleccionar'+#13+
                'y organizar, notas, apuntes y códigos para la programación.'+#13+
                ' Si usted está utilizando este programa con otro fin debe'+#13+
                '                  notificar  de ello al autor.'+#13+
                '             Todos los derechos están reservados.';

Label2.Caption:='Dudas sugerencias o peticiones contactar vía correo por:'+#13#13+
                '                  Yoandy Calvelo Vega'+#13+
                '                      Ver:1.0 2014';
end;


//Al precionar enter cargamos el truco (Editor)
procedure TForm1.TituloInKeyPress(Sender: TObject; var Key: Char);
begin
//if key=#13 then
//begin
//Truco2.SetFocus;
//EditarTruco;
//end;
end;

//Eliminando el registro seleccionado
procedure TForm1.ToolButton7Click(Sender: TObject);
var
DirDel:String;
pos:Integer;
begin
pos:=TituloIn.ItemIndex;
if pos=-1 then
Application.MessageBox('Seleccione uno de los registros.',
   'Información',mb_IconInformation or mb_OK)
   else
   begin
if Application.MessageBox('Intenta eliminar un registro permanentemente'+#13+
                          '               ¿Desea continuar?'  ,
      'Atención',mb_IconWarning or mb_YesNo)=id_Yes then
      begin
      Ini:=TIniFile.Create(MiDir+'db\Datos.dat');
      DirDel:=Ini.ReadString(TituloIn.Items[Pos],'Dir','');
      Ini.EraseSection(TituloIn.Items[Pos]);
      Ini.Free;
      if DeleteFile(DirDel) then
      Application.MessageBox('Registro eliminado',
      'Eliminando',mb_IconInformation or mb_OK)
      else
      Application.MessageBox('No se puede eliminar el registro',
      'Eliminando',mb_IconInformation or mb_OK);
      Truco2.Clear;
      CargandoDatos;
      end;
      end;
end;

//Cargamos el truco mientras se escrive  (Titulo)
procedure TForm1.BusquedaChange(Sender: TObject);
begin
if Busqueda.ItemIndex<>-1 then
Listado.Selected[Busqueda.ItemIndex]:=true;
end;

//Mostramos el truco al dar 2click
procedure TForm1.ListadoDblClick(Sender: TObject);
var
Pos:Integer;
TDir:String;
begin
Pos:=Listado.ItemIndex;
Ini:=TIniFile.Create(MiDir+'db\Datos.dat');
Tdir:=Ini.ReadString(Listado.Items[Pos],'Dir','');
if TDir<>'' then
Truco1.Lines.LoadFromFile(MiDir+Tdir);
Ini.Free;
PageControl1.ActivePage:=TabSheet2;
end;
//Mostramos el truco al precionar enter en el combo
procedure TForm1.BusquedaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
ListadoDblClick(Sender);
end;
end;

 //Alineando hizquierda
procedure TForm1.Left1Click(Sender: TObject);
begin
Truco2.Paragraph.Alignment := taLeftJustify;
end;

 //Alineando centro
procedure TForm1.Center1Click(Sender: TObject);
begin
Truco2.Paragraph.Alignment := taCenter;
end;

 //Alineando derecha
procedure TForm1.Right1Click(Sender: TObject);
begin
Truco2.Paragraph.Alignment := taRightJustify;
end;

//Hints en la barra
procedure TForm1.ApplicationEvents1Hint(Sender: TObject);
begin
StatusBar1.SimpleText:='  '+Application.Hint;
end;

//Cortando
procedure TForm1.ToolButton4Click(Sender: TObject);
begin
Truco2.CutToClipboard;
end;

//Copiando
procedure TForm1.ToolButton9Click(Sender: TObject);
begin
Truco2.CopyToClipboard;
end;

//Pegando
procedure TForm1.ToolButton11Click(Sender: TObject);
begin
Truco2.PasteFromClipboard;
end;

//Deshacer
procedure TForm1.ToolButton13Click(Sender: TObject);
begin
Truco2.Undo;
end;

//Eliminar seleccionado
procedure TForm1.ToolButton15Click(Sender: TObject);
begin
Truco2.ClearSelection;
end;

//Buscando texto
procedure TForm1.ToolButton17Click(Sender: TObject);
begin
FindDialog1.Execute;
end;
//Necesario para la busqueda
procedure TForm1.FindDialog1Find(Sender: TObject);
var 
   Donde:integer;
begin 
  with Truco2 do 
  begin 
    Donde:=FindText(FindDialog1.FindText,
                    SelStart+1,
                    GetTextLen,
                    [stWholeWord]-[stWholeWord]);
    if Donde=-1
      then ShowMessage('No encuentro '+FindDialog1.FindText)
      else begin 
             SetFocus;
             SelStart:=Donde;
             SelLength:=Length(FindDialog1.FindText);
           end; 
  end;
end;

//Negrita
procedure TForm1.ToolButton25Click(Sender: TObject);
begin
Truco2.SelAttributes.Style:=[fsBold];
end;

//Subrayada
procedure TForm1.ToolButton27Click(Sender: TObject);
begin
Truco2.SelAttributes.Style:=[fsUnderLine];
end;

//Curciva
procedure TForm1.ToolButton29Click(Sender: TObject);
begin
Truco2.SelAttributes.Style:=[fsItalic];
end;

procedure TForm1.CustomizeDlg1Close(Sender: TObject);
begin

end;

//Fuente
procedure TForm1.ToolButton21Click(Sender: TObject);
begin
FontDialog1.Font:=Truco2.Font;
if FontDialog1.Execute then
Truco2.Font:=FontDialog1.Font;
end;

//Normal
procedure TForm1.ToolButton23Click(Sender: TObject);
begin
Truco2.SelAttributes.Style:=[];
end;

//Viñetas
procedure TForm1.ToolButton31Click(Sender: TObject);
begin
if ToolButton31.Down=true then
begin
Truco2.Paragraph.Numbering:=nsBullet;
end
 else
begin
Truco2.Paragraph.Numbering:=nsNone;
end;
end;

//Limpiando
procedure TForm1.Eliminarseleccin1Click(Sender: TObject);
begin
TituloIn.Text:='';
Truco2.Clear;
end;

//Colores del texto
procedure TForm1.ColorBox1Change(Sender: TObject);
begin
Truco2.SelAttributes.Color:=ColorBox1.Selected;
end;
procedure TForm1.Truco2SelectionChange(Sender: TObject);
begin
ColorBox1.Selected:=Truco2.SelAttributes.Color;
end;

//Evitando agregar un truco que ya exista
//O modificar y guardar uno inexistente
procedure TForm1.TituloInChange(Sender: TObject);
begin
if TituloIn.ItemIndex=-1 then
begin
ToolButton5.Enabled:=True;
ToolButton1.Enabled:=False;
ToolButton7.Enabled:=False;
Truco2.Clear;
end
else
begin
ToolButton5.Enabled:=False;
ToolButton1.Enabled:=True;
ToolButton7.Enabled:=True;
EditarTruco;
end;
end;

//Guardando la modificacion del truco
procedure TForm1.ToolButton1Click(Sender: TObject);
var
Pos:Integer;
TDir:String;
begin
pos:=TituloIn.ItemIndex;
Ini:=TIniFile.Create(MiDir+'db\Datos.dat');
TDir:=Ini.ReadString(TituloIn.Items[Pos],'Dir','');
Truco2.Lines.SaveToFile(MiDir+TDir);
Ini.Free;
Application.MessageBox('Guardado  satisfactoriamente',
   'Guardando',mb_IconInformation or mb_OK);
CargandoDatos;

end;


//El Creador
procedure TForm1.Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Label3.Font.Color:=ClRed;
end;
procedure TForm1.Label3MouseLeave(Sender: TObject);
begin
Label3.Font.Color:=ClBlue;
end;
procedure TForm1.Label3Click(Sender: TObject);
begin
ShellExecute(GetDesktopWindow(),nil,pChar('mailto:'+
                TLabel(Sender).Caption),nil,nil,SW_SHOWNORMAL);
end;

end.
