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

local _=Instance.new"TextLabel"_.Visible=false
_.AnchorPoint=Vector2.new(0.5,1)_.Size=UDim2.fromOffset(44,20)
_.BackgroundColor3=aN.Surface2 _.BorderSizePixel=0
_.Font=Enum.Font.GothamBold _.TextSize=11 at(_,6)_.Parent=aV
af:_tag(_,"BackgroundColor3","Surface2")
af:_tag(_,"TextColor3","Text")
aw(_,true)
local aW=ar()
local aX,aY,aZ,a_=false,false
local function alpha(a0)return math.clamp((a0-aQ)/math.max(1e-6,aR-aQ),0,1)end
local function render(a0)
local a1=alpha(aU)
an(g,a0 and am.Fill08 or TweenInfo.new(0),{Size=UDim2.new(a1,0,1,0)})
N.Position=UDim2.new(a1,0,0.5,0)
local a2=f.AbsoluteSize.X
_.Position=UDim2.new(0,12+a1*(a2>0 and a2 or 200),0,aH.Description and 46 or 34)
_.Text=fmt(aU)
if c:IsFocused()==false then c.Text=fmt(aU)end
end
local a0={}
function a0.Set(a1,a2,a3)
a2=math.clamp(tonumber(a2)or aU,aQ,aR)
a2=math.round(a2/aS)*aS
if aT>0 then a2=tonumber(string.format("%."..aT.."f",a2))end
aU=a2 render(true)
if aH.Flag then af.Flags[aH.Flag]=aU end
if not a3 then as(aH.Callback,aU)as(aH.OnChanged,aU)end
end
function a0.Get(a1)return aU end
function a0.SetMax(a1,a2)aR=a2 a0:Set(aU,true)end
function a0.SetMin(a1,a2)aQ=a2 a0:Set(aU,true)end
render(false)
c.FocusLost:Connect(function()
local a1=tonumber(c.Text)
if a1 then a0:Set(a1)else c.Text=fmt(aU)end
end)
f.InputBegan:Connect(function(a1)
if aH.Locked then return end
if a1.UserInputType~=Enum.UserInputType.MouseButton1 and a1.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=aW then return end
af.CurrentInput,aX,aY=aW,true,a1.UserInputType==Enum.UserInputType.Touch
aP.ScrollingEnabled=false
_.Visible=true
an(N,am.Hover,{Size=UDim2.fromOffset(16,16)})
local function fromX(a2)
local a3=math.clamp((a2-f.AbsolutePosition.X)/math.max(1,f.AbsoluteSize.X),0,1)
a0:Set(aQ+a3*(aR-aQ))
end
fromX(aY and a1.Position.X or aF:GetMouseLocation().X)
if aZ then aZ:Disconnect()end
aZ=aE.RenderStepped:Connect(function()
if not aX then return end
if aL._window and aL._window._visible==false then return end
fromX(aF:GetMouseLocation().X)
end)
if a_ then a_:Disconnect()end
a_=aF.InputEnded:Connect(function(a2)
if(a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch)and aX then
aX=false
if aZ then aZ:Disconnect()aZ=nil end
if a_ then a_:Disconnect()a_=nil end
af.CurrentInput=nil
aP.ScrollingEnabled=true
_.Visible=false
an(N,am.Hover,{Size=UDim2.fromOffset(12,12)})
as(aH.OnRelease,aU)
end
end)
end)
local a1={Title=aH.Title,Frame=aV,Value=aU,Flag=aH.Flag,_handle=a0,
_set=function(a1,a2)a0:Set(a1,a2)end}
return aK(a1)
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
local a3=aU.Values or aU.Options or{}
local c=aU.Multi or aU.MultipleOptions or false
local f=aU.Value or aU.Default or aU.CurrentOption
if not c and type(f)=="table"then f=f[1]end
if c and type(f)~="table"then f=f and{f}or{}end
local g=aV(aU.Description and 50 or 40)g.ClipsDescendants=false
aW(g,aU.Title or"Dropdown",nil,200)
local N=Instance.new"TextButton"N.Text=""
N.AnchorPoint=Vector2.new(1,0.5)N.Position=UDim2.new(1,-12,0.5,0)
N.Size=UDim2.new(0,170,0,28)N.BackgroundColor3=a_.Surface2
N.BorderSizePixel=0 aD(N,7)N.AutoButtonColor=false N.Parent=g
aG(N,true)
am:_tag(N,"BackgroundColor3","Surface2")
local S=Instance.new"TextLabel"S.BackgroundTransparency=1
S.Position=UDim2.new(0,8,0,0)S.Size=UDim2.new(1,-28,1,0)
S.Font=Enum.Font.Gotham S.TextSize=12 S.TextXAlignment=0
S.TextTruncate=Enum.TextTruncate.AtEnd S.Parent=N
S.ZIndex=2
am:_tag(S,"TextColor3","Text")
local _=aK("chevron",13,a_.Dim)
_.AnchorPoint=Vector2.new(1,0.5)_.Position=UDim2.new(1,-8,0.5,0)
_.Parent=N
local function curText()
if c then return(#f==0 and"None"or table.concat(f,", "))end
return tostring(f or"Select...")
end
S.Text=curText()
local a4,a5,a6,a7,a8,a9=false
local ba={}
function ba.Set(bb,bc,bd)
f=bc
if not c and type(f)=="table"then f=f[1]end
S.Text=curText()
if aU.Flag then am.Flags[aU.Flag]=f end
if not bd then aw(aU.Callback,f)aw(aU.OnChanged,f)end
end
function ba.Get(bb)return f end
local function closeList()
if not a4 then return end
a4=false
af.close(closeList)
as(_,an.Fast,{Rotation=0})
if a8 then pcall(function()a8:Disconnect()end)a8=nil end
if a9 then pcall(function()a9:Disconnect()end)a9=nil end
if a5 then pcall(function()a5:Destroy()end)a5=nil end
if a6 then pcall(function()a6:Destroy()end)a6=nil end
a7=nil
end
function ba.Refresh(bb,bc)
a3=bc or{}
closeList()
end
local function renderItems(bb)
if not a6 then return end
for bc,bd in ipairs(a6:GetChildren())do
if bd:IsA"TextButton"then pcall(function()bd:Destroy()end)end
end
local bc={}
for bd,be in ipairs(a3)do
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
bh.Position=UDim2.new(0,8,0,0)bh.Size=UDim2.new(1,-16,1,0)
bh.Font=Enum.Font.Gotham bh.TextSize=12 bh.TextXAlignment=0
bh.TextTruncate=Enum.TextTruncate.AtEnd bh.Text=bf bh.Parent=bg
bh.ZIndex=af.Z.Popup+2
am:_tag(bh,"TextColor3","Text")
local bi=c and table.find(f,bf)or f==bf
if bi then am:_tag(bg,"BackgroundColor3","Surface2")bg.BackgroundTransparency=0.4 end
bg.MouseEnter:Connect(function()bg.BackgroundTransparency=0.4 am:_tag(bg,"BackgroundColor3","Surface2")end)
bg.MouseLeave:Connect(function()if not(c and table.find(f,bf)or f==bf)then bg.BackgroundTransparency=1 end end)
bg.MouseButton1Click:Connect(function()
am:_sfx"Click"
if c then
local bj=table.find(f,bf)
if bj then table.remove(f,bj)else table.insert(f,bf)end
ba:Set(f)
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
if not a6 or not g.Parent then return end
local bc,bd=g.AbsolutePosition,g.AbsoluteSize
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
as(_,an.Fast,{Rotation=180})
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
if not g:IsDescendantOf(game)then closeList()return end
if aZ._visible==false then closeList()return end
if aY.Page and aY.Page.Visible==false then closeList()return end
placeList()
end)
end
N.MouseButton1Click:Connect(function()
am:_sfx"Click"
if a4 then closeList()else openList()end
end)
local bb={Title=aU.Title,Frame=g,Value=f,Flag=aU.Flag,_handle=ba,
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

local a2,a3=160,158
local a4,a5,a6=6,10,12
local a7=150
local a8=40
local a9=24
local ba=40

return function(bb,bc)
local bd=bb.row
local be=bb.titleBlock
local bf=bb.reg
local bg=bb.tab
local bh=bb.Window
local bi=bb.Th local bj=
bb.opts or{}local c=
bb.page
local f=bb.pgui
bc=bc or{}
local g=bc.Value or bc.Default or Color3.fromRGB(110,140,255)
if type(g)=="table"then
g=Color3.new(g[1]or 0,g[2]or 0,g[3]or 0)
end
local N,S,_=g:ToHSV()
local bk=bc.Transparency or 0
local bl=g
local bm=bd(bc.Description and 54 or 40)bm.ClipsDescendants=false
be(bm,bc.Title or"Color",bc.Description,90)
local bn=Instance.new"TextButton"bn.Text=""
bn.AnchorPoint=Vector2.new(1,0.5)bn.Position=UDim2.new(1,-12,0.5,0)
bn.Size=UDim2.fromOffset(56,26)bn.BackgroundColor3=bl
bn.BorderSizePixel=0 aR(bn,8)bn.AutoButtonColor=false bn.Parent=bm
aS(bn,true)
local bo={}
local bp,bq,br,bs=false
local bt,bu,bv
local bw,bx,by
local bz,bA,bB,bC,bD,bE
local bF,bG,bH,bI
local bJ,bK,bL=false,false,false
local bM,bN=0
local bO
local bP={}
local function currentColor()
return Color3.fromHSV(N,S,_)
end
local function colorsClose(bQ,bR)
if bQ==nil or bR==nil then return false end
return math.abs(bQ.R-bR.R)<0.001
and math.abs(bQ.G-bR.G)<0.001
and math.abs(bQ.B-bR.B)<0.001
end
local function syncFields()
if bw then
bw.Position=UDim2.new(S,0,1-_,0)
bw.BackgroundColor3=currentColor()
end
if bx then
bx.Position=UDim2.new(0.5,0,N,0)
bx.BackgroundColor3=Color3.fromHSV(N,1,1)
end
if bt then bt.BackgroundColor3=Color3.fromHSV(N,1,1)end
if bv then
bv.BackgroundColor3=currentColor()
if by then
by.Position=UDim2.new(0.5,0,1-bk,0)
by.BackgroundColor3=currentColor()
by.BackgroundTransparency=bk
end
end
local bQ=currentColor()
local bR=math.floor(bQ.R*255+0.5)
local bS=math.floor(bQ.G*255+0.5)
local bT=math.floor(bQ.B*255+0.5)
if bA and not bA:IsFocused()then bA.Text="#"..bQ:ToHex():upper()end
if bB and not bB:IsFocused()then bB.Text=tostring(bR)end
if bC and not bC:IsFocused()then bC.Text=tostring(bS)end
if bD and not bD:IsFocused()then bD.Text=tostring(bT)end
if bE and not bE:IsFocused()then
bE.Text=tostring(math.floor((1-bk)*100+0.5)).."%"
end
if bz then
bz.BackgroundColor3=bQ
bz.BackgroundTransparency=bk
end
end
local function push(bQ)
bl=currentColor()
aG(bn,aD.Hover,{BackgroundColor3=bl})
if bc.Flag then aw.Flags[bc.Flag]={bl.R,bl.G,bl.B}end
if not bQ then aQ(bc.Callback,bl,bk)aQ(bc.OnChanged,bl,bk)end
end
local function applyColor(bQ)
bl=currentColor()
aG(bn,aD.Hover,{BackgroundColor3=bl})
if bc.Flag then aw.Flags[bc.Flag]={bl.R,bl.G,bl.B}end
syncFields()
if bQ then
local bR=currentColor()
if not colorsClose(bR,bO)then
bO=bR
aQ(bc.Callback,bR,bk)aQ(bc.OnChanged,bR,bk)
end
end
end
function bo.Set(bQ,bR,bS,bT)
if type(bR)=="table"and typeof(bR)~="Color3"then
bR=Color3.new(bR[1]or 0,bR[2]or 0,bR[3]or 0)
end
if typeof(bR)=="Color3"then
if type(bS)=="boolean"and bT==nil then
bT=bS
elseif type(bS)=="number"then
bk=math.clamp(bS,0,1)
end
N,S,_=bR:ToHSV()
push(bT)
syncFields()
end
end
function bo.Get(bQ)return bl,bk end
local function closePopup()
if not bp then return end
bp=false
af.close(closePopup)
bJ,bK,bL=false,false,false
bN=nil
for bQ,bR in ipairs(bP)do pcall(function()bR:Disconnect()end)end
bP={}
if bs then pcall(function()bs:Disconnect()end)bs=nil end
if br then pcall(function()br:Destroy()end)br=nil end
if bq then
local bQ=bq
bq=nil
aG(bQ,aD.Fast,{Size=UDim2.new(0,bQ.Size.X.Offset,0,0)})
task.delay(0.2,function()pcall(function()bQ:Destroy()end)end)
end
bw,bx,by=nil,nil,nil
bt,bu,bv=nil,nil,nil
bz=nil
bA,bB,bC,bD,bE=nil,nil,nil,nil,nil
end
local function updateSV(bQ)
if not bt or bt.AbsoluteSize.X<=0 then return end
local bR,bS=bt.AbsolutePosition,bt.AbsoluteSize
S=math.clamp((bQ.X-bR.X)/bS.X,0,1)
_=1-math.clamp((bQ.Y-bR.Y)/bS.Y,0,1)
applyColor(true)
end
local function updateHue(bQ)
if not bu or bu.AbsoluteSize.Y<=0 then return end
local bR,bS=bu.AbsolutePosition,bu.AbsoluteSize
N=math.clamp((bQ.Y-bR.Y)/bS.Y,0,1)
applyColor(true)
end
local function updateAlpha(bQ)
if not bv or bv.AbsoluteSize.Y<=0 then return end
local bR,bS=bv.AbsolutePosition,bv.AbsoluteSize
bk=1-math.clamp((bQ.Y-bR.Y)/bS.Y,0,1)
applyColor(true)
end
local function requestClose()
if bJ or bK or bL then return end
if os.clock()-bM<0.2 then return end
closePopup()
end
local function placePopup(bQ,bR)
if not bq or not bm.Parent then return end
local bS,bT=bm.AbsolutePosition,bm.AbsoluteSize
local bU=Vector2.new(1200,800)
pcall(function()bU=workspace.CurrentCamera.ViewportSize end)
local bV=bS.X+bT.X-bQ-12
if bV<10 then bV=math.max(10,bS.X-bQ-8)end
local bW=bS.Y+46
if bW+bR>bU.Y-10 then bW=math.max(10,bS.Y-bR-6)end
bq.Position=UDim2.fromOffset(bV,bW)
end
local function openPopup()
if bp then return end
bp=true
bF,bG,bH=N,S,_
bI=bk
bO=currentColor()
af.open(closePopup)
aw:_sfx"Click"
local bQ=a2+a5+a4+a5
local bR=bQ+a4+a5+a5
local bS=bR+a7+a6*2
local bT=a8+a3+a5
local bU=bT+a9+a5+22
local bV=bU+ba+a6
br=af.backdrop(f,requestClose)
bq=Instance.new"Frame"
bq.Name=ae.GetStealthName()
bq.BackgroundColor3=bi.Bg
bq.BackgroundTransparency=1
bq.BorderSizePixel=0
bq.ClipsDescendants=true
bq.ZIndex=af.Z.Popup
bq.Size=UDim2.new(0,bS,0,0)
bq.Parent=f
aR(bq,10)
aS(bq,true)
aw:_tag(bq,"BackgroundColor3","Bg")
placePopup(bS,bV)
local bW=Instance.new"TextLabel"bW.BackgroundTransparency=1
bW.Position=UDim2.new(0,0,0,0)bW.Size=UDim2.new(1,0,0,28)
bW.Font=Enum.Font.GothamBold bW.TextSize=13 bW.TextXAlignment=0
bW.TextTruncate=Enum.TextTruncate.AtEnd bW.Text=bc.Title or"Color"
bW.Parent=bq
bW.ZIndex=af.Z.Popup+1
aw:_tag(bW,"TextColor3","Text")

bt=Instance.new"ImageLabel"
bt.Position=UDim2.new(0,0,0,a8)
bt.Size=UDim2.fromOffset(a2,a3)
bt.BackgroundColor3=Color3.fromHSV(N,1,1)
bt.BackgroundTransparency=0
bt.Image=a_
bt.ScaleType=Enum.ScaleType.Stretch
bt.BorderSizePixel=0
bt.ClipsDescendants=true
bt.ZIndex=af.Z.Popup+1
bt.Parent=bq
aR(bt,8)
aS(bt,true)
bw=Instance.new"Frame"
bw.AnchorPoint=Vector2.new(0.5,0.5)
bw.Position=UDim2.new(S,0,1-_,0)
bw.Size=UDim2.fromOffset(14,14)
bw.BackgroundColor3=currentColor()
bw.BorderSizePixel=0
bw.ZIndex=af.Z.Popup+3
bw.Parent=bt
aR(bw,99)
local bX=Instance.new"UIStroke"bX.Thickness=2
bX.Color=Color3.fromRGB(255,255,255)bX.Transparency=0.1
bX.Parent=bw

local bY=a2+a5
bu=Instance.new"Frame"
bu.Position=UDim2.new(0,bY,0,a8)
bu.Size=UDim2.fromOffset(a4,a3+14)
bu.BackgroundColor3=Color3.fromRGB(255,255,255)
bu.BorderSizePixel=0
bu.ClipsDescendants=true
bu.ZIndex=af.Z.Popup+1
bu.Parent=bq
aR(bu,3)
local bZ=Instance.new"UIGradient"bZ.Rotation=90
bZ.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
}
bZ.Parent=bu
bx=Instance.new"Frame"
bx.AnchorPoint=Vector2.new(0.5,0.5)
bx.Position=UDim2.new(0.5,0,N,0)
bx.Size=UDim2.fromOffset(14,14)
bx.BackgroundColor3=Color3.fromHSV(N,1,1)
bx.BorderSizePixel=0
bx.ZIndex=af.Z.Popup+3
bx.Parent=bu
aR(bx,99)
local b_=Instance.new"UIStroke"b_.Thickness=2
b_.Color=Color3.fromRGB(255,255,255)b_.Transparency=0.1
b_.Parent=bx

bv=Instance.new"Frame"
bv.Position=UDim2.new(0,bQ,0,a8)
bv.Size=UDim2.fromOffset(a4,a3+14)
bv.BackgroundColor3=currentColor()
bv.BorderSizePixel=0
bv.ClipsDescendants=true
bv.ZIndex=af.Z.Popup+1
bv.Parent=bq
aR(bv,3)
aS(bv,true)
local b0=Instance.new"ImageLabel"
b0.Image=a1
b0.ImageTransparency=0.45
b0.ScaleType=Enum.ScaleType.Tile
b0.TileSize=UDim2.fromOffset(40,40)
b0.BackgroundTransparency=1
b0.Size=UDim2.fromScale(1,1)
b0.ZIndex=af.Z.Popup+1
b0.Parent=bv
aR(b0,3)
local b1=Instance.new"Frame"
b1.Size=UDim2.fromScale(1,1)
b1.BackgroundColor3=Color3.fromRGB(255,255,255)
b1.BorderSizePixel=0
b1.ZIndex=af.Z.Popup+2
b1.Parent=bv
aR(b1,3)
local b2=Instance.new"UIGradient"b2.Rotation=90
b2.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
b2.Parent=b1
by=Instance.new"Frame"
by.AnchorPoint=Vector2.new(0.5,0.5)
by.Position=UDim2.new(0.5,0,1-bk,0)
by.Size=UDim2.fromOffset(14,14)
by.BackgroundColor3=currentColor()
by.BackgroundTransparency=bk
by.BorderSizePixel=0
by.ZIndex=af.Z.Popup+3
by.Parent=bv
aR(by,99)

local b3=(a2-a5)/2
local function checkerSw(b4)
local b5=Instance.new"ImageLabel"
b5.Image=a1
b5.ImageTransparency=0.45
b5.ScaleType=Enum.ScaleType.Tile
b5.TileSize=UDim2.fromOffset(40,40)
b5.BackgroundTransparency=1
b5.Position=UDim2.new(0,b4,0,bT)
b5.Size=UDim2.fromOffset(b3,a9)
b5.ZIndex=af.Z.Popup+1
b5.Parent=bq
aR(b5,8)
aS(b5,true)
return b5
end
local b4=checkerSw(0)
bz=Instance.new"Frame"
bz.BackgroundColor3=currentColor()
bz.BackgroundTransparency=bk
bz.Size=UDim2.fromScale(1,1)
bz.ZIndex=af.Z.Popup+2
bz.Parent=b4
aR(bz,8)
local b5=checkerSw(b3+a5)
local b6=Instance.new"Frame"
b6.BackgroundColor3=Color3.fromHSV(bF or N,bG or S,bH or _)
b6.BackgroundTransparency=(bI==nil)and bk or bI
b6.Size=UDim2.fromScale(1,1)
b6.ZIndex=af.Z.Popup+2
b6.Parent=b5
aR(b6,8)

local b7=bR
local function makeInput(b8,b9,ca)
local cb=Instance.new"Frame"
cb.BackgroundTransparency=1
cb.Position=UDim2.new(0,b7,0,ca)
cb.Size=UDim2.new(0,a7,0,36)
cb.ZIndex=af.Z.Popup+1
cb.Parent=bq
local cc=Instance.new"TextLabel"
cc.BackgroundTransparency=1
cc.Font=Enum.Font.Gotham cc.TextSize=11
cc.TextXAlignment=0 cc.Text=b8
cc.Size=UDim2.new(1,0,0,12)
cc.ZIndex=af.Z.Popup+2
cc.Parent=cb
aw:_tag(cc,"TextColor3","Dim")
local cd=Instance.new"Frame"
cd.Position=UDim2.new(0,0,0,12)
cd.Size=UDim2.new(1,0,0,24)
cd.BackgroundColor3=bi.Surface2
cd.BackgroundTransparency=0
cd.BorderSizePixel=0
cd.ZIndex=af.Z.Popup+2
cd.Parent=cb
aR(cd,7)
aS(cd,true)
aw:_tag(cd,"BackgroundColor3","Surface2")
local ce=Instance.new"TextBox"
ce.ClearTextOnFocus=false
ce.Font=Enum.Font.Code ce.TextSize=13
ce.TextXAlignment=1 ce.TextYAlignment=1
ce.Text=b9
ce.BackgroundTransparency=1
ce.Size=UDim2.fromScale(1,1)
ce.ZIndex=af.Z.Popup+3
ce.Parent=cd
aw:_tag(ce,"TextColor3","Text")
aT(ce,0,0,0,8)
return cb,ce
end
local b8=currentColor()
local b9=math.floor(b8.R*255+0.5)
local ca=math.floor(b8.G*255+0.5)
local cb=math.floor(b8.B*255+0.5)
local cc=a8
local cd=4 local
ce, cf=makeInput("Hex","#"..b8:ToHex():upper(),cc)
bA=cf
cc+=36+cd local
cg, ch=makeInput("Red",tostring(b9),cc)
bB=ch
cc+=36+cd local
ci, cj=makeInput("Green",tostring(ca),cc)
bC=cj
cc+=36+cd local
ck, cl=makeInput("Blue",tostring(cb),cc)
bD=cl
cc+=36+cd local
cm, cn=makeInput("Alpha",tostring(math.floor((1-bk)*100+0.5)).."%",cc)
bE=cn

local co=bS-a6*2
local cp=(co-6)/2
local function makeBtn(cq,cr,cs,ct)
local cu=Instance.new"TextButton"
cu.Position=UDim2.new(0,cr,0,bU)
cu.Size=UDim2.fromOffset(cs,ba)
cu.Font=Enum.Font.GothamBold cu.TextSize=13
cu.Text=cq
cu.AutoButtonColor=false
cu.BorderSizePixel=0
cu.ZIndex=af.Z.Popup+2
if ct then
aw:agrad(cu,15)
else
cu.BackgroundColor3=bi.Surface2
aS(cu,true)
aw:_tag(cu,"BackgroundColor3","Surface2")
end
cu.Parent=bq
aR(cu,9)
local cv=Instance.new"TextLabel"
cv.BackgroundTransparency=1 cv.Size=UDim2.fromScale(1,1)
cv.Font=Enum.Font.GothamBold cv.TextSize=12
cv.Text=string.upper(cq)cv.Parent=cu
cv.ZIndex=af.Z.Popup+3
if ct then aw:oa(cv)else aw:_tag(cv,"TextColor3","Text")end
return cu,cv
end
local cq=makeBtn("Cancel",0,cp,false)
local cr=makeBtn("Apply",cp+6,cp,true)
cq.MouseButton1Click:Connect(function()
N,S,_=bF,bG,bH
bk=bI
applyColor(true)
closePopup()
end)
cr.MouseButton1Click:Connect(function()
aw:_sfx"Click"
closePopup()
end)

bt.InputBegan:Connect(function(cs)
if cs.UserInputType==Enum.UserInputType.MouseButton1
or cs.UserInputType==Enum.UserInputType.Touch then
if bJ or bK or bL then return end
bJ=true
bN=cs
updateSV(cs.Position)
end
end)
bu.InputBegan:Connect(function(cs)
if cs.UserInputType==Enum.UserInputType.MouseButton1
or cs.UserInputType==Enum.UserInputType.Touch then
if bJ or bK or bL then return end
bK=true
bN=cs
updateHue(cs.Position)
end
end)
bv.InputBegan:Connect(function(cs)
if cs.UserInputType==Enum.UserInputType.MouseButton1
or cs.UserInputType==Enum.UserInputType.Touch then
if bJ or bK or bL then return end
bL=true
bN=cs
updateAlpha(cs.Position)
end
end)
table.insert(bP,aZ.InputChanged:Connect(function(cs)
if not bq then return end
if cs~=bN
and not(bN and bN.UserInputType==Enum.UserInputType.MouseButton1
and cs.UserInputType==Enum.UserInputType.MouseMovement)then
return
end
if bJ then updateSV(cs.Position)end
if bK then updateHue(cs.Position)end
if bL then updateAlpha(cs.Position)end
end))
table.insert(bP,aZ.InputEnded:Connect(function(cs)
if cs==bN
or(bN and bN.UserInputType==Enum.UserInputType.MouseButton1
and cs.UserInputType==Enum.UserInputType.MouseButton1)then
if bJ or bK or bL then
bM=os.clock()
end
bJ,bK,bL=false,false,false
bN=nil
end
end))
bA:GetPropertyChangedSignal"Text":Connect(function()
if not bq then return end
local cs=bA.Text:gsub("[^%x]","")
cs=cs:sub(1,6)
if cs~=bA.Text then bA.Text=cs end
end)
bA.FocusLost:Connect(function()
if not bq then return end
local cs=bA.Text:gsub("#","")
if#cs==3 then
cs=cs:sub(1,1):rep(2)..cs:sub(2,2):rep(2)..cs:sub(3,3):rep(2)
end
if#cs==6 then
local ct,cu=pcall(Color3.fromHex,cs)
if ct and cu then
N,S,_=cu:ToHSV()
applyColor(true)
return
end
end
syncFields()
end)
local function filterDigits(cs)
cs:GetPropertyChangedSignal"Text":Connect(function()
if not bq then return end
local ct=cs.Text:gsub("%D",""):sub(1,3)
if ct~=cs.Text then cs.Text=ct end
end)
end
filterDigits(bB)filterDigits(bC)filterDigits(bD)
local function onRGBCommit()
if not bq then return end
local cs=math.clamp(tonumber(bB.Text)or 0,0,255)
local ct=math.clamp(tonumber(bC.Text)or 0,0,255)
local cu=math.clamp(tonumber(bD.Text)or 0,0,255)
N,S,_=Color3.toHSV(Color3.fromRGB(cs,ct,cu))
applyColor(true)
end
bB.FocusLost:Connect(onRGBCommit)
bC.FocusLost:Connect(onRGBCommit)
bD.FocusLost:Connect(onRGBCommit)
bE.FocusLost:Connect(function()
if not bq then return end
local cs=bE.Text:gsub("%%","")
local ct=math.clamp(tonumber(cs)or 0,0,100)
bk=1-ct/100
applyColor(true)
end)
syncFields()
aG(bq,TweenInfo.new(0.44,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Size=UDim2.new(0,bS,0,bV),BackgroundTransparency=0})
bs=aY.RenderStepped:Connect(function()
if not bp then return end
if not bm:IsDescendantOf(game)then closePopup()return end
if bh._visible==false then closePopup()return end
if bg.Page and bg.Page.Visible==false then closePopup()return end
placePopup(bS,bV)
end)
end
bn.MouseButton1Click:Connect(function()
if bp then closePopup()else openPopup()end
end)
local bQ={Title=bc.Title,Frame=bm,Value=bl,Flag=bc.Flag,_handle=bo,
_set=function(bQ,bR)bo:Set(bQ,bR)end}
return bf(bQ)
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
local bh={}
pcall(function()
if listfiles and isfolder and isfolder(folder())then
for bi,bk in ipairs(listfiles(folder()))do
local bl=string.match(bk,"([^/\\]+)%.json$")
if bl then table.insert(bh,bl)end
end
end
end)
table.sort(bh)
return bh
end
local function refresh()
for bh,bi in ipairs(bf:GetChildren())do
if bi:IsA"TextButton"then pcall(function()bi:Destroy()end)end
end
local bh=profiles()
if#bh==0 then
local bi=Instance.new"TextLabel"bi.BackgroundTransparency=1
bi.Size=UDim2.new(1,0,0,22)bi.Font=Enum.Font.Gotham
bi.TextSize=11 bi.Text="No saved profiles"bi.Parent=bf
af:_tag(bi,"TextColor3","Dim")
return
end
for bi,bk in ipairs(bh)do
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
local bh=bc.Text~=""and bc.Text or"default"
a9:SaveConfig(bh)refresh()
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

local bh=Instance.new"Frame"bh.BorderSizePixel=0
bh.Position=UDim2.new(0,0,0,18)bh.Size=UDim2.new(0,3,1,-36)
aZ(bh,99)bh.Parent=bg
af:_tag(bh,"BackgroundColor3","Accent")
local bi=a5(a8.Icon or"bellring",18,be.Accent)
bi.AnchorPoint=Vector2.new(0,0.5)bi.Position=UDim2.new(0,14,0,48)
bi.Parent=bg
if bi:IsA"TextLabel"then bi.Size=UDim2.new(0,18,0,18)end

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
a8.tab local bh=
a8.Window
local bi=a8.Th local bk=
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
bs.BackgroundColor3=bi.Surface bs.BorderSizePixel=0
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
ac.pad local bi=
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




local cc,cd=0
for cf,ch in ipairs(b9)do
if(cf-1)%c==0 then
cd=Instance.new"Frame"cd.BackgroundTransparency=1
cd.Size=UDim2.new(1,0,0,68)cd.AutomaticSize=Enum.AutomaticSize.Y
cd.Parent=ca
local cj=Instance.new"UIListLayout"cj.FillDirection=Enum.FillDirection.Horizontal
cj.Padding=UDim.new(0,8)cj.SortOrder=Enum.SortOrder.LayoutOrder cj.Parent=cd
cc+=1
end
local cj=false
local cl=Instance.new"Frame"
cl.Size=UDim2.new(1/c,-8+8/c,0,68)
cl.BackgroundColor3=b7.Surface cl.BorderSizePixel=0
bR(cl,10)cl.LayoutOrder=cf cl.Parent=cd
bT(cl,true)
af:_tag(cl,"BackgroundColor3","Surface")
bV(cl,10)


local cm=Instance.new"TextButton"cm.Text=""
cm.Size=UDim2.fromScale(1,1)cm.BackgroundTransparency=1 cm.Parent=cl
local cn=bZ(ch.Icon or"box",16,b7.Dim)
cn.Position=UDim2.new(0,10,0,10)cn.Parent=cl
if cn:IsA"TextLabel"then cn.Size=UDim2.new(0,16,0,16)end
local co=Instance.new"TextLabel"co.BackgroundTransparency=1
co.Position=UDim2.new(0,34,0,8)co.Size=UDim2.new(1,-42,0,18)
co.Font=Enum.Font.GothamBold co.TextSize=13 co.TextXAlignment=0
co.TextTruncate=Enum.TextTruncate.AtEnd co.Text=ch.Title or"Script"co.Parent=cl
af:_tag(co,"TextColor3","Text")
local cp=Instance.new"TextLabel"cp.BackgroundTransparency=1
cp.Position=UDim2.new(0,10,0,30)cp.Size=UDim2.new(1,-20,0,28)
cp.Font=Enum.Font.Gotham cp.TextSize=11
cp.TextXAlignment=0 cp.TextYAlignment=0
cp.TextWrapped=true cp.TextTruncate=Enum.TextTruncate.AtEnd
cp.Text=ch.Desc or""cp.Visible=false cp.Parent=cl
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
cj=not cj
af:_sfx"Click"
bH(cl,bG.Med,{Size=UDim2.new(1/c,-8+8/c,0,cj and 118 or 68)})
cp.Visible,cq.Visible=cj,cj
end)
cq.MouseButton1Click:Connect(function()
af:_sfx"Click"bP(ch.Callback)
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
local cc=b4.Th local cd=
b4.opts or{}
b7=b7 or{}
local cf=b7.Limit or 5
local ch=Instance.new"Frame"ch.BackgroundTransparency=1
ch.Size=UDim2.new(1,-4,0,0)ch.AutomaticSize=Enum.AutomaticSize.Y
ch.Parent=page
local cj=Instance.new"UIListLayout"cj.Padding=UDim.new(0,4)
cj.SortOrder=Enum.SortOrder.LayoutOrder cj.Parent=ch
local function refresh()
for cl,cm in ipairs(ch:GetChildren())do
if cm:IsA"TextButton"then pcall(function()cm:Destroy()end)end
end
local cl=af._recent or{}
if#cl==0 then
local cm=Instance.new"TextLabel"cm.BackgroundTransparency=1
cm.Size=UDim2.new(1,0,0,24)cm.Font=Enum.Font.Gotham
cm.TextSize=11 cm.Text="Use any control and it lands here."cm.Parent=ch
af:_tag(cm,"TextColor3","Dim")
return
end
for cm=1,math.min(cf,#cl)do
local cn=cl[cm]
local co=Instance.new"TextButton"co.Text=""
co.Size=UDim2.new(1,0,0,30)co.BackgroundColor3=cc.Surface
co.BackgroundTransparency=0.35 co.BorderSizePixel=0
bT(co,7)co.Parent=ch
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
return c{Title=b7.Title or"Recent",Frame=ch,_handle={Refresh=refresh}}
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
local cd=ac.lighting
local cf=ad.makeIcon
local ch=a.G()

return function(cj,cl)
local cm=cj.Window
local cn=cj.opts or{}
local co=cj.Th
local cp=cj.pgui
local cq=cj.pages
local cr=cj.nav
local cs=cj.pill
local ct=cj.subLbl
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
local N=cf(cv,15,co.Dim)
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
if cm._active and cm._active.Button==f then return end
b1(f,bT.Hover,{BackgroundTransparency=0.55})
ae.tag(S,"TextColor3","Text")
end)
f.MouseLeave:Connect(function()
if cm._active and cm._active.Button==f then return end
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

local cx={Title=cu,Button=f,Page=_,Elements={},_label=S,_icon=N}
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
b1(cB.Button,bT.Hover,{BackgroundTransparency=1})
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
cd(cA,cB)
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
ch.attach(cz,cA)

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
local cd=ac.spawnCb
local cf=ac.corner
local ch=ac.hairline
local cj=ac.pad
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

return function(cr,cs)
cs=cs or{}
local ct=cs.Title or"Kronos"
local cu=cs.SubTitle or cs.Subtitle or"scripthub"
local cv=cs.ToggleKey or Enum.KeyCode.RightShift
local cw=cs.Acrylic
if cw==nil then cw=true end
if cs.Theme then cr:SetTheme(cs.Theme)end
local cx=cr.Theme
cr:SetAcrylic(cw,cs.Blur or 16)

local cy=ad.GetRoot()
if cr._gui then pcall(function()cr._gui:Destroy()end)end

local cz=Instance.new"ScreenGui"
cz.Name=ad.GetStealthName()cz.ResetOnSpawn=false cz.IgnoreGuiInset=true cz.DisplayOrder=999
cz.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(cz)
cz.Parent=cy
cr._gui=cz



local cA=Instance.new"ScreenGui"
cA.Name=ad.GetStealthName()cA.ResetOnSpawn=false cA.IgnoreGuiInset=true cA.DisplayOrder=1000
cA.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(cA)
cA.Parent=cy

local cB=Instance.new"Frame"
cB.Name="Dim"cB.Size=UDim2.fromScale(1,1)
cB.BackgroundColor3=Color3.fromRGB(3,4,7)cB.BackgroundTransparency=1
cB.BorderSizePixel=0 cB.Parent=cz
cc(cB,c.Slow,{BackgroundTransparency=0.5})


if cs.Ambient~=false then
local cC=Instance.new"Frame"cC.Name="_ambient"
cC.AnchorPoint=Vector2.new(0.5,0.5)cC.Position=UDim2.new(0.5,0,0.5,0)
cC.Size=UDim2.new(1.4,0,1.4,0)cC.BackgroundColor3=Color3.fromRGB(255,255,255)
cC.BackgroundTransparency=0 cC.BorderSizePixel=0 cC.Parent=cB
local cD=Instance.new"UIGradient"cD.Rotation=25
cD.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,cx.Accent),
ColorSequenceKeypoint.new(1,cx.Accent2 or cx.Accent)}
cD.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
cD.Parent=cC
table.insert(b7._gradients,cD)
task.spawn(function()
while cz.Parent do
cc(cD,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not cz.Parent then break end
cc(cD,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local cC=Instance.new"CanvasGroup"
cC.Name="Main"cC.AnchorPoint=Vector2.new(0.5,0.5)
cC.Position=UDim2.new(0.5,0,0.5,0)cC.Size=UDim2.fromOffset(620,440)
cC.BackgroundColor3=cx.Surface
cC.BackgroundTransparency=(cw and not cr._transparent)and 0.08 or 0
cC.GroupTransparency=1 cC.BorderSizePixel=0 cC.Parent=cz
cf(cC,cs.Radius or 12)ch(cC,true)cm(cC)cn(cC,0.5,48)
local cD=Instance.new"UIScale"cD.Scale=0.94 cD.Parent=cC





local function brandInto(cE,cF)
if cs.Logo and cs.Logo~=""then
local f=Instance.new"ImageLabel"f.BackgroundTransparency=1
f.AnchorPoint=Vector2.new(0.5,0.5)f.Position=UDim2.new(0.5,0,0.5,0)
f.Size=UDim2.new(1,-8,1,-8)f.Image=cs.Logo
f.ScaleType=Enum.ScaleType.Fit f.Parent=cE
cf(f,8)
if cF then cF.Visible=false end
return f
end
return nil
end


local function kronosFace(cE,cF,f,g)
local N=f or 26
local S=Instance.new"Frame"S.Name="_disc"
S.AnchorPoint=Vector2.new(0.5,0.5)S.Position=UDim2.new(0.5,0,0.5,0)
S.Size=UDim2.fromOffset(N,N)S.BackgroundColor3=Color3.fromRGB(0,0,0)
S.BorderSizePixel=0 S.Parent=cE
local _=Instance.new"UICorner"_.CornerRadius=UDim.new(0.5,0)_.Parent=S
local cG=Instance.new"UIStroke"cG.Thickness=2
cG.Color=Color3.fromRGB(255,255,255)cG.Transparency=0.12 cG.Parent=S
pcall(function()
local cH=Instance.new"UIShadow"cH.Color=Color3.fromRGB(255,255,255)
cH.Transparency=0.82 cH.BlurSize=10 cH.Parent=S
end)
if cF then
cF.AnchorPoint=Vector2.new(0.5,0.5)cF.Position=UDim2.new(0.5,0,0.5,0)
cF.Size=UDim2.fromOffset(N,N)cF.TextSize=g or 16
cF.ZIndex=2
end
return S
end

local function playEntrance()
b7:_sfx"Open"
cc(cC,c.Slow,{GroupTransparency=0})
cc(cD,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1})
end
playEntrance()


local cE=Instance.new"Frame"
cE.Size=UDim2.new(1,-24,0,2)cE.Position=UDim2.new(0,12,0,0)
cE.BackgroundTransparency=1 cE.Parent=cC
local cF=Instance.new"Frame"cF.Size=UDim2.new(0,0,1,0)
cf(cF,99)cF.Parent=cE
b7:agrad(cF,0)
cc(cF,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()cE:Destroy()end)end)


local cG=Instance.new"Frame"
cG.Name="Header"cG.Size=UDim2.new(1,0,0,62)
cG.BackgroundTransparency=1 cG.Parent=cC
cj(cG,14,6,14,14)


local cH=Instance.new"Frame"cH.Name="Mark"
cH.Size=UDim2.fromOffset(36,36)cH.BackgroundColor3=cx.Surface2
cH.BorderSizePixel=0 cf(cH,10)cH.Parent=cG
ch(cH,true)
local f=Instance.new"TextLabel"f.Size=UDim2.fromScale(1,1)
f.BackgroundTransparency=1 f.Font=Enum.Font.GothamBlack
f.TextSize=18 cr:_tag(f,"TextColor3","Text")f.Text="K"f.Parent=cH
local g=Instance.new"Frame"g.Size=UDim2.fromOffset(8,8)
g.Position=UDim2.new(1,-5,0,-3)g.BorderSizePixel=0
cr:_tag(g,"BackgroundColor3","Accent")
cf(g,99)g.Parent=cH
brandInto(cH,f)
if not cs.Logo or cs.Logo==""then kronosFace(cH,f,26,15)end

local N=Instance.new"TextLabel"N.BackgroundTransparency=1
N.Position=UDim2.new(0,48,0,0)N.Size=UDim2.new(0,230,0,20)
N.Font=Enum.Font.GothamBold N.TextSize=15 N.TextXAlignment=0
cr:_tag(N,"TextColor3","Text")N.Text=ct N.Parent=cG
local S=Instance.new"TextLabel"S.BackgroundTransparency=1
S.Position=UDim2.new(0,48,0,21)S.Size=UDim2.new(0,230,0,15)
S.Font=Enum.Font.Gotham S.TextSize=11 N.TextXAlignment=0
S.TextXAlignment=0 cr:_tag(S,"TextColor3","Dim")
S.Text=string.upper(cu).."  â€¢  V"..cr.Version S.Parent=cG


local _=Instance.new"Frame"
_.AnchorPoint=Vector2.new(1,0)_.Position=UDim2.new(1,-64,0,4)
_.Size=UDim2.new(0,170,0,32)_.BackgroundColor3=cx.Bg
_.BorderSizePixel=0 cf(_,8)_.Parent=cG
ch(_,true)
local cI=cp("search",14,cx.Dim)
cI.Position=UDim2.new(0,9,0.5,-7)cI.Parent=_
local cJ=Instance.new"TextBox"cJ.PlaceholderText="Search"
cJ.PlaceholderColor3=cx.Dim cJ.Text=""cJ.Font=Enum.Font.GothamBold
cJ.TextSize=12 cr:_tag(cJ,"TextColor3","Text")
cJ.Position=UDim2.new(0,28,0,0)cJ.Size=UDim2.new(1,-80,1,0)
cJ.BackgroundTransparency=1 cJ.ClearTextOnFocus=false cJ.Parent=_
local cK=Instance.new"TextLabel"cK.BackgroundTransparency=1
cK.AnchorPoint=Vector2.new(1,0.5)cK.Position=UDim2.new(1,-8,0.5,0)
cK.Size=UDim2.new(0,44,0,18)cK.Font=Enum.Font.Code cK.TextSize=11
cr:_tag(cK,"TextColor3","Text")cK.Text="Ctrl K"cK.Parent=_
cr:_tag(_,"BackgroundColor3","Bg")


local cL=Instance.new"TextButton"cL.Text=""
cL.AnchorPoint=Vector2.new(1,0)cL.Position=UDim2.new(1,-242,0,4)
cL.Size=UDim2.fromOffset(32,32)cL.BackgroundColor3=cx.Bg
cL.BorderSizePixel=0 cf(cL,8)cL.Parent=cG
ch(cL,true)
cr:_tag(cL,"BackgroundColor3","Bg")
local cM=cp("keyboard",15,cx.Dim)
cM.AnchorPoint=Vector2.new(0.5,0.5)cM.Position=UDim2.new(0.5,0,0.5,0)
cM.Parent=cL
cL.MouseButton1Click:Connect(function()end)

local cN=Instance.new"TextButton"cN.Text=""
cN.AnchorPoint=Vector2.new(1,0)cN.Position=UDim2.new(1,-282,0,4)
cN.Size=UDim2.fromOffset(32,32)cN.BackgroundColor3=cx.Bg
cN.BorderSizePixel=0 cf(cN,8)cN.Parent=cG
ch(cN,true)
cr:_tag(cN,"BackgroundColor3","Bg")
local cO=cp("menu",15,cx.Dim)
cO.AnchorPoint=Vector2.new(0.5,0.5)cO.Position=UDim2.new(0.5,0,0.5,0)
cO.Parent=cN
cN.MouseButton1Click:Connect(function()end)


local cP=Instance.new"Frame"cP.BackgroundTransparency=1
cP.AnchorPoint=Vector2.new(1,0)cP.Position=UDim2.new(1,0,0,4)
cP.Size=UDim2.new(0,56,0,32)cP.Parent=cG
local cQ=Instance.new"UIListLayout"cQ.FillDirection=Enum.FillDirection.Horizontal
cQ.VerticalAlignment=Enum.VerticalAlignment.Center
cQ.HorizontalAlignment=Enum.HorizontalAlignment.Center
cQ.Padding=UDim.new(0,7)cQ.Parent=cP
local function dot(cR,cS)
local cT=Instance.new"TextButton"cT.Text=""
cT.Size=UDim2.fromOffset(12,12)cT.BackgroundColor3=cR
cT.BorderSizePixel=0 cf(cT,99)cT.AutoButtonColor=false cT.Parent=cP
cT.MouseEnter:Connect(function()cc(cT,c.Hover,{BackgroundTransparency=0.25})end)
cT.MouseLeave:Connect(function()cc(cT,c.Hover,{BackgroundTransparency=0})end)
return cT
end
local cR=dot(Color3.fromRGB(39,201,63))
local cS=dot(Color3.fromRGB(255,189,46))
local cT=dot(Color3.fromRGB(255,95,86))
cT.MouseButton1Click:Connect(function()end)
cS.MouseButton1Click:Connect(function()end)
cR.MouseButton1Click:Connect(function()end)


local cU=Instance.new"TextButton"cU.Text=""
cU.AnchorPoint=Vector2.new(1,0)cU.Position=UDim2.new(1,-322,0,4)
cU.Size=UDim2.fromOffset(32,32)cU.BackgroundColor3=cx.Bg
cU.BorderSizePixel=0 cf(cU,8)cU.Parent=cG
ch(cU,true)
cr:_tag(cU,"BackgroundColor3","Bg")
local cV=cp("bellring",14,cx.Dim)
cV.AnchorPoint=Vector2.new(0.5,0.5)cV.Position=UDim2.new(0.5,0,0.5,0)
cV.Parent=cU
local cW=Instance.new"Frame"cW.Size=UDim2.fromOffset(8,8)
cW.Position=UDim2.new(1,-7,0,3)cW.BorderSizePixel=0
cW.BackgroundColor3=Color3.fromRGB(248,113,113)
cf(cW,99)cW.Parent=cU cW.Visible=false
cU.MouseButton1Click:Connect(function()end)

co(cG,cC)


local cX=Instance.new"Frame"cX.Name="Body"
cX.Position=UDim2.new(0,0,0,62)cX.Size=UDim2.new(1,0,1,-62)
cX.BackgroundTransparency=1 cX.Parent=cC
local cY=Instance.new"UIPadding"cY.PaddingLeft=UDim.new(0,12)
cY.PaddingRight=UDim.new(0,12)cY.PaddingBottom=UDim.new(0,12)cY.Parent=cX

local cZ=Instance.new"Frame"cZ.Name="Sidebar"
cZ.Size=UDim2.new(0,164,1,0)cZ.BackgroundColor3=cx.Bg
cZ.BackgroundTransparency=(cw and not cr._transparent)and 0.15 or 0
cZ.BorderSizePixel=0 cf(cZ,10)cZ.Parent=cX
ch(cZ,true)
cr:_tag(cZ,"BackgroundColor3","Bg")
cl(cZ,10)
cj(cZ,8,8,8,8)

local c_=Instance.new"Frame"c_.Name="Nav"
c_.Size=UDim2.new(1,0,1,0)c_.BackgroundTransparency=1 c_.Parent=cZ
local c0=Instance.new"UIListLayout"c0.Padding=UDim.new(0,4)
c0.SortOrder=Enum.SortOrder.LayoutOrder c0.Parent=c_




local c1=Instance.new"Frame"c1.Name="_pill"
c1.Size=UDim2.new(1,0,0,38)c1.Position=UDim2.new(0,0,0,-2)
c1.BackgroundColor3=cx.Surface2 c1.BorderSizePixel=0
cf(c1,8)c1.Parent=cZ
ch(c1,true)
cr:_tag(c1,"BackgroundColor3","Surface2")

local c2=Instance.new"Frame"c2.Name="Pages"
c2.Position=UDim2.new(0,176,0,0)c2.Size=UDim2.new(1,-176,1,0)
c2.BackgroundTransparency=1 c2.ClipsDescendants=true c2.Parent=cX

local c3={
_gui=cz,_main=cC,_side=cZ,_nav=c_,_pages=c2,_pill=c1,
_tabs={},_active=nil,_toggleKey=cv,_visible=true,_keybinds={},
_conns={},_acrylicPref=cw,
}

function c3.Track(c4,c5)table.insert(c4._conns,c5)return c5 end
local c4
local c5
local c6,c7
c3._cfgTitle=ct

function c3._activateTab(c8,c9)
if c8 and c8._activate then pcall(c8._activate,c9~=false)end
end

function c3._flash(c8,c9)
if not c9 or not c9.Parent then return end
local da=Instance.new"Frame"da.Name="_flash"
da.Size=UDim2.fromScale(1,1)da.BackgroundColor3=cx.Accent
da.BackgroundTransparency=0.75 da.BorderSizePixel=0
cf(da,10)da.Parent=c9
cc(da,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()da:Destroy()end)end)
end

