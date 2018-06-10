unit graphopostroitel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,gl,gltools,opengl, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Timer1: TTimer;
    GroupBox2: TGroupBox;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
 Data: array of tvector;
 unData: array of tvector;
 count:integer;
 dc1,dc:hdc;
 tr:integer;
 rc,rc1:hglrc;
sa,sd,rs:string;
implementation
{$R *.dfm}
function strtofloat(str:String):Single;
begin
try
str:=trim(str);
if (str='-')or (str='+')or (str='-0')or (str='+0')or (str=' ') then begin result:=0;
exit;
end;
insert(',',str,pos('.',str));
delete(str,pos('.',str),1);
result:=sysutils.StrToFloat(str) ;
except
result:=0.0;
exit;
end;
end;

procedure readstring(s:STRING);
begin
if s='' then exit;
if pos('v ',s)=0  then exit;
setlength(data,0);
count:=0;
sa:=s;
try
while  pos('v ',sa)<>0 do begin
delete(sa,1,pos('v ',sa)+1);
setlength(data,count+1);
sd:=copy(sa,1,pos(',',sa)-1);
Delete(sa,1,pos(',',sa));
data[count].x:=strtofloat((sd));
rs:=copy(sa,1,pos(',',sa)-1);
Delete(sa,1,pos(',',sa));
data[count].y:=strtofloat((rs));
rs:=copy(sa,1,pos(char(13),sa)-1);

data[count].z:=strtofloat((rs));
inc(count);
end;
except
exit;
end;
end;
procedure drawstring;
var
i:integer;
begin
if count<=0 then exit;
if count=1 then
glbegin(gl_points);
if count=2 then
glbegin(gl_Lines);
if count=3 then
glbegin(gl_triangles);
if count>=4 then
glbegin(gl_triangle_strip);
for i:=0 to count-1 do begin
glvertex3fv(@data[i]);
end;
glend;  if count<=0 then exit;
if count=1 then
glbegin(gl_points);
if count=2 then
glbegin(gl_Lines);
if count=3 then
glbegin(gl_triangles);
if count>=4 then
glbegin(gl_triangle_strip);
for i:=0 to count-1 do begin
glvertex3f(-data[i].x,data[i].y,data[i].z);
end;
glend;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
dc:=getdc(self.GroupBox1.Handle );
SetPixelDCFormat(dc);
rc:=wglcreatecontext(dc);
dc1:=getdc(self.GroupBox2.Handle );
SetPixelDCFormat(dc1);
rc1:=wglcreatecontext(dc1);
 glclearcolor(0.4,0.5,0.4,1);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
wglmakecurrent(dc,rc);
glviewport(0,0,groupbox1.Width,groupbox1.height);
glclear(gl_color_buffer_bit or gl_depth_buffer_bit);
glloadidentity;
 glrotated(-90,0,1,0);
readstring(self.Memo1.Text);
drawstring;
swapbuffers(dc);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
wglmakecurrent(dc1,rc1);
glviewport(0,0,groupbox2.Width,groupbox2.height);
glclear(gl_color_buffer_bit or gl_depth_buffer_bit);
glloadidentity;
drawstring;
swapbuffers(dc1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//
wglmakecurrent(0,0);
wgldeletecontext(rc);
wgldeletecontext(rc1);
deletedc(dc);
deletedc(dc1);

end;

end.
