unit NetUser;

interface

uses
	Windows, Classes, NetAPI;

const
	FILTER_NORMAL_ACCOUNT = 2;	

	ERROR_SUCCESS = 0;
	ERROR_MORE_DATA = 234;

type
	USER_INFO_0 = Record
		useri0_name:	LPWSTR;
	end;

	PUSER_INFO_0 = ^USER_INFO_0;

  USER_INFO_1 = record 
	usri1_name: LPWSTR;
    usri1_password: LPWSTR; 
    usri1_password_age: DWORD; 
    usri1_priv: DWORD; 
    usri1_home_dir: LPWSTR; 
    usri1_comment: LPWSTR; 
    usri1_flags: DWORD; 
    usri1_script_path: LPWSTR; 
  end; 
  lpUSER_INFO_1 = ^USER_INFO_1; 

function NetUserGetInfo(
			lpServerName: LPWSTR;
			lpUserName: LPWSTR;
			level,
			bufptr: Pointer
		): NET_API_STATUS; stdcall; external netapi32;

function NetUserEnum(
			lpServerName: LPWSTR;
			level,
			filter: DWORD;
			var bufptr: Pointer;
			prefmaxlen: DWORD;
			var entriesread,
			totalentries,
			resume_handle: DWORD): NET_API_STATUS; stdcall; external netapi32;

function EnumerateUsers( sComputerName: String; var slUserList: TStringList): Boolean;

implementation

uses
	SysUtils;

function EnumerateUsers( sComputerName: String; var slUserList: TStringList): Boolean;
var
	UserInfo:			PUSER_INFO_0;
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
		statusResult :=  NetUserEnum(sServerName,
									0,
									FILTER_NORMAL_ACCOUNT,
									lpBuffer,
									255,
									entriesread,
									totalentries,
									resume_handle);
		if (statusResult = ERROR_SUCCESS) or (statusResult = ERROR_MORE_DATA) then begin
			UserInfo := lpBuffer;
			for r := 0 to entriesread - 1 do begin
				slUserList.Add(WideCharToString(UserInfo^.useri0_name));
				Inc(UserInfo);
			end;
		end;

		NetApiBufferFree(lpBuffer);
	until entriesread = totalentries;

	Result := True;
end;
end.
