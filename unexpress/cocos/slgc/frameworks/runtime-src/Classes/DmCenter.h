#ifndef __DM_CENTER__
#define __DM_CENTER__

#include <objbase.h>
#include "windows.h"
#include "FYDC.h"
#include <OAIdl.h>
#include <comdef.h>

#import "dm.dll" no_namespace
#define CONVERT(CLS,FUNC) REG_OBJ_FUNC(CLS::FUNC, CLS::getInstance(), CLS::, "#CLS:#FUNC")
class DmCenter {
	DmCenter();
public:
	~DmCenter(){};
	static DmCenter* getInstance();
	//注册调用,需要先手动运行脚本注册到注册表中
	bool registerCall();
	//免注册调用
	bool unregisterCall();
	inline Idmsoft* getDm(){ return __dm; };
private:
	static DmCenter * __instance;
	Idmsoft* __dm;


public:
	FValue ConvertToFValue(VARIANT var);

	void registerFunc(){

			// 绑定到Lua
			REG_OBJ_FUNC(DmCenter, Ver)

			REG_OBJ_FUNC(DmCenter, SetPath)

			REG_OBJ_FUNC(DmCenter, Ocr)

			REG_OBJ_FUNC(DmCenter, FindStr)

			REG_OBJ_FUNC(DmCenter, GetResultCount)

			REG_OBJ_FUNC(DmCenter, GetResultPos)

			REG_OBJ_FUNC(DmCenter, StrStr)

			REG_OBJ_FUNC(DmCenter, SendCommand)

			REG_OBJ_FUNC(DmCenter, UseDict)

			REG_OBJ_FUNC(DmCenter, GetBasePath)

			REG_OBJ_FUNC(DmCenter, SetDictPwd)

			REG_OBJ_FUNC(DmCenter, OcrInFile)

			REG_OBJ_FUNC(DmCenter, Capture)

			REG_OBJ_FUNC(DmCenter, KeyPress)

			REG_OBJ_FUNC(DmCenter, KeyDown)

			REG_OBJ_FUNC(DmCenter, KeyUp)

			REG_OBJ_FUNC(DmCenter, LeftClick)

			REG_OBJ_FUNC(DmCenter, RightClick)

			REG_OBJ_FUNC(DmCenter, MiddleClick)

			REG_OBJ_FUNC(DmCenter, LeftDoubleClick)

			REG_OBJ_FUNC(DmCenter, LeftDown)

			REG_OBJ_FUNC(DmCenter, LeftUp)

			REG_OBJ_FUNC(DmCenter, RightDown)

			REG_OBJ_FUNC(DmCenter, RightUp)

			REG_OBJ_FUNC(DmCenter, MoveTo)

			REG_OBJ_FUNC(DmCenter, MoveR)

			REG_OBJ_FUNC(DmCenter, GetColor)

			REG_OBJ_FUNC(DmCenter, GetColorBGR)

			REG_OBJ_FUNC(DmCenter, RGB2BGR)

			REG_OBJ_FUNC(DmCenter, BGR2RGB)

			REG_OBJ_FUNC(DmCenter, UnBindWindow)

			REG_OBJ_FUNC(DmCenter, CmpColor)

			REG_OBJ_FUNC(DmCenter, ClientToScreen)

			REG_OBJ_FUNC(DmCenter, ScreenToClient)

			REG_OBJ_FUNC(DmCenter, ShowScrMsg)

			REG_OBJ_FUNC(DmCenter, SetMinRowGap)

			REG_OBJ_FUNC(DmCenter, SetMinColGap)

			REG_OBJ_FUNC(DmCenter, FindColor)

			REG_OBJ_FUNC(DmCenter, FindColorEx)

			REG_OBJ_FUNC(DmCenter, SetWordLineHeight)

			REG_OBJ_FUNC(DmCenter, SetWordGap)

			REG_OBJ_FUNC(DmCenter, SetRowGapNoDict)

			REG_OBJ_FUNC(DmCenter, SetColGapNoDict)

			REG_OBJ_FUNC(DmCenter, SetWordLineHeightNoDict)

			REG_OBJ_FUNC(DmCenter, SetWordGapNoDict)

			REG_OBJ_FUNC(DmCenter, GetWordResultCount)

			REG_OBJ_FUNC(DmCenter, GetWordResultPos)

			REG_OBJ_FUNC(DmCenter, GetWordResultStr)

			REG_OBJ_FUNC(DmCenter, GetWords)

			REG_OBJ_FUNC(DmCenter, GetWordsNoDict)

			REG_OBJ_FUNC(DmCenter, SetShowErrorMsg)

			REG_OBJ_FUNC(DmCenter, GetClientSize)

			REG_OBJ_FUNC(DmCenter, MoveWindow)

			REG_OBJ_FUNC(DmCenter, GetColorHSV)

			REG_OBJ_FUNC(DmCenter, GetAveRGB)

			REG_OBJ_FUNC(DmCenter, GetAveHSV)

			REG_OBJ_FUNC(DmCenter, GetForegroundWindow)

			REG_OBJ_FUNC(DmCenter, GetForegroundFocus)

			REG_OBJ_FUNC(DmCenter, GetMousePointWindow)

			REG_OBJ_FUNC(DmCenter, GetPointWindow)

			REG_OBJ_FUNC(DmCenter, EnumWindow)

			REG_OBJ_FUNC(DmCenter, GetWindowState)

			REG_OBJ_FUNC(DmCenter, GetWindow)

			REG_OBJ_FUNC(DmCenter, GetSpecialWindow)

			REG_OBJ_FUNC(DmCenter, SetWindowText)

			REG_OBJ_FUNC(DmCenter, SetWindowSize)

			REG_OBJ_FUNC(DmCenter, GetWindowRect)

			REG_OBJ_FUNC(DmCenter, GetWindowTitle)

			REG_OBJ_FUNC(DmCenter, GetWindowClass)

			REG_OBJ_FUNC(DmCenter, SetWindowState)

			REG_OBJ_FUNC(DmCenter, CreateFoobarRect)

			REG_OBJ_FUNC(DmCenter, CreateFoobarRoundRect)

			REG_OBJ_FUNC(DmCenter, CreateFoobarEllipse)

			REG_OBJ_FUNC(DmCenter, CreateFoobarCustom)

			REG_OBJ_FUNC(DmCenter, FoobarFillRect)

			REG_OBJ_FUNC(DmCenter, FoobarDrawText)

			REG_OBJ_FUNC(DmCenter, FoobarDrawPic)

			REG_OBJ_FUNC(DmCenter, FoobarUpdate)

			REG_OBJ_FUNC(DmCenter, FoobarLock)

			REG_OBJ_FUNC(DmCenter, FoobarUnlock)

			REG_OBJ_FUNC(DmCenter, FoobarSetFont)

			REG_OBJ_FUNC(DmCenter, FoobarTextRect)

			REG_OBJ_FUNC(DmCenter, FoobarPrintText)

			REG_OBJ_FUNC(DmCenter, FoobarClearText)

			REG_OBJ_FUNC(DmCenter, FoobarTextLineGap)

			REG_OBJ_FUNC(DmCenter, Play)

			REG_OBJ_FUNC(DmCenter, FaqCapture)

			REG_OBJ_FUNC(DmCenter, FaqRelease)

			REG_OBJ_FUNC(DmCenter, FaqSend)

			REG_OBJ_FUNC(DmCenter, Beep)

			REG_OBJ_FUNC(DmCenter, FoobarClose)

			REG_OBJ_FUNC(DmCenter, MoveDD)

			REG_OBJ_FUNC(DmCenter, FaqGetSize)

			REG_OBJ_FUNC(DmCenter, LoadPic)

			REG_OBJ_FUNC(DmCenter, FreePic)

			REG_OBJ_FUNC(DmCenter, GetScreenData)

			REG_OBJ_FUNC(DmCenter, FreeScreenData)

			REG_OBJ_FUNC(DmCenter, WheelUp)

			REG_OBJ_FUNC(DmCenter, WheelDown)

			REG_OBJ_FUNC(DmCenter, SetMouseDelay)

			REG_OBJ_FUNC(DmCenter, SetKeypadDelay)

			REG_OBJ_FUNC(DmCenter, GetEnv)

			REG_OBJ_FUNC(DmCenter, SetEnv)

			REG_OBJ_FUNC(DmCenter, SendString)

			REG_OBJ_FUNC(DmCenter, DelEnv)

			REG_OBJ_FUNC(DmCenter, GetPath)

			REG_OBJ_FUNC(DmCenter, SetDict)

			REG_OBJ_FUNC(DmCenter, FindPic)

			REG_OBJ_FUNC(DmCenter, FindPicEx)

			REG_OBJ_FUNC(DmCenter, SetClientSize)

			REG_OBJ_FUNC(DmCenter, ReadInt)

			REG_OBJ_FUNC(DmCenter, ReadFloat)

			REG_OBJ_FUNC(DmCenter, ReadDouble)

			REG_OBJ_FUNC(DmCenter, FindInt)

			REG_OBJ_FUNC(DmCenter, FindFloat)

			REG_OBJ_FUNC(DmCenter, FindDouble)

			REG_OBJ_FUNC(DmCenter, FindString)

			REG_OBJ_FUNC(DmCenter, GetModuleBaseAddr)

			REG_OBJ_FUNC(DmCenter, MoveToEx)

			REG_OBJ_FUNC(DmCenter, MatchPicName)

			REG_OBJ_FUNC(DmCenter, AddDict)

			REG_OBJ_FUNC(DmCenter, EnterCri)

			REG_OBJ_FUNC(DmCenter, LeaveCri)

			REG_OBJ_FUNC(DmCenter, WriteInt)

			REG_OBJ_FUNC(DmCenter, WriteFloat)

			REG_OBJ_FUNC(DmCenter, WriteDouble)

			REG_OBJ_FUNC(DmCenter, WriteString)

			REG_OBJ_FUNC(DmCenter, AsmAdd)

			REG_OBJ_FUNC(DmCenter, AsmClear)

			REG_OBJ_FUNC(DmCenter, AsmCall)

			REG_OBJ_FUNC(DmCenter, FindMultiColor)

			REG_OBJ_FUNC(DmCenter, FindMultiColorEx)

			REG_OBJ_FUNC(DmCenter, Assemble)

			REG_OBJ_FUNC(DmCenter, DisAssemble)

			REG_OBJ_FUNC(DmCenter, SetWindowTransparent)

			REG_OBJ_FUNC(DmCenter, ReadData)

			REG_OBJ_FUNC(DmCenter, WriteData)

			REG_OBJ_FUNC(DmCenter, FindData)

			REG_OBJ_FUNC(DmCenter, SetPicPwd)

			REG_OBJ_FUNC(DmCenter, Log)

			REG_OBJ_FUNC(DmCenter, FindStrE)

			REG_OBJ_FUNC(DmCenter, FindColorE)

			REG_OBJ_FUNC(DmCenter, FindPicE)

			REG_OBJ_FUNC(DmCenter, FindMultiColorE)

			REG_OBJ_FUNC(DmCenter, SetExactOcr)

			REG_OBJ_FUNC(DmCenter, ReadString)

			REG_OBJ_FUNC(DmCenter, FoobarTextPrintDir)

			REG_OBJ_FUNC(DmCenter, OcrEx)

			REG_OBJ_FUNC(DmCenter, SetDisplayInput)

			REG_OBJ_FUNC(DmCenter, GetTime)

			REG_OBJ_FUNC(DmCenter, GetScreenWidth)

			REG_OBJ_FUNC(DmCenter, GetScreenHeight)

			REG_OBJ_FUNC(DmCenter, BindWindowEx)

			REG_OBJ_FUNC(DmCenter, GetDiskSerial)

			REG_OBJ_FUNC(DmCenter, Md5)

			REG_OBJ_FUNC(DmCenter, GetMac)

			REG_OBJ_FUNC(DmCenter, ActiveInputMethod)

			REG_OBJ_FUNC(DmCenter, CheckInputMethod)

			REG_OBJ_FUNC(DmCenter, FindInputMethod)

			REG_OBJ_FUNC(DmCenter, GetCursorPos)

			REG_OBJ_FUNC(DmCenter, BindWindow)

			REG_OBJ_FUNC(DmCenter, FindWindow)

			REG_OBJ_FUNC(DmCenter, GetScreenDepth)

			REG_OBJ_FUNC(DmCenter, SetScreen)

			REG_OBJ_FUNC(DmCenter, ExitOs)

			REG_OBJ_FUNC(DmCenter, GetDir)

			REG_OBJ_FUNC(DmCenter, GetOsType)

			REG_OBJ_FUNC(DmCenter, FindWindowEx)

			REG_OBJ_FUNC(DmCenter, SetExportDict)

			REG_OBJ_FUNC(DmCenter, GetCursorShape)

			REG_OBJ_FUNC(DmCenter, DownCpu)

			REG_OBJ_FUNC(DmCenter, GetCursorSpot)

			REG_OBJ_FUNC(DmCenter, SendString2)

			REG_OBJ_FUNC(DmCenter, FaqPost)

			REG_OBJ_FUNC(DmCenter, FaqFetch)

			REG_OBJ_FUNC(DmCenter, FetchWord)

			REG_OBJ_FUNC(DmCenter, CaptureJpg)

			REG_OBJ_FUNC(DmCenter, FindStrWithFont)

			REG_OBJ_FUNC(DmCenter, FindStrWithFontE)

			REG_OBJ_FUNC(DmCenter, FindStrWithFontEx)

			REG_OBJ_FUNC(DmCenter, GetDictInfo)

			REG_OBJ_FUNC(DmCenter, SaveDict)

			REG_OBJ_FUNC(DmCenter, GetWindowProcessId)

			REG_OBJ_FUNC(DmCenter, GetWindowProcessPath)

			REG_OBJ_FUNC(DmCenter, LockInput)

			REG_OBJ_FUNC(DmCenter, GetPicSize)

			REG_OBJ_FUNC(DmCenter, GetID)

			REG_OBJ_FUNC(DmCenter, CapturePng)

			REG_OBJ_FUNC(DmCenter, CaptureGif)

			REG_OBJ_FUNC(DmCenter, ImageToBmp)

			REG_OBJ_FUNC(DmCenter, FindStrFast)

			REG_OBJ_FUNC(DmCenter, FindStrFastEx)

			REG_OBJ_FUNC(DmCenter, FindStrFastE)

			REG_OBJ_FUNC(DmCenter, EnableDisplayDebug)

			REG_OBJ_FUNC(DmCenter, CapturePre)

			REG_OBJ_FUNC(DmCenter, RegEx)

			REG_OBJ_FUNC(DmCenter, GetMachineCode)

			REG_OBJ_FUNC(DmCenter, SetClipboard)

			REG_OBJ_FUNC(DmCenter, GetClipboard)

			REG_OBJ_FUNC(DmCenter, GetNowDict)

			REG_OBJ_FUNC(DmCenter, Is64Bit)

			REG_OBJ_FUNC(DmCenter, GetColorNum)

			REG_OBJ_FUNC(DmCenter, EnumWindowByProcess)

			REG_OBJ_FUNC(DmCenter, GetDictCount)

			REG_OBJ_FUNC(DmCenter, GetLastError)

			REG_OBJ_FUNC(DmCenter, GetNetTime)

			REG_OBJ_FUNC(DmCenter, EnableGetColorByCapture)

			REG_OBJ_FUNC(DmCenter, CheckUAC)

			REG_OBJ_FUNC(DmCenter, SetUAC)

			REG_OBJ_FUNC(DmCenter, DisableFontSmooth)

			REG_OBJ_FUNC(DmCenter, CheckFontSmooth)

			REG_OBJ_FUNC(DmCenter, SetDisplayAcceler)

			REG_OBJ_FUNC(DmCenter, FindWindowByProcess)

			REG_OBJ_FUNC(DmCenter, FindWindowByProcessId)

			REG_OBJ_FUNC(DmCenter, ReadIni)

			REG_OBJ_FUNC(DmCenter, WriteIni)

			REG_OBJ_FUNC(DmCenter, RunApp)

			REG_OBJ_FUNC(DmCenter, delay)

			REG_OBJ_FUNC(DmCenter, FindWindowSuper)

			REG_OBJ_FUNC(DmCenter, ExcludePos)

			REG_OBJ_FUNC(DmCenter, FindNearestPos)

			REG_OBJ_FUNC(DmCenter, SortPosDistance)

			REG_OBJ_FUNC(DmCenter, FindPicMem)

			REG_OBJ_FUNC(DmCenter, FindPicMemEx)

			REG_OBJ_FUNC(DmCenter, FindPicMemE)

			REG_OBJ_FUNC(DmCenter, AppendPicAddr)

			REG_OBJ_FUNC(DmCenter, WriteFile)

			REG_OBJ_FUNC(DmCenter, Stop)

			REG_OBJ_FUNC(DmCenter, SetDictMem)

			REG_OBJ_FUNC(DmCenter, GetNetTimeSafe)

			REG_OBJ_FUNC(DmCenter, ForceUnBindWindow)

			REG_OBJ_FUNC(DmCenter, ReadIniPwd)

			REG_OBJ_FUNC(DmCenter, WriteIniPwd)

			REG_OBJ_FUNC(DmCenter, DecodeFile)

			REG_OBJ_FUNC(DmCenter, KeyDownChar)

			REG_OBJ_FUNC(DmCenter, KeyUpChar)

			REG_OBJ_FUNC(DmCenter, KeyPressChar)

			REG_OBJ_FUNC(DmCenter, KeyPressStr)

			REG_OBJ_FUNC(DmCenter, EnableKeypadPatch)

			REG_OBJ_FUNC(DmCenter, EnableKeypadSync)

			REG_OBJ_FUNC(DmCenter, EnableMouseSync)

			REG_OBJ_FUNC(DmCenter, DmGuard)

			REG_OBJ_FUNC(DmCenter, FaqCaptureFromFile)

			REG_OBJ_FUNC(DmCenter, FindIntEx)

			REG_OBJ_FUNC(DmCenter, FindFloatEx)

			REG_OBJ_FUNC(DmCenter, FindDoubleEx)

			REG_OBJ_FUNC(DmCenter, FindStringEx)

			REG_OBJ_FUNC(DmCenter, FindDataEx)

			REG_OBJ_FUNC(DmCenter, EnableRealMouse)

			REG_OBJ_FUNC(DmCenter, EnableRealKeypad)

			REG_OBJ_FUNC(DmCenter, SendStringIme)

			REG_OBJ_FUNC(DmCenter, FoobarDrawLine)

			REG_OBJ_FUNC(DmCenter, FindStrEx)

			REG_OBJ_FUNC(DmCenter, IsBind)

			REG_OBJ_FUNC(DmCenter, SetDisplayDelay)

			REG_OBJ_FUNC(DmCenter, GetDmCount)

			REG_OBJ_FUNC(DmCenter, DisableScreenSave)

			REG_OBJ_FUNC(DmCenter, DisablePowerSave)

			REG_OBJ_FUNC(DmCenter, SetMemoryHwndAsProcessId)

			REG_OBJ_FUNC(DmCenter, FindShape)

			REG_OBJ_FUNC(DmCenter, FindShapeE)

			REG_OBJ_FUNC(DmCenter, FindShapeEx)

			REG_OBJ_FUNC(DmCenter, FindStrS)

			REG_OBJ_FUNC(DmCenter, FindStrExS)

			REG_OBJ_FUNC(DmCenter, FindStrFastS)

			REG_OBJ_FUNC(DmCenter, FindStrFastExS)

			REG_OBJ_FUNC(DmCenter, FindPicS)

			REG_OBJ_FUNC(DmCenter, FindPicExS)

			REG_OBJ_FUNC(DmCenter, ClearDict)

			REG_OBJ_FUNC(DmCenter, GetMachineCodeNoMac)

			REG_OBJ_FUNC(DmCenter, GetClientRect)

			REG_OBJ_FUNC(DmCenter, EnableFakeActive)

			REG_OBJ_FUNC(DmCenter, GetScreenDataBmp)

			REG_OBJ_FUNC(DmCenter, EncodeFile)

			REG_OBJ_FUNC(DmCenter, GetCursorShapeEx)

			REG_OBJ_FUNC(DmCenter, FaqCancel)

			REG_OBJ_FUNC(DmCenter, IntToData)

			REG_OBJ_FUNC(DmCenter, FloatToData)

			REG_OBJ_FUNC(DmCenter, DoubleToData)

			REG_OBJ_FUNC(DmCenter, StringToData)

			REG_OBJ_FUNC(DmCenter, SetMemoryFindResultToFile)

			REG_OBJ_FUNC(DmCenter, EnableBind)

			REG_OBJ_FUNC(DmCenter, SetSimMode)

			REG_OBJ_FUNC(DmCenter, LockMouseRect)

			REG_OBJ_FUNC(DmCenter, SendPaste)

			REG_OBJ_FUNC(DmCenter, IsDisplayDead)

			REG_OBJ_FUNC(DmCenter, GetKeyState)

			REG_OBJ_FUNC(DmCenter, CopyFile)

			REG_OBJ_FUNC(DmCenter, IsFileExist)

			REG_OBJ_FUNC(DmCenter, DeleteFile)

			REG_OBJ_FUNC(DmCenter, MoveFile)

			REG_OBJ_FUNC(DmCenter, CreateFolder)

			REG_OBJ_FUNC(DmCenter, DeleteFolder)

			REG_OBJ_FUNC(DmCenter, GetFileLength)

			REG_OBJ_FUNC(DmCenter, ReadFile)

			REG_OBJ_FUNC(DmCenter, WaitKey)

			REG_OBJ_FUNC(DmCenter, DeleteIni)

			REG_OBJ_FUNC(DmCenter, DeleteIniPwd)

			REG_OBJ_FUNC(DmCenter, EnableSpeedDx)

			REG_OBJ_FUNC(DmCenter, EnableIme)

			REG_OBJ_FUNC(DmCenter, Reg)

			REG_OBJ_FUNC(DmCenter, SelectFile)

			REG_OBJ_FUNC(DmCenter, SelectDirectory)

			REG_OBJ_FUNC(DmCenter, LockDisplay)

			REG_OBJ_FUNC(DmCenter, FoobarSetSave)

			REG_OBJ_FUNC(DmCenter, EnumWindowSuper)

			REG_OBJ_FUNC(DmCenter, DownloadFile)

			REG_OBJ_FUNC(DmCenter, EnableKeypadMsg)

			REG_OBJ_FUNC(DmCenter, EnableMouseMsg)

			REG_OBJ_FUNC(DmCenter, RegNoMac)

			REG_OBJ_FUNC(DmCenter, RegExNoMac)

			REG_OBJ_FUNC(DmCenter, SetEnumWindowDelay)

			REG_OBJ_FUNC(DmCenter, FindMulColor)

			REG_OBJ_FUNC(DmCenter, GetDict)

			REG_OBJ_FUNC(DmCenter, GetBindWindow)

			REG_OBJ_FUNC(DmCenter, FoobarStartGif)

			REG_OBJ_FUNC(DmCenter, FoobarStopGif)

			REG_OBJ_FUNC(DmCenter, FreeProcessMemory)

			REG_OBJ_FUNC(DmCenter, ReadFileData)

			REG_OBJ_FUNC(DmCenter, VirtualAllocEx)

			REG_OBJ_FUNC(DmCenter, VirtualFreeEx)

			REG_OBJ_FUNC(DmCenter, GetCommandLine)

			REG_OBJ_FUNC(DmCenter, TerminateProcess)

			REG_OBJ_FUNC(DmCenter, GetNetTimeByIp)

			REG_OBJ_FUNC(DmCenter, EnumProcess)

			REG_OBJ_FUNC(DmCenter, GetProcessInfo)

			REG_OBJ_FUNC(DmCenter, ReadIntAddr)

			REG_OBJ_FUNC(DmCenter, ReadDataAddr)

			REG_OBJ_FUNC(DmCenter, ReadDoubleAddr)

			REG_OBJ_FUNC(DmCenter, ReadFloatAddr)

			REG_OBJ_FUNC(DmCenter, ReadStringAddr)

			REG_OBJ_FUNC(DmCenter, WriteDataAddr)

			REG_OBJ_FUNC(DmCenter, WriteDoubleAddr)

			REG_OBJ_FUNC(DmCenter, WriteFloatAddr)

			REG_OBJ_FUNC(DmCenter, WriteIntAddr)

			REG_OBJ_FUNC(DmCenter, WriteStringAddr)

			REG_OBJ_FUNC(DmCenter, Delays)

			REG_OBJ_FUNC(DmCenter, FindColorBlock)

			REG_OBJ_FUNC(DmCenter, FindColorBlockEx)

			REG_OBJ_FUNC(DmCenter, OpenProcess)

			REG_OBJ_FUNC(DmCenter, EnumIniSection)

			REG_OBJ_FUNC(DmCenter, EnumIniSectionPwd)

			REG_OBJ_FUNC(DmCenter, EnumIniKey)

			REG_OBJ_FUNC(DmCenter, EnumIniKeyPwd)

			REG_OBJ_FUNC(DmCenter, SwitchBindWindow)

			REG_OBJ_FUNC(DmCenter, InitCri)

			REG_OBJ_FUNC(DmCenter, SendStringIme2)

			REG_OBJ_FUNC(DmCenter, EnumWindowByProcessId)

			REG_OBJ_FUNC(DmCenter, GetDisplayInfo)

			REG_OBJ_FUNC(DmCenter, EnableFontSmooth)

			REG_OBJ_FUNC(DmCenter, OcrExOne)

			REG_OBJ_FUNC(DmCenter, SetAero)

			REG_OBJ_FUNC(DmCenter, FoobarSetTrans)

			REG_OBJ_FUNC(DmCenter, EnablePicCache)

			REG_OBJ_FUNC(DmCenter, FaqIsPosted)

			REG_OBJ_FUNC(DmCenter, LoadPicByte)

			REG_OBJ_FUNC(DmCenter, MiddleDown)

			REG_OBJ_FUNC(DmCenter, MiddleUp)

			REG_OBJ_FUNC(DmCenter, FaqCaptureString)

			REG_OBJ_FUNC(DmCenter, VirtualProtectEx)

			REG_OBJ_FUNC(DmCenter, SetMouseSpeed)

			REG_OBJ_FUNC(DmCenter, GetMouseSpeed)

			REG_OBJ_FUNC(DmCenter, EnableMouseAccuracy)

			REG_OBJ_FUNC(DmCenter, SetExcludeRegion)

			REG_OBJ_FUNC(DmCenter, EnableShareDict)

			REG_OBJ_FUNC(DmCenter, DisableCloseDisplayAndSleep)

			REG_OBJ_FUNC(DmCenter, Int64ToInt32)

			REG_OBJ_FUNC(DmCenter, GetLocale)

			REG_OBJ_FUNC(DmCenter, SetLocale)

			REG_OBJ_FUNC(DmCenter, ReadDataToBin)

			REG_OBJ_FUNC(DmCenter, WriteDataFromBin)

			REG_OBJ_FUNC(DmCenter, ReadDataAddrToBin)

			REG_OBJ_FUNC(DmCenter, WriteDataAddrFromBin)

			REG_OBJ_FUNC(DmCenter, SetParam64ToPointer)

			REG_OBJ_FUNC(DmCenter, GetDPI)

			REG_OBJ_FUNC(DmCenter, SetDisplayRefreshDelay)

			REG_OBJ_FUNC(DmCenter, IsFolderExist)

			REG_OBJ_FUNC(DmCenter, GetCpuType)

			REG_OBJ_FUNC(DmCenter, ReleaseRef)

			REG_OBJ_FUNC(DmCenter, SetExitThread)

			REG_OBJ_FUNC(DmCenter, GetFps)

			REG_OBJ_FUNC(DmCenter, VirtualQueryEx)

			REG_OBJ_FUNC(DmCenter, AsmCallEx)

			REG_OBJ_FUNC(DmCenter, GetRemoteApiAddress)

			REG_OBJ_FUNC(DmCenter, ExecuteCmd)

			REG_OBJ_FUNC(DmCenter, SpeedNormalGraphic)

			REG_OBJ_FUNC(DmCenter, UnLoadDriver)

			REG_OBJ_FUNC(DmCenter, GetOsBuildNumber)

			REG_OBJ_FUNC(DmCenter, HackSpeed)

			REG_OBJ_FUNC(DmCenter, GetRealPath)

	}

