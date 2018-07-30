 local CPLUS = require("CPLUS")
local DMCenter = {}

---------------------------键盘鼠标操作--------------------------------------------

DMCenter["KEY_CODE"] ={
    ["1"]=49,
    ["2"]=50,
    ["3"]=51,
    ["4"]=52,
    ["5"]=53,
    ["6"]=54,
    ["7"]=55,
    ["8"]=56,
    ["9"]=57,
    ["0"]=48,
    ["-"]=189,
    ["="]=187,
    ["back"]=8,

    ["a"]=65,
    ["b"]=66,
    ["c"]=67,
    ["d"]=68,
    ["e"]=69,
    ["f"]=70,
    ["g"]=71,
    ["h"]=72,
    ["i"]=73,
    ["j"]=74,
    ["k"]=75,
    ["l"]=76,
    ["m"]=77,
    ["n"]=78,
    ["o"]=79,
    ["p"]=80,
    ["q"]=81,
    ["r"]=82,
    ["s"]=83,
    ["t"]=84,
    ["u"]=85,
    ["v"]=86,
    ["w"]=87,
    ["x"]=88,
    ["y"]=89,
    ["z"]=90,

    ["ctrl"]=17,
    ["alt"]=18,
    ["shift"]=16,
    ["win"]=91,
    ["space"]=32,
    ["cap"]=20,
    ["tab"]=9,
    ["~"]=192,
    ["esc"]=27,
    ["enter"]=13,

    ["up"]=38,
    ["down"]=40,
    ["left"]=37,
    ["right"]=39,

    ["option"]=93,

    ["print"]=44,
    ["delete"]=46,
    ["home"]=36,
    ["end"]=35,
    ["pgup"]=33,
    ["pgdn"]=34,

    ["f1"]=112,
    ["f2"]=113,
    ["f3"]=114,
    ["f4"]=115,
    ["f5"]=116,
    ["f6"]=117,
    ["f7"]=118,
    ["f8"]=119,
    ["f9"]=120,
    ["f10"]=121,
    ["f11"]=122,
    ["f12"]=123,

    ["["]=219,
    ["]"]=221,
    ["\\"]=220,
    [";"]=186,
    ["'"]=222,
    ["]="]=188,
    ["."]=190,
    ["/"]=191,
}
--按住指定的虚拟键码
function DMCenter:KeyDownChar(key)
    return CPLUS.DmCenter.KeyDownChar(key) == 1
end
--按住指定的虚拟键码
function DMCenter:KeyDown(code)
    return CPLUS.DmCenter.KeyDown(code) == 1
end
--按下指定的虚拟键码
function DMCenter:KeyPress(code)
    return CPLUS.DmCenter.KeyPress(code) == 1
end
--按下指定的虚拟键码
function DMCenter:KeyPressChar(key)
    return CPLUS.DmCenter.KeyPressChar(key) == 1
end
--根据指定的字符串序列，依次按顺序按下其中的字符.
function DMCenter:KeyPressStr(content)
    return CPLUS.DmCenter.KeyPressStr(content) == 1
end

--弹起来虚拟键vk_code
function DMCenter:KeyUp(code)
    return CPLUS.DmCenter.KeyUp(code) == 1
end

--弹起来虚拟键key_str
function DMCenter:KeyUpChar(key)
    return CPLUS.DmCenter.KeyUpChar(key) == 1
end

--按下鼠标左键
function DMCenter:LeftClick()
    return CPLUS.DmCenter.LeftClick() == 1
end

--双击鼠标左键
function DMCenter:LeftDoubleClick()
    return CPLUS.DmCenter.LeftDoubleClick() == 1
end

--按住鼠标左键
function DMCenter:LeftDown()
    return CPLUS.DmCenter.LeftDown() == 1
end

--弹起鼠标左键
function DMCenter:LeftUp()
    return CPLUS.DmCenter.LeftUp() == 1
end

--按下鼠标中键
function DMCenter:MiddleClick()
    return CPLUS.DmCenter.MiddleClick() == 1
end

--按住鼠标中键
function DMCenter:MiddleDown()
    return CPLUS.DmCenter.MiddleDown() == 1
end

--弹起鼠标中键
function DMCenter:MiddleUp()
    return CPLUS.DmCenter.MiddleUp() == 1
end

--[[
    鼠标相对于上次的位置移动rx,ry.    
    从6.1548版本开始,如果您要使鼠标移动的距离和指定的rx,ry一致,
    最好配合SetMouseSpeed和EnableMouseAccuracy函数来使用.
    rx 整形数:相对于上次的X偏移
    ry 整形数:相对于上次的Y偏移
]]
function DMCenter:MoveR(rx,ry)
    return CPLUS.DmCenter.MoveR(rx,ry) == 1
end

--把鼠标移动到目的点(x,y)
--[[
    x 整形数:X坐标
    y 整形数:Y坐标
]]
function DMCenter:MoveTo(x,y)
    return CPLUS.DmCenter.MoveTo(x,y) == 1
end

--把鼠标移动到目的范围内的任意一点
--[[
x 整形数:X坐标
y 整形数:Y坐标
w 整形数:宽度(从x计算起)
h 整形数:高度(从y计算起)
返回值:
字符串:
返回要移动到的目标点. 格式为x,y.  比如MoveToEx 100,100,10,10,返回值可能是101,102
]]
function DMCenter:MoveToEx(x,y,w,h)
    return CPLUS.DmCenter.MoveToEx(x,y,w,h)
end

--按下鼠标右键
function DMCenter:RightClick()
    return CPLUS.DmCenter.RightClick() == 1
end

--按住鼠标右键
function DMCenter:RightDown()
    return CPLUS.DmCenter.RightDown() == 1
end

--弹起鼠标右键
function DMCenter:RightUp()
    return CPLUS.DmCenter.RightUp() == 1
end

--设置按键时,键盘按下和弹起的时间间隔。高级用户使用。某些窗口可能需要调整这个参数才可以正常按键。
--[[

type 字符串: 键盘类型,取值有以下

    "normal" : 对应normal键盘  默认内部延时为30ms

    "windows": 对应windows 键盘 默认内部延时为10ms

    "dx" :     对应dx 键盘 默认内部延时为50ms

delay 整形数: 延时,单位是毫秒
]]
function DMCenter:SetKeypadDelay(type,delay)
    return CPLUS.DmCenter.SetKeypadDelay(type,delay)) == 1
end

--[[
    设置鼠标单击或者双击时,鼠标按下和弹起的时间间隔。
    高级用户使用。某些窗口可能需要调整这个参数才可以正常点击
type 字符串: 鼠标类型,取值有以下

     "normal" : 对应normal鼠标 默认内部延时为 30ms

     "windows": 对应windows 鼠标 默认内部延时为 10ms

     "dx" :     对应dx鼠标 默认内部延时为40ms

delay 整形数: 延时,单位是毫秒

]]
function DMCenter:SetMouseDelay(type,delay)
    return CPLUS.DmCenter.SetMouseDelay(type,delay) == 1
