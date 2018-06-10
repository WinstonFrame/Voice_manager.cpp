unit FindEat;
interface
uses gltools;

const
maxeatcount:single=1000;
var
goloden:boolean;
eatfound:boolean;
eatcount:single;
speed:single;
implementation

procedure eatfounded();
begin
if eatfound then begin
eatcount:=maxeatcount;
goloden:=false;
eatfound:=false;
end;
end;
procedure eatproceed();
begin
if eatcount<1 then exit;
eatfounded;
eatcount:=eatcount-(eatcount/60.0)*speed;
end;


end.
