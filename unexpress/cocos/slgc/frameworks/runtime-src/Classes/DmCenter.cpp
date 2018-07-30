
#include "DmCenter.h"
//import 语句执行完成之后会生成相应的tlh
typedef long(*dllFunc)(_bstr_t m, long s);

DmCenter * DmCenter::__instance = nullptr;

DmCenter::DmCenter(){
	
}

DmCenter* DmCenter::getInstance(){
	if (!__instance){
		__instance = new DmCenter();
	}
	return __instance;
}

//注册调用
bool DmCenter::registerCall(){
	//将大漠注册到注册表之后(手动注册)
	CoInitialize(NULL);
	CLSID clsid;
	//从注册表中找到大漠
	CLSIDFromProgID(OLESTR("dm.dmsoft"), &clsid);
	__dm = nullptr;
	CoCreateInstance(clsid, NULL, CLSCTX_INPROC_SERVER, __uuidof(Idmsoft), (LPVOID*)&__dm);
	return __dm == nullptr;
}
//非注册调用
bool DmCenter::unregisterCall(){
	typedef  HRESULT(__stdcall * PDllGetClassObject)(REFCLSID, REFIID, LPVOID*);
	PDllGetClassObject  pDllGetClassObject = NULL;
	HMODULE  h = ::LoadLibrary(L"dm.dll");
	if (h == 0)
	{
		return  false;
	}
	pDllGetClassObject = (PDllGetClassObject)GetProcAddress(h, "DllGetClassObject");
	if (pDllGetClassObject == NULL)
	{
		return  false;
	}
	IClassFactory* pcf = NULL;
	HRESULT hr = pDllGetClassObject(__uuidof(dmsoft), IID_IClassFactory, (void**)&pcf);
	if (SUCCEEDED(hr) && pcf != NULL)
	{
		DWORD* PGetRes = NULL;
		hr = pcf->CreateInstance(NULL, IID_IUnknown, (void**)&PGetRes);
		if (SUCCEEDED(hr) && PGetRes != NULL)
		{
			pcf->Release();
			__dm = (Idmsoft*)PGetRes;
			return true;
		}
		if (pcf != NULL)
		{
			pcf->Release();
		}
	}
	if (pcf != NULL)
	{
		pcf->Release();
	}
	return  false;
}

FValue DmCenter::ConvertToFValue(VARIANT var){

	FValue ret;
	switch (var.vt)
	{
	case VT_BSTR://字符串
	case VT_LPSTR://字符串
	case VT_LPWSTR://字符串
		ret = (_bstr_t)var;
		break;

	case VT_I1:
	case VT_UI1:
		ret = var.bVal;
		break;

	case VT_I2://短整型
		ret = var.iVal;
		break;

	case VT_UI2://无符号短整型
		ret = var.uiVal;
		break;

	case VT_INT://整型
		ret = var.intVal;
		break;

	case VT_I4: //整型
		ret = var.lVal;
		break;

	case VT_I8: //长整型
		ret = var.bVal;
		break;

	case VT_UINT://无符号整型
		ret = var.uintVal;
		break;

	case VT_UI4: //无符号整型
		ret = (unsigned int)var.ulVal;
		break;

	case VT_UI8: //无符号长整型
		ret = (unsigned int)var.ulVal;
		break;

	case VT_VOID:
		ret = (unsigned int)var.byref;
		break;

	case VT_R4://浮点型
		ret = var.fltVal;
		break;

	case VT_R8://双精度型
		ret = var.dblVal;
		break;

	case VT_DECIMAL: //小数

		assert(false, "ERROR 没有实现");
		break;

	case VT_CY:
	{
		assert(false, "ERROR 没有实现");
	}
		break;

	case VT_BLOB:
	case VT_BLOB_OBJECT:
	case 0x2011:
		assert(false, "ERROR 没有实现");
		break;

	case VT_BOOL://布尔型
		ret = var.boolVal;
		break;

	case VT_DATE: //日期型
	{
		assert(false, "ERROR 没有实现");
	}
		break;

	case VT_NULL://NULL值
		assert(false, "ERROR 没有实现");
		break;

	case VT_EMPTY://空
		assert(false, "ERROR 没有实现");
		break;

	case VT_UNKNOWN://未知类型
	default:
		assert(false, "ERROR 没有实现");
		break;

	}
	return ret;
}
// 导入Lua
FValue DmCenter::Ver(FValueVector vector){
	_bstr_t ret =__dm->Ver();
	return FValue(ret);
}

