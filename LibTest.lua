--[[
██╗  ██╗██████╗  ██████╗ ███╗   ██╗ ██████╗ ███████╗
██║ ██╔╝██╔══██╗██╔═══██╗████╗  ██║██╔═══██╗██╔════╝
█████╔╝ ██████╔╝██║   ██║██╔██╗ ██║██║   ██║███████╗
██╔═██╗ ██╔══██╗██║   ██║██║╚██╗██║██║   ██║╚════██║
██║  ██╗██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝███████║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                    K R O N O S                       
                   UI FRAMEWORK                       
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  PROPRIETARY AND CONFIDENTIAL

   Copyright (c) 2026 Kronos. All rights reserved.

  This UI framework and all associated source code,
  components, designs, and implementations are the
  exclusive intellectual property of Kronos.

  Unauthorized copying, reproduction, modification,
  redistribution, or use outside of official Kronos
  software is strictly prohibited.

  All rights reserved.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

]]local a={cache={}::any}do do local function __modImpl()
local b={
Version="3.0.0",
Flags={},
_live={},
_tags={},
_gradients={},
_onAccent={},
_gui=nil,
_blur=nil,
_acrylicOn=true,
_transparent=false,
CurrentInput=nil,
_recent={},
_recentRefresh={},
_inbox={},
ThemeName="Dark",
Theme=nil,
FontPack="Gotham+",
}

return b end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()



local b={
"Frame","Container","Content","Wrapper","Layout","Padding",
"Background","Scroll","Title","Text","Icon","Image","Button",
"PlayerList","Chat","TopBar","BubbleChat","Notification","List",
"Header","Footer","Sidebar","Main","View","Clip","Overlay",
}

