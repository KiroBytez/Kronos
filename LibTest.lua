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



local function onKnob()
local aP=af.Theme.Accent
local aQ=0.299*aP.R+0.587*aP.G+0.114*aP.B
if aQ>0.6 then
return af.Theme.OnAccent or Color3.fromRGB(15,17,22)
end
return Color3.fromRGB(255,255,255)
end
local function paint(aP)
an(aL,aP and am.Med or TweenInfo.new(0),
{BackgroundTransparency=S and 0 or 1})
local aQ=aP and am.Spring or TweenInfo.new(0)
an(aM,aQ,{Position=S and UDim2.new(1,-aJ-3,0.5,0)
or UDim2.new(0,3,0.5,0)})
an(aM,aP and am.Med or TweenInfo.new(0),
{BackgroundColor3=S and onKnob()or Color3.fromRGB(255,255,255)})
end
aM.Position=S and UDim2.new(1,-aJ-3,0.5,0)or UDim2.new(0,3,0.5,0)
aM.BackgroundColor3=S and onKnob()or Color3.fromRGB(255,255,255)
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
if a_ then
an(g,am.Fill08,{Size=UDim2.new(a0,0,1,0)})
else

g.Size=UDim2.new(a0,0,1,0)
end
N.Position=UDim2.new(a0,0,0.5,0)
if c:IsFocused()==false then c.Text=fmt(aU)end
end
local a_={}
function a_.Set(a0,a1,a2)
a1=math.clamp(tonumber(a1)or aU,aQ,aR)
a1=math.round(a1/aS)*aS
if aT>0 then a1=tonumber(string.format("%."..aT.."f",a1))end
aU=a1 render(not aW)
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






local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local bT=ab.T
local b1=ab.tween local b4=
ac.guid local b7=
ac.spawnCb
local c=ac.corner local cc=
ac.hairline local ce=
ac.pad local cg=
ac.lighting local ci=
ac.ripple local ck=
ad.makeIcon
local cl=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local cm=ae.cloneref_check(game:GetService"Players")

local cn={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(co,cp)
local cq=co.row local cr=
co.titleBlock
local cs=co.reg
local ct=co.tab local cu=
co.Window
local cv=co.Th local f=
co.opts or{}local g=
co.page
cp=cp or{}
local N=cp.Accent or cp.Color or cv.Accent
if type(N)=="table"then
N=Color3.new(N[1]or 0,N[2]or 0,N[3]or 0)
end
local S=tostring(cp.Mode or"Chams")
if not cn[S]then S="Chams"end
local _,cw,cx,cy=true,true,false,100
local cz
pcall(function()cz=cm.LocalPlayer end)
local cA=cp.Name or((cz and cz.DisplayName)or"Noob")
local cB=(cz and("@"..cz.Name))or""
local cC=cq(170)
local cD=Instance.new"TextLabel"cD.BackgroundTransparency=1
cD.Position=UDim2.new(0,12,0,6)cD.Size=UDim2.new(1,-24,0,16)
cD.Font=Enum.Font.GothamMedium cD.TextSize=12 cD.TextXAlignment=0
cD.TextTruncate=Enum.TextTruncate.AtEnd cD.Text=cp.Title or"Rig Preview"cD.Parent=cC
af:_tag(cD,"TextColor3","Text")
local cE=Instance.new"ViewportFrame"
cE.Position=UDim2.new(0,10,0,26)cE.Size=UDim2.new(1,-20,1,-34)
cE.BackgroundColor3=cv.Bg cE.BorderSizePixel=0
cE.LightColor=Color3.fromRGB(255,255,255)
cE.LightDirection=Vector3.new(-0.5,-1,-0.6)
cE.Ambient=Color3.fromRGB(90,90,105)
c(cE,8)cE.Parent=cC
af:_tag(cE,"BackgroundColor3","Bg")
local cF=Instance.new"Frame"cF.BackgroundTransparency=1
cF.Size=UDim2.fromScale(1,1)cF.Parent=cE
local cG={}
local function bracket(cH,cI)
local cJ=Instance.new"Frame"cJ.BorderSizePixel=0
cJ.AnchorPoint=Vector2.new(cH,cI)cJ.Position=UDim2.new(cH,0,cI,0)
cJ.Size=UDim2.new(0,12,0,2)cJ.Parent=cF
af:_tag(cJ,"BackgroundColor3","Accent")
local cK=Instance.new"Frame"cK.BorderSizePixel=0
cK.AnchorPoint=Vector2.new(cH,cI)cK.Position=UDim2.new(cH,0,cI,0)
cK.Size=UDim2.new(0,2,0,12)cK.Parent=cF
af:_tag(cK,"BackgroundColor3","Accent")
table.insert(cG,cJ)table.insert(cG,cK)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local cH=Instance.new"TextLabel"cH.BackgroundTransparency=1
cH.AnchorPoint=Vector2.new(0.5,0)cH.Position=UDim2.new(0.5,0,0,4)
cH.Size=UDim2.new(1,-16,0,14)cH.Font=Enum.Font.GothamBold
cH.TextSize=11 cH.Text=cA cH.Parent=cF
af:_tag(cH,"TextColor3","Text")
local cI=Instance.new"TextLabel"cI.BackgroundTransparency=1
cI.AnchorPoint=Vector2.new(0.5,0)cI.Position=UDim2.new(0.5,0,0,18)
cI.Size=UDim2.new(1,-16,0,11)cI.Font=Enum.Font.Gotham
cI.TextSize=10 cI.Text=cB cI.Parent=cF
af:_tag(cI,"TextColor3","Dim")
local cJ=Instance.new"Frame"cJ.BorderSizePixel=0
cJ.AnchorPoint=Vector2.new(0,0.5)cJ.Position=UDim2.new(0,6,0.5,0)
cJ.Size=UDim2.new(0,4,1,-30)cJ.BackgroundColor3=cv.Surface2
c(cJ,99)cJ.Parent=cF
af:_tag(cJ,"BackgroundColor3","Surface2")
local cK=Instance.new"Frame"cK.BorderSizePixel=0
cK.AnchorPoint=Vector2.new(0,1)cK.Position=UDim2.new(0,0,1,0)
cK.Size=UDim2.new(1,0,1,0)cK.BackgroundColor3=cv.Success
c(cK,99)cK.Parent=cJ
af:_tag(cK,"BackgroundColor3","Success")
local cL=Instance.new"WorldModel"cL.Parent=cE
local cM=Instance.new"Camera"cM.Parent=cE
cE.CurrentCamera=cM
cM.CFrame=CFrame.new(Vector3.new(0,3.0,9.5),Vector3.new(0,2.5,0))
local cN,cO={},{}
local function part(cP,cQ,cR)
local cS=Instance.new"Part"cS.Name=cP
cS.Size=cQ cS.Position=cR cS.Anchored=true cS.CanCollide=false
cS.TopSurface=Enum.SurfaceType.Smooth
cS.BottomSurface=Enum.SurfaceType.Smooth
cS.Color=Color3.fromRGB(200,200,215)
cS.Material=Enum.Material.Plastic
cS.Parent=cL
table.insert(cN,cS)
local cT=Instance.new"SelectionBox"
cT.Adornee=cS cT.LineThickness=0.05
cT.Color3=Color3.fromRGB(255,255,255)
cT.SurfaceTransparency=1 cT.Visible=false
cT.Parent=cS
cO[cS]=cT
return cS
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local cP={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local cQ={}
local function paint()
for cR,cS in ipairs(cN)do
if cS and cS.Parent then
if S=="Noob"then
cS.Color=cP[cS.Name]or Color3.fromRGB(200,200,215)
cS.Material=Enum.Material.Plastic
cS.Transparency=0
elseif S=="Ghost"then
cS.Color=N
cS.Material=Enum.Material.ForceField
cS.Transparency=0
elseif S=="Solid"or S=="Box"then
cS.Color=Color3.fromRGB(200,200,215)
cS.Material=Enum.Material.Plastic
cS.Transparency=0
else
cS.Color=N
cS.Material=Enum.Material.Plastic
cS.Transparency=0
end
local cT=cO[cS]
if cT then
cT.Visible=cx or S=="Outline"
cT.Color3=N
end
end
end
for cR,cS in ipairs(cG)do
if cS then cS.Visible=_ or S=="Box"end
end
cH.Visible=cw or S=="Name"
cI.Visible=cH.Visible
cJ.Visible=_ or S=="HP bar"
end
function cQ.SetAccent(cR,cS)
if type(cS)=="table"then
cS=Color3.new(cS[1]or 0,cS[2]or 0,cS[3]or 0)
end
if typeof(cS)=="Color3"then N=cS paint()end
end
function cQ.SetMode(cR,cS)S=tostring(cS)if not cn[S]then S="Chams"end paint()end
function cQ.SetBox(cR,cS)_=cS and true or false paint()end
function cQ.SetOutline(cR,cS)cx=cS and true or false paint()end
function cQ.SetName(cR,cS)cw=cS and true or false paint()end
function cQ.SetHealth(cR,cS)
cy=math.clamp(tonumber(cS)or 100,0,100)
b1(cK,bT.Fast,{Size=UDim2.new(1,0,cy/100,0)})
end
function cQ.Get(cR)return N end
paint()
local cR=0
local cS={}
for cT,cU in ipairs(cN)do cS[cU]=cU.Position end
local cT
cT=cl.RenderStepped:Connect(function(cU)
if not cE.Parent then pcall(function()cT:Disconnect()end)return end
if not cC:IsDescendantOf(game)then return end
cR+=cU
local cV=math.sin(cR*2.2)*0.045
for cW,cX in ipairs(cN)do
if cX and cX.Parent and cS[cX]then
cX.Position=cS[cX]+Vector3.new(0,cV,0)
end
end
end)
ct._window:Track(cT)
aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(cU,cV)
local cW=cU
if type(cW)=="table"then
cW=Color3.new(cW[1]or 0,cW[2]or 0,cW[3]or 0)
end
if typeof(cW)=="Color3"then N=cW paint()end
end)
if aa.Flags.ESPColor~=nil then
local cU=aa.Flags.ESPColor
if type(cU)=="table"then
cU=Color3.new(cU[1]or 0,cU[2]or 0,cU[3]or 0)
end
if typeof(cU)=="Color3"then N=cU paint()end
end
return cs{Title=cp.Title or"Rig Preview",Frame=cC,_handle=cQ}
end end function a.G():typeof(__modImpl())local aa=a.cache.G if not aa then aa={c=__modImpl()}a.cache.G=aa end return aa.c end end do local function __modImpl()




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
RigPreview=a.G(),
}

local function attach(ab,ac)
for ad,ae in pairs(aa)do
ab[ad]=function(af,bT)
return ae(ac,bT)
end
end
end

return{attach=attach,map=aa}end function a.H():typeof(__modImpl())local aa=a.cache.H if not aa then aa={c=__modImpl()}a.cache.H=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()
local ae=a.h()
local af=a.f()


local bT=ab.T
local b1=ab.tween local c=
ac.spawnCb
local ck=ac.corner
local cl=ac.hairline
local cm=ac.pad
local cn=ac.lighting
local co=ad.makeIcon
local cp=a.H()

return function(cq,cs)
local ct=cq.Window
local cv=cq.opts or{}
local cw=cq.Th
local cx=cq.pgui
local cy=cq.pages
local cz=cq.nav
local cA=cq.pill
local cB=cq.subLbl
cs=cs or{}
local cC=cs.Title or("Tab "..(#ct._tabs+1))
local cD=cs.Icon or cC

local cE=Instance.new"TextButton"
cE.Text=""
cE.Size=UDim2.new(1,0,0,34)
cE.BackgroundColor3=cw.Surface2
cE.BackgroundTransparency=1
cE.BorderSizePixel=0
ck(cE,8)
cE.LayoutOrder=#ct._tabs+10
cE.AutoButtonColor=false
cE.Parent=cz
cE.ZIndex=2
cE.Visible=true
local cF=#ct._tabs+1
local cG=co(cD,15,cw.Dim)
cG.AnchorPoint=Vector2.new(0,0.5)
cG.Position=UDim2.new(0,14,0.5,0)
cG.Parent=cE
cG.Visible=true
cG.ZIndex=3
if cG:IsA"TextLabel"then cG.Size=UDim2.new(0,15,0,15)end
local cH=Instance.new"TextLabel"
cH.BackgroundTransparency=1
cH.Position=UDim2.new(0,37,0,0)
cH.Size=UDim2.new(1,-49,1,0)
cH.Font=Enum.Font.GothamMedium
cH.TextSize=13
cH.TextXAlignment=0
cH.TextTruncate=Enum.TextTruncate.AtEnd
cH.Text=cC
cH.Parent=cE
cH.Visible=true
cH.TextTransparency=0
cH.ZIndex=3
ae.tag(cH,"TextColor3","Dim")
cE.MouseEnter:Connect(function()
if ct._active and ct._active.Btn==cE then return end
b1(cE,bT.Hover,{BackgroundTransparency=0.55})
ae.tag(cH,"TextColor3","Text")
end)
cE.MouseLeave:Connect(function()
if ct._active and ct._active.Btn==cE then return end
b1(cE,bT.Hover,{BackgroundTransparency=1})
ae.tag(cH,"TextColor3","Dim")
end)

local cI=Instance.new"ScrollingFrame"
cI.Visible=false
cI.Size=UDim2.fromScale(1,1)
cI.BackgroundTransparency=1
cI.BorderSizePixel=0
cI.ScrollBarThickness=3
cI.ScrollBarImageColor3=cw.Surface2
cI.CanvasSize=UDim2.new(0,0,0,0)
cI.AutomaticCanvasSize=Enum.AutomaticSize.Y
cI.Parent=cy
ae.tag(cI,"ScrollBarImageColor3","Surface2")
local cJ=Instance.new"UIListLayout"
cJ.Padding=UDim.new(0,8)
cJ.SortOrder=Enum.SortOrder.LayoutOrder
cJ.Parent=cI
cm(cI,2,8,2,6)

local cK={Title=cC,Btn=cE,Page=cI,Elements={},_label=cH,_icon=cG}
cK._pl=cJ

local cL=cv.SubTitle or cv.Subtitle or"scripthub"

local function setActive(cM)
ct._active=cK
pcall(function()
cB.Text=string.upper(cL).."  /  "..string.upper(cC)
end)
for cN,cO in ipairs(ct._tabs)do
local cP=cO==cK
cO.Page.Visible=cP
local cQ=cO._label
cQ.TextTransparency=0
b1(cO.Btn,bT.Hover,{BackgroundTransparency=1})
if cP then
ae.tag(cQ,"TextColor3","Text")
if cO._icon and cO._icon:IsA"ImageLabel"then
cO._icon.ImageTransparency=0
b1(cO._icon,bT.Hover,{ImageColor3=aa.Theme.Accent})
end
else
ae.tag(cQ,"TextColor3","Dim")
if cO._icon and cO._icon:IsA"ImageLabel"then
cO._icon.ImageTransparency=0
b1(cO._icon,bT.Hover,{ImageColor3=aa.Theme.Dim})
end
end
end
b1(cA,bT.Med,{Position=UDim2.new(0,0,0,(cF-1)*38-2)})
if cM then
cI.Position=UDim2.new(0,14,0,0)
b1(cI,bT.Med,{Position=UDim2.new(0,0,0,0)})
local cN=0
for cO,cP in ipairs(cI:GetChildren())do
if cP:IsA"Frame"or cP:IsA"CanvasGroup"then
cN+=1
local cQ=math.min(cN*0.02,0.3)
task.delay(cQ,function()
if not cP.Parent then return end
local cR=Instance.new"Frame"
cR.Name="_cascade"
cR.Size=UDim2.fromScale(1,1)
cR.BackgroundColor3=cw.Surface2
cR.BackgroundTransparency=0.55
cR.BorderSizePixel=0
ck(cR,10)
cR.Parent=cP
b1(cR,bT.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()cR:Destroy()end)end)
end)
end
end
end
end
cE.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

table.insert(ct._tabs,cK)
if#ct._tabs==1 then
setActive(false)
cA.Position=UDim2.new(0,0,0,-2)
cA.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
cH.TextTransparency=0
if cG:IsA"ImageLabel"then cG.ImageTransparency=0 end
end)
end)