FValue DmCenter::SetPath(FValueVector vector){
	string str = vector[0].asString();
	long ret = __dm->SetPath(str.c_str());
	return FValue(ret);
}

FValue DmCenter::Ocr(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	const char*color = vector[4].asString().c_str();
	double sim = vector[5].asDouble();
	return FValue(__dm->Ocr(x1, y1, x2, y2, color, sim));
}
/*
	paramater:
	x1, y1, x2, y2, str, color, sim
	return
	{x=v,y=v}
*/
FValue DmCenter::FindStr(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	const char*str = vector[4].asString().c_str();
	const char*color = vector[5].asString().c_str();
	double sim = vector[6].asDouble();

	VARIANT x, y;
	__dm->FindStr(x1, y1, x2, y2, str, color, sim, &x, &y);

	FValueMap map;
	map["x"] = ConvertToFValue(x);
	map["y"] = ConvertToFValue(y);
	return FValue(map);

}

FValue DmCenter::GetResultCount(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetResultPos(FValueVector vector){
	return FValue();
}

FValue DmCenter::StrStr(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendCommand(FValueVector vector){
	return FValue();
}

FValue DmCenter::UseDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetBasePath(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDictPwd(FValueVector vector){
	return FValue();
}

FValue DmCenter::OcrInFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::Capture(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyPress(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyDown(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyUp(FValueVector vector){
	return FValue();
}

FValue DmCenter::LeftClick(FValueVector vector){
	return FValue();
}

FValue DmCenter::RightClick(FValueVector vector){
	return FValue();
}

FValue DmCenter::MiddleClick(FValueVector vector){
	return FValue();
}

FValue DmCenter::LeftDoubleClick(FValueVector vector){
	return FValue();
}

FValue DmCenter::LeftDown(FValueVector vector){
	return FValue();
}

FValue DmCenter::LeftUp(FValueVector vector){
	return FValue();
}

FValue DmCenter::RightDown(FValueVector vector){
	return FValue();
}

FValue DmCenter::RightUp(FValueVector vector){
	return FValue();
}

FValue DmCenter::MoveTo(FValueVector vector){
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	return FValue(__dm->MoveTo(x,y));
}


FValue DmCenter::MoveR(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetColor(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetColorBGR(FValueVector vector){
	return FValue();
}

FValue DmCenter::RGB2BGR(FValueVector vector){
	return FValue();
}

FValue DmCenter::BGR2RGB(FValueVector vector){
	return FValue();
}

FValue DmCenter::UnBindWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::CmpColor(FValueVector vector){
	return FValue();
}

FValue DmCenter::ClientToScreen(FValueVector vector){
	return FValue();
}

FValue DmCenter::ScreenToClient(FValueVector vector){
	return FValue();
}

FValue DmCenter::ShowScrMsg(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetMinRowGap(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetMinColGap(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindColor(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindColorEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWordLineHeight(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWordGap(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetRowGapNoDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetColGapNoDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWordLineHeightNoDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWordGapNoDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWordResultCount(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWordResultPos(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWordResultStr(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWords(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWordsNoDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetShowErrorMsg(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetClientSize(FValueVector vector){
	return FValue();
}

FValue DmCenter::MoveWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetColorHSV(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetAveRGB(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetAveHSV(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetForegroundWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetForegroundFocus(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetMousePointWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetPointWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWindowState(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetSpecialWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWindowText(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWindowSize(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWindowRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWindowTitle(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWindowClass(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWindowState(FValueVector vector){
	return FValue();
}

FValue DmCenter::CreateFoobarRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::CreateFoobarRoundRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::CreateFoobarEllipse(FValueVector vector){
	return FValue();
}

FValue DmCenter::CreateFoobarCustom(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarFillRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarDrawText(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarDrawPic(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarUpdate(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarLock(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarUnlock(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarSetFont(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarTextRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarPrintText(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarClearText(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarTextLineGap(FValueVector vector){
	return FValue();
}

FValue DmCenter::Play(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqCapture(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqRelease(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqSend(FValueVector vector){
	return FValue();
}

FValue DmCenter::Beep(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarClose(FValueVector vector){
	return FValue();
}

FValue DmCenter::MoveDD(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqGetSize(FValueVector vector){
	return FValue();
}

FValue DmCenter::LoadPic(FValueVector vector){
	return FValue();
}

FValue DmCenter::FreePic(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetScreenData(FValueVector vector){
	return FValue();
}

FValue DmCenter::FreeScreenData(FValueVector vector){
	return FValue();
}

FValue DmCenter::WheelUp(FValueVector vector){
	return FValue();
}

FValue DmCenter::WheelDown(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetMouseDelay(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetKeypadDelay(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetEnv(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetEnv(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendString(FValueVector vector){
	return FValue();
}

FValue DmCenter::DelEnv(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetPath(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPic(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPicEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetClientSize(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadInt(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadFloat(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadDouble(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindInt(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindFloat(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindDouble(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindString(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetModuleBaseAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::MoveToEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::MatchPicName(FValueVector vector){
	return FValue();
}

FValue DmCenter::AddDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnterCri(FValueVector vector){
	return FValue();
}

FValue DmCenter::LeaveCri(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteInt(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteFloat(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteDouble(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteString(FValueVector vector){
	return FValue();
}

FValue DmCenter::AsmAdd(FValueVector vector){
	return FValue();
}

FValue DmCenter::AsmClear(FValueVector vector){
	return FValue();
}

FValue DmCenter::AsmCall(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindMultiColor(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindMultiColorEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::Assemble(FValueVector vector){
	return FValue();
}

FValue DmCenter::DisAssemble(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetWindowTransparent(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadData(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteData(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindData(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetPicPwd(FValueVector vector){
	return FValue();
}

FValue DmCenter::Log(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrE(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindColorE(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPicE(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindMultiColorE(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetExactOcr(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadString(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarTextPrintDir(FValueVector vector){
	return FValue();
}

FValue DmCenter::OcrEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDisplayInput(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetTime(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetScreenWidth(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetScreenHeight(FValueVector vector){
	return FValue();
}

FValue DmCenter::BindWindowEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDiskSerial(FValueVector vector){
	return FValue();
}

FValue DmCenter::Md5(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetMac(FValueVector vector){
	return FValue();
}

FValue DmCenter::ActiveInputMethod(FValueVector vector){
	return FValue();
}

FValue DmCenter::CheckInputMethod(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindInputMethod(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetCursorPos(FValueVector vector){
	return FValue();
}

FValue DmCenter::BindWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetScreenDepth(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetScreen(FValueVector vector){
	return FValue();
}

FValue DmCenter::ExitOs(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDir(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetOsType(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindWindowEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetExportDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetCursorShape(FValueVector vector){
	return FValue();
}

FValue DmCenter::DownCpu(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetCursorSpot(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendString2(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqPost(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqFetch(FValueVector vector){
	return FValue();
}

FValue DmCenter::FetchWord(FValueVector vector){
	return FValue();
}

FValue DmCenter::CaptureJpg(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrWithFont(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrWithFontE(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrWithFontEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDictInfo(FValueVector vector){
	return FValue();
}

FValue DmCenter::SaveDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWindowProcessId(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetWindowProcessPath(FValueVector vector){
	return FValue();
}

FValue DmCenter::LockInput(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetPicSize(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetID(FValueVector vector){
	return FValue();
}

FValue DmCenter::CapturePng(FValueVector vector){
	return FValue();
}

FValue DmCenter::CaptureGif(FValueVector vector){
	return FValue();
}

FValue DmCenter::ImageToBmp(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrFast(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrFastEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrFastE(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableDisplayDebug(FValueVector vector){
	return FValue();
}

FValue DmCenter::CapturePre(FValueVector vector){
	return FValue();
}

FValue DmCenter::RegEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetMachineCode(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetClipboard(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetClipboard(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetNowDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::Is64Bit(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetColorNum(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumWindowByProcess(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDictCount(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetLastError(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetNetTime(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableGetColorByCapture(FValueVector vector){
	return FValue();
}

FValue DmCenter::CheckUAC(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetUAC(FValueVector vector){
	return FValue();
}

FValue DmCenter::DisableFontSmooth(FValueVector vector){
	return FValue();
}

FValue DmCenter::CheckFontSmooth(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDisplayAcceler(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindWindowByProcess(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindWindowByProcessId(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadIni(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteIni(FValueVector vector){
	return FValue();
}

FValue DmCenter::RunApp(FValueVector vector){
	return FValue();
}

FValue DmCenter::delay(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindWindowSuper(FValueVector vector){
	return FValue();
}

FValue DmCenter::ExcludePos(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindNearestPos(FValueVector vector){
	return FValue();
}

FValue DmCenter::SortPosDistance(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPicMem(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPicMemEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPicMemE(FValueVector vector){
	return FValue();
}

FValue DmCenter::AppendPicAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::Stop(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDictMem(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetNetTimeSafe(FValueVector vector){
	return FValue();
}

FValue DmCenter::ForceUnBindWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadIniPwd(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteIniPwd(FValueVector vector){
	return FValue();
}

FValue DmCenter::DecodeFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyDownChar(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyUpChar(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyPressChar(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyPressStr(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableKeypadPatch(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableKeypadSync(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableMouseSync(FValueVector vector){
	return FValue();
}

FValue DmCenter::DmGuard(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqCaptureFromFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindIntEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindFloatEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindDoubleEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStringEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindDataEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableRealMouse(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableRealKeypad(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendStringIme(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarDrawLine(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::IsBind(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDisplayDelay(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDmCount(FValueVector vector){
	return FValue();
}

FValue DmCenter::DisableScreenSave(FValueVector vector){
	return FValue();
}

FValue DmCenter::DisablePowerSave(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetMemoryHwndAsProcessId(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindShape(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindShapeE(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindShapeEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrS(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrExS(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrFastS(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrFastExS(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPicS(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindPicExS(FValueVector vector){
	return FValue();
}

FValue DmCenter::ClearDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetMachineCodeNoMac(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetClientRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableFakeActive(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetScreenDataBmp(FValueVector vector){
	return FValue();
}

FValue DmCenter::EncodeFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetCursorShapeEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqCancel(FValueVector vector){
	return FValue();
}

FValue DmCenter::IntToData(FValueVector vector){
	return FValue();
}

FValue DmCenter::FloatToData(FValueVector vector){
	return FValue();
}

FValue DmCenter::DoubleToData(FValueVector vector){
	return FValue();
}

FValue DmCenter::StringToData(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetMemoryFindResultToFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableBind(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetSimMode(FValueVector vector){
	return FValue();
}

FValue DmCenter::LockMouseRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendPaste(FValueVector vector){
	return FValue();
}

FValue DmCenter::IsDisplayDead(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetKeyState(FValueVector vector){
	return FValue();
}

FValue DmCenter::CopyFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::IsFileExist(FValueVector vector){
	return FValue();
}

FValue DmCenter::DeleteFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::MoveFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::CreateFolder(FValueVector vector){
	return FValue();
}

FValue DmCenter::DeleteFolder(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetFileLength(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::WaitKey(FValueVector vector){
	return FValue();
}

FValue DmCenter::DeleteIni(FValueVector vector){
	return FValue();
}

FValue DmCenter::DeleteIniPwd(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableSpeedDx(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableIme(FValueVector vector){
	return FValue();
}

FValue DmCenter::Reg(FValueVector vector){
	return FValue();
}

FValue DmCenter::SelectFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::SelectDirectory(FValueVector vector){
	return FValue();
}

FValue DmCenter::LockDisplay(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarSetSave(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumWindowSuper(FValueVector vector){
	return FValue();
}

FValue DmCenter::DownloadFile(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableKeypadMsg(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableMouseMsg(FValueVector vector){
	return FValue();
}

FValue DmCenter::RegNoMac(FValueVector vector){
	return FValue();
}

FValue DmCenter::RegExNoMac(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetEnumWindowDelay(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindMulColor(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetBindWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarStartGif(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarStopGif(FValueVector vector){
	return FValue();
}

FValue DmCenter::FreeProcessMemory(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadFileData(FValueVector vector){
	return FValue();
}

FValue DmCenter::VirtualAllocEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::VirtualFreeEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetCommandLine(FValueVector vector){
	return FValue();
}

FValue DmCenter::TerminateProcess(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetNetTimeByIp(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumProcess(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetProcessInfo(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadIntAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadDataAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadDoubleAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadFloatAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadStringAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteDataAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteDoubleAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteFloatAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteIntAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteStringAddr(FValueVector vector){
	return FValue();
}

FValue DmCenter::Delays(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindColorBlock(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindColorBlockEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::OpenProcess(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumIniSection(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumIniSectionPwd(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumIniKey(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumIniKeyPwd(FValueVector vector){
	return FValue();
}

FValue DmCenter::SwitchBindWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::InitCri(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendStringIme2(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnumWindowByProcessId(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDisplayInfo(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableFontSmooth(FValueVector vector){
	return FValue();
}

FValue DmCenter::OcrExOne(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetAero(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarSetTrans(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnablePicCache(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqIsPosted(FValueVector vector){
	return FValue();
}

FValue DmCenter::LoadPicByte(FValueVector vector){
	return FValue();
}

FValue DmCenter::MiddleDown(FValueVector vector){
	return FValue();
}

FValue DmCenter::MiddleUp(FValueVector vector){
	return FValue();
}

FValue DmCenter::FaqCaptureString(FValueVector vector){
	return FValue();
}

FValue DmCenter::VirtualProtectEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetMouseSpeed(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetMouseSpeed(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableMouseAccuracy(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetExcludeRegion(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableShareDict(FValueVector vector){
	return FValue();
}

FValue DmCenter::DisableCloseDisplayAndSleep(FValueVector vector){
	return FValue();
}

FValue DmCenter::Int64ToInt32(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetLocale(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetLocale(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadDataToBin(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteDataFromBin(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReadDataAddrToBin(FValueVector vector){
	return FValue();
}

FValue DmCenter::WriteDataAddrFromBin(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetParam64ToPointer(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDPI(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDisplayRefreshDelay(FValueVector vector){
	return FValue();
}

FValue DmCenter::IsFolderExist(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetCpuType(FValueVector vector){
	return FValue();
}

FValue DmCenter::ReleaseRef(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetExitThread(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetFps(FValueVector vector){
	return FValue();
}

FValue DmCenter::VirtualQueryEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::AsmCallEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetRemoteApiAddress(FValueVector vector){
	return FValue();
}

FValue DmCenter::ExecuteCmd(FValueVector vector){
	return FValue();
}

FValue DmCenter::SpeedNormalGraphic(FValueVector vector){
	return FValue();
}

FValue DmCenter::UnLoadDriver(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetOsBuildNumber(FValueVector vector){
	return FValue();
}

FValue DmCenter::HackSpeed(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetRealPath(FValueVector vector){
	return FValue();
}