local function GetStealthName()
local c=b[math.random(1,#b)]
if math.random(1,2)==1 then
c=c.."_"..tostring(math.random(100,999))
end
return c
end

local function cloneref_check(c)
if cloneref then
local d,e=pcall(cloneref,c)
if d and e then return e end
elseif clonereference then
local d,e=pcall(clonereference,c)
if d and e then return e end
end
return c
end

local function hasFn(c)
local d,e=pcall(function()
if getgenv then return getgenv()end
return _G
end)
local f=(d and e)or _G
if f and rawget(f,c)~=nil then return f[c]end
local g=rawget(_G,c)
if g~=nil then return g end
return nil
end

local function GetGlobalTable()
local c,d=pcall(function()
if getgenv then return getgenv()end
return _G
end)
return(c and d)or _G
end


local c="__KRN_UI_UNLOAD"

local function claimUnload()
local d=GetGlobalTable()
local e=d[c]
d[c]=nil
if type(e)=="function"then pcall(e)end
return d
end

local function registerUnload(d)
local e=GetGlobalTable()
e[c]=d
end


local function GetRoot()
local d=cloneref_check(game:GetService"Players")
local e=d.LocalPlayer
local f=e and e:WaitForChild"PlayerGui"
local g=hasFn"gethui"
if g then
local h,i=pcall(g)
if h and i then return i end
end
return f
end

local function protectGui(d)
local e=hasFn"protectgui"or hasFn"protect_gui"
if type(e)=="function"then pcall(e,d)return end
local f=hasFn"syn"
if type(f)=="table"and type(f.protect_gui)=="function"then
pcall(f.protect_gui,d)
end
end

return{
DecoyNames=b,
GetStealthName=GetStealthName,
cloneref_check=cloneref_check,
hasFn=hasFn,
GetGlobalTable=GetGlobalTable,
claimUnload=claimUnload,
registerUnload=registerUnload,
GetRoot=GetRoot,
protectGui=protectGui,
UNLOAD_KEY=c,
}end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()


local function cloneref_check(b)
if cloneref then
local c,d=pcall(cloneref,b)
if c and d then return d end
elseif clonereference then
local c,d=pcall(clonereference,b)
if c and d then return d end
end
return b
end

local b=cloneref_check(game:GetService"TweenService")

local c={
Hover=TweenInfo.new(0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
Fast=TweenInfo.new(0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
Med=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
Slow=TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
Spring=TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
Fill05=TweenInfo.new(0.05,Enum.EasingStyle.Linear),
Fill08=TweenInfo.new(0.08,Enum.EasingStyle.Linear),
}

local function tween(d,e,f)
local g,h=pcall(function()return b:Create(d,e,f)end)
if g and h then pcall(function()h:Play()end)return h end
return nil
end

return{T=c,tween=tween}end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()



local b=a.c()
local c=a.b()
local d=b.tween

local e=c.cloneref_check(game:GetService"UserInputService")

local f=0
local function guid()
f+=1
return"t"..f.."_"..tostring(math.random(10000,99999))
end

local function spawnCb(g,...)
local h={...}
if type(g)=="function"then task.spawn(function()pcall(g,table.unpack(h))end)end
end

local function corner(g,h)
local i=Instance.new"UICorner"
i.CornerRadius=UDim.new(0,h)
i.Parent=g
return i
end

local function hairline(g,h)
local i=Instance.new"UIStroke"
i.Thickness=1
i.Color=Color3.fromRGB(255,255,255)
i.Transparency=h and 0.88 or 0.93
i.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
i.LineJoinMode=Enum.LineJoinMode.Round
i.Parent=g
return i
end

local function pad(g,h,i,j,k)
local l=Instance.new"UIPadding"
l.PaddingTop=UDim.new(0,h or 8)
l.PaddingBottom=UDim.new(0,i or h or 8)
l.PaddingLeft=UDim.new(0,j or 8)
l.PaddingRight=UDim.new(0,k or j or 8)
l.Parent=g
return l
end

local function lighting(g,h)
local i=Instance.new"Frame"
i.Name="_light"
i.Size=UDim2.fromScale(1,1)
i.BackgroundColor3=Color3.fromRGB(255,255,255)
i.BackgroundTransparency=0
i.BorderSizePixel=0
local j=Instance.new"UIGradient"
j.Rotation=90
j.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.93),
NumberSequenceKeypoint.new(0.45,1),
NumberSequenceKeypoint.new(1,1),
}
j.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
j.Parent=i
corner(i,h or 10)
i.Parent=g
return i
end

local function topLight(g)
local h=Instance.new"UIGradient"
h.Rotation=90
h.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(0.25,1),
NumberSequenceKeypoint.new(1,1),
}
h.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
local i=Instance.new"Frame"
i.Name=c.GetStealthName()
i.Size=UDim2.new(1,0,0,12)
i.BackgroundColor3=Color3.fromRGB(255,255,255)
i.BackgroundTransparency=0.96
i.BorderSizePixel=0
h.Parent=i
i.Parent=g
corner(i,10)
return i
end

local function shadow(g,h,i)
pcall(function()
local j=Instance.new"UIShadow"
j.Transparency=h or 0.55
j.BlurSize=i or 32
j.Color=Color3.fromRGB(0,0,0)
j.Parent=g
end)
end

local function makeDraggable(g,h)
local i,j,k=false
g.InputBegan:Connect(function(l)
if l.UserInputType==Enum.UserInputType.MouseButton1 or l.UserInputType==Enum.UserInputType.Touch then
i,j,k=true,l.Position,h.Position
l.Changed:Connect(function()
if l.UserInputState==Enum.UserInputState.End then i=false end
end)
end
end)
e.InputChanged:Connect(function(l)
if i and(l.UserInputType==Enum.UserInputType.MouseMovement or l.UserInputType==Enum.UserInputType.Touch)then
local m=l.Position-j
h.Position=UDim2.new(k.X.Scale,k.X.Offset+m.X,k.Y.Scale,k.Y.Offset+m.Y)
end
end)
end

local function ripple(g)
g.ClipsDescendants=true
g.MouseButton1Down:Connect(function(h,i)
local j=Instance.new"Frame"
j.Name=c.GetStealthName()
j.AnchorPoint=Vector2.new(0.5,0.5)
j.BackgroundColor3=Color3.fromRGB(255,255,255)
j.BackgroundTransparency=0.8
j.Size=UDim2.fromOffset(8,8)
j.BorderSizePixel=0
j.Position=UDim2.fromOffset(h-g.AbsolutePosition.X,i-g.AbsolutePosition.Y)
corner(j,99)
j.Parent=g
local k=math.max(g.AbsoluteSize.X,g.AbsoluteSize.Y)*1.5
d(j,TweenInfo.new(0.45,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{Size=UDim2.fromOffset(k,k),BackgroundTransparency=1})
task.delay(0.5,function()pcall(function()j:Destroy()end)end)
end)
end

return{
guid=guid,
spawnCb=spawnCb,
corner=corner,
hairline=hairline,
pad=pad,
lighting=lighting,
topLight=topLight,
shadow=shadow,
makeDraggable=makeDraggable,
ripple=ripple,
}end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()


local b=a.a()

local c={
home="rbxassetid://10723407389",
settings="rbxassetid://10734950309",
settings2="rbxassetid://10734950020",
search="rbxassetid://10734943674",
eye="rbxassetid://10723346959",
eyeoff="rbxassetid://10723346871",
shield="rbxassetid://10734951847",
shieldcheck="rbxassetid://10734951367",
key="rbxassetid://10723416652",
keyboard="rbxassetid://10723416765",
lock="rbxassetid://10723434711",
unlock="rbxassetid://10747366027",
menu="rbxassetid://10734887784",
command="rbxassetid://10709811365",
chevron="rbxassetid://10709790948",
x="rbxassetid://10747384394",
check="rbxassetid://10709790644",
swords="rbxassetid://10734975692",
sword="rbxassetid://10734975486",
crosshair="rbxassetid://10709818534",
target="rbxassetid://10734977012",
gamepad="rbxassetid://10723395215",
globe="rbxassetid://10723404337",
user="rbxassetid://10747373176",
users="rbxassetid://10747373426",
box="rbxassetid://10709782497",
layers="rbxassetid://10723424505",
dashboard="rbxassetid://10723424646",
sliders="rbxassetid://10734963400",
activity="rbxassetid://10709752035",
bell="rbxassetid://10709775704",
bellring="rbxassetid://10709775560",
clock="rbxassetid://10709805144",
ghost="rbxassetid://10723396107",
palette="rbxassetid://10734910430",
paintbrush="rbxassetid://10734910187",
terminal="rbxassetid://10734982144",
save="rbxassetid://10734941499",
trash="rbxassetid://10747362241",
gauge="rbxassetid://10723395708",
star="rbxassetid://10734966248",
crown="rbxassetid://10709818626",
wrench="rbxassetid://10747383470",
info="rbxassetid://10723415903",
volume="rbxassetid://10747375679",
volumex="rbxassetid://10747375880",
move="rbxassetid://10734900011",
history="rbxassetid://10723407335",
mouse="rbxassetid://10734898355",
}

local d={
main="dashboard",combat="swords",visuals="eye",esp="eye",
aim="crosshair",aimbot="crosshair",movement="move",player="user",
world="globe",misc="box",config="save",profiles="save",
themes="paintbrush",theme="paintbrush",console="terminal",log="terminal",
keybinds="keyboard",premium="crown",home="home",settings="settings",
performance="gauge",notifications="bell",
}

local function defaultColor()
if b.Theme and b.Theme.Dim then return b.Theme.Dim end
return Color3.fromRGB(142,150,171)
end

local function makeIcon(e,f,g)
local h=string.lower(e or"")
h=d[h]or h
local i=c[h]
g=g or defaultColor()
if i then
local j=Instance.new"ImageLabel"
j.BackgroundTransparency=1
j.Size=UDim2.fromOffset(f,f)
j.Image=i
j.ImageColor3=g
j.ScaleType=Enum.ScaleType.Fit
return j
end
local j=Instance.new"TextLabel"
j.BackgroundTransparency=1
j.Size=UDim2.fromOffset(f,f)
j.Font=Enum.Font.GothamBold
j.TextSize=math.clamp(f-2,10,16)
j.TextColor3=g
j.Text=string.upper(string.sub(e or"?",1,1))
return j
end

return{Icons=c,IconAlias=d,makeIcon=makeIcon}end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()


local b=a.a()
local c=a.b()

b.Sound=b.Sound or{
Enabled=true,
Volume=0.4,
Ids={
Click="rbxassetid://6042053626",
Hover="rbxassetid://6042054037",
On="rbxassetid://6324790483",
Off="rbxassetid://6052548458",
Notify="rbxassetid://6979299092",
Swap="rbxassetid://6042054037",
Error="rbxassetid://6052548458",
Open="rbxassetid://6324790483",
},
_cache={},
}

local d=b.Sound

local function Set(e)
for f,g in pairs(e or{})do d.Ids[f]=g end
end
d.Set=d.Set or Set

local function sfx(e)
if not d.Enabled then return end
local f=d.Ids[e]
if not f or f==""then return end
task.spawn(function()
pcall(function()
local g=b._gui or c.GetRoot()
local h=d._cache[e]
if not h or not h.Parent then
h=Instance.new"Sound"
h.Name=c.GetStealthName()
h.SoundId=f
h.Volume=d.Volume
h.Parent=g
d._cache[e]=h
end
h.Volume=d.Volume
if h.SoundId~=f then h.SoundId=f end
h:Play()
end)
end)
end

return{Sound=d,sfx=sfx}end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()


local b=a.a()

b.FontPacks={
["Gotham+"]={Black="GothamBlack",Bold="GothamBold",
Title="GothamBold",Body="Gotham",Mono="Code",
Bump={Title=1,Bold=1}},
Gotham={Black="GothamBlack",Bold="GothamBold",
Title="GothamMedium",Body="Gotham",Mono="Code"},
Builder={Black="BuilderSansExtraBold",Bold="BuilderSansBold",
Title="BuilderSansBold",Body="BuilderSans",Mono="RobotoMono"},
Arimo={Black="ArimoBold",Bold="ArimoBold",
Title="ArimoBold",Body="Arimo",Mono="RobotoMono"},
Source={Black="SourceSansBold",Bold="SourceSansBold",
Title="SourceSansSemibold",Body="SourceSans",Mono="RobotoMono"},
Cartoon={Black="Cartoon",Bold="Cartoon",
Title="Cartoon",Body="Cartoon",Mono="Code",
Bump={Title=1}},
Arcade={Black="Arcade",Bold="Arcade",
Title="Arcade",Body="Arcade",Mono="Code"},
SciFi={Black="SciFi",Bold="SciFi",
Title="SciFi",Body="SciFi",Mono="Code"},
Fantasy={Black="Fantasy",Bold="Fantasy",
Title="Fantasy",Body="Fantasy",Mono="Code"},
Highway={Black="Highway",Bold="Highway",
Title="Highway",Body="Highway",Mono="Code",
Bump={Title=2,Bold=1}},
}

b._roleFromDefault={
[Enum.Font.GothamBlack]="Black",
[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",
[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

local function resolveFont(c)
local d,e=pcall(function()return Enum.Font[c]end)
if d and e then return e end
return nil
end

local function paintFonts(c)
local d=b.FontPacks[b.FontPack]
if not d then return end
for e,f in ipairs(c:GetDescendants())do
if f:IsA"TextLabel"or f:IsA"TextButton"or f:IsA"TextBox"then
local g=f:GetAttribute"KronosFontRole"
if not g then
g=b._roleFromDefault[f.Font]or"Body"
f:SetAttribute("KronosFontRole",g)
f:SetAttribute("KronosBaseSize",f.TextSize)
end
local h=f:GetAttribute"KronosBaseSize"or f.TextSize
local i=(d.Bump and d.Bump[g])or 0
local j=d[g]and resolveFont(d[g])or nil
pcall(function()
if j then f.Font=j end
f.TextSize=math.clamp(h+i,8,30)
end)
end
end
end

local function SetFontPack(c)
if not b.FontPacks[c]then return end
b.FontPack=c
if b._gui then paintFonts(b._gui)end
end

local function RefreshFonts()
if b._gui then paintFonts(b._gui)end
end

return{
FontPacks=b.FontPacks,
resolveFont=resolveFont,
paintFonts=paintFonts,
SetFontPack=SetFontPack,
RefreshFonts=RefreshFonts,
}end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()


local b=a.a()

b.Themes={
Dark={
Bg=Color3.fromRGB(5,7,12),Surface=Color3.fromRGB(12,16,26),
Surface2=Color3.fromRGB(23,29,44),Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(142,150,171),Accent=Color3.fromRGB(91,140,255),
Accent2=Color3.fromRGB(155,109,255),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Midnight={
Bg=Color3.fromRGB(3,4,8),Surface=Color3.fromRGB(8,11,18),
Surface2=Color3.fromRGB(17,22,35),Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(120,130,150),Accent=Color3.fromRGB(91,140,255),
Accent2=Color3.fromRGB(142,91,255),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Light={
Bg=Color3.fromRGB(242,243,245),Surface=Color3.fromRGB(255,255,255),
Surface2=Color3.fromRGB(235,237,241),Text=Color3.fromRGB(20,24,32),
Dim=Color3.fromRGB(110,118,132),Accent=Color3.fromRGB(70,100,230),
Accent2=Color3.fromRGB(139,92,246),Success=Color3.fromRGB(16,150,100),
Warn=Color3.fromRGB(180,120,10),Danger=Color3.fromRGB(210,60,60),
},
Rose={
Bg=Color3.fromRGB(14,8,12),Surface=Color3.fromRGB(24,14,20),
Surface2=Color3.fromRGB(36,22,30),Text=Color3.fromRGB(250,240,244),
Dim=Color3.fromRGB(160,130,145),Accent=Color3.fromRGB(251,113,160),
Accent2=Color3.fromRGB(244,63,94),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Indigo={
Bg=Color3.fromRGB(8,10,20),Surface=Color3.fromRGB(14,16,32),
Surface2=Color3.fromRGB(22,26,48),Text=Color3.fromRGB(238,240,252),
Dim=Color3.fromRGB(135,142,175),Accent=Color3.fromRGB(129,140,248),
Accent2=Color3.fromRGB(167,139,250),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Forest={
Bg=Color3.fromRGB(6,12,9),Surface=Color3.fromRGB(12,20,15),
Surface2=Color3.fromRGB(20,32,24),Text=Color3.fromRGB(238,246,240),
Dim=Color3.fromRGB(125,150,135),Accent=Color3.fromRGB(52,211,153),
Accent2=Color3.fromRGB(110,231,183),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Amber={
Bg=Color3.fromRGB(13,10,6),Surface=Color3.fromRGB(22,17,10),
Surface2=Color3.fromRGB(34,27,16),Text=Color3.fromRGB(250,244,232),
Dim=Color3.fromRGB(160,142,115),Accent=Color3.fromRGB(251,191,36),
Accent2=Color3.fromRGB(249,115,22),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Ocean={
Bg=Color3.fromRGB(5,11,15),Surface=Color3.fromRGB(10,19,26),
Surface2=Color3.fromRGB(17,30,40),Text=Color3.fromRGB(236,246,250),
Dim=Color3.fromRGB(120,150,165),Accent=Color3.fromRGB(34,211,238),
Accent2=Color3.fromRGB(59,130,246),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Crimson={
Bg=Color3.fromRGB(13,6,8),Surface=Color3.fromRGB(22,11,14),
Surface2=Color3.fromRGB(34,18,22),Text=Color3.fromRGB(250,238,240),
Dim=Color3.fromRGB(165,128,134),Accent=Color3.fromRGB(248,113,113),
Accent2=Color3.fromRGB(220,38,38),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Ghost={
Bg=Color3.fromRGB(10,10,14),Surface=Color3.fromRGB(18,18,26),
Surface2=Color3.fromRGB(28,28,40),Text=Color3.fromRGB(242,242,248),
Dim=Color3.fromRGB(140,140,160),Accent=Color3.fromRGB(167,139,250),
Accent2=Color3.fromRGB(103,232,249),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Cyberpunk={
Bg=Color3.fromRGB(10,8,4),Surface=Color3.fromRGB(18,15,8),
Surface2=Color3.fromRGB(30,25,12),Text=Color3.fromRGB(255,246,220),
Dim=Color3.fromRGB(165,150,105),Accent=Color3.fromRGB(254,231,21),
Accent2=Color3.fromRGB(255,45,120),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Terminal={
Bg=Color3.fromRGB(2,6,3),Surface=Color3.fromRGB(4,12,6),
Surface2=Color3.fromRGB(8,22,11),Text=Color3.fromRGB(200,255,210),
Dim=Color3.fromRGB(90,140,100),Accent=Color3.fromRGB(57,255,120),
Accent2=Color3.fromRGB(20,200,90),Success=Color3.fromRGB(57,255,120),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(248,113,113),
},
Discord={
Bg=Color3.fromRGB(30,31,34),Surface=Color3.fromRGB(43,45,49),
Surface2=Color3.fromRGB(49,51,56),Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(148,155,164),Accent=Color3.fromRGB(88,101,242),
Accent2=Color3.fromRGB(235,69,158),Success=Color3.fromRGB(87,242,135),
Warn=Color3.fromRGB(254,231,92),Danger=Color3.fromRGB(237,66,69),
},
Mono={
Bg=Color3.fromRGB(0,0,0),Surface=Color3.fromRGB(12,12,12),
Surface2=Color3.fromRGB(26,26,26),Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(140,140,140),Accent=Color3.fromRGB(240,240,240),
Accent2=Color3.fromRGB(160,160,160),Success=Color3.fromRGB(220,220,220),
Warn=Color3.fromRGB(180,180,180),Danger=Color3.fromRGB(120,120,120),
},
Kronos={
Bg=Color3.fromRGB(4,4,7),Surface=Color3.fromRGB(10,10,15),
Surface2=Color3.fromRGB(20,21,30),Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(150,155,172),Accent=Color3.fromRGB(232,236,245),
Accent2=Color3.fromRGB(148,156,178),OnAccent=Color3.fromRGB(11,13,18),
Success=Color3.fromRGB(52,211,153),Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
},
}

if not b.Theme then
b.ThemeName="Dark"
b.Theme=b.Themes.Dark
end

local function tag(c,d,e)
table.insert(b._tags,{obj=c,prop=d,key=e})
pcall(function()c[d]=b.Theme[e]end)
return c
end

local function SetTheme(c)
local d=b.Themes[c]
if not d then return end
b.ThemeName,b.Theme=c,d
for e,f in ipairs(b._tags)do
if f.obj and f.obj.Parent then
pcall(function()f.obj[f.prop]=d[f.key]end)
end
end
for e,f in ipairs(b._gradients)do
if f and f.Parent then
pcall(function()
f.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,d.Accent),
ColorSequenceKeypoint.new(1,d.Accent2 or d.Accent),
}
end)
end
end
local e=d.OnAccent or Color3.fromRGB(255,255,255)
for f,g in ipairs(b._onAccent)do
if g and g.Parent then pcall(function()g.TextColor3=e end)end
end
end

local function oa(c)
c.TextColor3=b.Theme.OnAccent or Color3.fromRGB(255,255,255)
table.insert(b._onAccent,c)
return c
end

local function agrad(c,d)
c.BackgroundColor3=Color3.fromRGB(255,255,255)
local e=Instance.new"UIGradient"
e.Rotation=d or 15
e.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,b.Theme.Accent),
ColorSequenceKeypoint.new(1,b.Theme.Accent2 or b.Theme.Accent),
}
e.Parent=c
table.insert(b._gradients,e)
return e
end

local function SetAccent(c)
if typeof(c)~="Color3"then return end
b.Themes[b.ThemeName].Accent=c
SetTheme(b.ThemeName)
end

return{
Themes=b.Themes,
tag=tag,
SetTheme=SetTheme,
oa=oa,
agrad=agrad,
SetAccent=SetAccent,
}end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()






local b=a.a()

local function SetAcrylic(c)
b._acrylicOn=c and true or false
if b._blur then
pcall(function()b._blur:Destroy()end)
b._blur=nil
end
end

local function ToggleAcrylic(c)
SetAcrylic(c)
end

return{SetAcrylic=SetAcrylic,ToggleAcrylic=ToggleAcrylic}end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()


local b=a.a()
local c=a.b()

local d=c.cloneref_check(game:GetService"HttpService")

local function Save(e,f)
f=f or"default"
local g={}
for h,i in pairs(b.Flags)do
if string.sub(h,1,8)~="_loaded_"then
if typeof(i)=="Color3"then
g[h]={"__c3",i.R,i.G,i.B}
elseif typeof(i)=="EnumItem"then
g[h]={"__k",i.Name}
else
local j=pcall(function()d:JSONEncode(i)end)
if j then g[h]=i end
end
end
end
pcall(function()
local h=c.hasFn
local i=h"makefolder"
local j=h"isfolder"
local k=h"writefile"
local l="Kronos/"..tostring(e._cfgTitle or"Kronos")
if i and j and not j(l)then i(l)end
if k then k(l.."/"..f..".json",d:JSONEncode(g))end
end)
e:Notify{Title="Config saved",Content=f,Duration=2}
end

local function Load(e,f)
f=f or"default"
local g
pcall(function()
local h=c.hasFn
local i=h"readfile"
local j=h"isfile"
local k="Kronos/"..tostring(e._cfgTitle or"Kronos")
if i and j and j(k.."/"..f..".json")then
g=i(k.."/"..f..".json")
end
end)
if not g then
e:Notify{Title="No config",Content=f,Duration=2}
return
end
local h,i=pcall(function()return d:JSONDecode(g)end)
if not h or type(i)~="table"then return end
for j,k in pairs(i)do
local l=k
if type(k)=="table"and k[1]=="__c3"then
l=Color3.new(k[2],k[3],k[4])
elseif type(k)=="table"and k[1]=="__k"then
l=k[2]
end
b.Flags[j]=l
local m=b._live[j]
if m then
for n,o in ipairs(m)do pcall(o,l,true)end
else
b.Flags["_loaded_"..j]=l
end
end
e:Notify{Title="Config loaded",Content=f,Duration=2}
end

return{Save=Save,Load=Load}end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()



local b=a.a()
local c=a.c()
local d=a.d()
local e=a.e()a.h()a.f()


local f=a.b()

local g=b
local h=c.T
local i=c.tween local j=
d.guid local k=
d.spawnCb local l=
d.corner local m=
d.hairline local n=
d.pad local o=
d.lighting local p=
d.ripple
local q=e.makeIcon
f.cloneref_check(game:GetService"RunService")
f.cloneref_check(game:GetService"UserInputService")

return function(r,s)local t=
r.row local u=
r.titleBlock
local v=r.reg
local w=r.tab local x=
r.Window
local y=r.Th local z=
r.opts or{}
local A=r.page
if type(s)=="string"then s={Title=s}end s=s or{}
local B=s.Open
if B==nil then B=s.DefaultOpen~=false end
local C=Instance.new"Frame"C.BackgroundTransparency=1
C.Size=UDim2.new(1,-4,0,22)C.Parent=A
local D=Instance.new"TextLabel"D.BackgroundTransparency=1
D.Position=UDim2.new(0,0,0,0)D.Size=UDim2.new(1,-22,1,0)
D.Font=Enum.Font.GothamBold D.TextSize=10
D.TextXAlignment=0 D.Text="  "..string.upper(s.Title or"SECTION")D.Parent=C
g:_tag(D,"TextColor3","Dim")
local E={}
local F
local G
local function apply()
local H=B
for I,J in ipairs(w.Elements)do
if I>F then
if J._break then break end
if J.Frame and J.Frame.Parent==A then
J.Frame.Visible=H and(J._searchVisible~=false)
end
end
end
if G and G:IsA"GuiObject"then
i(G,h.Fast,{Rotation=H and 0 or-90})
end
end
function E.Set(H,I)B=I and true or false apply()end
function E.Get(H)return B end
function E.Toggle(H)E:Set(not B)end
G=nil
if s.Collapsible~=false then
local H=Instance.new"TextButton"H.Text=""
H.Size=UDim2.fromScale(1,1)H.BackgroundTransparency=1 H.Parent=C
G=q("chevron",13,y.Dim)
G.AnchorPoint=Vector2.new(1,0.5)G.Position=UDim2.new(1,-2,0.5,0)
G.Parent=C
H.MouseButton1Click:Connect(function()
g:_sfx"Click"E:Toggle()
end)
else
G=nil
end
local H={Title=s.Title,Frame=C,_handle=E,_break=true}
v(H)
F=#w.Elements
H._refreshSection=apply
if not B then apply()end
return E
end end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()




local b=a.a()
local c=a.c()
local d=a.d()
local e=a.e()a.h()a.f()


local f=a.b()

local g=b local h=
c.T local i=
c.tween local p=
d.guid local q=
d.spawnCb local r=
d.corner local s=
d.hairline local v=
d.pad local w=
d.lighting local y=
d.ripple local z=
e.makeIcon
f.cloneref_check(game:GetService"RunService")
f.cloneref_check(game:GetService"UserInputService")

return function(A,B)local C=
A.row local D=
A.titleBlock
local E=A.reg local F=
A.tab local G=
A.Window local H=
A.Th local I=
A.opts or{}
if type(B)=="string"then B={Text=B}end B=B or{}
local J=Instance.new"TextLabel"J.BackgroundTransparency=1
J.Size=UDim2.new(1,-4,0,22)J.Font=Enum.Font.Gotham J.TextSize=12
J.TextXAlignment=0 J.TextWrapped=true J.Text=B.Text or"Label"J.Parent=page
g:_tag(J,"TextColor3","Dim")
return E{Title=B.Text,Frame=J,_handle=J}
end end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()




local b=a.a()
local c=a.c()
local d=a.d()
local e=a.e()a.h()a.f()


local f=a.b()

local g=b local z=
c.T local A=
c.tween local B=
d.guid local E=
d.spawnCb local I=
d.corner local J=
d.hairline local K=
d.pad local L=
d.lighting local M=
d.ripple local N=
e.makeIcon
f.cloneref_check(game:GetService"RunService")
f.cloneref_check(game:GetService"UserInputService")

return function(O,P)local Q=
O.row local R=
O.titleBlock
local S=O.reg local T=
O.tab local U=
O.Window local V=
O.Th local W=
O.opts or{}
if type(P)=="string"then P={Text=P}end P=P or{}
local X=Instance.new"Frame"X.BackgroundTransparency=1
X.Size=UDim2.new(1,-4,0,P.Text and 20 or 12)X.Parent=page
local function hair(Y,Z,_)
local aa=Instance.new"Frame"aa.BorderSizePixel=0
aa.AnchorPoint=Vector2.new(0,0.5)aa.Position=UDim2.new(Z,0,0.5,0)
aa.Size=UDim2.new(_,0,0,1)aa.BackgroundColor3=Color3.fromRGB(255,255,255)
aa.BackgroundTransparency=0.93 aa.Parent=X
end
if P.Text and P.Text~=""then
local aa=24+3.5*string.len(P.Text)
local Y=Instance.new"TextLabel"Y.BackgroundTransparency=1
Y.AnchorPoint=Vector2.new(0.5,0.5)Y.Position=UDim2.new(0.5,0,0.5,0)
Y.Size=UDim2.new(0,aa*2,0,14)
Y.Font=Enum.Font.GothamBold Y.TextSize=10
Y.Text=string.upper(P.Text)Y.Parent=X
g:_tag(Y,"TextColor3","Dim")
local Z=Instance.new"Frame"Z.BorderSizePixel=0
Z.AnchorPoint=Vector2.new(0,0.5)Z.Position=UDim2.new(0,0,0.5,0)
Z.Size=UDim2.new(0.5,-aa,0,1)
Z.BackgroundColor3=Color3.fromRGB(255,255,255)
Z.BackgroundTransparency=0.93 Z.Parent=X
local _=Instance.new"Frame"_.BorderSizePixel=0
_.AnchorPoint=Vector2.new(1,0.5)_.Position=UDim2.new(1,0,0.5,0)
_.Size=UDim2.new(0.5,-aa,0,1)
_.BackgroundColor3=Color3.fromRGB(255,255,255)
_.BackgroundTransparency=0.93 _.Parent=X
else
hair(0,0,1)
end
return S{Title=P.Text,Frame=X,_handle=X,_break=true}
end end function a.m():typeof(__modImpl())local aa=a.cache.m if not aa then aa={c=__modImpl()}a.cache.m=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local b=a.c()
local c=a.d()
local d=a.e()a.h()a.f()


local e=a.b()

local f=aa
local g=b.T
local N=b.tween local O=
c.guid local P=
c.spawnCb
local S=c.corner local W=
c.hairline local X=
c.pad local Y=
c.lighting local Z=
c.ripple local _=
d.makeIcon
e.cloneref_check(game:GetService"RunService")
e.cloneref_check(game:GetService"UserInputService")

return function(ab,ac)
local ad=ab.row
local ae=ab.titleBlock
local af=ab.reg local ag=
ab.tab local ah=
ab.Window
local ai=ab.Th local aj=
ab.opts or{}
ac=ac or{}
local ak=ac.Max or 100
local al=ac.Value or 0
local am=ad(48)
ae(am,ac.Title or"Progress",ac.Description,90,true)
local an=Instance.new"TextLabel"an.BackgroundTransparency=1
an.AnchorPoint=Vector2.new(1,0)an.Position=UDim2.new(1,-12,0,7)
an.Size=UDim2.new(0,60,0,17)an.Font=Enum.Font.GothamBold
an.TextSize=11 an.TextXAlignment=1 an.Parent=am
f:_tag(an,"TextColor3","Dim")
local ao=Instance.new"Frame"ao.Position=UDim2.new(0,12,0,30)
ao.Size=UDim2.new(1,-24,0,6)ao.BackgroundColor3=ai.Surface2
ao.BorderSizePixel=0 S(ao,99)ao.Parent=am
f:_tag(ao,"BackgroundColor3","Surface2")
local ap=Instance.new"Frame"ap.BorderSizePixel=0
ap.Size=UDim2.new(0,0,1,0)S(ap,99)ap.Parent=ao
f:agrad(ap,0)
local aq=Instance.new"UIGradient"aq.Rotation=0
aq.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.7),
NumberSequenceKeypoint.new(0.5,0.9),
NumberSequenceKeypoint.new(1,0.7),
}
aq.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
aq.Parent=ap
local ar={}
function ar.Set(as,at)
al=math.clamp(tonumber(at)or 0,0,ak)
local au=al/ak
N(ap,g.Med,{Size=UDim2.new(au,0,1,0)})
an.Text=math.round(au*100).."%"
end
function ar.Get(as)return al end
ar:Set(al)
return af{Title=ac.Title,Frame=am,_handle=ar}
end end function a.n():typeof(__modImpl())local aa=a.cache.n if not aa then aa={c=__modImpl()}a.cache.n=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local ai=
ab.T local aj=
ab.tween local ak=
ac.guid local al=
ac.spawnCb
local am=ac.corner
local an=ac.hairline
local ao=ac.pad local ap=
ac.lighting local aq=
ac.ripple local ar=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(as,at)
local au=as.row local b=
as.titleBlock
local c=as.reg local d=
as.tab local e=
as.Window
local f=as.Th local g=
as.opts or{}
at=at or{}
local N=au(150)
local S=Instance.new"TextLabel"S.BackgroundTransparency=1
S.Position=UDim2.new(0,12,0,6)S.Size=UDim2.new(1,-100,0,16)
S.Font=Enum.Font.GothamMedium S.TextSize=12 S.TextXAlignment=0
S.Text=at.Title or"Log"S.Parent=N
af:_tag(S,"TextColor3","Text")
local _=Instance.new"TextButton"_.Text=""
_.AnchorPoint=Vector2.new(1,0)_.Position=UDim2.new(1,-10,0,6)
_.Size=UDim2.new(0,52,0,18)_.BackgroundColor3=f.Surface2
_.BorderSizePixel=0 am(_,6)_.AutoButtonColor=false _.Parent=N
an(_,true)
af:_tag(_,"BackgroundColor3","Surface2")
local av=Instance.new"TextLabel"av.BackgroundTransparency=1
av.Size=UDim2.fromScale(1,1)av.Font=Enum.Font.GothamBold
av.TextSize=10 av.Text="CLEAR"av.Parent=_
af:_tag(av,"TextColor3","Dim")
local aw=Instance.new"ScrollingFrame"
aw.Position=UDim2.new(0,10,0,28)aw.Size=UDim2.new(1,-20,1,-36)
aw.BackgroundColor3=f.Bg aw.BorderSizePixel=0
aw.ScrollBarThickness=2 aw.CanvasSize=UDim2.new(0,0,0,0)
aw.AutomaticCanvasSize=Enum.AutomaticSize.Y am(aw,6)aw.Parent=N
af:_tag(aw,"BackgroundColor3","Bg")
af:_tag(aw,"ScrollBarImageColor3","Surface2")
local ax=Instance.new"UIListLayout"ax.Padding=UDim.new(0,1)
ax.SortOrder=Enum.SortOrder.LayoutOrder ax.Parent=aw
ao(aw,4,4,6,6)
local ay={}
function ay.Add(az,aA,aB)
local aC=tostring(aA)
if at.Stamp~=false then aC="["..os.date"%H:%M:%S".."] "..aC end
local aD=Instance.new"TextLabel"aD.BackgroundTransparency=1
aD.Size=UDim2.new(1,-4,0,14)aD.Font=Enum.Font.Code aD.TextSize=11
aD.TextXAlignment=0 aD.TextTruncate=Enum.TextTruncate.AtEnd
aD.Text=aC aD.Parent=aw
if typeof(aB)=="Color3"then aD.TextColor3=aB
else af:_tag(aD,"TextColor3","Dim")end
task.defer(function()
pcall(function()aw.CanvasPosition=Vector2.new(0,aw.AbsoluteCanvasSize.Y)end)
end)
end
function ay.Clear(az)
for aA,aB in ipairs(aw:GetChildren())do
if aB:IsA"TextLabel"then pcall(function()aB:Destroy()end)end
end
end
_.MouseButton1Click:Connect(function()ay:Clear()end)
for az,aA in ipairs(at.Lines or{})do ay:Add(aA)end
return c{Title=at.Title,Frame=N,_handle=ay}
end end function a.o():typeof(__modImpl())local aa=a.cache.o if not aa then aa={c=__modImpl()}a.cache.o=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween local ao=
ac.guid
local ar=ac.spawnCb
local as=ac.corner
local at=ac.hairline local au=
ac.pad local av=
ac.lighting
local aw=ac.ripple local ax=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(ay,az)
local aA=ay.row
local aB=ay.titleBlock
local aC=ay.reg
local aD=ay.tab
local c=ay.Window
local f=ay.Th local g=
ay.opts or{}
az=az or{}
local N=aA(az.Description and 54 or 40)
aB(N,az.Title or"Button",az.Description,90)
local S=Instance.new"TextButton"S.Text=""
S.Size=UDim2.fromScale(1,1)S.BackgroundTransparency=1
S.Parent=N as(S,10)
local _=Instance.new"Frame"_.AnchorPoint=Vector2.new(1,0.5)
_.Position=UDim2.new(1,-12,0.5,0)_.Size=UDim2.fromOffset(62,28)
_.BackgroundColor3=f.Surface2 _.BorderSizePixel=0
as(_,7)_.Parent=N
at(_,true)
af:_tag(_,"BackgroundColor3","Surface2")
local aE=Instance.new"TextLabel"aE.Size=UDim2.fromScale(1,1)
aE.BackgroundTransparency=1 aE.Font=Enum.Font.GothamBold aE.TextSize=11
aE.Text="RUN"aE.Parent=_
af:_tag(aE,"TextColor3","Dim")
local aF=Instance.new"UIScale"aF.Parent=_
aw(S)
S.MouseButton1Down:Connect(function()an(aF,am.Hover,{Scale=0.93})end)
S.MouseButton1Up:Connect(function()an(aF,am.Spring,{Scale=1})end)
S.MouseEnter:Connect(function()af:_tag(aE,"TextColor3","Text")end)
S.MouseLeave:Connect(function()af:_tag(aE,"TextColor3","Dim")end)
local function fireBtn()
if c._activateTab then c._activateTab(aD,true)end
c:_flash(N)af:_sfx"Click"ar(az.Callback)ar(az.OnChanged)
end
S.MouseButton1Click:Connect(function()
af:_bumpRecent(aD.Title,az.Title or"Button",fireBtn)fireBtn()
end)
local aG={Title=az.Title,Frame=N,_handle=S}
aG._go=function()
af:_bumpRecent(aD.Title,az.Title or"Button",fireBtn)fireBtn()
end
return aC(aG)
end end function a.p():typeof(__modImpl())local aa=a.cache.p if not aa then aa={c=__modImpl()}a.cache.p=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween
local ar=ac.guid
local as=ac.spawnCb
local at=ac.corner
local aw=ac.hairline local ax=
ac.pad local ay=
ac.lighting local az=
ac.ripple local aA=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local aB=ae.cloneref_check(game:GetService"UserInputService")

return function(aC,aD)
local aE=aC.row
local aF=aC.titleBlock
local aG=aC.reg
local c=aC.tab
local f=aC.Window
local g=aC.Th local N=
aC.opts or{}
aD=aD or{}
local S=aD.Value~=nil and aD.Value or(aD.Default or false)
local _=aE(aD.Description and 54 or 40)
aF(_,aD.Title or"Toggle",aD.Description,70)
local aH,aI,aJ=40,22,16
local aK=Instance.new"TextButton"aK.Text=""
aK.AnchorPoint=Vector2.new(1,0.5)aK.Position=UDim2.new(1,-12,0.5,0)
aK.Size=UDim2.fromOffset(aH,aI)aK.BorderSizePixel=0
aK.BackgroundColor3=g.Surface2 aK.AutoButtonColor=false aK.Parent=_
at(aK,99)
aw(aK,true)
af:_tag(aK,"BackgroundColor3","Surface2")

local aL=Instance.new"Frame"aL.BorderSizePixel=0
aL.Size=UDim2.new(1,0,1,0)aL.BackgroundTransparency=1
at(aL,99)aL.Parent=aK
af:agrad(aL,0)
local aM=Instance.new"Frame"aM.Size=UDim2.fromOffset(aJ,aJ)
aM.AnchorPoint=Vector2.new(0,0.5)aM.BorderSizePixel=0
aM.BackgroundColor3=Color3.fromRGB(255,255,255)
at(aM,99)aM.Parent=aK
local aN=Instance.new"UIScale"aN.Parent=aM
local aO=ar()
local function paint(aP)
an(aL,aP and am.Med or TweenInfo.new(0),
{BackgroundTransparency=S and 0 or 1})
local aQ=aP and am.Spring or TweenInfo.new(0)
an(aM,aQ,{Position=S and UDim2.new(1,-aJ-3,0.5,0)
or UDim2.new(0,3,0.5,0)})


an(aM,aP and am.Med or TweenInfo.new(0),
{BackgroundColor3=S and g.Accent or Color3.fromRGB(255,255,255)})
end
aM.Position=S and UDim2.new(1,-aJ-3,0.5,0)or UDim2.new(0,3,0.5,0)
aM.BackgroundColor3=S and g.Accent or Color3.fromRGB(255,255,255)
paint(false)
local aP={}
function aP.Set(aQ,aR,aS)
S=aR and true or false paint(true)
if aD.Flag then af.Flags[aD.Flag]=S end
if not aS then af:_sfx(S and"On"or"Off")as(aD.Callback,S)as(aD.OnChanged,S)end
end
function aP.Get(aQ)return S end

local aQ,aR,aS=0,false
c._window:Track(aK.InputBegan:Connect(function(aT)
if aT.UserInputType~=Enum.UserInputType.MouseButton1 and aT.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=aO then return end
af.CurrentInput=aO
aS,aQ,aR=aT.Position,aM.Position.X.Offset,false
an(aN,am.Hover,{Scale=1.25})
end))
c._window:Track(aB.InputChanged:Connect(function(aT)
if af.CurrentInput~=aO or not aS then return end
if aT.UserInputType~=Enum.UserInputType.MouseMovement and aT.UserInputType~=Enum.UserInputType.Touch then return end
local aU=aT.Position.X-aS.X
if math.abs(aU)>8 then aR=true end
if aR then
local aV=math.clamp(aQ+aU,3,aH-aJ-3)
aM.Position=UDim2.new(0,aV,0.5,0)
end
end))
local function fireTg()
if f._activateTab then f._activateTab(c,true)end
f:_flash(_)aP:Set(not aP:Get())
end
c._window:Track(aB.InputEnded:Connect(function(aT)
if af.CurrentInput~=aO then return end
if aT.UserInputType~=Enum.UserInputType.MouseButton1 and aT.UserInputType~=Enum.UserInputType.Touch then return end
af.CurrentInput,aS=nil,nil
an(aN,am.Hover,{Scale=1})
if not aR then aP:Set(not S)
else
local aU=aM.Position.X.Offset+aJ/2
aP:Set(aU>aH/2)
end
af:_bumpRecent(c.Title,aD.Title or"Toggle",fireTg)
end))
local aT={Title=aD.Title,Frame=_,Value=S,Flag=aD.Flag,_handle=aP,
_set=function(aT,aU)aP:Set(aT and true or false,aU)end}
aT._go=function()
af:_bumpRecent(c.Title,aD.Title or"Toggle",fireTg)fireTg()
end
return aG(aT)
end end function a.q():typeof(__modImpl())local aa=a.cache.q if not aa then aa={c=__modImpl()}a.cache.q=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween
local ar=ac.guid
local as=ac.spawnCb
local at=ac.corner
local aw=ac.hairline local aA=
ac.pad local aB=
ac.lighting local aC=
ac.ripple local aD=
ad.makeIcon
local aE=ae.cloneref_check(game:GetService"RunService")
local aF=ae.cloneref_check(game:GetService"UserInputService")

return function(aG,aH)
local aI=aG.row
local aJ=aG.titleBlock
local aK=aG.reg
local aL=aG.tab local aM=
aG.Window
local aN=aG.Th local aO=
aG.opts or{}
local aP=aG.page
aH=aH or{}
local aQ=aH.Min or(aH.Range and aH.Range[1])or 0
local aR=aH.Max or(aH.Range and aH.Range[2])or 100
local aS=aH.Step or aH.Increment or 1
local aT=aH.Rounding or(aS%1~=0 and 2 or 0)
local aU=aH.Value~=nil and aH.Value or(aH.Default or aQ)
local function fmt(aV)return aT>0 and string.format("%."..aT.."f",aV)or tostring(math.round(aV))end
local aV=aI(aH.Description and 66 or 56)
aJ(aV,aH.Title or"Slider",aH.Description,90,true)
local c=Instance.new"TextBox"c.Text=fmt(aU)
c.Font=Enum.Font.GothamBold c.TextSize=11
c.AnchorPoint=Vector2.new(1,0)c.Position=UDim2.new(1,-12,0,6)
c.Size=UDim2.new(0,60,0,22)c.BackgroundColor3=aN.Surface2
c.BorderSizePixel=0 at(c,6)
af:_tag(c,"BackgroundColor3","Surface2")
af:_tag(c,"TextColor3","Text")
aw(c,true)
c.ClearTextOnFocus=false c.Parent=aV
local f=Instance.new"TextButton"f.Text=""f.AutoButtonColor=false
f.Position=UDim2.new(0,12,0,aH.Description and 48 or 36)f.Size=UDim2.new(1,-24,0,6)
f.BackgroundColor3=aN.Surface2 f.BorderSizePixel=0
at(f,99)f.Parent=aV
af:_tag(f,"BackgroundColor3","Surface2")
local g=Instance.new"Frame"g.BorderSizePixel=0
g.Size=UDim2.new(0,0,1,0)at(g,99)g.Parent=f
af:agrad(g,0)
local N=Instance.new"Frame"N.AnchorPoint=Vector2.new(0.5,0.5)
N.Size=UDim2.fromOffset(12,12)N.BackgroundColor3=Color3.fromRGB(255,255,255)
N.BorderSizePixel=0 at(N,99)N.Parent=f
local S=Instance.new"UIStroke"S.Thickness=1.5
S.Color=aN.Accent S.Transparency=0.35 S.Parent=N
af:_tag(S,"Color","Accent")


local _=ar()
local aW,aX,aY,aZ=false,false
local function alpha(a_)return math.clamp((a_-aQ)/math.max(1e-6,aR-aQ),0,1)end
local function render(a_)
local a0=alpha(aU)
an(g,a_ and am.Fill08 or TweenInfo.new(0),{Size=UDim2.new(a0,0,1,0)})
N.Position=UDim2.new(a0,0,0.5,0)
if c:IsFocused()==false then c.Text=fmt(aU)end
end
local a_={}
function a_.Set(a0,a1,a2)
a1=math.clamp(tonumber(a1)or aU,aQ,aR)
a1=math.round(a1/aS)*aS
if aT>0 then a1=tonumber(string.format("%."..aT.."f",a1))end
aU=a1 render(true)
if aH.Flag then af.Flags[aH.Flag]=aU end
if not a2 then as(aH.Callback,aU)as(aH.OnChanged,aU)end
end
function a_.Get(a0)return aU end
function a_.SetMax(a0,a1)aR=a1 a_:Set(aU,true)end
function a_.SetMin(a0,a1)aQ=a1 a_:Set(aU,true)end
render(false)
c.FocusLost:Connect(function()
local a0=tonumber(c.Text)
if a0 then a_:Set(a0)else c.Text=fmt(aU)end
end)
f.InputBegan:Connect(function(a0)
if aH.Locked then return end
if a0.UserInputType~=Enum.UserInputType.MouseButton1 and a0.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=_ then return end
af.CurrentInput,aW,aX=_,true,a0.UserInputType==Enum.UserInputType.Touch
aP.ScrollingEnabled=false
an(N,am.Hover,{Size=UDim2.fromOffset(16,16)})
local function fromX(a1)
local a2=math.clamp((a1-f.AbsolutePosition.X)/math.max(1,f.AbsoluteSize.X),0,1)
a_:Set(aQ+a2*(aR-aQ))
end
fromX(aX and a0.Position.X or aF:GetMouseLocation().X)
if aY then aY:Disconnect()end
aY=aE.RenderStepped:Connect(function()
if not aW then return end
if aL._window and aL._window._visible==false then return end
fromX(aF:GetMouseLocation().X)
end)
if aZ then aZ:Disconnect()end
aZ=aF.InputEnded:Connect(function(a1)
if(a1.UserInputType==Enum.UserInputType.MouseButton1 or a1.UserInputType==Enum.UserInputType.Touch)and aW then
aW=false
if aY then aY:Disconnect()aY=nil end
if aZ then aZ:Disconnect()aZ=nil end
af.CurrentInput=nil
aP.ScrollingEnabled=true
an(N,am.Hover,{Size=UDim2.fromOffset(12,12)})
as(aH.OnRelease,aU)
end
end)
end)
local a0={Title=aH.Title,Frame=aV,Value=aU,Flag=aH.Flag,_handle=a_,
_set=function(a0,a1)a_:Set(a0,a1)end}
return aK(a0)
end end function a.r():typeof(__modImpl())local aa=a.cache.r if not aa then aa={c=__modImpl()}a.cache.r=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween local ar=
ac.guid
local as=ac.spawnCb
local at=ac.corner
local aw=ac.hairline
local aD=ac.pad local aE=
ac.lighting local aF=
ac.ripple local aG=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(aH,aI)
local aJ=aH.row
local aK=aH.titleBlock
local aL=aH.reg local aN=
aH.tab local aO=
aH.Window
local aP=aH.Th local aQ=
aH.opts or{}
aI=aI or{}
local aR=aJ(aI.Description and 50 or 40)
aK(aR,aI.Title or"Input",nil,200)
local aS=Instance.new"TextBox"
aS.PlaceholderText=aI.Placeholder or"Type..."aS.PlaceholderColor3=aP.Dim
aS.Text=aI.Value or aI.Default or""
aS.Font=Enum.Font.Gotham aS.TextSize=12
aS.AnchorPoint=Vector2.new(1,0.5)aS.Position=UDim2.new(1,-12,0.5,0)
aS.Size=UDim2.new(0,170,0,28)aS.BackgroundColor3=aP.Surface2
aS.BorderSizePixel=0 at(aS,7)aS.ClearTextOnFocus=false aS.Parent=aR
aD(aS,4,4,8,8)
aw(aS,true)
af:_tag(aS,"BackgroundColor3","Surface2")
af:_tag(aS,"TextColor3","Text")
aS.Focused:Connect(function()
an(aS,am.Hover,{})
end)
aS.FocusLost:Connect(function(aT)
if aI.Flag then af.Flags[aI.Flag]=aS.Text end
as(aI.Callback,aS.Text)as(aI.OnChanged,aS.Text)
end)
return aL{Title=aI.Title,Frame=aR,_handle=aS}
end end function a.s():typeof(__modImpl())local aa=a.cache.s if not aa then aa={c=__modImpl()}a.cache.s=aa end return aa.c end end do local function __modImpl()




local aa=a.b()

local ab=aa.cloneref_check(game:GetService"UserInputService")

local ac={Backdrop=100,Popup=200,Toast=300}

local ad

local function open(ae)
if ad and ad~=ae then
local af=ad
ad=nil
pcall(af)
end
ad=ae
end

local function close(ae)
if ad==ae then ad=nil end
end

local function closeAny()
if ad then
local ae=ad
ad=nil
pcall(ae)
end
end

ab.InputBegan:Connect(function(ae,af)
if af then return end
if ae.KeyCode==Enum.KeyCode.Escape then closeAny()end
end)



local function backdrop(ae,af,am)
local an=Instance.new"TextButton"
an.Name=aa.GetStealthName()
an.Text=""
an.AutoButtonColor=false
an.Size=UDim2.fromScale(1,1)
an.BackgroundTransparency=1
an.BorderSizePixel=0
an.ZIndex=am or ac.Backdrop
an.Parent=ae
an.InputBegan:Connect(function(as)
if as.UserInputType==Enum.UserInputType.MouseButton1
or as.UserInputType==Enum.UserInputType.Touch then
af()
end
end)
return an
end

return{Z=ac,open=open,close=close,closeAny=closeAny,backdrop=backdrop}end function a.t():typeof(__modImpl())local aa=a.cache.t if not aa then aa={c=__modImpl()}a.cache.t=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()
local af=a.t()

local am=aa
local an=ab.T
local as=ab.tween local at=
ac.guid
local aw=ac.spawnCb
local aD=ac.corner
local aG=ac.hairline local aH=
ac.pad local aI=
ac.lighting local aJ=
ac.ripple
local aK=ad.makeIcon
local aL=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

local aP=170
local aQ=28
local aR=46
local aS=190

return function(aT,aU)
local aV=aT.row
local aW=aT.titleBlock
local aX=aT.reg
local aY=aT.tab
local aZ=aT.Window
local a_=aT.Th local a0=
aT.opts or{}local a1=
aT.page
local a2=aT.pgui
aU=aU or{}
local c=aU.Values or aU.Options or{}
local f=aU.Multi or aU.MultipleOptions or false
local g=aU.Value or aU.Default or aU.CurrentOption
if not f and type(g)=="table"then g=g[1]end
if f and type(g)~="table"then g=g and{g}or{}end
local N=aV(aU.Description and 50 or 40)N.ClipsDescendants=false
aW(N,aU.Title or"Dropdown",nil,200)
local S=Instance.new"TextButton"S.Text=""
S.AnchorPoint=Vector2.new(1,0.5)S.Position=UDim2.new(1,-12,0.5,0)
S.Size=UDim2.new(0,170,0,28)S.BackgroundColor3=a_.Surface2
S.BorderSizePixel=0 aD(S,7)S.AutoButtonColor=false S.Parent=N
aG(S,true)
am:_tag(S,"BackgroundColor3","Surface2")
local _=Instance.new"TextLabel"_.BackgroundTransparency=1
_.Position=UDim2.new(0,8,0,0)_.Size=UDim2.new(1,-28,1,0)
_.Font=Enum.Font.Gotham _.TextSize=12 _.TextXAlignment=0
_.TextTruncate=Enum.TextTruncate.AtEnd _.Parent=S
_.ZIndex=2
am:_tag(_,"TextColor3","Text")
local a3=aK("chevron",13,a_.Dim)
a3.AnchorPoint=Vector2.new(1,0.5)a3.Position=UDim2.new(1,-8,0.5,0)
a3.Parent=S
local function curText()
if f then return(#g==0 and"None"or table.concat(g,", "))end
return tostring(g or"Select...")
end
_.Text=curText()
local a4,a5,a6,a7,a8,a9=false
local ba={}
function ba.Set(bb,bc,bd)
g=bc
if not f and type(g)=="table"then g=g[1]end
_.Text=curText()
if aU.Flag then am.Flags[aU.Flag]=g end
if not bd then aw(aU.Callback,g)aw(aU.OnChanged,g)end
end
function ba.Get(bb)return g end
local function closeList()
if not a4 then return end
a4=false
af.close(closeList)
as(a3,an.Fast,{Rotation=0})
if a8 then pcall(function()a8:Disconnect()end)a8=nil end
if a9 then pcall(function()a9:Disconnect()end)a9=nil end
if a5 then pcall(function()a5:Destroy()end)a5=nil end
if a6 then pcall(function()a6:Destroy()end)a6=nil end
a7=nil
end
function ba.Refresh(bb,bc)
c=bc or{}
closeList()
end
local function renderItems(bb)
if not a6 then return end
for bc,bd in ipairs(a6:GetChildren())do
if bd:IsA"TextButton"then pcall(function()bd:Destroy()end)end
end
local bc={}
for bd,be in ipairs(c)do
local bf=tostring(be)
if(bb or"")==""or string.find(string.lower(bf),string.lower(bb),1,true)then
table.insert(bc,bf)
end
end
local bd=32
for be,bf in ipairs(bc)do
local bg=Instance.new"TextButton"bg.Text=""
bg.Size=UDim2.new(1,-8,0,26)bg.Position=UDim2.new(0,4,0,bd)
bg.BackgroundColor3=a_.Surface2 bg.BackgroundTransparency=1
bg.BorderSizePixel=0 aD(bg,6)bg.Parent=a6
bg.ZIndex=af.Z.Popup+1
local bh=Instance.new"TextLabel"bh.BackgroundTransparency=1
bh.Position=UDim2.new(0,8,0,0)bh.Size=UDim2.new(1,-36,1,0)
bh.Font=Enum.Font.Gotham bh.TextSize=12 bh.TextXAlignment=0
bh.TextTruncate=Enum.TextTruncate.AtEnd bh.Text=bf bh.Parent=bg
bh.ZIndex=af.Z.Popup+2
local bi=f and table.find(g,bf)or g==bf
if bi then

am:_tag(bh,"TextColor3","Accent")
am:_tag(bg,"BackgroundColor3","Surface2")
bg.BackgroundTransparency=0.4
local bj=aK("check",12,a_.Accent)
bj.AnchorPoint=Vector2.new(1,0.5)bj.Position=UDim2.new(1,-8,0.5,0)
bj.Parent=bg
if bj:IsA"GuiObject"then bj.ZIndex=af.Z.Popup+2 end
else
am:_tag(bh,"TextColor3","Text")
end
bg.MouseEnter:Connect(function()bg.BackgroundTransparency=0.4 am:_tag(bg,"BackgroundColor3","Surface2")end)
bg.MouseLeave:Connect(function()if not(f and table.find(g,bf)or g==bf)then bg.BackgroundTransparency=1 end end)
bg.MouseButton1Click:Connect(function()
am:_sfx"Click"
if f then
local bj=table.find(g,bf)
if bj then table.remove(g,bj)else table.insert(g,bf)end
ba:Set(g)
if a7 then renderItems(a7.Text)else renderItems""end
else
ba:Set(bf)
closeList()
end
end)
bd+=aQ
end
local be=math.clamp(bd+4,40,aS)
a6.Size=UDim2.new(0,aP,0,be)
return be
end
local function placeList(bb)
if not a6 or not N.Parent then return end
local bc,bd=N.AbsolutePosition,N.AbsoluteSize
local be=Vector2.new(1200,800)
pcall(function()be=workspace.CurrentCamera.ViewportSize end)
local bf=bb or a6.Size.Y.Offset
if bf<1 then bf=120 end
local bg=bc.X+bd.X-aP-12
local bh=bc.Y+aR
if bh+bf>be.Y-10 then
bh=math.max(10,bc.Y-bf-6)
end
a6.Position=UDim2.fromOffset(bg,bh)
end
local function openList()
if a4 then return end
a4=true
af.open(closeList)
as(a3,an.Fast,{Rotation=180})
a5=af.backdrop(a2,closeList)
a6=Instance.new"Frame"
a6.Size=UDim2.new(0,aP,0,0)a6.BackgroundColor3=a_.Bg
a6.BorderSizePixel=0 aD(a6,8)a6.Parent=a2
a6.ZIndex=af.Z.Popup a6.ClipsDescendants=true
aG(a6,true)
am:_tag(a6,"BackgroundColor3","Bg")
a7=Instance.new"TextBox"a7.PlaceholderText="Filter..."
a7.PlaceholderColor3=a_.Dim a7.Text=""
a7.Font=Enum.Font.Gotham a7.TextSize=11
a7.Size=UDim2.new(1,-8,0,24)a7.Position=UDim2.new(0,4,0,4)
a7.BackgroundColor3=a_.Surface2 a7.BorderSizePixel=0
aD(a7,6)a7.Parent=a6
a7.ZIndex=af.Z.Popup+1
am:_tag(a7,"BackgroundColor3","Surface2")
am:_tag(a7,"TextColor3","Text")
renderItems""
local bb=a6.Size.Y.Offset
a6.Size=UDim2.new(0,aP,0,0)
placeList(bb)
as(a6,an.Med,{Size=UDim2.new(0,aP,0,bb)})
a8=a7:GetPropertyChangedSignal"Text":Connect(function()
if a4 then renderItems(a7.Text)end
end)
a9=aL.RenderStepped:Connect(function()
if not a4 then return end
if not N:IsDescendantOf(game)then closeList()return end
if aZ._visible==false then closeList()return end
if aY.Page and aY.Page.Visible==false then closeList()return end
placeList()
end)
end
S.MouseButton1Click:Connect(function()
am:_sfx"Click"
if a4 then closeList()else openList()end
end)
local bb={Title=aU.Title,Frame=N,Value=g,Flag=aU.Flag,_handle=ba,
_set=function(bb,bc)ba:Set(bb,bc)end}
return aX(bb)
end end function a.u():typeof(__modImpl())local aa=a.cache.u if not aa then aa={c=__modImpl()}a.cache.u=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local am=
ab.T local an=
ab.tween local as=
ac.guid
local aw=ac.spawnCb
local aD=ac.corner
local aG=ac.hairline local aJ=
ac.pad local aK=
ac.lighting local aL=
ac.ripple local aP=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local aQ=ae.cloneref_check(game:GetService"UserInputService")

return function(aR,aS)
local aT=aR.row
local aU=aR.titleBlock
local aV=aR.reg
local aW=aR.tab local aX=
aR.Window
local aY=aR.Th local aZ=
aR.opts or{}
aS=aS or{}
local a_=aS.Mode or"Toggle"
local a1=aS.Value or aS.Default or Enum.KeyCode.F
if type(a1)=="string"then a1=Enum.KeyCode[a1]or Enum.KeyCode.F end
local a2=aT(aS.Description and 54 or 40)
aU(a2,aS.Title or"Keybind",aS.Description,130)
local a3=Instance.new"TextButton"a3.Font=Enum.Font.GothamBold a3.TextSize=11
a3.AnchorPoint=Vector2.new(1,0.5)a3.Position=UDim2.new(1,-12,0.5,0)
a3.Size=UDim2.new(0,92,0,28)a3.BackgroundColor3=aY.Surface2
a3.BorderSizePixel=0 aD(a3,7)a3.Text=a1.Name a3.Parent=a2
aG(a3,true)
af:_tag(a3,"BackgroundColor3","Surface2")
af:_tag(a3,"TextColor3","Text")
local a4,a5=false,false
local function startRebind()a4=true a3.Text="..."end
a3.MouseButton1Click:Connect(startRebind)
aW._window:Track(aQ.InputBegan:Connect(function(a6,a7)
if a4 and a6.UserInputType==Enum.UserInputType.Keyboard then
a4=false a1=a6.KeyCode a3.Text=a1.Name
if aS.Flag then af.Flags[aS.Flag]=a1.Name end
aw(aS.ChangedCallback,a1)aw(aS.OnChanged,a1)
elseif not a4 and not a7 and a6.KeyCode==a1 then
if a_=="Hold"then a5=true end
aw(aS.Callback,a1)
end
end))
aW._window:Track(aQ.InputEnded:Connect(function(a6)
if a6.KeyCode==a1 then a5=false end
end))
local a6={
Set=function(a6,a7)
if type(a7)=="string"then a7=Enum.KeyCode[a7]or a1 end
a1,a3.Text=a7,a7.Name
end,
Get=function()return a1 end,
GetState=function()return a_=="Hold"and a5 or nil end,
Rebind=startRebind,
}

if aW._window and aW._window._keybinds then
table.insert(aW._window._keybinds,{
Title=aS.Title or"Keybind",
GetName=function()return a4 and"..."or a1.Name end,
Rebind=startRebind,
})
if aW._window._kbPanelRefresh then
task.defer(function()pcall(aW._window._kbPanelRefresh)end)
end
end
return aV{Title=aS.Title,Frame=a2,_handle=a6}
end end function a.v():typeof(__modImpl())local aa=a.cache.v if not aa then aa={c=__modImpl()}a.cache.v=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()
local af=a.t()

local aw=aa
local aD=ab.T
local aG=ab.tween local aP=
ac.guid
local aQ=ac.spawnCb
local aR=ac.corner
local aS=ac.hairline
local aT=ac.pad local aU=
ac.lighting local aV=
ac.ripple local aW=
ad.makeIcon
local aY=ae.cloneref_check(game:GetService"RunService")
local aZ=ae.cloneref_check(game:GetService"UserInputService")

local a_="rbxassetid://4155801252"
local a1="http://www.roblox.com/asset/?id=14204231522"

local a2,a3=160,158 local
a4, a5=6, 10
local a6=150
local a7=40
local a8=24


return function(a9,ba)
local bb=a9.row
local bc=a9.titleBlock
local bd=a9.reg
local be=a9.tab
local bf=a9.Window
local bg=a9.Th local bh=
a9.opts or{}local bi=
a9.page
local bj=a9.pgui
ba=ba or{}
local c=ba.Value or ba.Default or Color3.fromRGB(110,140,255)
if type(c)=="table"then
c=Color3.new(c[1]or 0,c[2]or 0,c[3]or 0)
end
local f,g,N=c:ToHSV()
local S=ba.Transparency or 0
local _=c
local bk=bb(ba.Description and 54 or 40)bk.ClipsDescendants=false
bc(bk,ba.Title or"Color",ba.Description,90)
local bl=Instance.new"TextButton"bl.Text=""
bl.AnchorPoint=Vector2.new(1,0.5)bl.Position=UDim2.new(1,-12,0.5,0)
bl.Size=UDim2.fromOffset(56,26)bl.BackgroundColor3=_
bl.BorderSizePixel=0 aR(bl,8)bl.AutoButtonColor=false bl.Parent=bk
aS(bl,true)
local bm={}
local bn,bo,bp,bq=false
local br,bs,bt
local bu,bv,bw
local bx,by,bz,bA,bB,bC
local bD,bE,bF,bG
local bH,bI,bJ=false,false,false
local bK,bL=0
local bM
local bN={}
local function currentColor()
return Color3.fromHSV(f,g,N)
end
local function colorsClose(bO,bP)
if bO==nil or bP==nil then return false end
return math.abs(bO.R-bP.R)<0.001
and math.abs(bO.G-bP.G)<0.001
and math.abs(bO.B-bP.B)<0.001
end
local function syncFields()
if bu then
bu.Position=UDim2.new(g,0,1-N,0)
bu.BackgroundColor3=currentColor()
end
if bv then
bv.Position=UDim2.new(0.5,0,f,0)
bv.BackgroundColor3=Color3.fromHSV(f,1,1)
end
if br then br.BackgroundColor3=Color3.fromHSV(f,1,1)end
if bt then
bt.BackgroundColor3=currentColor()
if bw then
bw.Position=UDim2.new(0.5,0,1-S,0)
bw.BackgroundColor3=currentColor()
bw.BackgroundTransparency=S
end
end
local bO=currentColor()
local bP=math.floor(bO.R*255+0.5)
local bQ=math.floor(bO.G*255+0.5)
local bR=math.floor(bO.B*255+0.5)
if by and not by:IsFocused()then by.Text="#"..bO:ToHex():upper()end
if bz and not bz:IsFocused()then bz.Text=tostring(bP)end
if bA and not bA:IsFocused()then bA.Text=tostring(bQ)end
if bB and not bB:IsFocused()then bB.Text=tostring(bR)end
if bC and not bC:IsFocused()then
bC.Text=tostring(math.floor((1-S)*100+0.5)).."%"
end
if bx then
bx.BackgroundColor3=bO
bx.BackgroundTransparency=S
end
end
local function push(bO)
_=currentColor()
aG(bl,aD.Hover,{BackgroundColor3=_})
if ba.Flag then aw.Flags[ba.Flag]={_.R,_.G,_.B}end
if not bO then aQ(ba.Callback,_,S)aQ(ba.OnChanged,_,S)end
end
local function applyColor(bO)
_=currentColor()
aG(bl,aD.Hover,{BackgroundColor3=_})
if ba.Flag then aw.Flags[ba.Flag]={_.R,_.G,_.B}end
syncFields()
if bO then
local bP=currentColor()
if not colorsClose(bP,bM)then
bM=bP
aQ(ba.Callback,bP,S)aQ(ba.OnChanged,bP,S)
end
end
end
function bm.Set(bO,bP,bQ,bR)
if type(bP)=="table"and typeof(bP)~="Color3"then
bP=Color3.new(bP[1]or 0,bP[2]or 0,bP[3]or 0)
end
if typeof(bP)=="Color3"then
if type(bQ)=="boolean"and bR==nil then
bR=bQ
elseif type(bQ)=="number"then
S=math.clamp(bQ,0,1)
end
f,g,N=bP:ToHSV()
push(bR)
syncFields()
end
end
function bm.Get(bO)return _,S end
local function closePopup()
if not bn then return end
bn=false
af.close(closePopup)
bH,bI,bJ=false,false,false
bL=nil
for bO,bP in ipairs(bN)do pcall(function()bP:Disconnect()end)end
bN={}
if bq then pcall(function()bq:Disconnect()end)bq=nil end
if bp then pcall(function()bp:Destroy()end)bp=nil end
if bo then
local bO=bo
bo=nil
aG(bO,aD.Fast,{Size=UDim2.new(0,bO.Size.X.Offset,0,0)})
task.delay(0.2,function()pcall(function()bO:Destroy()end)end)
end
bu,bv,bw=nil,nil,nil
br,bs,bt=nil,nil,nil
bx=nil
by,bz,bA,bB,bC=nil,nil,nil,nil,nil
end
local function updateSV(bO)
if not br or br.AbsoluteSize.X<=0 then return end
local bP,bQ=br.AbsolutePosition,br.AbsoluteSize
g=math.clamp((bO.X-bP.X)/bQ.X,0,1)
N=1-math.clamp((bO.Y-bP.Y)/bQ.Y,0,1)
applyColor(true)
end
local function updateHue(bO)
if not bs or bs.AbsoluteSize.Y<=0 then return end
local bP,bQ=bs.AbsolutePosition,bs.AbsoluteSize
f=math.clamp((bO.Y-bP.Y)/bQ.Y,0,1)
applyColor(true)
end
local function updateAlpha(bO)
if not bt or bt.AbsoluteSize.Y<=0 then return end
local bP,bQ=bt.AbsolutePosition,bt.AbsoluteSize
S=1-math.clamp((bO.Y-bP.Y)/bQ.Y,0,1)
applyColor(true)
end
local function requestClose()
if bH or bI or bJ then return end
if os.clock()-bK<0.2 then return end
closePopup()
end



local function placePopup(bO,bP)
if not bo then return end
local bQ=Vector2.new(1200,800)
pcall(function()bQ=workspace.CurrentCamera.ViewportSize end)
local bR=12
local bS=bf._main
if bS and bS.Parent and bS.AbsoluteSize.X>0 then
local bT,bU=bS.AbsolutePosition,bS.AbsoluteSize
local bV=math.clamp(bT.Y+bU.Y/2-bP/2,10,math.max(10,bQ.Y-bP-10))
local bW=bT.X+bU.X+bR
if bW+bO>bQ.X-10 then
bW=bT.X-bO-bR
if bW<10 then
bW=math.clamp(bT.X+bU.X/2-bO/2,10,math.max(10,bQ.X-bO-10))
end
end
bo.Position=UDim2.fromOffset(bW,bV)
return
end

if not bk.Parent then return end
local bT,bU=bk.AbsolutePosition,bk.AbsoluteSize
local bV=bT.X+bU.X-bO-12
if bV<10 then bV=math.max(10,bT.X-bO-8)end
local bW=bT.Y+46
if bW+bP>bQ.Y-10 then bW=math.max(10,bT.Y-bP-6)end
bo.Position=UDim2.fromOffset(bV,bW)
end
local function openPopup()
if bn then return end
bn=true
bD,bE,bF=f,g,N
bG=S
bM=currentColor()
af.open(closePopup)
aw:_sfx"Click"

local bO=12
local bP=bO+a2+a5
local bQ=bP+a4+a5
local bR=bQ+a4+a5
local bS=bR+a6+bO
local bT=a7+a3+a5
local bU=bT+a8+a5+22
local bV=bU+32+bO
bp=af.backdrop(bj,requestClose)
bo=Instance.new"Frame"
bo.Name=ae.GetStealthName()
bo.BackgroundColor3=bg.Bg
bo.BackgroundTransparency=1
bo.BorderSizePixel=0
bo.ClipsDescendants=true
bo.ZIndex=af.Z.Popup
bo.Size=UDim2.new(0,bS,0,0)
bo.Parent=bj
aR(bo,10)
aS(bo,true)
aw:_tag(bo,"BackgroundColor3","Bg")
placePopup(bS,bV)
local bW=Instance.new"TextLabel"bW.BackgroundTransparency=1
bW.Position=UDim2.new(0,bO,0,6)bW.Size=UDim2.new(1,-bO*2,0,22)
bW.Font=Enum.Font.GothamBold bW.TextSize=14 bW.TextXAlignment=0
bW.TextTruncate=Enum.TextTruncate.AtEnd bW.Text=ba.Title or"Color"
bW.Parent=bo
bW.ZIndex=af.Z.Popup+1
aw:_tag(bW,"TextColor3","Text")

br=Instance.new"ImageLabel"
br.Position=UDim2.new(0,bO,0,a7)
br.Size=UDim2.fromOffset(a2,a3)
br.BackgroundColor3=Color3.fromHSV(f,1,1)
br.BackgroundTransparency=0
br.Image=a_
br.ScaleType=Enum.ScaleType.Stretch
br.BorderSizePixel=0
br.ClipsDescendants=true
br.ZIndex=af.Z.Popup+1
br.Parent=bo
aR(br,8)
aS(br,true)
bu=Instance.new"Frame"
bu.AnchorPoint=Vector2.new(0.5,0.5)
bu.Position=UDim2.new(g,0,1-N,0)
bu.Size=UDim2.fromOffset(14,14)
bu.BackgroundColor3=currentColor()
bu.BorderSizePixel=0
bu.ZIndex=af.Z.Popup+3
bu.Parent=br
aR(bu,99)
local bX=Instance.new"UIStroke"bX.Thickness=2
bX.Color=Color3.fromRGB(255,255,255)bX.Transparency=0.1
bX.Parent=bu

bs=Instance.new"Frame"
bs.Position=UDim2.new(0,bP,0,a7)
bs.Size=UDim2.fromOffset(a4,a3+14)
bs.BackgroundColor3=Color3.fromRGB(255,255,255)
bs.BorderSizePixel=0
bs.ClipsDescendants=true
bs.ZIndex=af.Z.Popup+1
bs.Parent=bo
aR(bs,3)
local bY=Instance.new"UIGradient"bY.Rotation=90
bY.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
}
bY.Parent=bs
bv=Instance.new"Frame"
bv.AnchorPoint=Vector2.new(0.5,0.5)
bv.Position=UDim2.new(0.5,0,f,0)
bv.Size=UDim2.fromOffset(14,14)
bv.BackgroundColor3=Color3.fromHSV(f,1,1)
bv.BorderSizePixel=0
bv.ZIndex=af.Z.Popup+3
bv.Parent=bs
aR(bv,99)
local bZ=Instance.new"UIStroke"bZ.Thickness=2
bZ.Color=Color3.fromRGB(255,255,255)bZ.Transparency=0.1
bZ.Parent=bv

bt=Instance.new"Frame"
bt.Position=UDim2.new(0,bQ,0,a7)
bt.Size=UDim2.fromOffset(a4,a3+14)
bt.BackgroundColor3=currentColor()
bt.BorderSizePixel=0
bt.ClipsDescendants=true
bt.ZIndex=af.Z.Popup+1
bt.Parent=bo
aR(bt,3)
aS(bt,true)
local b_=Instance.new"ImageLabel"
b_.Image=a1
b_.ImageTransparency=0.45
b_.ScaleType=Enum.ScaleType.Tile
b_.TileSize=UDim2.fromOffset(40,40)
b_.BackgroundTransparency=1
b_.Size=UDim2.fromScale(1,1)
b_.ZIndex=af.Z.Popup+1
b_.Parent=bt
aR(b_,3)
local b0=Instance.new"Frame"
b0.Size=UDim2.fromScale(1,1)
b0.BackgroundColor3=Color3.fromRGB(255,255,255)
b0.BorderSizePixel=0
b0.ZIndex=af.Z.Popup+2
b0.Parent=bt
aR(b0,3)
local b1=Instance.new"UIGradient"b1.Rotation=90
b1.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
b1.Parent=b0
bw=Instance.new"Frame"
bw.AnchorPoint=Vector2.new(0.5,0.5)
bw.Position=UDim2.new(0.5,0,1-S,0)
bw.Size=UDim2.fromOffset(14,14)
bw.BackgroundColor3=currentColor()
bw.BackgroundTransparency=S
bw.BorderSizePixel=0
bw.ZIndex=af.Z.Popup+3
bw.Parent=bt
aR(bw,99)

local b2=(a2-a5)/2
local function checkerSw(b3)
local b4=Instance.new"ImageLabel"
b4.Image=a1
b4.ImageTransparency=0.45
b4.ScaleType=Enum.ScaleType.Tile
b4.TileSize=UDim2.fromOffset(40,40)
b4.BackgroundTransparency=1
b4.Position=UDim2.new(0,b3,0,bT)
b4.Size=UDim2.fromOffset(b2,a8)
b4.ZIndex=af.Z.Popup+1
b4.Parent=bo
aR(b4,8)
aS(b4,true)
return b4
end
local b3=checkerSw(bO)
bx=Instance.new"Frame"
bx.BackgroundColor3=currentColor()
bx.BackgroundTransparency=S
bx.Size=UDim2.fromScale(1,1)
bx.ZIndex=af.Z.Popup+2
bx.Parent=b3
aR(bx,8)
local b4=checkerSw(bO+b2+a5)
local b5=Instance.new"Frame"
b5.BackgroundColor3=Color3.fromHSV(bD or f,bE or g,bF or N)
b5.BackgroundTransparency=(bG==nil)and S or bG
b5.Size=UDim2.fromScale(1,1)
b5.ZIndex=af.Z.Popup+2
b5.Parent=b4
aR(b5,8)

local b6=bR
local function makeInput(b7,b8,b9)
local ca=Instance.new"Frame"
ca.BackgroundTransparency=1
ca.Position=UDim2.new(0,b6,0,b9)
ca.Size=UDim2.new(0,a6,0,36)
ca.ZIndex=af.Z.Popup+1
ca.Parent=bo
local cb=Instance.new"TextLabel"
cb.BackgroundTransparency=1
cb.Font=Enum.Font.Gotham cb.TextSize=11
cb.TextXAlignment=0 cb.Text=b7
cb.Size=UDim2.new(1,0,0,12)
cb.ZIndex=af.Z.Popup+2
cb.Parent=ca
aw:_tag(cb,"TextColor3","Dim")
local cc=Instance.new"Frame"
cc.Position=UDim2.new(0,0,0,12)
cc.Size=UDim2.new(1,0,0,24)
cc.BackgroundColor3=bg.Surface2
cc.BackgroundTransparency=0
cc.BorderSizePixel=0
cc.ZIndex=af.Z.Popup+2
cc.Parent=ca
aR(cc,7)
aS(cc,true)
aw:_tag(cc,"BackgroundColor3","Surface2")
local cd=Instance.new"TextBox"
cd.ClearTextOnFocus=false
cd.Font=Enum.Font.Code cd.TextSize=13
cd.TextXAlignment=1 cd.TextYAlignment=1
cd.Text=b8
cd.BackgroundTransparency=1
cd.Size=UDim2.fromScale(1,1)
cd.ZIndex=af.Z.Popup+3
cd.Parent=cc
aw:_tag(cd,"TextColor3","Text")
aT(cd,0,0,0,8)
return ca,cd
end
local b7=currentColor()
local b8=math.floor(b7.R*255+0.5)
local b9=math.floor(b7.G*255+0.5)
local ca=math.floor(b7.B*255+0.5)
local cb=a7
local cc=4 local
cd, ce=makeInput("Hex","#"..b7:ToHex():upper(),cb)
by=ce
cb+=36+cc local
cf, cg=makeInput("Red",tostring(b8),cb)
bz=cg
cb+=36+cc local
ch, ci=makeInput("Green",tostring(b9),cb)
bA=ci
cb+=36+cc local
cj, ck=makeInput("Blue",tostring(ca),cb)
bB=ck
cb+=36+cc local
cl, cm=makeInput("Alpha",tostring(math.floor((1-S)*100+0.5)).."%",cb)
bC=cm


local cn=bS-bO*2
local co=(cn-6)/2
local cp=32
local function makeBtn(cq,cr,cs,ct)
local cu=Instance.new"TextButton"
cu.Position=UDim2.new(0,cr,0,bU)
cu.Size=UDim2.fromOffset(cs,cp)
cu.Text=""
cu.AutoButtonColor=false
cu.BorderSizePixel=0
cu.ZIndex=af.Z.Popup+2
cu.BackgroundColor3=bg.Surface2
aS(cu,true)
aw:_tag(cu,"BackgroundColor3","Surface2")
cu.Parent=bo
aR(cu,9)
local cv=Instance.new"TextLabel"
cv.BackgroundTransparency=1 cv.Size=UDim2.fromScale(1,1)
cv.Font=Enum.Font.GothamBold cv.TextSize=12
cv.Text=string.upper(cq)cv.Parent=cu
cv.ZIndex=af.Z.Popup+3
if ct then aw:_tag(cv,"TextColor3","Accent")
else aw:_tag(cv,"TextColor3","Text")end
return cu,cv
end
local cq=makeBtn("Cancel",bO,co,false)
local cr=makeBtn("Apply",bO+co+6,co,true)
cq.MouseButton1Click:Connect(function()
f,g,N=bD,bE,bF
S=bG
applyColor(true)
closePopup()
end)
cr.MouseButton1Click:Connect(function()
aw:_sfx"Click"
closePopup()
end)

br.InputBegan:Connect(function(cs)
if cs.UserInputType==Enum.UserInputType.MouseButton1
or cs.UserInputType==Enum.UserInputType.Touch then
if bH or bI or bJ then return end
bH=true
bL=cs
updateSV(cs.Position)
end
end)
bs.InputBegan:Connect(function(cs)
if cs.UserInputType==Enum.UserInputType.MouseButton1
or cs.UserInputType==Enum.UserInputType.Touch then
if bH or bI or bJ then return end
bI=true
bL=cs
updateHue(cs.Position)
end
end)
bt.InputBegan:Connect(function(cs)
if cs.UserInputType==Enum.UserInputType.MouseButton1
or cs.UserInputType==Enum.UserInputType.Touch then
if bH or bI or bJ then return end
bJ=true
bL=cs
updateAlpha(cs.Position)
end
end)
table.insert(bN,aZ.InputChanged:Connect(function(cs)
if not bo then return end
if cs~=bL
and not(bL and bL.UserInputType==Enum.UserInputType.MouseButton1
and cs.UserInputType==Enum.UserInputType.MouseMovement)then
return
end
if bH then updateSV(cs.Position)end
if bI then updateHue(cs.Position)end
if bJ then updateAlpha(cs.Position)end
end))
table.insert(bN,aZ.InputEnded:Connect(function(cs)
if cs==bL
or(bL and bL.UserInputType==Enum.UserInputType.MouseButton1
and cs.UserInputType==Enum.UserInputType.MouseButton1)then
if bH or bI or bJ then
bK=os.clock()
end
bH,bI,bJ=false,false,false
bL=nil
end
end))
by:GetPropertyChangedSignal"Text":Connect(function()
if not bo then return end
local cs=by.Text:gsub("[^%x]","")
cs=cs:sub(1,6)
if cs~=by.Text then by.Text=cs end
end)
by.FocusLost:Connect(function()
if not bo then return end
local cs=by.Text:gsub("#","")
if#cs==3 then
cs=cs:sub(1,1):rep(2)..cs:sub(2,2):rep(2)..cs:sub(3,3):rep(2)
end
if#cs==6 then
local ct,cu=pcall(Color3.fromHex,cs)
if ct and cu then
f,g,N=cu:ToHSV()
applyColor(true)
return
end
end
syncFields()
end)
local function filterDigits(cs)
cs:GetPropertyChangedSignal"Text":Connect(function()
if not bo then return end
local ct=cs.Text:gsub("%D",""):sub(1,3)
if ct~=cs.Text then cs.Text=ct end
end)
end
filterDigits(bz)filterDigits(bA)filterDigits(bB)
local function onRGBCommit()
if not bo then return end
local cs=math.clamp(tonumber(bz.Text)or 0,0,255)
local ct=math.clamp(tonumber(bA.Text)or 0,0,255)
local cu=math.clamp(tonumber(bB.Text)or 0,0,255)
f,g,N=Color3.toHSV(Color3.fromRGB(cs,ct,cu))
applyColor(true)
end
bz.FocusLost:Connect(onRGBCommit)
bA.FocusLost:Connect(onRGBCommit)
bB.FocusLost:Connect(onRGBCommit)
bC.FocusLost:Connect(function()
if not bo then return end
local cs=bC.Text:gsub("%%","")
local ct=math.clamp(tonumber(cs)or 0,0,100)
S=1-ct/100
applyColor(true)
end)
syncFields()
aG(bo,TweenInfo.new(0.44,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Size=UDim2.new(0,bS,0,bV),BackgroundTransparency=0})
bq=aY.RenderStepped:Connect(function()
if not bn then return end
if not bk:IsDescendantOf(game)then closePopup()return end
if bf._visible==false then closePopup()return end
if be.Page and be.Page.Visible==false then closePopup()return end
placePopup(bS,bV)
end)
end
bl.MouseButton1Click:Connect(function()
if bn then closePopup()else openPopup()end
end)
local bO={Title=ba.Title,Frame=bk,Value=_,Flag=ba.Flag,_handle=bm,
_set=function(bO,bP)bm:Set(bO,bP)end}
return bd(bO)
end end function a.w():typeof(__modImpl())local aa=a.cache.w if not aa then aa={c=__modImpl()}a.cache.w=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local aw=
ab.T local aD=
ab.tween local aG=
ac.guid local aQ=
ac.spawnCb
local aR=ac.corner
local aS=ac.hairline
local aT=ac.pad local aW=
ac.lighting local aY=
ac.ripple
local aZ=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a_,a1)
local a2=a_.row local a3=
a_.titleBlock
local a4=a_.reg
local a5=a_.tab local a6=
a_.Window
local a7=a_.Th local a8=
a_.opts or{}
a1=a1 or{}
local a9=a5._window
local ba=a2(196)
local bb=Instance.new"TextLabel"bb.BackgroundTransparency=1
bb.Position=UDim2.new(0,12,0,6)bb.Size=UDim2.new(1,-24,0,17)
bb.Font=Enum.Font.GothamMedium bb.TextSize=13 bb.TextXAlignment=0
bb.Text=a1.Title or"Profiles"bb.Parent=ba
af:_tag(bb,"TextColor3","Text")
local bc=Instance.new"TextBox"bc.PlaceholderText="Profile name..."
bc.PlaceholderColor3=a7.Dim bc.Text="default"
bc.Font=Enum.Font.Gotham bc.TextSize=12
bc.Position=UDim2.new(0,12,0,28)bc.Size=UDim2.new(1,-94,0,28)
bc.BackgroundColor3=a7.Surface2 bc.BorderSizePixel=0
aR(bc,7)bc.Parent=ba
aT(bc,4,4,8,8)
aS(bc,true)
af:_tag(bc,"BackgroundColor3","Surface2")
af:_tag(bc,"TextColor3","Text")
local bd=Instance.new"TextButton"bd.Text=""
bd.AnchorPoint=Vector2.new(1,0)bd.Position=UDim2.new(1,-12,0,28)
bd.Size=UDim2.new(0,70,0,28)bd.BorderSizePixel=0
aR(bd,7)bd.AutoButtonColor=false bd.Parent=ba
af:_tag(bd,"BackgroundColor3","Accent")
local be=Instance.new"TextLabel"be.BackgroundTransparency=1
be.Size=UDim2.fromScale(1,1)be.Font=Enum.Font.GothamBold
be.TextSize=11 be.Text="SAVE"
af:oa(be)be.Parent=bd
local bf=Instance.new"ScrollingFrame"
bf.Position=UDim2.new(0,12,0,62)bf.Size=UDim2.new(1,-24,1,-70)
bf.BackgroundTransparency=1 bf.BorderSizePixel=0
bf.ScrollBarThickness=2 bf.CanvasSize=UDim2.new(0,0,0,0)
bf.AutomaticCanvasSize=Enum.AutomaticSize.Y bf.Parent=ba
af:_tag(bf,"ScrollBarImageColor3","Surface2")
local bg=Instance.new"UIListLayout"bg.Padding=UDim.new(0,4)
bg.SortOrder=Enum.SortOrder.LayoutOrder bg.Parent=bf
local function folder()
return"Kronos/"..tostring(a9 and a9._cfgTitle or"Kronos")
end
local function profiles()
local bi={}
pcall(function()
if listfiles and isfolder and isfolder(folder())then
for bj,bk in ipairs(listfiles(folder()))do
local bl=string.match(bk,"([^/\\]+)%.json$")
if bl then table.insert(bi,bl)end
end
end
end)
table.sort(bi)
return bi
end
local function refresh()
for bi,bj in ipairs(bf:GetChildren())do
if bj:IsA"TextButton"then pcall(function()bj:Destroy()end)end
end
local bi=profiles()
if#bi==0 then
local bj=Instance.new"TextLabel"bj.BackgroundTransparency=1
bj.Size=UDim2.new(1,0,0,22)bj.Font=Enum.Font.Gotham
bj.TextSize=11 bj.Text="No saved profiles"bj.Parent=bf
af:_tag(bj,"TextColor3","Dim")
return
end
for bj,bk in ipairs(bi)do
local bl=Instance.new"TextButton"bl.Text=""
bl.Size=UDim2.new(1,-2,0,28)bl.BackgroundColor3=a7.Surface2
bl.BackgroundTransparency=0.35 bl.BorderSizePixel=0
aR(bl,7)bl.Parent=bf
af:_tag(bl,"BackgroundColor3","Surface2")
local bm=Instance.new"TextLabel"bm.BackgroundTransparency=1
bm.Position=UDim2.new(0,8,0,0)bm.Size=UDim2.new(1,-44,1,0)
bm.Font=Enum.Font.Gotham bm.TextSize=12 bm.TextXAlignment=0
bm.TextTruncate=Enum.TextTruncate.AtEnd bm.Text=bk bm.Parent=bl
af:_tag(bm,"TextColor3","Text")
local bn=Instance.new"TextButton"bn.Text=""
bn.AnchorPoint=Vector2.new(1,0.5)bn.Position=UDim2.new(1,-6,0.5,0)
bn.Size=UDim2.fromOffset(22,22)bn.BackgroundTransparency=1 bn.Parent=bl
local bo=aZ("x",11,a7.Dim)
bo.AnchorPoint=Vector2.new(0.5,0.5)bo.Position=UDim2.new(0.5,0,0.5,0)
bo.Parent=bn
bl.MouseButton1Click:Connect(function()
af:_sfx"Click"a9:LoadConfig(bk)
end)
bn.MouseButton1Click:Connect(function()
pcall(function()if delfile then delfile(folder().."/"..bk..".json")end end)
a9:Notify{Title="Profile deleted",Content=bk,Duration=2}
refresh()
end)
end
end
bd.MouseButton1Click:Connect(function()
af:_sfx"Click"
local bi=bc.Text~=""and bc.Text or"default"
a9:SaveConfig(bi)refresh()
end)
refresh()
return a4{Title=a1.Title or"Profiles",Frame=ba,_handle={Refresh=refresh}}
end end function a.x():typeof(__modImpl())local aa=a.cache.x if not aa then aa={c=__modImpl()}a.cache.x=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local aR=ab.T
local aS=ab.tween local aT=
ac.guid
local aY=ac.spawnCb
local aZ=ac.corner
local a_=ac.hairline local a1=
ac.pad
local a2=ac.lighting
local a4=ac.ripple
local a5=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a7,a8)local a9=
a7.row local ba=
a7.titleBlock
local bb=a7.reg
local bc=a7.tab local bd=
a7.Window
local be=a7.Th local bf=
a7.opts or{}
a8=a8 or{}
local bg=Instance.new"Frame"bg.Size=UDim2.new(1,-4,0,96)
bg.BackgroundColor3=be.Surface2 bg.BorderSizePixel=0
aZ(bg,10)bg.Parent=page
a_(bg,true)
af:_tag(bg,"BackgroundColor3","Surface2")
a2(bg,10)

local bi=Instance.new"Frame"bi.BorderSizePixel=0
bi.Position=UDim2.new(0,0,0,18)bi.Size=UDim2.new(0,3,1,-36)
aZ(bi,99)bi.Parent=bg
af:_tag(bi,"BackgroundColor3","Accent")
local bj=a5(a8.Icon or"bellring",18,be.Accent)
bj.AnchorPoint=Vector2.new(0,0.5)bj.Position=UDim2.new(0,14,0,48)
bj.Parent=bg
if bj:IsA"TextLabel"then bj.Size=UDim2.new(0,18,0,18)end

local bk=a8.Button and-142 or-54
local bl=Instance.new"TextLabel"bl.BackgroundTransparency=1
bl.Position=UDim2.new(0,42,0,16)bl.Size=UDim2.new(1,bk,0,18)
bl.Font=Enum.Font.GothamBold bl.TextSize=14 bl.TextXAlignment=0
bl.TextTruncate=Enum.TextTruncate.AtEnd bl.Text=a8.Title or"News"bl.Parent=bg
af:_tag(bl,"TextColor3","Text")
local bm=Instance.new"TextLabel"bm.BackgroundTransparency=1
bm.Position=UDim2.new(0,42,0,38)bm.Size=UDim2.new(1,bk,0,42)
bm.Font=Enum.Font.Gotham bm.TextSize=12 bl.TextXAlignment=0
bm.TextXAlignment=0 bm.TextYAlignment=0 bm.TextWrapped=true
bm.TextTruncate=Enum.TextTruncate.AtEnd bm.Text=a8.Content or""bm.Parent=bg
af:_tag(bm,"TextColor3","Dim")
if a8.Button then
local bn=Instance.new"TextButton"bn.Text=""
bn.AnchorPoint=Vector2.new(1,0.5)bn.Position=UDim2.new(1,-12,0,48)
bn.Size=UDim2.new(0,76,0,30)bn.BorderSizePixel=0
aZ(bn,7)bn.AutoButtonColor=false bn.Parent=bg
af:agrad(bn,15)
local bo=Instance.new"TextLabel"bo.BackgroundTransparency=1
bo.Size=UDim2.fromScale(1,1)bo.Font=Enum.Font.GothamBold
bo.TextSize=11
bo.Text=string.upper(a8.Button)bo.Parent=bn
af:oa(bo)
a4(bn)
bn.MouseButton1Click:Connect(function()
af:_sfx"Click"aY(a8.Callback)
end)
end
bg.BackgroundTransparency=1
task.delay(#bc.Elements*0.025,function()
aS(bg,aR.Med,{BackgroundTransparency=0})
end)
return bb{Title=a8.Title,Frame=bg,_handle=bg}
end end function a.y():typeof(__modImpl())local aa=a.cache.y if not aa then aa={c=__modImpl()}a.cache.y=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local aR=
ab.T local aS=
ab.tween local aY=
ac.guid local aZ=
ac.spawnCb
local a_=ac.corner
local a1=ac.hairline local a2=
ac.pad
local a4=ac.lighting local a5=
ac.ripple local a7=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a8,bb)local bc=
a8.row local be=
a8.titleBlock
local bf=a8.reg local bg=
a8.tab local bi=
a8.Window
local bj=a8.Th local bk=
a8.opts or{}
bb=bb or{}
local bl=bb.Stats or bb.Items or{}
local bm=math.max(1,#bl)
local bn=Instance.new"Frame"bn.BackgroundTransparency=1
bn.Size=UDim2.new(1,-4,0,64)bn.Parent=page
local bo=Instance.new"UIListLayout"bo.FillDirection=Enum.FillDirection.Horizontal
bo.Padding=UDim.new(0,8)bo.SortOrder=Enum.SortOrder.LayoutOrder bo.Parent=bn
local bp={}
for bq,br in ipairs(bl)do
local bs=Instance.new"Frame"
bs.Size=UDim2.new(1/bm,-8,1,0)
bs.BackgroundColor3=bj.Surface bs.BorderSizePixel=0
a_(bs,10)bs.LayoutOrder=bq bs.Parent=bn
a1(bs,true)
af:_tag(bs,"BackgroundColor3","Surface")
a4(bs,10)
local bt=Instance.new"TextLabel"bt.BackgroundTransparency=1
bt.Position=UDim2.new(0,0,0,10)bt.Size=UDim2.new(1,0,0,20)
bt.Font=Enum.Font.GothamBold bt.TextSize=16 bt.Text=tostring(br.Value or"-")
bt.Parent=bs
af:_tag(bt,"TextColor3",br.Accent and"Accent"or"Text")
local bu=Instance.new"TextLabel"bu.BackgroundTransparency=1
bu.Position=UDim2.new(0,0,0,32)bu.Size=UDim2.new(1,0,0,14)
bu.Font=Enum.Font.GothamBold bu.TextSize=9
bu.Text=string.upper(br.Label or"")bu.Parent=bs
af:_tag(bu,"TextColor3","Dim")
bp[br.Label or bq]={Set=function(bv,bw)bt.Text=tostring(bw)end,Frame=bs}
end
return bf{Title=bb.Title or"Stats",Frame=bn,_handle=bp}
end end function a.z():typeof(__modImpl())local aa=a.cache.z if not aa then aa={c=__modImpl()}a.cache.z=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local a_=
ab.T local a1=
ab.tween local a4=
ac.guid local a7=
ac.spawnCb
local a8=ac.corner local bb=
ac.hairline local bf=
ac.pad local bj=
ac.lighting local bk=
ac.ripple local bl=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bm,bn)local bo=
bm.row local bp=
bm.titleBlock
local bq=bm.reg local br=
bm.tab local bs=
bm.Window
local bt=bm.Th local bu=
bm.opts or{}
bn=bn or{}
local bv=math.clamp(bn.Lines or 3,1,6)
local bw=Instance.new"Frame"bw.BackgroundTransparency=1
bw.Size=UDim2.new(1,-4,0,bv*18+8)bw.Parent=page
for bx=1,bv do
local by=Instance.new"Frame"by.BorderSizePixel=0
by.Position=UDim2.new(0,0,0,(bx-1)*18)
by.Size=UDim2.new(bx==bv and 0.6 or 1,0,0,12)
by.BackgroundColor3=bt.Surface2 a8(by,6)by.Parent=bw
af:_tag(by,"BackgroundColor3","Surface2")
local bz=Instance.new"Frame"bz.Name="_sheen"bz.BorderSizePixel=0
bz.Size=UDim2.new(0.35,0,1,0)bz.BackgroundColor3=Color3.fromRGB(255,255,255)
bz.BackgroundTransparency=0.88 a8(bz,6)bz.Parent=by
by.ClipsDescendants=true
end
task.spawn(function()
local bx=0
while bw.Parent do
bx+=0.03 task.wait(0.03)
for by,bz in ipairs(bw:GetChildren())do
if bz:IsA"Frame"then
for bA,bB in ipairs(bz:GetChildren())do
if bB.Name=="_sheen"then
local bC=((bx*0.9)%1.4)-0.2
pcall(function()bB.Position=UDim2.new(bC,0,0,0)end)
end
end
end
end
end
end)
return bq{Title=bn.Title or"Loading",Frame=bw,_handle=bw}
end end function a.A():typeof(__modImpl())local aa=a.cache.A if not aa then aa={c=__modImpl()}a.cache.A=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local a8=
ab.T
local bl=ab.tween local bm=
ac.guid local bn=
ac.spawnCb
local bq=ac.corner local bt=
ac.hairline local bu=
ac.pad local bv=
ac.lighting local bw=
ac.ripple local bx=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(by,bz)
local bA=by.row
local bB=by.titleBlock
local bC=by.reg local bD=
by.tab local bE=
by.Window local bF=
by.Th local bG=
by.opts or{}
bz=bz or{}
local bH={online="Success",idle="Warn",offline="Danger",busy="Accent"}
local bI=string.lower(bz.State or"online")
local bJ=bA(bz.Description and 54 or 40)
bB(bJ,bz.Title or"Status",bz.Description)
local bK=Instance.new"Frame"bK.AnchorPoint=Vector2.new(1,0.5)
bK.Position=UDim2.new(1,-84,0.5,0)bK.Size=UDim2.fromOffset(10,10)
bK.BorderSizePixel=0 bq(bK,99)bK.Parent=bJ
af:_tag(bK,"BackgroundColor3",bH[bI]or"Success")
local bL=Instance.new"TextLabel"bL.BackgroundTransparency=1
bL.AnchorPoint=Vector2.new(1,0.5)bL.Position=UDim2.new(1,-12,0.5,0)
bL.Size=UDim2.new(0,56,0,16)bL.Font=Enum.Font.GothamBold
bL.TextSize=10 bL.TextXAlignment=1 bL.Text=string.upper(bI)bL.Parent=bJ
af:_tag(bL,"TextColor3","Dim")
task.spawn(function()
while bK.Parent do
bl(bK,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0.55})
task.wait(1.25)
if not bK.Parent then break end
bl(bK,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0})
task.wait(1.25)
end
end)
local bM={}
function bM.Set(bN,bO)
bI=string.lower(bO)
af:_tag(bK,"BackgroundColor3",bH[bI]or"Success")
bL.Text=string.upper(bI)
end
return bC{Title=bz.Title,Frame=bJ,_handle=bM}
end end function a.B():typeof(__modImpl())local aa=a.cache.B if not aa then aa={c=__modImpl()}a.cache.B=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local bl=
ab.T local bq=
ab.tween local bx=
ac.guid local by=
ac.spawnCb local bz=
ac.corner local bA=
ac.hairline local bB=
ac.pad local bC=
ac.lighting local bG=
ac.ripple
local bH=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bI,bJ)local bK=
bI.row local bL=
bI.titleBlock
local bM=bI.reg local bN=
bI.tab local bO=
bI.Window
local bP=bI.Th local bQ=
bI.opts or{}
bJ=bJ or{}
local bR=Instance.new"Frame"bR.BackgroundTransparency=1
bR.Size=UDim2.new(1,-4,0,130)bR.Parent=page
local bS=bH(bJ.Icon or"box",30,bP.Dim)
bS.AnchorPoint=Vector2.new(0.5,0)bS.Position=UDim2.new(0.5,0,0,18)
bS.Parent=bR
if bS:IsA"TextLabel"then bS.Size=UDim2.new(0,30,0,30)end
local bT=Instance.new"TextLabel"bT.BackgroundTransparency=1
bT.Position=UDim2.new(0,0,0,56)bT.Size=UDim2.new(1,0,0,20)
bT.Font=Enum.Font.GothamBold bT.TextSize=14 bT.Text=bJ.Title or"Nothing here"
bT.Parent=bR
af:_tag(bT,"TextColor3","Text")
local bU=Instance.new"TextLabel"bU.BackgroundTransparency=1
bU.Position=UDim2.new(0,20,0,78)bU.Size=UDim2.new(1,-40,0,36)
bU.Font=Enum.Font.Gotham bU.TextSize=12 bU.TextWrapped=true
bU.Text=bJ.Hint or"This section is empty."bU.Parent=bR
af:_tag(bU,"TextColor3","Dim")
return bM{Title=bJ.Title,Frame=bR,_handle=bR}
end end function a.C():typeof(__modImpl())local aa=a.cache.C if not aa then aa={c=__modImpl()}a.cache.C=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local bG=ab.T
local bH=ab.tween local bI=
ac.guid local bJ=
ac.spawnCb
local bM=ac.corner
local bP=ac.hairline local bQ=
ac.pad
local bR=ac.lighting local bS=
ac.ripple local bT=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bU,bV)local bW=
bU.row local bX=
bU.titleBlock
local bY=bU.reg
local bZ=bU.tab local b_=
bU.Window
local b0=bU.Th local b1=
bU.opts or{}
bV=bV or{}
local b2=Instance.new"Frame"b2.Size=UDim2.new(1,-4,0,64)
b2.BackgroundColor3=b0.Surface2 b2.BorderSizePixel=0
bM(b2,10)b2.Parent=page
bP(b2,true)
af:_tag(b2,"BackgroundColor3","Surface2")
bR(b2,10)
local b3=Instance.new"Frame"b3.AnchorPoint=Vector2.new(0,0.5)
b3.Position=UDim2.new(0,12,0.5,0)b3.Size=UDim2.fromOffset(40,40)
b3.BorderSizePixel=0 bM(b3,99)b3.Parent=b2
af:agrad(b3,45)
local b4=Instance.new"TextLabel"b4.Size=UDim2.fromScale(1,1)
b4.BackgroundTransparency=1 b4.Font=Enum.Font.GothamBlack
b4.TextSize=18
b4.Text=string.upper(string.sub(bV.Name or"?",1,1))b4.Parent=b3
af:oa(b4)
local b5=Instance.new"TextLabel"b5.BackgroundTransparency=1
b5.Position=UDim2.new(0,62,0,12)b5.Size=UDim2.new(1,-120,0,18)
b5.Font=Enum.Font.GothamBold b5.TextSize=14 b5.TextXAlignment=0
b5.TextTruncate=Enum.TextTruncate.AtEnd b5.Text=bV.Name or"guest"b5.Parent=b2
af:_tag(b5,"TextColor3","Text")
local b6=Instance.new"TextLabel"b6.BackgroundTransparency=1
b6.Position=UDim2.new(0,62,0,32)b6.Size=UDim2.new(1,-120,0,14)
b6.Font=Enum.Font.Gotham b6.TextSize=11 b6.TextXAlignment=0
b6.TextTruncate=Enum.TextTruncate.AtEnd b6.Text=bV.Tag or"Premium"b6.Parent=b2
af:_tag(b6,"TextColor3","Dim")
local b7=Instance.new"Frame"b7.AnchorPoint=Vector2.new(1,0.5)
b7.Position=UDim2.new(1,-14,0.5,0)b7.Size=UDim2.fromOffset(10,10)
b7.BorderSizePixel=0 bM(b7,99)b7.Parent=b2
af:_tag(b7,"BackgroundColor3","Success")
b2.BackgroundTransparency=1
task.delay(#bZ.Elements*0.025,function()
bH(b2,bG.Med,{BackgroundTransparency=0})
end)
return bY{Title=bV.Name,Frame=b2,_handle=b2}
end end function a.D():typeof(__modImpl())local aa=a.cache.D if not aa then aa={c=__modImpl()}a.cache.D=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local bG=ab.T
local bH=ab.tween local bM=
ac.guid
local bP=ac.spawnCb
local bR=ac.corner
local bT=ac.hairline local bU=
ac.pad
local bV=ac.lighting local bY=
ac.ripple
local bZ=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b0,b1)local b2=
b0.row local b3=
b0.titleBlock
local b4=b0.reg local b5=
b0.tab local b6=
b0.Window
local b7=b0.Th local b8=
b0.opts or{}
b1=b1 or{}
local b9=b1.Cards or{}
local c=math.clamp(b1.Columns or 2,1,3)
local ca=Instance.new"Frame"ca.BackgroundTransparency=1
ca.Size=UDim2.new(1,-4,0,0)ca.AutomaticSize=Enum.AutomaticSize.Y
ca.Parent=page
local cb=Instance.new"UIListLayout"cb.Padding=UDim.new(0,8)
cb.SortOrder=Enum.SortOrder.LayoutOrder cb.Parent=ca




local cc,ce=0
for cg,ci in ipairs(b9)do
if(cg-1)%c==0 then
ce=Instance.new"Frame"ce.BackgroundTransparency=1
ce.Size=UDim2.new(1,0,0,68)ce.AutomaticSize=Enum.AutomaticSize.Y
ce.Parent=ca
local ck=Instance.new"UIListLayout"ck.FillDirection=Enum.FillDirection.Horizontal
ck.Padding=UDim.new(0,8)ck.SortOrder=Enum.SortOrder.LayoutOrder ck.Parent=ce
cc+=1
end
local ck=false
local cl=Instance.new"Frame"
cl.Size=UDim2.new(1/c,-8+8/c,0,68)
cl.BackgroundColor3=b7.Surface cl.BorderSizePixel=0
bR(cl,10)cl.LayoutOrder=cg cl.Parent=ce
bT(cl,true)
af:_tag(cl,"BackgroundColor3","Surface")
bV(cl,10)


local cm=Instance.new"TextButton"cm.Text=""
cm.Size=UDim2.fromScale(1,1)cm.BackgroundTransparency=1 cm.Parent=cl
local cn=bZ(ci.Icon or"box",16,b7.Dim)
cn.Position=UDim2.new(0,10,0,10)cn.Parent=cl
if cn:IsA"TextLabel"then cn.Size=UDim2.new(0,16,0,16)end
local co=Instance.new"TextLabel"co.BackgroundTransparency=1
co.Position=UDim2.new(0,34,0,8)co.Size=UDim2.new(1,-42,0,18)
co.Font=Enum.Font.GothamBold co.TextSize=13 co.TextXAlignment=0
co.TextTruncate=Enum.TextTruncate.AtEnd co.Text=ci.Title or"Script"co.Parent=cl
af:_tag(co,"TextColor3","Text")
local cp=Instance.new"TextLabel"cp.BackgroundTransparency=1
cp.Position=UDim2.new(0,10,0,30)cp.Size=UDim2.new(1,-20,0,28)
cp.Font=Enum.Font.Gotham cp.TextSize=11
cp.TextXAlignment=0 cp.TextYAlignment=0
cp.TextWrapped=true cp.TextTruncate=Enum.TextTruncate.AtEnd
cp.Text=ci.Desc or""cp.Visible=false cp.Parent=cl
af:_tag(cp,"TextColor3","Dim")
local cq=Instance.new"TextButton"cq.Text=""
cq.AnchorPoint=Vector2.new(0,1)cq.Position=UDim2.new(0,10,1,-10)
cq.Size=UDim2.new(1,-20,0,28)cq.BorderSizePixel=0
bR(cq,7)cq.AutoButtonColor=false cq.Visible=false cq.Parent=cl
af:agrad(cq,15)
local cr=Instance.new"TextLabel"cr.BackgroundTransparency=1
cr.Size=UDim2.fromScale(1,1)cr.Font=Enum.Font.GothamBold
cr.TextSize=11
cr.Text="LAUNCH"cr.Parent=cq
af:oa(cr)
cm.MouseButton1Click:Connect(function()
ck=not ck
af:_sfx"Click"
bH(cl,bG.Med,{Size=UDim2.new(1/c,-8+8/c,0,ck and 118 or 68)})
cp.Visible,cq.Visible=ck,ck
end)
cq.MouseButton1Click:Connect(function()
af:_sfx"Click"bP(ci.Callback)
end)
end
return b4{Title=b1.Title or"Scripts",Frame=ca,_handle=ca}
end end function a.E():typeof(__modImpl())local aa=a.cache.E if not aa then aa={c=__modImpl()}a.cache.E=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local bG=
ab.T local bH=
ab.tween local bP=
ac.guid local bR=
ac.spawnCb
local bT=ac.corner local bV=
ac.hairline local bY=
ac.pad local bZ=
ac.lighting local b0=
ac.ripple local b1=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b4,b7)local b8=
b4.row local b9=
b4.titleBlock
local c=b4.reg local ca=
b4.tab local cb=
b4.Window
local cc=b4.Th local ce=
b4.opts or{}
b7=b7 or{}
local cg=b7.Limit or 5
local ci=Instance.new"Frame"ci.BackgroundTransparency=1
ci.Size=UDim2.new(1,-4,0,0)ci.AutomaticSize=Enum.AutomaticSize.Y
ci.Parent=page
local ck=Instance.new"UIListLayout"ck.Padding=UDim.new(0,4)
ck.SortOrder=Enum.SortOrder.LayoutOrder ck.Parent=ci
local function refresh()
for cl,cm in ipairs(ci:GetChildren())do
if cm:IsA"TextButton"then pcall(function()cm:Destroy()end)end
end
local cl=af._recent or{}
if#cl==0 then
local cm=Instance.new"TextLabel"cm.BackgroundTransparency=1
cm.Size=UDim2.new(1,0,0,24)cm.Font=Enum.Font.Gotham
cm.TextSize=11 cm.Text="Use any control and it lands here."cm.Parent=ci
af:_tag(cm,"TextColor3","Dim")
return
end
for cm=1,math.min(cg,#cl)do
local cn=cl[cm]
local co=Instance.new"TextButton"co.Text=""
co.Size=UDim2.new(1,0,0,30)co.BackgroundColor3=cc.Surface
co.BackgroundTransparency=0.35 co.BorderSizePixel=0
bT(co,7)co.Parent=ci
af:_tag(co,"BackgroundColor3","Surface")
local cp=Instance.new"TextLabel"cp.BackgroundTransparency=1
cp.Position=UDim2.new(0,10,0,0)cp.Size=UDim2.new(1,-90,1,0)
cp.Font=Enum.Font.Gotham cp.TextSize=12 cp.TextXAlignment=0
cp.TextTruncate=Enum.TextTruncate.AtEnd cp.Text=cn.label cp.Parent=co
af:_tag(cp,"TextColor3","Text")
local cq=Instance.new"TextLabel"cq.BackgroundTransparency=1
cq.AnchorPoint=Vector2.new(1,0)cq.Position=UDim2.new(1,-10,0,0)
cq.Size=UDim2.new(0,74,1,0)cq.Font=Enum.Font.Gotham
cq.TextSize=10 cq.TextXAlignment=1 cq.Text=cn.tab cq.Parent=co
af:_tag(cq,"TextColor3","Dim")
co.MouseButton1Click:Connect(function()
if cn.go then af:_sfx"Click"pcall(cn.go)end
end)
end
end
af._recentRefresh=af._recentRefresh or{}
table.insert(af._recentRefresh,refresh)
refresh()
return c{Title=b7.Title or"Recent",Frame=ci,_handle={Refresh=refresh}}
end end function a.F():typeof(__modImpl())local aa=a.cache.F if not aa then aa={c=__modImpl()}a.cache.F=aa end return aa.c end end do local function __modImpl()





local aa={
Section=a.k(),
Label=a.l(),
Paragraph=a.l(),
Divider=a.m(),
Progress=a.n(),
Log=a.o(),
Button=a.p(),
Toggle=a.q(),
Slider=a.r(),
Input=a.s(),
Dropdown=a.u(),
Keybind=a.v(),
Colorpicker=a.w(),
Profiles=a.x(),
Banner=a.y(),
StatsRow=a.z(),
Skeleton=a.A(),
Status=a.B(),
Empty=a.C(),
Profile=a.D(),
Cards=a.E(),
Recent=a.F(),
}

local function attach(ab,ac)
for ad,ae in pairs(aa)do
ab[ad]=function(af,bT)
return ae(ac,bT)
end
end
end

return{attach=attach,map=aa}end function a.G():typeof(__modImpl())local aa=a.cache.G if not aa then aa={c=__modImpl()}a.cache.G=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()
local ae=a.h()
local af=a.f()


local bT=ab.T
local b1=ab.tween local b4=
ac.spawnCb
local b7=ac.corner
local c=ac.hairline
local cc=ac.pad
local ce=ac.lighting
local cg=ad.makeIcon
local ci=a.G()

return function(ck,cl)
local cm=ck.Window
local cn=ck.opts or{}
local co=ck.Th
local cp=ck.pgui
local cq=ck.pages
local cr=ck.nav
local cs=ck.pill
local ct=ck.subLbl
cl=cl or{}
local cu=cl.Title or("Tab "..(#cm._tabs+1))
local cv=cl.Icon or cu

local f=Instance.new"TextButton"
f.Text=""
f.Size=UDim2.new(1,0,0,34)
f.BackgroundColor3=co.Surface2
f.BackgroundTransparency=1
f.BorderSizePixel=0
b7(f,8)
f.LayoutOrder=#cm._tabs+10
f.AutoButtonColor=false
f.Parent=cr
f.ZIndex=2
f.Visible=true
local g=#cm._tabs+1
local N=cg(cv,15,co.Dim)
N.AnchorPoint=Vector2.new(0,0.5)
N.Position=UDim2.new(0,14,0.5,0)
N.Parent=f
N.Visible=true
N.ZIndex=3
if N:IsA"TextLabel"then N.Size=UDim2.new(0,15,0,15)end
local S=Instance.new"TextLabel"
S.BackgroundTransparency=1
S.Position=UDim2.new(0,37,0,0)
S.Size=UDim2.new(1,-49,1,0)
S.Font=Enum.Font.GothamMedium
S.TextSize=13
S.TextXAlignment=0
S.TextTruncate=Enum.TextTruncate.AtEnd
S.Text=cu
S.Parent=f
S.Visible=true
S.TextTransparency=0
S.ZIndex=3
ae.tag(S,"TextColor3","Dim")
f.MouseEnter:Connect(function()
if cm._active and cm._active.Btn==f then return end
b1(f,bT.Hover,{BackgroundTransparency=0.55})
ae.tag(S,"TextColor3","Text")
end)
f.MouseLeave:Connect(function()
if cm._active and cm._active.Btn==f then return end
b1(f,bT.Hover,{BackgroundTransparency=1})
ae.tag(S,"TextColor3","Dim")
end)

local _=Instance.new"ScrollingFrame"
_.Visible=false
_.Size=UDim2.fromScale(1,1)
_.BackgroundTransparency=1
_.BorderSizePixel=0
_.ScrollBarThickness=3
_.ScrollBarImageColor3=co.Surface2
_.CanvasSize=UDim2.new(0,0,0,0)
_.AutomaticCanvasSize=Enum.AutomaticSize.Y
_.Parent=cq
ae.tag(_,"ScrollBarImageColor3","Surface2")
local cw=Instance.new"UIListLayout"
cw.Padding=UDim.new(0,8)
cw.SortOrder=Enum.SortOrder.LayoutOrder
cw.Parent=_
cc(_,2,8,2,6)

local cx={Title=cu,Btn=f,Page=_,Elements={},_label=S,_icon=N}
cx._pl=cw

local cy=cn.SubTitle or cn.Subtitle or"scripthub"

local function setActive(cz)
cm._active=cx
pcall(function()
ct.Text=string.upper(cy).."  /  "..string.upper(cu)
end)
for cA,cB in ipairs(cm._tabs)do
local cC=cB==cx
cB.Page.Visible=cC
local cD=cB._label
cD.TextTransparency=0
b1(cB.Btn,bT.Hover,{BackgroundTransparency=1})
if cC then
ae.tag(cD,"TextColor3","Text")
if cB._icon and cB._icon:IsA"ImageLabel"then
cB._icon.ImageTransparency=0
b1(cB._icon,bT.Hover,{ImageColor3=aa.Theme.Accent})
end
else
ae.tag(cD,"TextColor3","Dim")
if cB._icon and cB._icon:IsA"ImageLabel"then
cB._icon.ImageTransparency=0
b1(cB._icon,bT.Hover,{ImageColor3=aa.Theme.Dim})
end
end
end
b1(cs,bT.Med,{Position=UDim2.new(0,0,0,(g-1)*38-2)})
if cz then
_.Position=UDim2.new(0,14,0,0)
b1(_,bT.Med,{Position=UDim2.new(0,0,0,0)})
local cA=0
for cB,cC in ipairs(_:GetChildren())do
if cC:IsA"Frame"or cC:IsA"CanvasGroup"then
cA+=1
local cD=math.min(cA*0.02,0.3)
task.delay(cD,function()
if not cC.Parent then return end
local cE=Instance.new"Frame"
cE.Name="_cascade"
cE.Size=UDim2.fromScale(1,1)
cE.BackgroundColor3=co.Surface2
cE.BackgroundTransparency=0.55
cE.BorderSizePixel=0
b7(cE,10)
cE.Parent=cC
b1(cE,bT.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()cE:Destroy()end)end)
end)
end
end
end
end
f.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

table.insert(cm._tabs,cx)
if#cm._tabs==1 then
setActive(false)
cs.Position=UDim2.new(0,0,0,-2)
cs.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
S.TextTransparency=0
if N:IsA"ImageLabel"then N.ImageTransparency=0 end
end)
end)