end


--[[
    设置系统鼠标的移动速度.一共分为11个级别. 从1开始,11结束。此接口仅仅对MoveR接口起作用.
    speed 整形数:鼠标移动速度, 最小1，最大11.  居中为6. 推荐设置为6

]]
function DMCenter:SetMouseSpeed(speed)
    return CPLUS.DmCenter.SetMouseSpeed(speed) == 1
end

--[[
    设置前台键鼠的模拟方式. 
    驱动功能支持的系统版本号为
    (win7/win8/win8.1/win10(10240)/win10(10586)/win10(14393)/win10(15063)/win10(16299)/win10(17134)
    不支持所有的预览版本,仅仅支持正式版本.  除了模式3,其他模式同时支持32位系统和64位系统.
mode 整形数: 
    0 正常模式(默认模式)
    1 硬件模拟
    2 硬件模拟2(ps2)（仅仅支持标准的3键鼠标，即左键，右键，中键，带滚轮的鼠标,2键和5键等扩展鼠标不支持）
    3 硬件模拟3
返回值:
    整形数:
    0  : 插件没注册
    -1 : 32位系统不支持
    -2 : 驱动释放失败.
    -3 : 驱动加载失败.可能是权限不够. 参考UAC权限设置. 或者是被安全软件拦截. 
        如果是WIN10 1607之后的系统，出现这个错误，可参考这里
    -10: 设置失败
    -7 : 系统版本不支持. 可以用winver命令查看系统内部版本号. 驱动只支持正式发布的版本，所有预览版本都不支持.
    1  : 成功
示例:

dm.SetSimMode 1
…
dm_ret = dm.BindWindow(hwnd,"normal","normal","normal",0)
...
dm.UnBindWindow


除了模式0,其他方式需要加载驱动，所以调用进程必须有管理员权限,参考如何关闭UAC.
加载驱动时，必须让安全软件放行. 否则模拟无效.

硬件模拟1,没有对键鼠的接口类型有任何限制(PS/2 USB接口)都可以模拟，甚至不插任何键鼠设备都可以模拟.
硬件模拟2(ps2),模式下的键盘基本是正常的,但鼠标兼容性很差,建议只适用此模式的键盘. 鼠标可以使用别的模式. 键盘和鼠标不要求必须插入真实的ps2设备.
硬件模拟3, 设置以后，必须手动按下需要模拟的键盘和鼠标，否则会卡住.直到按下为止. 此后，再次设置不需要重新按下键盘鼠标，直到系统重启. 这个模拟要求被指定的键盘和鼠标不可以中途插拔，会造成模拟失效.  另外,用模拟3后，最好不要调用MoveTo或者MoveToE接口,改为用MoveR自己实现MoveTo或者MoveToEx,否则可能会造成鼠标移动到屏幕左上角的问题.

此接口仅对本对象生效,实际上所有的接口都仅仅对本对象生效,除了DmGuard是全局的.

]]
local ENUMRET = {
    [0] = "插件没有注册",
    [-1] = "32位系统不支持",
    [-2] = "驱动释放失败",
    [-3] = "驱动加载失败.可能是权限不够. 参考UAC权限设置. 或者是被安全软件拦截.",
    [-10] = "设置失败",
    [-7] = "系统版本不支持. 可以用winver命令查看系统内部版本号. 驱动只支持正式发布的版本，所有预览版本都不支持."
}
function DMCenter:SetSimMode(mode)
    local ret = CPLUS.DmCenter.SetSimMode(mode)
    if ret == 1 then
        return true
    else
        print(ENUMRET[ret])
        return false
    end
end


--等待指定的按键按下 (前台,不是后台)
--[[
    vk_code 整形数:虚拟按键码,当此值为0，表示等待任意按键。 鼠标左键是1,鼠标右键时2,鼠标中键是4.
    time_out 整形数:等待多久,单位毫秒. 如果是0，表示一直等待
返回值:
整形数:
0:超时
1:指定的按键按下 (当vk_code不为0时)
按下的按键码:(当vk_code为0时)

]]
function DMCenter:WaitKey(code,time_out)
    return CPLUS.DmCenter.WaitKey(code,time_out)
end


--滚轮向下滚
function DMCenter:WheelDown()
    return CPLUS.DmCenter.WheelDown() == 1
end

--滚轮向上滚
function DMCenter:WheelUp()
    return CPLUS.DmCenter.WheelUp() == 1
end



----------------------------------图色操作--------------------------------------
--对指定的数据地址和长度，组合成新的参数. 
--FindPicMem FindPicMemE 以及FindPicMemEx专用
--[[
参数定义:
pic_info 字符串: 老的地址描述串
addr 整形数: 数据地址
size 整形数: 数据长度

返回值:
字符串:
新的地址描述串
示例:
pic_info = ""
pic_info = dm.AppendPicAddr(pic_info,12034,643)
pic_info = dm.AppendPicAddr(pic_info,328435,8935)
pic_info = dm.AppendPicAddr(pic_info,809234,789) 
]]
function DMCenter:AppendPicAddr(pic_info,addr,size)
    return CPLUS.DmCenter.AppendPicAddr(pic_info,addr,size)
end

--把BGR(按键格式)的颜色格式转换为RGB
--[[
参数定义:
bgr_color 字符串:bgr格式的颜色字符串
返回值:
字符串:
RGB格式的字符串

]]
function DMCenter:BGR2RGB(bgr_color)
    return CPLUS.DmCenter.BGR2RGB(bgr_color)
end


--抓取指定区域(x1, y1, x2, y2)的图像,保存为file(24位位图)
--[[
参数定义:
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
file 字符串:保存的文件名,保存的地方一般为SetPath中设置的目录
     当然这里也可以指定全路径名.
]]
function DMCenter:Capture(x1, y1, x2, y2, file)
    return CPLUS.DmCenter.Capture(x1, y1, x2, y2, file) == 1
end


--抓取指定区域(x1, y1, x2, y2)的动画，保存为gif格式
--[[
参数定义:

x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
file 字符串:保存的文件名,保存的地方一般为SetPath中设置的目录
     当然这里也可以指定全路径名.
delay 整形数: 动画间隔，单位毫秒。如果为0，表示只截取静态图片
time 整形数: 总共截取多久的动画，单位毫秒。

]]
function DMCenter:CaptureGif(x1, y1, x2, y2, file,delay,time)
    return CPLUS.DmCenter.CaptureGif(x1, y1, x2, y2, file,delay,time) == 1
end


--抓取指定区域(x1, y1, x2, y2)的图像,保存为file(JPG压缩格式)
--[[

x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
file 字符串:保存的文件名,保存的地方一般为SetPath中设置的目录

     当然这里也可以指定全路径名.
quality 整形数: jpg压缩比率(1-100) 越大图片质量越好
  
]]
function DMCenter:CaptureJpg(x1, y1, x2, y2, file, quality)
    return CPLUS.DmCenter.CaptureJpg(x1, y1, x2, y2, file, quality) == 1
end


--同Capture函数，只是保存的格式为PNG.
--[[
参数定义:

x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
file 字符串:保存的文件名,保存的地方一般为SetPath中设置的目录
     当然这里也可以指定全路径名.
]]
function DMCenter:CapturePng(x1,y1,x2,y2,file)
    return CPLUS.DmCenter.CapturePng(x1,y1,x2,y2,file) == 1
end


--抓取上次操作的图色区域，保存为file(24位位图)
--[[
file 字符串:保存的文件名,保存的地方一般为SetPath中设置的目录
     当然这里也可以指定全路径名.
]]
function DMCenter:CapturePre(file)
    return CPLUS.DmCenter.CapturePre(file) == 1
end


--比较指定坐标点(x,y)的颜色
--[[
参数定义:
x 整形数: X坐标
y 整形数: Y坐标
color 字符串: 颜色字符串,可以支持偏色,多色,例如 "ffffff-202020|000000-000000" 这个表示白色偏色为202020,
和黑色偏色为000000.颜色最多支持10种颜色组合. 注意，这里只支持RGB颜色.
sim 双精度浮点数: 相似度(0.1-1.0)
返回值:
整形数:
0: 颜色匹配
1: 颜色不匹配
]]
function DMCenter:CmpColor(x,y,color,sim)
    return CPLUS.DmCenter.CmpColor(x,y,color,sim) == 1
end


--开启图色调试模式，此模式会稍许降低图色和文字识别的速度.默认不开启.
--[[
enable_debug 整形数: 0 为关闭 1 为开启
]]
function DMCenter:EnableDisplayDebug(enable_debug)
    return CPLUS.DmCenter.EnableDisplayDebug(enable_debug) == 1
end


--允许调用GetColor GetColorBGR GetColorHSV 以及 CmpColor时，以截图的方式来获取颜色
--[[
enable 整形数: 0 关闭 1 打开
]]
function DMCenter:EnableGetColorByCapture(enable)
    return CPLUS.DmCenter.EnableGetColorByCapture(enable) == 1
end


--查找指定区域内的颜色,颜色格式"RRGGBB-DRDGDB",注意,和按键的颜色格式相反
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color 字符串:颜色 格式为"RRGGBB-DRDGDB",比如"123456-000000|aabbcc-202020".注意，这里只支持RGB颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 
             1: 从左到右,从下到上 
             2: 从右到左,从上到下 
             3: 从右到左,从下到上 
             4：从中心往外查找
             5: 从上到下,从左到右 
             6: 从上到下,从右到左
             7: 从下到上,从左到右
             8: 从下到上,从右到左
返回table{x=0,y=0} //如果没有找到则 x=0,y=0
x 变参指针:返回X坐标
y 变参指针:返回Y坐标  
]]
function DMCenter:FindColor(x1, y1, x2, y2, color, sim, dir)
    return CPLUS.DmCenter.FindColor(x1, y1, x2, y2, color, sim, dir)
