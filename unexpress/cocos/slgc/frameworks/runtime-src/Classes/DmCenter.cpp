
#include "DmCenter.h"
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

bool DmCenter::registerCall(){
	//初始化COM组件
	CoInitialize(NULL);
	CLSID clsid;
	//从注册表中找到名为 dm.dmsoft的项
	CLSIDFromProgID(OLESTR("dm.dmsoft"), &clsid);
	__dm = nullptr;
	//根据找到的项 创建dm的实例
	CoCreateInstance(clsid, NULL, CLSCTX_INPROC_SERVER, __uuidof(Idmsoft), (LPVOID*)&__dm);
	return __dm == nullptr;
}
//免注册调用
bool DmCenter::unregisterCall(){
	typedef  HRESULT(__stdcall * PDllGetClassObject)(REFCLSID, REFIID, LPVOID*);
	PDllGetClassObject  pDllGetClassObject = NULL;
	//加载dll库
	HMODULE  h = ::LoadLibrary(L"dm.dll");
	if (h == 0)
	{
		return  false;
	}
	//调用dll库的DllGetClassObject方法获取大漠指针
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
	case VT_BSTR:
	case VT_LPSTR:
	case VT_LPWSTR:
		ret = (_bstr_t)var;
		break;

	case VT_I1:
	case VT_UI1:
		ret = var.bVal;
		break;

	case VT_I2:
		ret = var.iVal;
		break;

	case VT_UI2:
		ret = var.uiVal;
		break;

	case VT_INT:
		ret = var.intVal;
		break;

	case VT_I4: 
		ret = var.lVal;
		break;

	case VT_I8:
		ret = var.bVal;
		break;

	case VT_UINT:
		ret = var.uintVal;
		break;

	case VT_UI4: 
		ret = (unsigned int)var.ulVal;
		break;

	case VT_UI8: 
		ret = (unsigned int)var.ulVal;
		break;

	case VT_VOID:
		ret = (unsigned int)var.byref;
		break;

	case VT_R4:
		ret = var.fltVal;
		break;

	case VT_R8:
		ret = var.dblVal;
		break;

	case VT_DECIMAL: 
		assert(false, "UNKOWN TYPE");
		break;

	case VT_CY:
	{
		assert(false, "UNKOWN TYPE");
	}
		break;

	case VT_BLOB:
	case VT_BLOB_OBJECT:
	case 0x2011:
		assert(false, "UNKOWN TYPE");
		break;

	case VT_BOOL:
		ret = var.boolVal;
		break;

	case VT_DATE:
	{
		assert(false, "UNKOWN TYPE");
	}
		break;

	case VT_NULL://NULLֵ
		assert(false, "UNKOWN TYPE");
		break;

	case VT_EMPTY:
		assert(false, "UNKOWN TYPE");
		break;

	case VT_UNKNOWN:
	default:
		assert(false, "UNKOWN TYPE");
		break;

	}
	return ret;
}
// 导入到Lua
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
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	return FValue(__dm->Ocr(x1, y1, x2, y2, color.c_str(), sim));
}
/*
	paramater:
	x1, y1, x2, y2, str, color.c_str(), sim
	return
	{x=v,y=v}
*/
FValue DmCenter::FindStr(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	const char*str = vector[4].asString().c_str();
	string color = vector[5].asString();
	double sim = vector[6].asDouble();

	VARIANT x, y;
	int ret =__dm->FindStr(x1, y1, x2, y2, str, color.c_str(), sim, &x, &y);
	FValueMap map;
	if(ret != -1){
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}else{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue(map);
}

FValue DmCenter::GetResultCount(FValueVector vector){
	string ret = vector[0].asString();
	return FValue(__dm->GetResultCount (ret.c_str()));
}

FValue DmCenter::GetResultPos(FValueVector vector){
	string ret = vector[0].asString();
	long index = vector[1].asDouble();
	VARIANT x, y;
	int re =__dm->GetResultPos(ret.c_str(), index,&x,&y);
	FValueMap map;
	if (re == 1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}
	return FValue(map);
}

FValue DmCenter::StrStr(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendCommand(FValueVector vector){
	return FValue();
}

FValue DmCenter::UseDict(FValueVector vector){
	long index = vector[0].asDouble();
	return FValue(__dm->UseDict(index));
}

FValue DmCenter::GetBasePath(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetDictPwd(FValueVector vector){
	string pwd = vector[0].asString();
	return FValue(__dm->SetDictPwd(pwd.c_str()));
}

FValue DmCenter::OcrInFile(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_name = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[4].asDouble();

	return FValue(__dm->OcrInFile(x1, y1, x2, y2, pic_name.c_str(), color_format.c_str(), sim));
}

FValue DmCenter::Capture(FValueVector vector){
	
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string file = vector[4].asString();
	return FValue(__dm->Capture(x1, y1, x2, y2, file.c_str()));
}

FValue DmCenter::KeyPress(FValueVector vector){
	long code = vector[0].asDouble();
	return FValue(__dm->KeyPress(code));
}

FValue DmCenter::KeyDown(FValueVector vector){
	long code = vector[0].asDouble();
	return FValue(__dm->KeyDown(code));
}

FValue DmCenter::KeyUp(FValueVector vector){
	long code = vector[0].asDouble();
	return FValue(__dm->KeyUp(code));
}

FValue DmCenter::LeftClick(FValueVector vector){
	return FValue(__dm->LeftClick());
}

FValue DmCenter::RightClick(FValueVector vector){
	return FValue(__dm->RightClick());
}

FValue DmCenter::MiddleClick(FValueVector vector){
	return FValue(__dm->MiddleClick());
}

FValue DmCenter::LeftDoubleClick(FValueVector vector){
	return FValue(__dm->LeftDoubleClick());
}

FValue DmCenter::LeftDown(FValueVector vector){
	return FValue(__dm->LeftDown());
}

FValue DmCenter::LeftUp(FValueVector vector){
	return FValue(__dm->LeftUp());
}

FValue DmCenter::RightDown(FValueVector vector){
	return FValue(__dm->RightDown());
}

FValue DmCenter::RightUp(FValueVector vector){
	return FValue(__dm->RightUp());
}

FValue DmCenter::MoveTo(FValueVector vector){
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	return FValue(__dm->MoveTo(x,y));
}


FValue DmCenter::MoveR(FValueVector vector){
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	return FValue(__dm->MoveR(x,y));
}

FValue DmCenter::GetColor(FValueVector vector){
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	return FValue(__dm->GetColor(x,y));
}

FValue DmCenter::GetColorBGR(FValueVector vector){
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	return FValue(__dm->GetColorBGR(x,y));
}

FValue DmCenter::RGB2BGR(FValueVector vector){
	string rgb_color = vector[0].asString();
	return FValue(__dm->RGB2BGR(rgb_color.c_str()));
}

FValue DmCenter::BGR2RGB(FValueVector vector){
	string color = vector[0].asString();
	return FValue(__dm->BGR2RGB(color.c_str()));
}

FValue DmCenter::UnBindWindow(FValueVector vector){
	return FValue();
}

FValue DmCenter::CmpColor(FValueVector vector){
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	string color = vector[2].asString();
	double sim = vector[3].asDouble();
	return FValue(__dm-> CmpColor(x, y, color.c_str(), sim));
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
	long min_row_gap = vector[0].asDouble();
	return FValue(__dm->SetMinRowGap(min_row_gap));
}

FValue DmCenter::SetMinColGap(FValueVector vector){
	long min_col_gap = vector[0].asDouble();
	return FValue(__dm->SetMinColGap(min_col_gap));
}

FValue DmCenter::FindColor(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	long dir = vector[6].asDouble();
	VARIANT x, y;
	int ret = __dm->FindColor(x1, y1, x2, y2, color.c_str(), sim, dir, &x, &y);
	FValueMap map;
	if(ret == 1){
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}else{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}
	
	return FValue(map);
}

FValue DmCenter::FindColorEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	long dir = vector[6].asDouble();
	
	return FValue(__dm->FindColorEx(x1, y1, x2, y2, color.c_str(), sim, dir));
}

FValue DmCenter::SetWordLineHeight(FValueVector vector){
	long line_height = vector[0].asDouble();
	return FValue(__dm->SetWordLineHeight(line_height));
}

FValue DmCenter::SetWordGap(FValueVector vector){
	long word_gap = vector[0].asDouble();
	return FValue(__dm->SetWordGap(word_gap));
}

FValue DmCenter::SetRowGapNoDict(FValueVector vector){
	long row_gap = vector[0].asDouble();
	return FValue(__dm->SetRowGapNoDict(row_gap));
}

FValue DmCenter::SetColGapNoDict(FValueVector vector){
	long col_gap = vector[0].asDouble();

	return FValue(__dm->SetColGapNoDict(col_gap));
}

FValue DmCenter::SetWordLineHeightNoDict(FValueVector vector){
	long line_height = vector[0].asDouble();
	return FValue(__dm->SetWordLineHeightNoDict(line_height));
}

FValue DmCenter::SetWordGapNoDict(FValueVector vector){
	long word_gap = vector[0].asDouble();
	return FValue(__dm->SetWordGapNoDict(word_gap));
}

FValue DmCenter::GetWordResultCount(FValueVector vector){
	string str = vector[0].asString();
	return FValue(__dm->GetWordResultCount(str.c_str()));
}

FValue DmCenter::GetWordResultPos(FValueVector vector){
	string str = vector[0].asString();
	long index = vector[1].asDouble();
	VARIANT x, y;
	int ret = __dm->GetWordResultPos(str.c_str(),index, &x, &y);
	FValueMap map;
	if (ret == 1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}
	return FValue(map);
}

FValue DmCenter::GetWordResultStr(FValueVector vector){
	string str = vector[0].asString();
	long index = vector[1].asDouble();
	
	return FValue(__dm->GetWordResultStr (str.c_str(),index));
}

FValue DmCenter::GetWords(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	
	return FValue(__dm->GetWords(x1, y1, x2, y2, color.c_str(), sim));
}

FValue DmCenter::GetWordsNoDict(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
 
	return FValue(__dm->GetWordsNoDict(x1, y1, x2, y2, color.c_str()));
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
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	return FValue(__dm->GetColorHSV(x,y));
}

FValue DmCenter::GetAveRGB(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();

	return FValue(__dm->GetAveRGB(x1, y1, x2, y2));
}

FValue DmCenter::GetAveHSV(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	return FValue(__dm->GetAveHSV(x1,y1,x2,y2));
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
	string pic = vector[0].asString();
	return FValue(__dm->LoadPic(pic.c_str()));
}

FValue DmCenter::FreePic(FValueVector vector){
	string pic = vector[0].asString();
	return FValue(__dm->FreePic(pic.c_str()));
}

FValue DmCenter::GetScreenData(FValueVector vector){
	return FValue();
}

FValue DmCenter::FreeScreenData(FValueVector vector){
	return FValue();
}

FValue DmCenter::WheelUp(FValueVector vector){
	return FValue(__dm->WheelUp());
}

FValue DmCenter::WheelDown(FValueVector vector){
	return FValue(__dm->WheelDown());
}

FValue DmCenter::SetMouseDelay(FValueVector vector){
	string type = vector[0].asString();
	long delay = vector[1].asDouble();
	return FValue(__dm->SetMouseDelay(type.c_str(), delay));
}

FValue DmCenter::SetKeypadDelay(FValueVector vector){
	string type = vector[0].asString();
	long delay = vector[1].asDouble();
	return FValue(__dm->SetKeypadDelay(type.c_str(), delay));
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
	long index = vector[0].asDouble();
	string file = vector[1].asString();

	return FValue(__dm->SetDict(index,file.c_str()));
}

FValue DmCenter::FindPic(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_name = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();
	VARIANT x, y;
	int ret = __dm->FindPic(x1, y1, x2, y2, pic_name.c_str(), delta_color.c_str(), sim, dir, &x,&y);
	FValueMap map;
	if (ret != -1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue(map);
}

FValue DmCenter::FindPicEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_name = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();
	return FValue(__dm->FindPicEx(x1, y1, x2, y2, pic_name.c_str(), delta_color.c_str(), sim, dir));
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
	long x = vector[0].asDouble();
	long y = vector[1].asDouble();
	long w = vector[2].asDouble();
	long h = vector[3].asDouble();
	return FValue(__dm->MoveToEx(x, y, w, h));
}

FValue DmCenter::MatchPicName(FValueVector vector){
	string pic_name = vector[0].asString();
	return FValue(__dm->MatchPicName(pic_name.c_str()));
}

FValue DmCenter::AddDict(FValueVector vector){
	long index = vector[0].asDouble();
	string dict_info = vector[1].asString();

	return FValue(__dm->AddDict(index, dict_info.c_str()));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string first_color = vector[4].asString();
	string offset_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();
	VARIANT x, y;
	int ret = __dm->FindMultiColor(x1, y1, x2, y2, first_color.c_str(), offset_color.c_str(), sim, dir, &x, &y);																					
	FValueMap map;
	if (ret == 1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue(map);
}

FValue DmCenter::FindMultiColorEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string first_color = vector[4].asString();
	string offset_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();
	return FValue(__dm->FindMultiColorEx(x1, y1, x2, y2, first_color.c_str(), offset_color.c_str(), sim, dir));
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
	string pwd = vector[0].asString();
	return FValue(__dm->SetPicPwd(pwd.c_str()));
}

FValue DmCenter::Log(FValueVector vector){
	return FValue();
}

FValue DmCenter::FindStrE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();

	return FValue(__dm->FindStrE(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim));
}

FValue DmCenter::FindColorE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	long dir = vector[6].asDouble();

	return FValue(__dm->FindColorE(x1, y1, x2, y2, color.c_str(), sim, dir));
}