local function row(cz)
local cA=Instance.new"Frame"
cA.Size=UDim2.new(1,-4,0,cz)
cA.BackgroundColor3=co.Surface
cA.BorderSizePixel=0
local cB=math.clamp((cn.Radius or 12)-2,4,12)
b7(cA,cB)
ce(cA,cB)
cA.Parent=_
c(cA,true)
ae.tag(cA,"BackgroundColor3","Surface")
local cC=cA:FindFirstChild"_light"
if cC then cC.Visible=false end
cA.BackgroundTransparency=1
task.delay(#cx.Elements*0.025,function()
b1(cA,bT.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if cC and cC.Parent then cC.Visible=true end end)
end)
return cA
end
local function titleBlock(cz,cA,cB,cC,cD)
cC=cC or 112
local cE=Instance.new"TextLabel"
cE.BackgroundTransparency=1
if cB then
cE.Position=UDim2.new(0,14,0,9)
cE.Size=UDim2.new(1,-cC,0,17)
elseif cD then
cE.Position=UDim2.new(0,14,0,8)
cE.Size=UDim2.new(1,-cC,0,17)
else
cE.Position=UDim2.new(0,14,0,0)
cE.Size=UDim2.new(1,-cC,1,0)
end
cE.Font=Enum.Font.GothamMedium
cE.TextSize=13
cE.TextXAlignment=0
cE.TextTruncate=Enum.TextTruncate.AtEnd
cE.Text=cA
cE.Parent=cz
ae.tag(cE,"TextColor3","Text")
if cB then
local cF=Instance.new"TextLabel"
cF.BackgroundTransparency=1
cF.Position=UDim2.new(0,14,0,30)
cF.Size=UDim2.new(1,-cC,0,14)
cF.Font=Enum.Font.Gotham
cF.TextSize=11
cF.TextXAlignment=0
cF.TextTruncate=Enum.TextTruncate.AtEnd
cF.Text=cB
cF.Parent=cz
ae.tag(cF,"TextColor3","Dim")
end
end
local function reg(cz)
table.insert(cx.Elements,cz)
cz._tab=cx
if not cz._go then
cz._go=function()
if cm._activateTab then cm._activateTab(cx,true)end
cm:_flash(cz.Frame)
end
end
if cz.Flag and cz._set then
aa._live[cz.Flag]=aa._live[cz.Flag]or{}
table.insert(aa._live[cz.Flag],cz._set)
if aa.Flags["_loaded_"..cz.Flag]~=nil then
local cA=aa.Flags["_loaded_"..cz.Flag]
aa.Flags["_loaded_"..cz.Flag]=nil
task.defer(function()pcall(cz._set,cA,true)end)
elseif cz.Value~=nil and aa.Flags[cz.Flag]==nil then
aa.Flags[cz.Flag]=cz.Value
end
elseif cz.Flag and cz.Value~=nil and aa.Flags[cz.Flag]==nil then
aa.Flags[cz.Flag]=cz.Value
end
return cz._handle
end

