program myspeaker;

uses
  Forms,
  gthyjuk in '..\..\..\..\..\Program Files (x86)\Borland\Delphi7\Imports\OpenGL\gthyjuk.pas' {Form1},
  WaveInputCreate in '..\..\..\..\..\Program Files (x86)\Borland\Delphi7\Imports\WaveInputCreate.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