	// ����Lua
	FValue Ver(FValueVector vector);

	FValue SetPath(FValueVector vector);

	FValue Ocr(FValueVector vector);

	FValue FindStr(FValueVector vector);

	FValue GetResultCount(FValueVector vector);

	FValue GetResultPos(FValueVector vector);

	FValue StrStr(FValueVector vector);

	FValue SendCommand(FValueVector vector);

	FValue UseDict(FValueVector vector);

	FValue GetBasePath(FValueVector vector);

	FValue SetDictPwd(FValueVector vector);

	FValue OcrInFile(FValueVector vector);

	FValue Capture(FValueVector vector);

	FValue KeyPress(FValueVector vector);

	FValue KeyDown(FValueVector vector);

	FValue KeyUp(FValueVector vector);

	FValue LeftClick(FValueVector vector);

	FValue RightClick(FValueVector vector);

	FValue MiddleClick(FValueVector vector);

	FValue LeftDoubleClick(FValueVector vector);

	FValue LeftDown(FValueVector vector);

	FValue LeftUp(FValueVector vector);

	FValue RightDown(FValueVector vector);

	FValue RightUp(FValueVector vector);

	FValue MoveTo(FValueVector vector);

	FValue MoveR(FValueVector vector);

	FValue GetColor(FValueVector vector);

