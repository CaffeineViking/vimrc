// cl /LD /O2 user32.lib gdi32.lib gvimfullscreen.c

#include <windows.h>

int g_x, g_y, g_dx, g_dy;

BOOL CALLBACK EnumChildProc(HWND hwnd, LPARAM lParam);

BOOL CALLBACK FindWindowProc(HWND hwnd, LPARAM lParam)
{
    HWND* pphWnd = (HWND*)lParam;

    if (GetParent(hwnd))
    {
        *pphWnd = NULL;
        return TRUE;
    }

    *pphWnd = hwnd;
    return FALSE;
}

LONG _declspec(dllexport) ToggleFullScreen()
{
    HWND hTop = NULL;
    DWORD dwThreadID;

    dwThreadID = GetCurrentThreadId();
    EnumThreadWindows(dwThreadID, FindWindowProc, (LPARAM)&hTop);

    if (hTop)
    {
        if (GetWindowLong(hTop, GWL_STYLE) & WS_CAPTION)
        {
            MONITORINFO mi;
            RECT rc;
            HMONITOR hMonitor;

            GetWindowRect(hTop, &rc);
            hMonitor = MonitorFromRect(&rc, MONITOR_DEFAULTTONEAREST);

            mi.cbSize = sizeof(mi);
            GetMonitorInfo(hMonitor, &mi);

            g_x = mi.rcMonitor.left;
            g_y = mi.rcMonitor.top;
            g_dx = mi.rcMonitor.right - g_x;
            g_dy = mi.rcMonitor.bottom - g_y;

            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_EXSTYLE) & ~WS_BORDER);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) & ~WS_CAPTION);
            SetWindowLong(hTop, GWL_EXSTYLE, GetWindowLong(hTop, GWL_STYLE) & ~WS_EX_CLIENTEDGE);
            SetWindowLong(hTop, GWL_EXSTYLE, GetWindowLong(hTop, GWL_STYLE) & ~WS_EX_WINDOWEDGE);

            SetWindowPos(hTop, HWND_TOP, g_x, g_y, g_dx, g_dy, SWP_SHOWWINDOW);

            EnumChildWindows(hTop, EnumChildProc, 0);
        }
        else
        {
            SetWindowLong(hTop, GWL_EXSTYLE, GetWindowLong(hTop, GWL_EXSTYLE) | WS_BORDER);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_CAPTION);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_SYSMENU);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_MINIMIZEBOX);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_MAXIMIZEBOX);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_SYSMENU);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_EX_CLIENTEDGE);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_EX_WINDOWEDGE);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_THICKFRAME);
            SetWindowLong(hTop, GWL_STYLE, GetWindowLong(hTop, GWL_STYLE) | WS_DLGFRAME);

            SendMessage(hTop, WM_SYSCOMMAND, SC_RESTORE, 0);
            SendMessage(hTop, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
        }
    }

    return GetLastError();
}

BOOL CALLBACK EnumChildProc(HWND hwnd, LPARAM lParam)
{
    char lpszClassName[100];
    HBRUSH hBrush;

    GetClassName(hwnd, lpszClassName, 100);
    if (strcmp(lpszClassName, "VimTextArea") == 0)
    {
        SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_STYLE) & ~WS_EX_CLIENTEDGE);
        SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_STYLE) & ~WS_EX_WINDOWEDGE);
        SetWindowPos(hwnd, HWND_TOP, 0, 0, g_dx, g_dy, SWP_SHOWWINDOW);

        hBrush = CreateSolidBrush(RGB(40, 40, 40)); // gruvbox
        SetClassLong(hwnd, GCLP_HBRBACKGROUND, (LONG_PTR)hBrush);
    }

    return TRUE;
}
