program OgfRefEditor;

uses
  Forms,
  MainForm in 'MainForm.pas' {MainProjectForm},
  EditItemForm in 'EditItemForm.pas' {EditItemProjectForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'OGFv4+ RefEditor';
  Application.CreateForm(TMainProjectForm, MainProjectForm);
  Application.CreateForm(TEditItemProjectForm, EditItemProjectForm);
  Application.Run;
end.