FValue DmCenter::FindPicE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_name = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();
	return FValue(__dm->FindPicE(x1, y1, x2, y2, pic_name.c_str(), delta_color.c_str(), sim, dir));
}

FValue DmCenter::FindMultiColorE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string first_color = vector[4].asString();
	string offset_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();

	return FValue(__dm->FindMultiColorE(x1, y1, x2, y2, first_color.c_str(), offset_color.c_str(), sim, dir));
}

FValue DmCenter::SetExactOcr(FValueVector vector){
	long exact_ocr = vector[0].asDouble();
	return FValue(__dm->SetExactOcr(exact_ocr));
}

FValue DmCenter::ReadString(FValueVector vector){
	return FValue();
}

FValue DmCenter::FoobarTextPrintDir(FValueVector vector){
	return FValue();
}

FValue DmCenter::OcrEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	return FValue(__dm->OcrEx(x1, y1, x2, y2, color.c_str(), sim));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	string word = vector[5].asString();

	return FValue(__dm->FetchWord(x1,y1,x2,y2,color.c_str(),word.c_str()));
}

FValue DmCenter::CaptureJpg(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string file = vector[4].asString();
	long quality = vector[5].asDouble();
	return FValue(__dm->CaptureJpg(x1, y1, x2, y2, file.c_str(), quality));
}

