program NetworkToolsPr;

uses
  Forms,
  NetworkTools in 'NetworkTools.pas' {Form1},
  NetUser in 'NetUser.pas',
  NetAPI in 'NetAPI.pas',
  NetGroup in 'NetGroup.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