local cz={}
local cA={row=row,titleBlock=titleBlock,reg=reg,tab=cx,Window=cm,Th=co,opts=cn,page=_,pgui=cp}
ci.attach(cz,cA)

cx.Api=cz
cx._window=cm
cx._activate=function(cB)setActive(cB~=false)end
for cB,cC in pairs(cz)do cx[cB]=function(cD,...)return cC(cx,...)end end
return cx
end end function a.H():typeof(__modImpl())local aa=a.cache.H if not aa then aa={c=__modImpl()}a.cache.H=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.b()
local ae=a.e()a.h()a.f()


local af=a.g()
local bT=a.j()
local b1=a.H()
local b4=a.t()

local b7=aa
local c=ab.T
local cc=ab.tween
local ce=ac.spawnCb
local cg=ac.corner
local ci=ac.hairline
local ck=ac.pad
local cl=ac.lighting
local cm=ac.topLight
local cn=ac.shadow
local co=ac.makeDraggable
local cp=ae.makeIcon
local cq=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(cr)
local cs=cr:FindFirstChild"Notification"
if cs then return cs end
cs=Instance.new"Frame"
cs.Name="Notification"
cs.AnchorPoint=Vector2.new(1,1)
cs.Position=UDim2.new(1,-18,1,-18)
cs.Size=UDim2.new(0,300,1,-36)
cs.BackgroundTransparency=1
cs.Parent=cr
local ct=Instance.new"UIListLayout"
ct.VerticalAlignment=Enum.VerticalAlignment.Bottom
ct.Padding=UDim.new(0,10)
ct.SortOrder=Enum.SortOrder.LayoutOrder
ct.Parent=cs
return cs
end