c3:Track(cq.InputBegan:Connect(function(c8,c9)
if c9 then return end
if c8.KeyCode==c3._toggleKey then c3:Toggle()end
if c8.KeyCode==Enum.KeyCode.K and cq:IsKeyDown(Enum.KeyCode.LeftControl)then
c3:TogglePalette()
end
if c8.KeyCode==Enum.KeyCode.P and cq:IsKeyDown(Enum.KeyCode.LeftControl)then
c3:TogglePalette()
end
if c8.KeyCode==Enum.KeyCode.Tab and cq:IsKeyDown(Enum.KeyCode.LeftControl)then
local da=table.find(c3._tabs,c3._active)or 0
local db=c3._tabs[(da%#c3._tabs)+1]
if db then b7:_sfx"Swap"c3._activateTab(db,true)end
end
end))

cJ:GetPropertyChangedSignal"Text":Connect(function()
local c8=string.lower(cJ.Text)
for c9,da in ipairs(c3._tabs)do
local db=c8==""or string.find(string.lower(da.Title),c8,1,true)~=nil
for dc,dd in ipairs(da.Elements)do
local de=c8==""or(dd.Title and string.find(string.lower(dd.Title),c8,1,true)~=nil)
dd._searchVisible=de or db
if dd.Frame then dd.Frame.Visible=dd._searchVisible end
end
da.Button.Visible=(db or c8=="")
if c8~=""then

for dc,dd in ipairs(da.Elements)do
if dd.Frame and dd.Frame.Visible then da.Button.Visible=true break end
end
end
end
end)
cJ.Focused:Connect(function()cc(_,c.Hover,{Size=UDim2.new(0,190,0,32)})end)
cJ.FocusLost:Connect(function()cc(_,c.Hover,{Size=UDim2.new(0,170,0,32)})end)

function c3.SetVisible(c8,c9)
c8._visible=c9

local function pillTarget()
local da,db=cz.AbsoluteSize.X,cz.AbsoluteSize.Y
if da<1 then da,db=1200,800 end
local dc,dd=c4.AbsolutePosition,c4.AbsoluteSize
return UDim2.new(0,dc.X+dd.X/2-da/2,0,dc.Y+dd.Y/2-db/2)
end
if c9 then
cz.Enabled=true
c8._mini=false
if c6 then c6.Visible=false end
if c4 then c4.Visible=false end
cC.Position=pillTarget()
cD.Scale=0.55
cC.GroupTransparency=1
cB.BackgroundTransparency=1
if c8._acrylicPref then b7:SetAcrylic(true,cs.Blur or 16)end
b7:_sfx"Open"
cc(cC,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
cc(cD,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1})
cc(cB,c.Med,{BackgroundTransparency=0.5})
else
c8._mini=false
if c6 then c6.Visible=false end
b7:SetAcrylic(false)
for da,db in pairs(b7.Sound._cache)do pcall(function()db:Stop()end)end
cc(cC,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
cc(cD,c.Fast,{Scale=0.55})
cc(cB,c.Fast,{BackgroundTransparency=1})
task.delay(0.36,function()
if c8._visible then return end
cz.Enabled=false
if c4 then
c4.Visible=true
c5.Scale=0.5
cc(c5,c.Spring,{Scale=1})
end
end)
end
end
function c3.Toggle(c8)c8:SetVisible(not c8._visible)end

function c3.SetMini(c8,c9)
c9=c9 and true or false
if c9==c8._mini then return end
c8._mini=c9
if c9 then
c8._visible=false
c4.Visible=false
b7:SetAcrylic(false)
for da,db in pairs(b7.Sound._cache)do pcall(function()db:Stop()end)end
cc(cC,c.Fast,{GroupTransparency=1})
cc(cD,c.Fast,{Scale=0.7})
cc(cB,c.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()
if not c8._mini then return end
cz.Enabled=false
c6.Visible=true
c7.Scale=0.5
cc(c7,c.Spring,{Scale=1})
end)
else
c6.Visible=false
c8:SetVisible(true)
end
end


local c8=Instance.new"UIScale"c8.Parent=cC
local c9=Instance.new"UIScale"c9.Scale=1 c9.Parent=cC
c3._sbMode=0
c3._focus=false
function c3._applyLayout(da)
local db=da._focus and 2 or da._sbMode
local dc=db==1
cZ.Visible=db~=2
if db==0 then
cc(cZ,c.Fast,{Size=UDim2.new(0,164,1,0)})
c2.Position=UDim2.new(0,176,0,0)
c2.Size=UDim2.new(1,-176,1,0)
elseif db==1 then
cc(cZ,c.Fast,{Size=UDim2.new(0,58,1,0)})
c2.Position=UDim2.new(0,70,0,0)
c2.Size=UDim2.new(1,-70,1,0)
else
c2.Position=UDim2.new(0,0,0,0)
c2.Size=UDim2.new(1,0,1,0)
end
for dd,de in ipairs(da._tabs)do
if de._label then de._label.Visible=not dc end
if de._icon and de._icon:IsA"GuiObject"then
de._icon.Position=dc and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end
end
function c3.CycleSidebar(da)
da._sbMode=(da._sbMode+1)%3
da:_applyLayout()
da:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[da._sbMode+1],Duration=1.5}
end
function c3.SetFocus(da,db)
da._focus=db and true or false
da:_applyLayout()
end
local function fitCard()
local da=Vector2.new(1200,800)
pcall(function()da=workspace.CurrentCamera.ViewportSize end)
local db=math.clamp(math.min(da.X/700,da.Y/520),0.6,1)
c8.Scale=db
if da.X<760 or cq.TouchEnabled then
if c3._sbMode==0 and not c3._userToggledSide then
c3._sbMode=2 c3:_applyLayout()
end
end
end
cN.MouseButton1Click:Connect(function()
b7:_sfx"Click"
c3._userToggledSide=true
c3:CycleSidebar()
end)
cL.MouseButton1Click:Connect(function()
b7:_sfx"Click"c3:ToggleKeybindList()
end)


local da=cs.ConfirmClose
if da==nil then da=true end
local function requestClose()
b7:_sfx"Click"
if da==false then c3:SetVisible(false)return end
local db=(type(da)=="table")and da or{}
c3:Dialog{
Title=db.Title or"Close interface?",
Content=db.Content or"The hub will minimize to the pill. Your settings stay active.",
Buttons={
{Title=db.Cancel or"Cancel"},
{Title=db.Confirm or"Close",Callback=function()c3:SetVisible(false)end},
},
}
end
cT.MouseButton1Click:Connect(function()requestClose()end)
cS.MouseButton1Click:Connect(function()
b7:_sfx"Click"c3:SetMini(not c3._mini)
end)
c3._zoomed=false
cR.MouseButton1Click:Connect(function()
b7:_sfx"Click"
c3._zoomed=not c3._zoomed
cc(cC,c.Med,{Size=c3._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
cU.MouseButton1Click:Connect(function()
b7:_sfx"Click"c3:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
c3:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

c4=Instance.new"TextButton"c4.Name=ad.GetStealthName()
c4.Text=""
c4.AnchorPoint=Vector2.new(0,0.5)c4.Position=UDim2.new(0,12,0.5,0)
c4.Size=UDim2.fromOffset(42,42)
c4.BackgroundColor3=cx.Surface2 c4.BorderSizePixel=0
cr:_tag(c4,"BackgroundColor3","Surface2")
cf(c4,13)c4.Parent=cz c4.Visible=false
ch(c4,true)
cn(c4,0.6,20)

local db=Instance.new"TextLabel"db.Size=UDim2.fromScale(1,1)
db.BackgroundTransparency=1 db.Font=Enum.Font.GothamBlack
db.TextSize=20 db.Text="K"db.Parent=c4
cr:_tag(db,"TextColor3","Text")
local dc=Instance.new"Frame"dc.Size=UDim2.fromOffset(9,9)
dc.Position=UDim2.new(1,-6,0,-3)dc.BorderSizePixel=0
cr:_tag(dc,"BackgroundColor3","Accent")
cf(dc,99)dc.Parent=c4
brandInto(c4,db)
if not cs.Logo or cs.Logo==""then kronosFace(c4,db,32,17)end
c5=Instance.new"UIScale"c5.Parent=c4
co(c4,c4)
c4.MouseButton1Click:Connect(function()c3:SetVisible(true)end)


c6=Instance.new"TextButton"c6.Name=ad.GetStealthName()
c6.Text=""
c6.AnchorPoint=Vector2.new(0,0)c6.Position=UDim2.new(0,12,0,12)
c6.Size=UDim2.fromOffset(44,44)
c6.BackgroundColor3=cx.Surface2 c6.BorderSizePixel=0
cr:_tag(c6,"BackgroundColor3","Surface2")
cf(c6,13)c6.Parent=cy c6.Visible=false
ch(c6,true)
cn(c6,0.6,20)
local dd=Instance.new"TextLabel"dd.Size=UDim2.fromScale(1,1)
dd.BackgroundTransparency=1 dd.Font=Enum.Font.GothamBlack
dd.TextSize=20 dd.Text="K"dd.Parent=c6
cr:_tag(dd,"TextColor3","Text")
local de=Instance.new"Frame"de.Size=UDim2.fromOffset(9,9)
de.Position=UDim2.new(1,-6,0,-3)de.BorderSizePixel=0
cr:_tag(de,"BackgroundColor3","Accent")
cf(de,99)de.Parent=c6
brandInto(c6,dd)
if not cs.Logo or cs.Logo==""then kronosFace(c6,dd,34,17)end
c7=Instance.new"UIScale"c7.Parent=c6
co(c6,c6)
c6.MouseButton1Click:Connect(function()c3:SetMini(false)end)


local df=Instance.new"TextButton"df.Text=""
df.AnchorPoint=Vector2.new(1,1)df.Position=UDim2.new(1,0,1,0)
df.Size=UDim2.fromOffset(28,28)df.BackgroundTransparency=1
df.Parent=cC df.ZIndex=50
df.ClipsDescendants=true


local dg=0
df.MouseButton1Click:Connect(function()
local dh=os.clock()
if dh-dg<0.35 then
b7:_sfx"Click"
c3._zoomed=not c3._zoomed
cc(cC,c.Med,{Size=c3._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
dg=dh
end)
local dh,di,dj=false
df.InputBegan:Connect(function(dk)
if dk.UserInputType==Enum.UserInputType.MouseButton1 or dk.UserInputType==Enum.UserInputType.Touch then
dh,di,dj=true,dk.Position,cC.Size
dk.Changed:Connect(function()
if dk.UserInputState==Enum.UserInputState.End then dh=false end
end)
end
end)
c3:Track(cq.InputChanged:Connect(function(dk)
if not dh then return end
if dk.UserInputType~=Enum.UserInputType.MouseMovement
and dk.UserInputType~=Enum.UserInputType.Touch then return end
local dl=dk.Position-di
cC.Size=UDim2.fromOffset(
math.clamp(dj.X.Offset+dl.X,520,920),
math.clamp(dj.Y.Offset+dl.Y,380,660))
end))

function c3.Notify(dk,dl)
dl=dl or{}
b7:_sfx"Notify"
b4.closeAny()
table.insert(b7._inbox,1,{Title=dl.Title or"Kronos",
Content=dl.Content or dl.Text or"",At=os.date"%H:%M"})
while#b7._inbox>30 do table.remove(b7._inbox)end
pcall(function()cW.Visible=true end)
local dm=ensureNotifyHost(cA)
local dn=Instance.new"CanvasGroup"dn.Size=UDim2.new(1,0,0,62)
dn.BackgroundColor3=cx.Surface2 dn.BorderSizePixel=0 dn.GroupTransparency=1
cf(dn,10)dn.Parent=dm
ch(dn,true)
cn(dn,0.65,24)
b7:_tag(dn,"BackgroundColor3","Surface2")
dn.Position=UDim2.new(0,40,0,0)
cc(dn,c.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local dp=Instance.new"TextLabel"dp.BackgroundTransparency=1
dp.Position=UDim2.new(0,12,0,8)dp.Size=UDim2.new(1,-24,0,17)
dp.Font=Enum.Font.GothamBold dp.TextSize=13 dp.TextXAlignment=0
b7:_tag(dp,"TextColor3","Text")dp.Text=dl.Title or"Kronos"dp.Parent=dn
local dq=Instance.new"TextLabel"dq.BackgroundTransparency=1
dq.Position=UDim2.new(0,12,0,27)dq.Size=UDim2.new(1,-24,0,16)
dq.Font=Enum.Font.Gotham dq.TextSize=12 dq.TextXAlignment=0
b7:_tag(dq,"TextColor3","Dim")
dq.TextTruncate=Enum.TextTruncate.AtEnd dq.Text=dl.Content or dl.Text or""dq.Parent=dn
local dr=Instance.new"Frame"dr.AnchorPoint=Vector2.new(0,1)
dr.Position=UDim2.new(0,10,1,-6)dr.Size=UDim2.new(1,-20,0,2)
dr.BorderSizePixel=0 b7:agrad(dr,0)
cf(dr,99)dr.Parent=dn
local ds=dl.Duration or 4
cc(dr,TweenInfo.new(ds,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(ds+0.1,function()
cc(dn,c.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()dn:Destroy()end)end)
end)
end


function c3.Dialog(dk,dl)
dl=dl or{}
b7:_sfx"Open"
local dm=Instance.new"TextButton"dm.Text=""dm.AutoButtonColor=false
dm.Size=UDim2.fromScale(1,1)dm.BackgroundColor3=Color3.fromRGB(0,0,0)
dm.BackgroundTransparency=1 dm.Parent=cz
cc(dm,c.Med,{BackgroundTransparency=0.55})
local dn=Instance.new"CanvasGroup"dn.AnchorPoint=Vector2.new(0.5,0.5)
dn.Position=UDim2.new(0.5,0,0.5,0)dn.Size=UDim2.fromOffset(320,170)
dn.BackgroundColor3=cx.Surface dn.BorderSizePixel=0 dn.GroupTransparency=1
cf(dn,12)dn.Parent=dm
ch(dn,true)
cl(dn,12)
cn(dn,0.5,40)
b7:_tag(dn,"BackgroundColor3","Surface")
local dp=Instance.new"UIScale"dp.Scale=0.94 dp.Parent=dn
cc(dn,c.Med,{GroupTransparency=0})
cc(dp,c.Spring,{Scale=1})
local function close()
cc(dn,c.Fast,{GroupTransparency=1})
cc(dm,c.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dm:Destroy()end)end)
end
dm.MouseButton1Click:Connect(function()end)
local dq=Instance.new"TextLabel"dq.BackgroundTransparency=1
dq.Position=UDim2.new(0,16,0,14)dq.Size=UDim2.new(1,-32,0,20)
dq.Font=Enum.Font.GothamBold dq.TextSize=15 dq.TextXAlignment=0
b7:_tag(dq,"TextColor3","Text")dq.Text=dl.Title or"Confirm"dq.Parent=dn
local dr=Instance.new"TextLabel"dr.BackgroundTransparency=1
dr.Position=UDim2.new(0,16,0,38)dr.Size=UDim2.new(1,-32,0,60)
dr.Font=Enum.Font.Gotham dr.TextSize=12 dq.TextXAlignment=0
dr.TextXAlignment=0 dr.TextYAlignment=0 dr.TextWrapped=true
b7:_tag(dr,"TextColor3","Dim")dr.Text=dl.Content or""dr.Parent=dn
local ds=Instance.new"Frame"ds.BackgroundTransparency=1
ds.AnchorPoint=Vector2.new(0,1)ds.Position=UDim2.new(0,0,1,-12)
ds.Size=UDim2.new(1,0,0,34)ds.Parent=dn
local dt=Instance.new"UIListLayout"dt.FillDirection=Enum.FillDirection.Horizontal
dt.HorizontalAlignment=Enum.HorizontalAlignment.Right dt.Padding=UDim.new(0,8)dt.Parent=ds
cj(ds,0,0,12,12)
for du,dv in ipairs(dl.Buttons or{{Title="OK"}})do
local dw=Instance.new"TextButton"dw.Text=""
dw.Size=UDim2.new(0,96,0,30)dw.BackgroundColor3=cx.Surface2
dw.BorderSizePixel=0 cf(dw,7)dw.AutoButtonColor=false dw.Parent=ds
ch(dw,true)
b7:_tag(dw,"BackgroundColor3","Surface2")
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1 dx.Size=UDim2.fromScale(1,1)
dx.Font=Enum.Font.GothamBold dx.TextSize=12
b7:_tag(dx,"TextColor3","Text")dx.Text=dv.Title dx.Parent=dw
local dy=Instance.new"UIScale"dy.Parent=dw
dw.MouseButton1Down:Connect(function()cc(dy,c.Hover,{Scale=0.95})end)
dw.MouseButton1Up:Connect(function()cc(dy,c.Spring,{Scale=1})end)
dw.MouseButton1Click:Connect(function()
close()cd(dv.Callback)
end)
end
return{Close=close}
end




function c3.KeySystem(dk,dl)
dl=dl or{}
local dm,dn=false,dl.FileName or("kronos_key_"..tostring(ct))

if dl.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(dn..".txt")then
local dp=readfile(dn..".txt")
if dp and dk:_checkKey(dl,dp)then dm=true end
end
end)
end
local dp=Instance.new"TextButton"dp.Text=""dp.AutoButtonColor=false
dp.Size=UDim2.fromScale(1,1)dp.BackgroundColor3=Color3.fromRGB(0,0,0)
dp.BackgroundTransparency=1 dp.ZIndex=200 dp.Parent=cz
cc(dp,c.Med,{BackgroundTransparency=0.6})
local dq=Instance.new"CanvasGroup"dq.AnchorPoint=Vector2.new(0.5,0.5)
dq.Position=UDim2.new(0.5,0,0.5,0)dq.Size=UDim2.fromOffset(300,210)
dq.BackgroundColor3=cx.Surface dq.BorderSizePixel=0 dq.GroupTransparency=1
cf(dq,12)dq.Parent=dp
ch(dq,true)
cl(dq,12)
cn(dq,0.5,40)
b7:_tag(dq,"BackgroundColor3","Surface")
local dr=Instance.new"UIScale"dr.Scale=0.94 dr.Parent=dq
cc(dq,c.Med,{GroupTransparency=0})
cc(dr,c.Spring,{Scale=1})
local ds=Instance.new"TextLabel"ds.BackgroundTransparency=1
ds.Position=UDim2.new(0,16,0,14)ds.Size=UDim2.new(1,-32,0,20)
ds.Font=Enum.Font.GothamBold ds.TextSize=15 ds.TextXAlignment=0
b7:_tag(ds,"TextColor3","Text")ds.Text=dl.Title or"Enter Key"ds.Parent=dq
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Position=UDim2.new(0,16,0,36)dt.Size=UDim2.new(1,-32,0,15)
dt.Font=Enum.Font.Gotham dt.TextSize=11 ds.TextXAlignment=0 dt.TextXAlignment=0
b7:_tag(dt,"TextColor3","Dim")dt.Text=string.upper(dl.Subtitle or"key required")dt.Parent=dq
local du=Instance.new"TextBox"du.PlaceholderText="Paste key..."
du.PlaceholderColor3=cx.Dim du.Text=""
du.Font=Enum.Font.Code du.TextSize=12
du.Position=UDim2.new(0,16,0,60)du.Size=UDim2.new(1,-32,0,32)
du.BackgroundColor3=cx.Surface2 du.BorderSizePixel=0
cf(du,8)du.Parent=dq
cj(du,4,4,10,10)
ch(du,true)
b7:_tag(du,"BackgroundColor3","Surface2")
b7:_tag(du,"TextColor3","Text")
local dv=Instance.new"TextLabel"dv.BackgroundTransparency=1
dv.Position=UDim2.new(0,16,0,96)dv.Size=UDim2.new(1,-32,0,15)
dv.Font=Enum.Font.Gotham dv.TextSize=11 dv.TextXAlignment=0 dv.Text=""
b7:_tag(dv,"TextColor3","Danger")dv.Parent=dq
local dw=Instance.new"TextButton"dw.Text=""
dw.Position=UDim2.new(0,16,0,118)dw.Size=UDim2.new(1,-32,0,32)
dw.BorderSizePixel=0 cf(dw,8)dw.AutoButtonColor=false dw.Parent=dq
b7:agrad(dw,15)
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1 dx.Size=UDim2.fromScale(1,1)
dx.Font=Enum.Font.GothamBold dx.TextSize=13 dx.Text="UNLOCK"
b7:oa(dx)dx.Parent=dw
local dy=Instance.new"UIScale"dy.Parent=dw
local dz
if dl.GetKeyLink then
dz=Instance.new"TextButton"dz.Text=""
dz.Position=UDim2.new(0,16,0,156)dz.Size=UDim2.new(1,-32,0,26)
dz.BackgroundTransparency=1 dz.Parent=dq
local dA=Instance.new"TextLabel"dA.BackgroundTransparency=1 dA.Size=UDim2.fromScale(1,1)
dA.Font=Enum.Font.Gotham dA.TextSize=11 dA.Text="Copy key link"
b7:_tag(dA,"TextColor3","Dim")dA.Parent=dz
dz.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(dl.GetKeyLink)end end)
dA.Text="Link copied"
task.delay(2,function()pcall(function()dA.Text="Copy key link"end)end)
end)
end
local function shake()local dA=
dq.Position.X.Offset
for dB=1,3 do
cc(dq,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
cc(dq,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
cc(dq,c.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
dm=true
if dl.SaveKey~=false then
pcall(function()if writefile then writefile(dn..".txt",du.Text)end end)
end
cc(dq,c.Fast,{GroupTransparency=1})
cc(dp,c.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()dp:Destroy()end)end)
dk:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
cd(dl.OnSuccess)
end
local function check()
local dA=du.Text
if dk:_checkKey(dl,dA)then unlock()
else dv.Text="Invalid key."task.spawn(shake)end
end
dw.MouseButton1Down:Connect(function()cc(dy,c.Hover,{Scale=0.96})end)
dw.MouseButton1Up:Connect(function()cc(dy,c.Spring,{Scale=1})end)
dw.MouseButton1Click:Connect(check)
du.FocusLost:Connect(function(dA)if dA then check()end end)
if dm then pcall(function()dp:Destroy()end)cd(dl.OnSuccess)end
return{Passed=function()return dm end}
end

function b7._checkKey(dk,dl,dm)
if dl.Validate and type(dl.Validate)=="function"then
local dn,dp=pcall(dl.Validate,dm)
if dn and dp then return true end
end
if dl.Key and dm==dl.Key then return true end
if dl.Keys and table.find(dl.Keys,dm)then return true end
if not dl.Key and not dl.Keys and not dl.Validate then return true end
return false
end


function c3.TogglePalette(dk,dl)
local dm=dk._palette
if not dm then
local dn=Instance.new"TextButton"dn.Text=""dn.AutoButtonColor=false
dn.Size=UDim2.fromScale(1,1)dn.BackgroundColor3=Color3.fromRGB(0,0,0)
dn.BackgroundTransparency=1 dn.Visible=false dn.ZIndex=b4.Z.Popup dn.Parent=cA
local dp=Instance.new"Frame"dp.AnchorPoint=Vector2.new(0.5,0)
dp.Position=UDim2.new(0.5,0,0,90)dp.Size=UDim2.fromOffset(380,300)
dp.BackgroundColor3=cx.Bg dp.BorderSizePixel=0
cf(dp,12)dp.Parent=dn
ch(dp,true)
cn(dp,0.5,40)
b7:_tag(dp,"BackgroundColor3","Bg")
local dq=Instance.new"TextBox"dq.PlaceholderText="Type a command..."
dq.PlaceholderColor3=cx.Dim dq.Text=""
dq.Font=Enum.Font.Gotham dq.TextSize=14
dq.Position=UDim2.new(0,14,0,12)dq.Size=UDim2.new(1,-28,0,32)
dq.BackgroundTransparency=1 dq.ClearTextOnFocus=false dq.Parent=dp
b7:_tag(dq,"TextColor3","Text")
local dr=Instance.new"Frame"dr.BorderSizePixel=0
dr.Position=UDim2.new(0,12,0,50)dr.Size=UDim2.new(1,-24,0,1)
dr.BackgroundColor3=Color3.fromRGB(255,255,255)
dr.BackgroundTransparency=0.93 dr.Parent=dp
local ds=Instance.new"ScrollingFrame"
ds.Position=UDim2.new(0,8,0,56)ds.Size=UDim2.new(1,-16,1,-64)
ds.BackgroundTransparency=1 ds.BorderSizePixel=0
ds.ScrollBarThickness=2 ds.CanvasSize=UDim2.new(0,0,0,0)
ds.AutomaticCanvasSize=Enum.AutomaticSize.Y ds.Parent=dp
b7:_tag(ds,"ScrollBarImageColor3","Surface2")
local dt=Instance.new"UIListLayout"dt.Padding=UDim.new(0,2)
dt.SortOrder=Enum.SortOrder.LayoutOrder dt.Parent=ds
dm={ov=dn,card=dp,box=dq,list=ds,open=false,sel=1,rows={}}
dk._palette=dm
local function fuzzy(du,dv)
du,dv=string.lower(du),string.lower(dv)
if du==""then return 0 end
local dw,dx,dy=1,0,0
for dz=1,#dv do
if string.sub(dv,dz,dz)==string.sub(du,dw,dw)then
dx+=(dy==dz-1)and 2 or 1
dy,dw=dz,dw+1
if dw>#du then return dx-dz*0.01 end
end
end
return nil
end
local function run(du)
if not du then return end
dm.ov.Visible,dm.open=false,false
b4.close(dm._closeLayer)
cc(dm.ov,c.Fast,{BackgroundTransparency=1})
if du.go then pcall(du.go)end
end
dm._run=run
local function render()
for du,dv in ipairs(dm.rows)do pcall(function()dv.frame:Destroy()end)end
dm.rows={}
local du=dq.Text
local dv={}
for dw,dx in ipairs(dk._tabs)do
local dy=fuzzy(du,dx.Title)
if dy then table.insert(dv,{label=dx.Title,hint="tab",score=dy+100,
go=function()dk._activateTab(dx,true)end})end
for dz,dA in ipairs(dx.Elements)do
if dA.Title and dA.Frame then
local dB=fuzzy(du,dx.Title.." "..dA.Title)
if dB then table.insert(dv,{label=dA.Title,hint=dx.Title,score=dB,
go=dA._go})end
end
end
end
table.sort(dv,function(dw,dx)return dw.score>dx.score end)
dm.sel=math.clamp(dm.sel,1,math.max(1,math.min(12,#dv)))
if#dv==0 then
local dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.Size=UDim2.new(1,0,0,30)dw.Font=Enum.Font.Gotham
dw.TextSize=12 dw.Text="No results"dw.Parent=ds
b7:_tag(dw,"TextColor3","Dim")
dm.rows={{frame=dw}}
return
end
for dw=1,math.min(12,#dv)do
local dx=dv[dw]
local dy=Instance.new"TextButton"dy.Text=""
dy.Size=UDim2.new(1,-4,0,32)dy.BorderSizePixel=0
dy.BackgroundColor3=cx.Surface2
dy.BackgroundTransparency=(dw==dm.sel)and 0.35 or 1
cf(dy,7)dy.Parent=ds
b7:_tag(dy,"BackgroundColor3","Surface2")
local dz=Instance.new"TextLabel"dz.BackgroundTransparency=1
dz.Position=UDim2.new(0,10,0,0)dz.Size=UDim2.new(1,-90,1,0)
dz.Font=Enum.Font.Gotham dz.TextSize=13 dz.TextXAlignment=0
dz.TextTruncate=Enum.TextTruncate.AtEnd dz.Text=dx.label dz.Parent=dy
b7:_tag(dz,"TextColor3","Text")
local dA=Instance.new"TextLabel"dA.BackgroundTransparency=1
dA.AnchorPoint=Vector2.new(1,0)dA.Position=UDim2.new(1,-10,0,0)
dA.Size=UDim2.new(0,70,1,0)dA.Font=Enum.Font.Gotham
dA.TextSize=10 dA.TextXAlignment=1 dz.TextTruncate=Enum.TextTruncate.AtEnd
dA.Text=dx.hint dA.Parent=dy
b7:_tag(dA,"TextColor3","Dim")
local dB=dw
dy.MouseButton1Click:Connect(function()run(dx)end)
dy.MouseEnter:Connect(function()
dm.sel=dB render()
end)
table.insert(dm.rows,{frame=dy,item=dx})
end
end
dm._render=render
dq:GetPropertyChangedSignal"Text":Connect(function()dm.sel=1 render()end)
dn.MouseButton1Click:Connect(function()
if dm.open then dk:TogglePalette(false)end
end)
dk:Track(cq.InputBegan:Connect(function(du,dv)
if not dm.open then return end
if du.KeyCode==Enum.KeyCode.Escape then dk:TogglePalette(false)
elseif du.KeyCode==Enum.KeyCode.Return or du.KeyCode==Enum.KeyCode.KeypadEnter then
local dw=dm.rows[dm.sel]
run(dw and dw.item)
elseif du.KeyCode==Enum.KeyCode.Up then
dm.sel=math.max(1,dm.sel-1)render()
elseif du.KeyCode==Enum.KeyCode.Down then
dm.sel=math.min(#dm.rows,dm.sel+1)render()
end
end))
dm._closeLayer=function()
if dm.open then dk:TogglePalette(false)end
end
end
local dn=(dl~=nil)and dl or(not dm.open)
dm.open=dn
dm.ov.Visible=dn
if dn then
b4.open(dm._closeLayer)
b7:_sfx"Open"
cc(dm.ov,c.Med,{BackgroundTransparency=0.45})
dm.card.Position=UDim2.new(0.5,0,0,78)
cc(dm.card,c.Med,{Position=UDim2.new(0.5,0,0,90)})
dm.box.Text,dm.sel="",1
dm._render()
task.defer(function()pcall(function()dm.box:CaptureFocus()end)end)
else
b4.close(dm._closeLayer)
cc(dm.ov,c.Fast,{BackgroundTransparency=1})
task.delay(0.15,function()if not dm.open then dm.ov.Visible=false end end)
end
end

function c3.SetTheme(dk,dl)b7:SetTheme(dl)end

function b7.SetAccent(dk,dl)
if typeof(dl)~="Color3"then return end
dk.Themes[dk.ThemeName].Accent=dl
dk:SetTheme(dk.ThemeName)
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

function b7._resolveFont(dk,dl)
local dm,dn=pcall(function()return Enum.Font[dl]end)
if dm and dn then return dn end
return nil
end
function b7._paintFonts(dk,dl)
local dm=dk.FontPacks[dk.FontPack]
if not dm then return end
for dn,dp in ipairs(dl:GetDescendants())do
if dp:IsA"TextLabel"or dp:IsA"TextButton"or dp:IsA"TextBox"then
local dq=dp:GetAttribute"KronosFontRole"
if not dq then
dq=dk._roleFromDefault[dp.Font]or"Body"
dp:SetAttribute("KronosFontRole",dq)
dp:SetAttribute("KronosBaseSize",dp.TextSize)
end
local dr=dp:GetAttribute"KronosBaseSize"or dp.TextSize
local ds=(dm.Bump and dm.Bump[dq])or 0
local dt=dm[dq]and dk:_resolveFont(dm[dq])or nil
pcall(function()
if dt then dp.Font=dt end
dp.TextSize=math.clamp(dr+ds,8,30)
end)
end
end
end
function b7.SetFontPack(dk,dl)
if not dk.FontPacks[dl]then return end
dk.FontPack=dl
if dk._gui then dk:_paintFonts(dk._gui)end
end
function b7.RefreshFonts(dk)
if dk._gui then dk:_paintFonts(dk._gui)end
end
function c3.SetAccent(dk,dl)b7:SetAccent(dl)end
function c3.SetScale(dk,dl)
c9.Scale=math.clamp(tonumber(dl)or 1,0.7,1.25)
end
function c3.SetCompact(dk,dl)
dl=dl and true or false
cc(cC,c.Med,{Size=dl and UDim2.fromOffset(560,400)
or(dk._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))})
for dm,dn in ipairs(dk._tabs)do
if dn._pl then dn._pl.Padding=dl and UDim.new(0,4)or UDim.new(0,8)end
end
end
function c3.ToggleAcrylic(dk,dl)
b7:ToggleAcrylic(dl)
cC.BackgroundTransparency=(dl and not b7._transparent)and 0.08 or 0
cZ.BackgroundTransparency=(dl and not b7._transparent)and 0.15 or 0
end
function c3.ToggleTransparency(dk,dl)
b7._transparent=dl and true or false
local dm=(b7._acrylicOn and not dl)and 0.08 or(dl and 0.25 or 0)
cC.BackgroundTransparency=dm
cZ.BackgroundTransparency=dl and 0.4 or((b7._acrylicOn and not dl)and 0.15 or 0)
end




local dk=Instance.new"TextButton"
dk.Name=ad.GetStealthName()
dk.Text=""dk.AutoButtonColor=false
dk.Size=UDim2.fromScale(1,1)
dk.BackgroundColor3=Color3.fromRGB(0,0,0)
dk.BackgroundTransparency=1 dk.BorderSizePixel=0
dk.Visible=false dk.Parent=cX
cf(dk,10)
local function slideCloseAll()
if c3._inboxPanel and c3._inboxPanel.open then c3:ToggleInbox(false)end
if c3._kbPanel and c3._kbPanel.open then c3:ToggleKeybindList(false)end
end
dk.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(dl)
if dl then
b4.open(slideCloseAll)
dk.Visible=true
cc(dk,c.Med,{BackgroundTransparency=0.5})
else
b4.close(slideCloseAll)
cc(dk,c.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local dm=c3._inboxPanel and c3._inboxPanel.open
local dn=c3._kbPanel and c3._kbPanel.open
if not dm and not dn then dk.Visible=false end
end)
end
end


function c3.ToggleInbox(dl,dm)
local dn=dl._inboxPanel
if not dn then
local dp=Instance.new"Frame"dp.AnchorPoint=Vector2.new(1,0)
dp.Position=UDim2.new(1,12,0,0)dp.Size=UDim2.new(0,230,1,0)
dp.BackgroundColor3=cx.Bg dp.BorderSizePixel=0
cf(dp,10)dp.Parent=cX dp.Visible=false
ch(dp,true)
b7:_tag(dp,"BackgroundColor3","Bg")
local dq=Instance.new"TextLabel"dq.BackgroundTransparency=1
dq.Position=UDim2.new(0,12,0,10)dq.Size=UDim2.new(1,-70,0,18)
dq.Font=Enum.Font.GothamBold dq.TextSize=11 dq.TextXAlignment=0
dq.Text="INBOX"dq.Parent=dp
b7:_tag(dq,"TextColor3","Dim")
local dr=Instance.new"TextButton"dr.Text=""
dr.AnchorPoint=Vector2.new(1,0)dr.Position=UDim2.new(1,-10,0,10)
dr.Size=UDim2.new(0,52,0,18)dr.BackgroundColor3=cx.Surface2
dr.BorderSizePixel=0 cf(dr,6)dr.AutoButtonColor=false dr.Parent=dp
ch(dr,true)
b7:_tag(dr,"BackgroundColor3","Surface2")
local ds=Instance.new"TextLabel"ds.BackgroundTransparency=1
ds.Size=UDim2.fromScale(1,1)ds.Font=Enum.Font.GothamBold
ds.TextSize=10 ds.Text="CLEAR"ds.Parent=dr
b7:_tag(ds,"TextColor3","Dim")
local dt=Instance.new"ScrollingFrame"
dt.Position=UDim2.new(0,8,0,34)dt.Size=UDim2.new(1,-16,1,-42)
dt.BackgroundTransparency=1 dt.BorderSizePixel=0
dt.ScrollBarThickness=2 dt.CanvasSize=UDim2.new(0,0,0,0)
dt.AutomaticCanvasSize=Enum.AutomaticSize.Y dt.Parent=dp
b7:_tag(dt,"ScrollBarImageColor3","Surface2")
local du=Instance.new"UIListLayout"du.Padding=UDim.new(0,4)
du.SortOrder=Enum.SortOrder.LayoutOrder du.Parent=dt
dn={panel=dp,list=dt,open=false}
dl._inboxPanel=dn
local function refresh()
for dv,dw in ipairs(dt:GetChildren())do
if dw:IsA"Frame"then pcall(function()dw:Destroy()end)end
end
if#b7._inbox==0 then
local dv=Instance.new"TextLabel"dv.BackgroundTransparency=1
dv.Size=UDim2.new(1,0,0,24)dv.Font=Enum.Font.Gotham
dv.TextSize=11 dv.Text="All caught up."dv.Parent=dt
b7:_tag(dv,"TextColor3","Dim")
return
end
for dv,dw in ipairs(b7._inbox)do
local dx=Instance.new"Frame"
dx.Size=UDim2.new(1,-2,0,44)dx.BackgroundColor3=cx.Surface2
dx.BackgroundTransparency=0.35 dx.BorderSizePixel=0
cf(dx,7)dx.Parent=dt
b7:_tag(dx,"BackgroundColor3","Surface2")
local dy=Instance.new"TextLabel"dy.BackgroundTransparency=1
dy.Position=UDim2.new(0,8,0,4)dy.Size=UDim2.new(1,-52,0,15)
dy.Font=Enum.Font.GothamBold dy.TextSize=11 dy.TextXAlignment=0
dy.TextTruncate=Enum.TextTruncate.AtEnd dy.Text=dw.Title dy.Parent=dx
b7:_tag(dy,"TextColor3","Text")
local dz=Instance.new"TextLabel"dz.BackgroundTransparency=1
dz.Position=UDim2.new(0,8,0,20)dz.Size=UDim2.new(1,-52,0,18)
dz.Font=Enum.Font.Gotham dz.TextSize=11 dz.TextXAlignment=0
dz.TextTruncate=Enum.TextTruncate.AtEnd dz.Text=dw.Content dz.Parent=dx
b7:_tag(dz,"TextColor3","Dim")
local dA=Instance.new"TextLabel"dA.BackgroundTransparency=1
dA.AnchorPoint=Vector2.new(1,0)dA.Position=UDim2.new(1,-8,0,4)
dA.Size=UDim2.new(0,40,0,14)dA.Font=Enum.Font.Code
dA.TextSize=10 dA.TextXAlignment=1 dA.Text=dw.At dA.Parent=dx
b7:_tag(dA,"TextColor3","Dim")
end
end
dn.refresh=refresh
dr.MouseButton1Click:Connect(function()
b7._inbox={}
refresh()
pcall(function()cW.Visible=false end)
end)
end
local dp=(dm~=nil)and dm or(not dn.open)
dn.open=dp
if dp then
if dl._kbPanel and dl._kbPanel.open then dl:ToggleKeybindList(false)end
slideShadeSet(true)
dn.refresh()
dn.panel.Visible=true
pcall(function()cW.Visible=false end)
cc(dn.panel,c.Med,{Position=UDim2.new(1,0,0,0)})
else
cc(dn.panel,c.Med,{Position=UDim2.new(1,12,0,0)})
slideShadeSet(dl._kbPanel~=nil and dl._kbPanel.open==true)
task.delay(0.26,function()if not dn.open then dn.panel.Visible=false end end)
end
end


function c3.ToggleKeybindList(dl,dm)
local dn=dl._kbPanel
if not dn then
local dp=Instance.new"Frame"dp.AnchorPoint=Vector2.new(1,0)
dp.Position=UDim2.new(1,12,0,0)dp.Size=UDim2.new(0,210,1,0)
dp.BackgroundColor3=cx.Bg dp.BorderSizePixel=0
cf(dp,10)dp.Parent=cX dp.Visible=false
ch(dp,true)
b7:_tag(dp,"BackgroundColor3","Bg")
local dq=Instance.new"TextLabel"dq.BackgroundTransparency=1
dq.Position=UDim2.new(0,12,0,10)dq.Size=UDim2.new(1,-24,0,18)
dq.Font=Enum.Font.GothamBold dq.TextSize=11 dq.TextXAlignment=0
dq.Text="KEYBINDS"dq.Parent=dp
b7:_tag(dq,"TextColor3","Dim")
local dr=Instance.new"ScrollingFrame"
dr.Position=UDim2.new(0,8,0,34)dr.Size=UDim2.new(1,-16,1,-42)
dr.BackgroundTransparency=1 dr.BorderSizePixel=0
dr.ScrollBarThickness=2 dr.CanvasSize=UDim2.new(0,0,0,0)
dr.AutomaticCanvasSize=Enum.AutomaticSize.Y dr.Parent=dp
b7:_tag(dr,"ScrollBarImageColor3","Surface2")
local ds=Instance.new"UIListLayout"ds.Padding=UDim.new(0,4)
ds.SortOrder=Enum.SortOrder.LayoutOrder ds.Parent=dr
dn={panel=dp,list=dr,open=false}
dl._kbPanel=dn
local function refresh()
for dt,du in ipairs(dr:GetChildren())do
if du:IsA"TextButton"then pcall(function()du:Destroy()end)end
end
if#dl._keybinds==0 then
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Size=UDim2.new(1,0,0,24)dt.Font=Enum.Font.Gotham
dt.TextSize=11 dt.Text="No keybinds yet"dt.Parent=dr
b7:_tag(dt,"TextColor3","Dim")
return
end
for dt,du in ipairs(dl._keybinds)do
local dv=Instance.new"TextButton"dv.Text=""
dv.Size=UDim2.new(1,-2,0,30)dv.BackgroundColor3=cx.Surface2
dv.BackgroundTransparency=0.35 dv.BorderSizePixel=0
cf(dv,7)dv.Parent=dr
b7:_tag(dv,"BackgroundColor3","Surface2")
local dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.Position=UDim2.new(0,8,0,0)dw.Size=UDim2.new(1,-70,1,0)
dw.Font=Enum.Font.Gotham dw.TextSize=11 dw.TextXAlignment=0
dw.TextTruncate=Enum.TextTruncate.AtEnd dw.Text=du.Title dw.Parent=dv
b7:_tag(dw,"TextColor3","Text")
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1
dx.AnchorPoint=Vector2.new(1,0)dx.Position=UDim2.new(1,-8,0,0)
dx.Size=UDim2.new(0,56,1,0)dx.Font=Enum.Font.Code
dx.TextSize=10 dx.TextXAlignment=1 dx.Text=du.GetName()dx.Parent=dv
b7:_tag(dx,"TextColor3","Dim")
dv.MouseButton1Click:Connect(function()
b7:_sfx"Click"du.Rebind()
task.delay(0.2,function()pcall(function()dx.Text=du.GetName()end)end)
end)
end
end
dn.refresh=refresh
dl._kbPanelRefresh=refresh
end
local dp=(dm~=nil)and dm or(not dn.open)
dn.open=dp
if dp then
if dl._inboxPanel and dl._inboxPanel.open then dl:ToggleInbox(false)end
slideShadeSet(true)
dn.refresh()
dn.panel.Visible=true
cc(dn.panel,c.Med,{Position=UDim2.new(1,0,0,0)})
else
cc(dn.panel,c.Med,{Position=UDim2.new(1,12,0,0)})
slideShadeSet(dl._inboxPanel~=nil and dl._inboxPanel.open==true)
task.delay(0.26,function()if not dn.open then dn.panel.Visible=false end end)
end
end


function c3.Onboarding(dl,dm)
dm=dm or{}
local dn=dm.Steps or dm.Pages or{{Title="Welcome",Content="This is Kronos."}}
local dp=1
local dq=Instance.new"TextButton"dq.Text=""dq.AutoButtonColor=false
dq.Size=UDim2.fromScale(1,1)dq.BackgroundColor3=Color3.fromRGB(0,0,0)
dq.BackgroundTransparency=1 dq.ZIndex=180 dq.Parent=cz
cc(dq,c.Med,{BackgroundTransparency=0.6})
local dr=Instance.new"CanvasGroup"dr.AnchorPoint=Vector2.new(0.5,0.5)
dr.Position=UDim2.new(0.5,0,0.5,0)dr.Size=UDim2.fromOffset(340,220)
dr.BackgroundColor3=cx.Surface dr.BorderSizePixel=0 dr.GroupTransparency=1
cf(dr,12)dr.Parent=dq
ch(dr,true)
cl(dr,12)
cn(dr,0.5,40)
b7:_tag(dr,"BackgroundColor3","Surface")
local ds=Instance.new"UIScale"ds.Scale=0.94 ds.Parent=dr
cc(dr,c.Med,{GroupTransparency=0})
cc(ds,c.Spring,{Scale=1})
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Position=UDim2.new(0,20,0,18)dt.Size=UDim2.new(1,-40,0,24)
dt.Font=Enum.Font.GothamBold dt.TextSize=17 dt.TextXAlignment=0 dt.Parent=dr
b7:_tag(dt,"TextColor3","Text")
local du=Instance.new"TextLabel"du.BackgroundTransparency=1
du.Position=UDim2.new(0,20,0,48)du.Size=UDim2.new(1,-40,0,90)
du.Font=Enum.Font.Gotham du.TextSize=13 dt.TextXAlignment=0
du.TextXAlignment=0 du.TextYAlignment=0 du.TextWrapped=true du.Parent=dr
b7:_tag(du,"TextColor3","Dim")
local dv=Instance.new"Frame"dv.BackgroundTransparency=1
dv.AnchorPoint=Vector2.new(0,1)dv.Position=UDim2.new(0,20,1,-52)
dv.Size=UDim2.new(0,120,0,10)dv.Parent=dr
local dw=Instance.new"UIListLayout"dw.FillDirection=Enum.FillDirection.Horizontal
dw.Padding=UDim.new(0,6)dw.Parent=dv
local dx={}
for dy=1,#dn do
local dz=Instance.new"Frame"dz.Size=UDim2.fromOffset(8,8)
dz.BorderSizePixel=0 cf(dz,99)dz.Parent=dv
b7:_tag(dz,"BackgroundColor3","Surface2")
dx[dy]=dz
end
local dy,dz,dA
local function paint()
dt.Text,du.Text=dn[dp].Title or"",dn[dp].Content or""
for dB,dC in ipairs(dx)do
if dB==dp then b7:_tag(dC,"BackgroundColor3","Accent")
else b7:_tag(dC,"BackgroundColor3","Surface2")end
end
dy.Visible=dp>1
dA.Text=(dp==#dn)and"FINISH"or"NEXT"
dt.Position=UDim2.new(0,26,0,18)
cc(dt,c.Fast,{Position=UDim2.new(0,20,0,18)})
end
local dB=Instance.new"Frame"dB.BackgroundTransparency=1
dB.AnchorPoint=Vector2.new(0,1)dB.Position=UDim2.new(0,0,1,-12)
dB.Size=UDim2.new(1,0,0,34)dB.Parent=dr
local dC=Instance.new"UIListLayout"dC.FillDirection=Enum.FillDirection.Horizontal
dC.HorizontalAlignment=Enum.HorizontalAlignment.Right dC.Padding=UDim.new(0,8)dC.Parent=dB
cj(dB,0,0,12,12)
dy=Instance.new"TextButton"dy.Text=""
dy.Size=UDim2.new(0,80,0,30)dy.BackgroundTransparency=1 dy.Parent=dB
local dD=Instance.new"TextLabel"dD.BackgroundTransparency=1
dD.Size=UDim2.fromScale(1,1)dD.Font=Enum.Font.GothamBold
dD.TextSize=12 dD.Text="BACK"dD.Parent=dy
b7:_tag(dD,"TextColor3","Dim")
local dE=Instance.new"TextButton"dE.Text=""
dE.Size=UDim2.new(0,80,0,30)dE.BackgroundTransparency=1 dE.Parent=dB
local dF=Instance.new"TextLabel"dF.BackgroundTransparency=1
dF.Size=UDim2.fromScale(1,1)dF.Font=Enum.Font.Gotham
dF.TextSize=12 dF.Text="Skip"dF.Parent=dE
b7:_tag(dF,"TextColor3","Dim")
dz=Instance.new"TextButton"dz.Text=""
dz.Size=UDim2.new(0,96,0,30)dz.BorderSizePixel=0
cf(dz,7)dz.AutoButtonColor=false dz.Parent=dB
b7:agrad(dz,15)
dA=Instance.new"TextLabel"dA.BackgroundTransparency=1
dA.Size=UDim2.fromScale(1,1)dA.Font=Enum.Font.GothamBold
dA.TextSize=12
dA.Text="NEXT"dA.Parent=dz
b7:oa(dA)
local function close()
cc(dr,c.Fast,{GroupTransparency=1})
cc(dq,c.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()dq:Destroy()end)end)
cd(dm.OnFinish)
end
dy.MouseButton1Click:Connect(function()
b7:_sfx"Click"dp=math.max(1,dp-1)paint()
end)
dE.MouseButton1Click:Connect(function()close()end)
dz.MouseButton1Click:Connect(function()
b7:_sfx"Click"
if dp>=#dn then close()else dp+=1 paint()end
end)
paint()
end



function c3.Tab(dl,dm)
return b1({
Window=c3,opts=cs,Th=cx,pgui=cA,
pages=c2,nav=c_,pill=c1,subLbl=S,
},dm)
end

function c3.SaveConfig(dl,dm)
bT.Save(dl,dm)
end
function c3.LoadConfig(dl,dm)
bT.Load(dl,dm)
end

function c3.Destroy(dl)
for dm,dn in ipairs(dl._conns)do pcall(function()dn:Disconnect()end)end
dl._conns={}
for dm,dn in pairs(b7.Sound._cache)do pcall(function()dn:Stop()dn:Destroy()end)end
b7.Sound._cache={}
b7:SetAcrylic(false)
if b7._gui==cz then b7._gui=nil end
pcall(function()c6:Destroy()end)
pcall(function()cz:Destroy()end)
pcall(function()cA:Destroy()end)
end

ad.registerUnload(function()
pcall(function()c3:Destroy()end)
end)
af.paintFonts(cz)
return c3
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()




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
local bT=ae:Log{Title="Console",Lines={"hub loaded"}}
bT:Add"aimbot armed"
local b1=ab:Tab{Title="Visuals",Icon="eye"}
b1:Section"ESP"
b1:Toggle{Title="Box ESP",Value=true,Flag="BoxESP"}
b1:Colorpicker{Title="ESP Color",Value=Color3.fromRGB(110,140,255),Flag="ESPColor"}
b1:Dropdown{Title="Chams",Values={"Enemies","Team","NPCs","Chests","Ores"},
Multi=true,Value={"Enemies"},Flag="Chams"}
local b4=ab:Tab{Title="Settings",Icon="settings"}
b4:Profile{Name="kronos_user",Tag="Premium • keyless"}
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
b4:Button{Title="Keybinds panel",Description="Slide-over, click a row to rebind",
Callback=function()ab:ToggleKeybindList()end}
b4:Button{Title="Command palette",Description="Same as Ctrl+K",
Callback=function()ab:TogglePalette(true)end}
b4:Section"Profiles"
b4:Profiles{Title="My profiles"}
ab:Notify{Title="Kronos loaded",Content="Ctrl+K palette • RightShift hide",Duration=5}
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

b4._tag=function(b7,c,cc,cd)
return af.tag(c,cc,cd)
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