end


--查找指定区域内的颜色块,颜色格式"RRGGBB-DRDGDB",注意,和按键的颜色格式相反
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color 字符串:颜色 格式为"RRGGBB-DRDGDB",比如"123456-000000|aabbcc-202020".注意，这里只支持RGB颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0
count整形数:在宽度为width,高度为height的颜色块中，符合color颜色的最小数量.(注意,这个颜色数量可以在综合工具的二值化区域中看到)
width 整形数:颜色块的宽度
height 整形数:颜色块的高度

返回table{x=0,y=0} //如果没有找到则 x=0,y=0
x 变参指针:返回X坐标
y 变参指针:返回Y坐标 
]]
function DMCenter:FindColorBlock(x1, y1, x2, y2, color, sim, count,width,height)
    return CPLUS.DmCenter.FindColorBlock(x1, y1, x2, y2, color, sim, count,width,height)
end


--查找指定区域内的所有颜色块,颜色格式"RRGGBB-DRDGDB",注意,和按键的颜色格式相反
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color 字符串:颜色 格式为"RRGGBB-DRDGDB" 比如"aabbcc-000000|123456-202020".注意，这里只支持RGB颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0
count整形数:在宽度为width,高度为height的颜色块中，符合color颜色的最小数量.(注意,这个颜色数量可以在综合工具的二值化区域中看到)
width 整形数:颜色块的宽度
height 整形数:颜色块的高度
返回值: 
字符串:
返回所有颜色块信息的坐标值,然后通过GetResultCount等接口来解析 (由于内存限制,返回的颜色数量最多为1800个左右)
示例:


s = dm.FindColorBlockEx(0,0,2000,2000,"123456-000000|abcdef-202020",1.0,350,100,200)
count = dm.GetResultCount(s)
index = 0
Do While index < count
    dm_ret = dm.GetResultPos(s,index,intX,intY)
    MessageBox intX&","&intY 
    index = index + 1 
Loop 
  
]]
function DMCenter:FindColorBlockEx(x1, y1, x2, y2, color, sim, count, width, height)
    return CPLUS.DmCenter.FindColorBlockEx(x1, y1, x2, y2, color, sim, count, width, height)
end


--查找指定区域内的颜色,颜色格式"RRGGBB-DRDGDB",注意,和按键的颜色格式相反
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color 字符串:颜色 格式为"RRGGBB-DRDGDB",比如"123456-000000|aabbcc-202020".注意，这里只支持RGB颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 
             1: 从左到右,从下到上 
             2: 从右到左,从上到下 
             3: 从右到左,从下到上 
             4：从中心往外查找
             5: 从上到下,从左到右 
             6: 从上到下,从右到左
             7: 从下到上,从左到右
             8: 从下到上,从右到左
返回值: 
字符串:
返回X和Y坐标 形式如"x|y", 比如"100|200"
示例:
pos = dm.FindColorE(0,0,2000,2000,"123456-000000|aabbcc-030303|ddeeff-202020",1.0,0)
pos = split(pos,"|")
If int(pos(0)) > 0 Then
    MessageBox "找到"
End If

]]
function DMCenter:FindColorE(x1, y1, x2, y2, color, sim, dir)
    return CPLUS.DmCenter.FindColorE(x1, y1, x2, y2, color, sim, dir)
end