local function row(cM)
local cN=Instance.new"Frame"
cN.Size=UDim2.new(1,-4,0,cM)
cN.BackgroundColor3=cw.Surface
cN.BorderSizePixel=0
local cO=math.clamp((cv.Radius or 12)-2,4,12)
ck(cN,cO)
cn(cN,cO)
cN.Parent=cI
cl(cN,true)
ae.tag(cN,"BackgroundColor3","Surface")
local cP=cN:FindFirstChild"_light"
if cP then cP.Visible=false end
cN.BackgroundTransparency=1
task.delay(#cK.Elements*0.025,function()
b1(cN,bT.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if cP and cP.Parent then cP.Visible=true end end)
end)
return cN
end
local function titleBlock(cM,cN,cO,cP,cQ)
cP=cP or 112
local cR=Instance.new"TextLabel"
cR.BackgroundTransparency=1
if cO then
cR.Position=UDim2.new(0,14,0,9)
cR.Size=UDim2.new(1,-cP,0,17)
elseif cQ then
cR.Position=UDim2.new(0,14,0,8)
cR.Size=UDim2.new(1,-cP,0,17)
else
cR.Position=UDim2.new(0,14,0,0)
cR.Size=UDim2.new(1,-cP,1,0)
end
cR.Font=Enum.Font.GothamMedium
cR.TextSize=13
cR.TextXAlignment=0
cR.TextTruncate=Enum.TextTruncate.AtEnd
cR.Text=cN
cR.Parent=cM
ae.tag(cR,"TextColor3","Text")
if cO then
local cS=Instance.new"TextLabel"
cS.BackgroundTransparency=1
cS.Position=UDim2.new(0,14,0,30)
cS.Size=UDim2.new(1,-cP,0,14)
cS.Font=Enum.Font.Gotham
cS.TextSize=11
cS.TextXAlignment=0
cS.TextTruncate=Enum.TextTruncate.AtEnd
cS.Text=cO
cS.Parent=cM
ae.tag(cS,"TextColor3","Dim")
end
end
local function reg(cM)
table.insert(cK.Elements,cM)
cM._tab=cK
if not cM._go then
cM._go=function()
if ct._activateTab then ct._activateTab(cK,true)end
ct:_flash(cM.Frame)
end
end
if cM.Flag and cM._set then
aa._live[cM.Flag]=aa._live[cM.Flag]or{}
table.insert(aa._live[cM.Flag],cM._set)
if aa.Flags["_loaded_"..cM.Flag]~=nil then
local cN=aa.Flags["_loaded_"..cM.Flag]
aa.Flags["_loaded_"..cM.Flag]=nil
task.defer(function()pcall(cM._set,cN,true)end)
elseif cM.Value~=nil and aa.Flags[cM.Flag]==nil then
aa.Flags[cM.Flag]=cM.Value
end
elseif cM.Flag and cM.Value~=nil and aa.Flags[cM.Flag]==nil then
aa.Flags[cM.Flag]=cM.Value
end
return cM._handle
end

local cM={}
local cN={row=row,titleBlock=titleBlock,reg=reg,tab=cK,Window=ct,Th=cw,opts=cv,page=cI,pgui=cx}
cp.attach(cM,cN)

cK.Api=cM
cK._window=ct
cK._activate=function(cO)setActive(cO~=false)end
for cO,cP in pairs(cM)do cK[cO]=function(cQ,...)return cP(cK,...)end end
return cK
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.h()
local ae=a.b()

local af=ab.T
local bT=ab.tween
local b1=ac.spawnCb
local c=ac.corner
local ck=ac.hairline
local cl=ac.lighting
local cm=ac.shadow
local cn=ae.cloneref_check(game:GetService"RunService")
local co=ae.cloneref_check(game:GetService"Players")

