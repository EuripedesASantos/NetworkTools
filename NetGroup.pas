unit NetGroup;

interface

uses
	Windows, Classes, NetAPI;

type
	GROUP_INFO_0 = Record
		groupi0_name:	LPWSTR;
	end;
	PGROUP_INFO_0 = ^GROUP_INFO_0;

	GROUP_USERS_INFO_0 = Record
		grui0_name:		LPWSTR;
	end;
    PGROUP_USERS_INFO_0 = ^GROUP_USERS_INFO_0;

function NetGroupEnum( lpServerName: LPWSTR;
			level: DWORD;
			var bufptr: Pointer;
			prefmaxlen: DWORD;
			var entriesread,
			totalentries,
			resume_handle: DWORD): NET_API_STATUS; stdcall; external netapi32;

function NetGroupGetUsers(
			lpServerName: LPWSTR;
			lpGroupName: LPWSTR;
			level: DWORD;
			var bufptr: Pointer;
			prefmaxlen: DWORD;
			var entriesread,
			totalentries,
			resume_handle: DWORD): NET_API_STATUS; stdcall; external netapi32;

function EnumerateGroups( sComputerName: String; var slUserList: TStringList): Boolean;
function EnumerateGroupUsers( sComputerName, sGroupName: String; var slGroupUserList: TStringList): Boolean;

implementation

uses
	SysUtils;

function EnumerateGroupUsers( sComputerName, sGroupName: String; var slGroupUserList: TStringList): Boolean;
var
	GroupUserInfo:			PGROUP_USERS_INFO_0;
	ServerName, GroupName: array[0..255] of WideChar;
	statusResult:		NetAPI.NET_API_STATUS;
	lpBuffer:  Pointer;
	entriesread, totalentries, resume_handle,
	r: DWORD;
begin
	Result := False;
	slGroupUserList.Clear;

	if Trim(sComputerName) = '' then begin
		Exit;
	end;

	StringToWideChar(sComputerName,ServerName, 255);
	StringToWideChar(sGroupName,GroupName, 255);

	resume_handle := 0;
	repeat
		statusResult :=  NetGroupGetUsers(ServerName,
									GroupName,
									0,
									lpBuffer,
									255,
									entriesread,
									totalentries,
									resume_handle);
		if (statusResult = ERROR_SUCCESS) or (statusResult = ERROR_MORE_DATA) then begin
			GroupUserInfo := lpBuffer;
			for r := 0 to entriesread - 1 do begin
				slGroupUserList.Add(WideCharToString(GroupUserInfo^.grui0_name));
				Inc(GroupUserInfo);
			end;
		end;

		NetApiBufferFree(lpBuffer);
	until entriesread = totalentries;

	Result := True;
end;

function EnumerateGroups( sComputerName: String; var slUserList: TStringList): Boolean;
var
	GroupInfo:			PGROUP_INFO_0;
	sServerName: array[0..255] of WideChar;
	statusResult:		NetAPI.NET_API_STATUS;
	lpBuffer:  Pointer;
	entriesread, totalentries, resume_handle,
	r: DWORD;
begin
	Result := False;
	slUserList.Clear;

	if Trim(sComputerName) = '' then begin
		Exit;
	end;

	StringToWideChar(sComputerName,sServerName, 255);

    resume_handle := 0;
	repeat
		statusResult :=  NetGroupEnum(sServerName,
									0,
									lpBuffer,
									255,
									entriesread,
									totalentries,
									resume_handle);
		if (statusResult = ERROR_SUCCESS) or (statusResult = ERROR_MORE_DATA) then begin
			GroupInfo := lpBuffer;
			for r := 0 to entriesread - 1 do begin
				slUserList.Add(WideCharToString(GroupInfo^.groupi0_name));
				Inc(GroupInfo);
			end;
		end;

		NetApiBufferFree(lpBuffer);
	until entriesread = totalentries;

	Result := True;
end;

end.