	FValue GetColorBGR(FValueVector vector);

	FValue RGB2BGR(FValueVector vector);

	FValue BGR2RGB(FValueVector vector);

	FValue UnBindWindow(FValueVector vector);

	FValue CmpColor(FValueVector vector);

	FValue ClientToScreen(FValueVector vector);

	FValue ScreenToClient(FValueVector vector);

	FValue ShowScrMsg(FValueVector vector);

	FValue SetMinRowGap(FValueVector vector);

	FValue SetMinColGap(FValueVector vector);

	FValue FindColor(FValueVector vector);

	FValue FindColorEx(FValueVector vector);

	FValue SetWordLineHeight(FValueVector vector);

	FValue SetWordGap(FValueVector vector);

	FValue SetRowGapNoDict(FValueVector vector);

	FValue SetColGapNoDict(FValueVector vector);

	FValue SetWordLineHeightNoDict(FValueVector vector);

	FValue SetWordGapNoDict(FValueVector vector);

	FValue GetWordResultCount(FValueVector vector);

	FValue GetWordResultPos(FValueVector vector);

	FValue GetWordResultStr(FValueVector vector);

	FValue GetWords(FValueVector vector);

	FValue GetWordsNoDict(FValueVector vector);

	FValue SetShowErrorMsg(FValueVector vector);

