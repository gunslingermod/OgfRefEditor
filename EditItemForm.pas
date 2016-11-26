unit EditItemForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, math;

type
  TEditItemProjectForm = class(TForm)
    edit: TEdit;
    btn_ok: TButton;
    btn_cancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditItemProjectForm: TEditItemProjectForm;

implementation
uses MainForm;

{$R *.dfm}

procedure TEditItemProjectForm.FormShow(Sender: TObject);
begin
  if MainProjectForm.OMFList.ItemIndex>=0 then
    edit.Text:=MainProjectForm.OMFList.Items[MainProjectForm.OMFList.ItemIndex]
  else
    edit.Text:='';
end;

procedure TEditItemProjectForm.btn_cancelClick(Sender: TObject);
begin
  self.Close;
end;

procedure TEditItemProjectForm.btn_okClick(Sender: TObject);
begin
  if edit.Text='' then begin
    MessageBox(self.Handle, 'Fill something in!', 'Error!', MB_OK);
    exit;
  end;
  if MainProjectForm.OMFList.ItemIndex<0 then begin
    MainProjectForm.OMFList.Items.Add(edit.Text);
    MainProjectForm.OMFList.ItemIndex:=MainProjectForm.OMFList.Items.Count-1;
  end else
    MainProjectForm.OMFList.Items[MainProjectForm.OMFList.ItemIndex]:=edit.Text;
  self.Close;
  MainProjectForm.UpdateCnt;
end;

end.
