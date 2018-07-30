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
--[[
给指定的字库中添加一条字库信息
参数定义:
index 整形数:字库的序号,取值为0-99,目前最多支持100个字库
dict_info 字符串:字库描述串，具体参考大漠综合工具中的字符定义
示例:
dm_ret = dm.AddDict(0,"081101BF8020089FD10A21443F85038$记$0.0$11")

注意: 此函数尽量在小字库中使用，大字库中使用AddDict速度比较慢
另，此函数是向指定的字库所在的内存中添加,而不是往文件中添加. 添加以后立刻就可以用于文字识别。无须再SetDict
如果要保存添加进去的字库信息，需要调用SaveDict
]]
function DMCenter:AddDict(index,dict_info)
    return CPLUS.DmCenter.AddDict(index,dict_info) == 1
end



--[[
清空指定的字库.
参数定义:
index 整形数:字库的序号,取值为0-99,目前最多支持100个字库
示例:
dm.ClearDict 0
注意: 此函数尽量在小字库中使用，大字库中使用AddDict速度比较慢
另外，此函数支持清空内存中的字库，而不是字库文件本身.
]]
function DMCenter:ClearDict(index)
    return CPLUS.DmCenter.ClearDict(index) == 1
end



--[[
允许当前调用的对象使用全局字库。  
如果你的程序中对象太多,并且每个对象都用到了同样的字库,
可以考虑用全局字库,这样可以节省大量内存.
参数定义:

enable 整形数: 0 关闭 1 打开
返回值:
示例:
dm.EnableShareDict 1
dm.SetDict 0,"xxx.txt"
注 : 一旦当前对象开启了全局字库,那么所有的和文字识别，字库相关的接口，通通都认为是对全局字库的操作.
如果所有对象都要需要全局字
]]
function DMCenter:EnableShareDict(enable)
    return CPLUS.DmCenter.EnableShareDict(enable) == 1
end



--[[
根据指定的范围,以及指定的颜色描述，提取点阵信息，类似于大漠工具里的单独提取.
参数定义:

x1 整形数:左上角X坐标
y1 整形数:左上角Y坐标
x2 整形数:右下角X坐标
y2 整形数:右下角Y坐标
color 字符串: 颜色格式串.注意，RGB和HSV,以及灰度格式都支持.
word 字符串: 待定义的文字,不能为空，且不能为关键符号"$"

返回值:
字符串:
识别到的点阵信息，可用于AddDict
如果失败，返回空

示例:
info = dm.FetchWord(200,200,250,220,"abcdef-101010|ffffff-101010","张三")
If len(info) > 0 Then
    dm.AddDict 3,info
End if

info = dm.FetchWord(200,200,250,220,"b@abcdef-101010|ffffff-101010","李四")
If len(info) > 0 Then
    dm.AddDict 2,info
End if

info = dm.FetchWord(200,200,250,220,"b@0.100.100-0.0.0","张三")
If len(info) > 0 Then
    dm.AddDict 4,info
End if

info = dm.FetchWord(200,200,250,220,"0.100.100-0.0.0|100.0.0-0.0.0","王")
If len(info) > 0 Then
    dm.AddDict 4,info
End if
]]
function DMCenter:FetchWord(x1, y1, x2, y2, color, word)
    return CPLUS.DmCenter.FetchWord(x1, y1, x2, y2, color, word)
end



