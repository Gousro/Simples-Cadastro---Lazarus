unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, ComCtrls, MaskEdit, Buttons, TAGraph, IniFiles;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    Bairro: TEdit;
    Bairro1: TEdit;
    Cep1: TEdit;
    Cidade: TEdit;
    Cidade1: TEdit;
    GeneroField: TEdit;
    Email: TEdit;
    Email1: TEdit;
    Endereco: TEdit;
    Endereco1: TEdit;
    Estado: TEdit;
    Estado1: TEdit;
    Fechar: TButton;
    Fechar1: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    LBairro: TLabel;
    LBairro1: TLabel;
    LCep: TLabel;
    LCep1: TLabel;
    LCidade: TLabel;
    LCidade1: TLabel;
    LEmail: TLabel;
    LEmail1: TLabel;
    LEndereco: TLabel;
    LEndereco1: TLabel;
    LEstado: TLabel;
    LEstado1: TLabel;
    LName: TLabel;
    LName1: TLabel;
    LNumero: TLabel;
    LNumero1: TLabel;
    LTelefone: TLabel;
    LTelefone1: TLabel;
    Cep: TMaskEdit;
    Telefone: TMaskEdit;
    Nome: TEdit;
    Nome1: TEdit;
    Numero: TEdit;
    Numero1: TEdit;
    PageControl1: TPageControl;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Salvar: TButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Telefone1: TEdit;

    procedure FecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
  private
    ArqINI: TIniFile;

  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.lfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:=0;
end;

procedure TFrmPrincipal.PageControl1Change(Sender: TObject);
begin
  Refresh;
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'config.ini');

  Nome1.Text             := ArqINI.ReadString('Dados B??sicos','NOME','');
  Email1.Text            := ArqINI.ReadString('Dados B??sicos','EMAIL','');
  Telefone1.Text         := ArqINI.ReadString('Dados B??sicos','TELEFONE','');

  case RadioGroup2.ItemIndex of
    -1: GeneroField.Text := 'Masculino';
    0: GeneroField.Text := 'Femenino';
    1: GeneroField.Text := 'Outro';
    else GeneroField.Text := '';
  end;

  Cep1.Text              := ArqINI.ReadString('Endere??o', 'CEP', '');
  Estado1.Text           := ArqINI.ReadString('Endere??o', 'ESTADO', '');
  Endereco1.Text         := ArqINI.ReadString('Endere??o', 'ENDERECO', '');
  Numero1.Text           := ArqINI.ReadString('Endere??o', 'NUMERO', '');
  Cidade1.Text           := ArqINI.ReadString('Endere??o', 'CIDADE', '');
  Bairro1.Text           := ArqINI.ReadString('Endere??o', 'BAIRRO', '');

  ArqINI.Free;
end;

procedure TFrmPrincipal.SalvarClick(Sender: TObject);
begin
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'config.ini');
  ArqINI.WriteString('Dados B??sicos', 'NOME', Nome.Text);
  ArqINI.WriteString('Dados B??sicos', 'EMAIL', Email.Text);
  ArqINI.WriteString('Dados B??sicos', 'TELEFONE', Telefone.Text);
  ArqINI.WriteInteger('Dados B??sicos','GENERO', RadioGroup1.ItemIndex);
  ArqINI.WriteString('Endere??o', 'CEP', Cep.Text);
  ArqINI.WriteString('Endere??o', 'ESTADO', Estado.Text);
  ArqINI.WriteString('Endere??o', 'ENDERECO', Endereco.Text);
  ArqINI.WriteString('Endere??o', 'NUMERO', Numero.Text);
  ArqINI.WriteString('Endere??o', 'CIDADE', Cidade.Text);
  ArqINI.WriteString('Endere??o', 'BAIRRO', Bairro.Text);
  ArqINI.Free;
  ShowMessage('Cadastro Salvo');
end;

end.