	FValue GetClientSize(FValueVector vector);

	FValue MoveWindow(FValueVector vector);

	FValue GetColorHSV(FValueVector vector);

	FValue GetAveRGB(FValueVector vector);

	FValue GetAveHSV(FValueVector vector);

	FValue GetForegroundWindow(FValueVector vector);

	FValue GetForegroundFocus(FValueVector vector);

	FValue GetMousePointWindow(FValueVector vector);

	FValue GetPointWindow(FValueVector vector);

	FValue EnumWindow(FValueVector vector);

	FValue GetWindowState(FValueVector vector);

	FValue GetWindow(FValueVector vector);

	FValue GetSpecialWindow(FValueVector vector);

	FValue SetWindowText(FValueVector vector);

	FValue SetWindowSize(FValueVector vector);

	FValue GetWindowRect(FValueVector vector);

	FValue GetWindowTitle(FValueVector vector);

	FValue GetWindowClass(FValueVector vector);

	FValue SetWindowState(FValueVector vector);

	FValue CreateFoobarRect(FValueVector vector);

	FValue CreateFoobarRoundRect(FValueVector vector);

	FValue CreateFoobarEllipse(FValueVector vector);

	FValue CreateFoobarCustom(FValueVector vector);

	FValue FoobarFillRect(FValueVector vector);

