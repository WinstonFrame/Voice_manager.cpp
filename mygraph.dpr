program mygraph;

uses
  Forms,
  graphopostroitel in 'graphopostroitel.pas' {Form1},
  FindEat in 'FindEat.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