local cp={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(cq,cs)
local ct=cq.Window
local cv=cq.Th
local cw=cq.main
local cx=cq.gui

cs=cs or{}
local cy,cz=cs.Width or 175,cs.Height or 370
local cA=cs.Accent or cv.Accent
if type(cA)=="table"then
cA=Color3.new(cA[1]or 0,cA[2]or 0,cA[3]or 0)
end
local cB=tostring(cs.Mode or"Chams")
if not cp[cB]then cB="Chams"end
local cC,cD,cE,cF=true,true,false,100
local cG
pcall(function()cG=co.LocalPlayer end)
local cH=cs.Name or((cG and cG.DisplayName)or"Noob")
local cI=(cG and("@"..cG.Name))or""
local cJ=Instance.new"Frame"
cJ.Name=ae.GetStealthName()
cJ.AnchorPoint=Vector2.new(0,0.5)
cJ.Size=UDim2.fromOffset(cy,cz)
cJ.BackgroundColor3=cv.Surface cJ.BorderSizePixel=0
c(cJ,12)cJ.Parent=cx cJ.Visible=false
ck(cJ,true)cl(cJ,12)cm(cJ,0.5,40)
ad.tag(cJ,"BackgroundColor3","Surface")
local cK=Instance.new"UIScale"cK.Scale=0.92 cK.Parent=cJ
local function dock()
if not cw or not cw.Parent then return end
local cL=cw.Size.X.Offset
cJ.Position=UDim2.new(cw.Position.X.Scale,
cw.Position.X.Offset+cL/2+12,
cw.Position.Y.Scale,cw.Position.Y.Offset)
end
ct:Track(cw:GetPropertyChangedSignal"Position":Connect(dock))
ct:Track(cw:GetPropertyChangedSignal"Size":Connect(dock))
local cL=Instance.new"TextLabel"cL.BackgroundTransparency=1
cL.Position=UDim2.new(0,14,0,0)cL.Size=UDim2.new(1,-48,0,34)
cL.Font=Enum.Font.GothamBold cL.TextSize=14 cL.TextXAlignment=0
cL.TextTruncate=Enum.TextTruncate.AtEnd cL.Text=cs.Title or"Preview"cL.Parent=cJ
ad.tag(cL,"TextColor3","Text")
local cM={open=false}
local function setOpen(cN,cO)
cN=cN and true or false
if cN==cM.open and cJ.Visible==cN then return end
cM.open=cN
if cN then
dock()
cJ.Visible=true
local cP=cJ.Position.X.Offset
cJ.Position=UDim2.new(cJ.Position.X.Scale,cP-24,
cJ.Position.Y.Scale,cJ.Position.Y.Offset)
bT(cJ,af.Med,{Position=UDim2.new(cJ.Position.X.Scale,cP,
cJ.Position.Y.Scale,cJ.Position.Y.Offset)})
bT(cK,af.Spring,{Scale=1})
else
bT(cJ,af.Fast,{Position=UDim2.new(cJ.Position.X.Scale,
cJ.Position.X.Offset-16,cJ.Position.Y.Scale,cJ.Position.Y.Offset)})
task.delay(0.18,function()
if not cM.open then cJ.Visible=false end
end)
if cO then b1(cs.OnClose)end
end
end
local cN=Instance.new"TextButton"cN.Text=""
cN.AnchorPoint=Vector2.new(1,0)cN.Position=UDim2.new(1,-10,0,8)
cN.Size=UDim2.fromOffset(14,14)cN.BackgroundColor3=Color3.fromRGB(255,95,86)
cN.BorderSizePixel=0 cN.AutoButtonColor=false cN.Parent=cJ
c(cN,99)
cN.MouseEnter:Connect(function()
bT(cN,af.Hover,{BackgroundColor3=Color3.fromRGB(215,70,62)})
end)
cN.MouseLeave:Connect(function()
bT(cN,af.Hover,{BackgroundColor3=Color3.fromRGB(255,95,86)})
end)
cN.MouseButton1Click:Connect(function()setOpen(false,true)end)

local cO=Instance.new"ViewportFrame"
cO.Position=UDim2.new(0,10,0,36)cO.Size=UDim2.new(1,-20,1,-48)
cO.BackgroundColor3=cv.Bg cO.BorderSizePixel=0
cO.LightColor=Color3.fromRGB(255,255,255)
cO.LightDirection=Vector3.new(-0.5,-1,-0.6)
cO.Ambient=Color3.fromRGB(90,90,105)
c(cO,8)cO.Parent=cJ
ad.tag(cO,"BackgroundColor3","Bg")
local cP=Instance.new"Frame"cP.BackgroundTransparency=1
cP.Size=UDim2.fromScale(1,1)cP.Parent=cO
local cQ={}
local function bracket(cR,cS)
local cT=Instance.new"Frame"cT.BorderSizePixel=0
cT.AnchorPoint=Vector2.new(cR,cS)cT.Position=UDim2.new(cR,0,cS,0)
cT.Size=UDim2.new(0,14,0,2)cT.Parent=cP
ad.tag(cT,"BackgroundColor3","Accent")
local cU=Instance.new"Frame"cU.BorderSizePixel=0
cU.AnchorPoint=Vector2.new(cR,cS)cU.Position=UDim2.new(cR,0,cS,0)
cU.Size=UDim2.new(0,2,0,14)cU.Parent=cP
ad.tag(cU,"BackgroundColor3","Accent")
table.insert(cQ,cT)table.insert(cQ,cU)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local cR=Instance.new"TextLabel"cR.BackgroundTransparency=1
cR.AnchorPoint=Vector2.new(0.5,0)cR.Position=UDim2.new(0.5,0,0,4)
cR.Size=UDim2.new(1,-16,0,15)cR.Font=Enum.Font.GothamBold
cR.TextSize=11 cR.Text=cH cR.Parent=cP
ad.tag(cR,"TextColor3","Text")
local cS=Instance.new"TextLabel"cS.BackgroundTransparency=1
cS.AnchorPoint=Vector2.new(0.5,0)cS.Position=UDim2.new(0.5,0,0,19)
cS.Size=UDim2.new(1,-16,0,12)cS.Font=Enum.Font.Gotham
cS.TextSize=10 cS.Text=cI cS.Parent=cP
ad.tag(cS,"TextColor3","Dim")
local cT=Instance.new"Frame"cT.BorderSizePixel=0
cT.AnchorPoint=Vector2.new(0,0.5)cT.Position=UDim2.new(0,6,0.5,0)
cT.Size=UDim2.new(0,4,1,-40)cT.BackgroundColor3=cv.Surface2
c(cT,99)cT.Parent=cP
ad.tag(cT,"BackgroundColor3","Surface2")
local cU=Instance.new"Frame"cU.BorderSizePixel=0
cU.AnchorPoint=Vector2.new(0,1)cU.Position=UDim2.new(0,0,1,0)
cU.Size=UDim2.new(1,0,1,0)cU.BackgroundColor3=cv.Success
c(cU,99)cU.Parent=cT
ad.tag(cU,"BackgroundColor3","Success")

local cV=Instance.new"WorldModel"cV.Parent=cO
local cW=Instance.new"Camera"cW.Parent=cO
cO.CurrentCamera=cW
cW.CFrame=CFrame.new(Vector3.new(0,3.0,9),Vector3.new(0,2.4,0))
local cX,g,N={},{},{}
local function part(S,_,cY)
local cZ=Instance.new"Part"cZ.Name=S
cZ.Size=_ cZ.Position=cY cZ.Anchored=true cZ.CanCollide=false
cZ.TopSurface=Enum.SurfaceType.Smooth
cZ.BottomSurface=Enum.SurfaceType.Smooth
cZ.Color=Color3.fromRGB(200,200,215)
cZ.Material=Enum.Material.Plastic
cZ.Parent=cV
table.insert(cX,cZ)
if S=="Left Arm"or S=="Right Arm"then g[S]=cZ end
local c_=Instance.new"SelectionBox"
c_.Adornee=cZ c_.LineThickness=0.05
c_.Color3=Color3.fromRGB(255,255,255)
c_.SurfaceTransparency=1 c_.Visible=false
c_.Parent=cZ
N[cZ]=c_
return cZ
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local cY={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local function paint()
for cZ,c_ in ipairs(cX)do
if c_ and c_.Parent then
if cB=="Noob"then
c_.Color=cY[c_.Name]or Color3.fromRGB(200,200,215)
c_.Material=Enum.Material.Plastic
c_.Transparency=0
elseif cB=="Ghost"then
c_.Color=cA
c_.Material=Enum.Material.ForceField
c_.Transparency=0
elseif cB=="Solid"or cB=="Box"then
c_.Color=Color3.fromRGB(200,200,215)
c_.Material=Enum.Material.Plastic
c_.Transparency=0
else
c_.Color=cA
c_.Material=Enum.Material.Plastic
c_.Transparency=0
end
local S=N[c_]
if S then
S.Visible=cE or cB=="Outline"
S.Color3=cA
end
end
end
for cZ,c_ in ipairs(cQ)do
if c_ then c_.Visible=cC or cB=="Box"end
end
cR.Visible=cD or cB=="Name"
cS.Visible=cR.Visible
cT.Visible=cC or cB=="HP bar"
end
paint()

local cZ=0
local c_={}
for S,_ in ipairs(cX)do c_[_]=_.Position end
local S={
["Left Arm"]=Vector3.new(-1,3.9,0),
["Right Arm"]=Vector3.new(1,3.9,0),
}
local _
_=cn.RenderStepped:Connect(function(c0)
if not cO.Parent then pcall(function()_:Disconnect()end)return end
if not cM.open then return end
cZ+=c0
local c1=math.sin(cZ*2.2)*0.045
local c2=math.sin(cZ*2.2)*0.09
for c3,c4 in ipairs(cX)do
if c4 and c4.Parent and c_[c4]then
local c5=S[c4.Name]
if c5 then
local c6=c4.Name=="Left Arm"and 1 or-1
c4.CFrame=CFrame.new(c5)
*CFrame.Angles(c2*c6,0,0.05*c6)
*CFrame.new(c_[c4]-c5+Vector3.new(0,c1,0))
else
c4.Position=c_[c4]+Vector3.new(0,c1,0)
end
end
end
end)
ct:Track(_)
function cM.Show(c0)setOpen(true)end
function cM.Hide(c0,c1)setOpen(false,not c1)end
function cM.Toggle(c0)setOpen(not cM.open,not cM.open)end
function cM.SetVisible(c0,c1)
if c1 then c0:Show()else c0:Hide(true)end
end
function cM.IsOpen(c0)return cM.open end
function cM.SetAccent(c0,c1)
if type(c1)=="table"then
c1=Color3.new(c1[1]or 0,c1[2]or 0,c1[3]or 0)
end
if typeof(c1)=="Color3"then cA=c1 paint()end
end
function cM.SetMode(c0,c1)cB=tostring(c1)if not cp[cB]then cB="Chams"end paint()end
function cM.SetBox(c0,c1)
cC=c1 and true or false paint()
end
function cM.SetOutline(c0,c1)
cE=c1 and true or false paint()
end
function cM.SetName(c0,c1)
cD=c1 and true or false paint()
end
function cM.SetNameText(c0,c1)
local c2=tostring(c1 or"")
local c3=string.find(c2,"@")
if c3 then
cR.Text=string.sub(c2,1,c3-1)
cS.Text="@"..string.gsub(string.sub(c2,c3+1),"^@","")
else
cR.Text=c2
end
cH=cR.Text
end
function cM.SetHealth(c0,c1)
cF=math.clamp(tonumber(c1)or 100,0,100)
bT(cU,af.Fast,{Size=UDim2.new(1,0,cF/100,0)})
end

aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(c0,c1)
local c2=c0
if type(c2)=="table"then
c2=Color3.new(c2[1]or 0,c2[2]or 0,c2[3]or 0)
end
if typeof(c2)=="Color3"then cA=c2 paint()end
end)
if aa.Flags.ESPColor~=nil then
local c0=aa.Flags.ESPColor
if type(c0)=="table"then
c0=Color3.new(c0[1]or 0,c0[2]or 0,c0[3]or 0)
end
if typeof(c0)=="Color3"then cA=c0 paint()end
end
return cM
end end function a.J():typeof(__modImpl())local aa=a.cache.J if not aa then aa={c=__modImpl()}a.cache.J=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.b()
local ae=a.e()a.h()a.f()


local af=a.g()
local bT=a.j()
local b1=a.I()
local c=a.J()
local ck=a.t()

local cl=aa
local cm=ab.T
local cn=ab.tween
local co=ac.spawnCb
local cp=ac.corner
local cq=ac.hairline
local cs=ac.pad
local ct=ac.lighting
local cv=ac.topLight
local cw=ac.shadow
local cx=ac.makeDraggable
local cy=ae.makeIcon
local cz=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(cA)
local cB=cA:FindFirstChild"Notification"
if cB then return cB end
cB=Instance.new"Frame"
cB.Name="Notification"
cB.AnchorPoint=Vector2.new(1,1)
cB.Position=UDim2.new(1,-18,1,-18)
cB.Size=UDim2.new(0,300,1,-36)
cB.BackgroundTransparency=1
cB.Parent=cA
local cC=Instance.new"UIListLayout"
cC.VerticalAlignment=Enum.VerticalAlignment.Bottom
cC.Padding=UDim.new(0,10)
cC.SortOrder=Enum.SortOrder.LayoutOrder
cC.Parent=cB
return cB
end

local function bumpRecent(cA,cB,cC)
if not cB or cB==""then return end
for cD,cE in ipairs(aa._recent)do
if cE.label==cB and cE.tab==cA then table.remove(aa._recent,cD)break end
end
table.insert(aa._recent,1,{tab=cA,label=cB,go=cC})
while#aa._recent>8 do table.remove(aa._recent)end
for cD,cE in ipairs(aa._recentRefresh)do pcall(cE)end
end
aa._bumpRecent=function(cA,cB,cC,cD)
return bumpRecent(cB,cC,cD)
end







local cA={}
local function flyTo(cB,cC,cD,cE)
local cF=cA[cB]
if cF then pcall(function()cF:Cancel()end)end
cA[cB]=nil
local cG=cn(cB,cD or cm.Med,cC)
if not cG then
pcall(function()
for cH,cI in pairs(cC)do cB[cH]=cI end
end)
if cE then cE()end
return nil
end
cA[cB]=cG
if cE then
cG.Completed:Connect(function(cH)
if cA[cB]==cG then
cA[cB]=nil
if cH==Enum.PlaybackState.Completed then cE()end
end
end)
end
return cG
end

return function(cB,cC)
cC=cC or{}
local cD=cC.Title or"Kronos"
local cE=cC.SubTitle or cC.Subtitle or"scripthub"
local cF=cC.ToggleKey or Enum.KeyCode.RightControl
local cG=cC.Acrylic
if cG==nil then cG=true end
if cC.Theme then cB:SetTheme(cC.Theme)end
local cH=cB.Theme
cB:SetAcrylic(cG,cC.Blur or 16)

local cI=ad.GetRoot()
if cB._gui then pcall(function()cB._gui:Destroy()end)end

local cJ=Instance.new"ScreenGui"
cJ.Name=ad.GetStealthName()cJ.ResetOnSpawn=false cJ.IgnoreGuiInset=true cJ.DisplayOrder=999
cJ.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(cJ)
cJ.Parent=cI
cB._gui=cJ



local cK=Instance.new"ScreenGui"
cK.Name=ad.GetStealthName()cK.ResetOnSpawn=false cK.IgnoreGuiInset=true cK.DisplayOrder=1000
cK.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(cK)
cK.Parent=cI

local cL=Instance.new"Frame"
cL.Name="Dim"cL.Size=UDim2.fromScale(1,1)
cL.BackgroundColor3=Color3.fromRGB(3,4,7)cL.BackgroundTransparency=1
cL.BorderSizePixel=0 cL.Parent=cJ


local cM=cC.Background~=false
cL.Visible=cM
local function dimTo(cN,cO)
if not cM then
if cN>=1 then cL.Visible=false end
return
end
cL.Visible=true
cn(cL,cO,{BackgroundTransparency=cN})
end
dimTo(0.5,cm.Slow)


if cC.Ambient~=false then
local cN=Instance.new"Frame"cN.Name="_ambient"
cN.AnchorPoint=Vector2.new(0.5,0.5)cN.Position=UDim2.new(0.5,0,0.5,0)
cN.Size=UDim2.new(1.4,0,1.4,0)cN.BackgroundColor3=Color3.fromRGB(255,255,255)
cN.BackgroundTransparency=0 cN.BorderSizePixel=0 cN.Parent=cL
local cO=Instance.new"UIGradient"cO.Rotation=25
cO.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,cH.Accent),
ColorSequenceKeypoint.new(1,cH.Accent2 or cH.Accent)}
cO.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
cO.Parent=cN
table.insert(cl._gradients,cO)
task.spawn(function()
while cJ.Parent do
cn(cO,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not cJ.Parent then break end
cn(cO,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local cN=Instance.new"CanvasGroup"
cN.Name="Main"cN.AnchorPoint=Vector2.new(0.5,0.5)
cN.Position=UDim2.new(0.5,0,0.5,0)cN.Size=UDim2.fromOffset(620,440)
cN.BackgroundColor3=cH.Surface
cN.BackgroundTransparency=(cG and not cB._transparent)and 0.08 or 0
cN.GroupTransparency=1 cN.BorderSizePixel=0 cN.Parent=cJ
cp(cN,cC.Radius or 12)cq(cN,true)cv(cN)cw(cN,0.5,48)



local cO,cP=1,1
local cQ=Instance.new"UIScale"cQ.Scale=0.94 cQ.Parent=cN
local function baseScale()return cO*cP end





local function brandInto(cR,cS)
if cC.Logo and cC.Logo~=""then
local cT=Instance.new"ImageLabel"cT.BackgroundTransparency=1
cT.AnchorPoint=Vector2.new(0.5,0.5)cT.Position=UDim2.new(0.5,0,0.5,0)
cT.Size=UDim2.new(1,-8,1,-8)cT.Image=cC.Logo
cT.ScaleType=Enum.ScaleType.Fit cT.Parent=cR
cp(cT,8)
if cS then cS.Visible=false end
return cT
end
return nil
end


local function kronosFace(cR,cS,cT,cU)
local cV=cT or 26
local cW=Instance.new"Frame"cW.Name="_disc"
cW.AnchorPoint=Vector2.new(0.5,0.5)cW.Position=UDim2.new(0.5,0,0.5,0)
cW.Size=UDim2.fromOffset(cV,cV)cW.BackgroundColor3=Color3.fromRGB(0,0,0)
cW.BorderSizePixel=0 cW.Parent=cR
local cX=Instance.new"UICorner"cX.CornerRadius=UDim.new(0.5,0)cX.Parent=cW
local cY=Instance.new"UIStroke"cY.Thickness=2
cY.Color=Color3.fromRGB(255,255,255)cY.Transparency=0.12 cY.Parent=cW
pcall(function()
local cZ=Instance.new"UIShadow"cZ.Color=Color3.fromRGB(255,255,255)
cZ.Transparency=0.82 cZ.BlurSize=10 cZ.Parent=cW
end)
if cS then
cS.AnchorPoint=Vector2.new(0.5,0.5)cS.Position=UDim2.new(0.5,0,0.5,0)
cS.Size=UDim2.fromOffset(cV,cV)cS.TextSize=cU or 16
cS.ZIndex=2
end
return cW
end

local function playEntrance()
cl:_sfx"Open"
cn(cN,cm.Slow,{GroupTransparency=0})
cn(cQ,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})
end
playEntrance()


local cR=Instance.new"Frame"
cR.Size=UDim2.new(1,-24,0,2)cR.Position=UDim2.new(0,12,0,0)
cR.BackgroundTransparency=1 cR.Parent=cN
local cS=Instance.new"Frame"cS.Size=UDim2.new(0,0,1,0)
cp(cS,99)cS.Parent=cR
cl:agrad(cS,0)
cn(cS,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()cR:Destroy()end)end)


local cT=Instance.new"Frame"
cT.Name="Header"cT.Size=UDim2.new(1,0,0,62)
cT.BackgroundTransparency=1 cT.Parent=cN
cs(cT,14,6,14,14)


local cU=Instance.new"Frame"cU.Name="Mark"
cU.Size=UDim2.fromOffset(36,36)cU.BackgroundColor3=cH.Surface2
cU.BorderSizePixel=0 cp(cU,10)cU.Parent=cT
cq(cU,true)
local cV=Instance.new"TextLabel"cV.Size=UDim2.fromScale(1,1)
cV.BackgroundTransparency=1 cV.Font=Enum.Font.GothamBlack
cV.TextSize=18 cB:_tag(cV,"TextColor3","Text")cV.Text="K"cV.Parent=cU
local cW=Instance.new"Frame"cW.Size=UDim2.fromOffset(8,8)
cW.Position=UDim2.new(1,-5,0,-3)cW.BorderSizePixel=0
cB:_tag(cW,"BackgroundColor3","Accent")
cp(cW,99)cW.Parent=cU
brandInto(cU,cV)
if not cC.Logo or cC.Logo==""then kronosFace(cU,cV,26,15)end

local cX=Instance.new"TextLabel"cX.BackgroundTransparency=1
cX.Position=UDim2.new(0,48,0,0)cX.Size=UDim2.new(0,230,0,20)
cX.Font=Enum.Font.GothamBold cX.TextSize=15 cX.TextXAlignment=0
cB:_tag(cX,"TextColor3","Text")cX.Text=cD cX.Parent=cT
local cY=Instance.new"TextLabel"cY.BackgroundTransparency=1
cY.Position=UDim2.new(0,48,0,21)cY.Size=UDim2.new(0,230,0,15)
cY.Font=Enum.Font.Gotham cY.TextSize=11 cX.TextXAlignment=0
cY.TextXAlignment=0 cB:_tag(cY,"TextColor3","Dim")
cY.Text=string.upper(cE).."  |  V"..cB.Version cY.Parent=cT


local cZ=Instance.new"Frame"
cZ.AnchorPoint=Vector2.new(1,0)cZ.Position=UDim2.new(1,-64,0,4)
cZ.Size=UDim2.new(0,170,0,32)cZ.BackgroundColor3=cH.Bg
cZ.BorderSizePixel=0 cp(cZ,8)cZ.Parent=cT
cq(cZ,true)
local c_=cy("search",14,cH.Dim)
c_.Position=UDim2.new(0,9,0.5,-7)c_.Parent=cZ
local c0=Instance.new"TextBox"c0.PlaceholderText="Search"
c0.PlaceholderColor3=cH.Dim c0.Text=""c0.Font=Enum.Font.GothamBold
c0.TextSize=12 cB:_tag(c0,"TextColor3","Text")
c0.Position=UDim2.new(0,28,0,0)c0.Size=UDim2.new(1,-80,1,0)
c0.BackgroundTransparency=1 c0.ClearTextOnFocus=false c0.Parent=cZ
local c1=Instance.new"TextLabel"c1.BackgroundTransparency=1
c1.AnchorPoint=Vector2.new(1,0.5)c1.Position=UDim2.new(1,-8,0.5,0)
c1.Size=UDim2.new(0,44,0,18)c1.Font=Enum.Font.Code c1.TextSize=11
cB:_tag(c1,"TextColor3","Text")c1.Text="Ctrl K"c1.Parent=cZ
cB:_tag(cZ,"BackgroundColor3","Bg")


local c2=Instance.new"TextButton"c2.Text=""
c2.AnchorPoint=Vector2.new(1,0)c2.Position=UDim2.new(1,-256,0,4)
c2.Size=UDim2.fromOffset(32,32)c2.BackgroundColor3=cH.Bg
c2.BorderSizePixel=0 cp(c2,8)c2.Parent=cT
cq(c2,true)
cB:_tag(c2,"BackgroundColor3","Bg")
local c3=cy("keyboard",15,cH.Dim)
c3.AnchorPoint=Vector2.new(0.5,0.5)c3.Position=UDim2.new(0.5,0,0.5,0)
c3.Parent=c2
c2.MouseButton1Click:Connect(function()end)

local c4=Instance.new"TextButton"c4.Text=""
c4.AnchorPoint=Vector2.new(1,0)c4.Position=UDim2.new(1,-296,0,4)
c4.Size=UDim2.fromOffset(32,32)c4.BackgroundColor3=cH.Bg
c4.BorderSizePixel=0 cp(c4,8)c4.Parent=cT
cq(c4,true)
cB:_tag(c4,"BackgroundColor3","Bg")
local c5=cy("menu",15,cH.Dim)
c5.AnchorPoint=Vector2.new(0.5,0.5)c5.Position=UDim2.new(0.5,0,0.5,0)
c5.Parent=c4
c4.MouseButton1Click:Connect(function()end)


local c6=Instance.new"Frame"c6.BackgroundTransparency=1
c6.AnchorPoint=Vector2.new(1,0)c6.Position=UDim2.new(1,0,0,4)
c6.Size=UDim2.new(0,56,0,32)c6.Parent=cT
local g=Instance.new"UIListLayout"g.FillDirection=Enum.FillDirection.Horizontal
g.VerticalAlignment=Enum.VerticalAlignment.Center
g.HorizontalAlignment=Enum.HorizontalAlignment.Center
g.Padding=UDim.new(0,7)g.Parent=c6
local function dot(N,S)
local _=Instance.new"TextButton"_.Text=""
_.Size=UDim2.fromOffset(12,12)_.BackgroundColor3=N
_.BorderSizePixel=0 cp(_,99)_.AutoButtonColor=false _.Parent=c6
_.MouseEnter:Connect(function()cn(_,cm.Hover,{BackgroundTransparency=0.25})end)
_.MouseLeave:Connect(function()cn(_,cm.Hover,{BackgroundTransparency=0})end)
return _
end
local N=dot(Color3.fromRGB(39,201,63))
local S=dot(Color3.fromRGB(255,189,46))
local _=dot(Color3.fromRGB(255,95,86))
_.MouseButton1Click:Connect(function()end)
S.MouseButton1Click:Connect(function()end)
N.MouseButton1Click:Connect(function()end)


local c7=Instance.new"TextButton"c7.Text=""
c7.AnchorPoint=Vector2.new(1,0)c7.Position=UDim2.new(1,-336,0,4)
c7.Size=UDim2.fromOffset(32,32)c7.BackgroundColor3=cH.Bg
c7.BorderSizePixel=0 cp(c7,8)c7.Parent=cT
cq(c7,true)
cB:_tag(c7,"BackgroundColor3","Bg")
local c8=cy("bellring",14,cH.Dim)
c8.AnchorPoint=Vector2.new(0.5,0.5)c8.Position=UDim2.new(0.5,0,0.5,0)
c8.Parent=c7
local c9=Instance.new"Frame"c9.Size=UDim2.fromOffset(8,8)
c9.Position=UDim2.new(1,-7,0,3)c9.BorderSizePixel=0
c9.BackgroundColor3=Color3.fromRGB(248,113,113)
cp(c9,99)c9.Parent=c7 c9.Visible=false
c7.MouseButton1Click:Connect(function()end)

cx(cT,cN)


local da=Instance.new"Frame"da.Name="Body"
da.Position=UDim2.new(0,0,0,62)da.Size=UDim2.new(1,0,1,-62)
da.BackgroundTransparency=1 da.Parent=cN
local db=Instance.new"UIPadding"db.PaddingLeft=UDim.new(0,12)
db.PaddingRight=UDim.new(0,12)db.PaddingBottom=UDim.new(0,12)db.Parent=da

local dc=Instance.new"Frame"dc.Name="Sidebar"
dc.Size=UDim2.new(0,164,1,0)dc.BackgroundColor3=cH.Bg
dc.BackgroundTransparency=(cG and not cB._transparent)and 0.15 or 0
dc.BorderSizePixel=0 cp(dc,10)dc.Parent=da
cq(dc,true)
cB:_tag(dc,"BackgroundColor3","Bg")
ct(dc,10)
cs(dc,8,8,8,8)

local dd=Instance.new"Frame"dd.Name="Nav"
dd.Size=UDim2.new(1,0,1,0)dd.BackgroundTransparency=1 dd.Parent=dc
local de=Instance.new"UIListLayout"de.Padding=UDim.new(0,4)
de.SortOrder=Enum.SortOrder.LayoutOrder de.Parent=dd




local df=Instance.new"Frame"df.Name="_pill"
df.Size=UDim2.new(1,0,0,38)df.Position=UDim2.new(0,0,0,-2)
df.BackgroundColor3=cH.Surface2 df.BorderSizePixel=0
df.ZIndex=0
cp(df,8)df.Parent=dc
cq(df,true)
cB:_tag(df,"BackgroundColor3","Surface2")

local dg=Instance.new"Frame"dg.Name="Pages"
dg.Position=UDim2.new(0,176,0,0)dg.Size=UDim2.new(1,-176,1,0)
dg.BackgroundTransparency=1 dg.ClipsDescendants=true dg.Parent=da

local dh={
_gui=cJ,_main=cN,_side=dc,_nav=dd,_pages=dg,_pill=df,
_tabs={},_active=nil,_toggleKey=cF,_visible=true,_keybinds={},
_conns={},_acrylicPref=cG,
}

function dh.Track(di,dj)table.insert(di._conns,dj)return dj end
local di
local dj
local dk,dl
dh._cfgTitle=cD

dh._folder="Kronos/"..tostring(cD)
pcall(function()
if makefolder and isfolder and not isfolder"Kronos"then makefolder"Kronos"end
if makefolder and isfolder and not isfolder(dh._folder)then makefolder(dh._folder)end
end)

function dh._activateTab(dm,dn)
if dm and dm._activate then pcall(dm._activate,dn~=false)end
end

function dh._flash(dm,dn)
if not dn or not dn.Parent then return end
local dp=Instance.new"Frame"dp.Name="_flash"
dp.Size=UDim2.fromScale(1,1)dp.BackgroundColor3=cH.Accent
dp.BackgroundTransparency=0.75 dp.BorderSizePixel=0
cp(dp,10)dp.Parent=dn
cn(dp,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()dp:Destroy()end)end)
end

