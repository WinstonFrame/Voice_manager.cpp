unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,mmsystem,gltools,opengl, ExtCtrls, ComCtrls,textures;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  data:array[0..30]of tvector;
  i,i1:integer;
  x,y,z:single;
  var
 ui:Uint;
 count:integer;  var
p:tpoint;
b:TBitmap;
b1:TBitmap;
implementation

{$R *.dfm}
procedure TForm1.Timer1Timer(Sender: TObject);
begin
glviewport(0,0,width,height);
glclear(gl_color_buffer_bit or gl_depth_buffer_bit);
 glLoadidentity;
 glenable(gl_texture_2d);
glbegin(gl_quads);
glvertex3f(-0.6,0.50,0);
glvertex3f(-0.34,0.57,0);
glvertex3f(-0.4,0.3,0);
glvertex3f(-0.65,0.3,0);
glend;  glbegin(gl_quads);
glvertex3f(0.6,0.50,0);
glvertex3f(0.4,0.57,0);
glvertex3f(0.34,0.3,0);
glvertex3f(0.65,0.3,0);
glend;
glbegin(gl_quads);
glvertex3f(0.0,0.6,0);
glvertex3f(0.4,0.57,0);
glvertex3f(0.34,0.3,0);
glvertex3f(0.0,0.3,0);
glend;
glbegin(gl_quads);
glvertex3f(0.0,0.6,0);
glvertex3f(-0.34,0.57,0);
glvertex3f(-0.4,0.3,0);
glvertex3f(0.0,0.3,0);
glend;
glbindtexture(gl_texture_2d,ui);
glbegin(gl_quads);
gltexcoord2d(1,1);
glvertex3f(-1,1,0.4);
gltexcoord2d(1,0);
glvertex3f(-1,-1,0.4);
gltexcoord2d(0,0);
glvertex3f(1,-1,0.4);
gltexcoord2d(0,1);
glvertex3f(1,1,0.4);
glend;
if count>30 then
count:=0;
if getasynckeystate(vk_space)<>0 then begin
data[count]:=getz(p.X,p.Y);
count:=count+1;

end;
//drawstring(pchar(inttostr

swapbuffers(dc);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//
makecontextfromhandle(handle);
loadtexture('c:\Users\ִלטענטי\Pictures\Camera Roll\WIN_20160319_033331.JPG',ui,false);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
p.x:=x;
p.y:=y;
end;

end.