	FValue FoobarDrawText(FValueVector vector);

	FValue FoobarDrawPic(FValueVector vector);

	FValue FoobarUpdate(FValueVector vector);

	FValue FoobarLock(FValueVector vector);

	FValue FoobarUnlock(FValueVector vector);

	FValue FoobarSetFont(FValueVector vector);

	FValue FoobarTextRect(FValueVector vector);

	FValue FoobarPrintText(FValueVector vector);

	FValue FoobarClearText(FValueVector vector);

	FValue FoobarTextLineGap(FValueVector vector);

	FValue Play(FValueVector vector);

	FValue FaqCapture(FValueVector vector);

	FValue FaqRelease(FValueVector vector);

	FValue FaqSend(FValueVector vector);

	FValue Beep(FValueVector vector);

	FValue FoobarClose(FValueVector vector);

	FValue MoveDD(FValueVector vector);

	FValue FaqGetSize(FValueVector vector);

	FValue LoadPic(FValueVector vector);

	FValue FreePic(FValueVector vector);

	FValue GetScreenData(FValueVector vector);

	FValue FreeScreenData(FValueVector vector);

	FValue WheelUp(FValueVector vector);

	FValue WheelDown(FValueVector vector);

	FValue SetMouseDelay(FValueVector vector);

	FValue SetKeypadDelay(FValueVector vector);