--查找指定区域内的所有颜色,颜色格式"RRGGBB-DRDGDB",注意,和按键的颜色格式相反
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color 字符串:颜色 格式为"RRGGBB-DRDGDB" 比如"aabbcc-000000|123456-202020".注意，这里只支持RGB颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 
             1: 从左到右,从下到上 
             2: 从右到左,从上到下 
             3: 从右到左,从下到上 
             5: 从上到下,从左到右 
             6: 从上到下,从右到左
             7: 从下到上,从左到右
             8: 从下到上,从右到左



返回值: 

字符串:
返回所有颜色信息的坐标值,然后通过GetResultCount等接口来解析 (由于内存限制,返回的颜色数量最多为1800个左右)

示例:


s = dm.FindColorEx(0,0,2000,2000,"123456-000000|abcdef-202020",1.0,0)
count = dm.GetResultCount(s)
index = 0
Do While index < count
    dm_ret = dm.GetResultPos(s,index,intX,intY)
    MessageBox intX&","&intY 
    index = index + 1 
Loop
]]
function DMCenter:FindColorEx(x1, y1, x2, y2, color, sim, dir)
    return CPLUS.DmCenter.FindColorEx(x1, y1, x2, y2, color, sim, dir)
end


--查找指定区域内的所有颜色. 
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color 字符串:颜色 格式为"RRGGBB-DRDGDB",比如"123456-000000|aabbcc-202020".注意，这里只支持RGB颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0
返回值: 
整形数:
0:没找到或者部分颜色没找到
1:所有颜色都找到

示例:
dm_ret = dm.FindMulColor(0,0,2000,2000,"123456-000000|aabbcc-030303|ddeeff-202020",1.0)
if dm_ret = 1 then
     MessageBox "找到了"
end if
]]
function DMCenter:FindMulColor(x1, y1, x2, y2, color, sim)
    return CPLUS.DmCenter.FindMulColor(x1, y1, x2, y2, color, sim) == 1
end

--根据指定的多点查找颜色坐标
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
first_color 字符串:颜色格式为"RRGGBB-DRDGDB|RRGGBB-DRDGDB|…………",比如"123456-000000"
这里的含义和按键自带Color插件的意义相同，只不过我的可以支持偏色和多种颜色组合
所有的偏移色坐标都相对于此颜色.注意，这里只支持RGB颜色.
offset_color 字符串: 偏移颜色可以支持任意多个点 格式和按键自带的Color插件意义相同, 只不过我的可以支持偏色和多种颜色组合
 格式为"x1|y1|RRGGBB-DRDGDB|RRGGBB-DRDGDB……,……xn|yn|RRGGBB-DRDGDB|RRGGBB-DRDGDB……"
比如"1|3|aabbcc|aaffaa-101010,-5|-3|123456-000000|454545-303030|565656"等任意组合都可以，支持偏色
还可以支持反色模式，比如"1|3|-aabbcc|-334455-101010,-5|-3|-123456-000000|-353535|454545-101010","-"表示除了指定颜色之外的颜色.

sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值 table{x=0,y=0}
x 变参指针:返回X坐标(坐标为first_color所在坐标)
y 变参指针:返回Y坐标(坐标为first_color所在坐标)
]]
function DMCenter:FindMultiColor(x1, y1, x2, y2,first_color,offset_color,sim, dir)
    return CPLUS.DmCenter.FindMultiColor(x1, y1, x2, y2,first_color,offset_color,sim, dir)
end


--[[
    根据指定的多点查找颜色坐标
    易语言用不了FindMultiColor可以用此接口来代替
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
first_color 字符串:颜色 格式为"RRGGBB-DRDGDB|RRGGBB-DRDGDB|…………",比如"123456-000000"
这里的含义和按键自带Color插件的意义相同，只不过我的可以支持偏色和多种颜色组合
所有的偏移色坐标都相对于此颜色.注意，这里只支持RGB颜色.
offset_color 字符串: 偏移颜色 可以支持任意多个点 格式和按键自带的Color插件意义相同, 只不过我的可以支持偏色和多种颜色组合
 格式为"x1|y1|RRGGBB-DRDGDB|RRGGBB-DRDGDB……,……xn|yn|RRGGBB-DRDGDB|RRGGBB-DRDGDB……"
比如"1|3|aabbcc|aaffaa-101010,-5|-3|123456-000000|454545-303030|565656"等任意组合都可以，支持偏色
还可以支持反色模式，比如"1|3|-aabbcc|-334455-101010,-5|-3|-123456-000000|-353535|454545-101010","-"表示除了指定颜色之外的颜色.

sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值: 
字符串:
返回X和Y坐标 形式如"x|y", 比如"100|200"

]]
function DMCenter:FindMultiColorE(x1, y1, x2, y2,first_color,offset_color,sim, dir)
    return CPLUS.DmCenter.FindMultiColorE(x1, y1, x2, y2,first_color,offset_color,sim, dir)
end


--根据指定的多点查找所有颜色坐标
--[[
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
first_color 字符串:颜色 格式为"RRGGBB-DRDGDB|RRGGBB-DRDGDB|…………",比如"123456-000000"
这里的含义和按键自带Color插件的意义相同，只不过我的可以支持偏色和多种颜色组合
所有的偏移色坐标都相对于此颜色.注意，这里只支持RGB颜色.
offset_color 字符串: 偏移颜色 可以支持任意多个点 格式和按键自带的Color插件意义相同, 只不过我的可以支持偏色和多种颜色组合
 格式为"x1|y1|RRGGBB-DRDGDB|RRGGBB-DRDGDB……,……xn|yn|RRGGBB-DRDGDB|RRGGBB-DRDGDB……"
比如"1|3|aabbcc|aaffaa-101010,-5|-3|123456-000000|454545-303030|565656"等任意组合都可以，支持偏色
还可以支持反色模式，比如"1|3|-aabbcc|-334455-101010,-5|-3|-123456-000000|-353535|454545-101010","-"表示除了指定颜色之外的颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值: 
字符串:
返回所有颜色信息的坐标值,然后通过GetResultCount等接口来解析(由于内存限制,返回的坐标数量最多为1800个左右)
坐标是first_color所在的坐标

示例:
dm_ret = dm.FindMultiColorEx(0,0,2000,2000, "cc805b-020202|606060-010101","9|2|-00ff00|-ff0000,15|2|2dff1c-010101,6|11|a0d962|aabbcc,11|14|-ffffff",1.0,1)
count = dm.GetResultCount(dm_ret)
index = 0
Do While index < count 
   aa = dm.GetResultPos(dm_ret,index,intX,intY)
   dm.MoveTo intX,intY
   index = index + 1
   Delay  1000
Loop

]]
function DMCenter:FindMultiColorEx(x1, y1, x2, y2,first_color,offset_color,sim, dir)
    return CPLUS.DmCenter.FindMultiColorEx(x1, y1, x2, y2,first_color,offset_color,sim, dir)
