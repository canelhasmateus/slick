import std/osproc

type
  HookCallBack = proc ( nCode : int , wParam : ptr int , lParam : ptr int) : ptr int




proc SetWindowsHookEx(id: int, lpfn : HookCallBack,
                      hmod : int , dwThreadId: uint ): int {. importc: "SetWindowsHookEx" ,
                                                               dynlib: "user32.dll".}

proc UnhookWindowsHookEx(hhk: int): bool {. importc: "UnhookWindowsHookEx" ,
                                            dynlib: "user32.dll".}

proc GetModuleHandle(lpModuleName: WideCString): int32 {.
  importc : "GetModuleHandle", dynlib: "kernel32" , stdcall, raises: [] , tags: [].}

proc getLastError(): int32 {.importc: "GetLastError", stdcall,
                             dynlib: "kernel32", sideEffect, raises: [],
                             tags: [].}


# const  WH_KEYBOARD_LL = 13;
echo GetModuleHandle( +$"slick.exe