	FValue GetEnv(FValueVector vector);

	FValue SetEnv(FValueVector vector);

	FValue SendString(FValueVector vector);

	FValue DelEnv(FValueVector vector);

	FValue GetPath(FValueVector vector);

	FValue SetDict(FValueVector vector);

	FValue FindPic(FValueVector vector);

	FValue FindPicEx(FValueVector vector);

	FValue SetClientSize(FValueVector vector);

	FValue ReadInt(FValueVector vector);

	FValue ReadFloat(FValueVector vector);

	FValue ReadDouble(FValueVector vector);

	FValue FindInt(FValueVector vector);

	FValue FindFloat(FValueVector vector);

	FValue FindDouble(FValueVector vector);

	FValue FindString(FValueVector vector);

	FValue GetModuleBaseAddr(FValueVector vector);

	FValue MoveToEx(FValueVector vector);

	FValue MatchPicName(FValueVector vector);

	FValue AddDict(FValueVector vector);

	FValue EnterCri(FValueVector vector);

	FValue LeaveCri(FValueVector vector);

	FValue WriteInt(FValueVector vector);

	FValue WriteFloat(FValueVector vector);

	FValue WriteDouble(FValueVector vector);

	FValue WriteString(FValueVector vector);

	FValue AsmAdd(FValueVector vector);

	FValue AsmClear(FValueVector vector);

	FValue AsmCall(FValueVector vector);

	FValue FindMultiColor(FValueVector vector);

	FValue FindMultiColorEx(FValueVector vector);

	FValue Assemble(FValueVector vector);

	FValue DisAssemble(FValueVector vector);

	FValue SetWindowTransparent(FValueVector vector);

	FValue ReadData(FValueVector vector);

	FValue WriteData(FValueVector vector);

	FValue FindData(FValueVector vector);

	FValue SetPicPwd(FValueVector vector);

	FValue Log(FValueVector vector);

	FValue FindStrE(FValueVector vector);

	FValue FindColorE(FValueVector vector);

	FValue FindPicE(FValueVector vector);

	FValue FindMultiColorE(FValueVector vector);

	FValue SetExactOcr(FValueVector vector);

	FValue ReadString(FValueVector vector);

	FValue FoobarTextPrintDir(FValueVector vector);

	FValue OcrEx(FValueVector vector);

	FValue SetDisplayInput(FValueVector vector);

	FValue GetTime(FValueVector vector);

	FValue GetScreenWidth(FValueVector vector);

	FValue GetScreenHeight(FValueVector vector);

	FValue BindWindowEx(FValueVector vector);

	FValue GetDiskSerial(FValueVector vector);

	FValue Md5(FValueVector vector);

	FValue GetMac(FValueVector vector);

	FValue ActiveInputMethod(FValueVector vector);

	FValue CheckInputMethod(FValueVector vector);

	FValue FindInputMethod(FValueVector vector);

	FValue GetCursorPos(FValueVector vector);