end



--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,只返回第一个找到的X Y坐标.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_name 字符串:图片名,可以是多个图片,比如"test.bmp|test2.bmp|test3.bmp"
delta_color 字符串:颜色色偏比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值table{x=0,y=0}
intX 变参指针:返回图片左上角的X坐标
intY 变参指针:返回图片左上角的Y坐标

示例:
dm_ret = dm.FindPic(0,0,2000,2000,"1.bmp|2.bmp|3.bmp","000000",0.9,0,intX,intY)
If intX >= 0 and intY >= 0 Then
    MessageBox "找到"
End If
]]
function DMCenter:FindPic(x1, y1, x2, y2, pic_name, delta_color,sim, dir,intX, intY)
    return CPLUS.DmCenter.FindPic(x1, y1, x2, y2, pic_name, delta_color,sim, dir,intX, intY)
end


--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,只返回第一个找到的X Y坐标.
易语言用不了FindPic可以用此接口来代替
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_name 字符串:图片名,可以是多个图片,比如"test.bmp|test2.bmp|test3.bmp"
delta_color 字符串:颜色色偏比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上

返回值:
字符串:
返回找到的图片序号(从0开始索引)以及X和Y坐标 形式如"index|x|y", 比如"3|100|200"

示例:
pos = dm.FindPicE(0,0,2000,2000,"1.bmp|2.bmp|3.bmp","000000",0.9,0)
pos = split(pos,"|")
If int(pos(1)) > 0 Then
    MessageBox "找到"
End If

]]
function DMCenter:FindPicE(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
    return CPLUS.DmCenter.FindPicE(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
end


--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,并且返回所有找到的图像的坐标.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_name 字符串:图片名,可以是多个图片,比如"test.bmp|test2.bmp|test3.bmp"
delta_color 字符串:颜色色偏比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上

返回值:
字符串:
返回的是所有找到的坐标格式如下:"id,x,y|id,x,y..|id,x,y" (图片左上角的坐标)
比如"0,100,20|2,30,40" 表示找到了两个,第一个,对应的图片是图像序号为0的图片,坐标是(100,20),第二个是序号为2的图片,坐标(30,40)
(由于内存限制,返回的图片数量最多为1500个左右)

示例:
dm_ret = dm.FindPicEx(0,0,2000,2000,"test.bmp|test2.bmp|test3.bmp|test4.bmp|test5.bmp","020202",1.0,0)
If len(dm_ret) > 0 Then
   ss = split(dm_ret,"|")
   index = 0
   count = UBound(ss) + 1
   Do While index < count
      TracePrint ss(index)
      sss = split(ss(index),",")
      id = int(sss(0))
      x = int(sss(1))
      y = int(sss(2))
      dm.MoveTo x,y
      Delay 1000
      index = index+1
   Loop
End If
]]
function DMCenter:FindPicEx(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
    return CPLUS.DmCenter.FindPicEx(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
end



--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,并且返回所有找到的图像的坐标. 此函数同FindPicEx.只是返回值不同.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_name 字符串:图片名,可以是多个图片,比如"test.bmp|test2.bmp|test3.bmp"
delta_color 字符串:颜色色偏 比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值:
字符串:
返回的是所有找到的坐标格式如下:"file,x,y| file,x,y..| file,x,y" (图片左上角的坐标)
比如"1.bmp,100,20|2.bmp,30,40" 表示找到了两个,第一个,对应的图片是1.bmp,坐标是(100,20),第二个是2.bmp,坐标(30,40)
(由于内存限制,返回的图片数量最多为1500个左右)
示例:
dm_ret = dm.FindPicExS(0,0,2000,2000,"test.bmp|test2.bmp|test3.bmp|test4.bmp|test5.bmp","020202",1.0,0)
If len(dm_ret) > 0 Then
   ss = split(dm_ret,"|")
   index = 0
   count = UBound(ss) + 1
   Do While index < count
      TracePrint ss(index)
      sss = split(ss(index),",")
      f = sss(0)
      x = int(sss(1))
      y = int(sss(2))
      dm.MoveTo x,y
      Delay 1000
      index = index+1
   Loop
End If

]]
function DMCenter:FindPicExS(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
    return CPLUS.DmCenter.FindPicExS(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
end


--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,只返回第一个找到的X Y坐标. 这个函数要求图片是数据地址
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_info 字符串: 图片数据地址集合. 格式为"地址1,长度1|地址2,长度2.....|地址n,长度n". 可以用AppendPicAddr来组合. 
          地址表示24位位图资源在内存中的首地址，用十进制的数值表示
          长度表示位图资源在内存中的长度，用十进制数值表示.
delta_color 字符串:颜色色偏比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值 table{x=0,y=0}
intX 变参指针:返回图片左上角的X坐标
intY 变参指针:返回图片左上角的Y坐标
 

示例:

pic_info = ""
pic_info = dm.AppendPicAddr(pic_info,12034,643)
pic_info = dm.AppendPicAddr(pic_info,328435,8935)
pic_info = dm.AppendPicAddr(pic_info,809234,789)
dm_ret = dm.FindPicMem(0,0,2000,2000, pic_info,"000000",0.9,0,intX,intY)
If intX >= 0 and intY >= 0 Then
    MessageBox "找到"
End If

注 : 内存中的图片格式必须是24位色，并且不能加密.

]]
function DMCenter:FindPicMem(x1, y1, x2, y2, pic_info, delta_color,sim, dir,intX, intY)
    return CPLUS.DmCenter.FindPicMem(x1, y1, x2, y2, pic_info, delta_color,sim, dir,intX, intY)
end


--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,只返回第一个找到的X Y坐标. 这个函数要求图片是数据地址.
易语言用不了FindPicMem可以用此接口来代替
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_info 字符串: 图片数据地址集合. 格式为"地址1,长度1|地址2,长度2.....|地址n,长度n". 可以用AppendPicAddr来组合. 
          地址表示24位位图资源在内存中的首地址，用十进制的数值表示
          长度表示位图资源在内存中的长度，用十进制数值表示.
delta_color 字符串:颜色色偏比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上

返回值:
字符串:
返回找到的图片序号(从0开始索引)以及X和Y坐标 形式如"index|x|y", 比如"3|100|200"
示例:
pic_info = ""
pic_info = dm.AppendPicAddr(pic_info,12034,643)
pic_info = dm.AppendPicAddr(pic_info,328435,8935)
pic_info = dm.AppendPicAddr(pic_info,809234,789)
pos = dm.FindPicMemE(0,0,2000,2000, pic_info,"000000",0.9,0)
pos = split(pos,"|")
If int(pos(1)) > 0 Then
    MessageBox "找到"