FValue DmCenter::FindStrWithFont(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();
	string font_name = vector[7].asString();
	long font_size = vector[8].asDouble();
	long flag = vector[9].asDouble();

	VARIANT x, y;
	int ret = __dm->FindStrWithFont(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim, font_name.c_str(), font_size, flag, &x, &y);
	FValueMap map;
	if (ret != -1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue(map);
}

FValue DmCenter::FindStrWithFontE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();
	string font_name = vector[7].asString();
	long font_size = vector[8].asDouble();
	long flag = vector[9].asDouble();

	return FValue(__dm->FindStrWithFontE(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim, font_name.c_str(), font_size, flag));
}

FValue DmCenter::FindStrWithFontEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();
	string font_name = vector[7].asString();
	long font_size = vector[8].asDouble();
	long flag = vector[9].asDouble();

	return FValue(__dm->FindStrWithFontEx(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim, font_name.c_str(), font_size, flag));
}

FValue DmCenter::GetDictInfo(FValueVector vector){
	string str = vector[0].asString();
	string font_name = vector[1].asString();
	long font_size = vector[2].asDouble();
	long flag = vector[3].asDouble();
	return FValue(__dm->GetDictInfo(str.c_str(), font_name.c_str(), font_size, flag));
}

FValue DmCenter::SaveDict(FValueVector vector)
{
	long index = vector[0].asDouble();
	string file = vector[1].asString();

	return FValue(__dm->SaveDict(index, file.c_str()));
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
	string pic_name = vector[0].asString();

	return FValue(__dm->GetPicSize(pic_name.c_str()));
}

