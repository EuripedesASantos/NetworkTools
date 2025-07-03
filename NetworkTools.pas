unit NetworkTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditListUserComputer: TEdit;
    ListBoxUsers: TListBox;
    Label2: TLabel;
    ButtonListUsers: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EditListGroupComputer: TEdit;
    ListBoxGroups: TListBox;
    ButtonListGroups: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    EditListGroupUserComputer: TEdit;
    ListBoxGroupUsers: TListBox;
    ButtonListGroupUsers: TButton;
    EditListGroupUserGroup: TEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonListUsersClick(Sender: TObject);
    procedure ButtonListGroupsClick(Sender: TObject);
    procedure ButtonListGroupUsersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
	NetGroup, NetUser;

procedure TForm1.FormCreate(Sender: TObject);
var
	sComputerName: array[0..255] of Char;
	lSize:						Cardinal;
begin
	lSize := SizeOf(sComputerName);
	if Not GetComputerName(sComputerName, lSize) then begin
		ShowMessage('Erro ao ler o nome do computador.');
		sComputerName := '';
	end;

	Self.EditListUserComputer.Text := sComputerName;

end;

procedure TForm1.ButtonListUsersClick(Sender: TObject);
var
	slUserList:		TStringList;
begin
	Self.ListBoxUsers.Clear;
	try
		slUserList := TStringList.Create;
		try
			if NetUser.EnumerateUsers(Self.EditListUserComputer.Text, slUserList) then begin
				Self.ListBoxUsers.Items.Assign(slUserList);
			end;
		finally
			slUserList.Free;
		end;
	except
		ShowMessage( 'Erro ao criar lista de usuários.');
	end;
end;

procedure TForm1.ButtonListGroupsClick(Sender: TObject);
var
	slGroupList:		TStringList;
begin
	Self.ListBoxGroups.Clear;
	try
		slGroupList := TStringList.Create;
		try
			if NetGroup.EnumerateGroups(Self.EditListGroupComputer.Text, slGroupList) then begin
				Self.ListBoxGroups.Items.Assign(slGroupList);
			end;
		finally
			slGroupList.Free;
		end;
	except
		ShowMessage( 'Erro ao criar lista de usuários.');
	end;
end;

procedure TForm1.ButtonListGroupUsersClick(Sender: TObject);
var
	slGroupUserList:		TStringList;
begin
	Self.ListBoxGroupUsers.Clear;
	try
		slGroupUserList := TStringList.Create;
		try
			if NetGroup.EnumerateGroupUsers(Self.EditListGroupUserComputer.Text,
											Self.EditListGroupUserGroup.Text,
											slGroupUserList) then begin
				Self.ListBoxGroupUsers.Items.Assign(slGroupUserList);
			end;
		finally
			slGroupUserList.Free;
		end;
	except
		ShowMessage( 'Erro ao criar lista de usuários.');
	end;
end;

end.