local function bumpRecent(cr,cs,ct)
if not cs or cs==""then return end
for cu,cv in ipairs(aa._recent)do
if cv.label==cs and cv.tab==cr then table.remove(aa._recent,cu)break end
end
table.insert(aa._recent,1,{tab=cr,label=cs,go=ct})
while#aa._recent>8 do table.remove(aa._recent)end
for cu,cv in ipairs(aa._recentRefresh)do pcall(cv)end
end
aa._bumpRecent=function(cr,cs,ct,cu)
return bumpRecent(cs,ct,cu)
end







local cr={}
local function flyTo(cs,ct,cu,cv)
local cw=cr[cs]
if cw then pcall(function()cw:Cancel()end)end
cr[cs]=nil
local cx=cc(cs,cu or c.Med,ct)
if not cx then
pcall(function()
for cy,cz in pairs(ct)do cs[cy]=cz end
end)
if cv then cv()end
return nil
end
cr[cs]=cx
if cv then
cx.Completed:Connect(function(cy)
if cr[cs]==cx then
cr[cs]=nil
if cy==Enum.PlaybackState.Completed then cv()end
end
end)
end
return cx
end

return function(cs,ct)
ct=ct or{}
local cu=ct.Title or"Kronos"
local cv=ct.SubTitle or ct.Subtitle or"scripthub"
local cw=ct.ToggleKey or Enum.KeyCode.RightControl
local cx=ct.Acrylic
if cx==nil then cx=true end
if ct.Theme then cs:SetTheme(ct.Theme)end
local cy=cs.Theme
cs:SetAcrylic(cx,ct.Blur or 16)