FValue DmCenter::GetID(FValueVector vector){
	return FValue();
}

FValue DmCenter::CapturePng(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string file = vector[4].asString();
	return FValue(__dm->CapturePng(x1, y1, x2, y2, file.c_str()));
}

FValue DmCenter::CaptureGif(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string file = vector[4].asString();
	long delay = vector[5].asDouble();
	long time = vector[6].asDouble();

	return FValue(__dm->CaptureGif(x1, y1, x2, y2, file.c_str(), delay, time));
}

FValue DmCenter::ImageToBmp(FValueVector vector){
	string pic_name = vector[0].asString();
	string bmp_name = vector[1].asString();
	return FValue(__dm->ImageToBmp(pic_name.c_str(), bmp_name.c_str()));
}

FValue DmCenter::FindStrFast(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();
	
	VARIANT x, y;
	int ret = __dm->FindStrFast(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim, &x, &y);
	FValueMap map;
	if (ret != -1){
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}else{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue();
}

FValue DmCenter::FindStrFastEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();

	return FValue(__dm->FindStrFastEx(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim));
}

FValue DmCenter::FindStrFastE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();

	return FValue(__dm->FindStrFastE(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim));
}

FValue DmCenter::EnableDisplayDebug(FValueVector vector){
	long enable_debug = vector[0].asDouble();
	return FValue(__dm->EnableDisplayDebug(enable_debug));
}