--[[
   在屏幕范围(x1,y1,x2,y2)内,查找string(可以是任意个字符串的组合),
   并返回符合color_format的坐标位置,相似度sim同Ocr接口描述.
    (多色,差色查找类似于Ocr接口,不再重述) 
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串,可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例 .注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0
intX 变参指针:返回X坐标没找到返回-1
intY 变参指针:返回Y坐标没找到返回-1

返回值:table{x=0,y=0}

整形数:
返回字符串的索引 没找到返回-1, 比如"长安|洛阳",若找到长安，则返回0

示例:
dm_ret = dm.FindStr(0,0,2000,2000,"长安","9f2e3f-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

dm_ret = dm.FindStr(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
dm_ret = dm.FindStr(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

注: 此函数的原理是先Ocr识别，然后再查找。所以速度比FindStrFast要慢，尤其是在字库
很大，或者模糊度不为1.0时。
一般字库字符数量小于100左右，模糊度为1.0时，用FindStr要快一些,否则用FindStrFast.
]]
function DMCenter:FindStr(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStr(x1,y1,x2,y2,string,color_format,sim)
end



--[[
在屏幕范围(x1,y1,x2,y2)内,查找string(可以是任意个字符串的组合),
并返回符合color_format的坐标位置,相似度sim同Ocr接口描述.
(多色,差色查找类似于Ocr接口,不再重述)
易语言用不了FindStr可以用此接口来代替
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:

字符串:
返回字符串序号以及X和Y坐标,形式如"id|x|y", 比如"0|100|200",没找到时，id和X以及Y均为-1，"-1|-1|-1"

示例:
pos = dm.FindStrE(0,0,2000,2000,"长安","9f2e3f-000000",1.0)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If

pos = dm.FindStrE(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
pos = dm.FindStrE(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",1.0)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If
注: 此函数的原理是先Ocr识别，然后再查找。所以速度比FindStrFastE要慢，尤其是在字库
很大，或者模糊度不为1.0时。
一般字库字符数量小于100左右，模糊度为1.0时，用FindStrE要快一些,否则用FindStrFastE.
]]
function DMCenter:FindStrE(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrE(x1,y1,x2,y2,string,color_format,sim)
end




--[[
在屏幕范围(x1,y1,x2,y2)内,查找string(可以是任意字符串的组合),
并返回符合color_format的所有坐标位置,相似度sim同Ocr接口描述.
(多色,差色查找类似于Ocr接口,不再重述)
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回所有找到的坐标集合,格式如下:
"id,x0,y0|id,x1,y1|......|id,xn,yn"
比如"0,100,20|2,30,40" 表示找到了两个,第一个,对应的是序号为0的字符串,坐标是(100,20),第二个是序号为2的字符串,坐标(30,40)

示例:
dm_ret = dm.FindStrEx(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0)
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

注: 此函数的原理是先Ocr识别，然后再查找。所以速度比FindStrExFast要慢，尤其是在字库
很大，或者模糊度不为1.0时。
一般字库字符数量小于100左右，模糊度为1.0时，用FindStrEx要快一些,否则用FindStrFastEx.
]]
function DMCenter:FindStrEx(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrEx(x1,y1,x2,y2,string,color_format,sim)
end





--[[
在屏幕范围(x1,y1,x2,y2)内,查找string(可以是任意字符串的组合),并返回符合color_format的所有坐标位置,相似度sim同Ocr接口描述.
(多色,差色查找类似于Ocr接口,不再重述). 此函数同FindStrEx,只是返回值不同. 
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回所有找到的坐标集合,格式如下:
"str,x0,y0| str,x1,y1|......| str,xn,yn"
比如"长安,100,20|大雁塔,30,40" 表示找到了两个,第一个是长安 ,坐标是(100,20),第二个是大雁塔,坐标(30,40)

示例:
dm_ret = dm.FindStrExS(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0)
If len(dm_ret) > 0 Then
   ss = split(dm_ret,"|")
   index = 0
   count = UBound(ss) + 1
   Do While index < count
      TracePrint ss(index)
      sss = split(ss(index),",")
      str = sss(0)
      x = int(sss(1))
      y = int(sss(2))
      dm.MoveTo x,y
      Delay 1000
      index = index+1
   Loop
End If

注: 此函数的原理是先Ocr识别，然后再查找。所以速度比FindStrExFastS要慢，尤其是在字库
很大，或者模糊度不为1.0时。
一般字库字符数量小于100左右，模糊度为1.0时，用FindStrExS要快一些,否则用FindStrFastExS
]]
function DMCenter:FindStrExS(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrExS(x1,y1,x2,y2,string,color_format,sim)
end




--[[
同FindStr
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串,可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0
intX 变参指针:返回X坐标 没找到返回-1
intY 变参指针:返回Y坐标 没找到返回-1

返回值:table{x=0,y=0}

整形数:
返回字符串的索引 没找到返回-1, 比如"长安|洛阳",若找到长安，则返回0

示例:
dm_ret = dm.FindStrFast(0,0,2000,2000,"长安","9f2e3f-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

dm_ret = dm.FindStrFast(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",0.9,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
dm_ret = dm.FindStrFast(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",0.9,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

注: 此函数比FindStr要快很多，尤其是在字库很大时，或者模糊识别时，效果非常明显。
推荐使用此函数。
另外由于此函数是只识别待查找的字符，所以可能会有如下情况出现问题。
比如 字库中有"张和三" 一共3个字符数据，然后待识别区域里是"张和三",如果用FindStr查找
"张三"肯定是找不到的，但是用FindStrFast却可以找到，因为"和"这个字符没有列入查找计划中
所以，在使用此函数时，也要特别注意这一点。
]]
function DMCenter:FindStrFast(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrFast(x1,y1,x2,y2,string,color_format,sim)
end




--[[
同FindStrE
易语言用不了FindStrFast可以用此接口来代替
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回字符串序号以及X和Y坐标,形式如"id|x|y", 比如"0|100|200",没找到时，id和X以及Y均为-1，"-1|-1|-1"

示例:
pos = dm.FindStrFastE(0,0,2000,2000,"长安","9f2e3f-000000",1.0)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If

pos = dm.FindStrFastE(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",0.9)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
pos = dm.FindStrFastE(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",0.9)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If

注: 此函数比FindStrE要快很多，尤其是在字库很大时，或者模糊识别时，效果非常明显。
推荐使用此函数。
另外由于此函数是只识别待查找的字符，所以可能会有如下情况出现问题。
比如 字库中有"张和三" 一共3个字符数据，然后待识别区域里是"张和三",如果用FindStrE查找
"张三"肯定是找不到的，但是用FindStrFastE却可以找到，因为"和"这个字符没有列入查找计划中
所以，在使用此函数时，也要特别注意这一点。
]]
function DMCenter:FindStrFastE(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrFastE(x1,y1,x2,y2,string,color_format,sim)
end




--[[
同FindStrEx
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回所有找到的坐标集合,格式如下:
"id,x0,y0|id,x1,y1|......|id,xn,yn"
比如"0,100,20|2,30,40" 表示找到了两个,第一个,对应的是序号为0的字符串,坐标是(100,20),第二个是序号为2的字符串,坐标(30,40)

示例:
dm_ret = dm.FindStrFastEx(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",0.9)
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

注: 此函数比FindStrEx要快很多，尤其是在字库很大时，或者模糊识别时，效果非常明显。
推荐使用此函数。
另外由于此函数是只识别待查找的字符，所以可能会有如下情况出现问题。
比如 字库中有"张和三" 一共3个字符数据，然后待识别区域里是"张和三",如果用FindStrEx查找
"张三"肯定是找不到的，但是用FindStrFastEx却可以找到，因为"和"这个字符没有列入查找计划中
所以，在使用此函数时，也要特别注意这一点。
]]
function DMCenter:FindStrFastEx(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrFastEx(x1,y1,x2,y2,string,color_format,sim)
end





--[[
同FindStrExS. 
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例 .注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回所有找到的坐标集合,格式如下:
"str,x0,y0| str,x1,y1|......| str,xn,yn"
比如"长安,100,20|大雁塔,30,40" 表示找到了两个,第一个是长安 ,坐标是(100,20),第二个是大雁塔,坐标(30,40)
示例:
dm_ret = dm.FindStrFastExS(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",0.9)
If len(dm_ret) > 0 Then
   ss = split(dm_ret,"|")
   index = 0
   count = UBound(ss) + 1
   Do While index < count
      TracePrint ss(index)
      sss = split(ss(index),",")
      str = sss(0)
      x = int(sss(1))
      y = int(sss(2))
      dm.MoveTo x,y
      Delay 1000
      index = index+1
   Loop
End If
注: 此函数比FindStrExS要快很多，尤其是在字库很大时，或者模糊识别时，效果非常明显。
推荐使用此函数。
另外由于此函数是只识别待查找的字符，所以可能会有如下情况出现问题。
比如 字库中有"张和三" 一共3个字符数据，然后待识别区域里是"张和三",如果用FindStrExS查找
"张三"肯定是找不到的，但是用FindStrFastExS却可以找到，因为"和"这个字符没有列入查找计划中
所以，在使用此函数时，也要特别注意这一点。
]]
function DMCenter:FindStrFastExS(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrFastExS(x1,y1,x2,y2,string,color_format,sim)
end




--[[
同FindStrS. 
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串,可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例 .注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0
intX 变参指针:返回X坐标 没找到返回-1
intY 变参指针:返回Y坐标 没找到返回-1

返回值: table{x=0,y=0,str=""}

字符串:
返回找到的字符串. 没找到的话返回长度为0的字符串.

示例:
dm_ret = dm.FindStrFastS(0,0,2000,2000,"长安","9f2e3f-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

dm_ret = dm.FindStrFastS(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",0.9,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
dm_ret = dm.FindStrFastS(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",0.9,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

注: 此函数比FindStrS要快很多，尤其是在字库很大时，或者模糊识别时，效果非常明显。
推荐使用此函数。
另外由于此函数是只识别待查找的字符，所以可能会有如下情况出现问题。
比如 字库中有"张和三" 一共3个字符数据，然后待识别区域里是"张和三",如果用FindStrS查找
"张三"肯定是找不到的，但是用FindStrFastS却可以找到，因为"和"这个字符没有列入查找计划中
所以，在使用此函数时，也要特别注意这一点。
]]
function DMCenter:FindStrFastS(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrFastS(x1,y1,x2,y2,string,color_format,sim)
end



--[[
在屏幕范围(x1,y1,x2,y2)内,查找string(可以是任意个字符串的组合),
并返回符合color_format的坐标位置,相似度sim同Ocr接口描述.
(多色,差色查找类似于Ocr接口,不再重述).此函数同FindStr,只是返回值不同.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串,可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例 .注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0
intX 变参指针:返回X坐标 没找到返回-1
intY 变参指针:返回Y坐标 没找到返回-1

返回值: table{x=0,y=0,str=""}
字符串:
返回找到的字符串. 没找到的话返回长度为0的字符串.

示例:
dm_ret = dm.FindStrS(0,0,2000,2000,"长安","9f2e3f-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

dm_ret = dm.FindStrS(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
dm_ret = dm.FindStrS(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If
注: 此函数的原理是先Ocr识别，然后再查找。所以速度比FindStrFastS要慢，尤其是在字库
很大，或者模糊度不为1.0时。
一般字库字符数量小于100左右，模糊度为1.0时，用FindStrS要快一些,否则用FindStrFastS.
]]
function DMCenter:FindStrS(x1,y1,x2,y2,string,color_format,sim)
    return CPLUS.DmCenter.FindStrS(x1,y1,x2,y2,string,color_format,sim)
end




--[[
同FindStr，但是不使用SetDict设置的字库，而利用系统自带的字库，速度比FindStr稍慢
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串,可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例 .注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0
font_name 字符串:系统字体名,比如"宋体"
font_size 整形数:系统字体尺寸，这个尺寸一定要以大漠综合工具获取的为准.如果获取尺寸看视频教程.
flag 整形数:字体类别 取值可以是以下值的组合,比如1+2+4+8,2+4. 0表示正常字体.
    1 : 粗体
    2 : 斜体
    4 : 下划线
    8 : 删除线
intX 变参指针:返回X坐标没找到返回-1
intY 变参指针:返回Y坐标没找到返回-1

返回值: table{x=0,y=0,str=""}
整形数:
返回字符串的索引 没找到返回-1, 比如"长安|洛阳",若找到长安，则返回0

示例:
dm_ret = dm.FindStrWithFont(0,0,2000,2000,"长安","9f2e3f-000000",1.0,"宋体",9,0,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

dm_ret = dm.FindStrWithFont(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0,"宋体",9,1+2,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
dm_ret = dm.FindStrWithFont(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",1.0,"宋体",9,1+2,intX,intY)
If intX >= 0 and intY >= 0 Then
     dm.MoveTo intX,intY
End If

注: 对于如何获取字体尺寸以及名字等信息，可以参考视频教程，如何使用系统字库.
]]
function DMCenter:FindStrWithFont(x1,y1,x2,y2,string,color_format,sim,font_name,font_size,flag)
    return CPLUS.DmCenter.FindStrWithFont(x1,y1,x2,y2,string,color_format,sim,font_name,font_size,flag)
end



--[[
同FindStrE，但是不使用SetDict设置的字库，而利用系统自带的字库，速度比FindStrE稍慢
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0
font_name 字符串:系统字体名,比如"宋体"
font_size 整形数:系统字体尺寸，这个尺寸一定要以大漠综合工具获取的为准.如果获取尺寸看视频教程.
flag 整形数:字体类别 取值可以是以下值的组合,比如1+2+4+8,2+4. 0表示正常字体.
    1 : 粗体
    2 : 斜体
    4 : 下划线
    8 : 删除线
返回值:
字符串:
返回字符串序号以及X和Y坐标,形式如"id|x|y", 比如"0|100|200",没找到时，id和X以及Y均为-1，"-1|-1|-1"

示例:
pos = dm.FindStrWithFontE(0,0,2000,2000,"长安","9f2e3f-000000",1.0,"宋体",9,0)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If

pos = dm.FindStrWithFontE(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0,"宋体",9,1+2)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If

// 查找时,对多行文本进行换行,换行分隔符是"|". 语法是在","后增加换行字符串.任意字符串都可以.
pos = dm.FindStrWithFontE(0,0,2000,2000,"长安|洛阳","9f2e3f-000000,|",1.0,"宋体",9,1+2)
pos = split(pos,"|")
If int(pos(0)) >= 0 Then
     dm.MoveTo int(pos(1)),int(pos(2))
End If
注: 对于如何获取字体尺寸以及名字等信息，可以参考视频教程，如何使用系统字库.
]]
function DMCenter:FindStrWithFontE(x1,y1,x2,y2,string,color_format,sim,font_name,font_size,flag)
    return CPLUS.DmCenter.FindStrWithFontE(x1,y1,x2,y2,string,color_format,sim,font_name,font_size,flag)
end




--[[
同FindStrEx，但是不使用SetDict设置的字库，而利用系统自带的字库，速度比FindStrEx稍慢
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
string 字符串:待查找的字符串, 可以是字符串组合，比如"长安|洛阳|大雁塔",中间用"|"来分割字符串
color_format 字符串:颜色格式串, 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0
font_name 字符串:系统字体名,比如"宋体"
font_size 整形数:系统字体尺寸，这个尺寸一定要以大漠综合工具获取的为准.如果获取尺寸看视频教程.
flag 整形数:字体类别 取值可以是以下值的组合,比如1+2+4+8,2+4. 0表示正常字体.
    1 : 粗体
    2 : 斜体
    4 : 下划线
    8 : 删除线

返回值:

字符串:
返回所有找到的坐标集合,格式如下:
"id,x0,y0|id,x1,y1|......|id,xn,yn"
比如"0,100,20|2,30,40" 表示找到了两个,第一个,对应的是序号为0的字符串,坐标是(100,20),第二个是序号为2的字符串,坐标(30,40)

示例:
dm_ret = dm.FindStrWithFontEx(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",1.0,"宋体",9,1+2)
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
注: 对于如何获取字体尺寸以及名字等信息，可以参考视频教程，如何使用系统字库.
]]
function DMCenter:FindStrWithFontEx(x1,y1,x2,y2,string,color_format,sim,font_name,font_size,flag)
    return CPLUS.DmCenter.FindStrWithFontEx(x1,y1,x2,y2,string,color_format,sim,font_name,font_size,flag)
end




--[[
获取指定字库中指定条目的字库信息.
index 整形数: 字库序号(0-99)
font_index 整形数: 字库条目序号(从0开始计数,数值不得超过指定字库的字库上限,具体参考GetDictCount)

返回值:
字符串:
返回字库条目信息. 失败返回空串.

示例:
s = dm.GetDict(0,1245)
TracePrint s
s = dm.GetDict(1,678)
TracePrint s
]]
function DMCenter:GetDict(index,font_index)
    return CPLUS.DmCenter.GetDict(index,font_index)
end




--[[
获取指定的字库中的字符数量.
index 整形数: 字库序号(0-99)
返回值:
整形数:
字库数量
示例:
count = dm.GetDictCount(0)
TracePrint "0号字库使用的字库数量是:"&count
]]
function DMCenter:GetDictCount(index)
    return CPLUS.DmCenter.GetDictCount(index)
end





--[[
根据指定的文字，以及指定的系统字库信息，获取字库描述信息.
str 字符串:需要获取的字符串
font_name 字符串:系统字体名,比如"宋体"
font_size 整形数:系统字体尺寸，这个尺寸一定要以大漠综合工具获取的为准.如何获取尺寸看视频教程.
flag 整形数:字体类别 取值可以是以下值的组合,比如1+2+4+8,2+4. 0表示正常字体.
    1 : 粗体
    2 : 斜体
    4 : 下划线
    8 : 删除线
返回值:
字符串:
返回字库信息,每个字符的字库信息用"|"来分割
示例:
// 下面的代码是获取"回收站"这3个字符的字库信息，然后加入到字库1中.
font_desc = dm.GetDictInfo("回收站","宋体",9,0)
font_desc = split(font_desc,"|")
count = ubound(font_desc)
for i = 0 to count
    TracePrint font_desc(i)
    dm.AddDict 1,font_desc(i)
next
]]
function DMCenter:GetDictInfo(str,font_name,font_size,flag)
    return CPLUS.DmCenter.GetDictInfo(str,font_name,font_size,flag)
end




--[[
获取当前使用的字库序号(0-99)
返回值:

整形数:
字库序号(0-99)

]]
function DMCenter:GetNowDict()
    return CPLUS.DmCenter.GetNowDict()
end




--[[
对插件部分接口的返回值进行解析,并返回ret中的坐标个数
ret 字符串: 部分接口的返回串
返回值:
整形数:
返回ret中的坐标个数
]]
function DMCenter:GetResultCount(ret)
    return CPLUS.DmCenter.GetResultCount(ret)
end




--[[
对插件部分接口的返回值进行解析,并根据指定的第index个坐标,返回具体的值
ret 字符串:部分接口的返回串
index 整形数: 第几个坐标
intX 变参指针: 返回X坐标
intY 变参指针: 返回Y坐标

返回值:table{x=0,y=0}

整形数:
0:失败
1:成功

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
function DMCenter:GetResultPos(ret,index)
    return CPLUS.DmCenter.GetResultPos(ret,index)
end




--[[
在使用GetWords进行词组识别以后,可以用此接口进行识别词组数量的计算.
参数定义:
str 字符串: GetWords接口调用以后的返回值
返回值:
整形数:
返回词组数量

示例:
s = dm.GetWords(0,0,2000,2000,"000000-000000",1.0)
count = dm.GetWordResultCount(s)
MessageBox count 
]]
function DMCenter:GetWordResultCount(str)
    return CPLUS.DmCenter.GetWordResultCount(str)
end






--[[
在使用GetWords进行词组识别以后,可以用此接口进行识别各个词组的坐标
参数定义:

str 字符串: GetWords的返回值

index 整形数: 表示第几个词组

intX 变参指针: 返回的X坐标

intY 变参指针: 返回的Y坐标

返回值: table{x=0,y=0}
整形数:
0: 失败
1: 成功
示例:
s = dm.GetWords(0,0,2000,2000,"000000-000000",1.0)
count = dm.GetWordResultCount(s)
index = 0
Do While index < count
    dm_ret = dm.GetWordResultPos(s,index,intX,intY)
    MessageBox intX&","&intY 
    index = index + 1 
Loop 
]]
function DMCenter:GetWordResultPos(str,index)
    return CPLUS.DmCenter.GetWordResultPos(str,index)
end




--[[
在使用GetWords进行词组识别以后,可以用此接口进行识别各个词组的内容
str 字符串: GetWords的返回值
index 整形数: 表示第几个词组
返回值:
字符串:
返回的第index个词组内容
示例:
s = dm.GetWords(0,0,2000,2000,"000000-000000",1.0)
count = dm.GetWordResultCount(s)
index = 0
Do While index < count
    word = dm.GetWordResultStr(s,index)
    MessageBox word 
    index = index + 1 
Loop 
]]
function DMCenter:GetWordResultStr(str,index)
    return CPLUS.DmCenter.GetWordResultStr(str,index)
end



--[[
根据指定的范围,以及设定好的词组识别参数(一般不用更改,除非你真的理解了)
识别这个范围内所有满足条件的词组. 比较适合用在未知文字的情况下,进行不定识别.
x1 整形数:左上角X坐标
y1 整形数:左上角Y坐标
x2 整形数:右下角X坐标
y2 整形数:右下角Y坐标
color 字符串: 颜色格式串.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度 0.1-1.0 

返回值:
字符串:
识别到的格式串,要用到专用函数来解析
示例:
s = dm.GetWords(0,0,2000,2000,"000000-000000",1.0)
count = dm.GetWordResultCount(s)
index = 0
Do While index < count
    dm_ret = dm.GetWordResultPos(s,index,intX,intY)
    word = dm.GetWordResultStr(s,index)
    MessageBox intX&","&intY&","&word
    index = index + 1 
Loop 
]]
function DMCenter:GetWords(x1, y1, x2, y2, color, sim)
    return CPLUS.DmCenter.GetWords(x1, y1, x2, y2, color, sim)
end





--[[
根据指定的范围,以及设定好的词组识别参数(一般不用更改,除非你真的理解了)
识别这个范围内所有满足条件的词组. 这个识别函数不会用到字库。只是识别大概形状的位置 
x1 整形数:左上角X坐标
y1 整形数:左上角Y坐标
x2 整形数:右下角X坐标
y2 整形数:右下角Y坐标
color 字符串: 颜色格式串.注意，RGB和HSV,以及灰度格式都支持.
返回值:
字符串:
识别到的格式串,要用到专用函数来解析
示例:
s = dm.GetWordsNoDict(0,0,2000,2000,"000000-000000")
count = dm.GetResultCount(s)
index = 0
Do While index < count
    dm_ret = dm.GetResultPos(s,index,intX,intY)
    MessageBox intX&","&intY
    index = index + 1 
Loop 
]]
function DMCenter:GetWordsNoDict(x1, y1, x2, y2, color)
    return CPLUS.DmCenter.GetWordsNoDict(x1, y1, x2, y2, color)
end




--[[
识别屏幕范围(x1,y1,x2,y2)内符合color_format的字符串,并且相似度为sim,sim取值范围(0.1-1.0),
这个值越大越精确,越大速度越快,越小速度越慢,请斟酌使用!
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color_format 字符串:颜色格式串. 可以包含换行分隔符,语法是","后加分割字符串. 具体可以查看下面的示例.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回识别到的字符串
示例:
//RGB单色识别
s = dm.Ocr(0,0,2000,2000,"9f2e3f-000000",1.0)
MessageBox s
//RGB单色差色识别
s = dm.Ocr(0,0,2000,2000,"9f2e3f-030303",1.0)
MessageBox s
//RGB多色识别(最多支持10种,每种颜色用"|"分割)
s = dm.Ocr(0,0,2000,2000,"9f2e3f-030303|2d3f2f-000000|3f9e4d-100000",1.0)
MessageBox s
//HSV多色识别(最多支持10种,每种颜色用"|"分割)
s = dm.Ocr(0,0,2000,2000,"20.30.40-0.0.0|30.40.50-0.0.0",1.0)
MessageBox s
//灰度多色识别(最多支持10种,每种颜色用"|"分割)
s = dm.Ocr(0,0,2000,2000,"#40-0|#70-10",1.0)
MessageBox s
//识别后,每行字符串用指定字符分割
比如用"|"字符分割
s = dm.Ocr(0,0,2000,2000,"9f2e3f-000000,|",1.0)
MessageBox s
//比如用回车换行分割
s = dm.Ocr(0,0,2000,2000,"9f2e3f-000000,"+vbcrlf,1.0)
MessageBox s
//背景色识别
//比如要识别背景色为白色,文字颜色未知的字形
s = dm.Ocr(0,0,2000,2000,"b@ffffff-000000",1.0)
MessageBox s
//注: 在color_fomat最前面加上"b@"表示后面的颜色描述是针对背景色,而非字的颜色.
]]
function DMCenter:Ocr(x1,y1,x2,y2,color_format,sim)
    return CPLUS.DmCenter.Ocr(x1,y1,x2,y2,color_format,sim)
end




--[[
识别屏幕范围(x1,y1,x2,y2)内符合color_format的字符串,并且相似度为sim,sim取值范围(0.1-1.0),
这个值越大越精确,越大速度越快,越小速度越慢,请斟酌使用!
这个函数可以返回识别到的字符串，以及每个字符的坐标.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color_format 字符串:颜色格式串.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回识别到的字符串 格式如  "字符0$x0$y0|…|字符n$xn$yn"
示例:
和Ocr函数相同，只是结果处理有所不同如下
dm_ret = dm.OcrEx(0,0,2000,2000,"ffffff|000000",1.0)
ss = split(dm_ret,"|")
index = 0
count = UBound(ss) + 1
Do While index < count
   TracePrint ss(index)
   sss = split(ss(index),"$")
   ocr_s = int(sss(0))
   x = int(sss(1))
   y = int(sss(2))
   TracePrint ocr_s & ","&x&","&y
   index = index+1
Loop
注: OcrEx不再像Ocr一样,支持换行分割了.
]]
function DMCenter:OcrEx(x1,y1,x2,y2,color_format,sim)
    return CPLUS.DmCenter.OcrEx(x1,y1,x2,y2,color_format,sim)
end




--[[
识别屏幕范围(x1,y1,x2,y2)内符合color_format的字符串,并且相似度为sim,sim取值范围(0.1-1.0),
这个值越大越精确,越大速度越快,越小速度越慢,请斟酌使用!
这个函数可以返回识别到的字符串，以及每个字符的坐标.这个同OcrEx,另一种返回形式.
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
color_format 字符串:颜色格式串.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回识别到的字符串 格式如  "识别到的信息|x0,y0|…|xn,yn"
示例:
和Ocr函数相同，只是结果处理有所不同如下
ss = dm.OcrExOne(0,0,2000,2000,"ffffff|000000",1.0)
ss = split(ss,"|")
MessageBox "识别到的字符串:"&ss(0)
ss_len = len(ss(0))
for i = 1 to ss_len 
    MessageBox "第("&i&")的坐标是"&ss(i)
next
]]
function DMCenter:OcrExOne(x1,y1,x2,y2,color_format,sim)
    return CPLUS.DmCenter.OcrExOne(x1,y1,x2,y2,color_format,sim)
end




--[[
识别位图中区域(x1,y1,x2,y2)的文字
x1 整形数:区域的左上X坐标
y1 整形数:区域的左上Y坐标
x2 整形数:区域的右下X坐标
y2 整形数:区域的右下Y坐标
pic_name 字符串:图片文件名
color_format 字符串:颜色格式串.注意，RGB和HSV,以及灰度格式都支持.
sim 双精度浮点数:相似度,取值范围0.1-1.0

返回值:
字符串:
返回识别到的字符串
示例:
s = dm.OcrInFile(0,0,2000,2000,"test.bmp","000000-000000",1.0)
MessageBox s
]]
function DMCenter:OcrInFile(x1, y1, x2, y2, pic_name, color_format, sim)
    return CPLUS.DmCenter.OcrInFile(x1, y1, x2, y2, pic_name, color_format, sim)
end





--[[
保存指定的字库到指定的文件中.
index 整形数:字库索引序号 取值为0-99对应100个字库
file 字符串:文件名

返回值:
整形数:
0:失败
1:成功
示例:
dm.SetPath "c:\test_game"
dm.AddDict 0,"FFF00A7D49292524A7D402805FFC$回$0.0.54$11"
dm.AddDict 0,"3F0020087FF08270B9A108268708808$收$0.0.43$11"
dm.AddDict 0,"2055C98617420807C097F222447C800$站$0.0.44$11"
dm.SaveDict 0,"test.txt"
]]
function DMCenter:SaveDict(index,file)
    return CPLUS.DmCenter.SaveDict(index,file) == 1
end




--[[
高级用户使用,在不使用字库进行词组识别前,可设定文字的列距,默认列距是1
col_gap 整形数:文字列距
返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetColGapNoDict(3)  
]]
function DMCenter:SetColGapNoDict(col_gap)
    return CPLUS.DmCenter.SetColGapNoDict(col_gap) == 1
end




--[[
设置字库文件
index 整形数:字库的序号,取值为0-99,目前最多支持100个字库
file 字符串:字库文件名
返回值:
整形数:
0:失败
1:成功
示例
dm_ret = dm.SetDict(0,"test.txt")
注: 此函数速度很慢，全局初始化时调用一次即可，切换字库用UseDict
]]
function DMCenter:SetDict(index,file)
    return CPLUS.DmCenter.SetDict(index,file) == 1
end





--[[
从内存中设置字库.
index 整形数:字库的序号,取值为0-99,目前最多支持100个字库
addr 整形数: 数据地址
size 整形数: 字库长度
返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetDictMem(0,234324,1000)
注: 此函数速度很慢，全局初始化时调用一次即可，切换字库用UseDict
另外，此函数不支持加密的内存字库.
]]
function DMCenter:SetDictMem(index,addr,size)
    assert(false,"涉及到指针，暂无实现")
end


--[[
设置字库的密码,在SetDict前调用,目前的设计是,所有字库通用一个密码.
pwd 字符串:字库密码
返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetDictPwd("1234")
注意:如果使用了多字库,所有字库的密码必须一样. 此函数必须在SetDict之前调用,否则会解密失败.
]]
function DMCenter:SetDictPwd(pwd)
    return CPLUS.DmCenter.SetDictPwd(pwd) == 1
end




--[[
高级用户使用,在使用文字识别功能前，设定是否开启精准识别
exact_ocr 整形数: 0 表示关闭精准识别
            1 开启精准识别
返回值:
整形数:
0:失败
1:成功
示例:
// 开启精准识别
dm_ret = dm.SetExactOcr(1)
注意: 精准识别开启后，行间距和列间距会对识别结果造成较大影响，可以在工具中进行测试.
]]
function DMCenter:SetExactOcr(exact_ocr)
    return CPLUS.DmCenter.SetExactOcr(exact_ocr) == 1
end




--[[
高级用户使用,在识别前,如果待识别区域有多行文字,可以设定列间距,默认的列间距是0,
如果根据情况设定,可以提高识别精度。一般不用设定。
min_col_gap 整形数:最小列间距
返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetMinColGap(1)
注意：此设置如果不为0,那么将不能识别连体字 慎用.
]]
function DMCenter:SetMinColGap(min_col_gap)
    return CPLUS.DmCenter.SetMinColGap(min_col_gap) == 1
end




--[[
高级用户使用,在识别前,如果待识别区域有多行文字,可以设定行间距,默认的行间距是1,
如果根据情况设定,可以提高识别精度。一般不用设定
min_row_gap 整形数:最小行间距

返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetMinRowGap(2)
]]
function DMCenter:SetMinRowGap(min_row_gap)
    return CPLUS.DmCenter.SetMinRowGap(min_row_gap) == 1
end




--[[
高级用户使用,在不使用字库进行词组识别前,可设定文字的行距,默认行距是1
row_gap 整形数:文字行距

返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetRowGapNoDict(3)
]]
function DMCenter:SetRowGapNoDict(row_gap)
    return CPLUS.DmCenter.SetRowGapNoDict(row_gap) == 1
end




--[[
高级用户使用,在识别词组前,可设定词组间的间隔,默认的词组间隔是5
word_gap 整形数:单词间距
返回值:
整形数:
0:失败
1:成功

示例:
dm_ret = dm.SetWordGap(5)
]]
function DMCenter:SetWordGap(word_gap)
    return CPLUS.DmCenter.SetWordGap(word_gap) == 1
end





--[[
高级用户使用,在不使用字库进行词组识别前,可设定词组间的间隔,默认的词组间隔是5
word_gap 整形数:单词间距

返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetWordGapNoDict(1)
]]
function DMCenter:SetWordGapNoDict(word_gap)
    return CPLUS.DmCenter.SetWordGapNoDict(word_gap) == 1
end






--[[
高级用户使用,在识别词组前,可设定文字的平均行高,默认的词组行高是10
line_height 整形数:行高

返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetWordLineHeight(15)
]]
function DMCenter:SetWordLineHeight(line_height)
    return CPLUS.DmCenter.SetWordLineHeight(line_height) == 1
end




--[[
高级用户使用,在不使用字库进行词组识别前,可设定文字的平均行高,默认的词组行高是10
line_height 整形数:行高
返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.SetWordLineHeightNoDict(15)
]]
function DMCenter:SetWordLineHeightNoDict(line_height)
    return CPLUS.DmCenter.SetWordLineHeightNoDict(line_height) == 1
end





--[[
表示使用哪个字库文件进行识别(index范围:0-99)
设置之后，永久生效，除非再次设定
index 整形数:字库编号(0-99)
返回值:
整形数:
0:失败
1:成功
示例:
dm_ret = dm.UseDict(1)
ss = dm.Ocr(0,0,2000,2000,"FFFFFF-000000",1.0)
dm_ret = dm.UseDict(0)
]]
function DMCenter:UseDict(index)
    return CPLUS.DmCenter.UseDict(index) == 1
end


-------------------------基本设置-----------------------------------------

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


