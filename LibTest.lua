--[[
   _  _______   ____  _   _  ____   _____ 
  | |/ /  __ \ / __ \| \ | |/ __ \ / ____|
  | ' /| |__) | |  | |  \| | |  | | (___  
  |  < |  _  /| |  | | . ` | |  | |\___ \ 
  | . \| | \ \| |__| | |\  | |__| |____) |
  |_|\_\_|  \_\\____/|_| \_|\____/|_____/ 
                                         
  PROPRIETARY AND CONFIDENTIAL
  ==============================================================
  This user interface framework is the exclusive intellectual 
  property of Kronos. Unauthorized distribution, reproduction, 
  or use outside of official Kronos software is strictly 
  prohibited and subject to immediate DMCA action.
]]


local a={cache={}::any}do do local function __modImpl()
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
local c=a.b()

local d=c.cloneref_check(game:GetService"Lighting")

local function SetAcrylic(e,f)
f=f or 16
b._acrylicOn=e and true or false
if e then
if not b._blur then
local g,h=pcall(function()
local g=Instance.new"BlurEffect"
g.Name=c.GetStealthName()
g.Size=f
g.Parent=d
return g
end)
if g and h then b._blur=h end
else
pcall(function()b._blur.Size=f end)
end
else
if b._blur then
pcall(function()b._blur:Destroy()end)
b._blur=nil
end
end
end

local function ToggleAcrylic(e)
SetAcrylic(e)
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
if type(s)=="string"then s={Title=s}end s=s or{}
local A=s.Open
if A==nil then A=s.DefaultOpen~=false end
local B=Instance.new"Frame"B.BackgroundTransparency=1
B.Size=UDim2.new(1,-4,0,22)B.Parent=page
local C=Instance.new"TextLabel"C.BackgroundTransparency=1
C.Position=UDim2.new(0,0,0,0)C.Size=UDim2.new(1,-22,1,0)
C.Font=Enum.Font.GothamBold C.TextSize=10
C.TextXAlignment=0 C.Text="  "..string.upper(s.Title or"SECTION")C.Parent=B
g:_tag(C,"TextColor3","Dim")
local D={}
local E
local F
local function apply()
local G=A
for H,I in ipairs(w.Elements)do
if H>E then
if I._break then break end
if I.Frame and I.Frame.Parent==page then
I.Frame.Visible=G and(I._searchVisible~=false)
end
end
end
if F and F:IsA"GuiObject"then
i(F,h.Fast,{Rotation=G and 0 or-90})
end
end
function D.Set(G,H)A=H and true or false apply()end
function D.Get(G)return A end
function D.Toggle(G)D:Set(not A)end
F=nil
if s.Collapsible~=false then
local G=Instance.new"TextButton"G.Text=""
G.Size=UDim2.fromScale(1,1)G.BackgroundTransparency=1 G.Parent=B
F=q("chevron",13,y.Dim)
F.AnchorPoint=Vector2.new(1,0.5)F.Position=UDim2.new(1,-2,0.5,0)
F.Parent=B
G.MouseButton1Click:Connect(function()
g:_sfx"Click"D:Toggle()
end)
else
F=nil
end
local G={Title=s.Title,Frame=B,_handle=D,_break=true}
v(G)
E=#w.Elements
G._refreshSection=apply
if not A then apply()end
return D
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
end
aM.Position=S and UDim2.new(1,-aJ-3,0.5,0)or UDim2.new(0,3,0.5,0)
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
aH=aH or{}
local aP=aH.Min or(aH.Range and aH.Range[1])or 0
local aQ=aH.Max or(aH.Range and aH.Range[2])or 100
local aR=aH.Step or aH.Increment or 1
local aS=aH.Rounding or(aR%1~=0 and 2 or 0)
local aT=aH.Value~=nil and aH.Value or(aH.Default or aP)
local function fmt(aU)return aS>0 and string.format("%."..aS.."f",aU)or tostring(math.round(aU))end
local aU=aI(aH.Description and 66 or 56)
aJ(aU,aH.Title or"Slider",aH.Description,90,true)
local aV=Instance.new"TextBox"aV.Text=fmt(aT)
aV.Font=Enum.Font.GothamBold aV.TextSize=11
aV.AnchorPoint=Vector2.new(1,0)aV.Position=UDim2.new(1,-12,0,6)
aV.Size=UDim2.new(0,60,0,22)aV.BackgroundColor3=aN.Surface2
aV.BorderSizePixel=0 at(aV,6)
af:_tag(aV,"BackgroundColor3","Surface2")
af:_tag(aV,"TextColor3","Text")
aw(aV,true)
aV.ClearTextOnFocus=false aV.Parent=aU
local c=Instance.new"TextButton"c.Text=""c.AutoButtonColor=false
c.Position=UDim2.new(0,12,0,aH.Description and 48 or 36)c.Size=UDim2.new(1,-24,0,6)
c.BackgroundColor3=aN.Surface2 c.BorderSizePixel=0
at(c,99)c.Parent=aU
af:_tag(c,"BackgroundColor3","Surface2")
local f=Instance.new"Frame"f.BorderSizePixel=0
f.Size=UDim2.new(0,0,1,0)at(f,99)f.Parent=c
af:agrad(f,0)
local g=Instance.new"Frame"g.AnchorPoint=Vector2.new(0.5,0.5)
g.Size=UDim2.fromOffset(12,12)g.BackgroundColor3=Color3.fromRGB(255,255,255)
g.BorderSizePixel=0 at(g,99)g.Parent=c
local N=Instance.new"UIStroke"N.Thickness=1.5
N.Color=aN.Accent N.Transparency=0.35 N.Parent=g
af:_tag(N,"Color","Accent")

local S=Instance.new"TextLabel"S.Visible=false
S.AnchorPoint=Vector2.new(0.5,1)S.Size=UDim2.fromOffset(44,20)
S.BackgroundColor3=aN.Surface2 S.BorderSizePixel=0
S.Font=Enum.Font.GothamBold S.TextSize=11 at(S,6)S.Parent=aU
af:_tag(S,"BackgroundColor3","Surface2")
af:_tag(S,"TextColor3","Text")
aw(S,true)
local _=ar()
local aW,aX,aY,aZ=false,false
local function alpha(a_)return math.clamp((a_-aP)/math.max(1e-6,aQ-aP),0,1)end
local function render(a_)
local a0=alpha(aT)
an(f,a_ and am.Fill08 or TweenInfo.new(0),{Size=UDim2.new(a0,0,1,0)})
g.Position=UDim2.new(a0,0,0.5,0)
local a1=c.AbsoluteSize.X
S.Position=UDim2.new(0,12+a0*(a1>0 and a1 or 200),0,aH.Description and 46 or 34)
S.Text=fmt(aT)
if aV:IsFocused()==false then aV.Text=fmt(aT)end
end
local a_={}
function a_.Set(a0,a1,a2)
a1=math.clamp(tonumber(a1)or aT,aP,aQ)
a1=math.round(a1/aR)*aR
if aS>0 then a1=tonumber(string.format("%."..aS.."f",a1))end
aT=a1 render(true)
if aH.Flag then af.Flags[aH.Flag]=aT end
if not a2 then as(aH.Callback,aT)as(aH.OnChanged,aT)end
end
function a_.Get(a0)return aT end
function a_.SetMax(a0,a1)aQ=a1 a_:Set(aT,true)end
function a_.SetMin(a0,a1)aP=a1 a_:Set(aT,true)end
render(false)
aV.FocusLost:Connect(function()
local a0=tonumber(aV.Text)
if a0 then a_:Set(a0)else aV.Text=fmt(aT)end
end)
c.InputBegan:Connect(function(a0)
if aH.Locked then return end
if a0.UserInputType~=Enum.UserInputType.MouseButton1 and a0.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=_ then return end
af.CurrentInput,aW,aX=_,true,a0.UserInputType==Enum.UserInputType.Touch
page.ScrollingEnabled=false
S.Visible=true
an(g,am.Hover,{Size=UDim2.fromOffset(16,16)})
local function fromX(a1)
local a2=math.clamp((a1-c.AbsolutePosition.X)/math.max(1,c.AbsoluteSize.X),0,1)
a_:Set(aP+a2*(aQ-aP))
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
page.ScrollingEnabled=true
S.Visible=false
an(g,am.Hover,{Size=UDim2.fromOffset(12,12)})
as(aH.OnRelease,aT)
end
end)
end)
local a0={Title=aH.Title,Frame=aU,Value=aT,Flag=aH.Flag,_handle=a_,
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




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween local as=
ac.guid
local at=ac.spawnCb
local aw=ac.corner
local aD=ac.hairline local aG=
ac.pad local aH=
ac.lighting local aI=
ac.ripple
local aJ=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(aK,aL)
local aP=aK.row
local aQ=aK.titleBlock
local aR=aK.reg local aS=
aK.tab local aT=
aK.Window
local aU=aK.Th local aV=
aK.opts or{}
aL=aL or{}
local aW=aL.Values or aL.Options or{}
local aX=aL.Multi or aL.MultipleOptions or false
local aY=aL.Value or aL.Default or aL.CurrentOption
if not aX and type(aY)=="table"then aY=aY[1]end
if aX and type(aY)~="table"then aY=aY and{aY}or{}end
local aZ=aP(aL.Description and 50 or 40)aZ.ClipsDescendants=false
aQ(aZ,aL.Title or"Dropdown",nil,200)
local a_=Instance.new"TextButton"a_.Text=""
a_.AnchorPoint=Vector2.new(1,0.5)a_.Position=UDim2.new(1,-12,0.5,0)
a_.Size=UDim2.new(0,170,0,28)a_.BackgroundColor3=aU.Surface2
a_.BorderSizePixel=0 aw(a_,7)a_.AutoButtonColor=false a_.Parent=aZ
aD(a_,true)
af:_tag(a_,"BackgroundColor3","Surface2")
local a0=Instance.new"TextLabel"a0.BackgroundTransparency=1
a0.Position=UDim2.new(0,8,0,0)a0.Size=UDim2.new(1,-28,1,0)
a0.Font=Enum.Font.Gotham a0.TextSize=12 a0.TextXAlignment=0
a0.TextTruncate=Enum.TextTruncate.AtEnd a0.Parent=a_
af:_tag(a0,"TextColor3","Text")
local a1=aJ("chevron",13,aU.Dim)
a1.AnchorPoint=Vector2.new(1,0.5)a1.Position=UDim2.new(1,-8,0.5,0)
a1.Parent=a_
local function curText()
if aX then return(#aY==0 and"None"or table.concat(aY,", "))end
return tostring(aY or"Select...")
end
a0.Text=curText()
local a2,c,f,g=false
local N={}
function N.Set(S,_,a3)
aY=_
if not aX and type(aY)=="table"then aY=aY[1]end
a0.Text=curText()
if aL.Flag then af.Flags[aL.Flag]=aY end
if not a3 then at(aL.Callback,aY)at(aL.OnChanged,aY)end
end
function N.Get(a3)return aY end
function N.Refresh(a3,S)aW=S or{}
if g then pcall(function()g:Destroy()end)g=nil a2=false end end
local function buildList(a3)
if g then pcall(function()g:Destroy()end)end
g=Instance.new"Frame"g.Position=UDim2.new(1,-182,0,46)
g.Size=UDim2.new(0,170,0,0)g.BackgroundColor3=aU.Bg
g.BorderSizePixel=0 aw(g,8)g.Parent=aZ g.ZIndex=60
aD(g,true)
af:_tag(g,"BackgroundColor3","Bg")
f=Instance.new"TextBox"f.PlaceholderText="Filter..."
f.PlaceholderColor3=aU.Dim f.Text=a3 or""
f.Font=Enum.Font.Gotham f.TextSize=11
f.Size=UDim2.new(1,-8,0,24)f.Position=UDim2.new(0,4,0,4)
f.BackgroundColor3=aU.Surface2 f.BorderSizePixel=0
aw(f,6)f.Parent=g f.ZIndex=61
af:_tag(f,"BackgroundColor3","Surface2")
af:_tag(f,"TextColor3","Text")
local S,_={},32
for a4,a5 in ipairs(aW)do
local a6=tostring(a5)
if(a3 or"")==""or string.find(string.lower(a6),string.lower(a3),1,true)then
table.insert(S,a6)
end
end
for a4,a5 in ipairs(S)do
local a6=Instance.new"TextButton"a6.Text=""
a6.Size=UDim2.new(1,-8,0,26)a6.Position=UDim2.new(0,4,0,_)
a6.BackgroundColor3=aU.Surface2 a6.BackgroundTransparency=1
a6.BorderSizePixel=0 aw(a6,6)a6.Parent=g a6.ZIndex=61
local a7=Instance.new"TextLabel"a7.BackgroundTransparency=1
a7.Position=UDim2.new(0,8,0,0)a7.Size=UDim2.new(1,-16,1,0)
a7.Font=Enum.Font.Gotham a7.TextSize=12 a7.TextXAlignment=0 a7.Text=a5 a7.Parent=a6
af:_tag(a7,"TextColor3","Text")
local a8=aX and table.find(aY,a5)or aY==a5
if a8 then af:_tag(a6,"BackgroundColor3","Surface2")a6.BackgroundTransparency=0.4 end
a6.MouseEnter:Connect(function()a6.BackgroundTransparency=0.4 af:_tag(a6,"BackgroundColor3","Surface2")end)
a6.MouseLeave:Connect(function()if not(aX and table.find(aY,a5)or aY==a5)then a6.BackgroundTransparency=1 end end)
a6.MouseButton1Click:Connect(function()
if aX then
local a9=table.find(aY,a5)
if a9 then table.remove(aY,a9)else table.insert(aY,a5)end
N:Set(aY)
buildList(f.Text)
else
N:Set(a5)
a2=false
an(a1,am.Fast,{Rotation=0})
if g then pcall(function()g:Destroy()end)g,c=nil,nil end
end
end)
_+=28
end
local a4=math.clamp(_+4,40,190)
an(g,am.Med,{Size=UDim2.new(0,170,0,a4)})
f:GetPropertyChangedSignal"Text":Connect(function()
if a2 then buildList(f.Text)end
end)
end
a_.MouseButton1Click:Connect(function()
a2=not a2
an(a1,am.Fast,{Rotation=a2 and 180 or 0})
if a2 then buildList""
else if g then pcall(function()g:Destroy()end)g,c=nil,nil end end
end)
local a3={Title=aL.Title,Frame=aZ,Value=aY,Flag=aL.Flag,_handle=N,
_set=function(a3,a4)N:Set(a3,a4)end}
return aR(a3)
end end function a.t():typeof(__modImpl())local aa=a.cache.t if not aa then aa={c=__modImpl()}a.cache.t=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local am=
ab.T local an=
ab.tween local at=
ac.guid
local aw=ac.spawnCb
local aD=ac.corner
local aI=ac.hairline local aJ=
ac.pad local aK=
ac.lighting local aL=
ac.ripple local aP=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local aQ=ae.cloneref_check(game:GetService"UserInputService")

return function(aR,aU)
local aV=aR.row
local aW=aR.titleBlock
local aX=aR.reg
local aY=aR.tab local aZ=
aR.Window
local a_=aR.Th local a0=
aR.opts or{}
aU=aU or{}
local a1=aU.Mode or"Toggle"
local a2=aU.Value or aU.Default or Enum.KeyCode.F
if type(a2)=="string"then a2=Enum.KeyCode[a2]or Enum.KeyCode.F end
local a3=aV(aU.Description and 54 or 40)
aW(a3,aU.Title or"Keybind",aU.Description,130)
local a4=Instance.new"TextButton"a4.Font=Enum.Font.GothamBold a4.TextSize=11
a4.AnchorPoint=Vector2.new(1,0.5)a4.Position=UDim2.new(1,-12,0.5,0)
a4.Size=UDim2.new(0,92,0,28)a4.BackgroundColor3=a_.Surface2
a4.BorderSizePixel=0 aD(a4,7)a4.Text=a2.Name a4.Parent=a3
aI(a4,true)
af:_tag(a4,"BackgroundColor3","Surface2")
af:_tag(a4,"TextColor3","Text")
local a5,a6=false,false
local function startRebind()a5=true a4.Text="..."end
a4.MouseButton1Click:Connect(startRebind)
aY._window:Track(aQ.InputBegan:Connect(function(a7,a8)
if a5 and a7.UserInputType==Enum.UserInputType.Keyboard then
a5=false a2=a7.KeyCode a4.Text=a2.Name
if aU.Flag then af.Flags[aU.Flag]=a2.Name end
aw(aU.ChangedCallback,a2)aw(aU.OnChanged,a2)
elseif not a5 and not a8 and a7.KeyCode==a2 then
if a1=="Hold"then a6=true end
aw(aU.Callback,a2)
end
end))
aY._window:Track(aQ.InputEnded:Connect(function(a7)
if a7.KeyCode==a2 then a6=false end
end))
local a7={
Set=function(a7,a8)
if type(a8)=="string"then a8=Enum.KeyCode[a8]or a2 end
a2,a4.Text=a8,a8.Name
end,
Get=function()return a2 end,
GetState=function()return a1=="Hold"and a6 or nil end,
Rebind=startRebind,
}

if aY._window and aY._window._keybinds then
table.insert(aY._window._keybinds,{
Title=aU.Title or"Keybind",
GetName=function()return a5 and"..."or a2.Name end,
Rebind=startRebind,
})
if aY._window._kbPanelRefresh then
task.defer(function()pcall(aY._window._kbPanelRefresh)end)
end
end
return aX{Title=aU.Title,Frame=a3,_handle=a7}
end end function a.u():typeof(__modImpl())local aa=a.cache.u if not aa then aa={c=__modImpl()}a.cache.u=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local aw=ab.T
local aD=ab.tween local aI=
ac.guid
local aP=ac.spawnCb
local aQ=ac.corner
local aR=ac.hairline local aU=
ac.pad local aV=
ac.lighting local aW=
ac.ripple local aX=
ad.makeIcon
local aY=ae.cloneref_check(game:GetService"RunService")
local a_=ae.cloneref_check(game:GetService"UserInputService")

return function(a0,a1)
local a2=a0.row
local a3=a0.titleBlock
local a4=a0.reg
local a5=a0.tab local a6=
a0.Window
local a7=a0.Th local a8=
a0.opts or{}
a1=a1 or{}
local a9=a1.Value or a1.Default or Color3.fromRGB(110,140,255)local c=
a1.Transparency or 0
local f=a2(a1.Description and 54 or 40)f.ClipsDescendants=false
a3(f,a1.Title or"Color",a1.Description,90)
local g=Instance.new"TextButton"g.Text=""
g.AnchorPoint=Vector2.new(1,0.5)g.Position=UDim2.new(1,-12,0.5,0)
g.Size=UDim2.fromOffset(56,26)g.BackgroundColor3=a9
g.BorderSizePixel=0 aQ(g,8)g.Parent=f
aR(g,true)
local N,S=false
local _,ba,bb=a9:ToHSV()
local bc={}
local function push(bd)
a9=Color3.fromHSV(_,ba,bb)
aD(g,aw.Hover,{BackgroundColor3=a9})
if a1.Flag then af.Flags[a1.Flag]={a9.R,a9.G,a9.B}end
if not bd then aP(a1.Callback,a9)aP(a1.OnChanged,a9)end
end
function bc.Set(bd,be,bf)
if type(be)=="table"then be=Color3.new(be[1]or 0,be[2]or 0,be[3]or 0)end
if typeof(be)=="Color3"then _,ba,bb=be:ToHSV()push(bf)end
end
function bc.Get(bd)return a9 end
g.MouseButton1Click:Connect(function()
N=not N
if not N then if S then pcall(function()S:Destroy()end)S=nil end return end
S=Instance.new"Frame"S.Position=UDim2.new(1,-222,0,46)
S.Size=UDim2.new(0,210,0,176)S.BackgroundColor3=a7.Bg
S.BorderSizePixel=0 aQ(S,10)S.Parent=f S.ZIndex=70
aR(S,true)
af:_tag(S,"BackgroundColor3","Bg")
local bd=Instance.new"TextButton"bd.Text=""bd.AutoButtonColor=false
bd.Position=UDim2.new(0,10,0,10)bd.Size=UDim2.new(0,150,0,120)
bd.BackgroundColor3=Color3.fromHSV(_,1,1)bd.BorderSizePixel=0
aQ(bd,8)bd.Parent=S bd.ZIndex=71
local be=Instance.new"UIGradient"be.Rotation=0
be.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}
be.Color=ColorSequence.new(Color3.fromRGB(255,255,255))be.Parent=bd
local bf=Instance.new"UIGradient"bf.Rotation=90
bf.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)}
bf.Color=ColorSequence.new(Color3.fromRGB(0,0,0))bf.Parent=bd
local bg=Instance.new"Frame"bg.AnchorPoint=Vector2.new(0.5,0.5)
bg.Size=UDim2.fromOffset(10,10)bg.BackgroundColor3=Color3.fromRGB(255,255,255)
bg.BorderSizePixel=0 aQ(bg,99)bg.Parent=bd bg.ZIndex=72
bg.Position=UDim2.new(ba,0,1-bb,0)
local bh=Instance.new"TextButton"bh.Text=""bh.AutoButtonColor=false
bh.Position=UDim2.new(0,166,0,10)bh.Size=UDim2.new(0,14,0,120)
bh.BorderSizePixel=0 aQ(bh,7)bh.Parent=S bh.ZIndex=71
local bi=Instance.new"UIGradient"bi.Rotation=90
bi.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
}
bi.Parent=bh
local bj=Instance.new"TextBox"bj.Text="#"..a9:ToHex()
bj.Font=Enum.Font.Code bj.TextSize=11
bj.Position=UDim2.new(0,10,0,136)bj.Size=UDim2.new(1,-20,0,28)
bj.BackgroundColor3=a7.Surface2 bj.BorderSizePixel=0
aQ(bj,7)bj.Parent=S bj.ZIndex=71
bj.ClearTextOnFocus=false
af:_tag(bj,"BackgroundColor3","Surface2")
af:_tag(bj,"TextColor3","Text")
local function syncSV()bd.BackgroundColor3=Color3.fromHSV(_,1,1)bg.Position=UDim2.new(ba,0,1-bb,0)end
syncSV()
bd.MouseButton1Down:Connect(function()
local bk
local function pick()
if a5._window and a5._window._visible==false then return end
local bl=a_:GetMouseLocation()
local bm=math.clamp((bl.X-bd.AbsolutePosition.X)/math.max(1,bd.AbsoluteSize.X),0,1)
local bn=math.clamp((bl.Y-bd.AbsolutePosition.Y)/math.max(1,bd.AbsoluteSize.Y),0,1)
ba,bb=bm,1-bn push()syncSV()
bj.Text="#"..a9:ToHex()
end
pick()
bk=aY.RenderStepped:Connect(pick)
local bl
bl=a_.InputEnded:Connect(function(bm)
if bm.UserInputType==Enum.UserInputType.MouseButton1 then
if bk then bk:Disconnect()end if bl then bl:Disconnect()end
end
end)
end)
bh.MouseButton1Down:Connect(function()
local bk
local function pick()
if a5._window and a5._window._visible==false then return end
local bl=a_:GetMouseLocation()
_=math.clamp((bl.Y-bh.AbsolutePosition.Y)/math.max(1,bh.AbsoluteSize.Y),0,1)
push()syncSV()
bj.Text="#"..a9:ToHex()
end
pick()
bk=aY.RenderStepped:Connect(pick)
local bl
bl=a_.InputEnded:Connect(function(bm)
if bm.UserInputType==Enum.UserInputType.MouseButton1 then
if bk then bk:Disconnect()end if bl then bl:Disconnect()end
end
end)
end)
bj.FocusLost:Connect(function()
local bk,bl=pcall(function()return Color3.fromHex(bj.Text)end)
if bk and bl then bc:Set(bl)syncSV()else bj.Text="#"..a9:ToHex()end
end)
S.Size=UDim2.new(0,210,0,0)
aD(S,aw.Med,{Size=UDim2.new(0,210,0,176)})
end)
local bd={Title=a1.Title,Frame=f,Value=a9,Flag=a1.Flag,_handle=bc,
_set=function(bd,be)bc:Set(bd,be)end}
return a4(bd)
end end function a.v():typeof(__modImpl())local aa=a.cache.v if not aa then aa={c=__modImpl()}a.cache.v=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local aw=
ab.T local aD=
ab.tween local aP=
ac.guid local aQ=
ac.spawnCb
local aR=ac.corner
local aX=ac.hairline
local aY=ac.pad local a_=
ac.lighting local a0=
ac.ripple
local a1=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a2,a3)
local a4=a2.row local a5=
a2.titleBlock
local a7=a2.reg
local a9=a2.tab local ba=
a2.Window
local bb=a2.Th local bc=
a2.opts or{}
a3=a3 or{}
local bd=a9._window
local be=a4(196)
local bf=Instance.new"TextLabel"bf.BackgroundTransparency=1
bf.Position=UDim2.new(0,12,0,6)bf.Size=UDim2.new(1,-24,0,17)
bf.Font=Enum.Font.GothamMedium bf.TextSize=13 bf.TextXAlignment=0
bf.Text=a3.Title or"Profiles"bf.Parent=be
af:_tag(bf,"TextColor3","Text")
local bg=Instance.new"TextBox"bg.PlaceholderText="Profile name..."
bg.PlaceholderColor3=bb.Dim bg.Text="default"
bg.Font=Enum.Font.Gotham bg.TextSize=12
bg.Position=UDim2.new(0,12,0,28)bg.Size=UDim2.new(1,-94,0,28)
bg.BackgroundColor3=bb.Surface2 bg.BorderSizePixel=0
aR(bg,7)bg.Parent=be
aY(bg,4,4,8,8)
aX(bg,true)
af:_tag(bg,"BackgroundColor3","Surface2")
af:_tag(bg,"TextColor3","Text")
local bh=Instance.new"TextButton"bh.Text=""
bh.AnchorPoint=Vector2.new(1,0)bh.Position=UDim2.new(1,-12,0,28)
bh.Size=UDim2.new(0,70,0,28)bh.BorderSizePixel=0
aR(bh,7)bh.AutoButtonColor=false bh.Parent=be
af:_tag(bh,"BackgroundColor3","Accent")
local bi=Instance.new"TextLabel"bi.BackgroundTransparency=1
bi.Size=UDim2.fromScale(1,1)bi.Font=Enum.Font.GothamBold
bi.TextSize=11 bi.Text="SAVE"
af:oa(bi)bi.Parent=bh
local bj=Instance.new"ScrollingFrame"
bj.Position=UDim2.new(0,12,0,62)bj.Size=UDim2.new(1,-24,1,-70)
bj.BackgroundTransparency=1 bj.BorderSizePixel=0
bj.ScrollBarThickness=2 bj.CanvasSize=UDim2.new(0,0,0,0)
bj.AutomaticCanvasSize=Enum.AutomaticSize.Y bj.Parent=be
af:_tag(bj,"ScrollBarImageColor3","Surface2")
local bk=Instance.new"UIListLayout"bk.Padding=UDim.new(0,4)
bk.SortOrder=Enum.SortOrder.LayoutOrder bk.Parent=bj
local function folder()
return"Kronos/"..tostring(bd and bd._cfgTitle or"Kronos")
end
local function profiles()
local bl={}
pcall(function()
if listfiles and isfolder and isfolder(folder())then
for bm,bn in ipairs(listfiles(folder()))do
local c=string.match(bn,"([^/\\]+)%.json$")
if c then table.insert(bl,c)end
end
end
end)
table.sort(bl)
return bl
end
local function refresh()
for bl,bm in ipairs(bj:GetChildren())do
if bm:IsA"TextButton"then pcall(function()bm:Destroy()end)end
end
local bl=profiles()
if#bl==0 then
local bm=Instance.new"TextLabel"bm.BackgroundTransparency=1
bm.Size=UDim2.new(1,0,0,22)bm.Font=Enum.Font.Gotham
bm.TextSize=11 bm.Text="No saved profiles"bm.Parent=bj
af:_tag(bm,"TextColor3","Dim")
return
end
for bm,bn in ipairs(bl)do
local c=Instance.new"TextButton"c.Text=""
c.Size=UDim2.new(1,-2,0,28)c.BackgroundColor3=bb.Surface2
c.BackgroundTransparency=0.35 c.BorderSizePixel=0
aR(c,7)c.Parent=bj
af:_tag(c,"BackgroundColor3","Surface2")
local f=Instance.new"TextLabel"f.BackgroundTransparency=1
f.Position=UDim2.new(0,8,0,0)f.Size=UDim2.new(1,-44,1,0)
f.Font=Enum.Font.Gotham f.TextSize=12 f.TextXAlignment=0
f.TextTruncate=Enum.TextTruncate.AtEnd f.Text=bn f.Parent=c
af:_tag(f,"TextColor3","Text")
local g=Instance.new"TextButton"g.Text=""
g.AnchorPoint=Vector2.new(1,0.5)g.Position=UDim2.new(1,-6,0.5,0)
g.Size=UDim2.fromOffset(22,22)g.BackgroundTransparency=1 g.Parent=c
local N=a1("x",11,bb.Dim)
N.AnchorPoint=Vector2.new(0.5,0.5)N.Position=UDim2.new(0.5,0,0.5,0)
N.Parent=g
c.MouseButton1Click:Connect(function()
af:_sfx"Click"bd:LoadConfig(bn)
end)
g.MouseButton1Click:Connect(function()
pcall(function()if delfile then delfile(folder().."/"..bn..".json")end end)
bd:Notify{Title="Profile deleted",Content=bn,Duration=2}
refresh()
end)
end
end
bh.MouseButton1Click:Connect(function()
af:_sfx"Click"
local bl=bg.Text~=""and bg.Text or"default"
bd:SaveConfig(bl)refresh()
end)
refresh()
return a7{Title=a3.Title or"Profiles",Frame=be,_handle={Refresh=refresh}}
end end function a.w():typeof(__modImpl())local aa=a.cache.w if not aa then aa={c=__modImpl()}a.cache.w=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local aR=ab.T
local aX=ab.tween local aY=
ac.guid
local a0=ac.spawnCb
local a1=ac.corner
local a2=ac.hairline local a3=
ac.pad
local a4=ac.lighting
local a7=ac.ripple
local a9=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bb,bc)local bd=
bb.row local be=
bb.titleBlock
local bf=bb.reg
local bg=bb.tab local bh=
bb.Window
local bi=bb.Th local bj=
bb.opts or{}
bc=bc or{}
local bk=Instance.new"Frame"bk.Size=UDim2.new(1,-4,0,96)
bk.BackgroundColor3=bi.Surface2 bk.BorderSizePixel=0
a1(bk,10)bk.Parent=page
a2(bk,true)
af:_tag(bk,"BackgroundColor3","Surface2")
a4(bk,10)

local bl=Instance.new"Frame"bl.BorderSizePixel=0
bl.Position=UDim2.new(0,0,0,18)bl.Size=UDim2.new(0,3,1,-36)
a1(bl,99)bl.Parent=bk
af:_tag(bl,"BackgroundColor3","Accent")
local bm=a9(bc.Icon or"bellring",18,bi.Accent)
bm.AnchorPoint=Vector2.new(0,0.5)bm.Position=UDim2.new(0,14,0,48)
bm.Parent=bk
if bm:IsA"TextLabel"then bm.Size=UDim2.new(0,18,0,18)end

local bn=bc.Button and-142 or-54
local c=Instance.new"TextLabel"c.BackgroundTransparency=1
c.Position=UDim2.new(0,42,0,16)c.Size=UDim2.new(1,bn,0,18)
c.Font=Enum.Font.GothamBold c.TextSize=14 c.TextXAlignment=0
c.TextTruncate=Enum.TextTruncate.AtEnd c.Text=bc.Title or"News"c.Parent=bk
af:_tag(c,"TextColor3","Text")
local f=Instance.new"TextLabel"f.BackgroundTransparency=1
f.Position=UDim2.new(0,42,0,38)f.Size=UDim2.new(1,bn,0,42)
f.Font=Enum.Font.Gotham f.TextSize=12 c.TextXAlignment=0
f.TextXAlignment=0 f.TextYAlignment=0 f.TextWrapped=true
f.TextTruncate=Enum.TextTruncate.AtEnd f.Text=bc.Content or""f.Parent=bk
af:_tag(f,"TextColor3","Dim")
if bc.Button then
local g=Instance.new"TextButton"g.Text=""
g.AnchorPoint=Vector2.new(1,0.5)g.Position=UDim2.new(1,-12,0,48)
g.Size=UDim2.new(0,76,0,30)g.BorderSizePixel=0
a1(g,7)g.AutoButtonColor=false g.Parent=bk
af:agrad(g,15)
local N=Instance.new"TextLabel"N.BackgroundTransparency=1
N.Size=UDim2.fromScale(1,1)N.Font=Enum.Font.GothamBold
N.TextSize=11
N.Text=string.upper(bc.Button)N.Parent=g
af:oa(N)
a7(g)
g.MouseButton1Click:Connect(function()
af:_sfx"Click"a0(bc.Callback)
end)
end
bk.BackgroundTransparency=1
task.delay(#bg.Elements*0.025,function()
aX(bk,aR.Med,{BackgroundTransparency=0})
end)
return bf{Title=bc.Title,Frame=bk,_handle=bk}
end end function a.x():typeof(__modImpl())local aa=a.cache.x if not aa then aa={c=__modImpl()}a.cache.x=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local aR=
ab.T local aX=
ab.tween local a0=
ac.guid local a1=
ac.spawnCb
local a2=ac.corner
local a3=ac.hairline local a4=
ac.pad
local a7=ac.lighting local a9=
ac.ripple local bb=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bc,bf)local bg=
bc.row local bi=
bc.titleBlock
local bj=bc.reg local bk=
bc.tab local bl=
bc.Window
local bm=bc.Th local bn=
bc.opts or{}
bf=bf or{}
local c=bf.Stats or bf.Items or{}
local f=math.max(1,#c)
local g=Instance.new"Frame"g.BackgroundTransparency=1
g.Size=UDim2.new(1,-4,0,64)g.Parent=page
local N=Instance.new"UIListLayout"N.FillDirection=Enum.FillDirection.Horizontal
N.Padding=UDim.new(0,8)N.SortOrder=Enum.SortOrder.LayoutOrder N.Parent=g
local S={}
for _,bo in ipairs(c)do
local bp=Instance.new"Frame"
bp.Size=UDim2.new(1/f,-8,1,0)
bp.BackgroundColor3=bm.Surface bp.BorderSizePixel=0
a2(bp,10)bp.LayoutOrder=_ bp.Parent=g
a3(bp,true)
af:_tag(bp,"BackgroundColor3","Surface")
a7(bp,10)
local bq=Instance.new"TextLabel"bq.BackgroundTransparency=1
bq.Position=UDim2.new(0,0,0,10)bq.Size=UDim2.new(1,0,0,20)
bq.Font=Enum.Font.GothamBold bq.TextSize=16 bq.Text=tostring(bo.Value or"-")
bq.Parent=bp
af:_tag(bq,"TextColor3",bo.Accent and"Accent"or"Text")
local br=Instance.new"TextLabel"br.BackgroundTransparency=1
br.Position=UDim2.new(0,0,0,32)br.Size=UDim2.new(1,0,0,14)
br.Font=Enum.Font.GothamBold br.TextSize=9
br.Text=string.upper(bo.Label or"")br.Parent=bp
af:_tag(br,"TextColor3","Dim")
S[bo.Label or _]={Set=function(bs,bt)bq.Text=tostring(bt)end,Frame=bp}
end
return bj{Title=bf.Title or"Stats",Frame=g,_handle=S}
end end function a.y():typeof(__modImpl())local aa=a.cache.y if not aa then aa={c=__modImpl()}a.cache.y=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local a2=
ab.T local a3=
ab.tween local a7=
ac.guid local bb=
ac.spawnCb
local bc=ac.corner local bf=
ac.hairline local bj=
ac.pad local bm=
ac.lighting local bn=
ac.ripple local bo=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bp,bq)local br=
bp.row local bs=
bp.titleBlock
local bt=bp.reg local c=
bp.tab local f=
bp.Window
local g=bp.Th local N=
bp.opts or{}
bq=bq or{}
local S=math.clamp(bq.Lines or 3,1,6)
local _=Instance.new"Frame"_.BackgroundTransparency=1
_.Size=UDim2.new(1,-4,0,S*18+8)_.Parent=page
for bu=1,S do
local bv=Instance.new"Frame"bv.BorderSizePixel=0
bv.Position=UDim2.new(0,0,0,(bu-1)*18)
bv.Size=UDim2.new(bu==S and 0.6 or 1,0,0,12)
bv.BackgroundColor3=g.Surface2 bc(bv,6)bv.Parent=_
af:_tag(bv,"BackgroundColor3","Surface2")
local bw=Instance.new"Frame"bw.Name="_sheen"bw.BorderSizePixel=0
bw.Size=UDim2.new(0.35,0,1,0)bw.BackgroundColor3=Color3.fromRGB(255,255,255)
bw.BackgroundTransparency=0.88 bc(bw,6)bw.Parent=bv
bv.ClipsDescendants=true
end
task.spawn(function()
local bu=0
while _.Parent do
bu+=0.03 task.wait(0.03)
for bv,bw in ipairs(_:GetChildren())do
if bw:IsA"Frame"then
for bx,by in ipairs(bw:GetChildren())do
if by.Name=="_sheen"then
local bz=((bu*0.9)%1.4)-0.2
pcall(function()by.Position=UDim2.new(bz,0,0,0)end)
end
end
end
end
end
end)
return bt{Title=bq.Title or"Loading",Frame=_,_handle=_}
end end function a.z():typeof(__modImpl())local aa=a.cache.z if not aa then aa={c=__modImpl()}a.cache.z=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local bc=
ab.T
local bo=ab.tween local bp=
ac.guid local bq=
ac.spawnCb
local bt=ac.corner local bu=
ac.hairline local bv=
ac.pad local bw=
ac.lighting local bx=
ac.ripple local by=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bz,g)
local N=bz.row
local S=bz.titleBlock
local _=bz.reg local bA=
bz.tab local bB=
bz.Window local bC=
bz.Th local bD=
bz.opts or{}
g=g or{}
local bE={online="Success",idle="Warn",offline="Danger",busy="Accent"}
local bF=string.lower(g.State or"online")
local bG=N(g.Description and 54 or 40)
S(bG,g.Title or"Status",g.Description)
local bH=Instance.new"Frame"bH.AnchorPoint=Vector2.new(1,0.5)
bH.Position=UDim2.new(1,-84,0.5,0)bH.Size=UDim2.fromOffset(10,10)
bH.BorderSizePixel=0 bt(bH,99)bH.Parent=bG
af:_tag(bH,"BackgroundColor3",bE[bF]or"Success")
local bI=Instance.new"TextLabel"bI.BackgroundTransparency=1
bI.AnchorPoint=Vector2.new(1,0.5)bI.Position=UDim2.new(1,-12,0.5,0)
bI.Size=UDim2.new(0,56,0,16)bI.Font=Enum.Font.GothamBold
bI.TextSize=10 bI.TextXAlignment=1 bI.Text=string.upper(bF)bI.Parent=bG
af:_tag(bI,"TextColor3","Dim")
task.spawn(function()
while bH.Parent do
bo(bH,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0.55})
task.wait(1.25)
if not bH.Parent then break end
bo(bH,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0})
task.wait(1.25)
end
end)
local bJ={}
function bJ.Set(bK,bL)
bF=string.lower(bL)
af:_tag(bH,"BackgroundColor3",bE[bF]or"Success")
bI.Text=string.upper(bF)
end
return _{Title=g.Title,Frame=bG,_handle=bJ}
end end function a.A():typeof(__modImpl())local aa=a.cache.A if not aa then aa={c=__modImpl()}a.cache.A=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local bo=
ab.T local bt=
ab.tween local by=
ac.guid local bz=
ac.spawnCb local bD=
ac.corner local bE=
ac.hairline local bF=
ac.pad local bG=
ac.lighting local bH=
ac.ripple
local bI=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bJ,bK)local bL=
bJ.row local g=
bJ.titleBlock
local N=bJ.reg local S=
bJ.tab local _=
bJ.Window
local bM=bJ.Th local bN=
bJ.opts or{}
bK=bK or{}
local bO=Instance.new"Frame"bO.BackgroundTransparency=1
bO.Size=UDim2.new(1,-4,0,130)bO.Parent=page
local bP=bI(bK.Icon or"box",30,bM.Dim)
bP.AnchorPoint=Vector2.new(0.5,0)bP.Position=UDim2.new(0.5,0,0,18)
bP.Parent=bO
if bP:IsA"TextLabel"then bP.Size=UDim2.new(0,30,0,30)end
local bQ=Instance.new"TextLabel"bQ.BackgroundTransparency=1
bQ.Position=UDim2.new(0,0,0,56)bQ.Size=UDim2.new(1,0,0,20)
bQ.Font=Enum.Font.GothamBold bQ.TextSize=14 bQ.Text=bK.Title or"Nothing here"
bQ.Parent=bO
af:_tag(bQ,"TextColor3","Text")
local bR=Instance.new"TextLabel"bR.BackgroundTransparency=1
bR.Position=UDim2.new(0,20,0,78)bR.Size=UDim2.new(1,-40,0,36)
bR.Font=Enum.Font.Gotham bR.TextSize=12 bR.TextWrapped=true
bR.Text=bK.Hint or"This section is empty."bR.Parent=bO
af:_tag(bR,"TextColor3","Dim")
return N{Title=bK.Title,Frame=bO,_handle=bO}
end end function a.B():typeof(__modImpl())local aa=a.cache.B if not aa then aa={c=__modImpl()}a.cache.B=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local bH=ab.T
local bI=ab.tween local bJ=
ac.guid local bK=
ac.spawnCb
local bM=ac.corner
local bN=ac.hairline local bO=
ac.pad
local bP=ac.lighting local bQ=
ac.ripple local bR=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(N,bS)local bT=
N.row local bU=
N.titleBlock
local bV=N.reg
local bW=N.tab local bX=
N.Window
local bY=N.Th local bZ=
N.opts or{}
bS=bS or{}
local b_=Instance.new"Frame"b_.Size=UDim2.new(1,-4,0,64)
b_.BackgroundColor3=bY.Surface2 b_.BorderSizePixel=0
bM(b_,10)b_.Parent=page
bN(b_,true)
af:_tag(b_,"BackgroundColor3","Surface2")
bP(b_,10)
local b0=Instance.new"Frame"b0.AnchorPoint=Vector2.new(0,0.5)
b0.Position=UDim2.new(0,12,0.5,0)b0.Size=UDim2.fromOffset(40,40)
b0.BorderSizePixel=0 bM(b0,99)b0.Parent=b_
af:agrad(b0,45)
local b1=Instance.new"TextLabel"b1.Size=UDim2.fromScale(1,1)
b1.BackgroundTransparency=1 b1.Font=Enum.Font.GothamBlack
b1.TextSize=18
b1.Text=string.upper(string.sub(bS.Name or"?",1,1))b1.Parent=b0
af:oa(b1)
local b2=Instance.new"TextLabel"b2.BackgroundTransparency=1
b2.Position=UDim2.new(0,62,0,12)b2.Size=UDim2.new(1,-120,0,18)
b2.Font=Enum.Font.GothamBold b2.TextSize=14 b2.TextXAlignment=0
b2.TextTruncate=Enum.TextTruncate.AtEnd b2.Text=bS.Name or"guest"b2.Parent=b_
af:_tag(b2,"TextColor3","Text")
local b3=Instance.new"TextLabel"b3.BackgroundTransparency=1
b3.Position=UDim2.new(0,62,0,32)b3.Size=UDim2.new(1,-120,0,14)
b3.Font=Enum.Font.Gotham b3.TextSize=11 b3.TextXAlignment=0
b3.TextTruncate=Enum.TextTruncate.AtEnd b3.Text=bS.Tag or"Premium"b3.Parent=b_
af:_tag(b3,"TextColor3","Dim")
local b4=Instance.new"Frame"b4.AnchorPoint=Vector2.new(1,0.5)
b4.Position=UDim2.new(1,-14,0.5,0)b4.Size=UDim2.fromOffset(10,10)
b4.BorderSizePixel=0 bM(b4,99)b4.Parent=b_
af:_tag(b4,"BackgroundColor3","Success")
b_.BackgroundTransparency=1
task.delay(#bW.Elements*0.025,function()
bI(b_,bH.Med,{BackgroundTransparency=0})
end)
return bV{Title=bS.Name,Frame=b_,_handle=b_}
end end function a.C():typeof(__modImpl())local aa=a.cache.C if not aa then aa={c=__modImpl()}a.cache.C=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa
local bH=ab.T
local bI=ab.tween local bM=
ac.guid
local bN=ac.spawnCb
local bP=ac.corner
local bR=ac.hairline local bS=
ac.pad
local bV=ac.lighting local bW=
ac.ripple
local bY=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bZ,b_)local b0=
bZ.row local b1=
bZ.titleBlock
local b2=bZ.reg local b3=
bZ.tab local b4=
bZ.Window
local N=bZ.Th local b5=
bZ.opts or{}
b_=b_ or{}
local b6=b_.Cards or{}
local b7=math.clamp(b_.Columns or 2,1,3)
local b8=Instance.new"Frame"b8.BackgroundTransparency=1
b8.Size=UDim2.new(1,-4,0,0)b8.AutomaticSize=Enum.AutomaticSize.Y
b8.Parent=page
local b9=Instance.new"UIListLayout"b9.Padding=UDim.new(0,8)
b9.SortOrder=Enum.SortOrder.LayoutOrder b9.Parent=b8




local ca,cb=0
for cc,cd in ipairs(b6)do
if(cc-1)%b7==0 then
cb=Instance.new"Frame"cb.BackgroundTransparency=1
cb.Size=UDim2.new(1,0,0,68)cb.AutomaticSize=Enum.AutomaticSize.Y
cb.Parent=b8
local ce=Instance.new"UIListLayout"ce.FillDirection=Enum.FillDirection.Horizontal
ce.Padding=UDim.new(0,8)ce.SortOrder=Enum.SortOrder.LayoutOrder ce.Parent=cb
ca+=1
end
local ce=false
local cf=Instance.new"Frame"
cf.Size=UDim2.new(1/b7,-8+8/b7,0,68)
cf.BackgroundColor3=N.Surface cf.BorderSizePixel=0
bP(cf,10)cf.LayoutOrder=cc cf.Parent=cb
bR(cf,true)
af:_tag(cf,"BackgroundColor3","Surface")
bV(cf,10)


local cg=Instance.new"TextButton"cg.Text=""
cg.Size=UDim2.fromScale(1,1)cg.BackgroundTransparency=1 cg.Parent=cf
local ch=bY(cd.Icon or"box",16,N.Dim)
ch.Position=UDim2.new(0,10,0,10)ch.Parent=cf
if ch:IsA"TextLabel"then ch.Size=UDim2.new(0,16,0,16)end
local ci=Instance.new"TextLabel"ci.BackgroundTransparency=1
ci.Position=UDim2.new(0,34,0,8)ci.Size=UDim2.new(1,-42,0,18)
ci.Font=Enum.Font.GothamBold ci.TextSize=13 ci.TextXAlignment=0
ci.TextTruncate=Enum.TextTruncate.AtEnd ci.Text=cd.Title or"Script"ci.Parent=cf
af:_tag(ci,"TextColor3","Text")
local cj=Instance.new"TextLabel"cj.BackgroundTransparency=1
cj.Position=UDim2.new(0,10,0,30)cj.Size=UDim2.new(1,-20,0,28)
cj.Font=Enum.Font.Gotham cj.TextSize=11
cj.TextXAlignment=0 cj.TextYAlignment=0
cj.TextWrapped=true cj.TextTruncate=Enum.TextTruncate.AtEnd
cj.Text=cd.Desc or""cj.Visible=false cj.Parent=cf
af:_tag(cj,"TextColor3","Dim")
local ck=Instance.new"TextButton"ck.Text=""
ck.AnchorPoint=Vector2.new(0,1)ck.Position=UDim2.new(0,10,1,-10)
ck.Size=UDim2.new(1,-20,0,28)ck.BorderSizePixel=0
bP(ck,7)ck.AutoButtonColor=false ck.Visible=false ck.Parent=cf
af:agrad(ck,15)
local cl=Instance.new"TextLabel"cl.BackgroundTransparency=1
cl.Size=UDim2.fromScale(1,1)cl.Font=Enum.Font.GothamBold
cl.TextSize=11
cl.Text="LAUNCH"cl.Parent=ck
af:oa(cl)
cg.MouseButton1Click:Connect(function()
ce=not ce
af:_sfx"Click"
bI(cf,bH.Med,{Size=UDim2.new(1/b7,-8+8/b7,0,ce and 118 or 68)})
cj.Visible,ck.Visible=ce,ce
end)
ck.MouseButton1Click:Connect(function()
af:_sfx"Click"bN(cd.Callback)
end)
end
return b2{Title=b_.Title or"Scripts",Frame=b8,_handle=b8}
end end function a.D():typeof(__modImpl())local aa=a.cache.D if not aa then aa={c=__modImpl()}a.cache.D=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()a.h()a.f()


local ae=a.b()

local af=aa local bH=
ab.T local bI=
ab.tween local bN=
ac.guid local bP=
ac.spawnCb
local bR=ac.corner local bV=
ac.hairline local bW=
ac.pad local bY=
ac.lighting local bZ=
ac.ripple local b_=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b2,b5)local b6=
b2.row local b7=
b2.titleBlock
local b8=b2.reg local b9=
b2.tab local ca=
b2.Window
local cb=b2.Th local cc=
b2.opts or{}
b5=b5 or{}
local cd=b5.Limit or 5
local ce=Instance.new"Frame"ce.BackgroundTransparency=1
ce.Size=UDim2.new(1,-4,0,0)ce.AutomaticSize=Enum.AutomaticSize.Y
ce.Parent=page
local cf=Instance.new"UIListLayout"cf.Padding=UDim.new(0,4)
cf.SortOrder=Enum.SortOrder.LayoutOrder cf.Parent=ce
local function refresh()
for cg,ch in ipairs(ce:GetChildren())do
if ch:IsA"TextButton"then pcall(function()ch:Destroy()end)end
end
local cg=af._recent or{}
if#cg==0 then
local ch=Instance.new"TextLabel"ch.BackgroundTransparency=1
ch.Size=UDim2.new(1,0,0,24)ch.Font=Enum.Font.Gotham
ch.TextSize=11 ch.Text="Use any control and it lands here."ch.Parent=ce
af:_tag(ch,"TextColor3","Dim")
return
end
for ch=1,math.min(cd,#cg)do
local ci=cg[ch]
local cj=Instance.new"TextButton"cj.Text=""
cj.Size=UDim2.new(1,0,0,30)cj.BackgroundColor3=cb.Surface
cj.BackgroundTransparency=0.35 cj.BorderSizePixel=0
bR(cj,7)cj.Parent=ce
af:_tag(cj,"BackgroundColor3","Surface")
local ck=Instance.new"TextLabel"ck.BackgroundTransparency=1
ck.Position=UDim2.new(0,10,0,0)ck.Size=UDim2.new(1,-90,1,0)
ck.Font=Enum.Font.Gotham ck.TextSize=12 ck.TextXAlignment=0
ck.TextTruncate=Enum.TextTruncate.AtEnd ck.Text=ci.label ck.Parent=cj
af:_tag(ck,"TextColor3","Text")
local cl=Instance.new"TextLabel"cl.BackgroundTransparency=1
cl.AnchorPoint=Vector2.new(1,0)cl.Position=UDim2.new(1,-10,0,0)
cl.Size=UDim2.new(0,74,1,0)cl.Font=Enum.Font.Gotham
cl.TextSize=10 cl.TextXAlignment=1 cl.Text=ci.tab cl.Parent=cj
af:_tag(cl,"TextColor3","Dim")
cj.MouseButton1Click:Connect(function()
if ci.go then af:_sfx"Click"pcall(ci.go)end
end)
end
end
af._recentRefresh=af._recentRefresh or{}
table.insert(af._recentRefresh,refresh)
refresh()
return b8{Title=b5.Title or"Recent",Frame=ce,_handle={Refresh=refresh}}
end end function a.E():typeof(__modImpl())local aa=a.cache.E if not aa then aa={c=__modImpl()}a.cache.E=aa end return aa.c end end do local function __modImpl()





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
Dropdown=a.t(),
Keybind=a.u(),
Colorpicker=a.v(),
Profiles=a.w(),
Banner=a.x(),
StatsRow=a.y(),
Skeleton=a.z(),
Status=a.A(),
Empty=a.B(),
Profile=a.C(),
Cards=a.D(),
Recent=a.E(),
}

local function attach(ab,ac)
for ad,ae in pairs(aa)do
ab[ad]=function(af,bR)
return ae(ac,bR)
end
end
end

return{attach=attach,map=aa}end function a.F():typeof(__modImpl())local aa=a.cache.F if not aa then aa={c=__modImpl()}a.cache.F=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.e()
local ae=a.h()
local af=a.f()


local bR=ab.T
local b_=ab.tween local b2=
ac.spawnCb
local b5=ac.corner
local b8=ac.hairline
local cb=ac.pad
local cc=ac.lighting
local cd=ad.makeIcon
local ce=a.F()

return function(cf,cg)
local ch=cf.Window
local ci=cf.opts or{}
local cj=cf.Th
local ck=cf.pages
local cl=cf.nav
local N=cf.pill
local cm=cf.subLbl
cg=cg or{}
local cn=cg.Title or("Tab "..(#ch._tabs+1))
local co=cg.Icon or cn

local cp=Instance.new"TextButton"
cp.Text=""
cp.Size=UDim2.new(1,0,0,34)
cp.BackgroundColor3=cj.Surface2
cp.BackgroundTransparency=1
cp.BorderSizePixel=0
b5(cp,8)
cp.LayoutOrder=#ch._tabs+10
cp.AutoButtonColor=false
cp.Parent=cl
cp.ZIndex=2
cp.Visible=true
local cq=#ch._tabs+1
local cr=cd(co,15,cj.Dim)
cr.AnchorPoint=Vector2.new(0,0.5)
cr.Position=UDim2.new(0,14,0.5,0)
cr.Parent=cp
cr.Visible=true
cr.ZIndex=3
if cr:IsA"TextLabel"then cr.Size=UDim2.new(0,15,0,15)end
local cs=Instance.new"TextLabel"
cs.BackgroundTransparency=1
cs.Position=UDim2.new(0,37,0,0)
cs.Size=UDim2.new(1,-49,1,0)
cs.Font=Enum.Font.GothamMedium
cs.TextSize=13
cs.TextXAlignment=0
cs.TextTruncate=Enum.TextTruncate.AtEnd
cs.Text=cn
cs.Parent=cp
cs.Visible=true
cs.TextTransparency=0
cs.ZIndex=3
ae.tag(cs,"TextColor3","Dim")
cp.MouseEnter:Connect(function()
if ch._active and ch._active.Button==cp then return end
b_(cp,bR.Hover,{BackgroundTransparency=0.55})
ae.tag(cs,"TextColor3","Text")
end)
cp.MouseLeave:Connect(function()
if ch._active and ch._active.Button==cp then return end
b_(cp,bR.Hover,{BackgroundTransparency=1})
ae.tag(cs,"TextColor3","Dim")
end)

local ct=Instance.new"ScrollingFrame"
ct.Visible=false
ct.Size=UDim2.fromScale(1,1)
ct.BackgroundTransparency=1
ct.BorderSizePixel=0
ct.ScrollBarThickness=3
ct.ScrollBarImageColor3=cj.Surface2
ct.CanvasSize=UDim2.new(0,0,0,0)
ct.AutomaticCanvasSize=Enum.AutomaticSize.Y
ct.Parent=ck
ae.tag(ct,"ScrollBarImageColor3","Surface2")
local cu=Instance.new"UIListLayout"
cu.Padding=UDim.new(0,8)
cu.SortOrder=Enum.SortOrder.LayoutOrder
cu.Parent=ct
cb(ct,2,8,2,6)

local cv={Title=cn,Button=cp,Page=ct,Elements={},_label=cs,_icon=cr}
cv._pl=cu

local cw=ci.SubTitle or ci.Subtitle or"scripthub"

local function setActive(cx)
ch._active=cv
pcall(function()
cm.Text=string.upper(cw).."  /  "..string.upper(cn)
end)
for cy,cz in ipairs(ch._tabs)do
local cA=cz==cv
cz.Page.Visible=cA
local cB=cz._label
cB.TextTransparency=0
b_(cz.Button,bR.Hover,{BackgroundTransparency=1})
if cA then
ae.tag(cB,"TextColor3","Text")
if cz._icon and cz._icon:IsA"ImageLabel"then
cz._icon.ImageTransparency=0
b_(cz._icon,bR.Hover,{ImageColor3=aa.Theme.Accent})
end
else
ae.tag(cB,"TextColor3","Dim")
if cz._icon and cz._icon:IsA"ImageLabel"then
cz._icon.ImageTransparency=0
b_(cz._icon,bR.Hover,{ImageColor3=aa.Theme.Dim})
end
end
end
b_(N,bR.Med,{Position=UDim2.new(0,0,0,(cq-1)*38-2)})
if cx then
ct.Position=UDim2.new(0,14,0,0)
b_(ct,bR.Med,{Position=UDim2.new(0,0,0,0)})
local cy=0
for cz,cA in ipairs(ct:GetChildren())do
if cA:IsA"Frame"or cA:IsA"CanvasGroup"then
cy+=1
local cB=math.min(cy*0.02,0.3)
task.delay(cB,function()
if not cA.Parent then return end
local cC=Instance.new"Frame"
cC.Name="_cascade"
cC.Size=UDim2.fromScale(1,1)
cC.BackgroundColor3=cj.Surface2
cC.BackgroundTransparency=0.55
cC.BorderSizePixel=0
b5(cC,10)
cC.Parent=cA
b_(cC,bR.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()cC:Destroy()end)end)
end)
end
end
end
end
cp.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

table.insert(ch._tabs,cv)
if#ch._tabs==1 then
setActive(false)
N.Position=UDim2.new(0,0,0,-2)
N.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
cs.TextTransparency=0
if cr:IsA"ImageLabel"then cr.ImageTransparency=0 end
end)
end)

local function row(cx)
local cy=Instance.new"Frame"
cy.Size=UDim2.new(1,-4,0,cx)
cy.BackgroundColor3=cj.Surface
cy.BorderSizePixel=0
local cz=math.clamp((ci.Radius or 12)-2,4,12)
b5(cy,cz)
cc(cy,cz)
cy.Parent=ct
b8(cy,true)
ae.tag(cy,"BackgroundColor3","Surface")
local cA=cy:FindFirstChild"_light"
if cA then cA.Visible=false end
cy.BackgroundTransparency=1
task.delay(#cv.Elements*0.025,function()
b_(cy,bR.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if cA and cA.Parent then cA.Visible=true end end)
end)
return cy
end
local function titleBlock(cx,cy,cz,cA,cB)
cA=cA or 112
local cC=Instance.new"TextLabel"
cC.BackgroundTransparency=1
if cz then
cC.Position=UDim2.new(0,14,0,9)
cC.Size=UDim2.new(1,-cA,0,17)
elseif cB then
cC.Position=UDim2.new(0,14,0,8)
cC.Size=UDim2.new(1,-cA,0,17)
else
cC.Position=UDim2.new(0,14,0,0)
cC.Size=UDim2.new(1,-cA,1,0)
end
cC.Font=Enum.Font.GothamMedium
cC.TextSize=13
cC.TextXAlignment=0
cC.TextTruncate=Enum.TextTruncate.AtEnd
cC.Text=cy
cC.Parent=cx
ae.tag(cC,"TextColor3","Text")
if cz then
local cD=Instance.new"TextLabel"
cD.BackgroundTransparency=1
cD.Position=UDim2.new(0,14,0,30)
cD.Size=UDim2.new(1,-cA,0,14)
cD.Font=Enum.Font.Gotham
cD.TextSize=11
cD.TextXAlignment=0
cD.TextTruncate=Enum.TextTruncate.AtEnd
cD.Text=cz
cD.Parent=cx
ae.tag(cD,"TextColor3","Dim")
end
end
local function reg(cx)
table.insert(cv.Elements,cx)
cx._tab=cv
if not cx._go then
cx._go=function()
if ch._activateTab then ch._activateTab(cv,true)end
ch:_flash(cx.Frame)
end
end
if cx.Flag and cx._set then
aa._live[cx.Flag]=aa._live[cx.Flag]or{}
table.insert(aa._live[cx.Flag],cx._set)
if aa.Flags["_loaded_"..cx.Flag]~=nil then
local cy=aa.Flags["_loaded_"..cx.Flag]
aa.Flags["_loaded_"..cx.Flag]=nil
task.defer(function()pcall(cx._set,cy,true)end)
elseif cx.Value~=nil and aa.Flags[cx.Flag]==nil then
aa.Flags[cx.Flag]=cx.Value
end
elseif cx.Flag and cx.Value~=nil and aa.Flags[cx.Flag]==nil then
aa.Flags[cx.Flag]=cx.Value
end
return cx._handle
end

local cx={}
local cy={row=row,titleBlock=titleBlock,reg=reg,tab=cv,Window=ch,Th=cj,opts=ci}
ce.attach(cx,cy)

cv.Api=cx
cv._window=ch
cv._activate=function(cz)setActive(cz~=false)end
for cz,cA in pairs(cx)do cv[cz]=function(cB,...)return cA(cv,...)end end
return cv
end end function a.G():typeof(__modImpl())local aa=a.cache.G if not aa then aa={c=__modImpl()}a.cache.G=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.d()
local ad=a.b()
local ae=a.e()a.h()a.f()


local af=a.g()
local bR=a.j()
local b_=a.G()

local b2=aa
local b5=ab.T
local b8=ab.tween
local cb=ac.spawnCb
local cc=ac.corner
local cd=ac.hairline
local ce=ac.pad
local cf=ac.lighting
local cg=ac.topLight
local ch=ac.shadow
local ci=ac.makeDraggable
local cj=ae.makeIcon
local ck=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(cl)
local cm=cl:FindFirstChild"Notification"
if cm then return cm end
cm=Instance.new"Frame"
cm.Name="Notification"
cm.AnchorPoint=Vector2.new(1,1)
cm.Position=UDim2.new(1,-18,1,-18)
cm.Size=UDim2.new(0,300,1,-36)
cm.BackgroundTransparency=1
cm.Parent=cl
local cn=Instance.new"UIListLayout"
cn.VerticalAlignment=Enum.VerticalAlignment.Bottom
cn.Padding=UDim.new(0,10)
cn.SortOrder=Enum.SortOrder.LayoutOrder
cn.Parent=cm
return cm
end

local function bumpRecent(cl,cm,cn)
if not cm or cm==""then return end
for co,cp in ipairs(aa._recent)do
if cp.label==cm and cp.tab==cl then table.remove(aa._recent,co)break end
end
table.insert(aa._recent,1,{tab=cl,label=cm,go=cn})
while#aa._recent>8 do table.remove(aa._recent)end
for co,cp in ipairs(aa._recentRefresh)do pcall(cp)end
end
aa._bumpRecent=function(cl,cm,cn,co)
return bumpRecent(cm,cn,co)
end

return function(cl,cm)
cm=cm or{}
local cn=cm.Title or"Kronos"
local co=cm.SubTitle or cm.Subtitle or"scripthub"
local cp=cm.ToggleKey or Enum.KeyCode.RightShift
local cq=cm.Acrylic
if cq==nil then cq=true end
if cm.Theme then cl:SetTheme(cm.Theme)end
local cr=cl.Theme
cl:SetAcrylic(cq,cm.Blur or 16)

local cs=ad.GetRoot()
if cl._gui then pcall(function()cl._gui:Destroy()end)end

local ct=Instance.new"ScreenGui"
ct.Name=ad.GetStealthName()ct.ResetOnSpawn=false ct.IgnoreGuiInset=true ct.DisplayOrder=999
ad.protectGui(ct)
ct.Parent=cs
cl._gui=ct

local cu=Instance.new"TextButton"
cu.Name="Dim"cu.Size=UDim2.fromScale(1,1)
cu.BackgroundColor3=Color3.fromRGB(3,4,7)cu.BackgroundTransparency=1
cu.Text=""cu.AutoButtonColor=false cu.Parent=ct
b8(cu,b5.Slow,{BackgroundTransparency=0.5})


if cm.Ambient~=false then
local cv=Instance.new"Frame"cv.Name="_ambient"
cv.AnchorPoint=Vector2.new(0.5,0.5)cv.Position=UDim2.new(0.5,0,0.5,0)
cv.Size=UDim2.new(1.4,0,1.4,0)cv.BackgroundColor3=Color3.fromRGB(255,255,255)
cv.BackgroundTransparency=0 cv.BorderSizePixel=0 cv.Parent=cu
local cw=Instance.new"UIGradient"cw.Rotation=25
cw.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,cr.Accent),
ColorSequenceKeypoint.new(1,cr.Accent2 or cr.Accent)}
cw.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
cw.Parent=cv
table.insert(b2._gradients,cw)
task.spawn(function()
while ct.Parent do
b8(cw,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not ct.Parent then break end
b8(cw,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local cv=Instance.new"CanvasGroup"
cv.Name="Main"cv.AnchorPoint=Vector2.new(0.5,0.5)
cv.Position=UDim2.new(0.5,0,0.5,0)cv.Size=UDim2.fromOffset(620,440)
cv.BackgroundColor3=cr.Surface
cv.BackgroundTransparency=(cq and not cl._transparent)and 0.08 or 0
cv.GroupTransparency=1 cv.BorderSizePixel=0 cv.Parent=ct
cc(cv,cm.Radius or 12)cd(cv,true)cg(cv)ch(cv,0.5,48)
local cw=Instance.new"UIScale"cw.Scale=0.94 cw.Parent=cv





local function brandInto(cx,cy)
if cm.Logo and cm.Logo~=""then
local cz=Instance.new"ImageLabel"cz.BackgroundTransparency=1
cz.AnchorPoint=Vector2.new(0.5,0.5)cz.Position=UDim2.new(0.5,0,0.5,0)
cz.Size=UDim2.new(1,-8,1,-8)cz.Image=cm.Logo
cz.ScaleType=Enum.ScaleType.Fit cz.Parent=cx
cc(cz,8)
if cy then cy.Visible=false end
return cz
end
return nil
end


local function kronosFace(cx,cy,cz,cA)
local cB=cz or 26
local cC=Instance.new"Frame"cC.Name="_disc"
cC.AnchorPoint=Vector2.new(0.5,0.5)cC.Position=UDim2.new(0.5,0,0.5,0)
cC.Size=UDim2.fromOffset(cB,cB)cC.BackgroundColor3=Color3.fromRGB(0,0,0)
cC.BorderSizePixel=0 cC.Parent=cx
local cD=Instance.new"UICorner"cD.CornerRadius=UDim.new(0.5,0)cD.Parent=cC
local N=Instance.new"UIStroke"N.Thickness=2
N.Color=Color3.fromRGB(255,255,255)N.Transparency=0.12 N.Parent=cC
pcall(function()
local cE=Instance.new"UIShadow"cE.Color=Color3.fromRGB(255,255,255)
cE.Transparency=0.82 cE.BlurSize=10 cE.Parent=cC
end)
if cy then
cy.AnchorPoint=Vector2.new(0.5,0.5)cy.Position=UDim2.new(0.5,0,0.5,0)
cy.Size=UDim2.fromOffset(cB,cB)cy.TextSize=cA or 16
cy.ZIndex=2
end
return cC
end
local cx=cm.Intro
if cx==nil then cx=true end
local function playEntrance()
b2:_sfx"Open"
b8(cv,b5.Slow,{GroupTransparency=0})
b8(cw,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1})
end
if cx then
local cy=Instance.new"TextButton"cy.Text=""cy.AutoButtonColor=false
cy.Size=UDim2.fromScale(1,1)cy.BackgroundColor3=Color3.fromRGB(4,5,8)
cy.BackgroundTransparency=0 cy.ZIndex=300 cy.Parent=ct
local cz=Instance.new"Frame"cz.AnchorPoint=Vector2.new(0.5,0.5)
cz.Position=UDim2.new(0.5,0,0.5,-30)cz.Size=UDim2.fromOffset(64,64)
cz.BackgroundColor3=cr.Surface2 cz.BorderSizePixel=0
cc(cz,18)cz.Parent=cy
cd(cz,true)
b2:_tag(cz,"BackgroundColor3","Surface2")
local cA=Instance.new"TextLabel"cA.Size=UDim2.fromScale(1,1)
cA.BackgroundTransparency=1 cA.Font=Enum.Font.GothamBlack
cA.TextSize=30 b2:_tag(cA,"TextColor3","Text")cA.Text="K"cA.Parent=cz
local cB=Instance.new"Frame"cB.Size=UDim2.fromOffset(12,12)
cB.Position=UDim2.new(1,-8,0,-5)cB.BorderSizePixel=0
b2:_tag(cB,"BackgroundColor3","Accent")
cc(cB,99)cB.Parent=cz
brandInto(cz,cA)
if not cm.Logo or cm.Logo==""then kronosFace(cz,cA,48,28)end
local cC=Instance.new"TextLabel"cC.BackgroundTransparency=1
cC.AnchorPoint=Vector2.new(0.5,0)cC.Position=UDim2.new(0.5,0,0.5,16)
cC.Size=UDim2.new(0,300,0,22)cC.Font=Enum.Font.GothamBold
cC.TextSize=15 b2:_tag(cC,"TextColor3","Text")
cC.Text="K R O N O S"cC.Parent=cy
local cD=Instance.new"Frame"cD.AnchorPoint=Vector2.new(0.5,0)
cD.Position=UDim2.new(0.5,0,0.5,44)cD.Size=UDim2.new(0,180,0,2)
cD.BackgroundColor3=cr.Surface2 cD.BorderSizePixel=0
cc(cD,99)cD.Parent=cy
b2:_tag(cD,"BackgroundColor3","Surface2")
local cE=Instance.new"Frame"cE.Size=UDim2.new(0,0,1,0)
cE.BorderSizePixel=0 cc(cE,99)cE.Parent=cD
b2:agrad(cE,0)
local N=Instance.new"UIScale"N.Scale=0.8 N.Parent=cz
b8(N,b5.Spring,{Scale=1})
b8(cE,TweenInfo.new(1.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Size=UDim2.new(1,0,1,0)})
local cF=false
cy.MouseButton1Click:Connect(function()
if cF then return end cF=true
pcall(function()cy:Destroy()end)playEntrance()
end)
task.delay(1.35,function()
if cF then return end cF=true
b8(cy,b5.Med,{BackgroundTransparency=1})
for cG,cH in ipairs(cy:GetDescendants())do
pcall(function()
if cH:IsA"TextLabel"then b8(cH,b5.Fast,{TextTransparency=1})end
end)
end
task.delay(0.25,function()pcall(function()cy:Destroy()end)end)
playEntrance()
end)
else
playEntrance()
end


local cy=Instance.new"Frame"
cy.Size=UDim2.new(1,-24,0,2)cy.Position=UDim2.new(0,12,0,0)
cy.BackgroundTransparency=1 cy.Parent=cv
local cz=Instance.new"Frame"cz.Size=UDim2.new(0,0,1,0)
cc(cz,99)cz.Parent=cy
b2:agrad(cz,0)
b8(cz,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()cy:Destroy()end)end)


local cA=Instance.new"Frame"
cA.Name="Header"cA.Size=UDim2.new(1,0,0,62)
cA.BackgroundTransparency=1 cA.Parent=cv
ce(cA,14,6,14,14)


local cB=Instance.new"Frame"cB.Name="Mark"
cB.Size=UDim2.fromOffset(36,36)cB.BackgroundColor3=cr.Surface2
cB.BorderSizePixel=0 cc(cB,10)cB.Parent=cA
cd(cB,true)
local cC=Instance.new"TextLabel"cC.Size=UDim2.fromScale(1,1)
cC.BackgroundTransparency=1 cC.Font=Enum.Font.GothamBlack
cC.TextSize=18 cl:_tag(cC,"TextColor3","Text")cC.Text="K"cC.Parent=cB
local cD=Instance.new"Frame"cD.Size=UDim2.fromOffset(8,8)
cD.Position=UDim2.new(1,-5,0,-3)cD.BorderSizePixel=0
cl:_tag(cD,"BackgroundColor3","Accent")
cc(cD,99)cD.Parent=cB
brandInto(cB,cC)
if not cm.Logo or cm.Logo==""then kronosFace(cB,cC,26,15)end

local cE=Instance.new"TextLabel"cE.BackgroundTransparency=1
cE.Position=UDim2.new(0,48,0,0)cE.Size=UDim2.new(0,230,0,20)
cE.Font=Enum.Font.GothamBold cE.TextSize=15 cE.TextXAlignment=0
cl:_tag(cE,"TextColor3","Text")cE.Text=cn cE.Parent=cA
local cF=Instance.new"TextLabel"cF.BackgroundTransparency=1
cF.Position=UDim2.new(0,48,0,21)cF.Size=UDim2.new(0,230,0,15)
cF.Font=Enum.Font.Gotham cF.TextSize=11 cE.TextXAlignment=0
cF.TextXAlignment=0 cl:_tag(cF,"TextColor3","Dim")
cF.Text=string.upper(co).."  â€¢  V"..cl.Version cF.Parent=cA


local cG=Instance.new"Frame"
cG.AnchorPoint=Vector2.new(1,0)cG.Position=UDim2.new(1,-64,0,4)
cG.Size=UDim2.new(0,170,0,32)cG.BackgroundColor3=cr.Bg
cG.BorderSizePixel=0 cc(cG,8)cG.Parent=cA
cd(cG,true)
local cH=cj("search",14,cr.Dim)
cH.Position=UDim2.new(0,9,0.5,-7)cH.Parent=cG
local N=Instance.new"TextBox"N.PlaceholderText="Search"
N.PlaceholderColor3=cr.Dim N.Text=""N.Font=Enum.Font.GothamBold
N.TextSize=12 cl:_tag(N,"TextColor3","Text")
N.Position=UDim2.new(0,28,0,0)N.Size=UDim2.new(1,-80,1,0)
N.BackgroundTransparency=1 N.ClearTextOnFocus=false N.Parent=cG
local cI=Instance.new"TextLabel"cI.BackgroundTransparency=1
cI.AnchorPoint=Vector2.new(1,0.5)cI.Position=UDim2.new(1,-8,0.5,0)
cI.Size=UDim2.new(0,44,0,18)cI.Font=Enum.Font.Code cI.TextSize=11
cl:_tag(cI,"TextColor3","Text")cI.Text="Ctrl K"cI.Parent=cG
cl:_tag(cG,"BackgroundColor3","Bg")


local cJ=Instance.new"TextButton"cJ.Text=""
cJ.AnchorPoint=Vector2.new(1,0)cJ.Position=UDim2.new(1,-242,0,4)
cJ.Size=UDim2.fromOffset(32,32)cJ.BackgroundColor3=cr.Bg
cJ.BorderSizePixel=0 cc(cJ,8)cJ.Parent=cA
cd(cJ,true)
cl:_tag(cJ,"BackgroundColor3","Bg")
local cK=cj("keyboard",15,cr.Dim)
cK.AnchorPoint=Vector2.new(0.5,0.5)cK.Position=UDim2.new(0.5,0,0.5,0)
cK.Parent=cJ
cJ.MouseButton1Click:Connect(function()end)

local cL=Instance.new"TextButton"cL.Text=""
cL.AnchorPoint=Vector2.new(1,0)cL.Position=UDim2.new(1,-282,0,4)
cL.Size=UDim2.fromOffset(32,32)cL.BackgroundColor3=cr.Bg
cL.BorderSizePixel=0 cc(cL,8)cL.Parent=cA
cd(cL,true)
cl:_tag(cL,"BackgroundColor3","Bg")
local cM=cj("menu",15,cr.Dim)
cM.AnchorPoint=Vector2.new(0.5,0.5)cM.Position=UDim2.new(0.5,0,0.5,0)
cM.Parent=cL
cL.MouseButton1Click:Connect(function()end)


local cN=Instance.new"Frame"cN.BackgroundTransparency=1
cN.AnchorPoint=Vector2.new(1,0)cN.Position=UDim2.new(1,0,0,4)
cN.Size=UDim2.new(0,56,0,32)cN.Parent=cA
local cO=Instance.new"UIListLayout"cO.FillDirection=Enum.FillDirection.Horizontal
cO.VerticalAlignment=Enum.VerticalAlignment.Center
cO.HorizontalAlignment=Enum.HorizontalAlignment.Center
cO.Padding=UDim.new(0,7)cO.Parent=cN
local function dot(cP,cQ)
local cR=Instance.new"TextButton"cR.Text=""
cR.Size=UDim2.fromOffset(12,12)cR.BackgroundColor3=cP
cR.BorderSizePixel=0 cc(cR,99)cR.AutoButtonColor=false cR.Parent=cN
cR.MouseEnter:Connect(function()b8(cR,b5.Hover,{BackgroundTransparency=0.25})end)
cR.MouseLeave:Connect(function()b8(cR,b5.Hover,{BackgroundTransparency=0})end)
return cR
end
local cP=dot(Color3.fromRGB(39,201,63))
local cQ=dot(Color3.fromRGB(255,189,46))
local cR=dot(Color3.fromRGB(255,95,86))
cR.MouseButton1Click:Connect(function()end)
cQ.MouseButton1Click:Connect(function()end)
cP.MouseButton1Click:Connect(function()end)


local cS=Instance.new"TextButton"cS.Text=""
cS.AnchorPoint=Vector2.new(1,0)cS.Position=UDim2.new(1,-322,0,4)
cS.Size=UDim2.fromOffset(32,32)cS.BackgroundColor3=cr.Bg
cS.BorderSizePixel=0 cc(cS,8)cS.Parent=cA
cd(cS,true)
cl:_tag(cS,"BackgroundColor3","Bg")
local cT=cj("bellring",14,cr.Dim)
cT.AnchorPoint=Vector2.new(0.5,0.5)cT.Position=UDim2.new(0.5,0,0.5,0)
cT.Parent=cS
local cU=Instance.new"Frame"cU.Size=UDim2.fromOffset(8,8)
cU.Position=UDim2.new(1,-7,0,3)cU.BorderSizePixel=0
cU.BackgroundColor3=Color3.fromRGB(248,113,113)
cc(cU,99)cU.Parent=cS cU.Visible=false
cS.MouseButton1Click:Connect(function()end)

ci(cA,cv)


local cV=Instance.new"Frame"cV.Name="Body"
cV.Position=UDim2.new(0,0,0,62)cV.Size=UDim2.new(1,0,1,-62)
cV.BackgroundTransparency=1 cV.Parent=cv
local cW=Instance.new"UIPadding"cW.PaddingLeft=UDim.new(0,12)
cW.PaddingRight=UDim.new(0,12)cW.PaddingBottom=UDim.new(0,12)cW.Parent=cV

local cX=Instance.new"Frame"cX.Name="Sidebar"
cX.Size=UDim2.new(0,164,1,0)cX.BackgroundColor3=cr.Bg
cX.BackgroundTransparency=(cq and not cl._transparent)and 0.15 or 0
cX.BorderSizePixel=0 cc(cX,10)cX.Parent=cV
cd(cX,true)
cl:_tag(cX,"BackgroundColor3","Bg")
cf(cX,10)
ce(cX,8,8,8,8)

local cY=Instance.new"Frame"cY.Name="Nav"
cY.Size=UDim2.new(1,0,1,0)cY.BackgroundTransparency=1 cY.Parent=cX
local cZ=Instance.new"UIListLayout"cZ.Padding=UDim.new(0,4)
cZ.SortOrder=Enum.SortOrder.LayoutOrder cZ.Parent=cY




local c_=Instance.new"Frame"c_.Name="_pill"
c_.Size=UDim2.new(1,0,0,38)c_.Position=UDim2.new(0,0,0,-2)
c_.BackgroundColor3=cr.Surface2 c_.BorderSizePixel=0
cc(c_,8)c_.Parent=cX
cd(c_,true)
cl:_tag(c_,"BackgroundColor3","Surface2")

local c0=Instance.new"Frame"c0.Name="Pages"
c0.Position=UDim2.new(0,176,0,0)c0.Size=UDim2.new(1,-176,1,0)
c0.BackgroundTransparency=1 c0.ClipsDescendants=true c0.Parent=cV

local c1={
_gui=ct,_main=cv,_side=cX,_nav=cY,_pages=c0,_pill=c_,
_tabs={},_active=nil,_toggleKey=cp,_visible=true,_keybinds={},
_conns={},_acrylicPref=cq,
}

function c1.Track(c2,c3)table.insert(c2._conns,c3)return c3 end
local c2
local c3
local c4,c5
c1._cfgTitle=cn

function c1._activateTab(c6,c7)
if c6 and c6._activate then pcall(c6._activate,c7~=false)end
end

function c1._flash(c6,c7)
if not c7 or not c7.Parent then return end
local c8=Instance.new"Frame"c8.Name="_flash"
c8.Size=UDim2.fromScale(1,1)c8.BackgroundColor3=cr.Accent
c8.BackgroundTransparency=0.75 c8.BorderSizePixel=0
cc(c8,10)c8.Parent=c7
b8(c8,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()c8:Destroy()end)end)
end

c1:Track(ck.InputBegan:Connect(function(c6,c7)
if c7 then return end
if c6.KeyCode==c1._toggleKey then c1:Toggle()end
if c6.KeyCode==Enum.KeyCode.K and ck:IsKeyDown(Enum.KeyCode.LeftControl)then
c1:TogglePalette()
end
if c6.KeyCode==Enum.KeyCode.P and ck:IsKeyDown(Enum.KeyCode.LeftControl)then
c1:TogglePalette()
end
if c6.KeyCode==Enum.KeyCode.Tab and ck:IsKeyDown(Enum.KeyCode.LeftControl)then
local c8=table.find(c1._tabs,c1._active)or 0
local c9=c1._tabs[(c8%#c1._tabs)+1]
if c9 then b2:_sfx"Swap"c1._activateTab(c9,true)end
end
end))

N:GetPropertyChangedSignal"Text":Connect(function()
local c6=string.lower(N.Text)
for c7,c8 in ipairs(c1._tabs)do
local c9=c6==""or string.find(string.lower(c8.Title),c6,1,true)~=nil
for da,db in ipairs(c8.Elements)do
local dc=c6==""or(db.Title and string.find(string.lower(db.Title),c6,1,true)~=nil)
db._searchVisible=dc or c9
if db.Frame then db.Frame.Visible=db._searchVisible end
end
c8.Button.Visible=(c9 or c6=="")
if c6~=""then

for da,db in ipairs(c8.Elements)do
if db.Frame and db.Frame.Visible then c8.Button.Visible=true break end
end
end
end
end)
N.Focused:Connect(function()b8(cG,b5.Hover,{Size=UDim2.new(0,190,0,32)})end)
N.FocusLost:Connect(function()b8(cG,b5.Hover,{Size=UDim2.new(0,170,0,32)})end)

function c1.SetVisible(c6,c7)
c6._visible=c7

local function pillTarget()
local c8,c9=ct.AbsoluteSize.X,ct.AbsoluteSize.Y
if c8<1 then c8,c9=1200,800 end
local da,db=c2.AbsolutePosition,c2.AbsoluteSize
return UDim2.new(0,da.X+db.X/2-c8/2,0,da.Y+db.Y/2-c9/2)
end
if c7 then
ct.Enabled=true
c6._mini=false
if c4 then c4.Visible=false end
if c2 then c2.Visible=false end
cv.Position=pillTarget()
cw.Scale=0.55
cv.GroupTransparency=1
cu.BackgroundTransparency=1
if c6._acrylicPref then b2:SetAcrylic(true,cm.Blur or 16)end
b2:_sfx"Open"
b8(cv,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
b8(cw,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1})
b8(cu,b5.Med,{BackgroundTransparency=0.5})
else
c6._mini=false
if c4 then c4.Visible=false end
b2:SetAcrylic(false)
for c8,c9 in pairs(b2.Sound._cache)do pcall(function()c9:Stop()end)end
b8(cv,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
b8(cw,b5.Fast,{Scale=0.55})
b8(cu,b5.Fast,{BackgroundTransparency=1})
task.delay(0.36,function()
if c6._visible then return end
ct.Enabled=false
if c2 then
c2.Visible=true
c3.Scale=0.5
b8(c3,b5.Spring,{Scale=1})
end
end)
end
end
function c1.Toggle(c6)c6:SetVisible(not c6._visible)end

function c1.SetMini(c6,c7)
c7=c7 and true or false
if c7==c6._mini then return end
c6._mini=c7
if c7 then
c6._visible=false
c2.Visible=false
b2:SetAcrylic(false)
for c8,c9 in pairs(b2.Sound._cache)do pcall(function()c9:Stop()end)end
b8(cv,b5.Fast,{GroupTransparency=1})
b8(cw,b5.Fast,{Scale=0.7})
b8(cu,b5.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()
if not c6._mini then return end
ct.Enabled=false
c4.Visible=true
c5.Scale=0.5
b8(c5,b5.Spring,{Scale=1})
end)
else
c4.Visible=false
c6:SetVisible(true)
end
end


local c6=Instance.new"UIScale"c6.Parent=cv
local c7=Instance.new"UIScale"c7.Scale=1 c7.Parent=cv
c1._sbMode=0
c1._focus=false
function c1._applyLayout(c8)
local c9=c8._focus and 2 or c8._sbMode
local da=c9==1
cX.Visible=c9~=2
if c9==0 then
b8(cX,b5.Fast,{Size=UDim2.new(0,164,1,0)})
c0.Position=UDim2.new(0,176,0,0)
c0.Size=UDim2.new(1,-176,1,0)
elseif c9==1 then
b8(cX,b5.Fast,{Size=UDim2.new(0,58,1,0)})
c0.Position=UDim2.new(0,70,0,0)
c0.Size=UDim2.new(1,-70,1,0)
else
c0.Position=UDim2.new(0,0,0,0)
c0.Size=UDim2.new(1,0,1,0)
end
for db,dc in ipairs(c8._tabs)do
if dc._label then dc._label.Visible=not da end
if dc._icon and dc._icon:IsA"GuiObject"then
dc._icon.Position=da and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end
end
function c1.CycleSidebar(c8)
c8._sbMode=(c8._sbMode+1)%3
c8:_applyLayout()
c8:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[c8._sbMode+1],Duration=1.5}
end
function c1.SetFocus(c8,c9)
c8._focus=c9 and true or false
c8:_applyLayout()
end
local function fitCard()
local c8=Vector2.new(1200,800)
pcall(function()c8=workspace.CurrentCamera.ViewportSize end)
local c9=math.clamp(math.min(c8.X/700,c8.Y/520),0.6,1)
c6.Scale=c9
if c8.X<760 or ck.TouchEnabled then
if c1._sbMode==0 and not c1._userToggledSide then
c1._sbMode=2 c1:_applyLayout()
end
end
end
cL.MouseButton1Click:Connect(function()
b2:_sfx"Click"
c1._userToggledSide=true
c1:CycleSidebar()
end)
cJ.MouseButton1Click:Connect(function()
b2:_sfx"Click"c1:ToggleKeybindList()
end)
cR.MouseButton1Click:Connect(function()
b2:_sfx"Click"c1:SetVisible(false)
end)
cQ.MouseButton1Click:Connect(function()
b2:_sfx"Click"c1:SetMini(not c1._mini)
end)
c1._zoomed=false
cP.MouseButton1Click:Connect(function()
b2:_sfx"Click"
c1._zoomed=not c1._zoomed
b8(cv,b5.Med,{Size=c1._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
cS.MouseButton1Click:Connect(function()
b2:_sfx"Click"c1:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
c1:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

c2=Instance.new"TextButton"c2.Name=ad.GetStealthName()
c2.Text=""
c2.AnchorPoint=Vector2.new(0,0.5)c2.Position=UDim2.new(0,12,0.5,0)
c2.Size=UDim2.fromOffset(42,42)
c2.BackgroundColor3=cr.Surface2 c2.BorderSizePixel=0
cl:_tag(c2,"BackgroundColor3","Surface2")
cc(c2,13)c2.Parent=ct c2.Visible=false
cd(c2,true)
ch(c2,0.6,20)

local c8=Instance.new"TextLabel"c8.Size=UDim2.fromScale(1,1)
c8.BackgroundTransparency=1 c8.Font=Enum.Font.GothamBlack
c8.TextSize=20 c8.Text="K"c8.Parent=c2
cl:_tag(c8,"TextColor3","Text")
local c9=Instance.new"Frame"c9.Size=UDim2.fromOffset(9,9)
c9.Position=UDim2.new(1,-6,0,-3)c9.BorderSizePixel=0
cl:_tag(c9,"BackgroundColor3","Accent")
cc(c9,99)c9.Parent=c2
brandInto(c2,c8)
if not cm.Logo or cm.Logo==""then kronosFace(c2,c8,32,17)end
c3=Instance.new"UIScale"c3.Parent=c2
ci(c2,c2)
c2.MouseButton1Click:Connect(function()c1:SetVisible(true)end)


c4=Instance.new"TextButton"c4.Name=ad.GetStealthName()
c4.Text=""
c4.AnchorPoint=Vector2.new(0,0)c4.Position=UDim2.new(0,12,0,12)
c4.Size=UDim2.fromOffset(44,44)
c4.BackgroundColor3=cr.Surface2 c4.BorderSizePixel=0
cl:_tag(c4,"BackgroundColor3","Surface2")
cc(c4,13)c4.Parent=cs c4.Visible=false
cd(c4,true)
ch(c4,0.6,20)
local da=Instance.new"TextLabel"da.Size=UDim2.fromScale(1,1)
da.BackgroundTransparency=1 da.Font=Enum.Font.GothamBlack
da.TextSize=20 da.Text="K"da.Parent=c4
cl:_tag(da,"TextColor3","Text")
local db=Instance.new"Frame"db.Size=UDim2.fromOffset(9,9)
db.Position=UDim2.new(1,-6,0,-3)db.BorderSizePixel=0
cl:_tag(db,"BackgroundColor3","Accent")
cc(db,99)db.Parent=c4
brandInto(c4,da)
if not cm.Logo or cm.Logo==""then kronosFace(c4,da,34,17)end
c5=Instance.new"UIScale"c5.Parent=c4
ci(c4,c4)
c4.MouseButton1Click:Connect(function()c1:SetMini(false)end)


local dc=Instance.new"TextButton"dc.Text=""
dc.AnchorPoint=Vector2.new(1,1)dc.Position=UDim2.new(1,0,1,0)
dc.Size=UDim2.fromOffset(28,28)dc.BackgroundTransparency=1
dc.Parent=cv dc.ZIndex=50
dc.ClipsDescendants=true


local dd=0
dc.MouseButton1Click:Connect(function()
local de=os.clock()
if de-dd<0.35 then
b2:_sfx"Click"
c1._zoomed=not c1._zoomed
b8(cv,b5.Med,{Size=c1._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
dd=de
end)
local de,df,dg=false
dc.InputBegan:Connect(function(dh)
if dh.UserInputType==Enum.UserInputType.MouseButton1 or dh.UserInputType==Enum.UserInputType.Touch then
de,df,dg=true,dh.Position,cv.Size
dh.Changed:Connect(function()
if dh.UserInputState==Enum.UserInputState.End then de=false end
end)
end
end)
c1:Track(ck.InputChanged:Connect(function(dh)
if not de then return end
if dh.UserInputType~=Enum.UserInputType.MouseMovement
and dh.UserInputType~=Enum.UserInputType.Touch then return end
local di=dh.Position-df
cv.Size=UDim2.fromOffset(
math.clamp(dg.X.Offset+di.X,520,920),
math.clamp(dg.Y.Offset+di.Y,380,660))
end))

function c1.Notify(dh,di)
di=di or{}
b2:_sfx"Notify"
table.insert(b2._inbox,1,{Title=di.Title or"Kronos",
Content=di.Content or di.Text or"",At=os.date"%H:%M"})
while#b2._inbox>30 do table.remove(b2._inbox)end
pcall(function()cU.Visible=true end)
local dj=ensureNotifyHost(ct)
local dk=Instance.new"CanvasGroup"dk.Size=UDim2.new(1,0,0,62)
dk.BackgroundColor3=cr.Surface2 dk.BorderSizePixel=0 dk.GroupTransparency=1
cc(dk,10)dk.Parent=dj
cd(dk,true)
ch(dk,0.65,24)
b2:_tag(dk,"BackgroundColor3","Surface2")
dk.Position=UDim2.new(0,40,0,0)
b8(dk,b5.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local dl=Instance.new"TextLabel"dl.BackgroundTransparency=1
dl.Position=UDim2.new(0,12,0,8)dl.Size=UDim2.new(1,-24,0,17)
dl.Font=Enum.Font.GothamBold dl.TextSize=13 dl.TextXAlignment=0
b2:_tag(dl,"TextColor3","Text")dl.Text=di.Title or"Kronos"dl.Parent=dk
local dm=Instance.new"TextLabel"dm.BackgroundTransparency=1
dm.Position=UDim2.new(0,12,0,27)dm.Size=UDim2.new(1,-24,0,16)
dm.Font=Enum.Font.Gotham dm.TextSize=12 dm.TextXAlignment=0
b2:_tag(dm,"TextColor3","Dim")
dm.TextTruncate=Enum.TextTruncate.AtEnd dm.Text=di.Content or di.Text or""dm.Parent=dk
local dn=Instance.new"Frame"dn.AnchorPoint=Vector2.new(0,1)
dn.Position=UDim2.new(0,10,1,-6)dn.Size=UDim2.new(1,-20,0,2)
dn.BorderSizePixel=0 b2:agrad(dn,0)
cc(dn,99)dn.Parent=dk
local dp=di.Duration or 4
b8(dn,TweenInfo.new(dp,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(dp+0.1,function()
b8(dk,b5.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()dk:Destroy()end)end)
end)
end


function c1.Dialog(dh,di)
di=di or{}
b2:_sfx"Open"
local dj=Instance.new"TextButton"dj.Text=""dj.AutoButtonColor=false
dj.Size=UDim2.fromScale(1,1)dj.BackgroundColor3=Color3.fromRGB(0,0,0)
dj.BackgroundTransparency=1 dj.Parent=ct
b8(dj,b5.Med,{BackgroundTransparency=0.55})
local dk=Instance.new"CanvasGroup"dk.AnchorPoint=Vector2.new(0.5,0.5)
dk.Position=UDim2.new(0.5,0,0.5,0)dk.Size=UDim2.fromOffset(320,170)
dk.BackgroundColor3=cr.Surface dk.BorderSizePixel=0 dk.GroupTransparency=1
cc(dk,12)dk.Parent=dj
cd(dk,true)
cf(dk,12)
ch(dk,0.5,40)
b2:_tag(dk,"BackgroundColor3","Surface")
local dl=Instance.new"UIScale"dl.Scale=0.94 dl.Parent=dk
b8(dk,b5.Med,{GroupTransparency=0})
b8(dl,b5.Spring,{Scale=1})
local function close()
b8(dk,b5.Fast,{GroupTransparency=1})
b8(dj,b5.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dj:Destroy()end)end)
end
dj.MouseButton1Click:Connect(function()end)
local dm=Instance.new"TextLabel"dm.BackgroundTransparency=1
dm.Position=UDim2.new(0,16,0,14)dm.Size=UDim2.new(1,-32,0,20)
dm.Font=Enum.Font.GothamBold dm.TextSize=15 dm.TextXAlignment=0
b2:_tag(dm,"TextColor3","Text")dm.Text=di.Title or"Confirm"dm.Parent=dk
local dn=Instance.new"TextLabel"dn.BackgroundTransparency=1
dn.Position=UDim2.new(0,16,0,38)dn.Size=UDim2.new(1,-32,0,60)
dn.Font=Enum.Font.Gotham dn.TextSize=12 dm.TextXAlignment=0
dn.TextXAlignment=0 dn.TextYAlignment=0 dn.TextWrapped=true
b2:_tag(dn,"TextColor3","Dim")dn.Text=di.Content or""dn.Parent=dk
local dp=Instance.new"Frame"dp.BackgroundTransparency=1
dp.AnchorPoint=Vector2.new(0,1)dp.Position=UDim2.new(0,0,1,-12)
dp.Size=UDim2.new(1,0,0,34)dp.Parent=dk
local dq=Instance.new"UIListLayout"dq.FillDirection=Enum.FillDirection.Horizontal
dq.HorizontalAlignment=Enum.HorizontalAlignment.Right dq.Padding=UDim.new(0,8)dq.Parent=dp
ce(dp,0,0,12,12)
for dr,ds in ipairs(di.Buttons or{{Title="OK"}})do
local dt=Instance.new"TextButton"dt.Text=""
dt.Size=UDim2.new(0,96,0,30)dt.BackgroundColor3=cr.Surface2
dt.BorderSizePixel=0 cc(dt,7)dt.AutoButtonColor=false dt.Parent=dp
cd(dt,true)
b2:_tag(dt,"BackgroundColor3","Surface2")
local du=Instance.new"TextLabel"du.BackgroundTransparency=1 du.Size=UDim2.fromScale(1,1)
du.Font=Enum.Font.GothamBold du.TextSize=12
b2:_tag(du,"TextColor3","Text")du.Text=ds.Title du.Parent=dt
local dv=Instance.new"UIScale"dv.Parent=dt
dt.MouseButton1Down:Connect(function()b8(dv,b5.Hover,{Scale=0.95})end)
dt.MouseButton1Up:Connect(function()b8(dv,b5.Spring,{Scale=1})end)
dt.MouseButton1Click:Connect(function()
close()cb(ds.Callback)
end)
end
return{Close=close}
end




function c1.KeySystem(dh,di)
di=di or{}
local dj,dk=false,di.FileName or("kronos_key_"..tostring(cn))

if di.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(dk..".txt")then
local dl=readfile(dk..".txt")
if dl and dh:_checkKey(di,dl)then dj=true end
end
end)
end
local dl=Instance.new"TextButton"dl.Text=""dl.AutoButtonColor=false
dl.Size=UDim2.fromScale(1,1)dl.BackgroundColor3=Color3.fromRGB(0,0,0)
dl.BackgroundTransparency=1 dl.ZIndex=200 dl.Parent=ct
b8(dl,b5.Med,{BackgroundTransparency=0.6})
local dm=Instance.new"CanvasGroup"dm.AnchorPoint=Vector2.new(0.5,0.5)
dm.Position=UDim2.new(0.5,0,0.5,0)dm.Size=UDim2.fromOffset(300,210)
dm.BackgroundColor3=cr.Surface dm.BorderSizePixel=0 dm.GroupTransparency=1
cc(dm,12)dm.Parent=dl
cd(dm,true)
cf(dm,12)
ch(dm,0.5,40)
b2:_tag(dm,"BackgroundColor3","Surface")
local dn=Instance.new"UIScale"dn.Scale=0.94 dn.Parent=dm
b8(dm,b5.Med,{GroupTransparency=0})
b8(dn,b5.Spring,{Scale=1})
local dp=Instance.new"TextLabel"dp.BackgroundTransparency=1
dp.Position=UDim2.new(0,16,0,14)dp.Size=UDim2.new(1,-32,0,20)
dp.Font=Enum.Font.GothamBold dp.TextSize=15 dp.TextXAlignment=0
b2:_tag(dp,"TextColor3","Text")dp.Text=di.Title or"Enter Key"dp.Parent=dm
local dq=Instance.new"TextLabel"dq.BackgroundTransparency=1
dq.Position=UDim2.new(0,16,0,36)dq.Size=UDim2.new(1,-32,0,15)
dq.Font=Enum.Font.Gotham dq.TextSize=11 dp.TextXAlignment=0 dq.TextXAlignment=0
b2:_tag(dq,"TextColor3","Dim")dq.Text=string.upper(di.Subtitle or"key required")dq.Parent=dm
local dr=Instance.new"TextBox"dr.PlaceholderText="Paste key..."
dr.PlaceholderColor3=cr.Dim dr.Text=""
dr.Font=Enum.Font.Code dr.TextSize=12
dr.Position=UDim2.new(0,16,0,60)dr.Size=UDim2.new(1,-32,0,32)
dr.BackgroundColor3=cr.Surface2 dr.BorderSizePixel=0
cc(dr,8)dr.Parent=dm
ce(dr,4,4,10,10)
cd(dr,true)
b2:_tag(dr,"BackgroundColor3","Surface2")
b2:_tag(dr,"TextColor3","Text")
local ds=Instance.new"TextLabel"ds.BackgroundTransparency=1
ds.Position=UDim2.new(0,16,0,96)ds.Size=UDim2.new(1,-32,0,15)
ds.Font=Enum.Font.Gotham ds.TextSize=11 ds.TextXAlignment=0 ds.Text=""
b2:_tag(ds,"TextColor3","Danger")ds.Parent=dm
local dt=Instance.new"TextButton"dt.Text=""
dt.Position=UDim2.new(0,16,0,118)dt.Size=UDim2.new(1,-32,0,32)
dt.BorderSizePixel=0 cc(dt,8)dt.AutoButtonColor=false dt.Parent=dm
b2:agrad(dt,15)
local du=Instance.new"TextLabel"du.BackgroundTransparency=1 du.Size=UDim2.fromScale(1,1)
du.Font=Enum.Font.GothamBold du.TextSize=13 du.Text="UNLOCK"
b2:oa(du)du.Parent=dt
local dv=Instance.new"UIScale"dv.Parent=dt
local dw
if di.GetKeyLink then
dw=Instance.new"TextButton"dw.Text=""
dw.Position=UDim2.new(0,16,0,156)dw.Size=UDim2.new(1,-32,0,26)
dw.BackgroundTransparency=1 dw.Parent=dm
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1 dx.Size=UDim2.fromScale(1,1)
dx.Font=Enum.Font.Gotham dx.TextSize=11 dx.Text="Copy key link"
b2:_tag(dx,"TextColor3","Dim")dx.Parent=dw
dw.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(di.GetKeyLink)end end)
dx.Text="Link copied"
task.delay(2,function()pcall(function()dx.Text="Copy key link"end)end)
end)
end
local function shake()local dx=
dm.Position.X.Offset
for dy=1,3 do
b8(dm,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
b8(dm,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
b8(dm,b5.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
dj=true
if di.SaveKey~=false then
pcall(function()if writefile then writefile(dk..".txt",dr.Text)end end)
end
b8(dm,b5.Fast,{GroupTransparency=1})
b8(dl,b5.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()dl:Destroy()end)end)
dh:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
cb(di.OnSuccess)
end
local function check()
local dx=dr.Text
if dh:_checkKey(di,dx)then unlock()
else ds.Text="Invalid key."task.spawn(shake)end
end
dt.MouseButton1Down:Connect(function()b8(dv,b5.Hover,{Scale=0.96})end)
dt.MouseButton1Up:Connect(function()b8(dv,b5.Spring,{Scale=1})end)
dt.MouseButton1Click:Connect(check)
dr.FocusLost:Connect(function(dx)if dx then check()end end)
if dj then pcall(function()dl:Destroy()end)cb(di.OnSuccess)end
return{Passed=function()return dj end}
end

function b2._checkKey(dh,di,dj)
if di.Validate and type(di.Validate)=="function"then
local dk,dl=pcall(di.Validate,dj)
if dk and dl then return true end
end
if di.Key and dj==di.Key then return true end
if di.Keys and table.find(di.Keys,dj)then return true end
if not di.Key and not di.Keys and not di.Validate then return true end
return false
end


function c1.TogglePalette(dh,di)
local dj=dh._palette
if not dj then
local dk=Instance.new"TextButton"dk.Text=""dk.AutoButtonColor=false
dk.Size=UDim2.fromScale(1,1)dk.BackgroundColor3=Color3.fromRGB(0,0,0)
dk.BackgroundTransparency=1 dk.Visible=false dk.ZIndex=150 dk.Parent=ct
local dl=Instance.new"Frame"dl.AnchorPoint=Vector2.new(0.5,0)
dl.Position=UDim2.new(0.5,0,0,90)dl.Size=UDim2.fromOffset(380,300)
dl.BackgroundColor3=cr.Bg dl.BorderSizePixel=0
cc(dl,12)dl.Parent=dk
cd(dl,true)
ch(dl,0.5,40)
b2:_tag(dl,"BackgroundColor3","Bg")
local dm=Instance.new"TextBox"dm.PlaceholderText="Type a command..."
dm.PlaceholderColor3=cr.Dim dm.Text=""
dm.Font=Enum.Font.Gotham dm.TextSize=14
dm.Position=UDim2.new(0,14,0,12)dm.Size=UDim2.new(1,-28,0,32)
dm.BackgroundTransparency=1 dm.ClearTextOnFocus=false dm.Parent=dl
b2:_tag(dm,"TextColor3","Text")
local dn=Instance.new"Frame"dn.BorderSizePixel=0
dn.Position=UDim2.new(0,12,0,50)dn.Size=UDim2.new(1,-24,0,1)
dn.BackgroundColor3=Color3.fromRGB(255,255,255)
dn.BackgroundTransparency=0.93 dn.Parent=dl
local dp=Instance.new"ScrollingFrame"
dp.Position=UDim2.new(0,8,0,56)dp.Size=UDim2.new(1,-16,1,-64)
dp.BackgroundTransparency=1 dp.BorderSizePixel=0
dp.ScrollBarThickness=2 dp.CanvasSize=UDim2.new(0,0,0,0)
dp.AutomaticCanvasSize=Enum.AutomaticSize.Y dp.Parent=dl
b2:_tag(dp,"ScrollBarImageColor3","Surface2")
local dq=Instance.new"UIListLayout"dq.Padding=UDim.new(0,2)
dq.SortOrder=Enum.SortOrder.LayoutOrder dq.Parent=dp
dj={ov=dk,card=dl,box=dm,list=dp,open=false,sel=1,rows={}}
dh._palette=dj
local function fuzzy(dr,ds)
dr,ds=string.lower(dr),string.lower(ds)
if dr==""then return 0 end
local dt,du,dv=1,0,0
for dw=1,#ds do
if string.sub(ds,dw,dw)==string.sub(dr,dt,dt)then
du+=(dv==dw-1)and 2 or 1
dv,dt=dw,dt+1
if dt>#dr then return du-dw*0.01 end
end
end
return nil
end
local function run(dr)
if not dr then return end
dj.ov.Visible,dj.open=false,false
b8(dj.ov,b5.Fast,{BackgroundTransparency=1})
if dr.go then pcall(dr.go)end
end
dj._run=run
local function render()
for dr,ds in ipairs(dj.rows)do pcall(function()ds.frame:Destroy()end)end
dj.rows={}
local dr=dm.Text
local ds={}
for dt,du in ipairs(dh._tabs)do
local dv=fuzzy(dr,du.Title)
if dv then table.insert(ds,{label=du.Title,hint="tab",score=dv+100,
go=function()dh._activateTab(du,true)end})end
for dw,dx in ipairs(du.Elements)do
if dx.Title and dx.Frame then
local dy=fuzzy(dr,du.Title.." "..dx.Title)
if dy then table.insert(ds,{label=dx.Title,hint=du.Title,score=dy,
go=dx._go})end
end
end
end
table.sort(ds,function(dt,du)return dt.score>du.score end)
dj.sel=math.clamp(dj.sel,1,math.max(1,math.min(12,#ds)))
if#ds==0 then
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Size=UDim2.new(1,0,0,30)dt.Font=Enum.Font.Gotham
dt.TextSize=12 dt.Text="No results"dt.Parent=dp
b2:_tag(dt,"TextColor3","Dim")
dj.rows={{frame=dt}}
return
end
for dt=1,math.min(12,#ds)do
local du=ds[dt]
local dv=Instance.new"TextButton"dv.Text=""
dv.Size=UDim2.new(1,-4,0,32)dv.BorderSizePixel=0
dv.BackgroundColor3=cr.Surface2
dv.BackgroundTransparency=(dt==dj.sel)and 0.35 or 1
cc(dv,7)dv.Parent=dp
b2:_tag(dv,"BackgroundColor3","Surface2")
local dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.Position=UDim2.new(0,10,0,0)dw.Size=UDim2.new(1,-90,1,0)
dw.Font=Enum.Font.Gotham dw.TextSize=13 dw.TextXAlignment=0
dw.TextTruncate=Enum.TextTruncate.AtEnd dw.Text=du.label dw.Parent=dv
b2:_tag(dw,"TextColor3","Text")
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1
dx.AnchorPoint=Vector2.new(1,0)dx.Position=UDim2.new(1,-10,0,0)
dx.Size=UDim2.new(0,70,1,0)dx.Font=Enum.Font.Gotham
dx.TextSize=10 dx.TextXAlignment=1 dw.TextTruncate=Enum.TextTruncate.AtEnd
dx.Text=du.hint dx.Parent=dv
b2:_tag(dx,"TextColor3","Dim")
local dy=dt
dv.MouseButton1Click:Connect(function()run(du)end)
dv.MouseEnter:Connect(function()
dj.sel=dy render()
end)
table.insert(dj.rows,{frame=dv,item=du})
end
end
dj._render=render
dm:GetPropertyChangedSignal"Text":Connect(function()dj.sel=1 render()end)
dk.MouseButton1Click:Connect(function()
if dj.open then dh:TogglePalette(false)end
end)
dh:Track(ck.InputBegan:Connect(function(dr,ds)
if not dj.open then return end
if dr.KeyCode==Enum.KeyCode.Escape then dh:TogglePalette(false)
elseif dr.KeyCode==Enum.KeyCode.Return or dr.KeyCode==Enum.KeyCode.KeypadEnter then
local dt=dj.rows[dj.sel]
run(dt and dt.item)
elseif dr.KeyCode==Enum.KeyCode.Up then
dj.sel=math.max(1,dj.sel-1)render()
elseif dr.KeyCode==Enum.KeyCode.Down then
dj.sel=math.min(#dj.rows,dj.sel+1)render()
end
end))
end
local dk=(di~=nil)and di or(not dj.open)
dj.open=dk
dj.ov.Visible=dk
if dk then
b2:_sfx"Open"
b8(dj.ov,b5.Med,{BackgroundTransparency=0.45})
dj.card.Position=UDim2.new(0.5,0,0,78)
b8(dj.card,b5.Med,{Position=UDim2.new(0.5,0,0,90)})
dj.box.Text,dj.sel="",1
dj._render()
task.defer(function()pcall(function()dj.box:CaptureFocus()end)end)
else
b8(dj.ov,b5.Fast,{BackgroundTransparency=1})
task.delay(0.15,function()if not dj.open then dj.ov.Visible=false end end)
end
end

function c1.SetTheme(dh,di)b2:SetTheme(di)end

function b2.SetAccent(dh,di)
if typeof(di)~="Color3"then return end
dh.Themes[dh.ThemeName].Accent=di
dh:SetTheme(dh.ThemeName)
end


b2.FontPacks={
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
b2.FontPack="Gotham+"
b2._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function b2._resolveFont(dh,di)
local dj,dk=pcall(function()return Enum.Font[di]end)
if dj and dk then return dk end
return nil
end
function b2._paintFonts(dh,di)
local dj=dh.FontPacks[dh.FontPack]
if not dj then return end
for dk,dl in ipairs(di:GetDescendants())do
if dl:IsA"TextLabel"or dl:IsA"TextButton"or dl:IsA"TextBox"then
local dm=dl:GetAttribute"KronosFontRole"
if not dm then
dm=dh._roleFromDefault[dl.Font]or"Body"
dl:SetAttribute("KronosFontRole",dm)
dl:SetAttribute("KronosBaseSize",dl.TextSize)
end
local dn=dl:GetAttribute"KronosBaseSize"or dl.TextSize
local dp=(dj.Bump and dj.Bump[dm])or 0
local dq=dj[dm]and dh:_resolveFont(dj[dm])or nil
pcall(function()
if dq then dl.Font=dq end
dl.TextSize=math.clamp(dn+dp,8,30)
end)
end
end
end
function b2.SetFontPack(dh,di)
if not dh.FontPacks[di]then return end
dh.FontPack=di
if dh._gui then dh:_paintFonts(dh._gui)end
end
function b2.RefreshFonts(dh)
if dh._gui then dh:_paintFonts(dh._gui)end
end
function c1.SetAccent(dh,di)b2:SetAccent(di)end
function c1.SetScale(dh,di)
c7.Scale=math.clamp(tonumber(di)or 1,0.7,1.25)
end
function c1.SetCompact(dh,di)
di=di and true or false
b8(cv,b5.Med,{Size=di and UDim2.fromOffset(560,400)
or(dh._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))})
for dj,dk in ipairs(dh._tabs)do
if dk._pl then dk._pl.Padding=di and UDim.new(0,4)or UDim.new(0,8)end
end
end
function c1.ToggleAcrylic(dh,di)
b2:ToggleAcrylic(di)
cv.BackgroundTransparency=(di and not b2._transparent)and 0.08 or 0
cX.BackgroundTransparency=(di and not b2._transparent)and 0.15 or 0
end
function c1.ToggleTransparency(dh,di)
b2._transparent=di and true or false
local dj=(b2._acrylicOn and not di)and 0.08 or(di and 0.25 or 0)
cv.BackgroundTransparency=dj
cX.BackgroundTransparency=di and 0.4 or((b2._acrylicOn and not di)and 0.15 or 0)
end


function c1.ToggleInbox(dh,di)
local dj=dh._inboxPanel
if not dj then
local dk=Instance.new"Frame"dk.AnchorPoint=Vector2.new(1,0)
dk.Position=UDim2.new(1,12,0,0)dk.Size=UDim2.new(0,230,1,0)
dk.BackgroundColor3=cr.Bg dk.BorderSizePixel=0
cc(dk,10)dk.Parent=cV dk.Visible=false
cd(dk,true)
b2:_tag(dk,"BackgroundColor3","Bg")
local dl=Instance.new"TextLabel"dl.BackgroundTransparency=1
dl.Position=UDim2.new(0,12,0,10)dl.Size=UDim2.new(1,-70,0,18)
dl.Font=Enum.Font.GothamBold dl.TextSize=11 dl.TextXAlignment=0
dl.Text="INBOX"dl.Parent=dk
b2:_tag(dl,"TextColor3","Dim")
local dm=Instance.new"TextButton"dm.Text=""
dm.AnchorPoint=Vector2.new(1,0)dm.Position=UDim2.new(1,-10,0,10)
dm.Size=UDim2.new(0,52,0,18)dm.BackgroundColor3=cr.Surface2
dm.BorderSizePixel=0 cc(dm,6)dm.AutoButtonColor=false dm.Parent=dk
cd(dm,true)
b2:_tag(dm,"BackgroundColor3","Surface2")
local dn=Instance.new"TextLabel"dn.BackgroundTransparency=1
dn.Size=UDim2.fromScale(1,1)dn.Font=Enum.Font.GothamBold
dn.TextSize=10 dn.Text="CLEAR"dn.Parent=dm
b2:_tag(dn,"TextColor3","Dim")
local dp=Instance.new"ScrollingFrame"
dp.Position=UDim2.new(0,8,0,34)dp.Size=UDim2.new(1,-16,1,-42)
dp.BackgroundTransparency=1 dp.BorderSizePixel=0
dp.ScrollBarThickness=2 dp.CanvasSize=UDim2.new(0,0,0,0)
dp.AutomaticCanvasSize=Enum.AutomaticSize.Y dp.Parent=dk
b2:_tag(dp,"ScrollBarImageColor3","Surface2")
local dq=Instance.new"UIListLayout"dq.Padding=UDim.new(0,4)
dq.SortOrder=Enum.SortOrder.LayoutOrder dq.Parent=dp
dj={panel=dk,list=dp,open=false}
dh._inboxPanel=dj
local function refresh()
for dr,ds in ipairs(dp:GetChildren())do
if ds:IsA"Frame"then pcall(function()ds:Destroy()end)end
end
if#b2._inbox==0 then
local dr=Instance.new"TextLabel"dr.BackgroundTransparency=1
dr.Size=UDim2.new(1,0,0,24)dr.Font=Enum.Font.Gotham
dr.TextSize=11 dr.Text="All caught up."dr.Parent=dp
b2:_tag(dr,"TextColor3","Dim")
return
end
for dr,ds in ipairs(b2._inbox)do
local dt=Instance.new"Frame"
dt.Size=UDim2.new(1,-2,0,44)dt.BackgroundColor3=cr.Surface2
dt.BackgroundTransparency=0.35 dt.BorderSizePixel=0
cc(dt,7)dt.Parent=dp
b2:_tag(dt,"BackgroundColor3","Surface2")
local du=Instance.new"TextLabel"du.BackgroundTransparency=1
du.Position=UDim2.new(0,8,0,4)du.Size=UDim2.new(1,-52,0,15)
du.Font=Enum.Font.GothamBold du.TextSize=11 du.TextXAlignment=0
du.TextTruncate=Enum.TextTruncate.AtEnd du.Text=ds.Title du.Parent=dt
b2:_tag(du,"TextColor3","Text")
local dv=Instance.new"TextLabel"dv.BackgroundTransparency=1
dv.Position=UDim2.new(0,8,0,20)dv.Size=UDim2.new(1,-52,0,18)
dv.Font=Enum.Font.Gotham dv.TextSize=11 dv.TextXAlignment=0
dv.TextTruncate=Enum.TextTruncate.AtEnd dv.Text=ds.Content dv.Parent=dt
b2:_tag(dv,"TextColor3","Dim")
local dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.AnchorPoint=Vector2.new(1,0)dw.Position=UDim2.new(1,-8,0,4)
dw.Size=UDim2.new(0,40,0,14)dw.Font=Enum.Font.Code
dw.TextSize=10 dw.TextXAlignment=1 dw.Text=ds.At dw.Parent=dt
b2:_tag(dw,"TextColor3","Dim")
end
end
dj.refresh=refresh
dm.MouseButton1Click:Connect(function()
b2._inbox={}
refresh()
pcall(function()cU.Visible=false end)
end)
end
local dk=(di~=nil)and di or(not dj.open)
dj.open=dk
if dk then
dj.refresh()
dj.panel.Visible=true
pcall(function()cU.Visible=false end)
b8(dj.panel,b5.Med,{Position=UDim2.new(1,0,0,0)})
else
b8(dj.panel,b5.Med,{Position=UDim2.new(1,12,0,0)})
task.delay(0.26,function()if not dj.open then dj.panel.Visible=false end end)
end
end


function c1.ToggleKeybindList(dh,di)
local dj=dh._kbPanel
if not dj then
local dk=Instance.new"Frame"dk.AnchorPoint=Vector2.new(1,0)
dk.Position=UDim2.new(1,12,0,0)dk.Size=UDim2.new(0,210,1,0)
dk.BackgroundColor3=cr.Bg dk.BorderSizePixel=0
cc(dk,10)dk.Parent=cV dk.Visible=false
cd(dk,true)
b2:_tag(dk,"BackgroundColor3","Bg")
local dl=Instance.new"TextLabel"dl.BackgroundTransparency=1
dl.Position=UDim2.new(0,12,0,10)dl.Size=UDim2.new(1,-24,0,18)
dl.Font=Enum.Font.GothamBold dl.TextSize=11 dl.TextXAlignment=0
dl.Text="KEYBINDS"dl.Parent=dk
b2:_tag(dl,"TextColor3","Dim")
local dm=Instance.new"ScrollingFrame"
dm.Position=UDim2.new(0,8,0,34)dm.Size=UDim2.new(1,-16,1,-42)
dm.BackgroundTransparency=1 dm.BorderSizePixel=0
dm.ScrollBarThickness=2 dm.CanvasSize=UDim2.new(0,0,0,0)
dm.AutomaticCanvasSize=Enum.AutomaticSize.Y dm.Parent=dk
b2:_tag(dm,"ScrollBarImageColor3","Surface2")
local dn=Instance.new"UIListLayout"dn.Padding=UDim.new(0,4)
dn.SortOrder=Enum.SortOrder.LayoutOrder dn.Parent=dm
dj={panel=dk,list=dm,open=false}
dh._kbPanel=dj
local function refresh()
for dp,dq in ipairs(dm:GetChildren())do
if dq:IsA"TextButton"then pcall(function()dq:Destroy()end)end
end
if#dh._keybinds==0 then
local dp=Instance.new"TextLabel"dp.BackgroundTransparency=1
dp.Size=UDim2.new(1,0,0,24)dp.Font=Enum.Font.Gotham
dp.TextSize=11 dp.Text="No keybinds yet"dp.Parent=dm
b2:_tag(dp,"TextColor3","Dim")
return
end
for dp,dq in ipairs(dh._keybinds)do
local dr=Instance.new"TextButton"dr.Text=""
dr.Size=UDim2.new(1,-2,0,30)dr.BackgroundColor3=cr.Surface2
dr.BackgroundTransparency=0.35 dr.BorderSizePixel=0
cc(dr,7)dr.Parent=dm
b2:_tag(dr,"BackgroundColor3","Surface2")
local ds=Instance.new"TextLabel"ds.BackgroundTransparency=1
ds.Position=UDim2.new(0,8,0,0)ds.Size=UDim2.new(1,-70,1,0)
ds.Font=Enum.Font.Gotham ds.TextSize=11 ds.TextXAlignment=0
ds.TextTruncate=Enum.TextTruncate.AtEnd ds.Text=dq.Title ds.Parent=dr
b2:_tag(ds,"TextColor3","Text")
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.AnchorPoint=Vector2.new(1,0)dt.Position=UDim2.new(1,-8,0,0)
dt.Size=UDim2.new(0,56,1,0)dt.Font=Enum.Font.Code
dt.TextSize=10 dt.TextXAlignment=1 dt.Text=dq.GetName()dt.Parent=dr
b2:_tag(dt,"TextColor3","Dim")
dr.MouseButton1Click:Connect(function()
b2:_sfx"Click"dq.Rebind()
task.delay(0.2,function()pcall(function()dt.Text=dq.GetName()end)end)
end)
end
end
dj.refresh=refresh
dh._kbPanelRefresh=refresh
end
local dk=(di~=nil)and di or(not dj.open)
dj.open=dk
if dk then
dj.refresh()
dj.panel.Visible=true
b8(dj.panel,b5.Med,{Position=UDim2.new(1,0,0,0)})
else
b8(dj.panel,b5.Med,{Position=UDim2.new(1,12,0,0)})
task.delay(0.26,function()if not dj.open then dj.panel.Visible=false end end)
end
end


function c1.Onboarding(dh,di)
di=di or{}
local dj=di.Steps or di.Pages or{{Title="Welcome",Content="This is Kronos."}}
local dk=1
local dl=Instance.new"TextButton"dl.Text=""dl.AutoButtonColor=false
dl.Size=UDim2.fromScale(1,1)dl.BackgroundColor3=Color3.fromRGB(0,0,0)
dl.BackgroundTransparency=1 dl.ZIndex=180 dl.Parent=ct
b8(dl,b5.Med,{BackgroundTransparency=0.6})
local dm=Instance.new"CanvasGroup"dm.AnchorPoint=Vector2.new(0.5,0.5)
dm.Position=UDim2.new(0.5,0,0.5,0)dm.Size=UDim2.fromOffset(340,220)
dm.BackgroundColor3=cr.Surface dm.BorderSizePixel=0 dm.GroupTransparency=1
cc(dm,12)dm.Parent=dl
cd(dm,true)
cf(dm,12)
ch(dm,0.5,40)
b2:_tag(dm,"BackgroundColor3","Surface")
local dn=Instance.new"UIScale"dn.Scale=0.94 dn.Parent=dm
b8(dm,b5.Med,{GroupTransparency=0})
b8(dn,b5.Spring,{Scale=1})
local dp=Instance.new"TextLabel"dp.BackgroundTransparency=1
dp.Position=UDim2.new(0,20,0,18)dp.Size=UDim2.new(1,-40,0,24)
dp.Font=Enum.Font.GothamBold dp.TextSize=17 dp.TextXAlignment=0 dp.Parent=dm
b2:_tag(dp,"TextColor3","Text")
local dq=Instance.new"TextLabel"dq.BackgroundTransparency=1
dq.Position=UDim2.new(0,20,0,48)dq.Size=UDim2.new(1,-40,0,90)
dq.Font=Enum.Font.Gotham dq.TextSize=13 dp.TextXAlignment=0
dq.TextXAlignment=0 dq.TextYAlignment=0 dq.TextWrapped=true dq.Parent=dm
b2:_tag(dq,"TextColor3","Dim")
local dr=Instance.new"Frame"dr.BackgroundTransparency=1
dr.AnchorPoint=Vector2.new(0,1)dr.Position=UDim2.new(0,20,1,-52)
dr.Size=UDim2.new(0,120,0,10)dr.Parent=dm
local ds=Instance.new"UIListLayout"ds.FillDirection=Enum.FillDirection.Horizontal
ds.Padding=UDim.new(0,6)ds.Parent=dr
local dt={}
for du=1,#dj do
local dv=Instance.new"Frame"dv.Size=UDim2.fromOffset(8,8)
dv.BorderSizePixel=0 cc(dv,99)dv.Parent=dr
b2:_tag(dv,"BackgroundColor3","Surface2")
dt[du]=dv
end
local du,dv,dw
local function paint()
dp.Text,dq.Text=dj[dk].Title or"",dj[dk].Content or""
for dx,dy in ipairs(dt)do
if dx==dk then b2:_tag(dy,"BackgroundColor3","Accent")
else b2:_tag(dy,"BackgroundColor3","Surface2")end
end
du.Visible=dk>1
dw.Text=(dk==#dj)and"FINISH"or"NEXT"
dp.Position=UDim2.new(0,26,0,18)
b8(dp,b5.Fast,{Position=UDim2.new(0,20,0,18)})
end
local dx=Instance.new"Frame"dx.BackgroundTransparency=1
dx.AnchorPoint=Vector2.new(0,1)dx.Position=UDim2.new(0,0,1,-12)
dx.Size=UDim2.new(1,0,0,34)dx.Parent=dm
local dy=Instance.new"UIListLayout"dy.FillDirection=Enum.FillDirection.Horizontal
dy.HorizontalAlignment=Enum.HorizontalAlignment.Right dy.Padding=UDim.new(0,8)dy.Parent=dx
ce(dx,0,0,12,12)
du=Instance.new"TextButton"du.Text=""
du.Size=UDim2.new(0,80,0,30)du.BackgroundTransparency=1 du.Parent=dx
local dz=Instance.new"TextLabel"dz.BackgroundTransparency=1
dz.Size=UDim2.fromScale(1,1)dz.Font=Enum.Font.GothamBold
dz.TextSize=12 dz.Text="BACK"dz.Parent=du
b2:_tag(dz,"TextColor3","Dim")
local dA=Instance.new"TextButton"dA.Text=""
dA.Size=UDim2.new(0,80,0,30)dA.BackgroundTransparency=1 dA.Parent=dx
local dB=Instance.new"TextLabel"dB.BackgroundTransparency=1
dB.Size=UDim2.fromScale(1,1)dB.Font=Enum.Font.Gotham
dB.TextSize=12 dB.Text="Skip"dB.Parent=dA
b2:_tag(dB,"TextColor3","Dim")
dv=Instance.new"TextButton"dv.Text=""
dv.Size=UDim2.new(0,96,0,30)dv.BorderSizePixel=0
cc(dv,7)dv.AutoButtonColor=false dv.Parent=dx
b2:agrad(dv,15)
dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.Size=UDim2.fromScale(1,1)dw.Font=Enum.Font.GothamBold
dw.TextSize=12
dw.Text="NEXT"dw.Parent=dv
b2:oa(dw)
local function close()
b8(dm,b5.Fast,{GroupTransparency=1})
b8(dl,b5.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dl:Destroy()end)end)
cb(di.OnFinish)
end
du.MouseButton1Click:Connect(function()
b2:_sfx"Click"dk=math.max(1,dk-1)paint()
end)
dA.MouseButton1Click:Connect(function()close()end)
dv.MouseButton1Click:Connect(function()
b2:_sfx"Click"
if dk>=#dj then close()else dk+=1 paint()end
end)
paint()
end



function c1.Tab(dh,di)
return b_({
Window=c1,opts=cm,Th=cr,
pages=c0,nav=cY,pill=c_,subLbl=cF,
},di)
end

function c1.SaveConfig(dh,di)
bR.Save(dh,di)
end
function c1.LoadConfig(dh,di)
bR.Load(dh,di)
end

function c1.Destroy(dh)
for di,dj in ipairs(dh._conns)do pcall(function()dj:Disconnect()end)end
dh._conns={}
for di,dj in pairs(b2.Sound._cache)do pcall(function()dj:Stop()dj:Destroy()end)end
b2.Sound._cache={}
b2:SetAcrylic(false)
if b2._gui==ct then b2._gui=nil end
pcall(function()c4:Destroy()end)
pcall(function()ct:Destroy()end)
end

ad.registerUnload(function()
pcall(function()c1:Destroy()end)
end)
af.paintFonts(ct)
return c1
end end function a.H():typeof(__modImpl())local aa=a.cache.H if not aa then aa={c=__modImpl()}a.cache.H=aa end return aa.c end end do local function __modImpl()




return function(aa)
task.defer(function()
local ab=aa:CreateWindow{
Title="Kronos",SubTitle="premiere",Theme="Kronos",
ToggleKey=Enum.KeyCode.RightShift,Acrylic=true,Blur=16,
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
ac:Label"Made with Kronos UI • operate responsibly."
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
local bR=ae:Log{Title="Console",Lines={"hub loaded"}}
bR:Add"aimbot armed"
local b_=ab:Tab{Title="Visuals",Icon="eye"}
b_:Section"ESP"
b_:Toggle{Title="Box ESP",Value=true,Flag="BoxESP"}
b_:Colorpicker{Title="ESP Color",Value=Color3.fromRGB(110,140,255),Flag="ESPColor"}
b_:Dropdown{Title="Chams",Values={"Enemies","Team","NPCs","Chests","Ores"},
Multi=true,Value={"Enemies"},Flag="Chams"}
local b2=ab:Tab{Title="Settings",Icon="settings"}
b2:Profile{Name="kronos_user",Tag="Premium • keyless"}
b2:Section"Interface"
b2:Dropdown{Title="Theme",
Values={"Kronos","Dark","Midnight","Light","Rose","Indigo","Forest","Amber","Ocean","Crimson","Ghost","Cyberpunk","Terminal","Discord","Mono"},
Value="Kronos",Callback=function(b5)ab:SetTheme(b5)end}
b2:Colorpicker{Title="Accent color",Description="Repaints every accent live",
Value=Color3.fromRGB(232,236,245),
Callback=function(b5)ab:SetAccent(b5)end}
b2:Dropdown{Title="Font",Description="Bigger, bolder, yours",
Values={"Gotham+","Gotham","Builder","Arimo","Source","Cartoon","Arcade","SciFi","Fantasy","Highway"},
Value="Gotham+",Callback=function(b5)aa:SetFontPack(b5)end}
b2:Slider{Title="UI scale",Min=70,Max=125,Step=5,Value=100,
Callback=function(b5)ab:SetScale(b5/100)end}
b2:Toggle{Title="Compact mode",Description="Smaller card, tighter lists",Value=false,
Callback=function(b5)ab:SetCompact(b5)end}
b2:Toggle{Title="Focus mode",Description="Hide sidebar, just content",Value=false,
Callback=function(b5)ab:SetFocus(b5)end}
b2:Toggle{Title="Acrylic",Description="Scene blur",Value=true,
Callback=function(b5)ab:ToggleAcrylic(b5)end}
b2:Toggle{Title="Transparency",Description="Ghost mode",Value=false,
Callback=function(b5)ab:ToggleTransparency(b5)end}
b2:Toggle{Title="UI Sounds",Description="Clicks, toggles, notifications",Value=true,
Callback=function(b5)aa.Sound.Enabled=b5 end}
b2:Keybind{Title="Panic key",Value=Enum.KeyCode.F,
Callback=function()ab:SetVisible(false)end}
b2:Button{Title="Keybinds panel",Description="Slide-over, click a row to rebind",
Callback=function()ab:ToggleKeybindList()end}
b2:Button{Title="Command palette",Description="Same as Ctrl+K",
Callback=function()ab:TogglePalette(true)end}
b2:Section"Profiles"
b2:Profiles{Title="My profiles"}
ab:Notify{Title="Kronos loaded",Content="Ctrl+K palette • RightShift hide",Duration=5}
aa:RefreshFonts()
end)
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end end




local aa=a.a()
local ab=a.b()a.c()a.d()


local ac=a.e()
local ad=a.f()
local ae=a.g()
local af=a.h()
local bR=a.i()
local b_=a.H()

ab.claimUnload()

local b2=aa
b2.Themes=af.Themes
b2.Icons=ac.Icons
b2.IconAlias=ac.IconAlias

b2._tag=function(b5,b8,cb,cc)
return af.tag(b8,cb,cc)
end
b2.agrad=function(b5,b8,cb)
return af.agrad(b8,cb)
end
b2.oa=function(b5,b8)
return af.oa(b8)
end
b2.SetTheme=function(b5,b8)
return af.SetTheme(b8)
end
b2.SetAccent=function(b5,b8)
return af.SetAccent(b8)
end
b2.SetAcrylic=function(b5,b8,cb)
return bR.SetAcrylic(b8,cb)
end
b2.ToggleAcrylic=function(b5,b8)
return bR.ToggleAcrylic(b8)
end
b2._sfx=function(b5,b8)
return ad.sfx(b8)
end
b2.SetFontPack=function(b5,b8)
return ae.SetFontPack(b8)
end
b2.RefreshFonts=function(b5)
return ae.RefreshFonts()
end
b2._paintFonts=function(b5,b8)
return ae.paintFonts(b8)
end

b2.CreateWindow=b_


local b5=a.I()
b5(b2)

return b2