FValue DmCenter::CapturePre(FValueVector vector){
	string file = vector[0].asString();
	return FValue(__dm->CapturePre(file.c_str()));
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
	return FValue(__dm->GetNowDict());
}

FValue DmCenter::Is64Bit(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetColorNum(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[6].asDouble();
	return FValue(__dm->GetColorNum(x1, y1, x2, y2, color.c_str(), sim));
}

FValue DmCenter::EnumWindowByProcess(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetDictCount(FValueVector vector){
	long index = vector[0].asDouble();
	return FValue(__dm->GetDictCount(index));
}

FValue DmCenter::GetLastError(FValueVector vector){
	return FValue();
}

FValue DmCenter::GetNetTime(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableGetColorByCapture(FValueVector vector){
	long enable = vector[0].asDouble();
	return FValue(__dm->EnableGetColorByCapture(enable));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_info = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();
	VARIANT x, y;
	int ret = __dm->FindPicMem(x1, y1, x2, y2, pic_info.c_str(), delta_color.c_str(), sim, dir, &x, &y);
	FValueMap map;
	if (ret != -1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue(map);
}

FValue DmCenter::FindPicMemEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_info = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();

	return FValue(__dm->FindPicMemEx(x1, y1, x2, y2, pic_info.c_str(), delta_color.c_str(), sim, dir));
}

FValue DmCenter::FindPicMemE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_info = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();
 
	return FValue(__dm->FindPicMemE(x1, y1, x2, y2, pic_info.c_str(), delta_color.c_str(), sim, dir));
}

FValue DmCenter::AppendPicAddr(FValueVector vector){
	string pic_info = vector[0].asString();
	long addr = vector[1].asDouble();
	long size = vector[2].asDouble();
	return FValue(__dm->AppendPicAddr(pic_info.c_str(), addr, size));
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
	string key = vector[0].asString();
	return FValue(__dm->KeyDownChar(key.c_str()));
}

FValue DmCenter::KeyUpChar(FValueVector vector){
	return FValue();
}

FValue DmCenter::KeyPressChar(FValueVector vector){
	string key = vector[0].asString();
	return FValue(__dm->KeyDownChar(key.c_str()));
}

FValue DmCenter::KeyPressStr(FValueVector vector){
	string content = vector[0].asString();
	return FValue(__dm->KeyDownChar(content.c_str()));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();

	return FValue(__dm->FindStrEx(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string offset_color = vector[4].asString();
	double sim = vector[5].asDouble();
	long dir = vector[6].asDouble();

	VARIANT x, y;
	int ret = __dm->FindShape(x1, y1, x2, y2, offset_color.c_str(), sim, dir, &x, &y);
	FValueMap map;
	if (ret == 1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue(map);
}

FValue DmCenter::FindShapeE(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string offset_color = vector[4].asString();
	double sim = vector[5].asDouble();
	long dir = vector[6].asDouble();

	return FValue(__dm->FindShapeE(x1, y1, x2, y2, offset_color.c_str(), sim, dir));
}

FValue DmCenter::FindShapeEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string offset_color = vector[4].asString();
	double sim = vector[5].asDouble();
	long dir = vector[6].asDouble();

	return FValue(__dm->FindShapeEx(x1, y1, x2, y2, offset_color.c_str(), sim, dir));
}

FValue DmCenter::FindStrS(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();
	VARIANT x, y;
	string ret = __dm->FindStrS(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim, &x, &y);
	FValueMap map;
	if (ret != "")
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
		map["str"] = FValue(ret);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
		map["str"] = FValue(ret);
	}

	return FValue(map);
}

FValue DmCenter::FindStrExS(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();
	
	return FValue(__dm->FindStrExS(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim));
}

FValue DmCenter::FindStrFastS(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();
	VARIANT x,y;
	string ret =__dm->FindStrFastS(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim,&x,&y);
	FValueMap map;
	if (ret != "")
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
		map["str"] = FValue(ret);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
		map["str"] = FValue(ret);
	}

	return FValue(map);
}

FValue DmCenter::FindStrFastExS(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string str = vector[4].asString();
	string color_format = vector[5].asString();
	double sim = vector[6].asDouble();

	return FValue(__dm->FindStrFastEx(x1, y1, x2, y2, str.c_str(), color_format.c_str(), sim));
}

FValue DmCenter::FindPicS(FValueVector vector){
	
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_name = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();

	VARIANT x, y;
	string ret = __dm->FindPicS(x1, y1, x2, y2, pic_name.c_str(), delta_color.c_str(), sim, dir, &x, &y);
	FValueMap map;
	if (ret != "")
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
		map["pic"] = FValue(ret);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
		map["pic"] = FValue(ret);
	}

	return FValue(map);
}

FValue DmCenter::FindPicExS(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string pic_name = vector[4].asString();
	string delta_color = vector[5].asString();
	double sim = vector[6].asDouble();
	long dir = vector[7].asDouble();

	return FValue(__dm->FindPicExS(x1, y1, x2, y2, pic_name.c_str(), delta_color.c_str(), sim, dir));
	return FValue();
}

FValue DmCenter::ClearDict(FValueVector vector){
	long index = vector[0].asDouble();
	return FValue(__dm->ClearDict(index));
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
	long mode = vector[0].asDouble();
	return FValue(__dm->SetSimMode(mode));
}

FValue DmCenter::LockMouseRect(FValueVector vector){
	return FValue();
}

FValue DmCenter::SendPaste(FValueVector vector){
	return FValue();
}

FValue DmCenter::IsDisplayDead(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	long t = vector[4].asDouble();

	return FValue(__dm->IsDisplayDead(x1, y1, x2, y2, t));
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
	long code = vector[0].asDouble();
	long time_out = vector[1].asDouble();
	return FValue(__dm->WaitKey(code, time_out));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();

	return FValue(__dm->FindMulColor(x1, y1, x2, y2, color.c_str(), sim));
}

FValue DmCenter::GetDict(FValueVector vector){
	long index = vector[0].asDouble();
	long font_index = vector[1].asDouble();
	return FValue(__dm->GetDict(index, font_index));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	long count = vector[6].asDouble();
	long width = vector[7].asDouble();
	long height = vector[8].asDouble();
	VARIANT x, y;
	int ret = __dm->FindColorBlock(x1, y1, x2, y2, color.c_str(), sim, count, width, height, & x, &y);
	FValueMap map;
	if (ret == 1)
	{
		map["x"] = ConvertToFValue(x);
		map["y"] = ConvertToFValue(y);
	}
	else
	{
		map["x"] = FValue(0);
		map["y"] = FValue(0);
	}

	return FValue(map);
}

FValue DmCenter::FindColorBlockEx(FValueVector vector){
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	long count = vector[6].asDouble();
	long width = vector[7].asDouble();
	long height = vector[8].asDouble();
	return FValue(__dm->FindColorBlockEx(x1, y1, x2, y2, color.c_str(), sim, count, width, height));
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
	long x1 = vector[0].asDouble();
	long y1 = vector[1].asDouble();
	long x2 = vector[2].asDouble();
	long y2 = vector[3].asDouble();
	string color = vector[4].asString();
	double sim = vector[5].asDouble();
	return FValue(__dm->OcrExOne(x1, y1, x2, y2, color.c_str(), sim));
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
	return FValue(__dm->MiddleDown());
}

FValue DmCenter::MiddleUp(FValueVector vector){
	return FValue(__dm->MiddleUp());
}

FValue DmCenter::FaqCaptureString(FValueVector vector){
	return FValue();
}

FValue DmCenter::VirtualProtectEx(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetMouseSpeed(FValueVector vector){
	long speed = vector[0].asDouble();
	return FValue(__dm-> SetMouseSpeed(speed));
}

FValue DmCenter::GetMouseSpeed(FValueVector vector){
	return FValue();
}

FValue DmCenter::EnableMouseAccuracy(FValueVector vector){
	return FValue();
}

FValue DmCenter::SetExcludeRegion(FValueVector vector){
	long mode = vector[0].asDouble();
	string info = vector[1].asString();

	return FValue(__dm->SetExcludeRegion(mode,info.c_str()));
}

FValue DmCenter::EnableShareDict(FValueVector vector){
	long enable = vector[0].asDouble();
	return FValue(__dm->EnableShareDict(enable));
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