local cz=ad.GetRoot()
if cs._gui then pcall(function()cs._gui:Destroy()end)end

local cA=Instance.new"ScreenGui"
cA.Name=ad.GetStealthName()cA.ResetOnSpawn=false cA.IgnoreGuiInset=true cA.DisplayOrder=999
cA.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(cA)
cA.Parent=cz
cs._gui=cA



local cB=Instance.new"ScreenGui"
cB.Name=ad.GetStealthName()cB.ResetOnSpawn=false cB.IgnoreGuiInset=true cB.DisplayOrder=1000
cB.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(cB)
cB.Parent=cz

local cC=Instance.new"Frame"
cC.Name="Dim"cC.Size=UDim2.fromScale(1,1)
cC.BackgroundColor3=Color3.fromRGB(3,4,7)cC.BackgroundTransparency=1
cC.BorderSizePixel=0 cC.Parent=cA
cc(cC,c.Slow,{BackgroundTransparency=0.5})


if ct.Ambient~=false then
local cD=Instance.new"Frame"cD.Name="_ambient"
cD.AnchorPoint=Vector2.new(0.5,0.5)cD.Position=UDim2.new(0.5,0,0.5,0)
cD.Size=UDim2.new(1.4,0,1.4,0)cD.BackgroundColor3=Color3.fromRGB(255,255,255)
cD.BackgroundTransparency=0 cD.BorderSizePixel=0 cD.Parent=cC
local cE=Instance.new"UIGradient"cE.Rotation=25
cE.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,cy.Accent),
ColorSequenceKeypoint.new(1,cy.Accent2 or cy.Accent)}
cE.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
cE.Parent=cD
table.insert(b7._gradients,cE)
task.spawn(function()
while cA.Parent do
cc(cE,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not cA.Parent then break end
cc(cE,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local cD=Instance.new"CanvasGroup"
cD.Name="Main"cD.AnchorPoint=Vector2.new(0.5,0.5)
cD.Position=UDim2.new(0.5,0,0.5,0)cD.Size=UDim2.fromOffset(620,440)
cD.BackgroundColor3=cy.Surface
cD.BackgroundTransparency=(cx and not cs._transparent)and 0.08 or 0
cD.GroupTransparency=1 cD.BorderSizePixel=0 cD.Parent=cA
cg(cD,ct.Radius or 12)ci(cD,true)cm(cD)cn(cD,0.5,48)
local cE=Instance.new"UIScale"cE.Scale=0.94 cE.Parent=cD





local function brandInto(cF,f)
if ct.Logo and ct.Logo~=""then
local g=Instance.new"ImageLabel"g.BackgroundTransparency=1
g.AnchorPoint=Vector2.new(0.5,0.5)g.Position=UDim2.new(0.5,0,0.5,0)
g.Size=UDim2.new(1,-8,1,-8)g.Image=ct.Logo
g.ScaleType=Enum.ScaleType.Fit g.Parent=cF
cg(g,8)
if f then f.Visible=false end
return g
end
return nil
end


local function kronosFace(cF,f,g,N)
local S=g or 26
local _=Instance.new"Frame"_.Name="_disc"
_.AnchorPoint=Vector2.new(0.5,0.5)_.Position=UDim2.new(0.5,0,0.5,0)
_.Size=UDim2.fromOffset(S,S)_.BackgroundColor3=Color3.fromRGB(0,0,0)
_.BorderSizePixel=0 _.Parent=cF
local cG=Instance.new"UICorner"cG.CornerRadius=UDim.new(0.5,0)cG.Parent=_
local cH=Instance.new"UIStroke"cH.Thickness=2
cH.Color=Color3.fromRGB(255,255,255)cH.Transparency=0.12 cH.Parent=_
pcall(function()
local cI=Instance.new"UIShadow"cI.Color=Color3.fromRGB(255,255,255)
cI.Transparency=0.82 cI.BlurSize=10 cI.Parent=_
end)
if f then
f.AnchorPoint=Vector2.new(0.5,0.5)f.Position=UDim2.new(0.5,0,0.5,0)
f.Size=UDim2.fromOffset(S,S)f.TextSize=N or 16
f.ZIndex=2
end
return _
end

local function playEntrance()
b7:_sfx"Open"
cc(cD,c.Slow,{GroupTransparency=0})
cc(cE,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1})
end
playEntrance()


local cF=Instance.new"Frame"
cF.Size=UDim2.new(1,-24,0,2)cF.Position=UDim2.new(0,12,0,0)
cF.BackgroundTransparency=1 cF.Parent=cD
local cG=Instance.new"Frame"cG.Size=UDim2.new(0,0,1,0)
cg(cG,99)cG.Parent=cF
b7:agrad(cG,0)
cc(cG,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()cF:Destroy()end)end)


local cH=Instance.new"Frame"
cH.Name="Header"cH.Size=UDim2.new(1,0,0,62)
cH.BackgroundTransparency=1 cH.Parent=cD
ck(cH,14,6,14,14)


local cI=Instance.new"Frame"cI.Name="Mark"
cI.Size=UDim2.fromOffset(36,36)cI.BackgroundColor3=cy.Surface2
cI.BorderSizePixel=0 cg(cI,10)cI.Parent=cH
ci(cI,true)
local f=Instance.new"TextLabel"f.Size=UDim2.fromScale(1,1)
f.BackgroundTransparency=1 f.Font=Enum.Font.GothamBlack
f.TextSize=18 cs:_tag(f,"TextColor3","Text")f.Text="K"f.Parent=cI
local g=Instance.new"Frame"g.Size=UDim2.fromOffset(8,8)
g.Position=UDim2.new(1,-5,0,-3)g.BorderSizePixel=0
cs:_tag(g,"BackgroundColor3","Accent")
cg(g,99)g.Parent=cI
brandInto(cI,f)
if not ct.Logo or ct.Logo==""then kronosFace(cI,f,26,15)end

local N=Instance.new"TextLabel"N.BackgroundTransparency=1
N.Position=UDim2.new(0,48,0,0)N.Size=UDim2.new(0,230,0,20)
N.Font=Enum.Font.GothamBold N.TextSize=15 N.TextXAlignment=0
cs:_tag(N,"TextColor3","Text")N.Text=cu N.Parent=cH
local S=Instance.new"TextLabel"S.BackgroundTransparency=1
S.Position=UDim2.new(0,48,0,21)S.Size=UDim2.new(0,230,0,15)
S.Font=Enum.Font.Gotham S.TextSize=11 N.TextXAlignment=0
S.TextXAlignment=0 cs:_tag(S,"TextColor3","Dim")
S.Text=string.upper(cv).."  |  V"..cs.Version S.Parent=cH


local _=Instance.new"Frame"
_.AnchorPoint=Vector2.new(1,0)_.Position=UDim2.new(1,-64,0,4)
_.Size=UDim2.new(0,170,0,32)_.BackgroundColor3=cy.Bg
_.BorderSizePixel=0 cg(_,8)_.Parent=cH
ci(_,true)
local cJ=cp("search",14,cy.Dim)
cJ.Position=UDim2.new(0,9,0.5,-7)cJ.Parent=_
local cK=Instance.new"TextBox"cK.PlaceholderText="Search"
cK.PlaceholderColor3=cy.Dim cK.Text=""cK.Font=Enum.Font.GothamBold
cK.TextSize=12 cs:_tag(cK,"TextColor3","Text")
cK.Position=UDim2.new(0,28,0,0)cK.Size=UDim2.new(1,-80,1,0)
cK.BackgroundTransparency=1 cK.ClearTextOnFocus=false cK.Parent=_
local cL=Instance.new"TextLabel"cL.BackgroundTransparency=1
cL.AnchorPoint=Vector2.new(1,0.5)cL.Position=UDim2.new(1,-8,0.5,0)
cL.Size=UDim2.new(0,44,0,18)cL.Font=Enum.Font.Code cL.TextSize=11
cs:_tag(cL,"TextColor3","Text")cL.Text="Ctrl K"cL.Parent=_
cs:_tag(_,"BackgroundColor3","Bg")


local cM=Instance.new"TextButton"cM.Text=""
cM.AnchorPoint=Vector2.new(1,0)cM.Position=UDim2.new(1,-242,0,4)
cM.Size=UDim2.fromOffset(32,32)cM.BackgroundColor3=cy.Bg
cM.BorderSizePixel=0 cg(cM,8)cM.Parent=cH
ci(cM,true)
cs:_tag(cM,"BackgroundColor3","Bg")
local cN=cp("keyboard",15,cy.Dim)
cN.AnchorPoint=Vector2.new(0.5,0.5)cN.Position=UDim2.new(0.5,0,0.5,0)
cN.Parent=cM
cM.MouseButton1Click:Connect(function()end)

local cO=Instance.new"TextButton"cO.Text=""
cO.AnchorPoint=Vector2.new(1,0)cO.Position=UDim2.new(1,-282,0,4)
cO.Size=UDim2.fromOffset(32,32)cO.BackgroundColor3=cy.Bg
cO.BorderSizePixel=0 cg(cO,8)cO.Parent=cH
ci(cO,true)
cs:_tag(cO,"BackgroundColor3","Bg")
local cP=cp("menu",15,cy.Dim)
cP.AnchorPoint=Vector2.new(0.5,0.5)cP.Position=UDim2.new(0.5,0,0.5,0)
cP.Parent=cO
cO.MouseButton1Click:Connect(function()end)


local cQ=Instance.new"Frame"cQ.BackgroundTransparency=1
cQ.AnchorPoint=Vector2.new(1,0)cQ.Position=UDim2.new(1,0,0,4)
cQ.Size=UDim2.new(0,56,0,32)cQ.Parent=cH
local cR=Instance.new"UIListLayout"cR.FillDirection=Enum.FillDirection.Horizontal
cR.VerticalAlignment=Enum.VerticalAlignment.Center
cR.HorizontalAlignment=Enum.HorizontalAlignment.Center
cR.Padding=UDim.new(0,7)cR.Parent=cQ
local function dot(cS,cT)
local cU=Instance.new"TextButton"cU.Text=""
cU.Size=UDim2.fromOffset(12,12)cU.BackgroundColor3=cS
cU.BorderSizePixel=0 cg(cU,99)cU.AutoButtonColor=false cU.Parent=cQ
cU.MouseEnter:Connect(function()cc(cU,c.Hover,{BackgroundTransparency=0.25})end)
cU.MouseLeave:Connect(function()cc(cU,c.Hover,{BackgroundTransparency=0})end)
return cU
end
local cS=dot(Color3.fromRGB(39,201,63))
local cT=dot(Color3.fromRGB(255,189,46))
local cU=dot(Color3.fromRGB(255,95,86))
cU.MouseButton1Click:Connect(function()end)
cT.MouseButton1Click:Connect(function()end)
cS.MouseButton1Click:Connect(function()end)


local cV=Instance.new"TextButton"cV.Text=""
cV.AnchorPoint=Vector2.new(1,0)cV.Position=UDim2.new(1,-322,0,4)
cV.Size=UDim2.fromOffset(32,32)cV.BackgroundColor3=cy.Bg
cV.BorderSizePixel=0 cg(cV,8)cV.Parent=cH
ci(cV,true)
cs:_tag(cV,"BackgroundColor3","Bg")
local cW=cp("bellring",14,cy.Dim)
cW.AnchorPoint=Vector2.new(0.5,0.5)cW.Position=UDim2.new(0.5,0,0.5,0)
cW.Parent=cV
local cX=Instance.new"Frame"cX.Size=UDim2.fromOffset(8,8)
cX.Position=UDim2.new(1,-7,0,3)cX.BorderSizePixel=0
cX.BackgroundColor3=Color3.fromRGB(248,113,113)
cg(cX,99)cX.Parent=cV cX.Visible=false
cV.MouseButton1Click:Connect(function()end)

co(cH,cD)


local cY=Instance.new"Frame"cY.Name="Body"
cY.Position=UDim2.new(0,0,0,62)cY.Size=UDim2.new(1,0,1,-62)
cY.BackgroundTransparency=1 cY.Parent=cD
local cZ=Instance.new"UIPadding"cZ.PaddingLeft=UDim.new(0,12)
cZ.PaddingRight=UDim.new(0,12)cZ.PaddingBottom=UDim.new(0,12)cZ.Parent=cY

local c_=Instance.new"Frame"c_.Name="Sidebar"
c_.Size=UDim2.new(0,164,1,0)c_.BackgroundColor3=cy.Bg
c_.BackgroundTransparency=(cx and not cs._transparent)and 0.15 or 0
c_.BorderSizePixel=0 cg(c_,10)c_.Parent=cY
ci(c_,true)
cs:_tag(c_,"BackgroundColor3","Bg")
cl(c_,10)
ck(c_,8,8,8,8)

local c0=Instance.new"Frame"c0.Name="Nav"
c0.Size=UDim2.new(1,0,1,0)c0.BackgroundTransparency=1 c0.Parent=c_
local c1=Instance.new"UIListLayout"c1.Padding=UDim.new(0,4)
c1.SortOrder=Enum.SortOrder.LayoutOrder c1.Parent=c0




local c2=Instance.new"Frame"c2.Name="_pill"
c2.Size=UDim2.new(1,0,0,38)c2.Position=UDim2.new(0,0,0,-2)
c2.BackgroundColor3=cy.Surface2 c2.BorderSizePixel=0
c2.ZIndex=0
cg(c2,8)c2.Parent=c_
ci(c2,true)
cs:_tag(c2,"BackgroundColor3","Surface2")

local c3=Instance.new"Frame"c3.Name="Pages"
c3.Position=UDim2.new(0,176,0,0)c3.Size=UDim2.new(1,-176,1,0)
c3.BackgroundTransparency=1 c3.ClipsDescendants=true c3.Parent=cY

local c4={
_gui=cA,_main=cD,_side=c_,_nav=c0,_pages=c3,_pill=c2,
_tabs={},_active=nil,_toggleKey=cw,_visible=true,_keybinds={},
_conns={},_acrylicPref=cx,
}

function c4.Track(c5,c6)table.insert(c5._conns,c6)return c6 end
local c5
local c6
local c7,c8
c4._cfgTitle=cu

function c4._activateTab(c9,da)
if c9 and c9._activate then pcall(c9._activate,da~=false)end
end

function c4._flash(c9,da)
if not da or not da.Parent then return end
local db=Instance.new"Frame"db.Name="_flash"
db.Size=UDim2.fromScale(1,1)db.BackgroundColor3=cy.Accent
db.BackgroundTransparency=0.75 db.BorderSizePixel=0
cg(db,10)db.Parent=da
cc(db,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()db:Destroy()end)end)
end