	FValue BindWindow(FValueVector vector);

	FValue FindWindow(FValueVector vector);

	FValue GetScreenDepth(FValueVector vector);

	FValue SetScreen(FValueVector vector);

	FValue ExitOs(FValueVector vector);

	FValue GetDir(FValueVector vector);

	FValue GetOsType(FValueVector vector);

	FValue FindWindowEx(FValueVector vector);

	FValue SetExportDict(FValueVector vector);

	FValue GetCursorShape(FValueVector vector);

	FValue DownCpu(FValueVector vector);

	FValue GetCursorSpot(FValueVector vector);

	FValue SendString2(FValueVector vector);

	FValue FaqPost(FValueVector vector);

	FValue FaqFetch(FValueVector vector);

	FValue FetchWord(FValueVector vector);

	FValue CaptureJpg(FValueVector vector);

	FValue FindStrWithFont(FValueVector vector);

	FValue FindStrWithFontE(FValueVector vector);

	FValue FindStrWithFontEx(FValueVector vector);

	FValue GetDictInfo(FValueVector vector);

	FValue SaveDict(FValueVector vector);

	FValue GetWindowProcessId(FValueVector vector);

	FValue GetWindowProcessPath(FValueVector vector);

	FValue LockInput(FValueVector vector);

	FValue GetPicSize(FValueVector vector);

	FValue GetID(FValueVector vector);

	FValue CapturePng(FValueVector vector);

	FValue CaptureGif(FValueVector vector);

	FValue ImageToBmp(FValueVector vector);

	FValue FindStrFast(FValueVector vector);

	FValue FindStrFastEx(FValueVector vector);

	FValue FindStrFastE(FValueVector vector);

	FValue EnableDisplayDebug(FValueVector vector);

	FValue CapturePre(FValueVector vector);

	FValue RegEx(FValueVector vector);

	FValue GetMachineCode(FValueVector vector);

	FValue SetClipboard(FValueVector vector);

	FValue GetClipboard(FValueVector vector);

	FValue GetNowDict(FValueVector vector);

	FValue Is64Bit(FValueVector vector);

	FValue GetColorNum(FValueVector vector);

	FValue EnumWindowByProcess(FValueVector vector);

	FValue GetDictCount(FValueVector vector);

	FValue GetLastError(FValueVector vector);

	FValue GetNetTime(FValueVector vector);

	FValue EnableGetColorByCapture(FValueVector vector);

	FValue CheckUAC(FValueVector vector);

	FValue SetUAC(FValueVector vector);

	FValue DisableFontSmooth(FValueVector vector);

	FValue CheckFontSmooth(FValueVector vector);

	FValue SetDisplayAcceler(FValueVector vector);

	FValue FindWindowByProcess(FValueVector vector);

	FValue FindWindowByProcessId(FValueVector vector);

	FValue ReadIni(FValueVector vector);

	FValue WriteIni(FValueVector vector);

	FValue RunApp(FValueVector vector);

	FValue delay(FValueVector vector);

	FValue FindWindowSuper(FValueVector vector);

	FValue ExcludePos(FValueVector vector);

	FValue FindNearestPos(FValueVector vector);

	FValue SortPosDistance(FValueVector vector);

	FValue FindPicMem(FValueVector vector);

	FValue FindPicMemEx(FValueVector vector);

	FValue FindPicMemE(FValueVector vector);

	FValue AppendPicAddr(FValueVector vector);

	FValue WriteFile(FValueVector vector);

	FValue Stop(FValueVector vector);

	FValue SetDictMem(FValueVector vector);

	FValue GetNetTimeSafe(FValueVector vector);

	FValue ForceUnBindWindow(FValueVector vector);

	FValue ReadIniPwd(FValueVector vector);

	FValue WriteIniPwd(FValueVector vector);

	FValue DecodeFile(FValueVector vector);

	FValue KeyDownChar(FValueVector vector);

	FValue KeyUpChar(FValueVector vector);

	FValue KeyPressChar(FValueVector vector);

	FValue KeyPressStr(FValueVector vector);

	FValue EnableKeypadPatch(FValueVector vector);

	FValue EnableKeypadSync(FValueVector vector);

	FValue EnableMouseSync(FValueVector vector);

	FValue DmGuard(FValueVector vector);

	FValue FaqCaptureFromFile(FValueVector vector);

	FValue FindIntEx(FValueVector vector);

	FValue FindFloatEx(FValueVector vector);

	FValue FindDoubleEx(FValueVector vector);

	FValue FindStringEx(FValueVector vector);

	FValue FindDataEx(FValueVector vector);

	FValue EnableRealMouse(FValueVector vector);

	FValue EnableRealKeypad(FValueVector vector);

	FValue SendStringIme(FValueVector vector);

	FValue FoobarDrawLine(FValueVector vector);

	FValue FindStrEx(FValueVector vector);

	FValue IsBind(FValueVector vector);

	FValue SetDisplayDelay(FValueVector vector);

	FValue GetDmCount(FValueVector vector);

	FValue DisableScreenSave(FValueVector vector);

	FValue DisablePowerSave(FValueVector vector);

	FValue SetMemoryHwndAsProcessId(FValueVector vector);

	FValue FindShape(FValueVector vector);

	FValue FindShapeE(FValueVector vector);

	FValue FindShapeEx(FValueVector vector);

	FValue FindStrS(FValueVector vector);

	FValue FindStrExS(FValueVector vector);

	FValue FindStrFastS(FValueVector vector);

	FValue FindStrFastExS(FValueVector vector);

	FValue FindPicS(FValueVector vector);

	FValue FindPicExS(FValueVector vector);

	FValue ClearDict(FValueVector vector);

	FValue GetMachineCodeNoMac(FValueVector vector);

	FValue GetClientRect(FValueVector vector);

	FValue EnableFakeActive(FValueVector vector);

	FValue GetScreenDataBmp(FValueVector vector);

	FValue EncodeFile(FValueVector vector);

	FValue GetCursorShapeEx(FValueVector vector);

	FValue FaqCancel(FValueVector vector);

	FValue IntToData(FValueVector vector);

	FValue FloatToData(FValueVector vector);

	FValue DoubleToData(FValueVector vector);

