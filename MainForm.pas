unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ModelProtector, strutils, math;

type
  TMainProjectForm = class(TForm)
    OpenDialog: TOpenDialog;
    OMFList: TListBox;
    btn_load: TButton;
    btn_save: TButton;
    SaveDialog: TSaveDialog;
    btn_add: TButton;
    btn_remove: TButton;
    btn_edit: TButton;
    lbl_counter: TLabel;
    check_backup: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btn_loadClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_removeClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure OMFListDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  published
    procedure DoBackup(path:string);
    procedure UpdateCnt();
  end;

var
  MainProjectForm: TMainProjectForm;
  lockcnt:integer;

implementation
uses EditItemForm;

{$R *.dfm}

procedure TMainProjectForm.FormCreate(Sender: TObject);
begin
  opendialog.InitialDir:=GetCurrentDir;
  savedialog.InitialDir:=opendialog.InitialDir;
  Randomize;
end;

procedure TMainProjectForm.DoBackup(path:string);
begin
    CopyFile(PChar(path),PChar(path+'.bak'), false);
end;


procedure TMainProjectForm.btn_loadClick(Sender: TObject);
var res:string;
begin
  opendialog.FileName:='';
  opendialog.Execute;
  if opendialog.FileName<>'' then begin
    res := ReadUsedOMFs(opendialog.FileName, OMFList.Items);
    if res<>'' then MessageBox(self.Handle, PChar(res), 'Load failed', MB_OK);
    opendialog.InitialDir:=opendialog.InitialDir;
  end;
  UpdateCnt;
end;

procedure TMainProjectForm.btn_saveClick(Sender: TObject);
var
  i:integer;
  res:string;
begin
  savedialog.FileName:='';
  savedialog.Execute;
  if savedialog.Files.Count>0 then begin
    for i:=0 to savedialog.Files.Count-1 do begin
      if check_backup.Checked then DoBackup(savedialog.Files[i]);
      res := SaveRefsData(savedialog.Files[i], OMFList.Items);
      if res<>'' then MessageBox(self.Handle, PChar(res), 'Save error', MB_OK);
    end;
    MessageBox(self.Handle, 'Update completed.', 'Message', MB_OK);
  end;

end;

procedure TMainProjectForm.btn_removeClick(Sender: TObject);
var i:integer;
begin
  i:=OMFList.ItemIndex;
  OMFList.DeleteSelected;
  if OMFList.Items.Count>i then
    OMFList.ItemIndex:=i
  else if i=OMFList.Items.Count then
    OMFList.ItemIndex:=i-1;
  UpdateCnt;
end;

procedure TMainProjectForm.UpdateCnt();
begin
  lbl_counter.Caption:='Items count: '+inttostr(OMFList.Items.Count);
end;

procedure TMainProjectForm.btn_editClick(Sender: TObject);
begin
  if OMFList.ItemIndex<0 then
    MessageBox(self.Handle, 'Item not selected!', 'Error', MB_OK)
  else
    EditItemProjectForm.ShowModal;
end;

procedure TMainProjectForm.btn_addClick(Sender: TObject);
begin
  OMFList.ItemIndex:=-1;
  EditItemProjectForm.ShowModal;
end;

procedure TMainProjectForm.OMFListDblClick(Sender: TObject);
begin
  btn_editClick(self);
end;

end.