c4:Track(cq.InputBegan:Connect(function(c9,da)
if da then return end
if c9.KeyCode==c4._toggleKey then c4:Toggle()end
if c9.KeyCode==Enum.KeyCode.K and cq:IsKeyDown(Enum.KeyCode.LeftControl)then
c4:TogglePalette()
end
if c9.KeyCode==Enum.KeyCode.P and cq:IsKeyDown(Enum.KeyCode.LeftControl)then
c4:TogglePalette()
end
if c9.KeyCode==Enum.KeyCode.Tab and cq:IsKeyDown(Enum.KeyCode.LeftControl)then
local db=table.find(c4._tabs,c4._active)or 0
local dc=c4._tabs[(db%#c4._tabs)+1]
if dc then b7:_sfx"Swap"c4._activateTab(dc,true)end
end
end))

cK:GetPropertyChangedSignal"Text":Connect(function()
local c9=string.lower(cK.Text)
for da,db in ipairs(c4._tabs)do
local dc=c9==""or string.find(string.lower(db.Title),c9,1,true)~=nil
for dd,de in ipairs(db.Elements)do
local df
if c9==""then
df=true
elseif dc then
df=true
else

local dg=string.lower(tostring(de.Title or"").." "..tostring(de.Flag or""))
local dh=de._handle
if dh and type(dh.Get)=="function"then
local di,dj=pcall(dh.Get,dh)
if di then
if type(dj)=="string"or type(dj)=="number"then
dg=dg.." "..string.lower(tostring(dj))
elseif type(dj)=="table"then
for dk,dl in ipairs(dj)do dg=dg.." "..string.lower(tostring(dl))end
end
end
end
df=string.find(dg,c9,1,true)~=nil
end
de._searchVisible=(c9=="")and nil or df
if de.Frame then de.Frame.Visible=df end
end
db.Btn.Visible=(dc or c9=="")
if c9~=""then

for dd,de in ipairs(db.Elements)do
if de.Frame and de.Frame.Visible then db.Btn.Visible=true break end
end
else

for dd,de in ipairs(db.Elements)do
if de._refreshSection then pcall(de._refreshSection)end
end
end
end
end)


cK.Focused:Connect(function()end)
cK.FocusLost:Connect(function()
_.Size=UDim2.new(0,170,0,32)
end)

function c4.SetVisible(c9,da)
c9._visible=da

local function pillTarget()
local db,dc=cA.AbsoluteSize.X,cA.AbsoluteSize.Y
if db<1 then db,dc=1200,800 end
local dd,de=c5.AbsolutePosition,c5.AbsoluteSize
return UDim2.new(0,dd.X+de.X/2-db/2,0,dd.Y+de.Y/2-dc/2)
end
if da then
cA.Enabled=true
c9._mini=false
if c7 then c7.Visible=false end
if c5 then c5.Visible=false end
cD.Position=pillTarget()
cE.Scale=0.55
cD.GroupTransparency=1
cC.BackgroundTransparency=1
if c9._acrylicPref then b7:SetAcrylic(true,ct.Blur or 16)end
b7:_sfx"Open"

cc(cD,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=c9._lastPos or UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
cc(cE,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1})
cc(cC,c.Med,{BackgroundTransparency=0.5})
else
c9._mini=false
c9._lastPos=cD.Position
if c7 then c7.Visible=false end
b7:SetAcrylic(false)
for db,dc in pairs(b7.Sound._cache)do pcall(function()dc:Stop()end)end
cc(cD,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
cc(cE,c.Fast,{Scale=0.55})
cc(cC,c.Fast,{BackgroundTransparency=1})
task.delay(0.36,function()
if c9._visible then return end
cA.Enabled=false
if c5 then
c5.Visible=true
c6.Scale=0.5
cc(c6,c.Spring,{Scale=1})
end
end)
end
end
function c4.Toggle(c9)c9:SetVisible(not c9._visible)end


function c4.SetToggleKey(c9,da)
if type(da)=="string"then da=Enum.KeyCode[da]end
if typeof(da)=="EnumItem"then
if c9._toggleKey==da then return end
c9._toggleKey=da
c9:Notify{Title="Hide key",Content="Now bound to "..da.Name,Duration=1.5}
end
end
function c4.GetToggleKey(c9)return c9._toggleKey end


function c4.OnClose(c9,da)
if type(da)=="function"then c9._onCloseCb=da end
end

function c4.SetMini(c9,da)
da=da and true or false
if da==c9._mini then return end
c9._mini=da
if da then
c9._visible=false
c9._lastPos=cD.Position
c5.Visible=false
b7:SetAcrylic(false)
for db,dc in pairs(b7.Sound._cache)do pcall(function()dc:Stop()end)end
cc(cD,c.Fast,{GroupTransparency=1})
cc(cE,c.Fast,{Scale=0.7})
cc(cC,c.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()
if not c9._mini then return end
cA.Enabled=false
c7.Visible=true
c8.Scale=0.5
cc(c8,c.Spring,{Scale=1})
end)
else
c7.Visible=false
c9:SetVisible(true)
end
end


local c9=Instance.new"UIScale"c9.Parent=cD
local da=Instance.new"UIScale"da.Scale=1 da.Parent=cD
c4._sbMode=0
c4._focus=false
function c4._applyLayout(db)
local dc=db._focus and 2 or db._sbMode
local dd=dc==1
c_.Visible=dc~=2
if dc==0 then
cc(c_,c.Fast,{Size=UDim2.new(0,164,1,0)})
c3.Position=UDim2.new(0,176,0,0)
c3.Size=UDim2.new(1,-176,1,0)
elseif dc==1 then
cc(c_,c.Fast,{Size=UDim2.new(0,58,1,0)})
c3.Position=UDim2.new(0,70,0,0)
c3.Size=UDim2.new(1,-70,1,0)
else
c3.Position=UDim2.new(0,0,0,0)
c3.Size=UDim2.new(1,0,1,0)
end
for de,df in ipairs(db._tabs)do
if df._label then df._label.Visible=not dd end
if df._icon and df._icon:IsA"GuiObject"then
df._icon.Position=dd and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end
end
function c4.CycleSidebar(db)
db._sbMode=(db._sbMode+1)%3
db:_applyLayout()
db:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[db._sbMode+1],Duration=1.5}
end
function c4.SetFocus(db,dc)
db._focus=dc and true or false
db:_applyLayout()
end
local function fitCard()
local db=Vector2.new(1200,800)
pcall(function()db=workspace.CurrentCamera.ViewportSize end)
local dc=math.clamp(math.min(db.X/700,db.Y/520),0.6,1)
c9.Scale=dc
if db.X<760 or cq.TouchEnabled then
if c4._sbMode==0 and not c4._userToggledSide then
c4._sbMode=2 c4:_applyLayout()
end
end
end
cO.MouseButton1Click:Connect(function()
b7:_sfx"Click"
c4._userToggledSide=true
c4:CycleSidebar()
end)
cM.MouseButton1Click:Connect(function()
b7:_sfx"Click"c4:ToggleKeybindList()
end)


local db=ct.ConfirmClose
if db==nil then db=true end
local function requestClose()
b7:_sfx"Click"
if db==false then c4:Destroy()return end
local dc=(type(db)=="table")and db or{}
c4:Dialog{
Title=dc.Title or"Close Kronos?",
Content=dc.Content or"The hub will close permanently and all features will be disabled.",
Buttons={
{Title=dc.Cancel or"Cancel"},
{Title=dc.Confirm or"Close",Callback=function()c4:Destroy()end},
},
}
end
cU.MouseButton1Click:Connect(function()requestClose()end)
cT.MouseButton1Click:Connect(function()
b7:_sfx"Click"c4:SetMini(not c4._mini)
end)
c4._zoomed=false
cS.MouseButton1Click:Connect(function()
b7:_sfx"Click"
c4._zoomed=not c4._zoomed
cc(cD,c.Med,{Size=c4._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
cV.MouseButton1Click:Connect(function()
b7:_sfx"Click"c4:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
c4:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

c5=Instance.new"TextButton"c5.Name=ad.GetStealthName()
c5.Text=""
c5.AnchorPoint=Vector2.new(0,0.5)c5.Position=UDim2.new(0,12,0.5,0)
c5.Size=UDim2.fromOffset(42,42)
c5.BackgroundColor3=cy.Surface2 c5.BorderSizePixel=0
cs:_tag(c5,"BackgroundColor3","Surface2")
cg(c5,13)c5.Parent=cA c5.Visible=false
ci(c5,true)
cn(c5,0.6,20)

local dc=Instance.new"TextLabel"dc.Size=UDim2.fromScale(1,1)
dc.BackgroundTransparency=1 dc.Font=Enum.Font.GothamBlack
dc.TextSize=20 dc.Text="K"dc.Parent=c5
cs:_tag(dc,"TextColor3","Text")
local dd=Instance.new"Frame"dd.Size=UDim2.fromOffset(9,9)
dd.Position=UDim2.new(1,-6,0,-3)dd.BorderSizePixel=0
cs:_tag(dd,"BackgroundColor3","Accent")
cg(dd,99)dd.Parent=c5
brandInto(c5,dc)
if not ct.Logo or ct.Logo==""then kronosFace(c5,dc,32,17)end
c6=Instance.new"UIScale"c6.Parent=c5
co(c5,c5)
c5.MouseButton1Click:Connect(function()c4:SetVisible(true)end)


c7=Instance.new"TextButton"c7.Name=ad.GetStealthName()
c7.Text=""
c7.AnchorPoint=Vector2.new(0,0)c7.Position=UDim2.new(0,12,0,12)
c7.Size=UDim2.fromOffset(44,44)
c7.BackgroundColor3=cy.Surface2 c7.BorderSizePixel=0
cs:_tag(c7,"BackgroundColor3","Surface2")
cg(c7,13)c7.Parent=cz c7.Visible=false
ci(c7,true)
cn(c7,0.6,20)
local de=Instance.new"TextLabel"de.Size=UDim2.fromScale(1,1)
de.BackgroundTransparency=1 de.Font=Enum.Font.GothamBlack
de.TextSize=20 de.Text="K"de.Parent=c7
cs:_tag(de,"TextColor3","Text")
local df=Instance.new"Frame"df.Size=UDim2.fromOffset(9,9)
df.Position=UDim2.new(1,-6,0,-3)df.BorderSizePixel=0
cs:_tag(df,"BackgroundColor3","Accent")
cg(df,99)df.Parent=c7
brandInto(c7,de)
if not ct.Logo or ct.Logo==""then kronosFace(c7,de,34,17)end
c8=Instance.new"UIScale"c8.Parent=c7
co(c7,c7)
c7.MouseButton1Click:Connect(function()c4:SetMini(false)end)


local dg=Instance.new"TextButton"dg.Text=""
dg.AnchorPoint=Vector2.new(1,1)dg.Position=UDim2.new(1,0,1,0)
dg.Size=UDim2.fromOffset(28,28)dg.BackgroundTransparency=1
dg.Parent=cD dg.ZIndex=50
dg.ClipsDescendants=true


local dh=0
dg.MouseButton1Click:Connect(function()
local di=os.clock()
if di-dh<0.35 then
b7:_sfx"Click"
c4._zoomed=not c4._zoomed
cc(cD,c.Med,{Size=c4._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
dh=di
end)
local di,dj,dk=false
dg.InputBegan:Connect(function(dl)
if dl.UserInputType==Enum.UserInputType.MouseButton1 or dl.UserInputType==Enum.UserInputType.Touch then
di,dj,dk=true,dl.Position,cD.Size
dl.Changed:Connect(function()
if dl.UserInputState==Enum.UserInputState.End then di=false end
end)
end
end)
c4:Track(cq.InputChanged:Connect(function(dl)
if not di then return end
if dl.UserInputType~=Enum.UserInputType.MouseMovement
and dl.UserInputType~=Enum.UserInputType.Touch then return end
local dm=dl.Position-dj
cD.Size=UDim2.fromOffset(
math.clamp(dk.X.Offset+dm.X,520,920),
math.clamp(dk.Y.Offset+dm.Y,380,660))
end))

function c4.Notify(dl,dm)
dm=dm or{}
b7:_sfx"Notify"
b4.closeAny()
table.insert(b7._inbox,1,{Title=dm.Title or"Kronos",
Content=dm.Content or dm.Text or"",At=os.date"%H:%M"})
while#b7._inbox>30 do table.remove(b7._inbox)end
pcall(function()cX.Visible=true end)
local dn=ensureNotifyHost(cB)
local dp=Instance.new"CanvasGroup"dp.Size=UDim2.new(1,0,0,62)
dp.BackgroundColor3=cy.Surface2 dp.BorderSizePixel=0 dp.GroupTransparency=1
cg(dp,10)dp.Parent=dn
ci(dp,true)
cn(dp,0.65,24)
b7:_tag(dp,"BackgroundColor3","Surface2")
dp.Position=UDim2.new(0,40,0,0)
cc(dp,c.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local dq=Instance.new"TextLabel"dq.BackgroundTransparency=1
dq.Position=UDim2.new(0,12,0,8)dq.Size=UDim2.new(1,-24,0,17)
dq.Font=Enum.Font.GothamBold dq.TextSize=13 dq.TextXAlignment=0
b7:_tag(dq,"TextColor3","Text")dq.Text=dm.Title or"Kronos"dq.Parent=dp
local dr=Instance.new"TextLabel"dr.BackgroundTransparency=1
dr.Position=UDim2.new(0,12,0,27)dr.Size=UDim2.new(1,-24,0,16)
dr.Font=Enum.Font.Gotham dr.TextSize=12 dr.TextXAlignment=0
b7:_tag(dr,"TextColor3","Dim")
dr.TextTruncate=Enum.TextTruncate.AtEnd dr.Text=dm.Content or dm.Text or""dr.Parent=dp
local ds=Instance.new"Frame"ds.AnchorPoint=Vector2.new(0,1)
ds.Position=UDim2.new(0,10,1,-6)ds.Size=UDim2.new(1,-20,0,2)
ds.BorderSizePixel=0 b7:agrad(ds,0)
cg(ds,99)ds.Parent=dp
local dt=dm.Duration or 4
cc(ds,TweenInfo.new(dt,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(dt+0.1,function()
cc(dp,c.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()dp:Destroy()end)end)
end)
end


function c4.Dialog(dl,dm)
dm=dm or{}
b7:_sfx"Open"
local dn=Instance.new"TextButton"dn.Text=""dn.AutoButtonColor=false
dn.Size=UDim2.fromScale(1,1)dn.BackgroundColor3=Color3.fromRGB(0,0,0)
dn.BackgroundTransparency=1 dn.Parent=cA
cc(dn,c.Med,{BackgroundTransparency=0.55})
local dp=Instance.new"CanvasGroup"dp.AnchorPoint=Vector2.new(0.5,0.5)
dp.Position=UDim2.new(0.5,0,0.5,0)dp.Size=UDim2.fromOffset(320,170)
dp.BackgroundColor3=cy.Surface dp.BorderSizePixel=0 dp.GroupTransparency=1
cg(dp,12)dp.Parent=dn
ci(dp,true)
cl(dp,12)
cn(dp,0.5,40)
b7:_tag(dp,"BackgroundColor3","Surface")
local dq=Instance.new"UIScale"dq.Scale=0.94 dq.Parent=dp
cc(dp,c.Med,{GroupTransparency=0})
cc(dq,c.Spring,{Scale=1})
local dr=false
local function close()
if dr then return end dr=true
b4.close(close)
cc(dp,c.Fast,{GroupTransparency=1})
cc(dn,c.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dn:Destroy()end)end)
end
b4.open(close)
dn.MouseButton1Click:Connect(function()close()end)
local ds=Instance.new"TextLabel"ds.BackgroundTransparency=1
ds.Position=UDim2.new(0,16,0,14)ds.Size=UDim2.new(1,-32,0,20)
ds.Font=Enum.Font.GothamBold ds.TextSize=15 ds.TextXAlignment=0
b7:_tag(ds,"TextColor3","Text")ds.Text=dm.Title or"Confirm"ds.Parent=dp
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Position=UDim2.new(0,16,0,38)dt.Size=UDim2.new(1,-32,0,60)
dt.Font=Enum.Font.Gotham dt.TextSize=12 ds.TextXAlignment=0
dt.TextXAlignment=0 dt.TextYAlignment=0 dt.TextWrapped=true
b7:_tag(dt,"TextColor3","Dim")dt.Text=dm.Content or""dt.Parent=dp
local du=Instance.new"Frame"du.BackgroundTransparency=1
du.AnchorPoint=Vector2.new(0,1)du.Position=UDim2.new(0,0,1,-12)
du.Size=UDim2.new(1,0,0,34)du.Parent=dp
local dv=Instance.new"UIListLayout"dv.FillDirection=Enum.FillDirection.Horizontal
dv.HorizontalAlignment=Enum.HorizontalAlignment.Right dv.Padding=UDim.new(0,8)dv.Parent=du
ck(du,0,0,12,12)
for dw,dx in ipairs(dm.Buttons or{{Title="OK"}})do
local dy=Instance.new"TextButton"dy.Text=""
dy.Size=UDim2.new(0,96,0,30)dy.BackgroundColor3=cy.Surface2
dy.BorderSizePixel=0 cg(dy,7)dy.AutoButtonColor=false dy.Parent=du
ci(dy,true)
b7:_tag(dy,"BackgroundColor3","Surface2")
local dz=Instance.new"TextLabel"dz.BackgroundTransparency=1 dz.Size=UDim2.fromScale(1,1)
dz.Font=Enum.Font.GothamBold dz.TextSize=12
b7:_tag(dz,"TextColor3","Text")dz.Text=dx.Title dz.Parent=dy
local dA=Instance.new"UIScale"dA.Parent=dy
dy.MouseButton1Down:Connect(function()cc(dA,c.Hover,{Scale=0.95})end)
dy.MouseButton1Up:Connect(function()cc(dA,c.Spring,{Scale=1})end)
dy.MouseButton1Click:Connect(function()
close()ce(dx.Callback)
end)
end
return{Close=close}
end




function c4.KeySystem(dl,dm)
dm=dm or{}
local dn,dp=false,dm.FileName or("kronos_key_"..tostring(cu))

if dm.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(dp..".txt")then
local dq=readfile(dp..".txt")
if dq and dl:_checkKey(dm,dq)then dn=true end
end
end)
end
local dq=Instance.new"TextButton"dq.Text=""dq.AutoButtonColor=false
dq.Size=UDim2.fromScale(1,1)dq.BackgroundColor3=Color3.fromRGB(0,0,0)
dq.BackgroundTransparency=1 dq.ZIndex=200 dq.Parent=cA
cc(dq,c.Med,{BackgroundTransparency=0.6})
local dr=Instance.new"CanvasGroup"dr.AnchorPoint=Vector2.new(0.5,0.5)
dr.Position=UDim2.new(0.5,0,0.5,0)dr.Size=UDim2.fromOffset(300,210)
dr.BackgroundColor3=cy.Surface dr.BorderSizePixel=0 dr.GroupTransparency=1
cg(dr,12)dr.Parent=dq
ci(dr,true)
cl(dr,12)
cn(dr,0.5,40)
b7:_tag(dr,"BackgroundColor3","Surface")
local ds=Instance.new"UIScale"ds.Scale=0.94 ds.Parent=dr
cc(dr,c.Med,{GroupTransparency=0})
cc(ds,c.Spring,{Scale=1})
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Position=UDim2.new(0,16,0,14)dt.Size=UDim2.new(1,-32,0,20)
dt.Font=Enum.Font.GothamBold dt.TextSize=15 dt.TextXAlignment=0
b7:_tag(dt,"TextColor3","Text")dt.Text=dm.Title or"Enter Key"dt.Parent=dr
local du=Instance.new"TextLabel"du.BackgroundTransparency=1
du.Position=UDim2.new(0,16,0,36)du.Size=UDim2.new(1,-32,0,15)
du.Font=Enum.Font.Gotham du.TextSize=11 dt.TextXAlignment=0 du.TextXAlignment=0
b7:_tag(du,"TextColor3","Dim")du.Text=string.upper(dm.Subtitle or"key required")du.Parent=dr
local dv=Instance.new"TextBox"dv.PlaceholderText="Paste key..."
dv.PlaceholderColor3=cy.Dim dv.Text=""
dv.Font=Enum.Font.Code dv.TextSize=12
dv.Position=UDim2.new(0,16,0,60)dv.Size=UDim2.new(1,-32,0,32)
dv.BackgroundColor3=cy.Surface2 dv.BorderSizePixel=0
cg(dv,8)dv.Parent=dr
ck(dv,4,4,10,10)
ci(dv,true)
b7:_tag(dv,"BackgroundColor3","Surface2")
b7:_tag(dv,"TextColor3","Text")
local dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.Position=UDim2.new(0,16,0,96)dw.Size=UDim2.new(1,-32,0,15)
dw.Font=Enum.Font.Gotham dw.TextSize=11 dw.TextXAlignment=0 dw.Text=""
b7:_tag(dw,"TextColor3","Danger")dw.Parent=dr
local dx=Instance.new"TextButton"dx.Text=""
dx.Position=UDim2.new(0,16,0,118)dx.Size=UDim2.new(1,-32,0,32)
dx.BorderSizePixel=0 cg(dx,8)dx.AutoButtonColor=false dx.Parent=dr
b7:agrad(dx,15)
local dy=Instance.new"TextLabel"dy.BackgroundTransparency=1 dy.Size=UDim2.fromScale(1,1)
dy.Font=Enum.Font.GothamBold dy.TextSize=13 dy.Text="UNLOCK"
b7:oa(dy)dy.Parent=dx
local dz=Instance.new"UIScale"dz.Parent=dx
local dA
if dm.GetKeyLink then
dA=Instance.new"TextButton"dA.Text=""
dA.Position=UDim2.new(0,16,0,156)dA.Size=UDim2.new(1,-32,0,26)
dA.BackgroundTransparency=1 dA.Parent=dr
local dB=Instance.new"TextLabel"dB.BackgroundTransparency=1 dB.Size=UDim2.fromScale(1,1)
dB.Font=Enum.Font.Gotham dB.TextSize=11 dB.Text="Copy key link"
b7:_tag(dB,"TextColor3","Dim")dB.Parent=dA
dA.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(dm.GetKeyLink)end end)
dB.Text="Link copied"
task.delay(2,function()pcall(function()dB.Text="Copy key link"end)end)
end)
end
local function shake()local dB=
dr.Position.X.Offset
for dC=1,3 do
cc(dr,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
cc(dr,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
cc(dr,c.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
dn=true
if dm.SaveKey~=false then
pcall(function()if writefile then writefile(dp..".txt",dv.Text)end end)
end
cc(dr,c.Fast,{GroupTransparency=1})
cc(dq,c.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()dq:Destroy()end)end)
dl:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
ce(dm.OnSuccess)
end
local function check()
local dB=dv.Text
if dl:_checkKey(dm,dB)then unlock()
else dw.Text="Invalid key."task.spawn(shake)end
end
dx.MouseButton1Down:Connect(function()cc(dz,c.Hover,{Scale=0.96})end)
dx.MouseButton1Up:Connect(function()cc(dz,c.Spring,{Scale=1})end)
dx.MouseButton1Click:Connect(check)
dv.FocusLost:Connect(function(dB)if dB then check()end end)
if dn then pcall(function()dq:Destroy()end)ce(dm.OnSuccess)end
return{Passed=function()return dn end}
end

function b7._checkKey(dl,dm,dn)
if dm.Validate and type(dm.Validate)=="function"then
local dp,dq=pcall(dm.Validate,dn)
if dp and dq then return true end
end
if dm.Key and dn==dm.Key then return true end
if dm.Keys and table.find(dm.Keys,dn)then return true end
if not dm.Key and not dm.Keys and not dm.Validate then return true end
return false
end


function c4.TogglePalette(dl,dm)
local dn=dl._palette
if not dn then
local dp=Instance.new"TextButton"dp.Text=""dp.AutoButtonColor=false
dp.Size=UDim2.fromScale(1,1)dp.BackgroundColor3=Color3.fromRGB(0,0,0)
dp.BackgroundTransparency=1 dp.Visible=false dp.ZIndex=b4.Z.Popup dp.Parent=cB
local dq=Instance.new"Frame"dq.AnchorPoint=Vector2.new(0.5,0)
dq.Position=UDim2.new(0.5,0,0,90)dq.Size=UDim2.fromOffset(380,300)
dq.BackgroundColor3=cy.Bg dq.BorderSizePixel=0
cg(dq,12)dq.Parent=dp
ci(dq,true)
cn(dq,0.5,40)
b7:_tag(dq,"BackgroundColor3","Bg")
local dr=Instance.new"TextBox"dr.PlaceholderText="Type a command..."
dr.PlaceholderColor3=cy.Dim dr.Text=""
dr.Font=Enum.Font.Gotham dr.TextSize=14
dr.Position=UDim2.new(0,14,0,12)dr.Size=UDim2.new(1,-28,0,32)
dr.BackgroundTransparency=1 dr.ClearTextOnFocus=false dr.Parent=dq
b7:_tag(dr,"TextColor3","Text")
local ds=Instance.new"Frame"ds.BorderSizePixel=0
ds.Position=UDim2.new(0,12,0,50)ds.Size=UDim2.new(1,-24,0,1)
ds.BackgroundColor3=Color3.fromRGB(255,255,255)
ds.BackgroundTransparency=0.93 ds.Parent=dq
local dt=Instance.new"ScrollingFrame"
dt.Position=UDim2.new(0,8,0,56)dt.Size=UDim2.new(1,-16,1,-64)
dt.BackgroundTransparency=1 dt.BorderSizePixel=0
dt.ScrollBarThickness=2 dt.CanvasSize=UDim2.new(0,0,0,0)
dt.AutomaticCanvasSize=Enum.AutomaticSize.Y dt.Parent=dq
b7:_tag(dt,"ScrollBarImageColor3","Surface2")
local du=Instance.new"UIListLayout"du.Padding=UDim.new(0,2)
du.SortOrder=Enum.SortOrder.LayoutOrder du.Parent=dt
dn={ov=dp,card=dq,box=dr,list=dt,open=false,sel=1,rows={}}
dl._palette=dn
local function fuzzy(dv,dw)
dv,dw=string.lower(dv),string.lower(dw)
if dv==""then return 0 end
local dx,dy,dz=1,0,0
for dA=1,#dw do
if string.sub(dw,dA,dA)==string.sub(dv,dx,dx)then
dy+=(dz==dA-1)and 2 or 1
dz,dx=dA,dx+1
if dx>#dv then return dy-dA*0.01 end
end
end
return nil
end
local function run(dv)
if not dv then return end
dn.ov.Visible,dn.open=false,false
b4.close(dn._closeLayer)
cc(dn.ov,c.Fast,{BackgroundTransparency=1})
if dv.go then pcall(dv.go)end
end
dn._run=run
local function render()
for dv,dw in ipairs(dn.rows)do pcall(function()dw.frame:Destroy()end)end
dn.rows={}
local dv=dr.Text
local dw={}
for dx,dy in ipairs(dl._tabs)do
local dz=fuzzy(dv,dy.Title)
if dz then table.insert(dw,{label=dy.Title,hint="tab",score=dz+100,
go=function()dl._activateTab(dy,true)end})end
for dA,dB in ipairs(dy.Elements)do
if dB.Title and dB.Frame then
local dC=fuzzy(dv,dy.Title.." "..dB.Title)
if dC then table.insert(dw,{label=dB.Title,hint=dy.Title,score=dC,
go=dB._go})end
end
end
end
table.sort(dw,function(dx,dy)return dx.score>dy.score end)
dn.sel=math.clamp(dn.sel,1,math.max(1,math.min(12,#dw)))
if#dw==0 then
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1
dx.Size=UDim2.new(1,0,0,30)dx.Font=Enum.Font.Gotham
dx.TextSize=12 dx.Text="No results"dx.Parent=dt
b7:_tag(dx,"TextColor3","Dim")
dn.rows={{frame=dx}}
return
end
for dx=1,math.min(12,#dw)do
local dy=dw[dx]
local dz=Instance.new"TextButton"dz.Text=""
dz.Size=UDim2.new(1,-4,0,32)dz.BorderSizePixel=0
dz.BackgroundColor3=cy.Surface2
dz.BackgroundTransparency=(dx==dn.sel)and 0.35 or 1
cg(dz,7)dz.Parent=dt
b7:_tag(dz,"BackgroundColor3","Surface2")
local dA=Instance.new"TextLabel"dA.BackgroundTransparency=1
dA.Position=UDim2.new(0,10,0,0)dA.Size=UDim2.new(1,-90,1,0)
dA.Font=Enum.Font.Gotham dA.TextSize=13 dA.TextXAlignment=0
dA.TextTruncate=Enum.TextTruncate.AtEnd dA.Text=dy.label dA.Parent=dz
b7:_tag(dA,"TextColor3","Text")
local dB=Instance.new"TextLabel"dB.BackgroundTransparency=1
dB.AnchorPoint=Vector2.new(1,0)dB.Position=UDim2.new(1,-10,0,0)
dB.Size=UDim2.new(0,70,1,0)dB.Font=Enum.Font.Gotham
dB.TextSize=10 dB.TextXAlignment=1 dA.TextTruncate=Enum.TextTruncate.AtEnd
dB.Text=dy.hint dB.Parent=dz
b7:_tag(dB,"TextColor3","Dim")
local dC=dx
dz.MouseButton1Click:Connect(function()run(dy)end)
dz.MouseEnter:Connect(function()
dn.sel=dC render()
end)
table.insert(dn.rows,{frame=dz,item=dy})
end
end
dn._render=render
dr:GetPropertyChangedSignal"Text":Connect(function()dn.sel=1 render()end)
dp.MouseButton1Click:Connect(function()
if dn.open then dl:TogglePalette(false)end
end)
dl:Track(cq.InputBegan:Connect(function(dv,dw)
if not dn.open then return end
if dv.KeyCode==Enum.KeyCode.Escape then dl:TogglePalette(false)
elseif dv.KeyCode==Enum.KeyCode.Return or dv.KeyCode==Enum.KeyCode.KeypadEnter then
local dx=dn.rows[dn.sel]
run(dx and dx.item)
elseif dv.KeyCode==Enum.KeyCode.Up then
dn.sel=math.max(1,dn.sel-1)render()
elseif dv.KeyCode==Enum.KeyCode.Down then
dn.sel=math.min(#dn.rows,dn.sel+1)render()
end
end))
dn._closeLayer=function()
if dn.open then dl:TogglePalette(false)end
end
end
local dp=(dm~=nil)and dm or(not dn.open)
dn.open=dp
dn.ov.Visible=dp
if dp then
b4.open(dn._closeLayer)
b7:_sfx"Open"
flyTo(dn.ov,{BackgroundTransparency=0.45})
dn.card.Position=UDim2.new(0.5,0,0,78)
flyTo(dn.card,{Position=UDim2.new(0.5,0,0,90)})
dn.box.Text,dn.sel="",1
dn._render()
task.defer(function()pcall(function()dn.box:CaptureFocus()end)end)
else
b4.close(dn._closeLayer)
flyTo(dn.ov,{BackgroundTransparency=1},c.Fast,function()
if not dn.open then dn.ov.Visible=false end
end)
end
end

function c4.SetTheme(dl,dm)b7:SetTheme(dm)end

function b7.SetAccent(dl,dm)
if typeof(dm)~="Color3"then return end
dl.Themes[dl.ThemeName].Accent=dm
dl:SetTheme(dl.ThemeName)
end


b7.FontPacks={
["Gotham+"]={Black="GothamBlack",Bold="GothamBold",
Title="GothamBold",Body="Gotham",Mono="Code",
Bump={Title=1,Bold=1}},
Gotham={Black="GothamBlack",Bold="GothamBold",
Title="GothamMedium",Body="Gotham",Mono="Code"},
Builder={Black="BuilderSansExtraBold",Bold="BuilderSansBold",
Title="BuilderSansBold",Body="BuilderSans",Mono="RobotoMono"},
Arimo={Black="ArimoBold",Bold="ArimoBold",
Title="ArimoBold",Body="Arimo",Mono="RobotoMono"},
Source={Black="SourceSansBold",Bold="SourceSansBold",
Title="SourceSansSemibold",Body="SourceSans",Mono="RobotoMono"},
Cartoon={Black="Cartoon",Bold="Cartoon",
Title="Cartoon",Body="Cartoon",Mono="Code",
Bump={Title=1}},
Arcade={Black="Arcade",Bold="Arcade",
Title="Arcade",Body="Arcade",Mono="Code"},
SciFi={Black="SciFi",Bold="SciFi",
Title="SciFi",Body="SciFi",Mono="Code"},
Fantasy={Black="Fantasy",Bold="Fantasy",
Title="Fantasy",Body="Fantasy",Mono="Code"},
Highway={Black="Highway",Bold="Highway",
Title="Highway",Body="Highway",Mono="Code",
Bump={Title=2,Bold=1}},
}
b7.FontPack="Gotham+"
b7._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function b7._resolveFont(dl,dm)
local dn,dp=pcall(function()return Enum.Font[dm]end)
if dn and dp then return dp end
return nil
end
function b7._paintFonts(dl,dm)
local dn=dl.FontPacks[dl.FontPack]
if not dn then return end
for dp,dq in ipairs(dm:GetDescendants())do
if dq:IsA"TextLabel"or dq:IsA"TextButton"or dq:IsA"TextBox"then
local dr=dq:GetAttribute"KronosFontRole"
if not dr then
dr=dl._roleFromDefault[dq.Font]or"Body"
dq:SetAttribute("KronosFontRole",dr)
dq:SetAttribute("KronosBaseSize",dq.TextSize)
end
local ds=dq:GetAttribute"KronosBaseSize"or dq.TextSize
local dt=(dn.Bump and dn.Bump[dr])or 0
local du=dn[dr]and dl:_resolveFont(dn[dr])or nil
pcall(function()
if du then dq.Font=du end
dq.TextSize=math.clamp(ds+dt,8,30)
end)
end
end
end
function b7.SetFontPack(dl,dm)
if not dl.FontPacks[dm]then return end
dl.FontPack=dm
if dl._gui then dl:_paintFonts(dl._gui)end
end
function b7.RefreshFonts(dl)
if dl._gui then dl:_paintFonts(dl._gui)end
end
function c4.SetAccent(dl,dm)b7:SetAccent(dm)end
function c4.SetScale(dl,dm)
da.Scale=math.clamp(tonumber(dm)or 1,0.7,1.25)
end
function c4.SetCompact(dl,dm)
dm=dm and true or false
cc(cD,c.Med,{Size=dm and UDim2.fromOffset(560,400)
or(dl._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))})
for dn,dp in ipairs(dl._tabs)do
if dp._pl then dp._pl.Padding=dm and UDim.new(0,4)or UDim.new(0,8)end
end
end
function c4.ToggleAcrylic(dl,dm)
b7:ToggleAcrylic(dm)
cD.BackgroundTransparency=(dm and not b7._transparent)and 0.08 or 0
c_.BackgroundTransparency=(dm and not b7._transparent)and 0.15 or 0
end
function c4.ToggleTransparency(dl,dm)
b7._transparent=dm and true or false
local dn=(b7._acrylicOn and not dm)and 0.08 or(dm and 0.25 or 0)
cD.BackgroundTransparency=dn
c_.BackgroundTransparency=dm and 0.4 or((b7._acrylicOn and not dm)and 0.15 or 0)
end




local dl=Instance.new"TextButton"
dl.Name=ad.GetStealthName()
dl.Text=""dl.AutoButtonColor=false
dl.Size=UDim2.fromScale(1,1)
dl.BackgroundColor3=Color3.fromRGB(0,0,0)
dl.BackgroundTransparency=1 dl.BorderSizePixel=0
dl.Visible=false dl.Parent=cY
cg(dl,10)
local function slideCloseAll()
if c4._inboxPanel and c4._inboxPanel.open then c4:ToggleInbox(false)end
if c4._kbPanel and c4._kbPanel.open then c4:ToggleKeybindList(false)end
end
dl.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(dm)
if dm then
b4.open(slideCloseAll)
dl.Visible=true
cc(dl,c.Med,{BackgroundTransparency=0.5})
else
b4.close(slideCloseAll)
cc(dl,c.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local dn=c4._inboxPanel and c4._inboxPanel.open
local dp=c4._kbPanel and c4._kbPanel.open
if not dn and not dp then dl.Visible=false end
end)
end
end


function c4.ToggleInbox(dm,dn)
local dp=dm._inboxPanel
if not dp then
local dq=Instance.new"Frame"dq.AnchorPoint=Vector2.new(1,0)
dq.Position=UDim2.new(1,12,0,0)dq.Size=UDim2.new(0,230,1,0)
dq.BackgroundColor3=cy.Bg dq.BorderSizePixel=0
cg(dq,10)dq.Parent=cY dq.Visible=false
ci(dq,true)
b7:_tag(dq,"BackgroundColor3","Bg")
local dr=Instance.new"TextLabel"dr.BackgroundTransparency=1
dr.Position=UDim2.new(0,12,0,10)dr.Size=UDim2.new(1,-70,0,18)
dr.Font=Enum.Font.GothamBold dr.TextSize=11 dr.TextXAlignment=0
dr.Text="INBOX"dr.Parent=dq
b7:_tag(dr,"TextColor3","Dim")
local ds=Instance.new"TextButton"ds.Text=""
ds.AnchorPoint=Vector2.new(1,0)ds.Position=UDim2.new(1,-10,0,10)
ds.Size=UDim2.new(0,52,0,18)ds.BackgroundColor3=cy.Surface2
ds.BorderSizePixel=0 cg(ds,6)ds.AutoButtonColor=false ds.Parent=dq
ci(ds,true)
b7:_tag(ds,"BackgroundColor3","Surface2")
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Size=UDim2.fromScale(1,1)dt.Font=Enum.Font.GothamBold
dt.TextSize=10 dt.Text="CLEAR"dt.Parent=ds
b7:_tag(dt,"TextColor3","Dim")
local du=Instance.new"ScrollingFrame"
du.Position=UDim2.new(0,8,0,34)du.Size=UDim2.new(1,-16,1,-42)
du.BackgroundTransparency=1 du.BorderSizePixel=0
du.ScrollBarThickness=2 du.CanvasSize=UDim2.new(0,0,0,0)
du.AutomaticCanvasSize=Enum.AutomaticSize.Y du.Parent=dq
b7:_tag(du,"ScrollBarImageColor3","Surface2")
local dv=Instance.new"UIListLayout"dv.Padding=UDim.new(0,4)
dv.SortOrder=Enum.SortOrder.LayoutOrder dv.Parent=du
dp={panel=dq,list=du,open=false}
dm._inboxPanel=dp
local function refresh()
for dw,dx in ipairs(du:GetChildren())do


if dx:IsA"Frame"or dx:IsA"TextLabel"then pcall(function()dx:Destroy()end)end
end
if#b7._inbox==0 then
local dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.Size=UDim2.new(1,0,0,24)dw.Font=Enum.Font.Gotham
dw.TextSize=11 dw.Text="All caught up."dw.Parent=du
b7:_tag(dw,"TextColor3","Dim")
return
end
for dw,dx in ipairs(b7._inbox)do
local dy=Instance.new"Frame"
dy.Size=UDim2.new(1,-2,0,44)dy.BackgroundColor3=cy.Surface2
dy.BackgroundTransparency=0.35 dy.BorderSizePixel=0
cg(dy,7)dy.Parent=du
b7:_tag(dy,"BackgroundColor3","Surface2")
local dz=Instance.new"TextLabel"dz.BackgroundTransparency=1
dz.Position=UDim2.new(0,8,0,4)dz.Size=UDim2.new(1,-52,0,15)
dz.Font=Enum.Font.GothamBold dz.TextSize=11 dz.TextXAlignment=0
dz.TextTruncate=Enum.TextTruncate.AtEnd dz.Text=dx.Title dz.Parent=dy
b7:_tag(dz,"TextColor3","Text")
local dA=Instance.new"TextLabel"dA.BackgroundTransparency=1
dA.Position=UDim2.new(0,8,0,20)dA.Size=UDim2.new(1,-52,0,18)
dA.Font=Enum.Font.Gotham dA.TextSize=11 dA.TextXAlignment=0
dA.TextTruncate=Enum.TextTruncate.AtEnd dA.Text=dx.Content dA.Parent=dy
b7:_tag(dA,"TextColor3","Dim")
local dB=Instance.new"TextLabel"dB.BackgroundTransparency=1
dB.AnchorPoint=Vector2.new(1,0)dB.Position=UDim2.new(1,-8,0,4)
dB.Size=UDim2.new(0,40,0,14)dB.Font=Enum.Font.Code
dB.TextSize=10 dB.TextXAlignment=1 dB.Text=dx.At dB.Parent=dy
b7:_tag(dB,"TextColor3","Dim")
end
end
dp.refresh=refresh
ds.MouseButton1Click:Connect(function()
b7._inbox={}
refresh()
pcall(function()cX.Visible=false end)
end)
end
local dq=(dn~=nil)and dn or(not dp.open)
dp.open=dq
if dq then
if dm._kbPanel and dm._kbPanel.open then dm:ToggleKeybindList(false)end
slideShadeSet(true)
dp.refresh()
dp.panel.Visible=true
pcall(function()cX.Visible=false end)
flyTo(dp.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(dp.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not dp.open then dp.panel.Visible=false end
end)
slideShadeSet(dm._kbPanel~=nil and dm._kbPanel.open==true)
end
end


function c4.ToggleKeybindList(dm,dn)
local dp=dm._kbPanel
if not dp then
local dq=Instance.new"Frame"dq.AnchorPoint=Vector2.new(1,0)
dq.Position=UDim2.new(1,12,0,0)dq.Size=UDim2.new(0,210,1,0)
dq.BackgroundColor3=cy.Bg dq.BorderSizePixel=0
cg(dq,10)dq.Parent=cY dq.Visible=false
ci(dq,true)
b7:_tag(dq,"BackgroundColor3","Bg")
local dr=Instance.new"TextLabel"dr.BackgroundTransparency=1
dr.Position=UDim2.new(0,12,0,10)dr.Size=UDim2.new(1,-24,0,18)
dr.Font=Enum.Font.GothamBold dr.TextSize=11 dr.TextXAlignment=0
dr.Text="KEYBINDS"dr.Parent=dq
b7:_tag(dr,"TextColor3","Dim")
local ds=Instance.new"ScrollingFrame"
ds.Position=UDim2.new(0,8,0,34)ds.Size=UDim2.new(1,-16,1,-42)
ds.BackgroundTransparency=1 ds.BorderSizePixel=0
ds.ScrollBarThickness=2 ds.CanvasSize=UDim2.new(0,0,0,0)
ds.AutomaticCanvasSize=Enum.AutomaticSize.Y ds.Parent=dq
b7:_tag(ds,"ScrollBarImageColor3","Surface2")
local dt=Instance.new"UIListLayout"dt.Padding=UDim.new(0,4)
dt.SortOrder=Enum.SortOrder.LayoutOrder dt.Parent=ds
dp={panel=dq,list=ds,open=false}
dm._kbPanel=dp
local function refresh()
for du,dv in ipairs(ds:GetChildren())do
if dv:IsA"TextButton"then pcall(function()dv:Destroy()end)end
end
if#dm._keybinds==0 then
local du=Instance.new"TextLabel"du.BackgroundTransparency=1
du.Size=UDim2.new(1,0,0,24)du.Font=Enum.Font.Gotham
du.TextSize=11 du.Text="No keybinds yet"du.Parent=ds
b7:_tag(du,"TextColor3","Dim")
return
end
for du,dv in ipairs(dm._keybinds)do
local dw=Instance.new"TextButton"dw.Text=""
dw.Size=UDim2.new(1,-2,0,30)dw.BackgroundColor3=cy.Surface2
dw.BackgroundTransparency=0.35 dw.BorderSizePixel=0
cg(dw,7)dw.Parent=ds
b7:_tag(dw,"BackgroundColor3","Surface2")
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1
dx.Position=UDim2.new(0,8,0,0)dx.Size=UDim2.new(1,-70,1,0)
dx.Font=Enum.Font.Gotham dx.TextSize=11 dx.TextXAlignment=0
dx.TextTruncate=Enum.TextTruncate.AtEnd dx.Text=dv.Title dx.Parent=dw
b7:_tag(dx,"TextColor3","Text")
local dy=Instance.new"TextLabel"dy.BackgroundTransparency=1
dy.AnchorPoint=Vector2.new(1,0)dy.Position=UDim2.new(1,-8,0,0)
dy.Size=UDim2.new(0,56,1,0)dy.Font=Enum.Font.Code
dy.TextSize=10 dy.TextXAlignment=1 dy.Text=dv.GetName()dy.Parent=dw
b7:_tag(dy,"TextColor3","Dim")
dw.MouseButton1Click:Connect(function()
b7:_sfx"Click"dv.Rebind()
task.delay(0.2,function()pcall(function()dy.Text=dv.GetName()end)end)
end)
end
end
dp.refresh=refresh
dm._kbPanelRefresh=refresh
end
local dq=(dn~=nil)and dn or(not dp.open)
dp.open=dq
if dq then
if dm._inboxPanel and dm._inboxPanel.open then dm:ToggleInbox(false)end
slideShadeSet(true)
dp.refresh()
dp.panel.Visible=true
flyTo(dp.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(dp.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not dp.open then dp.panel.Visible=false end
end)
slideShadeSet(dm._inboxPanel~=nil and dm._inboxPanel.open==true)
end
end


function c4.Onboarding(dm,dn)
dn=dn or{}
local dp=dn.Steps or dn.Pages or{{Title="Welcome",Content="This is Kronos."}}
local dq=1
local dr=Instance.new"TextButton"dr.Text=""dr.AutoButtonColor=false
dr.Size=UDim2.fromScale(1,1)dr.BackgroundColor3=Color3.fromRGB(0,0,0)
dr.BackgroundTransparency=1 dr.ZIndex=180 dr.Parent=cA
cc(dr,c.Med,{BackgroundTransparency=0.6})
local ds=Instance.new"CanvasGroup"ds.AnchorPoint=Vector2.new(0.5,0.5)
ds.Position=UDim2.new(0.5,0,0.5,0)ds.Size=UDim2.fromOffset(340,220)
ds.BackgroundColor3=cy.Surface ds.BorderSizePixel=0 ds.GroupTransparency=1
cg(ds,12)ds.Parent=dr
ci(ds,true)
cl(ds,12)
cn(ds,0.5,40)
b7:_tag(ds,"BackgroundColor3","Surface")
local dt=Instance.new"UIScale"dt.Scale=0.94 dt.Parent=ds
cc(ds,c.Med,{GroupTransparency=0})
cc(dt,c.Spring,{Scale=1})
local du=Instance.new"TextLabel"du.BackgroundTransparency=1
du.Position=UDim2.new(0,20,0,18)du.Size=UDim2.new(1,-40,0,24)
du.Font=Enum.Font.GothamBold du.TextSize=17 du.TextXAlignment=0 du.Parent=ds
b7:_tag(du,"TextColor3","Text")
local dv=Instance.new"TextLabel"dv.BackgroundTransparency=1
dv.Position=UDim2.new(0,20,0,48)dv.Size=UDim2.new(1,-40,0,90)
dv.Font=Enum.Font.Gotham dv.TextSize=13 du.TextXAlignment=0
dv.TextXAlignment=0 dv.TextYAlignment=0 dv.TextWrapped=true dv.Parent=ds
b7:_tag(dv,"TextColor3","Dim")
local dw=Instance.new"Frame"dw.BackgroundTransparency=1
dw.AnchorPoint=Vector2.new(0,1)dw.Position=UDim2.new(0,20,1,-52)
dw.Size=UDim2.new(0,120,0,10)dw.Parent=ds
local dx=Instance.new"UIListLayout"dx.FillDirection=Enum.FillDirection.Horizontal
dx.Padding=UDim.new(0,6)dx.Parent=dw
local dy={}
for dz=1,#dp do
local dA=Instance.new"Frame"dA.Size=UDim2.fromOffset(8,8)
dA.BorderSizePixel=0 cg(dA,99)dA.Parent=dw
b7:_tag(dA,"BackgroundColor3","Surface2")
dy[dz]=dA
end
local dz,dA,dB
local function paint()
du.Text,dv.Text=dp[dq].Title or"",dp[dq].Content or""
for dC,dD in ipairs(dy)do
if dC==dq then b7:_tag(dD,"BackgroundColor3","Accent")
else b7:_tag(dD,"BackgroundColor3","Surface2")end
end
dz.Visible=dq>1
dB.Text=(dq==#dp)and"FINISH"or"NEXT"
du.Position=UDim2.new(0,26,0,18)
cc(du,c.Fast,{Position=UDim2.new(0,20,0,18)})
end
local dC=Instance.new"Frame"dC.BackgroundTransparency=1
dC.AnchorPoint=Vector2.new(0,1)dC.Position=UDim2.new(0,0,1,-12)
dC.Size=UDim2.new(1,0,0,34)dC.Parent=ds
local dD=Instance.new"UIListLayout"dD.FillDirection=Enum.FillDirection.Horizontal
dD.HorizontalAlignment=Enum.HorizontalAlignment.Right dD.Padding=UDim.new(0,8)dD.Parent=dC
ck(dC,0,0,12,12)
dz=Instance.new"TextButton"dz.Text=""
dz.Size=UDim2.new(0,80,0,30)dz.BackgroundTransparency=1 dz.Parent=dC
local dE=Instance.new"TextLabel"dE.BackgroundTransparency=1
dE.Size=UDim2.fromScale(1,1)dE.Font=Enum.Font.GothamBold
dE.TextSize=12 dE.Text="BACK"dE.Parent=dz
b7:_tag(dE,"TextColor3","Dim")
local dF=Instance.new"TextButton"dF.Text=""
dF.Size=UDim2.new(0,80,0,30)dF.BackgroundTransparency=1 dF.Parent=dC
local dG=Instance.new"TextLabel"dG.BackgroundTransparency=1
dG.Size=UDim2.fromScale(1,1)dG.Font=Enum.Font.Gotham
dG.TextSize=12 dG.Text="Skip"dG.Parent=dF
b7:_tag(dG,"TextColor3","Dim")
dA=Instance.new"TextButton"dA.Text=""
dA.Size=UDim2.new(0,96,0,30)dA.BorderSizePixel=0
cg(dA,7)dA.AutoButtonColor=false dA.Parent=dC
b7:agrad(dA,15)
dB=Instance.new"TextLabel"dB.BackgroundTransparency=1
dB.Size=UDim2.fromScale(1,1)dB.Font=Enum.Font.GothamBold
dB.TextSize=12
dB.Text="NEXT"dB.Parent=dA
b7:oa(dB)
local function close()
cc(ds,c.Fast,{GroupTransparency=1})
cc(dr,c.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dr:Destroy()end)end)
ce(dn.OnFinish)
end
dz.MouseButton1Click:Connect(function()
b7:_sfx"Click"dq=math.max(1,dq-1)paint()
end)
dF.MouseButton1Click:Connect(function()close()end)
dA.MouseButton1Click:Connect(function()
b7:_sfx"Click"
if dq>=#dp then close()else dq+=1 paint()end
end)
paint()
end



function c4.Tab(dm,dn)
return b1({
Window=c4,opts=ct,Th=cy,pgui=cB,
pages=c3,nav=c0,pill=c2,subLbl=S,
},dn)
end

function c4.SaveConfig(dm,dn)
bT.Save(dm,dn)
end
function c4.LoadConfig(dm,dn)
bT.Load(dm,dn)
end

function c4.Destroy(dm)
if dm._destroyed then return end
dm._destroyed=true
local dn=dm._onCloseCb
dm._onCloseCb=nil
if type(dn)=="function"then task.spawn(function()pcall(dn)end)end
for dp,dq in ipairs(dm._conns)do pcall(function()dq:Disconnect()end)end
dm._conns={}
for dp,dq in pairs(b7.Sound._cache)do pcall(function()dq:Stop()dq:Destroy()end)end
b7.Sound._cache={}
b7:SetAcrylic(false)
if b7._gui==cA then b7._gui=nil end
pcall(function()c7:Destroy()end)
pcall(function()cA:Destroy()end)
pcall(function()cB:Destroy()end)
end

ad.registerUnload(function()
pcall(function()c4:Destroy()end)
end)
af.paintFonts(cA)
return c4
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()




return function(aa)
task.defer(function()
local ab=aa:CreateWindow{
Title="Kronos",SubTitle="premiere",Theme="Kronos",
ToggleKey=Enum.KeyCode.RightControl,Acrylic=true,Blur=16,
}
local ac=ab:Tab{Title="Home",Icon="dashboard"}
ac:Banner{Title="Welcome to Kronos",Icon="ghost",
Content="v3.0.0 Kronos is live: total rename, K marks, same clean hub.",
Button="Notes",Callback=function()
ab:Dialog{Title="v3.0.0 notes",
Content="Kronos rebrand: every label, mark, theme, and file renamed. Nothing else moved.",
Buttons={{Title="Nice"}}}
end}
ac:StatsRow{Stats={
{Label="Version",Value="v3.0.0",Accent=true},
{Label="Status",Value="Updated"},
{Label="Key",Value="None"},
}}
ac:Section"Featured"
ac:Cards{Cards={
{Title="Aim Suite",Desc="Silent aim, FOV circle, smoothing presets.",Icon="crosshair",
Callback=function()print"launch aim"end},
{Title="ESP+",Desc="Boxes, chams, tracers with team check.",Icon="eye",
Callback=function()print"launch esp"end},
}}
ac:Section"Recently used"
ac:Recent{Limit=4}
ac:Section"Quick actions"
ac:Button{Title="Open command palette",Description="Same as Ctrl+K",
Callback=function()ab:TogglePalette(true)end}
ac:Button{Title="Copy loader",Description="Share Kronos with a friend",Callback=function()
pcall(function()if setclipboard then setclipboard"loadstring(game:HttpGet('YOUR_URL'))()"end end)
ab:Notify{Title="Copied",Content="Loader copied to clipboard.",Duration=2}
end}
ac:Section"Session"
ac:Status{Title="Executor",State="online",Description="Heartbeat stable"}
local ad=ac:Skeleton{Lines=3}
task.delay(3,function()
pcall(function()ad:Destroy()end)
ab:Notify{Title="Feed loaded",Content="Latest scripts are in.",Duration=2}
end)
ac:Label"Made with Kronos UI | operate responsibly."
local ae=ab:Tab{Title="Main",Icon="swords"}
ae:Section"Combat"
ae:Toggle{Title="Enable Aimbot",Description="Drag the knob or click",Value=false,Flag="Aimbot",
Callback=function(af)print("aimbot",af)end}
ae:Slider{Title="FOV",Min=30,Max=300,Step=1,Value=120,Flag="FOV"}
ae:Slider{Title="Smoothness",Min=0,Max=1,Step=0.01,Rounding=2,Value=0.35,Flag="Smooth"}
ae:Dropdown{Title="Target Part",Values={"Head","Torso","Arms","Legs","Random"},Value="Head",Flag="Part"}
ae:Button{Title="Snap to target",Callback=function()
ab:Notify{Title="Kronos",Content="Snapped",Duration=2}
end}
ae:Divider"feedback"
local af=ae:Progress{Title="Match progress",Value=35}
task.delay(2,function()pcall(function()af:Set(75)end)end)
local bT=ae:Log{Title="Console",Lines={"hub loaded"}}
bT:Add"aimbot armed"
local b1=ab:Tab{Title="Visuals",Icon="eye"}
b1:Section"ESP"
b1:Toggle{Title="Box ESP",Value=true,Flag="BoxESP"}
b1:Colorpicker{Title="ESP Color",Value=Color3.fromRGB(110,140,255),Flag="ESPColor"}
b1:Dropdown{Title="Chams",Values={"Enemies","Team","NPCs","Chests","Ores"},
Multi=true,Value={"Enemies"},Flag="Chams"}
local b4=ab:Tab{Title="Settings",Icon="settings"}
b4:Profile{Name="kronos_user",Tag="Premium | keyless"}
b4:Section"Interface"
b4:Dropdown{Title="Theme",
Values={"Kronos","Dark","Midnight","Light","Rose","Indigo","Forest","Amber","Ocean","Crimson","Ghost","Cyberpunk","Terminal","Discord","Mono"},
Value="Kronos",Callback=function(b7)ab:SetTheme(b7)end}
b4:Colorpicker{Title="Accent color",Description="Repaints every accent live",
Value=Color3.fromRGB(232,236,245),
Callback=function(b7)ab:SetAccent(b7)end}
b4:Dropdown{Title="Font",Description="Bigger, bolder, yours",
Values={"Gotham+","Gotham","Builder","Arimo","Source","Cartoon","Arcade","SciFi","Fantasy","Highway"},
Value="Gotham+",Callback=function(b7)aa:SetFontPack(b7)end}
b4:Slider{Title="UI scale",Min=70,Max=125,Step=5,Value=100,
Callback=function(b7)ab:SetScale(b7/100)end}
b4:Toggle{Title="Compact mode",Description="Smaller card, tighter lists",Value=false,
Callback=function(b7)ab:SetCompact(b7)end}
b4:Toggle{Title="Focus mode",Description="Hide sidebar, just content",Value=false,
Callback=function(b7)ab:SetFocus(b7)end}
b4:Toggle{Title="Acrylic",Description="Scene blur",Value=true,
Callback=function(b7)ab:ToggleAcrylic(b7)end}
b4:Toggle{Title="Transparency",Description="Ghost mode",Value=false,
Callback=function(b7)ab:ToggleTransparency(b7)end}
b4:Toggle{Title="UI Sounds",Description="Clicks, toggles, notifications",Value=true,
Callback=function(b7)aa.Sound.Enabled=b7 end}
b4:Keybind{Title="Panic key",Value=Enum.KeyCode.F,
Callback=function()ab:SetVisible(false)end}
b4:Keybind{Title="Hide UI key",Description="Rebinds the hide hotkey",
Value=Enum.KeyCode.RightControl,
Callback=function(b7)ab:SetToggleKey(b7)end}
b4:Button{Title="Keybinds panel",Description="Slide-over, click a row to rebind",
Callback=function()ab:ToggleKeybindList()end}
b4:Button{Title="Command palette",Description="Same as Ctrl+K",
Callback=function()ab:TogglePalette(true)end}
b4:Section"Profiles"
b4:Profiles{Title="My profiles"}
ab:Notify{Title="Kronos loaded",Content="Ctrl+K palette | RightControl hide",Duration=5}
aa:RefreshFonts()
end)
end end function a.J():typeof(__modImpl())local aa=a.cache.J if not aa then aa={c=__modImpl()}a.cache.J=aa end return aa.c end end end





local aa=a.a()
local ab=a.b()a.c()a.d()


local ac=a.e()
local ad=a.f()
local ae=a.g()
local af=a.h()
local bT=a.i()
local b1=a.I()

ab.claimUnload()

local b4=aa
b4.Themes=af.Themes
b4.Icons=ac.Icons
b4.IconAlias=ac.IconAlias

b4._tag=function(b7,c,cc,ce)
return af.tag(c,cc,ce)
end
b4.agrad=function(b7,c,cc)
return af.agrad(c,cc)
end
b4.oa=function(b7,c)
return af.oa(c)
end
b4.SetTheme=function(b7,c)
return af.SetTheme(c)
end
b4.SetAccent=function(b7,c)
return af.SetAccent(c)
end
b4.SetAcrylic=function(b7,c,cc)
return bT.SetAcrylic(c,cc)
end
b4.ToggleAcrylic=function(b7,c)
return bT.ToggleAcrylic(c)
end
b4._sfx=function(b7,c)
return ad.sfx(c)
end
b4.SetFontPack=function(b7,c)
return ae.SetFontPack(c)
end
b4.RefreshFonts=function(b7)
return ae.RefreshFonts()
end
b4._paintFonts=function(b7,c)
return ae.paintFonts(c)
end

b4.CreateWindow=b1


local b7=a.J()
b7(b4)

return b4