	FValue StringToData(FValueVector vector);

	FValue SetMemoryFindResultToFile(FValueVector vector);

	FValue EnableBind(FValueVector vector);

	FValue SetSimMode(FValueVector vector);

	FValue LockMouseRect(FValueVector vector);

	FValue SendPaste(FValueVector vector);

	FValue IsDisplayDead(FValueVector vector);

	FValue GetKeyState(FValueVector vector);

	FValue CopyFile(FValueVector vector);

	FValue IsFileExist(FValueVector vector);

	FValue DeleteFile(FValueVector vector);

	FValue MoveFile(FValueVector vector);

	FValue CreateFolder(FValueVector vector);

	FValue DeleteFolder(FValueVector vector);

	FValue GetFileLength(FValueVector vector);

	FValue ReadFile(FValueVector vector);

	FValue WaitKey(FValueVector vector);

	FValue DeleteIni(FValueVector vector);

	FValue DeleteIniPwd(FValueVector vector);

	FValue EnableSpeedDx(FValueVector vector);

	FValue EnableIme(FValueVector vector);

	FValue Reg(FValueVector vector);

	FValue SelectFile(FValueVector vector);

	FValue SelectDirectory(FValueVector vector);

	FValue LockDisplay(FValueVector vector);

	FValue FoobarSetSave(FValueVector vector);

	FValue EnumWindowSuper(FValueVector vector);

	FValue DownloadFile(FValueVector vector);

	FValue EnableKeypadMsg(FValueVector vector);

	FValue EnableMouseMsg(FValueVector vector);

	FValue RegNoMac(FValueVector vector);

	FValue RegExNoMac(FValueVector vector);

	FValue SetEnumWindowDelay(FValueVector vector);

	FValue FindMulColor(FValueVector vector);

	FValue GetDict(FValueVector vector);

	FValue GetBindWindow(FValueVector vector);

	FValue FoobarStartGif(FValueVector vector);

	FValue FoobarStopGif(FValueVector vector);

	FValue FreeProcessMemory(FValueVector vector);

	FValue ReadFileData(FValueVector vector);

	FValue VirtualAllocEx(FValueVector vector);

	FValue VirtualFreeEx(FValueVector vector);

	FValue GetCommandLine(FValueVector vector);

	FValue TerminateProcess(FValueVector vector);

	FValue GetNetTimeByIp(FValueVector vector);

	FValue EnumProcess(FValueVector vector);

	FValue GetProcessInfo(FValueVector vector);

	FValue ReadIntAddr(FValueVector vector);

	FValue ReadDataAddr(FValueVector vector);

	FValue ReadDoubleAddr(FValueVector vector);

	FValue ReadFloatAddr(FValueVector vector);

	FValue ReadStringAddr(FValueVector vector);

	FValue WriteDataAddr(FValueVector vector);

	FValue WriteDoubleAddr(FValueVector vector);

	FValue WriteFloatAddr(FValueVector vector);

	FValue WriteIntAddr(FValueVector vector);

	FValue WriteStringAddr(FValueVector vector);

	FValue Delays(FValueVector vector);

	FValue FindColorBlock(FValueVector vector);

	FValue FindColorBlockEx(FValueVector vector);

	FValue OpenProcess(FValueVector vector);

	FValue EnumIniSection(FValueVector vector);

	FValue EnumIniSectionPwd(FValueVector vector);

	FValue EnumIniKey(FValueVector vector);

	FValue EnumIniKeyPwd(FValueVector vector);

	FValue SwitchBindWindow(FValueVector vector);

	FValue InitCri(FValueVector vector);

	FValue SendStringIme2(FValueVector vector);

	FValue EnumWindowByProcessId(FValueVector vector);

	FValue GetDisplayInfo(FValueVector vector);

	FValue EnableFontSmooth(FValueVector vector);

	FValue OcrExOne(FValueVector vector);

	FValue SetAero(FValueVector vector);

	FValue FoobarSetTrans(FValueVector vector);

	FValue EnablePicCache(FValueVector vector);

	FValue FaqIsPosted(FValueVector vector);

	FValue LoadPicByte(FValueVector vector);

	FValue MiddleDown(FValueVector vector);

	FValue MiddleUp(FValueVector vector);

	FValue FaqCaptureString(FValueVector vector);

	FValue VirtualProtectEx(FValueVector vector);

	FValue SetMouseSpeed(FValueVector vector);

	FValue GetMouseSpeed(FValueVector vector);

	FValue EnableMouseAccuracy(FValueVector vector);

	FValue SetExcludeRegion(FValueVector vector);

	FValue EnableShareDict(FValueVector vector);

	FValue DisableCloseDisplayAndSleep(FValueVector vector);

	FValue Int64ToInt32(FValueVector vector);

	FValue GetLocale(FValueVector vector);

	FValue SetLocale(FValueVector vector);

	FValue ReadDataToBin(FValueVector vector);

	FValue WriteDataFromBin(FValueVector vector);

	FValue ReadDataAddrToBin(FValueVector vector);

	FValue WriteDataAddrFromBin(FValueVector vector);

	FValue SetParam64ToPointer(FValueVector vector);

	FValue GetDPI(FValueVector vector);

	FValue SetDisplayRefreshDelay(FValueVector vector);

	FValue IsFolderExist(FValueVector vector);

	FValue GetCpuType(FValueVector vector);

	FValue ReleaseRef(FValueVector vector);

	FValue SetExitThread(FValueVector vector);

	FValue GetFps(FValueVector vector);

	FValue VirtualQueryEx(FValueVector vector);

	FValue AsmCallEx(FValueVector vector);

	FValue GetRemoteApiAddress(FValueVector vector);

	FValue ExecuteCmd(FValueVector vector);

	FValue SpeedNormalGraphic(FValueVector vector);

	FValue UnLoadDriver(FValueVector vector);

	FValue GetOsBuildNumber(FValueVector vector);

	FValue HackSpeed(FValueVector vector);

	FValue GetRealPath(FValueVector vector);

};

#endif  // __APP_DELEGATE_H__

/*
	����1:
	#import ��֧�� /MP,��ôѡ��#include���ͷ�ļ���cpp,�Ҽ�����,C/C++,���ദ�����ص��
*/