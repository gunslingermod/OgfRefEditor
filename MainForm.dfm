object MainProjectForm: TMainProjectForm
  Left = 830
  Top = 624
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'OGFv4+ RefEditor'
  ClientHeight = 162
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_counter: TLabel
    Left = 450
    Top = 144
    Width = 67
    Height = 13
    Caption = 'Items count: 0'
  end
  object OMFList: TListBox
    Left = 8
    Top = 0
    Width = 433
    Height = 161
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = OMFListDblClick
  end
  object btn_load: TButton
    Left = 448
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Load File'
    TabOrder = 1
    OnClick = btn_loadClick
  end
  object btn_save: TButton
    Left = 448
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Update File(s)'
    TabOrder = 2
    OnClick = btn_saveClick
  end
  object btn_add: TButton
    Left = 448
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Add Item'
    TabOrder = 3
    OnClick = btn_addClick
  end
  object btn_remove: TButton
    Left = 448
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Remove Item'
    TabOrder = 4
    OnClick = btn_removeClick
  end
  object btn_edit: TButton
    Left = 448
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Edit Item'
    TabOrder = 5
    OnClick = btn_editClick
  end
  object check_backup: TCheckBox
    Left = 450
    Top = 128
    Width = 97
    Height = 17
    Caption = 'BackUp'
    TabOrder = 6
  end
  object OpenDialog: TOpenDialog
    Filter = 'Stalker Model Files (*.ogf)|*.ogf'
    Left = 32
  end
  object SaveDialog: TSaveDialog
    Filter = 'Stalker Model Files (*.ogf)|*.ogf'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 8
  end
end