dh:Track(cz.InputBegan:Connect(function(dm,dn)
if dn then return end
if dm.KeyCode==dh._toggleKey then dh:Toggle()end
if dm.KeyCode==Enum.KeyCode.K and cz:IsKeyDown(Enum.KeyCode.LeftControl)then
dh:TogglePalette()
end
if dm.KeyCode==Enum.KeyCode.P and cz:IsKeyDown(Enum.KeyCode.LeftControl)then
dh:TogglePalette()
end
if dm.KeyCode==Enum.KeyCode.Tab and cz:IsKeyDown(Enum.KeyCode.LeftControl)then
local dp=table.find(dh._tabs,dh._active)or 0
local dq=dh._tabs[(dp%#dh._tabs)+1]
if dq then cl:_sfx"Swap"dh._activateTab(dq,true)end
end
end))

c0:GetPropertyChangedSignal"Text":Connect(function()
local dm=string.lower(c0.Text)
for dn,dp in ipairs(dh._tabs)do
local dq=dm==""or string.find(string.lower(dp.Title),dm,1,true)~=nil
for dr,ds in ipairs(dp.Elements)do
local dt
if dm==""then
dt=true
elseif dq then
dt=true
else

local du=string.lower(tostring(ds.Title or"").." "..tostring(ds.Flag or""))
local dv=ds._handle
if dv and type(dv.Get)=="function"then
local dw,dx=pcall(dv.Get,dv)
if dw then
if type(dx)=="string"or type(dx)=="number"then
du=du.." "..string.lower(tostring(dx))
elseif type(dx)=="table"then
for dy,dz in ipairs(dx)do du=du.." "..string.lower(tostring(dz))end
end
end
end
dt=string.find(du,dm,1,true)~=nil
end
ds._searchVisible=(dm=="")and nil or dt
if ds.Frame then ds.Frame.Visible=dt end
end
dp.Btn.Visible=(dq or dm=="")
if dm~=""then

for dr,ds in ipairs(dp.Elements)do
if ds.Frame and ds.Frame.Visible then dp.Btn.Visible=true break end
end
else

for dr,ds in ipairs(dp.Elements)do
if ds._refreshSection then pcall(ds._refreshSection)end
end
end
end
end)


c0.Focused:Connect(function()cn(cZ,cm.Hover,{Size=UDim2.new(0,190,0,32)})end)
c0.FocusLost:Connect(function()cn(cZ,cm.Hover,{Size=UDim2.new(0,170,0,32)})end)

function dh.SetVisible(dm,dn)
dm._visible=dn

local function pillTarget()
local dp,dq=cJ.AbsoluteSize.X,cJ.AbsoluteSize.Y
if dp<1 then dp,dq=1200,800 end
local dr,ds=di.AbsolutePosition,di.AbsoluteSize
return UDim2.new(0,dr.X+ds.X/2-dp/2,0,dr.Y+ds.Y/2-dq/2)
end
if dn then
cJ.Enabled=true
dm._mini=false
if dk then dk.Visible=false end
if di then di.Visible=false end
cN.Position=pillTarget()
cQ.Scale=baseScale()*0.55
cN.GroupTransparency=1
cL.BackgroundTransparency=1
if dm._acrylicPref then cl:SetAcrylic(true,cC.Blur or 16)end
cl:_sfx"Open"

cn(cN,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=dm._lastPos or UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
cn(cQ,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})

dimTo(0.5,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
else
dm._mini=false
dm._lastPos=cN.Position
if dk then dk.Visible=false end
cl:SetAcrylic(false)
for dp,dq in pairs(cl.Sound._cache)do pcall(function()dq:Stop()end)end
cn(cN,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
cn(cQ,cm.Fast,{Scale=baseScale()*0.55})

dimTo(1,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In))
task.delay(0.36,function()
if dm._visible then return end
cJ.Enabled=false
if di then
di.Visible=true
dj.Scale=0.5
cn(dj,cm.Spring,{Scale=1})
end
end)
end
end
function dh.Toggle(dm)dm:SetVisible(not dm._visible)end


function dh.SetToggleKey(dm,dn)
if type(dn)=="string"then dn=Enum.KeyCode[dn]end
if typeof(dn)=="EnumItem"then
if dm._toggleKey==dn then return end
dm._toggleKey=dn
dm:Notify{Title="Hide key",Content="Now bound to "..dn.Name,Duration=1.5}
end
end
function dh.GetToggleKey(dm)return dm._toggleKey end


function dh.OnClose(dm,dn)
if type(dn)=="function"then dm._onCloseCb=dn end
end

function dh.SetMini(dm,dn)
dn=dn and true or false
if dn==dm._mini then return end
dm._mini=dn
if dn then
dm._visible=false
dm._lastPos=cN.Position
di.Visible=false
cl:SetAcrylic(false)
for dp,dq in pairs(cl.Sound._cache)do pcall(function()dq:Stop()end)end
cn(cN,cm.Fast,{GroupTransparency=1})
cn(cQ,cm.Fast,{Scale=baseScale()*0.7})
dimTo(1,cm.Fast)
task.delay(0.2,function()
if not dm._mini then return end
cJ.Enabled=false
dk.Visible=true
dl.Scale=0.5
cn(dl,cm.Spring,{Scale=1})
end)
else
dk.Visible=false
dm:SetVisible(true)
end
end



dh._sbMode=0
dh._focus=false
function dh._applyLayout(dm)
local dn=dm._focus and 2 or dm._sbMode
local dp=dn==1
dc.Visible=dn~=2
if dn==0 then
cn(dc,cm.Fast,{Size=UDim2.new(0,164,1,0)})
dg.Position=UDim2.new(0,176,0,0)
dg.Size=UDim2.new(1,-176,1,0)
elseif dn==1 then
cn(dc,cm.Fast,{Size=UDim2.new(0,58,1,0)})
dg.Position=UDim2.new(0,70,0,0)
dg.Size=UDim2.new(1,-70,1,0)
else
dg.Position=UDim2.new(0,0,0,0)
dg.Size=UDim2.new(1,0,1,0)
end
for dq,dr in ipairs(dm._tabs)do
if dr._label then dr._label.Visible=not dp end
if dr._icon and dr._icon:IsA"GuiObject"then
dr._icon.Position=dp and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end
end
function dh.CycleSidebar(dm)
dm._sbMode=(dm._sbMode+1)%3
dm:_applyLayout()
dm:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[dm._sbMode+1],Duration=1.5}
end
function dh.SetFocus(dm,dn)
dm._focus=dn and true or false
dm:_applyLayout()
end
local function fitCard()
local dm=Vector2.new(1200,800)
pcall(function()dm=workspace.CurrentCamera.ViewportSize end)
local dn=math.clamp(math.min(dm.X/700,dm.Y/520),0.6,1)
cO=dn
cQ.Scale=baseScale()
if dm.X<760 or cz.TouchEnabled then
if dh._sbMode==0 and not dh._userToggledSide then
dh._sbMode=2 dh:_applyLayout()
end
end
end
c4.MouseButton1Click:Connect(function()
cl:_sfx"Click"
dh._userToggledSide=true
dh:CycleSidebar()
end)
c2.MouseButton1Click:Connect(function()
cl:_sfx"Click"dh:ToggleKeybindList()
end)


local dm=cC.ConfirmClose
if dm==nil then dm=true end
local function requestClose()
cl:_sfx"Click"
if dm==false then dh:Destroy()return end
local dn=(type(dm)=="table")and dm or{}
dh:Dialog{
Title=dn.Title or"Close Kronos?",
Content=dn.Content or"The hub will close permanently and all features will be disabled.",
Buttons={
{Title=dn.Cancel or"Cancel"},
{Title=dn.Confirm or"Close",Callback=function()dh:Destroy()end},
},
}
end
_.MouseButton1Click:Connect(function()requestClose()end)
S.MouseButton1Click:Connect(function()
cl:_sfx"Click"dh:SetMini(not dh._mini)
end)
dh._zoomed=false
N.MouseButton1Click:Connect(function()
cl:_sfx"Click"
dh._zoomed=not dh._zoomed
cn(cN,cm.Med,{Size=dh._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
c7.MouseButton1Click:Connect(function()
cl:_sfx"Click"dh:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
dh:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

di=Instance.new"TextButton"di.Name=ad.GetStealthName()
di.Text=""
di.AnchorPoint=Vector2.new(0,0.5)di.Position=UDim2.new(0,12,0.5,0)
di.Size=UDim2.fromOffset(42,42)
di.BackgroundColor3=cH.Surface2 di.BorderSizePixel=0
cB:_tag(di,"BackgroundColor3","Surface2")
cp(di,13)di.Parent=cJ di.Visible=false
cq(di,true)
cw(di,0.6,20)

local dn=Instance.new"TextLabel"dn.Size=UDim2.fromScale(1,1)
dn.BackgroundTransparency=1 dn.Font=Enum.Font.GothamBlack
dn.TextSize=20 dn.Text="K"dn.Parent=di
cB:_tag(dn,"TextColor3","Text")
local dp=Instance.new"Frame"dp.Size=UDim2.fromOffset(9,9)
dp.Position=UDim2.new(1,-6,0,-3)dp.BorderSizePixel=0
cB:_tag(dp,"BackgroundColor3","Accent")
cp(dp,99)dp.Parent=di
brandInto(di,dn)
if not cC.Logo or cC.Logo==""then kronosFace(di,dn,32,17)end
dj=Instance.new"UIScale"dj.Parent=di
cx(di,di)
di.MouseButton1Click:Connect(function()dh:SetVisible(true)end)


dk=Instance.new"TextButton"dk.Name=ad.GetStealthName()
dk.Text=""
dk.AnchorPoint=Vector2.new(0,0)dk.Position=UDim2.new(0,12,0,12)
dk.Size=UDim2.fromOffset(44,44)
dk.BackgroundColor3=cH.Surface2 dk.BorderSizePixel=0
cB:_tag(dk,"BackgroundColor3","Surface2")
cp(dk,13)dk.Parent=cI dk.Visible=false
cq(dk,true)
cw(dk,0.6,20)
local dq=Instance.new"TextLabel"dq.Size=UDim2.fromScale(1,1)
dq.BackgroundTransparency=1 dq.Font=Enum.Font.GothamBlack
dq.TextSize=20 dq.Text="K"dq.Parent=dk
cB:_tag(dq,"TextColor3","Text")
local dr=Instance.new"Frame"dr.Size=UDim2.fromOffset(9,9)
dr.Position=UDim2.new(1,-6,0,-3)dr.BorderSizePixel=0
cB:_tag(dr,"BackgroundColor3","Accent")
cp(dr,99)dr.Parent=dk
brandInto(dk,dq)
if not cC.Logo or cC.Logo==""then kronosFace(dk,dq,34,17)end
dl=Instance.new"UIScale"dl.Parent=dk
cx(dk,dk)
dk.MouseButton1Click:Connect(function()dh:SetMini(false)end)


local ds=Instance.new"TextButton"ds.Text=""
ds.AnchorPoint=Vector2.new(1,1)ds.Position=UDim2.new(1,0,1,0)
ds.Size=UDim2.fromOffset(28,28)ds.BackgroundTransparency=1
ds.Parent=cN ds.ZIndex=50
ds.ClipsDescendants=true


local dt=0
ds.MouseButton1Click:Connect(function()
local du=os.clock()
if du-dt<0.35 then
cl:_sfx"Click"
dh._zoomed=not dh._zoomed
cn(cN,cm.Med,{Size=dh._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
dt=du
end)
local du,dv,dw=false
ds.InputBegan:Connect(function(dx)
if dx.UserInputType==Enum.UserInputType.MouseButton1 or dx.UserInputType==Enum.UserInputType.Touch then
du,dv,dw=true,dx.Position,cN.Size
dx.Changed:Connect(function()
if dx.UserInputState==Enum.UserInputState.End then du=false end
end)
end
end)
dh:Track(cz.InputChanged:Connect(function(dx)
if not du then return end
if dx.UserInputType~=Enum.UserInputType.MouseMovement
and dx.UserInputType~=Enum.UserInputType.Touch then return end
local dy=dx.Position-dv
cN.Size=UDim2.fromOffset(
math.clamp(dw.X.Offset+dy.X,520,920),
math.clamp(dw.Y.Offset+dy.Y,380,660))
end))

function dh.Notify(dx,dy)
dy=dy or{}
cl:_sfx"Notify"
ck.closeAny()
table.insert(cl._inbox,1,{Title=dy.Title or"Kronos",
Content=dy.Content or dy.Text or"",At=os.date"%H:%M"})
while#cl._inbox>30 do table.remove(cl._inbox)end
pcall(function()c9.Visible=true end)
local dz=ensureNotifyHost(cK)
local dA=Instance.new"CanvasGroup"dA.Size=UDim2.new(1,0,0,62)
dA.BackgroundColor3=cH.Surface2 dA.BorderSizePixel=0 dA.GroupTransparency=1
cp(dA,10)dA.Parent=dz
cq(dA,true)
cw(dA,0.65,24)
cl:_tag(dA,"BackgroundColor3","Surface2")
dA.Position=UDim2.new(0,40,0,0)
cn(dA,cm.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local dB=Instance.new"TextLabel"dB.BackgroundTransparency=1
dB.Position=UDim2.new(0,12,0,8)dB.Size=UDim2.new(1,-24,0,17)
dB.Font=Enum.Font.GothamBold dB.TextSize=13 dB.TextXAlignment=0
cl:_tag(dB,"TextColor3","Text")dB.Text=dy.Title or"Kronos"dB.Parent=dA
local dC=Instance.new"TextLabel"dC.BackgroundTransparency=1
dC.Position=UDim2.new(0,12,0,27)dC.Size=UDim2.new(1,-24,0,16)
dC.Font=Enum.Font.Gotham dC.TextSize=12 dC.TextXAlignment=0
cl:_tag(dC,"TextColor3","Dim")
dC.TextTruncate=Enum.TextTruncate.AtEnd dC.Text=dy.Content or dy.Text or""dC.Parent=dA
local dD=Instance.new"Frame"dD.AnchorPoint=Vector2.new(0,1)
dD.Position=UDim2.new(0,10,1,-6)dD.Size=UDim2.new(1,-20,0,2)
dD.BorderSizePixel=0 cl:agrad(dD,0)
cp(dD,99)dD.Parent=dA
local dE=dy.Duration or 4
cn(dD,TweenInfo.new(dE,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(dE+0.1,function()
cn(dA,cm.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()dA:Destroy()end)end)
end)
end


function dh.Dialog(dx,dy)
dy=dy or{}
cl:_sfx"Open"
local dz=Instance.new"TextButton"dz.Text=""dz.AutoButtonColor=false
dz.Size=UDim2.fromScale(1,1)dz.BackgroundColor3=Color3.fromRGB(0,0,0)
dz.BackgroundTransparency=1 dz.Parent=cJ
cn(dz,cm.Med,{BackgroundTransparency=0.55})
local dA=Instance.new"CanvasGroup"dA.AnchorPoint=Vector2.new(0.5,0.5)

local dB=cJ.AbsoluteSize
if dB.X<1 then dB=Vector2.new(1200,800)end
local dC,dD=cN.AbsolutePosition,cN.AbsoluteSize
dA.Position=UDim2.new(0,dC.X+dD.X/2-dB.X/2,0,dC.Y+dD.Y/2-dB.Y/2)
dA.Size=UDim2.fromOffset(320,170)
dA.BackgroundColor3=cH.Surface dA.BorderSizePixel=0 dA.GroupTransparency=1
cp(dA,12)dA.Parent=dz
cq(dA,true)
ct(dA,12)
cw(dA,0.5,40)
cl:_tag(dA,"BackgroundColor3","Surface")
local dE=Instance.new"UIScale"dE.Scale=0.94 dE.Parent=dA
cn(dA,cm.Med,{GroupTransparency=0})
cn(dE,cm.Spring,{Scale=1})
local dF=false
local function close()
if dF then return end dF=true
ck.close(close)
cn(dA,cm.Fast,{GroupTransparency=1})
cn(dz,cm.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dz:Destroy()end)end)
end
ck.open(close)
dz.MouseButton1Click:Connect(function()close()end)
local dG=Instance.new"TextLabel"dG.BackgroundTransparency=1
dG.Position=UDim2.new(0,16,0,14)dG.Size=UDim2.new(1,-32,0,20)
dG.Font=Enum.Font.GothamBold dG.TextSize=15 dG.TextXAlignment=0
cl:_tag(dG,"TextColor3","Text")dG.Text=dy.Title or"Confirm"dG.Parent=dA
local dH=Instance.new"TextLabel"dH.BackgroundTransparency=1
dH.Position=UDim2.new(0,16,0,38)dH.Size=UDim2.new(1,-32,0,60)
dH.Font=Enum.Font.Gotham dH.TextSize=12 dG.TextXAlignment=0
dH.TextXAlignment=0 dH.TextYAlignment=0 dH.TextWrapped=true
cl:_tag(dH,"TextColor3","Dim")dH.Text=dy.Content or""dH.Parent=dA
local dI=Instance.new"Frame"dI.BackgroundTransparency=1
dI.AnchorPoint=Vector2.new(0,1)dI.Position=UDim2.new(0,0,1,-12)
dI.Size=UDim2.new(1,0,0,34)dI.Parent=dA
local dJ=Instance.new"UIListLayout"dJ.FillDirection=Enum.FillDirection.Horizontal
dJ.HorizontalAlignment=Enum.HorizontalAlignment.Right dJ.Padding=UDim.new(0,8)dJ.Parent=dI
cs(dI,0,0,12,12)
for dK,dL in ipairs(dy.Buttons or{{Title="OK"}})do
local dM=Instance.new"TextButton"dM.Text=""
dM.Size=UDim2.new(0,96,0,30)dM.BackgroundColor3=cH.Surface2
dM.BorderSizePixel=0 cp(dM,7)dM.AutoButtonColor=false dM.Parent=dI
cq(dM,true)
cl:_tag(dM,"BackgroundColor3","Surface2")
local dN=Instance.new"TextLabel"dN.BackgroundTransparency=1 dN.Size=UDim2.fromScale(1,1)
dN.Font=Enum.Font.GothamBold dN.TextSize=12
cl:_tag(dN,"TextColor3","Text")dN.Text=dL.Title dN.Parent=dM
local dO=Instance.new"UIScale"dO.Parent=dM
dM.MouseButton1Down:Connect(function()cn(dO,cm.Hover,{Scale=0.95})end)
dM.MouseButton1Up:Connect(function()cn(dO,cm.Spring,{Scale=1})end)
dM.MouseButton1Click:Connect(function()
close()co(dL.Callback)
end)
end
return{Close=close}
end




function dh.KeySystem(dx,dy)
dy=dy or{}
local dz,dA=false,dy.FileName or("kronos_key_"..tostring(cD))

local dB=(dx._folder or"Kronos").."/"..dA..".txt"

if dy.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(dB)then
local dC=readfile(dB)
if dC and dx:_checkKey(dy,dC)then dz=true end
end
end)
end
local dC=Instance.new"TextButton"dC.Text=""dC.AutoButtonColor=false
dC.Size=UDim2.fromScale(1,1)dC.BackgroundColor3=Color3.fromRGB(0,0,0)
dC.BackgroundTransparency=1 dC.ZIndex=200 dC.Parent=cJ
cn(dC,cm.Med,{BackgroundTransparency=0.6})
local dD=Instance.new"CanvasGroup"dD.AnchorPoint=Vector2.new(0.5,0.5)
dD.Position=UDim2.new(0.5,0,0.5,0)dD.Size=UDim2.fromOffset(300,210)
dD.BackgroundColor3=cH.Surface dD.BorderSizePixel=0 dD.GroupTransparency=1
cp(dD,12)dD.Parent=dC
cq(dD,true)
ct(dD,12)
cw(dD,0.5,40)
cl:_tag(dD,"BackgroundColor3","Surface")
local dE=Instance.new"UIScale"dE.Scale=0.94 dE.Parent=dD
cn(dD,cm.Med,{GroupTransparency=0})
cn(dE,cm.Spring,{Scale=1})
local dF=Instance.new"TextLabel"dF.BackgroundTransparency=1
dF.Position=UDim2.new(0,16,0,14)dF.Size=UDim2.new(1,-32,0,20)
dF.Font=Enum.Font.GothamBold dF.TextSize=15 dF.TextXAlignment=0
cl:_tag(dF,"TextColor3","Text")dF.Text=dy.Title or"Enter Key"dF.Parent=dD
local dG=Instance.new"TextLabel"dG.BackgroundTransparency=1
dG.Position=UDim2.new(0,16,0,36)dG.Size=UDim2.new(1,-32,0,15)
dG.Font=Enum.Font.Gotham dG.TextSize=11 dF.TextXAlignment=0 dG.TextXAlignment=0
cl:_tag(dG,"TextColor3","Dim")dG.Text=string.upper(dy.Subtitle or"key required")dG.Parent=dD
local dH=Instance.new"TextBox"dH.PlaceholderText="Paste key..."
dH.PlaceholderColor3=cH.Dim dH.Text=""
dH.Font=Enum.Font.Code dH.TextSize=12
dH.Position=UDim2.new(0,16,0,60)dH.Size=UDim2.new(1,-32,0,32)
dH.BackgroundColor3=cH.Surface2 dH.BorderSizePixel=0
cp(dH,8)dH.Parent=dD
cs(dH,4,4,10,10)
cq(dH,true)
cl:_tag(dH,"BackgroundColor3","Surface2")
cl:_tag(dH,"TextColor3","Text")
local dI=Instance.new"TextLabel"dI.BackgroundTransparency=1
dI.Position=UDim2.new(0,16,0,96)dI.Size=UDim2.new(1,-32,0,15)
dI.Font=Enum.Font.Gotham dI.TextSize=11 dI.TextXAlignment=0 dI.Text=""
cl:_tag(dI,"TextColor3","Danger")dI.Parent=dD
local dJ=Instance.new"TextButton"dJ.Text=""
dJ.Position=UDim2.new(0,16,0,118)dJ.Size=UDim2.new(1,-32,0,32)
dJ.BorderSizePixel=0 cp(dJ,8)dJ.AutoButtonColor=false dJ.Parent=dD
cl:agrad(dJ,15)
local dK=Instance.new"TextLabel"dK.BackgroundTransparency=1 dK.Size=UDim2.fromScale(1,1)
dK.Font=Enum.Font.GothamBold dK.TextSize=13 dK.Text="UNLOCK"
cl:oa(dK)dK.Parent=dJ
local dL=Instance.new"UIScale"dL.Parent=dJ
local dM
if dy.GetKeyLink then
dM=Instance.new"TextButton"dM.Text=""
dM.Position=UDim2.new(0,16,0,156)dM.Size=UDim2.new(1,-32,0,26)
dM.BackgroundTransparency=1 dM.Parent=dD
local dN=Instance.new"TextLabel"dN.BackgroundTransparency=1 dN.Size=UDim2.fromScale(1,1)
dN.Font=Enum.Font.Gotham dN.TextSize=11 dN.Text="Copy key link"
cl:_tag(dN,"TextColor3","Dim")dN.Parent=dM
dM.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(dy.GetKeyLink)end end)
dN.Text="Link copied"
task.delay(2,function()pcall(function()dN.Text="Copy key link"end)end)
end)
end
local function shake()local dN=
dD.Position.X.Offset
for dO=1,3 do
cn(dD,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
cn(dD,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
cn(dD,cm.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
dz=true
if dy.SaveKey~=false then
pcall(function()
if makefolder and isfolder and not isfolder(dx._folder or"Kronos")then
makefolder(dx._folder or"Kronos")
end
if writefile then writefile(dB,dH.Text)end
end)
end
cn(dD,cm.Fast,{GroupTransparency=1})
cn(dC,cm.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()dC:Destroy()end)end)
dx:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
co(dy.OnSuccess)
end
local function check()
local dN=dH.Text
if dx:_checkKey(dy,dN)then unlock()
else dI.Text="Invalid key."task.spawn(shake)end
end
dJ.MouseButton1Down:Connect(function()cn(dL,cm.Hover,{Scale=0.96})end)
dJ.MouseButton1Up:Connect(function()cn(dL,cm.Spring,{Scale=1})end)
dJ.MouseButton1Click:Connect(check)
dH.FocusLost:Connect(function(dN)if dN then check()end end)
if dz then pcall(function()dC:Destroy()end)co(dy.OnSuccess)end
return{Passed=function()return dz end}
end

function cl._checkKey(dx,dy,dz)
if dy.Validate and type(dy.Validate)=="function"then
local dA,dB=pcall(dy.Validate,dz)
if dA and dB then return true end
end
if dy.Key and dz==dy.Key then return true end
if dy.Keys and table.find(dy.Keys,dz)then return true end
if not dy.Key and not dy.Keys and not dy.Validate then return true end
return false
end


function dh.TogglePalette(dx,dy)
local dz=dx._palette
if not dz then
local dA=Instance.new"TextButton"dA.Text=""dA.AutoButtonColor=false
dA.Size=UDim2.fromScale(1,1)dA.BackgroundColor3=Color3.fromRGB(0,0,0)
dA.BackgroundTransparency=1 dA.Visible=false dA.ZIndex=ck.Z.Popup dA.Parent=cK
local dB=Instance.new"Frame"dB.AnchorPoint=Vector2.new(0.5,0)
dB.Position=UDim2.new(0.5,0,0,90)dB.Size=UDim2.fromOffset(380,300)
dB.BackgroundColor3=cH.Bg dB.BorderSizePixel=0
cp(dB,12)dB.Parent=dA
cq(dB,true)
cw(dB,0.5,40)
cl:_tag(dB,"BackgroundColor3","Bg")
local dC=Instance.new"TextBox"dC.PlaceholderText="Type a command..."
dC.PlaceholderColor3=cH.Dim dC.Text=""
dC.Font=Enum.Font.Gotham dC.TextSize=14
dC.Position=UDim2.new(0,14,0,12)dC.Size=UDim2.new(1,-28,0,32)
dC.BackgroundTransparency=1 dC.ClearTextOnFocus=false dC.Parent=dB
cl:_tag(dC,"TextColor3","Text")
local dD=Instance.new"Frame"dD.BorderSizePixel=0
dD.Position=UDim2.new(0,12,0,50)dD.Size=UDim2.new(1,-24,0,1)
dD.BackgroundColor3=Color3.fromRGB(255,255,255)
dD.BackgroundTransparency=0.93 dD.Parent=dB
local dE=Instance.new"ScrollingFrame"
dE.Position=UDim2.new(0,8,0,56)dE.Size=UDim2.new(1,-16,1,-64)
dE.BackgroundTransparency=1 dE.BorderSizePixel=0
dE.ScrollBarThickness=2 dE.CanvasSize=UDim2.new(0,0,0,0)
dE.AutomaticCanvasSize=Enum.AutomaticSize.Y dE.Parent=dB
cl:_tag(dE,"ScrollBarImageColor3","Surface2")
local dF=Instance.new"UIListLayout"dF.Padding=UDim.new(0,2)
dF.SortOrder=Enum.SortOrder.LayoutOrder dF.Parent=dE
dz={ov=dA,card=dB,box=dC,list=dE,open=false,sel=1,rows={}}
dx._palette=dz
local function fuzzy(dG,dH)
dG,dH=string.lower(dG),string.lower(dH)
if dG==""then return 0 end
local dI,dJ,dK=1,0,0
for dL=1,#dH do
if string.sub(dH,dL,dL)==string.sub(dG,dI,dI)then
dJ+=(dK==dL-1)and 2 or 1
dK,dI=dL,dI+1
if dI>#dG then return dJ-dL*0.01 end
end
end
return nil
end
local function run(dG)
if not dG then return end
dz.ov.Visible,dz.open=false,false
ck.close(dz._closeLayer)
cn(dz.ov,cm.Fast,{BackgroundTransparency=1})
if dG.go then pcall(dG.go)end
end
dz._run=run
local function render()
for dG,dH in ipairs(dz.rows)do pcall(function()dH.frame:Destroy()end)end
dz.rows={}
local dG=dC.Text
local dH={}
for dI,dJ in ipairs(dx._tabs)do
local dK=fuzzy(dG,dJ.Title)
if dK then table.insert(dH,{label=dJ.Title,hint="tab",score=dK+100,
go=function()dx._activateTab(dJ,true)end})end
for dL,dM in ipairs(dJ.Elements)do
if dM.Title and dM.Frame then
local dN=fuzzy(dG,dJ.Title.." "..dM.Title)
if dN then table.insert(dH,{label=dM.Title,hint=dJ.Title,score=dN,
go=dM._go})end
end
end
end
table.sort(dH,function(dI,dJ)return dI.score>dJ.score end)
dz.sel=math.clamp(dz.sel,1,math.max(1,math.min(12,#dH)))
if#dH==0 then
local dI=Instance.new"TextLabel"dI.BackgroundTransparency=1
dI.Size=UDim2.new(1,0,0,30)dI.Font=Enum.Font.Gotham
dI.TextSize=12 dI.Text="No results"dI.Parent=dE
cl:_tag(dI,"TextColor3","Dim")
dz.rows={{frame=dI}}
return
end
for dI=1,math.min(12,#dH)do
local dJ=dH[dI]
local dK=Instance.new"TextButton"dK.Text=""
dK.Size=UDim2.new(1,-4,0,32)dK.BorderSizePixel=0
dK.BackgroundColor3=cH.Surface2
dK.BackgroundTransparency=(dI==dz.sel)and 0.35 or 1
cp(dK,7)dK.Parent=dE
cl:_tag(dK,"BackgroundColor3","Surface2")
local dL=Instance.new"TextLabel"dL.BackgroundTransparency=1
dL.Position=UDim2.new(0,10,0,0)dL.Size=UDim2.new(1,-90,1,0)
dL.Font=Enum.Font.Gotham dL.TextSize=13 dL.TextXAlignment=0
dL.TextTruncate=Enum.TextTruncate.AtEnd dL.Text=dJ.label dL.Parent=dK
cl:_tag(dL,"TextColor3","Text")
local dM=Instance.new"TextLabel"dM.BackgroundTransparency=1
dM.AnchorPoint=Vector2.new(1,0)dM.Position=UDim2.new(1,-10,0,0)
dM.Size=UDim2.new(0,70,1,0)dM.Font=Enum.Font.Gotham
dM.TextSize=10 dM.TextXAlignment=1 dL.TextTruncate=Enum.TextTruncate.AtEnd
dM.Text=dJ.hint dM.Parent=dK
cl:_tag(dM,"TextColor3","Dim")
local dN=dI
dK.MouseButton1Click:Connect(function()run(dJ)end)
dK.MouseEnter:Connect(function()
dz.sel=dN render()
end)
table.insert(dz.rows,{frame=dK,item=dJ})
end
end
dz._render=render
dC:GetPropertyChangedSignal"Text":Connect(function()dz.sel=1 render()end)
dA.MouseButton1Click:Connect(function()
if dz.open then dx:TogglePalette(false)end
end)
dx:Track(cz.InputBegan:Connect(function(dG,dH)
if not dz.open then return end
if dG.KeyCode==Enum.KeyCode.Escape then dx:TogglePalette(false)
elseif dG.KeyCode==Enum.KeyCode.Return or dG.KeyCode==Enum.KeyCode.KeypadEnter then
local dI=dz.rows[dz.sel]
run(dI and dI.item)
elseif dG.KeyCode==Enum.KeyCode.Up then
dz.sel=math.max(1,dz.sel-1)render()
elseif dG.KeyCode==Enum.KeyCode.Down then
dz.sel=math.min(#dz.rows,dz.sel+1)render()
end
end))
dz._closeLayer=function()
if dz.open then dx:TogglePalette(false)end
end
end
local dA=(dy~=nil)and dy or(not dz.open)
dz.open=dA
dz.ov.Visible=dA
if dA then
ck.open(dz._closeLayer)
cl:_sfx"Open"
flyTo(dz.ov,{BackgroundTransparency=0.45})
dz.card.Position=UDim2.new(0.5,0,0,78)
flyTo(dz.card,{Position=UDim2.new(0.5,0,0,90)})
dz.box.Text,dz.sel="",1
dz._render()
task.defer(function()pcall(function()dz.box:CaptureFocus()end)end)
else
ck.close(dz._closeLayer)
flyTo(dz.ov,{BackgroundTransparency=1},cm.Fast,function()
if not dz.open then dz.ov.Visible=false end
end)
end
end

function dh.SetTheme(dx,dy)cl:SetTheme(dy)end

function cl.SetAccent(dx,dy)
if typeof(dy)~="Color3"then return end
dx.Themes[dx.ThemeName].Accent=dy
dx:SetTheme(dx.ThemeName)
end


cl.FontPacks={
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
cl.FontPack="Gotham+"
cl._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function cl._resolveFont(dx,dy)
local dz,dA=pcall(function()return Enum.Font[dy]end)
if dz and dA then return dA end
return nil
end
function cl._paintFonts(dx,dy)
local dz=dx.FontPacks[dx.FontPack]
if not dz then return end
for dA,dB in ipairs(dy:GetDescendants())do
if dB:IsA"TextLabel"or dB:IsA"TextButton"or dB:IsA"TextBox"then
local dC=dB:GetAttribute"KronosFontRole"
if not dC then
dC=dx._roleFromDefault[dB.Font]or"Body"
dB:SetAttribute("KronosFontRole",dC)
dB:SetAttribute("KronosBaseSize",dB.TextSize)
end
local dD=dB:GetAttribute"KronosBaseSize"or dB.TextSize
local dE=(dz.Bump and dz.Bump[dC])or 0
local dF=dz[dC]and dx:_resolveFont(dz[dC])or nil
pcall(function()
if dF then dB.Font=dF end
dB.TextSize=math.clamp(dD+dE,8,30)
end)
end
end
end
function cl.SetFontPack(dx,dy)
if not dx.FontPacks[dy]then return end
dx.FontPack=dy
if dx._gui then dx:_paintFonts(dx._gui)end
end
function cl.RefreshFonts(dx)
if dx._gui then dx:_paintFonts(dx._gui)end
end
function dh.SetAccent(dx,dy)cl:SetAccent(dy)end
function dh.SetScale(dx,dy)
cP=math.clamp(tonumber(dy)or 1,0.7,1.25)
cQ.Scale=baseScale()
end
function dh.SetCompact(dx,dy)
dy=dy and true or false
if dy then

if not dx._preCompactSize then
pcall(function()dx._preCompactSize=cN.Size end)
end
cn(cN,cm.Med,{Size=UDim2.fromOffset(560,400)})
else
local dz=dx._preCompactSize
or(dx._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))
dx._preCompactSize=nil
cn(cN,cm.Med,{Size=dz})
end
for dz,dA in ipairs(dx._tabs)do
if dA._pl then dA._pl.Padding=dy and UDim.new(0,4)or UDim.new(0,8)end
end
end
function dh.ToggleAcrylic(dx,dy)
cl:ToggleAcrylic(dy)
cN.BackgroundTransparency=(dy and not cl._transparent)and 0.08 or 0
dc.BackgroundTransparency=(dy and not cl._transparent)and 0.15 or 0
end
function dh.ToggleTransparency(dx,dy)
cl._transparent=dy and true or false
local dz=(cl._acrylicOn and not dy)and 0.08 or(dy and 0.25 or 0)
cN.BackgroundTransparency=dz
dc.BackgroundTransparency=dy and 0.4 or((cl._acrylicOn and not dy)and 0.15 or 0)
end


function dh.SetBackdrop(dx,dy)
dy=dy and true or false
cM=dy
dx._backdrop=dy
if dy then
if dx._visible and not dx._mini then
cL.Visible=true
cn(cL,cm.Med,{BackgroundTransparency=0.5})
end
else
cn(cL,cm.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
if not cM then cL.Visible=false end
end)
end
end




local dx=Instance.new"TextButton"
dx.Name=ad.GetStealthName()
dx.Text=""dx.AutoButtonColor=false
dx.Size=UDim2.fromScale(1,1)
dx.BackgroundColor3=Color3.fromRGB(0,0,0)
dx.BackgroundTransparency=1 dx.BorderSizePixel=0
dx.Visible=false dx.Parent=da
cp(dx,10)
local function slideCloseAll()
if dh._inboxPanel and dh._inboxPanel.open then dh:ToggleInbox(false)end
if dh._kbPanel and dh._kbPanel.open then dh:ToggleKeybindList(false)end
end
dx.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(dy)
if dy then
ck.open(slideCloseAll)
dx.Visible=true
cn(dx,cm.Med,{BackgroundTransparency=0.5})
else
ck.close(slideCloseAll)
cn(dx,cm.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local dz=dh._inboxPanel and dh._inboxPanel.open
local dA=dh._kbPanel and dh._kbPanel.open
if not dz and not dA then dx.Visible=false end
end)
end
end


function dh.ToggleInbox(dy,dz)
local dA=dy._inboxPanel
if not dA then
local dB=Instance.new"Frame"dB.AnchorPoint=Vector2.new(1,0)
dB.Position=UDim2.new(1,12,0,0)dB.Size=UDim2.new(0,230,1,0)
dB.BackgroundColor3=cH.Bg dB.BorderSizePixel=0
cp(dB,10)dB.Parent=da dB.Visible=false
cq(dB,true)
cl:_tag(dB,"BackgroundColor3","Bg")
local dC=Instance.new"TextLabel"dC.BackgroundTransparency=1
dC.Position=UDim2.new(0,12,0,10)dC.Size=UDim2.new(1,-70,0,18)
dC.Font=Enum.Font.GothamBold dC.TextSize=11 dC.TextXAlignment=0
dC.Text="INBOX"dC.Parent=dB
cl:_tag(dC,"TextColor3","Dim")
local dD=Instance.new"TextButton"dD.Text=""
dD.AnchorPoint=Vector2.new(1,0)dD.Position=UDim2.new(1,-10,0,10)
dD.Size=UDim2.new(0,52,0,18)dD.BackgroundColor3=cH.Surface2
dD.BorderSizePixel=0 cp(dD,6)dD.AutoButtonColor=false dD.Parent=dB
cq(dD,true)
cl:_tag(dD,"BackgroundColor3","Surface2")
local dE=Instance.new"TextLabel"dE.BackgroundTransparency=1
dE.Size=UDim2.fromScale(1,1)dE.Font=Enum.Font.GothamBold
dE.TextSize=10 dE.Text="CLEAR"dE.Parent=dD
cl:_tag(dE,"TextColor3","Dim")
local dF=Instance.new"ScrollingFrame"
dF.Position=UDim2.new(0,8,0,34)dF.Size=UDim2.new(1,-16,1,-42)
dF.BackgroundTransparency=1 dF.BorderSizePixel=0
dF.ScrollBarThickness=2 dF.CanvasSize=UDim2.new(0,0,0,0)
dF.AutomaticCanvasSize=Enum.AutomaticSize.Y dF.Parent=dB
cl:_tag(dF,"ScrollBarImageColor3","Surface2")
local dG=Instance.new"UIListLayout"dG.Padding=UDim.new(0,4)
dG.SortOrder=Enum.SortOrder.LayoutOrder dG.Parent=dF
dA={panel=dB,list=dF,open=false}
dy._inboxPanel=dA
local function refresh()
for dH,dI in ipairs(dF:GetChildren())do


if dI:IsA"Frame"or dI:IsA"TextLabel"then pcall(function()dI:Destroy()end)end
end
if#cl._inbox==0 then
local dH=Instance.new"TextLabel"dH.BackgroundTransparency=1
dH.Size=UDim2.new(1,0,0,24)dH.Font=Enum.Font.Gotham
dH.TextSize=11 dH.Text="All caught up."dH.Parent=dF
cl:_tag(dH,"TextColor3","Dim")
return
end
for dH,dI in ipairs(cl._inbox)do
local dJ=Instance.new"Frame"
dJ.Size=UDim2.new(1,-2,0,44)dJ.BackgroundColor3=cH.Surface2
dJ.BackgroundTransparency=0.35 dJ.BorderSizePixel=0
cp(dJ,7)dJ.Parent=dF
cl:_tag(dJ,"BackgroundColor3","Surface2")
local dK=Instance.new"TextLabel"dK.BackgroundTransparency=1
dK.Position=UDim2.new(0,8,0,4)dK.Size=UDim2.new(1,-52,0,15)
dK.Font=Enum.Font.GothamBold dK.TextSize=11 dK.TextXAlignment=0
dK.TextTruncate=Enum.TextTruncate.AtEnd dK.Text=dI.Title dK.Parent=dJ
cl:_tag(dK,"TextColor3","Text")
local dL=Instance.new"TextLabel"dL.BackgroundTransparency=1
dL.Position=UDim2.new(0,8,0,20)dL.Size=UDim2.new(1,-52,0,18)
dL.Font=Enum.Font.Gotham dL.TextSize=11 dL.TextXAlignment=0
dL.TextTruncate=Enum.TextTruncate.AtEnd dL.Text=dI.Content dL.Parent=dJ
cl:_tag(dL,"TextColor3","Dim")
local dM=Instance.new"TextLabel"dM.BackgroundTransparency=1
dM.AnchorPoint=Vector2.new(1,0)dM.Position=UDim2.new(1,-8,0,4)
dM.Size=UDim2.new(0,40,0,14)dM.Font=Enum.Font.Code
dM.TextSize=10 dM.TextXAlignment=1 dM.Text=dI.At dM.Parent=dJ
cl:_tag(dM,"TextColor3","Dim")
end
end
dA.refresh=refresh
dD.MouseButton1Click:Connect(function()
cl._inbox={}
refresh()
pcall(function()c9.Visible=false end)
end)
end
local dB=(dz~=nil)and dz or(not dA.open)
dA.open=dB
if dB then
if dy._kbPanel and dy._kbPanel.open then dy:ToggleKeybindList(false)end
slideShadeSet(true)
dA.refresh()
dA.panel.Visible=true
pcall(function()c9.Visible=false end)
flyTo(dA.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(dA.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not dA.open then dA.panel.Visible=false end
end)
slideShadeSet(dy._kbPanel~=nil and dy._kbPanel.open==true)
end
end


function dh.ToggleKeybindList(dy,dz)
local dA=dy._kbPanel
if not dA then
local dB=Instance.new"Frame"dB.AnchorPoint=Vector2.new(1,0)
dB.Position=UDim2.new(1,12,0,0)dB.Size=UDim2.new(0,210,1,0)
dB.BackgroundColor3=cH.Bg dB.BorderSizePixel=0
cp(dB,10)dB.Parent=da dB.Visible=false
cq(dB,true)
cl:_tag(dB,"BackgroundColor3","Bg")
local dC=Instance.new"TextLabel"dC.BackgroundTransparency=1
dC.Position=UDim2.new(0,12,0,10)dC.Size=UDim2.new(1,-24,0,18)
dC.Font=Enum.Font.GothamBold dC.TextSize=11 dC.TextXAlignment=0
dC.Text="KEYBINDS"dC.Parent=dB
cl:_tag(dC,"TextColor3","Dim")
local dD=Instance.new"ScrollingFrame"
dD.Position=UDim2.new(0,8,0,34)dD.Size=UDim2.new(1,-16,1,-42)
dD.BackgroundTransparency=1 dD.BorderSizePixel=0
dD.ScrollBarThickness=2 dD.CanvasSize=UDim2.new(0,0,0,0)
dD.AutomaticCanvasSize=Enum.AutomaticSize.Y dD.Parent=dB
cl:_tag(dD,"ScrollBarImageColor3","Surface2")
local dE=Instance.new"UIListLayout"dE.Padding=UDim.new(0,4)
dE.SortOrder=Enum.SortOrder.LayoutOrder dE.Parent=dD
dA={panel=dB,list=dD,open=false}
dy._kbPanel=dA
local function refresh()
for dF,dG in ipairs(dD:GetChildren())do
if dG:IsA"TextButton"then pcall(function()dG:Destroy()end)end
end
if#dy._keybinds==0 then
local dF=Instance.new"TextLabel"dF.BackgroundTransparency=1
dF.Size=UDim2.new(1,0,0,24)dF.Font=Enum.Font.Gotham
dF.TextSize=11 dF.Text="No keybinds yet"dF.Parent=dD
cl:_tag(dF,"TextColor3","Dim")
return
end
for dF,dG in ipairs(dy._keybinds)do
local dH=Instance.new"TextButton"dH.Text=""
dH.Size=UDim2.new(1,-2,0,30)dH.BackgroundColor3=cH.Surface2
dH.BackgroundTransparency=0.35 dH.BorderSizePixel=0
cp(dH,7)dH.Parent=dD
cl:_tag(dH,"BackgroundColor3","Surface2")
local dI=Instance.new"TextLabel"dI.BackgroundTransparency=1
dI.Position=UDim2.new(0,8,0,0)dI.Size=UDim2.new(1,-70,1,0)
dI.Font=Enum.Font.Gotham dI.TextSize=11 dI.TextXAlignment=0
dI.TextTruncate=Enum.TextTruncate.AtEnd dI.Text=dG.Title dI.Parent=dH
cl:_tag(dI,"TextColor3","Text")
local dJ=Instance.new"TextLabel"dJ.BackgroundTransparency=1
dJ.AnchorPoint=Vector2.new(1,0)dJ.Position=UDim2.new(1,-8,0,0)
dJ.Size=UDim2.new(0,56,1,0)dJ.Font=Enum.Font.Code
dJ.TextSize=10 dJ.TextXAlignment=1 dJ.Text=dG.GetName()dJ.Parent=dH
cl:_tag(dJ,"TextColor3","Dim")
dH.MouseButton1Click:Connect(function()
cl:_sfx"Click"dG.Rebind()
task.delay(0.2,function()pcall(function()dJ.Text=dG.GetName()end)end)
end)
end
end
dA.refresh=refresh
dy._kbPanelRefresh=refresh
end
local dB=(dz~=nil)and dz or(not dA.open)
dA.open=dB
if dB then
if dy._inboxPanel and dy._inboxPanel.open then dy:ToggleInbox(false)end
slideShadeSet(true)
dA.refresh()
dA.panel.Visible=true
flyTo(dA.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(dA.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not dA.open then dA.panel.Visible=false end
end)
slideShadeSet(dy._inboxPanel~=nil and dy._inboxPanel.open==true)
end
end


function dh.Onboarding(dy,dz)
dz=dz or{}
local dA=dz.Steps or dz.Pages or{{Title="Welcome",Content="This is Kronos."}}
local dB=1
local dC=Instance.new"TextButton"dC.Text=""dC.AutoButtonColor=false
dC.Size=UDim2.fromScale(1,1)dC.BackgroundColor3=Color3.fromRGB(0,0,0)
dC.BackgroundTransparency=1 dC.ZIndex=180 dC.Parent=cJ
cn(dC,cm.Med,{BackgroundTransparency=0.6})
local dD=Instance.new"CanvasGroup"dD.AnchorPoint=Vector2.new(0.5,0.5)
dD.Position=UDim2.new(0.5,0,0.5,0)dD.Size=UDim2.fromOffset(340,220)
dD.BackgroundColor3=cH.Surface dD.BorderSizePixel=0 dD.GroupTransparency=1
cp(dD,12)dD.Parent=dC
cq(dD,true)
ct(dD,12)
cw(dD,0.5,40)
cl:_tag(dD,"BackgroundColor3","Surface")
local dE=Instance.new"UIScale"dE.Scale=0.94 dE.Parent=dD
cn(dD,cm.Med,{GroupTransparency=0})
cn(dE,cm.Spring,{Scale=1})
local dF=Instance.new"TextLabel"dF.BackgroundTransparency=1
dF.Position=UDim2.new(0,20,0,18)dF.Size=UDim2.new(1,-40,0,24)
dF.Font=Enum.Font.GothamBold dF.TextSize=17 dF.TextXAlignment=0 dF.Parent=dD
cl:_tag(dF,"TextColor3","Text")
local dG=Instance.new"TextLabel"dG.BackgroundTransparency=1
dG.Position=UDim2.new(0,20,0,48)dG.Size=UDim2.new(1,-40,0,90)
dG.Font=Enum.Font.Gotham dG.TextSize=13 dF.TextXAlignment=0
dG.TextXAlignment=0 dG.TextYAlignment=0 dG.TextWrapped=true dG.Parent=dD
cl:_tag(dG,"TextColor3","Dim")
local dH=Instance.new"Frame"dH.BackgroundTransparency=1
dH.AnchorPoint=Vector2.new(0,1)dH.Position=UDim2.new(0,20,1,-52)
dH.Size=UDim2.new(0,120,0,10)dH.Parent=dD
local dI=Instance.new"UIListLayout"dI.FillDirection=Enum.FillDirection.Horizontal
dI.Padding=UDim.new(0,6)dI.Parent=dH
local dJ={}
for dK=1,#dA do
local dL=Instance.new"Frame"dL.Size=UDim2.fromOffset(8,8)
dL.BorderSizePixel=0 cp(dL,99)dL.Parent=dH
cl:_tag(dL,"BackgroundColor3","Surface2")
dJ[dK]=dL
end
local dK,dL,dM
local function paint()
dF.Text,dG.Text=dA[dB].Title or"",dA[dB].Content or""
for dN,dO in ipairs(dJ)do
if dN==dB then cl:_tag(dO,"BackgroundColor3","Accent")
else cl:_tag(dO,"BackgroundColor3","Surface2")end
end
dK.Visible=dB>1
dM.Text=(dB==#dA)and"FINISH"or"NEXT"
dF.Position=UDim2.new(0,26,0,18)
cn(dF,cm.Fast,{Position=UDim2.new(0,20,0,18)})
end
local dN=Instance.new"Frame"dN.BackgroundTransparency=1
dN.AnchorPoint=Vector2.new(0,1)dN.Position=UDim2.new(0,0,1,-12)
dN.Size=UDim2.new(1,0,0,34)dN.Parent=dD
local dO=Instance.new"UIListLayout"dO.FillDirection=Enum.FillDirection.Horizontal
dO.HorizontalAlignment=Enum.HorizontalAlignment.Right dO.Padding=UDim.new(0,8)dO.Parent=dN
cs(dN,0,0,12,12)
dK=Instance.new"TextButton"dK.Text=""
dK.Size=UDim2.new(0,80,0,30)dK.BackgroundTransparency=1 dK.Parent=dN
local dP=Instance.new"TextLabel"dP.BackgroundTransparency=1
dP.Size=UDim2.fromScale(1,1)dP.Font=Enum.Font.GothamBold
dP.TextSize=12 dP.Text="BACK"dP.Parent=dK
cl:_tag(dP,"TextColor3","Dim")
local dQ=Instance.new"TextButton"dQ.Text=""
dQ.Size=UDim2.new(0,80,0,30)dQ.BackgroundTransparency=1 dQ.Parent=dN
local dR=Instance.new"TextLabel"dR.BackgroundTransparency=1
dR.Size=UDim2.fromScale(1,1)dR.Font=Enum.Font.Gotham
dR.TextSize=12 dR.Text="Skip"dR.Parent=dQ
cl:_tag(dR,"TextColor3","Dim")
dL=Instance.new"TextButton"dL.Text=""
dL.Size=UDim2.new(0,96,0,30)dL.BorderSizePixel=0
cp(dL,7)dL.AutoButtonColor=false dL.Parent=dN
cl:agrad(dL,15)
dM=Instance.new"TextLabel"dM.BackgroundTransparency=1
dM.Size=UDim2.fromScale(1,1)dM.Font=Enum.Font.GothamBold
dM.TextSize=12
dM.Text="NEXT"dM.Parent=dL
cl:oa(dM)
local function close()
cn(dD,cm.Fast,{GroupTransparency=1})
cn(dC,cm.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dC:Destroy()end)end)
co(dz.OnFinish)
end
dK.MouseButton1Click:Connect(function()
cl:_sfx"Click"dB=math.max(1,dB-1)paint()
end)
dQ.MouseButton1Click:Connect(function()close()end)
dL.MouseButton1Click:Connect(function()
cl:_sfx"Click"
if dB>=#dA then close()else dB+=1 paint()end
end)
paint()
end



function dh.Tab(dy,dz)
return b1({
Window=dh,opts=cC,Th=cH,pgui=cK,
pages=dg,nav=dd,pill=df,subLbl=cY,
},dz)
end


function dh.EspPreview(dy,dz)
return c({Window=dh,Th=cH,main=cN,gui=cJ},dz)
end

function dh.SaveConfig(dy,dz)
bT.Save(dy,dz)
end
function dh.LoadConfig(dy,dz)
bT.Load(dy,dz)
end

function dh.Destroy(dy)
if dy._destroyed then return end
dy._destroyed=true
local dz=dy._onCloseCb
dy._onCloseCb=nil
if type(dz)=="function"then task.spawn(function()pcall(dz)end)end
for dA,dB in ipairs(dy._conns)do pcall(function()dB:Disconnect()end)end
dy._conns={}
for dA,dB in pairs(cl.Sound._cache)do pcall(function()dB:Stop()dB:Destroy()end)end
cl.Sound._cache={}
cl:SetAcrylic(false)
if cl._gui==cJ then cl._gui=nil end
pcall(function()dk:Destroy()end)
pcall(function()cJ:Destroy()end)
pcall(function()cK:Destroy()end)
end

ad.registerUnload(function()
pcall(function()dh:Destroy()end)
end)
af.paintFonts(cJ)
return dh
end end function a.K():typeof(__modImpl())local aa=a.cache.K if not aa then aa={c=__modImpl()}a.cache.K=aa end return aa.c end end do local function __modImpl()




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
local c
local ck
local cl
c=ab:EspPreview{Title="Chams preview",
Accent=Color3.fromRGB(110,140,255),Mode="Chams",
OnClose=function()if ck then ck:Set(false,true)end end}
cl=b1:RigPreview{Title="Rig Preview",Mode="Chams"}
ck=b1:Toggle{Title="Show preview",Description="Pops out right, live rig",Value=false,
Callback=function(cm)c:SetVisible(cm)end}
b1:Toggle{Title="Box ESP",Value=true,Flag="BoxESP",
Callback=function(cm)c:SetBox(cm)cl:SetBox(cm)end}
b1:Colorpicker{Title="ESP Color",Value=Color3.fromRGB(110,140,255),Flag="ESPColor",
Callback=function(cm)c:SetAccent(cm)cl:SetAccent(cm)end}
b1:Dropdown{Title="Preview style",
Values={"Chams","Box","Outline","HP bar","Name","Ghost","Noob","Solid"},Value="Chams",
Callback=function(cm)c:SetMode(cm)cl:SetMode(cm)end}
b1:Slider{Title="Preview health",Min=0,Max=100,Step=1,Value=100,
Callback=function(cm)c:SetHealth(cm)cl:SetHealth(cm)end}
b1:Dropdown{Title="Chams",Values={"Enemies","Team","NPCs","Chests","Ores"},
Multi=true,Value={"Enemies"},Flag="Chams"}
local cm=ab:Tab{Title="Settings",Icon="settings"}
cm:Profile{Name="kronos_user",Tag="Premium | keyless"}
cm:Section"Interface"
cm:Dropdown{Title="Theme",
Values={"Kronos","Dark","Midnight","Light","Rose","Indigo","Forest","Amber","Ocean","Crimson","Ghost","Cyberpunk","Terminal","Discord","Mono"},
Value="Kronos",Callback=function(cn)ab:SetTheme(cn)end}
cm:Colorpicker{Title="Accent color",Description="Repaints every accent live",
Value=Color3.fromRGB(232,236,245),
Callback=function(cn)ab:SetAccent(cn)end}
cm:Dropdown{Title="Font",Description="Bigger, bolder, yours",
Values={"Gotham+","Gotham","Builder","Arimo","Source","Cartoon","Arcade","SciFi","Fantasy","Highway"},
Value="Gotham+",Callback=function(cn)aa:SetFontPack(cn)end}
cm:Slider{Title="UI scale",Min=70,Max=125,Step=5,Value=100,
Callback=function(cn)ab:SetScale(cn/100)end}
cm:Toggle{Title="Compact mode",Description="Smaller card, tighter lists",Value=false,
Callback=function(cn)ab:SetCompact(cn)end}
cm:Toggle{Title="Focus mode",Description="Hide sidebar, just content",Value=false,
Callback=function(cn)ab:SetFocus(cn)end}
cm:Toggle{Title="Acrylic",Description="Card glass",Value=true,
Callback=function(cn)ab:ToggleAcrylic(cn)end}
cm:Toggle{Title="Transparency",Description="Ghost mode",Value=false,
Callback=function(cn)ab:ToggleTransparency(cn)end}
cm:Toggle{Title="Background",Description="Dim + tint behind the hub",Value=true,
Callback=function(cn)ab:SetBackdrop(cn)end}
cm:Toggle{Title="UI Sounds",Description="Clicks, toggles, notifications",Value=true,
Callback=function(cn)aa.Sound.Enabled=cn end}
cm:Keybind{Title="Panic key",Value=Enum.KeyCode.F,
Callback=function()ab:SetVisible(false)end}
cm:Keybind{Title="Hide UI key",Description="Rebinds the hide hotkey",
Value=Enum.KeyCode.RightControl,
Callback=function(cn)ab:SetToggleKey(cn)end}
cm:Button{Title="Keybinds panel",Description="Slide-over, click a row to rebind",
Callback=function()ab:ToggleKeybindList()end}
cm:Button{Title="Command palette",Description="Same as Ctrl+K",
Callback=function()ab:TogglePalette(true)end}
cm:Section"Profiles"
cm:Profiles{Title="My profiles"}
ab:Notify{Title="Kronos loaded",Content="Ctrl+K palette | RightControl hide",Duration=5}
aa:RefreshFonts()
end)
end end function a.L():typeof(__modImpl())local aa=a.cache.L if not aa then aa={c=__modImpl()}a.cache.L=aa end return aa.c end end end





local aa=a.a()
local ab=a.b()a.c()a.d()


local ac=a.e()
local ad=a.f()
local ae=a.g()
local af=a.h()
local bT=a.i()
local b1=a.K()

ab.claimUnload()

local c=aa
c.Themes=af.Themes
c.Icons=ac.Icons
c.IconAlias=ac.IconAlias

c._tag=function(ck,cl,cm,cn)
return af.tag(cl,cm,cn)
end
c.agrad=function(ck,cl,cm)
return af.agrad(cl,cm)
end
c.oa=function(ck,cl)
return af.oa(cl)
end
c.SetTheme=function(ck,cl)
return af.SetTheme(cl)
end
c.SetAccent=function(ck,cl)
return af.SetAccent(cl)
end
c.SetAcrylic=function(ck,cl,cm)
return bT.SetAcrylic(cl,cm)
end
c.ToggleAcrylic=function(ck,cl)
return bT.ToggleAcrylic(cl)
end
c._sfx=function(ck,cl)
return ad.sfx(cl)
end
c.SetFontPack=function(ck,cl)
return ae.SetFontPack(cl)
end
c.RefreshFonts=function(ck)
return ae.RefreshFonts()
end
c._paintFonts=function(ck,cl)
return ae.paintFonts(cl)
end

c.CreateWindow=b1


local ck=a.L()
ck(c)

return c
