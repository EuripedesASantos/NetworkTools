unit NetAPI;

interface

uses
	Windows;
const
	netapi32 = 'netapi32.dll';
	
type
	NET_API_STATUS = DWORD;

function NetApiBufferFree( Buffer: Pointer): NET_API_STATUS; stdcall external 'netapi32.dll'; 


implementation

end.
