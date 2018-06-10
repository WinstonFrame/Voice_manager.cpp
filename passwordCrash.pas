unit passwordCrash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
window=record
handle:HWND;
parent:hwnd;
//child:array[0..50]of hwnd;
pos:TPOINT;
Classname:Pchar;
Windowname:PCHAR;
instace:Thandle;
rect:TRECT;
end;
var
Form1: TForm1;
windowed:array[0..10000]of Window;
wincount:Integer;
p:TPOINT;
pswrd:array[0..255]of integer;
pswdcount:integer;   hh:hwnd;
pp:array[0..260] of char;
ownerappid:array[0..10000]of integer;
windowprocs:array[0..10000] of pointer;
implementation

{$R *.dfm}
Function generatepassword:string;
var
i:integer;
chr:array[0..260] of char;
begin
i:=0;
chr:='';
while i< pswdcount+1 do begin
if pswrd[i]>254 then begin
if (i<=pswdcount) and (pswdcount=0) then  begin
pswrd[i+1]:=12  ;
pswrd[i]:=12;
pswdcount:=pswdcount+1;
end else
if (i>0)and (pswdcount>0 ) then begin
pswrd[i]:=12 ;
pswrd[i-1]:=pswrd[i-1]+1 ;
pswrd[i]:=12;
end else
if (i=0)and (pswdcount>0 ) then begin
pswrd[i]:=12 ;

pswrd[pswdcount+1]:=12;
pswdcount:=pswdcount+1;
end
end;
inc(i);
end;
pswrd[pswdcount]:=(ord(pswrd[pswdcount])+1);

for i:=0 to pswdcount do
chr[i]:=char(pswrd[i]);
result:=chr;
end;
procedure CallbackFound(h:HWND;lp:LPARAM);export;stdcall;
var
wli:twindowinfo;
j:integer;
wt,classname:array[0..256]of char;
wc:tWndclass;

begin
try
wt:='';
classname:='';
windows.GetWindowInfo(h,wli)  ;
windowed[wincount].handle:=h;
windowed[wincount].pos:=wli.rcWindow.TopLeft;
windowed[wincount].rect:=wli.rcWindow;
windowed[wincount].parent:=getparent(h);
j:= windows.GetWindowTextLength(h);
windows.GetWindowText(h,wt,j);
windowed[wincount].Windowname:=wt;
windows.GetClassName(h,classname,256);
windowed[wincount].Classname:=classname;
windowprocs[wincount]:=pointer(getwindowlong(h,GWL_WNDPROC));
if windowprocs[wincount]=nil then
windowprocs[wincount]:=pointer(getwindowlong(h,dwl_DLGPROC)); 
if windowfrompoint(windowed[wincount].pos)=h then
hh:=h;
inc(wincount);
except
showmessage('"Error"');
 exit;end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
pswrd[0]:=0;
show;
pswdcount:=0;
if windows.EnumWindows(@CallbackFound,0)  then begin
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
memo1.Clear;
form1.Memo1.Lines.Add(generatepassword);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
o:hwnd;
begin
//
getcursorpos(p);
hh:= windowfrompoint(p);
o:=childwindowfrompoint(hh,p);
if o<>0 then
sendmessage(o,wm_Settext,0,longint(PCHAR(memo1.Lines.Text))) else 
sendmessage(hh,wm_Settext,0,longint(PCHAR(memo1.Lines.Text)));
if o<>0 then
getclassname(o,pp,255) else
getclassname(hh,pp,255);
label1.Caption:='classname:'+ strpas(pp);
if o<>0 then
getwindowtext (o,pp,255) else
getwindowtext (hh,pp,255);
label2.Caption:='WindowCaption:'+ strpas(pp);
end;



end.