End If
注 : 内存中的图片格式必须是24位色，并且不能加密.
]]
function DMCenter:FindPicMemE(x1, y1, x2, y2, pic_info, delta_color,sim, dir)
    return CPLUS.DmCenter.FindPicMemE(x1, y1, x2, y2, pic_info, delta_color,sim, dir)
end



--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,并且返回所有找到的图像的坐标. 这个函数要求图片是数据地址.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_info 字符串: 图片数据地址集合. 格式为"地址1,长度1|地址2,长度2.....|地址n,长度n". 可以用AppendPicAddr来组合. 
          地址表示24位位图资源在内存中的首地址，用十进制的数值表示
          长度表示位图资源在内存中的长度，用十进制数值表示.
delta_color 字符串:颜色色偏比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上

返回值:
字符串:
返回的是所有找到的坐标格式如下:"id,x,y|id,x,y..|id,x,y" (图片左上角的坐标)
比如"0,100,20|2,30,40" 表示找到了两个,第一个,对应的图片是图像序号为0的图片,坐标是(100,20),第二个是序号为2的图片,坐标(30,40)
(由于内存限制,返回的图片数量最多为1500个左右)
示例:
pic_info = ""
pic_info = dm.AppendPicAddr(pic_info,12034,643)
pic_info = dm.AppendPicAddr(pic_info,328435,8935)
pic_info = dm.AppendPicAddr(pic_info,809234,789)
dm_ret = dm.FindPicMemEx(0,0,2000,2000, pic_info,"020202",1.0,0)
If len(dm_ret) > 0 Then
   ss = split(dm_ret,"|")
   index = 0
   count = UBound(ss) + 1
   Do While index < count
      TracePrint ss(index)
      sss = split(ss(index),",")
      id = int(sss(0))
      x = int(sss(1))
      y = int(sss(2))
      dm.MoveTo x,y
      Delay 1000
      index = index+1
   Loop
End If

注 : 内存中的图片格式必须是24位色，并且不能加密.
]]
function DMCenter:FindPicMemEx(x1, y1, x2, y2, pic_info, delta_color,sim, dir)
    return CPLUS.DmCenter.FindPicMemEx(x1, y1, x2, y2, pic_info, delta_color,sim, dir)
end



--[[
查找指定区域内的图片,位图必须是24位色格式,支持透明色,当图像上下左右4个顶点的颜色一样时,则这个颜色将作为透明色处理.
这个函数可以查找多个图片,只返回第一个找到的X Y坐标. 此函数同FindPic.只是返回值不同.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_name 字符串:图片名,可以是多个图片,比如"test.bmp|test2.bmp|test3.bmp"
delta_color 字符串:颜色色偏比如"203040" 表示RGB的色偏分别是20 30 40 (这里是16进制表示)
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上

返回值 table{x=0,y=0,pic=""}
返回值:
intX 变参指针:返回图片左上角的X坐标
intY 变参指针:返回图片左上角的Y坐标
字符串:
返回找到的图片的文件名. 没找到返回长度为0的字符串.

示例:
dm_ret = dm.FindPicS(0,0,2000,2000,"1.bmp|2.bmp|3.bmp","000000",0.9,0,intX,intY)
If intX >= 0 and intY >= 0 Then
    MessageBox "找到"&dm_ret
End If
]]
function DMCenter:FindPicS(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
    return CPLUS.DmCenter.FindPicS(x1, y1, x2, y2, pic_name, delta_color,sim, dir)
end



--[[
查找指定的形状. 形状的描述同按键的抓抓. 具体可以参考按键的抓抓. 
和按键的语法不同，需要用大漠综合工具的颜色转换.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
offset_color 字符串: 坐标偏移描述 可以支持任意多个点 格式和按键自带的Color插件意义相同

 格式为"x1|y1|e1,……xn|yn|en"

比如"1|3|1,-5|-3|0"等任意组合都可以
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上

返回值 table {x=0,y=0}
intX 变参指针:返回X坐标(坐标为形状(0,0)所在坐标)
intY 变参指针:返回Y坐标(坐标为形状(0,0)所在坐标)

示例:
dm_ret = dm.FindShape(0,0,2000,2000, "1|1|0,1|6|1,0|10|1,9|10|1,7|6|1,7|8|0,8|9|0,2|2|1,3|1|1",1.0,0,x,y)
dm.MoveTo x,y
]]
function DMCenter:FindShape(x1, y1, x2, y2, offset_color,sim, dir)
    return CPLUS.DmCenter.FindShape(x1, y1, x2, y2, offset_color,sim, dir)
end



--[[
查找指定的形状. 形状的描述同按键的抓抓. 具体可以参考按键的抓抓. 
和按键的语法不同，需要用大漠综合工具的颜色转换. 
易语言用不了FindShape可以用此接口来代替
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
offset_color 字符串: 坐标偏移描述 可以支持任意多个点 格式和按键自带的Color插件意义相同
 格式为"x1|y1|e1,……xn|yn|en"
比如"1|3|1,-5|-3|0"等任意组合都可以
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值: 
字符串:
返回X和Y坐标 形式如"x|y", 比如"100|200"
示例:
pos = dm.FindShapeE(0,0,2000,2000,"1|1|0,1|6|1,0|10|1,9|10|1,7|6|1,7|8|0,8|9|0,2|2|1,3|1|1",1.0,0)
pos = split(pos,"|")
dm.MoveTo int(pos(0)),int(pos(1))
]]
function DMCenter:FindShapeE(x1, y1, x2, y2, offset_color,sim, dir)
    return CPLUS.DmCenter.FindShapeE(x1, y1, x2, y2, offset_color,sim, dir)
end




--[[
查找所有指定的形状的坐标. 形状的描述同按键的抓抓. 具体可以参考按键的抓抓. 
和按键的语法不同，需要用大漠综合工具的颜色转换.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
offset_color 字符串: 坐标偏移描述可以支持任意多个点 格式和按键自带的Color插件意义相同

 格式为"x1|y1|e1,……xn|yn|en"

比如"1|3|1,-5|-3|0"等任意组合都可以
sim 双精度浮点数:相似度,取值范围0.1-1.0
dir 整形数:查找方向 0: 从左到右,从上到下 1: 从左到右,从下到上 2: 从右到左,从上到下 3: 从右到左, 从下到上
返回值: 
字符串:
返回所有形状的坐标值,然后通过GetResultCount等接口来解析(由于内存限制,返回的坐标数量最多为1800个左右)
示例:
dm_ret = dm.FindShapeEx(0,0,2000,2000,"1|1|0,1|6|1,0|10|1,9|10|1,7|6|1,7|8|0,8|9|0,2|2|1,3|1|1",1.0,1)
count = dm.GetResultCount(dm_ret)
index = 0
Do While index < count 
   aa = dm.GetResultPos(dm_ret,index,intX,intY)
   dm.MoveTo intX,intY
   index = index + 1
   Delay  1000
Loop
]]
function DMCenter:FindShapeEx(x1, y1, x2, y2,offset_color,sim, dir)
    return CPLUS.DmCenter.FindShapeEx(x1, y1, x2, y2,offset_color,sim, dir)
end



--[[
释放指定的图片,此函数不必要调用,除非你想节省内存.
pic_name 字符串: 
文件名比如
    "1.bmp|2.bmp|3.bmp" 等,可以使用通配符,比如
    "*.bmp" 这个对应了所有的bmp文件
    "a?c*.bmp" 这个代表了所有第一个字母是a 第三个字母是c 第二个字母任意的所有bmp文件
    "abc???.bmp|1.bmp|aa??.bmp" 可以这样任意组合.
]]
function DMCenter:FreePic(pic_name)
    return CPLUS.DmCenter.FreePic(pic_name) == 1
end


--获取范围(x1,y1,x2,y2)颜色的均值,返回格式"H.S.V"
--[[
x1 整形数: 左上角X
y1 整形数: 左上角Y
x2 整形数: 右下角X
y2 整形数: 右下角Y

返回值:
字符串:
颜色字符串
]]
function DMCenter:GetAveHSV(x1,y1,x2,y2)
    return CPLUS.DmCenter.GetAveHSV(x1,y1,x2,y2)
end


--[[
获取范围(x1,y1,x2,y2)颜色的均值,返回格式"RRGGBB"
x1 整形数: 左上角X
y1 整形数: 左上角Y
x2 整形数: 右下角X
y2 整形数: 右下角Y

返回:
字符串:
颜色字符串
]]
function DMCenter:GetAveRGB(x1,y1,x2,y2)
    return CPLUS.DmCenter.GetAveRGB(x1,y1,x2,y2)
end



--[[
获取(x,y)的颜色,颜色返回格式"RRGGBB",注意,和按键的颜色格式相反
x 整形数:X坐标
y 整形数:Y坐标
返回值:
字符串:
颜色字符串(注意这里都是小写字符，和工具相匹配)
color = dm.GetColor(30,30)
If color = "ffffff" Then
     MessageBox "是白色"
End If
]]
function DMCenter:GetColor(x,y)
    return CPLUS.DmCenter.GetColor(x,y)
end



--[[
    获取(x,y)的颜色,颜色返回格式"BBGGRR"
    x 整形数:X坐标
    y 整形数:Y坐标
    返回值:

    字符串:
    颜色字符串(注意这里都是小写字符，和工具相匹配)
    color = dm.GetColorBGR(30,30)
    If color = "0000ff" Then
        MessageBox "是红色"
    End If

]]
function DMCenter:GetColorBGR(x,y)
    return CPLUS.DmCenter.GetColorBGR(x,y)
end



--[[
获取(x,y)的HSV颜色,颜色返回格式"H.S.V"
x 整形数:X坐标
y 整形数:Y坐标

返回值:
字符串:
颜色字符串

color = dm.GetColorHSV(30,30)
If color = "100.20.20" Then
      MessageBox "ok"
End If
]]
function DMCenter:GetColorHSV(x,y)
    return CPLUS.DmCenter.GetColorHSV(x,y)
end



--[[
获取指定区域的颜色数量,颜色格式"RRGGBB-DRDGDB",注意,和按键的颜色格式相反
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color 字符串:颜色 格式为"RRGGBB-DRDGDB",比如"123456-000000|aabbcc-202020".注意，这里只支持RGB颜色.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值: 
整形数:
颜色数量
示例:
TracePrint dm.GetColorNum(0,0,2000,2000,"123456-000000|aabbcc-030303|ddeeff-202020",1.0)
]]
function DMCenter:GetColorNum(x1, y1, x2, y2, color, sim)
    return CPLUS.DmCenter.GetColorNum(x1, y1, x2, y2, color, sim)
end





--[[
获取指定图片的尺寸，如果指定的图片已经被加入缓存，则从缓存中获取信息.
此接口也会把此图片加入缓存. （当图色缓存机制打开时,具体参考EnablePicCache）
参数定义:
pic_name 字符串: 文件名 比如"1.bmp"

返回值:
字符串:
形式如 "w,h" 比如"30,20"

PutAttachment "c:\test","*.bmp"
dm_ret = dm.SetPath("c:\test")

pic_size = dm.GetPicSize("1.bmp")
pic_size = split(pic_size,",")
w = int(pic_size(0))
h = int(pic_size(1))
Trace "宽度:"&w
Trace "高度:"&h
]]
function DMCenter:GetPicSize(pic_name)
    return CPLUS.DmCenter.GetPicSize(pic_name)
end




--[[
获取指定区域的图像,用二进制数据的方式返回,（不适合按键使用）方便二次开发.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标

返回值:
整形数:
返回的是指定区域的二进制颜色数据地址,每个颜色是4个字节,表示方式为(00RRGGBB)

注意,调用完此接口后，返回的数据指针在当前dm对象销毁时，或者再次调用GetScreenData时，会自动释放.
从2.1120版本之后，调用完此函数后，没必要再调用FreeScreenData了,插件会自动释放.

]]
function DMCenter:GetScreenData(x1,y1,x2,y2)
    assert(false,"涉及到二进制的返回,暂无实现")
end



--[[
获取指定区域的图像,用24位位图的数据格式返回,方便二次开发.（或者可以配合SetDisplayInput的mem模式）
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
data 变参指针:返回图片的数据指针
size 变参指针:返回图片的数据长度

示例:
以下是在E语言中的示例.
.局部变量 data, 整数型
.局部变量 size, 整数型
dm.数值方法 (“GetScreenDataBmp”, 0, 0, 100, 200, data, size)
图片框1.图片 ＝ 指针到字节集 (data, size)
需要注意的是,调用此接口获取的数据指针保存在当前对象中,到下次调用此接口时,内部就会释放.
哪怕是转成字节集,这个地址也还是在此字节集中使用. 如果您要此地址一直有效，那么您需要自己拷贝字节集到自己的字节集中.

]]
function DMCenter:GetScreenDataBmp(x1,y1,x2,y2,data,size)
    assert(false,"涉及到字节流,暂无实现")
end



--[[
转换图片格式为24位BMP格式.
pic_name 字符串: 要转换的图片名
bmp_name 字符串: 要保存的BMP图片名 

示例:
dm.ImageToBmp "1.png","1.bmp"
dm.ImageToBmp "2.jpg","2.bmp"
dm.ImageToBmp "3.gif","3.bmp"
]]
function DMCenter:ImageToBmp(pic_name,bmp_name)
    return CPLUS.DmCenter.ImageToBmp(pic_name,bmp_name) == 1
end



--[[
判断指定的区域，在指定的时间内(秒),图像数据是否一直不变.(卡屏).
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
t  整形数:需要等待的时间,单位是秒 

返回值:
整形数:
0 : 没有卡屏，图像数据在变化.
1 : 卡屏. 图像数据在指定的时间内一直没有变化.
示例:
TracePrint dm.IsDisplayDead(0,0,100,100,5)
注:此函数的原理是不停的截取指定区域的图像，然后比较，如果改变就立刻返回0,否则等待直到指定的时间到达.
]]
function DMCenter:IsDisplayDead(x1,y1,x2,y2,t)
    return CPLUS.DmCenter.IsDisplayDead(x1,y1,x2,y2,t) == 1
end




--[[
预先加载指定的图片,这样在操作任何和图片相关的函数时,将省去了加载图片的时间。调用此函数后,没必要一定要调用FreePic,插件自己会自动释放.
另外,此函数不是必须调用的,所有和图形相关的函数只要调用过一次，图片会自动加入缓存.
如果想对一个已经加入缓存的图片进行修改，那么必须先用FreePic释放此图片在缓存中占用
的内存，然后重新调用图片相关接口，就可以重新加载此图片. （当图色缓存机制打开时,具体参考EnablePicCache）

参数定义:
pic_name 字符串: 文件名比如"1.bmp|2.bmp|3.bmp" 等,可以使用通配符,比如
          "*.bmp" 这个对应了所有的bmp文件
          "a?c*.bmp" 这个代表了所有第一个字母是a 第三个字母是c 第二个字母任意的所有bmp文件
          "abc???.bmp|1.bmp|aa??.bmp" 可以这样任意组合.

示例:
PutAttachment "c:\test","*.bmp"
dm_ret = dm.SetPath("c:\test")
all_pic = "abc???.bmp|1.bmp|aa??.bmp"
dm_ret = dm.LoadPic(all_pic)
注: 如果在LoadPic后(图片名为相对路径时)，又设置SetPath为别的目录，会导致加入缓存的图片失效，等于没加载. 
]]
function DMCenter:LoadPic(pic_name)
    return CPLUS.DmCenter.LoadPic(pic_name) == 1
end




--[[
预先加载指定的图片,这样在操作任何和图片相关的函数时,将省去了加载图片的时间。调用此函数后,没必要一定要调用FreePic,插件自己会自动释放.
另外,此函数不是必须调用的,所有和图形相关的函数只要调用过一次，图片会自动加入缓存.
如果想对一个已经加入缓存的图片进行修改，那么必须先用FreePic释放此图片在缓存中占用
的内存，然后重新调用图片相关接口，就可以重新加载此图片. （当图色缓存机制打开时,具体参考EnablePicCache）
此函数同LoadPic，只不过LoadPic是从文件中加载图片,而LoadPicByte从给定的内存中加载.
addr 整形数: BMP图像首地址.(完整的BMP图像，不是经过解析的. 和BMP文件里的内容一致)
size 整形数: BMP图像大小.(和BMP文件大小一致)
pic_name 字符串: 文件名,指定这个地址对应的图片名. 用于找图时使用.

示例:
dm.LoadPicByte 123456,300,"1.bmp"
dm_ret = dm.FindPic(0,0,2000,2000,"1.bmp","000000",0.9,0,x,y)
注: 如果在LoadPicByte后(图片名为相对路径时)，又设置SetPath为别的目录，会导致加入缓存的图片失效，等于没加载. 
]]
function DMCenter:LoadPicByte(addr,size,pic_name)
    assert(false,"涉及到指针操作,无实现")
end



--[[
根据通配符获取文件集合. 方便用于FindPic和FindPicEx
参数定义:

pic_name 字符串: 文件名比如"1.bmp|2.bmp|3.bmp" 等,可以使用通配符,比如
          "*.bmp" 这个对应了所有的bmp文件
          "a?c*.bmp" 这个代表了所有第一个字母是a 第三个字母是c 第二个字母任意的所有bmp文件
          "abc???.bmp|1.bmp|aa??.bmp" 可以这样任意组合.
返回值:
字符串:
返回的是通配符对应的文件集合，每个图片以|分割

示例:
PutAttachment "c:\test","*.bmp"
dm_ret = dm.SetPath("c:\test")
all_pic = "abc*.bmp"
pic_name = dm.MatchPicName(all_pic)

// 比如c:\test目录下有abc001.bmp abc002.bmp abc003.bmp
// 那么pic_name 的值为abc001.bmp|abc002.bmp|abc003.bmp
]]
function DMCenter:MatchPicName(pic_name)
    return CPLUS.DmCenter.MatchPicName(pic_name)
end




--[[
把RGB的颜色格式转换为BGR(按键格式)
参数定义:
rgb_color 字符串:rgb格式的颜色字符串
返回值:
字符串:
BGR格式的字符串
示例:
bgr_color = dm.RGB2BGR(rgb_color)
]]
function DMCenter:RGB2BGR(rgb_color)
    return CPLUS.DmCenter.RGB2BGR(rgb_color)
end




--[[
设置图色,以及文字识别时,需要排除的区域.(支持所有图色接口,以及文字相关接口,但对单点取色,或者单点颜色比较的接口不支持)
参数定义:
mode 整形数: 模式,取值如下:
           0: 添加排除区域
           1: 设置排除区域的颜色,默认颜色是FF00FF(此接口的原理是把排除区域设置成此颜色,这样就可以让这块区域实效)
           2: 请空排除区域
info 字符串: 根据mode的取值来决定
            当mode为0时,此参数指添加的区域,可以多个区域,用"|"相连. 格式为"x1,y1,x2,y2|....."
            当mode为1时,此参数为排除区域的颜色,"RRGGBB"
            当mode为2时,此参数无效
示例:
// 先清空区域
dm.SetExcludeRegion(2,"")
// 添加区域
dm.SetExcludeRegion(0,"30,30,100,300|300,400,500,600")
dm.SetExcludeRegion(0,"100,100,200,200")
至于颜色如果有需要也可以设置比如
dm.SetExcludeRegion(1,"FF11FF")
]]
function DMCenter:SetExcludeRegion(mode,info)
    return CPLUS.DmCenter.SetExcludeRegion(mode,info) == 1
end




--[[
设置图片密码，如果图片本身没有加密，那么此设置不影响不加密的图片，一样正常使用.
参数定义:
pwd 字符串: 图片密码
示例:
dm_ret = dm.SetPicPwd("123")
注意,此函数必须在使用图片之前调用.

]]
function DMCenter:SetPicPwd(pwd)
    return CPLUS.DmCenter.SetPicPwd(pwd) == 1
end











-------------------------------------文字识别--------------------------------------------------
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end

function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end
function DMCenter:XXXXXX()
    return CPLUS.DmCenter.XXXXX() == 1
end


return DMCenter


