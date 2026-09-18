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
Version="2.0",
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
local c=a.a()

local d={
Hover=TweenInfo.new(0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
Fast=TweenInfo.new(0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
Med=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
Slow=TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
Spring=TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
Fill05=TweenInfo.new(0.05,Enum.EasingStyle.Linear),
Fill08=TweenInfo.new(0.08,Enum.EasingStyle.Linear),
}

local function tween(e,f,g)
if c.ReducedMotion then
pcall(function()
for h,i in pairs(g)do e[h]=i end
end)
return nil
end
local h,i=pcall(function()return b:Create(e,f,g)end)
if h and i then pcall(function()i:Play()end)return i end
return nil
end

return{T=d,tween=tween}end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()



local b=a.b()

local c=b.cloneref_check(game:GetService"UserInputService")

local d={Backdrop=100,Popup=200,Toast=300}

local e

local function open(f)
if e and e~=f then
local g=e
e=nil
pcall(g)
end
e=f
end

local function close(f)
if e==f then e=nil end
end

local function closeAny()
if e then
local f=e
e=nil
pcall(f)
end
end

c.InputBegan:Connect(function(f,g)
if g then return end
if f.KeyCode==Enum.KeyCode.Escape then closeAny()end
end)



local function backdrop(f,g,h)
local i=Instance.new"TextButton"
i.Name=b.GetStealthName()
i.Text=""
i.AutoButtonColor=false
i.Size=UDim2.fromScale(1,1)
i.BackgroundTransparency=1
i.BorderSizePixel=0
i.ZIndex=h or d.Backdrop
i.Parent=f
i.InputBegan:Connect(function(j)
if j.UserInputType==Enum.UserInputType.MouseButton1
or j.UserInputType==Enum.UserInputType.Touch then
g()
end
end)
return i
end

return{Z=d,open=open,close=close,closeAny=closeAny,backdrop=backdrop}end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()



local b=a.c()
local c=a.b()
local d=b.tween
local e=b.T

local f=c.cloneref_check(game:GetService"UserInputService")

local g=0
local function guid()
g+=1
return"t"..g.."_"..tostring(math.random(10000,99999))
end

local function spawnCb(h,...)
local i={...}
if type(h)=="function"then task.spawn(function()pcall(h,table.unpack(i))end)end
end

local function corner(h,i)
local j=Instance.new"UICorner"
j.CornerRadius=UDim.new(0,i)
pcall(function()j:SetAttribute("KRadius",i)end)
j.Parent=h
return j
end

local function hairline(h,i)
local j=Instance.new"UIStroke"
j.Thickness=1
j.Color=Color3.fromRGB(255,255,255)
j.Transparency=i and 0.88 or 0.93
j.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
j.LineJoinMode=Enum.LineJoinMode.Round
j.Parent=h
return j
end

local function pad(h,i,j,k,l)
local m=Instance.new"UIPadding"
m.PaddingTop=UDim.new(0,i or 8)
m.PaddingBottom=UDim.new(0,j or i or 8)
m.PaddingLeft=UDim.new(0,k or 8)
m.PaddingRight=UDim.new(0,l or k or 8)
m.Parent=h
return m
end

local function lighting(h,i)
local j=Instance.new"Frame"
j.Name="_light"
j.Size=UDim2.fromScale(1,1)
j.BackgroundColor3=Color3.fromRGB(255,255,255)
j.BackgroundTransparency=0
j.BorderSizePixel=0
local k=Instance.new"UIGradient"
k.Rotation=90
k.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.93),
NumberSequenceKeypoint.new(0.45,1),
NumberSequenceKeypoint.new(1,1),
}
k.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
k.Parent=j
corner(j,i or 10)
j.Parent=h
return j
end

local function topLight(h)
local i=Instance.new"UIGradient"
i.Rotation=90
i.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(0.25,1),
NumberSequenceKeypoint.new(1,1),
}
i.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
local j=Instance.new"Frame"
j.Name=c.GetStealthName()
j.Size=UDim2.new(1,0,0,12)
j.BackgroundColor3=Color3.fromRGB(255,255,255)
j.BackgroundTransparency=0.96
j.BorderSizePixel=0
i.Parent=j
j.Parent=h
corner(j,10)
return j
end

local function shadow(h,i,j)
pcall(function()
local k=Instance.new"UIShadow"
k.Transparency=i or 0.55
k.BlurSize=j or 32
k.Color=Color3.fromRGB(0,0,0)
k.Parent=h
end)
end

local function makeDraggable(h,i)
local j,k,l=false
h.InputBegan:Connect(function(m)
if m.UserInputType==Enum.UserInputType.MouseButton1 or m.UserInputType==Enum.UserInputType.Touch then
j,k,l=true,m.Position,i.Position
m.Changed:Connect(function()
if m.UserInputState==Enum.UserInputState.End then j=false end
end)
end
end)
f.InputChanged:Connect(function(m)
if j and(m.UserInputType==Enum.UserInputType.MouseMovement or m.UserInputType==Enum.UserInputType.Touch)then
local n=m.Position-k
i.Position=UDim2.new(l.X.Scale,l.X.Offset+n.X,l.Y.Scale,l.Y.Offset+n.Y)
end
end)
end

local function ripple(h)
h.ClipsDescendants=true
h.MouseButton1Down:Connect(function(i,j)
local k=Instance.new"Frame"
k.Name=c.GetStealthName()
k.AnchorPoint=Vector2.new(0.5,0.5)
k.BackgroundColor3=Color3.fromRGB(255,255,255)
k.BackgroundTransparency=0.8
k.Size=UDim2.fromOffset(8,8)
k.BorderSizePixel=0
k.Position=UDim2.fromOffset(i-h.AbsolutePosition.X,j-h.AbsolutePosition.Y)
corner(k,99)
k.Parent=h
local l=math.max(h.AbsoluteSize.X,h.AbsoluteSize.Y)*1.5
d(k,TweenInfo.new(0.45,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{Size=UDim2.fromOffset(l,l),BackgroundTransparency=1})
task.delay(0.5,function()pcall(function()k:Destroy()end)end)
end)
end


local function spotlight(h,i)
local j=Instance.new"Frame"j.Name="_spot"
j.Size=UDim2.fromScale(1,1)j.BackgroundColor3=Color3.fromRGB(255,255,255)
j.BackgroundTransparency=1 j.BorderSizePixel=0 j.ZIndex=1
corner(j,10)j.Parent=h
local k=Instance.new"UIGradient"k.Rotation=15
k.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.88-(i or 0.08)),
NumberSequenceKeypoint.new(1,1),
}
k.Offset=Vector2.new(0,0)k.Parent=j
pcall(function()
h.InputChanged:Connect(function(l)
if l.UserInputType==Enum.UserInputType.MouseMovement then
local m,n=h.AbsolutePosition.X,math.max(1,h.AbsoluteSize.X)
local o=math.clamp((l.Position.X-m)/n-0.5,-0.5,0.5)
pcall(function()k.Offset=Vector2.new(o,0)end)
end
end)
h.MouseEnter:Connect(function()
d(j,e.Hover,{BackgroundTransparency=0.55})
end)
h.MouseLeave:Connect(function()
d(j,e.Hover,{BackgroundTransparency=1})
end)
end)
return j
end


local function attachTip(h,i)
if not i or i==""then return end
if not h or not h.Parent then return end
local j=Instance.new"TextLabel"
j.Name=c.GetStealthName()
j.BackgroundColor3=Color3.fromRGB(20,22,30)
j.BorderSizePixel=0
j.Font=Enum.Font.Gotham j.TextSize=11
j.TextColor3=Color3.fromRGB(220,224,235)
j.Text=tostring(i)
j.Size=UDim2.new(0,math.clamp(14+6*string.len(tostring(i)),40,260),0,22)
j.AnchorPoint=Vector2.new(1,0)
j.Position=UDim2.new(1,-8,0,-24)
j.Visible=false j.ZIndex=50 j.Parent=h
corner(j,6)
pcall(function()
h.MouseEnter:Connect(function()j.Visible=true end)
h.MouseLeave:Connect(function()j.Visible=false end)
end)
return j
end


local function mdToRich(h)
h=tostring(h or"")
h=h:gsub("&","&amp;"):gsub("<","&lt;"):gsub(">","&gt;")
h=h:gsub("%*%*(.-)%*%*","<b>%1</b>")
h=h:gsub("`(.-)`","<font face=\"Code\">%1</font>")
h=h:gsub("\n## (.-)\n","\n<b>%1</b>\n")
return h
end


local function setDisabled(h,i)
if not h or not h.Parent then return end
local j=h:FindFirstChild"_disabled"
if i then
if j then j.Visible=true return end
j=Instance.new"TextButton"
j.Name="_disabled"j.Text=""j.AutoButtonColor=false
j.Size=UDim2.fromScale(1,1)
j.BackgroundColor3=Color3.fromRGB(0,0,0)
j.BackgroundTransparency=0.55
j.BorderSizePixel=0
j.Parent=h
corner(j,10)
else
if j then j.Visible=false end
end
end


local h=a.d()
local function attachCtx(i,j,k)
if not k or#k==0 then return end
if not j or not i then return end
local l,m,n
local function close()
if m then pcall(function()m:Destroy()end)m=nil end
if n then pcall(function()n:Destroy()end)n=nil end
if l then h.close(l)l=nil end
end
l=close
j.InputBegan:Connect(function(o)
if o.UserInputType~=Enum.UserInputType.MouseButton2 then return end
close()
h.open(close)
n=h.backdrop(i,close)
m=Instance.new"Frame"
m.Name=c.GetStealthName()
m.Size=UDim2.new(0,150,0,#k*30+8)
m.BackgroundColor3=Color3.fromRGB(18,20,28)
m.BorderSizePixel=0
m.ZIndex=h.Z.Popup
m.Parent=i
corner(m,8)
local p=o.Position
local q=Vector2.new(1200,800)
pcall(function()q=workspace.CurrentCamera.ViewportSize end)
m.Position=UDim2.fromOffset(
math.clamp(p.X,8,q.X-158),
math.clamp(p.Y,8,q.Y-(#k*30+16)))
for r,s in ipairs(k)do
local t=Instance.new"TextButton"t.Text=""
t.Size=UDim2.new(1,-8,0,26)t.Position=UDim2.new(0,4,0,4+(r-1)*30)
t.BackgroundColor3=Color3.fromRGB(30,33,45)
t.BackgroundTransparency=1
t.BorderSizePixel=0 corner(t,6)t.Parent=m
t.ZIndex=h.Z.Popup+1
local u=Instance.new"TextLabel"u.BackgroundTransparency=1
u.Position=UDim2.new(0,10,0,0)u.Size=UDim2.new(1,-20,1,0)
u.Font=Enum.Font.Gotham u.TextSize=12 u.TextXAlignment=0
u.TextTruncate=Enum.TextTruncate.AtEnd
u.Text=tostring(s.Title or s.Text or"Item")u.Parent=t
u.TextColor3=Color3.fromRGB(235,238,245)
u.ZIndex=h.Z.Popup+2
t.MouseButton1Click:Connect(function()
close()
spawnCb(s.Callback)
end)
end
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
spotlight=spotlight,
attachTip=attachTip,
mdToRich=mdToRich,
setDisabled=setDisabled,
attachCtx=attachCtx,
}end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()


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

return{Icons=c,IconAlias=d,makeIcon=makeIcon}end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()


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

return{Sound=d,sfx=sfx}end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()


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
}end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()


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


local function SetSharp(c)
b.SharpCorners=(c==nil)and true or(c and true or false)
if not b._gui then return end
for d,e in ipairs(b._gui:GetDescendants())do
if e:IsA"UICorner"then
pcall(function()
local f=e:GetAttribute"KRadius"
if f==nil then return end
if b.SharpCorners then
e.CornerRadius=UDim.new(0,0)
else
e.CornerRadius=UDim.new(0,tonumber(f)or 8)
end
end)
end
end
end

return{
Themes=b.Themes,
tag=tag,
SetTheme=SetTheme,
oa=oa,
agrad=agrad,
SetAccent=SetAccent,
SetSharp=SetSharp,
}end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()






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

return{SetAcrylic=SetAcrylic,ToggleAcrylic=ToggleAcrylic}end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()


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

local e="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function b64e(f)
local g,h={},#f
local i=1
while i<=h do
local j,k,l=string.byte(f,i,i+2)
j=j or 0 k=k or 0 l=l or 0
local m=j*65536+k*256+l
local n=math.floor(m/262144)%64+1
local o=math.floor(m/4096)%64+1
local p=math.floor(m/64)%64+1
local q=m%64+1
table.insert(g,string.sub(e,n,n)..string.sub(e,o,o))
table.insert(g,(i+1>h)and"="or string.sub(e,p,p))
table.insert(g,(i+2>h)and"="or string.sub(e,q,q))
i+=3
end
return table.concat(g)
end
local function b64d(f)
f=string.gsub(f or"","[^"..e.."=]","")
local g={}
local h=1
while h<=#f do
local i=string.find(e,string.sub(f,h,h))or 1
local j=string.find(e,string.sub(f,h+1,h+1))or 1
local k=string.find(e,string.sub(f,h+2,h+2))or 1
local l=string.find(e,string.sub(f,h+3,h+3))or 1
i,j,k,l=i-1,j-1,k-1,l-1
local m=i*262144+j*4096+k*64+l
local n=math.floor(m/65536)%256
local o=math.floor(m/256)%256
local p=m%256
table.insert(g,string.char(n))
if string.sub(f,h+2,h+2)~="="then table.insert(g,string.char(o))end
if string.sub(f,h+3,h+3)~="="then table.insert(g,string.char(p))end
h+=4
end
return table.concat(g)
end

local function collectFlags()
local f={}
for g,h in pairs(b.Flags)do
if string.sub(g,1,8)~="_loaded_"then
if typeof(h)=="Color3"then f[g]={"__c3",h.R,h.G,h.B}
elseif typeof(h)=="EnumItem"then f[g]={"__k",h.Name}
else local i=pcall(function()d:JSONEncode(h)end)if i then f[g]=h end end
end
end
return f
end
local function applyData(f,g)
for h,i in pairs(g)do
local j=i
if type(i)=="table"and i[1]=="__c3"then j=Color3.new(i[2],i[3],i[4])
elseif type(i)=="table"and i[1]=="__k"then j=i[2]end
b.Flags[h]=j
local k=b._live[h]
if k then
for l,m in ipairs(k)do pcall(m,j,true)end
else
b.Flags["_loaded_"..h]=j
end
end
end

local function Export(f)
local g,h=pcall(function()return d:JSONEncode(collectFlags())end)
if not g then return nil end
local i=b64e(h)
pcall(function()if setclipboard then setclipboard(i)end end)
f:Notify{Title="String exported",Content=string.len(i).." chars copied",Duration=2}
return i
end
local function Import(f,g)
g=g or""
if g==""then
pcall(function()
if getclipboard then g=getclipboard()end
end)
end
local h,i=pcall(b64d,g)
if not h or not i or i==""then
f:Notify{Title="Import failed",Content="Bad string",Duration=2}return false
end
local j,k=pcall(function()return d:JSONDecode(i)end)
if not j or type(k)~="table"then
f:Notify{Title="Import failed",Content="Bad JSON",Duration=2}return false
end
applyData(f,k)
f:Notify{Title="String imported",Content="Applied",Duration=2}
return true
end
local function AutoSave(f,g,h,i)
if f._autoConn then pcall(function()f._autoConn:Disconnect()end)f._autoConn=nil end
if f._autoTask then pcall(task.cancel,f._autoTask)f._autoTask=nil end
if not g then return end
h=h or"autosave"i=i or 30
f._autoTask=task.spawn(function()
while b._gui and b._gui.Parent do
task.wait(i)
if b._gui and b._gui.Parent then pcall(function()Save(f,h)end)end
end
end)
end

return{Save=Save,Load=Load,Export=Export,Import=Import,AutoSave=AutoSave}end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()



local b=a.a()
local c=a.c()
local d=a.e()
local e=a.f()a.i()a.g()


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
end end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()




local b=a.a()
local c=a.c()
local d=a.e()
local e=a.f()a.i()a.g()


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
end end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()




local b=a.a()
local c=a.c()
local d=a.e()
local e=a.f()a.i()a.g()


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
end end function a.n():typeof(__modImpl())local aa=a.cache.n if not aa then aa={c=__modImpl()}a.cache.n=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local b=a.c()
local c=a.e()
local d=a.f()a.i()a.g()


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
end end function a.o():typeof(__modImpl())local aa=a.cache.o if not aa then aa={c=__modImpl()}a.cache.o=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


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
end end function a.p():typeof(__modImpl())local aa=a.cache.p if not aa then aa={c=__modImpl()}a.cache.p=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


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
local aw=ac.ripple
local ax=ac.spotlight
local ay=ac.attachTip
local az=ac.attachCtx
local aA=ac.setDisabled local aB=
ad.makeIcon
local aC=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")


aa._busy=aa._busy or{}
if not aa.Busy then
function aa.Busy(aD,c)
local f=aa._busy and aa._busy[aD]
if f then
if c==false or c==nil then pcall(function()f.done()end)
else pcall(function()f.set(c)end)end
end
end
function aa.Done(aD)
aa.Busy(aD,false)
end
end

return function(aD,c)
local f=aD.row
local g=aD.titleBlock
local N=aD.reg
local S=aD.tab
local _=aD.Window
local aE=aD.Th local aF=
aD.opts or{}local aG=
aD.page
local aH=aD.pgui
c=c or{}
local aI=f(c.Description and 54 or 40)
g(aI,c.Title or"Button",c.Description,90)
ax(aI,0.08)
if c.Tooltip then ay(aI,c.Tooltip)end
if c.ContextMenu then az(aH,aI,c.ContextMenu)end
local aJ=Instance.new"TextButton"aJ.Text=""
aJ.Size=UDim2.fromScale(1,1)aJ.BackgroundTransparency=1
aJ.Parent=aI as(aJ,10)
local aK=Instance.new"Frame"aK.AnchorPoint=Vector2.new(1,0.5)
aK.Position=UDim2.new(1,-12,0.5,0)aK.Size=UDim2.fromOffset(62,28)
aK.BackgroundColor3=aE.Surface2 aK.BorderSizePixel=0
as(aK,7)aK.Parent=aI
at(aK,true)
af:_tag(aK,"BackgroundColor3","Surface2")
local aL=Instance.new"TextLabel"aL.Size=UDim2.fromScale(1,1)
aL.BackgroundTransparency=1 aL.Font=Enum.Font.GothamBold aL.TextSize=11
aL.Text=c.HoldTime and("HOLD "..tostring(c.HoldTime).."s")or(c.Label or"RUN")aL.Parent=aK
af:_tag(aL,"TextColor3",c.Danger and"Danger"or"Dim")
local aM=Instance.new"UIScale"aM.Parent=aK
aw(aJ)
aJ.MouseButton1Down:Connect(function()an(aM,am.Hover,{Scale=0.93})end)
aJ.MouseButton1Up:Connect(function()an(aM,am.Spring,{Scale=1})end)
aJ.MouseEnter:Connect(function()af:_tag(aL,"TextColor3","Text")end)
aJ.MouseLeave:Connect(function()af:_tag(aL,"TextColor3",c.Danger and"Danger"or"Dim")end)
local aN=false
local function fireBtn()
if aN then return end
if _._activateTab then _._activateTab(S,true)end
_:_flash(aI)af:_sfx"Click"ar(c.Callback)ar(c.OnChanged)
end



local aO,aP,aQ,aR
local aS={}
local function ringBuild()
if aO and aO.Parent then return end
aO=Instance.new"Frame"aO.Name="_ring"
aO.AnchorPoint=Vector2.new(0.5,0.5)aO.Position=UDim2.new(0.5,0,0.5,0)
aO.Size=UDim2.fromOffset(20,20)aO.BackgroundTransparency=1
aO.Visible=false aO.Parent=aK
aP={}
for aT=0,11 do
local aU=(aT/12)*math.pi*2-math.pi/2
local aV=Instance.new"Frame"aV.BorderSizePixel=0
aV.Size=UDim2.fromOffset(3,3)
aV.Position=UDim2.new(0.5,math.cos(aU)*8-1.5,0.5,math.sin(aU)*8-1.5)
aV.BackgroundColor3=aE.Accent
aV.BackgroundTransparency=0.85
as(aV,99)aV.Parent=aO
af:_tag(aV,"BackgroundColor3","Accent")
table.insert(aP,aV)
end
aQ=Instance.new"TextLabel"aQ.BackgroundTransparency=1
aQ.Size=UDim2.fromScale(1,1)aQ.Font=Enum.Font.Code
aQ.TextSize=8 aQ.Text=""aQ.Parent=aO
af:_tag(aQ,"TextColor3","Text")
end
local function ringPaint(aT)
if not aP then return end
if aT==nil then
for aU,aV in ipairs(aP)do pcall(function()aV.BackgroundTransparency=0.15 end)end
if aQ then aQ.Text=""end
else
local aU=math.floor(math.clamp(tonumber(aT)or 0,0,1)*12+0.5)
for aV,aW in ipairs(aP)do
pcall(function()aW.BackgroundTransparency=(aV<=aU)and 0.1 or 0.88 end)
end
if aQ then pcall(function()
aQ.Text=tostring(math.floor(math.clamp(tonumber(aT)or 0,0,1)*100+0.5))
end)end
end
end
local function busyStart(aT)
if aN then return end aN=true
ringBuild()
aL.Visible=false
if aO then aO.Visible=true end
ringPaint(aT and 0 or nil)
if not aT then
local aU=0
aR=aC.RenderStepped:Connect(function()
if not aN then return end
aU=(aU+4)%360
pcall(function()aO.Rotation=aU end)
end)
end
end
local function busyDone()
if not aN then return end aN=false
if aR then pcall(function()aR:Disconnect()end)aR=nil end
if aO then
aO.Visible=false
pcall(function()aO.Rotation=0 end)
end
aL.Visible=true
end
function aS.set(aT)
if not aN then busyStart(true)end
ringPaint(tonumber(aT)or 0)
end
function aS.done()busyDone()end
if c.Flag and(c.Spin or c.Progress)then aa._busy[c.Flag]=aS end
local function fireBusy()
_:_flash(aI)af:_sfx"Click"
local aT=c.Progress and true or false
busyStart(aT)
task.spawn(function()
local aU=false
local function set(aV)if not aU then ringPaint(tonumber(aV)or 0)end end
local function done()aU=true busyDone()end
pcall(c.Callback,set,done)
if not aU then busyDone()end
end)
end
local aT=function()
if aN then return end
if(c.Spin or c.Progress)and type(c.Callback)=="function"then
af:_bumpRecent(S.Title,c.Title or"Button",fireBtn)fireBusy()
else
af:_bumpRecent(S.Title,c.Title or"Button",fireBtn)fireBtn()
end
end
if c.HoldTime and tonumber(c.HoldTime)then
local aU,aV=tonumber(c.HoldTime),false
local aW=Instance.new"Frame"aW.BorderSizePixel=0
aW.Size=UDim2.new(0,0,1,0)as(aW,7)aW.Parent=aK
aW.BackgroundTransparency=0.6
af:_tag(aW,"BackgroundColor3","Accent")
aJ.InputBegan:Connect(function(aX)
if aX.UserInputType~=Enum.UserInputType.MouseButton1 and aX.UserInputType~=Enum.UserInputType.Touch then return end
aV=true
an(aW,TweenInfo.new(aU,Enum.EasingStyle.Linear),{Size=UDim2.new(1,0,1,0)})
task.delay(aU,function()
if aV then
aV=false
aT()
aW.Size=UDim2.new(0,0,1,0)
end
end)
end)
aJ.InputEnded:Connect(function(aX)
if aX.UserInputType==Enum.UserInputType.MouseButton1 or aX.UserInputType==Enum.UserInputType.Touch then
aV=false
an(aW,am.Fast,{Size=UDim2.new(0,0,1,0)})
end
end)
else
aJ.MouseButton1Click:Connect(function()
aT()
end)
end
if c.Disabled then task.defer(function()pcall(aA,aI,true)end)end
local aU={Title=c.Title,Frame=aI,_handle=aJ,Tooltip=c.Tooltip}
aU._go=function()
af:_bumpRecent(S.Title,c.Title or"Button",fireBtn)aT()
end
return N(aU)
end end function a.q():typeof(__modImpl())local aa=a.cache.q if not aa then aa={c=__modImpl()}a.cache.q=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


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
local aG=aC.titleBlock
local aH=aC.reg
local aI=aC.tab
local aJ=aC.Window
local aK=aC.Th local aL=
aC.opts or{}
aD=aD or{}
local aM=aD.Value~=nil and aD.Value or(aD.Default or false)
local aN=aE(aD.Description and 54 or 40)
aG(aN,aD.Title or"Toggle",aD.Description,70)
local aO,aP,aQ=40,22,16
local aR=Instance.new"TextButton"aR.Text=""
aR.AnchorPoint=Vector2.new(1,0.5)aR.Position=UDim2.new(1,-12,0.5,0)
aR.Size=UDim2.fromOffset(aO,aP)aR.BorderSizePixel=0
aR.BackgroundColor3=aK.Surface2 aR.AutoButtonColor=false aR.Parent=aN
at(aR,99)
aw(aR,true)
af:_tag(aR,"BackgroundColor3","Surface2")

local aS=Instance.new"Frame"aS.BorderSizePixel=0
aS.Size=UDim2.new(1,0,1,0)aS.BackgroundTransparency=1
at(aS,99)aS.Parent=aR
af:agrad(aS,0)
local aT=Instance.new"Frame"aT.Size=UDim2.fromOffset(aQ,aQ)
aT.AnchorPoint=Vector2.new(0,0.5)aT.BorderSizePixel=0
aT.BackgroundColor3=Color3.fromRGB(255,255,255)
at(aT,99)aT.Parent=aR
local aU=Instance.new"UIScale"aU.Parent=aT
local aV=ar()



local function onKnob()
local aW=af.Theme.Accent
local aX=0.299*aW.R+0.587*aW.G+0.114*aW.B
if aX>0.6 then
return af.Theme.OnAccent or Color3.fromRGB(15,17,22)
end
return Color3.fromRGB(255,255,255)
end
local function paint(aW)
an(aS,aW and am.Med or TweenInfo.new(0),
{BackgroundTransparency=aM and 0 or 1})
local aX=aW and am.Spring or TweenInfo.new(0)
an(aT,aX,{Position=aM and UDim2.new(1,-aQ-3,0.5,0)
or UDim2.new(0,3,0.5,0)})
an(aT,aW and am.Med or TweenInfo.new(0),
{BackgroundColor3=aM and onKnob()or Color3.fromRGB(255,255,255)})
end
aT.Position=aM and UDim2.new(1,-aQ-3,0.5,0)or UDim2.new(0,3,0.5,0)
aT.BackgroundColor3=aM and onKnob()or Color3.fromRGB(255,255,255)
paint(false)
local aW={}
function aW.Set(aX,c,f)
aM=c and true or false paint(true)
if aD.Flag then af.Flags[aD.Flag]=aM end
if not f then af:_sfx(aM and"On"or"Off")as(aD.Callback,aM)as(aD.OnChanged,aM)end
end
function aW.Get(aX)return aM end

local aX,c,f=0,false
aI._window:Track(aR.InputBegan:Connect(function(g)
if g.UserInputType~=Enum.UserInputType.MouseButton1 and g.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=aV then return end
af.CurrentInput=aV
f,aX,c=g.Position,aT.Position.X.Offset,false
an(aU,am.Hover,{Scale=1.25})
end))
aI._window:Track(aB.InputChanged:Connect(function(g)
if af.CurrentInput~=aV or not f then return end
if g.UserInputType~=Enum.UserInputType.MouseMovement and g.UserInputType~=Enum.UserInputType.Touch then return end
local N=g.Position.X-f.X
if math.abs(N)>8 then c=true end
if c then
local S=math.clamp(aX+N,3,aO-aQ-3)
aT.Position=UDim2.new(0,S,0.5,0)
end
end))
local function fireTg()
if aJ._activateTab then aJ._activateTab(aI,true)end
aJ:_flash(aN)aW:Set(not aW:Get())
end
aI._window:Track(aB.InputEnded:Connect(function(g)
if af.CurrentInput~=aV then return end
if g.UserInputType~=Enum.UserInputType.MouseButton1 and g.UserInputType~=Enum.UserInputType.Touch then return end
af.CurrentInput,f=nil,nil
an(aU,am.Hover,{Scale=1})
if not c then aW:Set(not aM)
else
local N=aT.Position.X.Offset+aQ/2
aW:Set(N>aO/2)
end
af:_bumpRecent(aI.Title,aD.Title or"Toggle",fireTg)
end))
local g={Title=aD.Title,Frame=aN,Value=aM,Flag=aD.Flag,_handle=aW,
_set=function(g,N)aW:Set(g and true or false,N)end}
g._go=function()
af:_bumpRecent(aI.Title,aD.Title or"Toggle",fireTg)fireTg()
end
return aH(g)
end end function a.r():typeof(__modImpl())local aa=a.cache.r if not aa then aa={c=__modImpl()}a.cache.r=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


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
local aG=ae.cloneref_check(game:GetService"UserInputService")

return function(aH,aI)
local aJ=aH.row
local aK=aH.titleBlock
local aL=aH.reg
local aM=aH.tab local aN=
aH.Window
local aO=aH.Th local aP=
aH.opts or{}
local aQ=aH.page
aI=aI or{}
local aR=aI.Min or(aI.Range and aI.Range[1])or 0
local aS=aI.Max or(aI.Range and aI.Range[2])or 100
local aT=aI.Step or aI.Increment or 1
local aU=aI.Rounding or(aT%1~=0 and 2 or 0)
local aV=aI.Value~=nil and aI.Value or(aI.Default or aR)
local function fmt(aW)return aU>0 and string.format("%."..aU.."f",aW)or tostring(math.round(aW))end
local aW=aJ(aI.Description and 66 or 56)
aK(aW,aI.Title or"Slider",aI.Description,90,true)
local aX=Instance.new"TextBox"aX.Text=fmt(aV)
aX.Font=Enum.Font.GothamBold aX.TextSize=11
aX.AnchorPoint=Vector2.new(1,0)aX.Position=UDim2.new(1,-12,0,6)
aX.Size=UDim2.new(0,60,0,22)aX.BackgroundColor3=aO.Surface2
aX.BorderSizePixel=0 at(aX,6)
af:_tag(aX,"BackgroundColor3","Surface2")
af:_tag(aX,"TextColor3","Text")
aw(aX,true)
aX.ClearTextOnFocus=false aX.Parent=aW
local c=Instance.new"TextButton"c.Text=""c.AutoButtonColor=false
c.Position=UDim2.new(0,12,0,aI.Description and 48 or 36)c.Size=UDim2.new(1,-24,0,6)
c.BackgroundColor3=aO.Surface2 c.BorderSizePixel=0
at(c,99)c.Parent=aW
af:_tag(c,"BackgroundColor3","Surface2")
local f=Instance.new"Frame"f.BorderSizePixel=0
f.Size=UDim2.new(0,0,1,0)at(f,99)f.Parent=c
af:agrad(f,0)
local g=Instance.new"Frame"g.AnchorPoint=Vector2.new(0.5,0.5)
g.Size=UDim2.fromOffset(12,12)g.BackgroundColor3=Color3.fromRGB(255,255,255)
g.BorderSizePixel=0 at(g,99)g.Parent=c
local N=Instance.new"UIStroke"N.Thickness=1.5
N.Color=aO.Accent N.Transparency=0.35 N.Parent=g
af:_tag(N,"Color","Accent")


local S=ar()
local _,aY,aZ,a_=false,false
local function alpha(a0)return math.clamp((a0-aR)/math.max(1e-6,aS-aR),0,1)end
local function render(a0)
local a1=alpha(aV)
if a0 then
an(f,am.Fill08,{Size=UDim2.new(a1,0,1,0)})
else

f.Size=UDim2.new(a1,0,1,0)
end
g.Position=UDim2.new(a1,0,0.5,0)
if aX:IsFocused()==false then aX.Text=fmt(aV)end
end
local a0={}
function a0.Set(a1,a2,a3)
a2=math.clamp(tonumber(a2)or aV,aR,aS)
a2=math.round(a2/aT)*aT
if aU>0 then a2=tonumber(string.format("%."..aU.."f",a2))end
aV=a2 render(not _)
if aI.Flag then af.Flags[aI.Flag]=aV end
if not a3 then as(aI.Callback,aV)as(aI.OnChanged,aV)end
end
function a0.Get(a1)return aV end
function a0.SetMax(a1,a2)aS=a2 a0:Set(aV,true)end
function a0.SetMin(a1,a2)aR=a2 a0:Set(aV,true)end
render(false)
aX.FocusLost:Connect(function()
local a1=tonumber(aX.Text)
if a1 then a0:Set(a1)else aX.Text=fmt(aV)end
end)
c.InputBegan:Connect(function(a1)
if aI.Locked then return end
if a1.UserInputType~=Enum.UserInputType.MouseButton1 and a1.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=S then return end
af.CurrentInput,_,aY=S,true,a1.UserInputType==Enum.UserInputType.Touch
aQ.ScrollingEnabled=false
an(g,am.Hover,{Size=UDim2.fromOffset(16,16)})
local function fromX(a2)
local a3=math.clamp((a2-c.AbsolutePosition.X)/math.max(1,c.AbsoluteSize.X),0,1)
a0:Set(aR+a3*(aS-aR))
end
fromX(aY and a1.Position.X or aG:GetMouseLocation().X)
if aZ then aZ:Disconnect()end
aZ=aE.RenderStepped:Connect(function()
if not _ then return end
if aM._window and aM._window._visible==false then return end
fromX(aG:GetMouseLocation().X)
end)
if a_ then a_:Disconnect()end
a_=aG.InputEnded:Connect(function(a2)
if(a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch)and _ then
_=false
if aZ then aZ:Disconnect()aZ=nil end
if a_ then a_:Disconnect()a_=nil end
af.CurrentInput=nil
aQ.ScrollingEnabled=true
an(g,am.Hover,{Size=UDim2.fromOffset(12,12)})
as(aI.OnRelease,aV)
end
end)
end)
local a1={Title=aI.Title,Frame=aW,Value=aV,Flag=aI.Flag,_handle=a0,
_set=function(a1,a2)a0:Set(a1,a2)end}
return aL(a1)
end end function a.s():typeof(__modImpl())local aa=a.cache.s if not aa then aa={c=__modImpl()}a.cache.s=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween local ar=
ac.guid
local as=ac.spawnCb
local at=ac.corner
local aw=ac.hairline
local aD=ac.pad local aE=
ac.lighting local aG=
ac.ripple local aH=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(aI,aJ)
local aK=aI.row
local aL=aI.titleBlock
local aM=aI.reg local aO=
aI.tab local aP=
aI.Window
local aQ=aI.Th local aR=
aI.opts or{}
aJ=aJ or{}
local aS=aK(aJ.Description and 50 or 40)
aL(aS,aJ.Title or"Input",nil,200)
local aT=Instance.new"TextBox"
aT.PlaceholderText=aJ.Placeholder or"Type..."aT.PlaceholderColor3=aQ.Dim
aT.Text=aJ.Value or aJ.Default or""
aT.Font=Enum.Font.Gotham aT.TextSize=12
aT.AnchorPoint=Vector2.new(1,0.5)aT.Position=UDim2.new(1,-12,0.5,0)
aT.Size=UDim2.new(0,170,0,28)aT.BackgroundColor3=aQ.Surface2
aT.BorderSizePixel=0 at(aT,7)aT.ClearTextOnFocus=false aT.Parent=aS
aD(aT,4,4,8,8)
aw(aT,true)
af:_tag(aT,"BackgroundColor3","Surface2")
af:_tag(aT,"TextColor3","Text")
aT.Focused:Connect(function()
an(aT,am.Hover,{})
end)
aT.FocusLost:Connect(function(aU)
if aJ.Flag then af.Flags[aJ.Flag]=aT.Text end
as(aJ.Callback,aT.Text)as(aJ.OnChanged,aT.Text)
end)
return aM{Title=aJ.Title,Frame=aS,_handle=aT}
end end function a.t():typeof(__modImpl())local aa=a.cache.t if not aa then aa={c=__modImpl()}a.cache.t=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()
local af=a.d()

local am=aa
local an=ab.T
local as=ab.tween local at=
ac.guid
local aw=ac.spawnCb
local aD=ac.corner
local aH=ac.hairline local aI=
ac.pad local aJ=
ac.lighting local aK=
ac.ripple
local aL=ad.makeIcon
local aM=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

local aQ=170
local aR=28
local aS=46
local aT=190

return function(aU,aV)
local aW=aU.row
local aX=aU.titleBlock
local aY=aU.reg
local aZ=aU.tab
local a_=aU.Window
local a0=aU.Th local a1=
aU.opts or{}local a2=
aU.page
local a3=aU.pgui
aV=aV or{}
local c=aV.Values or aV.Options or{}
local f=aV.Multi or aV.MultipleOptions or false
local g=aV.Value or aV.Default or aV.CurrentOption
if not f and type(g)=="table"then g=g[1]end
if f and type(g)~="table"then g=g and{g}or{}end
local N=aW(aV.Description and 50 or 40)N.ClipsDescendants=false
aX(N,aV.Title or"Dropdown",nil,200)
local S=Instance.new"TextButton"S.Text=""
S.AnchorPoint=Vector2.new(1,0.5)S.Position=UDim2.new(1,-12,0.5,0)
S.Size=UDim2.new(0,170,0,28)S.BackgroundColor3=a0.Surface2
S.BorderSizePixel=0 aD(S,7)S.AutoButtonColor=false S.Parent=N
aH(S,true)
am:_tag(S,"BackgroundColor3","Surface2")
local _=Instance.new"TextLabel"_.BackgroundTransparency=1
_.Position=UDim2.new(0,8,0,0)_.Size=UDim2.new(1,-28,1,0)
_.Font=Enum.Font.Gotham _.TextSize=12 _.TextXAlignment=0
_.TextTruncate=Enum.TextTruncate.AtEnd _.Parent=S
_.ZIndex=2
am:_tag(_,"TextColor3","Text")
local a4=aL("chevron",13,a0.Dim)
a4.AnchorPoint=Vector2.new(1,0.5)a4.Position=UDim2.new(1,-8,0.5,0)
a4.Parent=S
local function curText()
if f then return(#g==0 and"None"or table.concat(g,", "))end
return tostring(g or"Select...")
end
_.Text=curText()
local a5,a6,a7,a8,a9,ba=false
local bb={}
function bb.Set(bc,bd,be)
g=bd
if not f and type(g)=="table"then g=g[1]end
_.Text=curText()
if aV.Flag then am.Flags[aV.Flag]=g end
if not be then aw(aV.Callback,g)aw(aV.OnChanged,g)end
end
function bb.Get(bc)return g end
local function closeList()
if not a5 then return end
a5=false
af.close(closeList)
as(a4,an.Fast,{Rotation=0})
if a9 then pcall(function()a9:Disconnect()end)a9=nil end
if ba then pcall(function()ba:Disconnect()end)ba=nil end
if a6 then pcall(function()a6:Destroy()end)a6=nil end
if a7 then pcall(function()a7:Destroy()end)a7=nil end
a8=nil
end
function bb.Refresh(bc,bd)
c=bd or{}
closeList()
end
local function renderItems(bc)
if not a7 then return end
for bd,be in ipairs(a7:GetChildren())do
if be:IsA"TextButton"then pcall(function()be:Destroy()end)end
end
local bd={}
for be,bf in ipairs(c)do
local bg=tostring(bf)
if(bc or"")==""or string.find(string.lower(bg),string.lower(bc),1,true)then
table.insert(bd,bg)
end
end
local be=32
for bf,bg in ipairs(bd)do
local bh=Instance.new"TextButton"bh.Text=""
bh.Size=UDim2.new(1,-8,0,26)bh.Position=UDim2.new(0,4,0,be)
bh.BackgroundColor3=a0.Surface2 bh.BackgroundTransparency=1
bh.BorderSizePixel=0 aD(bh,6)bh.Parent=a7
bh.ZIndex=af.Z.Popup+1
local bi=Instance.new"TextLabel"bi.BackgroundTransparency=1
bi.Position=UDim2.new(0,8,0,0)bi.Size=UDim2.new(1,-36,1,0)
bi.Font=Enum.Font.Gotham bi.TextSize=12 bi.TextXAlignment=0
bi.TextTruncate=Enum.TextTruncate.AtEnd bi.Text=bg bi.Parent=bh
bi.ZIndex=af.Z.Popup+2
local bj=f and table.find(g,bg)or g==bg
if bj then

am:_tag(bi,"TextColor3","Accent")
am:_tag(bh,"BackgroundColor3","Surface2")
bh.BackgroundTransparency=0.4
local bk=aL("check",12,a0.Accent)
bk.AnchorPoint=Vector2.new(1,0.5)bk.Position=UDim2.new(1,-8,0.5,0)
bk.Parent=bh
if bk:IsA"GuiObject"then bk.ZIndex=af.Z.Popup+2 end
else
am:_tag(bi,"TextColor3","Text")
end
bh.MouseEnter:Connect(function()bh.BackgroundTransparency=0.4 am:_tag(bh,"BackgroundColor3","Surface2")end)
bh.MouseLeave:Connect(function()if not(f and table.find(g,bg)or g==bg)then bh.BackgroundTransparency=1 end end)
bh.MouseButton1Click:Connect(function()
am:_sfx"Click"
if f then
local bk=table.find(g,bg)
if bk then table.remove(g,bk)else table.insert(g,bg)end
bb:Set(g)
if a8 then renderItems(a8.Text)else renderItems""end
else
bb:Set(bg)
closeList()
end
end)
be+=aR
end
local bf=math.clamp(be+4,40,aT)
a7.Size=UDim2.new(0,aQ,0,bf)
return bf
end
local function placeList(bc)
if not a7 or not N.Parent then return end
local bd,be=N.AbsolutePosition,N.AbsoluteSize
local bf=Vector2.new(1200,800)
pcall(function()bf=workspace.CurrentCamera.ViewportSize end)
local bg=bc or a7.Size.Y.Offset
if bg<1 then bg=120 end
local bh=bd.X+be.X-aQ-12
local bi=bd.Y+aS
if bi+bg>bf.Y-10 then
bi=math.max(10,bd.Y-bg-6)
end
a7.Position=UDim2.fromOffset(bh,bi)
end
local function openList()
if a5 then return end
a5=true
af.open(closeList)
as(a4,an.Fast,{Rotation=180})
a6=af.backdrop(a3,closeList)
a7=Instance.new"Frame"
a7.Size=UDim2.new(0,aQ,0,0)a7.BackgroundColor3=a0.Bg
a7.BorderSizePixel=0 aD(a7,8)a7.Parent=a3
a7.ZIndex=af.Z.Popup a7.ClipsDescendants=true
aH(a7,true)
am:_tag(a7,"BackgroundColor3","Bg")
a8=Instance.new"TextBox"a8.PlaceholderText="Filter..."
a8.PlaceholderColor3=a0.Dim a8.Text=""
a8.Font=Enum.Font.Gotham a8.TextSize=11
a8.Size=UDim2.new(1,-8,0,24)a8.Position=UDim2.new(0,4,0,4)
a8.BackgroundColor3=a0.Surface2 a8.BorderSizePixel=0
aD(a8,6)a8.Parent=a7
a8.ZIndex=af.Z.Popup+1
am:_tag(a8,"BackgroundColor3","Surface2")
am:_tag(a8,"TextColor3","Text")
renderItems""
local bc=a7.Size.Y.Offset
a7.Size=UDim2.new(0,aQ,0,0)
placeList(bc)
as(a7,an.Med,{Size=UDim2.new(0,aQ,0,bc)})
a9=a8:GetPropertyChangedSignal"Text":Connect(function()
if a5 then renderItems(a8.Text)end
end)
ba=aM.RenderStepped:Connect(function()
if not a5 then return end
if not N:IsDescendantOf(game)then closeList()return end
if a_._visible==false then closeList()return end
if aZ.Page and aZ.Page.Visible==false then closeList()return end
placeList()
end)
end
S.MouseButton1Click:Connect(function()
am:_sfx"Click"
if a5 then closeList()else openList()end
end)
local bc={Title=aV.Title,Frame=N,Value=g,Flag=aV.Flag,_handle=bb,
_set=function(bc,bd)bb:Set(bc,bd)end}
return aY(bc)
end end function a.u():typeof(__modImpl())local aa=a.cache.u if not aa then aa={c=__modImpl()}a.cache.u=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local am=
ab.T local an=
ab.tween local as=
ac.guid
local aw=ac.spawnCb
local aD=ac.corner
local aH=ac.hairline local aK=
ac.pad local aL=
ac.lighting local aM=
ac.ripple local aQ=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local aR=ae.cloneref_check(game:GetService"UserInputService")

return function(aS,aT)
local aU=aS.row
local aV=aS.titleBlock
local aW=aS.reg
local aX=aS.tab local aY=
aS.Window
local aZ=aS.Th local a_=
aS.opts or{}
aT=aT or{}
local a0=aT.Mode or"Toggle"
local a2=aT.Value or aT.Default or Enum.KeyCode.F
if type(a2)=="string"then a2=Enum.KeyCode[a2]or Enum.KeyCode.F end
local a3=aU(aT.Description and 54 or 40)
aV(a3,aT.Title or"Keybind",aT.Description,130)
local a4=Instance.new"TextButton"a4.Font=Enum.Font.GothamBold a4.TextSize=11
a4.AnchorPoint=Vector2.new(1,0.5)a4.Position=UDim2.new(1,-12,0.5,0)
a4.Size=UDim2.new(0,92,0,28)a4.BackgroundColor3=aZ.Surface2
a4.BorderSizePixel=0 aD(a4,7)a4.Text=a2.Name a4.Parent=a3
aH(a4,true)
af:_tag(a4,"BackgroundColor3","Surface2")
af:_tag(a4,"TextColor3","Text")
local a5,a6=false,false
local function startRebind()a5=true a4.Text="..."end
a4.MouseButton1Click:Connect(startRebind)
aX._window:Track(aR.InputBegan:Connect(function(a7,a8)
if a5 and a7.UserInputType==Enum.UserInputType.Keyboard then
a5=false a2=a7.KeyCode a4.Text=a2.Name
if aT.Flag then af.Flags[aT.Flag]=a2.Name end
aw(aT.ChangedCallback,a2)aw(aT.OnChanged,a2)
elseif not a5 and not a8 and a7.KeyCode==a2 then
if a0=="Hold"then a6=true end
aw(aT.Callback,a2)
end
end))
aX._window:Track(aR.InputEnded:Connect(function(a7)
if a7.KeyCode==a2 then a6=false end
end))
local a7={
Set=function(a7,a8)
if type(a8)=="string"then a8=Enum.KeyCode[a8]or a2 end
a2,a4.Text=a8,a8.Name
end,
Get=function()return a2 end,
GetState=function()return a0=="Hold"and a6 or nil end,
Rebind=startRebind,
}

if aX._window and aX._window._keybinds then
table.insert(aX._window._keybinds,{
Title=aT.Title or"Keybind",
GetName=function()return a5 and"..."or a2.Name end,
Rebind=startRebind,
})
if aX._window._kbPanelRefresh then
task.defer(function()pcall(aX._window._kbPanelRefresh)end)
end
end
return aW{Title=aT.Title,Frame=a3,_handle=a7}
end end function a.v():typeof(__modImpl())local aa=a.cache.v if not aa then aa={c=__modImpl()}a.cache.v=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()
local af=a.d()

local aw=aa
local aD=ab.T
local aH=ab.tween local aQ=
ac.guid
local aR=ac.spawnCb
local aS=ac.corner
local aT=ac.hairline
local aU=ac.pad local aV=
ac.lighting local aW=
ac.ripple local aX=
ad.makeIcon
local aZ=ae.cloneref_check(game:GetService"RunService")
local a_=ae.cloneref_check(game:GetService"UserInputService")

local a0="rbxassetid://4155801252"
local a2="http://www.roblox.com/asset/?id=14204231522"

local a3,a4=160,158 local
a5, a6=6, 10
local a7=150
local a8=40
local a9=24


return function(ba,bb)
local bc=ba.row
local bd=ba.titleBlock
local be=ba.reg
local bf=ba.tab
local bg=ba.Window
local bh=ba.Th local bi=
ba.opts or{}local bj=
ba.page
local bk=ba.pgui
bb=bb or{}
local c=bb.Value or bb.Default or Color3.fromRGB(110,140,255)
if type(c)=="table"then
c=Color3.new(c[1]or 0,c[2]or 0,c[3]or 0)
end
local f,g,N=c:ToHSV()
local S=bb.Transparency or 0
local _=c
local bl=bc(bb.Description and 54 or 40)bl.ClipsDescendants=false
bd(bl,bb.Title or"Color",bb.Description,90)
local bm=Instance.new"TextButton"bm.Text=""
bm.AnchorPoint=Vector2.new(1,0.5)bm.Position=UDim2.new(1,-12,0.5,0)
bm.Size=UDim2.fromOffset(56,26)bm.BackgroundColor3=_
bm.BorderSizePixel=0 aS(bm,8)bm.AutoButtonColor=false bm.Parent=bl
aT(bm,true)
local bn={}
local bo,bp,bq,br=false
local bs,bt,bu
local bv,bw,bx
local by,bz,bA,bB,bC,bD
local bE,bF,bG,bH
local bI,bJ,bK=false,false,false
local bL,bM=0
local bN
local bO={}
local function currentColor()
return Color3.fromHSV(f,g,N)
end
local function colorsClose(bP,bQ)
if bP==nil or bQ==nil then return false end
return math.abs(bP.R-bQ.R)<0.001
and math.abs(bP.G-bQ.G)<0.001
and math.abs(bP.B-bQ.B)<0.001
end
local function syncFields()
if bv then
bv.Position=UDim2.new(g,0,1-N,0)
bv.BackgroundColor3=currentColor()
end
if bw then
bw.Position=UDim2.new(0.5,0,f,0)
bw.BackgroundColor3=Color3.fromHSV(f,1,1)
end
if bs then bs.BackgroundColor3=Color3.fromHSV(f,1,1)end
if bu then
bu.BackgroundColor3=currentColor()
if bx then
bx.Position=UDim2.new(0.5,0,1-S,0)
bx.BackgroundColor3=currentColor()
bx.BackgroundTransparency=S
end
end
local bP=currentColor()
local bQ=math.floor(bP.R*255+0.5)
local bR=math.floor(bP.G*255+0.5)
local bS=math.floor(bP.B*255+0.5)
if bz and not bz:IsFocused()then bz.Text="#"..bP:ToHex():upper()end
if bA and not bA:IsFocused()then bA.Text=tostring(bQ)end
if bB and not bB:IsFocused()then bB.Text=tostring(bR)end
if bC and not bC:IsFocused()then bC.Text=tostring(bS)end
if bD and not bD:IsFocused()then
bD.Text=tostring(math.floor((1-S)*100+0.5)).."%"
end
if by then
by.BackgroundColor3=bP
by.BackgroundTransparency=S
end
end
local function push(bP)
_=currentColor()
aH(bm,aD.Hover,{BackgroundColor3=_})
if bb.Flag then aw.Flags[bb.Flag]={_.R,_.G,_.B}end
if not bP then aR(bb.Callback,_,S)aR(bb.OnChanged,_,S)end
end
local function applyColor(bP)
_=currentColor()
aH(bm,aD.Hover,{BackgroundColor3=_})
if bb.Flag then aw.Flags[bb.Flag]={_.R,_.G,_.B}end
syncFields()
if bP then
local bQ=currentColor()
if not colorsClose(bQ,bN)then
bN=bQ
aR(bb.Callback,bQ,S)aR(bb.OnChanged,bQ,S)
end
end
end
function bn.Set(bP,bQ,bR,bS)
if type(bQ)=="table"and typeof(bQ)~="Color3"then
bQ=Color3.new(bQ[1]or 0,bQ[2]or 0,bQ[3]or 0)
end
if typeof(bQ)=="Color3"then
if type(bR)=="boolean"and bS==nil then
bS=bR
elseif type(bR)=="number"then
S=math.clamp(bR,0,1)
end
f,g,N=bQ:ToHSV()
push(bS)
syncFields()
end
end
function bn.Get(bP)return _,S end
local function closePopup()
if not bo then return end
bo=false
af.close(closePopup)
bI,bJ,bK=false,false,false
bM=nil
for bP,bQ in ipairs(bO)do pcall(function()bQ:Disconnect()end)end
bO={}
if br then pcall(function()br:Disconnect()end)br=nil end
if bq then pcall(function()bq:Destroy()end)bq=nil end
if bp then
local bP=bp
bp=nil
aH(bP,aD.Fast,{Size=UDim2.new(0,bP.Size.X.Offset,0,0)})
task.delay(0.2,function()pcall(function()bP:Destroy()end)end)
end
bv,bw,bx=nil,nil,nil
bs,bt,bu=nil,nil,nil
by=nil
bz,bA,bB,bC,bD=nil,nil,nil,nil,nil
end
local function updateSV(bP)
if not bs or bs.AbsoluteSize.X<=0 then return end
local bQ,bR=bs.AbsolutePosition,bs.AbsoluteSize
g=math.clamp((bP.X-bQ.X)/bR.X,0,1)
N=1-math.clamp((bP.Y-bQ.Y)/bR.Y,0,1)
applyColor(true)
end
local function updateHue(bP)
if not bt or bt.AbsoluteSize.Y<=0 then return end
local bQ,bR=bt.AbsolutePosition,bt.AbsoluteSize
f=math.clamp((bP.Y-bQ.Y)/bR.Y,0,1)
applyColor(true)
end
local function updateAlpha(bP)
if not bu or bu.AbsoluteSize.Y<=0 then return end
local bQ,bR=bu.AbsolutePosition,bu.AbsoluteSize
S=1-math.clamp((bP.Y-bQ.Y)/bR.Y,0,1)
applyColor(true)
end
local function requestClose()
if bI or bJ or bK then return end
if os.clock()-bL<0.2 then return end
closePopup()
end



local function placePopup(bP,bQ)
if not bp then return end
local bR=Vector2.new(1200,800)
pcall(function()bR=workspace.CurrentCamera.ViewportSize end)
local bS=12
local bT=bg._main
if bT and bT.Parent and bT.AbsoluteSize.X>0 then
local bU,bV=bT.AbsolutePosition,bT.AbsoluteSize
local bW=math.clamp(bU.Y+bV.Y/2-bQ/2,10,math.max(10,bR.Y-bQ-10))
local bX=bU.X+bV.X+bS
if bX+bP>bR.X-10 then
bX=bU.X-bP-bS
if bX<10 then
bX=math.clamp(bU.X+bV.X/2-bP/2,10,math.max(10,bR.X-bP-10))
end
end
bp.Position=UDim2.fromOffset(bX,bW)
return
end

if not bl.Parent then return end
local bU,bV=bl.AbsolutePosition,bl.AbsoluteSize
local bW=bU.X+bV.X-bP-12
if bW<10 then bW=math.max(10,bU.X-bP-8)end
local bX=bU.Y+46
if bX+bQ>bR.Y-10 then bX=math.max(10,bU.Y-bQ-6)end
bp.Position=UDim2.fromOffset(bW,bX)
end
local function openPopup()
if bo then return end
bo=true
bE,bF,bG=f,g,N
bH=S
bN=currentColor()
af.open(closePopup)
aw:_sfx"Click"

local bP=12
local bQ=bP+a3+a6
local bR=bQ+a5+a6
local bS=bR+a5+a6
local bT=bS+a7+bP
local bU=a8+a4+a6
local bV=bU+a9+a6+22
local bW=bV+32+bP
bq=af.backdrop(bk,requestClose)
bp=Instance.new"Frame"
bp.Name=ae.GetStealthName()
bp.BackgroundColor3=bh.Bg
bp.BackgroundTransparency=1
bp.BorderSizePixel=0
bp.ClipsDescendants=true
bp.ZIndex=af.Z.Popup
bp.Size=UDim2.new(0,bT,0,0)
bp.Parent=bk
aS(bp,10)
aT(bp,true)
aw:_tag(bp,"BackgroundColor3","Bg")
placePopup(bT,bW)
local bX=Instance.new"TextLabel"bX.BackgroundTransparency=1
bX.Position=UDim2.new(0,bP,0,6)bX.Size=UDim2.new(1,-bP*2,0,22)
bX.Font=Enum.Font.GothamBold bX.TextSize=14 bX.TextXAlignment=0
bX.TextTruncate=Enum.TextTruncate.AtEnd bX.Text=bb.Title or"Color"
bX.Parent=bp
bX.ZIndex=af.Z.Popup+1
aw:_tag(bX,"TextColor3","Text")

bs=Instance.new"ImageLabel"
bs.Position=UDim2.new(0,bP,0,a8)
bs.Size=UDim2.fromOffset(a3,a4)
bs.BackgroundColor3=Color3.fromHSV(f,1,1)
bs.BackgroundTransparency=0
bs.Image=a0
bs.ScaleType=Enum.ScaleType.Stretch
bs.BorderSizePixel=0
bs.ClipsDescendants=true
bs.ZIndex=af.Z.Popup+1
bs.Parent=bp
aS(bs,8)
aT(bs,true)
bv=Instance.new"Frame"
bv.AnchorPoint=Vector2.new(0.5,0.5)
bv.Position=UDim2.new(g,0,1-N,0)
bv.Size=UDim2.fromOffset(14,14)
bv.BackgroundColor3=currentColor()
bv.BorderSizePixel=0
bv.ZIndex=af.Z.Popup+3
bv.Parent=bs
aS(bv,99)
local bY=Instance.new"UIStroke"bY.Thickness=2
bY.Color=Color3.fromRGB(255,255,255)bY.Transparency=0.1
bY.Parent=bv

bt=Instance.new"Frame"
bt.Position=UDim2.new(0,bQ,0,a8)
bt.Size=UDim2.fromOffset(a5,a4+14)
bt.BackgroundColor3=Color3.fromRGB(255,255,255)
bt.BorderSizePixel=0
bt.ClipsDescendants=true
bt.ZIndex=af.Z.Popup+1
bt.Parent=bp
aS(bt,3)
local bZ=Instance.new"UIGradient"bZ.Rotation=90
bZ.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
}
bZ.Parent=bt
bw=Instance.new"Frame"
bw.AnchorPoint=Vector2.new(0.5,0.5)
bw.Position=UDim2.new(0.5,0,f,0)
bw.Size=UDim2.fromOffset(14,14)
bw.BackgroundColor3=Color3.fromHSV(f,1,1)
bw.BorderSizePixel=0
bw.ZIndex=af.Z.Popup+3
bw.Parent=bt
aS(bw,99)
local b_=Instance.new"UIStroke"b_.Thickness=2
b_.Color=Color3.fromRGB(255,255,255)b_.Transparency=0.1
b_.Parent=bw

bu=Instance.new"Frame"
bu.Position=UDim2.new(0,bR,0,a8)
bu.Size=UDim2.fromOffset(a5,a4+14)
bu.BackgroundColor3=currentColor()
bu.BorderSizePixel=0
bu.ClipsDescendants=true
bu.ZIndex=af.Z.Popup+1
bu.Parent=bp
aS(bu,3)
aT(bu,true)
local b0=Instance.new"ImageLabel"
b0.Image=a2
b0.ImageTransparency=0.45
b0.ScaleType=Enum.ScaleType.Tile
b0.TileSize=UDim2.fromOffset(40,40)
b0.BackgroundTransparency=1
b0.Size=UDim2.fromScale(1,1)
b0.ZIndex=af.Z.Popup+1
b0.Parent=bu
aS(b0,3)
local b1=Instance.new"Frame"
b1.Size=UDim2.fromScale(1,1)
b1.BackgroundColor3=Color3.fromRGB(255,255,255)
b1.BorderSizePixel=0
b1.ZIndex=af.Z.Popup+2
b1.Parent=bu
aS(b1,3)
local b2=Instance.new"UIGradient"b2.Rotation=90
b2.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
b2.Parent=b1
bx=Instance.new"Frame"
bx.AnchorPoint=Vector2.new(0.5,0.5)
bx.Position=UDim2.new(0.5,0,1-S,0)
bx.Size=UDim2.fromOffset(14,14)
bx.BackgroundColor3=currentColor()
bx.BackgroundTransparency=S
bx.BorderSizePixel=0
bx.ZIndex=af.Z.Popup+3
bx.Parent=bu
aS(bx,99)

local b3=(a3-a6)/2
local function checkerSw(b4)
local b5=Instance.new"ImageLabel"
b5.Image=a2
b5.ImageTransparency=0.45
b5.ScaleType=Enum.ScaleType.Tile
b5.TileSize=UDim2.fromOffset(40,40)
b5.BackgroundTransparency=1
b5.Position=UDim2.new(0,b4,0,bU)
b5.Size=UDim2.fromOffset(b3,a9)
b5.ZIndex=af.Z.Popup+1
b5.Parent=bp
aS(b5,8)
aT(b5,true)
return b5
end
local b4=checkerSw(bP)
by=Instance.new"Frame"
by.BackgroundColor3=currentColor()
by.BackgroundTransparency=S
by.Size=UDim2.fromScale(1,1)
by.ZIndex=af.Z.Popup+2
by.Parent=b4
aS(by,8)
local b5=checkerSw(bP+b3+a6)
local b6=Instance.new"Frame"
b6.BackgroundColor3=Color3.fromHSV(bE or f,bF or g,bG or N)
b6.BackgroundTransparency=(bH==nil)and S or bH
b6.Size=UDim2.fromScale(1,1)
b6.ZIndex=af.Z.Popup+2
b6.Parent=b5
aS(b6,8)

local b7=bS
local function makeInput(b8,b9,ca)
local cb=Instance.new"Frame"
cb.BackgroundTransparency=1
cb.Position=UDim2.new(0,b7,0,ca)
cb.Size=UDim2.new(0,a7,0,36)
cb.ZIndex=af.Z.Popup+1
cb.Parent=bp
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
cd.BackgroundColor3=bh.Surface2
cd.BackgroundTransparency=0
cd.BorderSizePixel=0
cd.ZIndex=af.Z.Popup+2
cd.Parent=cb
aS(cd,7)
aT(cd,true)
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
aU(ce,0,0,0,8)
return cb,ce
end
local b8=currentColor()
local b9=math.floor(b8.R*255+0.5)
local ca=math.floor(b8.G*255+0.5)
local cb=math.floor(b8.B*255+0.5)
local cc=a8
local cd=4 local
ce, cf=makeInput("Hex","#"..b8:ToHex():upper(),cc)
bz=cf
cc+=36+cd local
cg, ch=makeInput("Red",tostring(b9),cc)
bA=ch
cc+=36+cd local
ci, cj=makeInput("Green",tostring(ca),cc)
bB=cj
cc+=36+cd local
ck, cl=makeInput("Blue",tostring(cb),cc)
bC=cl
cc+=36+cd local
cm, cn=makeInput("Alpha",tostring(math.floor((1-S)*100+0.5)).."%",cc)
bD=cn


local co=bT-bP*2
local cp=(co-6)/2
local cq=32
local function makeBtn(cr,cs,ct,cu)
local cv=Instance.new"TextButton"
cv.Position=UDim2.new(0,cs,0,bV)
cv.Size=UDim2.fromOffset(ct,cq)
cv.Text=""
cv.AutoButtonColor=false
cv.BorderSizePixel=0
cv.ZIndex=af.Z.Popup+2
cv.BackgroundColor3=bh.Surface2
aT(cv,true)
aw:_tag(cv,"BackgroundColor3","Surface2")
cv.Parent=bp
aS(cv,9)
local cw=Instance.new"TextLabel"
cw.BackgroundTransparency=1 cw.Size=UDim2.fromScale(1,1)
cw.Font=Enum.Font.GothamBold cw.TextSize=12
cw.Text=string.upper(cr)cw.Parent=cv
cw.ZIndex=af.Z.Popup+3
if cu then aw:_tag(cw,"TextColor3","Accent")
else aw:_tag(cw,"TextColor3","Text")end
return cv,cw
end
local cr=makeBtn("Cancel",bP,cp,false)
local cs=makeBtn("Apply",bP+cp+6,cp,true)
cr.MouseButton1Click:Connect(function()
f,g,N=bE,bF,bG
S=bH
applyColor(true)
closePopup()
end)
cs.MouseButton1Click:Connect(function()
aw:_sfx"Click"
closePopup()
end)

bs.InputBegan:Connect(function(ct)
if ct.UserInputType==Enum.UserInputType.MouseButton1
or ct.UserInputType==Enum.UserInputType.Touch then
if bI or bJ or bK then return end
bI=true
bM=ct
updateSV(ct.Position)
end
end)
bt.InputBegan:Connect(function(ct)
if ct.UserInputType==Enum.UserInputType.MouseButton1
or ct.UserInputType==Enum.UserInputType.Touch then
if bI or bJ or bK then return end
bJ=true
bM=ct
updateHue(ct.Position)
end
end)
bu.InputBegan:Connect(function(ct)
if ct.UserInputType==Enum.UserInputType.MouseButton1
or ct.UserInputType==Enum.UserInputType.Touch then
if bI or bJ or bK then return end
bK=true
bM=ct
updateAlpha(ct.Position)
end
end)
table.insert(bO,a_.InputChanged:Connect(function(ct)
if not bp then return end
if ct~=bM
and not(bM and bM.UserInputType==Enum.UserInputType.MouseButton1
and ct.UserInputType==Enum.UserInputType.MouseMovement)then
return
end
if bI then updateSV(ct.Position)end
if bJ then updateHue(ct.Position)end
if bK then updateAlpha(ct.Position)end
end))
table.insert(bO,a_.InputEnded:Connect(function(ct)
if ct==bM
or(bM and bM.UserInputType==Enum.UserInputType.MouseButton1
and ct.UserInputType==Enum.UserInputType.MouseButton1)then
if bI or bJ or bK then
bL=os.clock()
end
bI,bJ,bK=false,false,false
bM=nil
end
end))
bz:GetPropertyChangedSignal"Text":Connect(function()
if not bp then return end
local ct=bz.Text:gsub("[^%x]","")
ct=ct:sub(1,6)
if ct~=bz.Text then bz.Text=ct end
end)
bz.FocusLost:Connect(function()
if not bp then return end
local ct=bz.Text:gsub("#","")
if#ct==3 then
ct=ct:sub(1,1):rep(2)..ct:sub(2,2):rep(2)..ct:sub(3,3):rep(2)
end
if#ct==6 then
local cu,cv=pcall(Color3.fromHex,ct)
if cu and cv then
f,g,N=cv:ToHSV()
applyColor(true)
return
end
end
syncFields()
end)
local function filterDigits(ct)
ct:GetPropertyChangedSignal"Text":Connect(function()
if not bp then return end
local cu=ct.Text:gsub("%D",""):sub(1,3)
if cu~=ct.Text then ct.Text=cu end
end)
end
filterDigits(bA)filterDigits(bB)filterDigits(bC)
local function onRGBCommit()
if not bp then return end
local ct=math.clamp(tonumber(bA.Text)or 0,0,255)
local cu=math.clamp(tonumber(bB.Text)or 0,0,255)
local cv=math.clamp(tonumber(bC.Text)or 0,0,255)
f,g,N=Color3.toHSV(Color3.fromRGB(ct,cu,cv))
applyColor(true)
end
bA.FocusLost:Connect(onRGBCommit)
bB.FocusLost:Connect(onRGBCommit)
bC.FocusLost:Connect(onRGBCommit)
bD.FocusLost:Connect(function()
if not bp then return end
local ct=bD.Text:gsub("%%","")
local cu=math.clamp(tonumber(ct)or 0,0,100)
S=1-cu/100
applyColor(true)
end)
syncFields()
aH(bp,TweenInfo.new(0.44,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Size=UDim2.new(0,bT,0,bW),BackgroundTransparency=0})
br=aZ.RenderStepped:Connect(function()
if not bo then return end
if not bl:IsDescendantOf(game)then closePopup()return end
if bg._visible==false then closePopup()return end
if bf.Page and bf.Page.Visible==false then closePopup()return end
placePopup(bT,bW)
end)
end
bm.MouseButton1Click:Connect(function()
if bo then closePopup()else openPopup()end
end)
local bP={Title=bb.Title,Frame=bl,Value=_,Flag=bb.Flag,_handle=bn,
_set=function(bP,bQ)bn:Set(bP,bQ)end}
return be(bP)
end end function a.w():typeof(__modImpl())local aa=a.cache.w if not aa then aa={c=__modImpl()}a.cache.w=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local aw=
ab.T local aD=
ab.tween local aH=
ac.guid local aR=
ac.spawnCb
local aS=ac.corner
local aT=ac.hairline
local aU=ac.pad local aX=
ac.lighting local aZ=
ac.ripple
local a_=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a0,a2)
local a3=a0.row local a4=
a0.titleBlock
local a5=a0.reg
local a6=a0.tab local a7=
a0.Window
local a8=a0.Th local a9=
a0.opts or{}
a2=a2 or{}
local ba=a6._window
local bb=a3(196)
local bc=Instance.new"TextLabel"bc.BackgroundTransparency=1
bc.Position=UDim2.new(0,12,0,6)bc.Size=UDim2.new(1,-24,0,17)
bc.Font=Enum.Font.GothamMedium bc.TextSize=13 bc.TextXAlignment=0
bc.Text=a2.Title or"Profiles"bc.Parent=bb
af:_tag(bc,"TextColor3","Text")
local bd=Instance.new"TextBox"bd.PlaceholderText="Profile name..."
bd.PlaceholderColor3=a8.Dim bd.Text="default"
bd.Font=Enum.Font.Gotham bd.TextSize=12
bd.Position=UDim2.new(0,12,0,28)bd.Size=UDim2.new(1,-94,0,28)
bd.BackgroundColor3=a8.Surface2 bd.BorderSizePixel=0
aS(bd,7)bd.Parent=bb
aU(bd,4,4,8,8)
aT(bd,true)
af:_tag(bd,"BackgroundColor3","Surface2")
af:_tag(bd,"TextColor3","Text")
local be=Instance.new"TextButton"be.Text=""
be.AnchorPoint=Vector2.new(1,0)be.Position=UDim2.new(1,-12,0,28)
be.Size=UDim2.new(0,70,0,28)be.BorderSizePixel=0
aS(be,7)be.AutoButtonColor=false be.Parent=bb
af:_tag(be,"BackgroundColor3","Accent")
local bf=Instance.new"TextLabel"bf.BackgroundTransparency=1
bf.Size=UDim2.fromScale(1,1)bf.Font=Enum.Font.GothamBold
bf.TextSize=11 bf.Text="SAVE"
af:oa(bf)bf.Parent=be
local bg=Instance.new"ScrollingFrame"
bg.Position=UDim2.new(0,12,0,62)bg.Size=UDim2.new(1,-24,1,-70)
bg.BackgroundTransparency=1 bg.BorderSizePixel=0
bg.ScrollBarThickness=2 bg.CanvasSize=UDim2.new(0,0,0,0)
bg.AutomaticCanvasSize=Enum.AutomaticSize.Y bg.Parent=bb
af:_tag(bg,"ScrollBarImageColor3","Surface2")
local bh=Instance.new"UIListLayout"bh.Padding=UDim.new(0,4)
bh.SortOrder=Enum.SortOrder.LayoutOrder bh.Parent=bg
local function folder()
return"Kronos/"..tostring(ba and ba._cfgTitle or"Kronos")
end
local function profiles()
local bj={}
pcall(function()
if listfiles and isfolder and isfolder(folder())then
for bk,bl in ipairs(listfiles(folder()))do
local bm=string.match(bl,"([^/\\]+)%.json$")
if bm then table.insert(bj,bm)end
end
end
end)
table.sort(bj)
return bj
end
local function refresh()
for bj,bk in ipairs(bg:GetChildren())do
if bk:IsA"TextButton"then pcall(function()bk:Destroy()end)end
end
local bj=profiles()
if#bj==0 then
local bk=Instance.new"TextLabel"bk.BackgroundTransparency=1
bk.Size=UDim2.new(1,0,0,22)bk.Font=Enum.Font.Gotham
bk.TextSize=11 bk.Text="No saved profiles"bk.Parent=bg
af:_tag(bk,"TextColor3","Dim")
return
end
for bk,bl in ipairs(bj)do
local bm=Instance.new"TextButton"bm.Text=""
bm.Size=UDim2.new(1,-2,0,28)bm.BackgroundColor3=a8.Surface2
bm.BackgroundTransparency=0.35 bm.BorderSizePixel=0
aS(bm,7)bm.Parent=bg
af:_tag(bm,"BackgroundColor3","Surface2")
local bn=Instance.new"TextLabel"bn.BackgroundTransparency=1
bn.Position=UDim2.new(0,8,0,0)bn.Size=UDim2.new(1,-44,1,0)
bn.Font=Enum.Font.Gotham bn.TextSize=12 bn.TextXAlignment=0
bn.TextTruncate=Enum.TextTruncate.AtEnd bn.Text=bl bn.Parent=bm
af:_tag(bn,"TextColor3","Text")
local bo=Instance.new"TextButton"bo.Text=""
bo.AnchorPoint=Vector2.new(1,0.5)bo.Position=UDim2.new(1,-6,0.5,0)
bo.Size=UDim2.fromOffset(22,22)bo.BackgroundTransparency=1 bo.Parent=bm
local bp=a_("x",11,a8.Dim)
bp.AnchorPoint=Vector2.new(0.5,0.5)bp.Position=UDim2.new(0.5,0,0.5,0)
bp.Parent=bo
bm.MouseButton1Click:Connect(function()
af:_sfx"Click"ba:LoadConfig(bl)
end)
bo.MouseButton1Click:Connect(function()
pcall(function()if delfile then delfile(folder().."/"..bl..".json")end end)
ba:Notify{Title="Profile deleted",Content=bl,Duration=2}
refresh()
end)
end
end
be.MouseButton1Click:Connect(function()
af:_sfx"Click"
local bj=bd.Text~=""and bd.Text or"default"
ba:SaveConfig(bj)refresh()
end)
refresh()
return a5{Title=a2.Title or"Profiles",Frame=bb,_handle={Refresh=refresh}}
end end function a.x():typeof(__modImpl())local aa=a.cache.x if not aa then aa={c=__modImpl()}a.cache.x=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local aS=ab.T
local aT=ab.tween local aU=
ac.guid
local aZ=ac.spawnCb
local a_=ac.corner
local a0=ac.hairline local a2=
ac.pad
local a3=ac.lighting
local a5=ac.ripple
local a6=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a8,a9)local ba=
a8.row local bb=
a8.titleBlock
local bc=a8.reg
local bd=a8.tab local be=
a8.Window
local bf=a8.Th local bg=
a8.opts or{}
a9=a9 or{}
local bh=Instance.new"Frame"bh.Size=UDim2.new(1,-4,0,96)
bh.BackgroundColor3=bf.Surface2 bh.BorderSizePixel=0
a_(bh,10)bh.Parent=page
a0(bh,true)
af:_tag(bh,"BackgroundColor3","Surface2")
a3(bh,10)

local bj=Instance.new"Frame"bj.BorderSizePixel=0
bj.Position=UDim2.new(0,0,0,18)bj.Size=UDim2.new(0,3,1,-36)
a_(bj,99)bj.Parent=bh
af:_tag(bj,"BackgroundColor3","Accent")
local bk=a6(a9.Icon or"bellring",18,bf.Accent)
bk.AnchorPoint=Vector2.new(0,0.5)bk.Position=UDim2.new(0,14,0,48)
bk.Parent=bh
if bk:IsA"TextLabel"then bk.Size=UDim2.new(0,18,0,18)end

local bl=a9.Button and-142 or-54
local bm=Instance.new"TextLabel"bm.BackgroundTransparency=1
bm.Position=UDim2.new(0,42,0,16)bm.Size=UDim2.new(1,bl,0,18)
bm.Font=Enum.Font.GothamBold bm.TextSize=14 bm.TextXAlignment=0
bm.TextTruncate=Enum.TextTruncate.AtEnd bm.Text=a9.Title or"News"bm.Parent=bh
af:_tag(bm,"TextColor3","Text")
local bn=Instance.new"TextLabel"bn.BackgroundTransparency=1
bn.Position=UDim2.new(0,42,0,38)bn.Size=UDim2.new(1,bl,0,42)
bn.Font=Enum.Font.Gotham bn.TextSize=12 bm.TextXAlignment=0
bn.TextXAlignment=0 bn.TextYAlignment=0 bn.TextWrapped=true
bn.TextTruncate=Enum.TextTruncate.AtEnd bn.Text=a9.Content or""bn.Parent=bh
af:_tag(bn,"TextColor3","Dim")
if a9.Button then
local bo=Instance.new"TextButton"bo.Text=""
bo.AnchorPoint=Vector2.new(1,0.5)bo.Position=UDim2.new(1,-12,0,48)
bo.Size=UDim2.new(0,76,0,30)bo.BorderSizePixel=0
a_(bo,7)bo.AutoButtonColor=false bo.Parent=bh
af:agrad(bo,15)
local bp=Instance.new"TextLabel"bp.BackgroundTransparency=1
bp.Size=UDim2.fromScale(1,1)bp.Font=Enum.Font.GothamBold
bp.TextSize=11
bp.Text=string.upper(a9.Button)bp.Parent=bo
af:oa(bp)
a5(bo)
bo.MouseButton1Click:Connect(function()
af:_sfx"Click"aZ(a9.Callback)
end)
end
bh.BackgroundTransparency=1
task.delay(#bd.Elements*0.025,function()
aT(bh,aS.Med,{BackgroundTransparency=0})
end)
return bc{Title=a9.Title,Frame=bh,_handle=bh}
end end function a.y():typeof(__modImpl())local aa=a.cache.y if not aa then aa={c=__modImpl()}a.cache.y=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local aS=
ab.T local aT=
ab.tween local aZ=
ac.guid local a_=
ac.spawnCb
local a0=ac.corner
local a2=ac.hairline local a3=
ac.pad
local a5=ac.lighting local a6=
ac.ripple local a8=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a9,bc)local bd=
a9.row local bf=
a9.titleBlock
local bg=a9.reg local bh=
a9.tab local bj=
a9.Window
local bk=a9.Th local bl=
a9.opts or{}
bc=bc or{}
local bm=bc.Stats or bc.Items or{}
local bn=math.max(1,#bm)
local bo=Instance.new"Frame"bo.BackgroundTransparency=1
bo.Size=UDim2.new(1,-4,0,64)bo.Parent=page
local bp=Instance.new"UIListLayout"bp.FillDirection=Enum.FillDirection.Horizontal
bp.Padding=UDim.new(0,8)bp.SortOrder=Enum.SortOrder.LayoutOrder bp.Parent=bo
local bq={}
for br,bs in ipairs(bm)do
local bt=Instance.new"Frame"
bt.Size=UDim2.new(1/bn,-8,1,0)
bt.BackgroundColor3=bk.Surface bt.BorderSizePixel=0
a0(bt,10)bt.LayoutOrder=br bt.Parent=bo
a2(bt,true)
af:_tag(bt,"BackgroundColor3","Surface")
a5(bt,10)
local bu=Instance.new"TextLabel"bu.BackgroundTransparency=1
bu.Position=UDim2.new(0,0,0,10)bu.Size=UDim2.new(1,0,0,20)
bu.Font=Enum.Font.GothamBold bu.TextSize=16 bu.Text=tostring(bs.Value or"-")
bu.Parent=bt
af:_tag(bu,"TextColor3",bs.Accent and"Accent"or"Text")
local bv=Instance.new"TextLabel"bv.BackgroundTransparency=1
bv.Position=UDim2.new(0,0,0,32)bv.Size=UDim2.new(1,0,0,14)
bv.Font=Enum.Font.GothamBold bv.TextSize=9
bv.Text=string.upper(bs.Label or"")bv.Parent=bt
af:_tag(bv,"TextColor3","Dim")
bq[bs.Label or br]={Set=function(bw,bx)bu.Text=tostring(bx)end,Frame=bt}
end
return bg{Title=bc.Title or"Stats",Frame=bo,_handle=bq}
end end function a.z():typeof(__modImpl())local aa=a.cache.z if not aa then aa={c=__modImpl()}a.cache.z=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local a0=
ab.T local a2=
ab.tween local a5=
ac.guid local a8=
ac.spawnCb
local a9=ac.corner local bc=
ac.hairline local bg=
ac.pad local bk=
ac.lighting local bl=
ac.ripple local bm=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bn,bo)local bp=
bn.row local bq=
bn.titleBlock
local br=bn.reg local bs=
bn.tab local bt=
bn.Window
local bu=bn.Th local bv=
bn.opts or{}
bo=bo or{}
local bw=math.clamp(bo.Lines or 3,1,6)
local bx=Instance.new"Frame"bx.BackgroundTransparency=1
bx.Size=UDim2.new(1,-4,0,bw*18+8)bx.Parent=page
for by=1,bw do
local bz=Instance.new"Frame"bz.BorderSizePixel=0
bz.Position=UDim2.new(0,0,0,(by-1)*18)
bz.Size=UDim2.new(by==bw and 0.6 or 1,0,0,12)
bz.BackgroundColor3=bu.Surface2 a9(bz,6)bz.Parent=bx
af:_tag(bz,"BackgroundColor3","Surface2")
local bA=Instance.new"Frame"bA.Name="_sheen"bA.BorderSizePixel=0
bA.Size=UDim2.new(0.35,0,1,0)bA.BackgroundColor3=Color3.fromRGB(255,255,255)
bA.BackgroundTransparency=0.88 a9(bA,6)bA.Parent=bz
bz.ClipsDescendants=true
end
task.spawn(function()
local by=0
while bx.Parent do
by+=0.03 task.wait(0.03)
for bz,bA in ipairs(bx:GetChildren())do
if bA:IsA"Frame"then
for bB,bC in ipairs(bA:GetChildren())do
if bC.Name=="_sheen"then
local bD=((by*0.9)%1.4)-0.2
pcall(function()bC.Position=UDim2.new(bD,0,0,0)end)
end
end
end
end
end
end)
return br{Title=bo.Title or"Loading",Frame=bx,_handle=bx}
end end function a.A():typeof(__modImpl())local aa=a.cache.A if not aa then aa={c=__modImpl()}a.cache.A=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local a9=
ab.T
local bm=ab.tween local bn=
ac.guid local bo=
ac.spawnCb
local br=ac.corner local bu=
ac.hairline local bv=
ac.pad local bw=
ac.lighting local bx=
ac.ripple local by=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bz,bA)
local bB=bz.row
local bC=bz.titleBlock
local bD=bz.reg local bE=
bz.tab local bF=
bz.Window local bG=
bz.Th local bH=
bz.opts or{}
bA=bA or{}
local bI={online="Success",idle="Warn",offline="Danger",busy="Accent"}
local bJ=string.lower(bA.State or"online")
local bK=bB(bA.Description and 54 or 40)
bC(bK,bA.Title or"Status",bA.Description)
local bL=Instance.new"Frame"bL.AnchorPoint=Vector2.new(1,0.5)
bL.Position=UDim2.new(1,-84,0.5,0)bL.Size=UDim2.fromOffset(10,10)
bL.BorderSizePixel=0 br(bL,99)bL.Parent=bK
af:_tag(bL,"BackgroundColor3",bI[bJ]or"Success")
local bM=Instance.new"TextLabel"bM.BackgroundTransparency=1
bM.AnchorPoint=Vector2.new(1,0.5)bM.Position=UDim2.new(1,-12,0.5,0)
bM.Size=UDim2.new(0,56,0,16)bM.Font=Enum.Font.GothamBold
bM.TextSize=10 bM.TextXAlignment=1 bM.Text=string.upper(bJ)bM.Parent=bK
af:_tag(bM,"TextColor3","Dim")
task.spawn(function()
while bL.Parent do
bm(bL,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0.55})
task.wait(1.25)
if not bL.Parent then break end
bm(bL,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0})
task.wait(1.25)
end
end)
local bN={}
function bN.Set(bO,bP)
bJ=string.lower(bP)
af:_tag(bL,"BackgroundColor3",bI[bJ]or"Success")
bM.Text=string.upper(bJ)
end
return bD{Title=bA.Title,Frame=bK,_handle=bN}
end end function a.B():typeof(__modImpl())local aa=a.cache.B if not aa then aa={c=__modImpl()}a.cache.B=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local bm=
ab.T local br=
ab.tween local by=
ac.guid local bz=
ac.spawnCb local bA=
ac.corner local bB=
ac.hairline local bC=
ac.pad local bD=
ac.lighting local bH=
ac.ripple
local bI=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bJ,bK)local bL=
bJ.row local bM=
bJ.titleBlock
local bN=bJ.reg local bO=
bJ.tab local bP=
bJ.Window
local bQ=bJ.Th local bR=
bJ.opts or{}
bK=bK or{}
local bS=Instance.new"Frame"bS.BackgroundTransparency=1
bS.Size=UDim2.new(1,-4,0,130)bS.Parent=page
local bT=bI(bK.Icon or"box",30,bQ.Dim)
bT.AnchorPoint=Vector2.new(0.5,0)bT.Position=UDim2.new(0.5,0,0,18)
bT.Parent=bS
if bT:IsA"TextLabel"then bT.Size=UDim2.new(0,30,0,30)end
local bU=Instance.new"TextLabel"bU.BackgroundTransparency=1
bU.Position=UDim2.new(0,0,0,56)bU.Size=UDim2.new(1,0,0,20)
bU.Font=Enum.Font.GothamBold bU.TextSize=14 bU.Text=bK.Title or"Nothing here"
bU.Parent=bS
af:_tag(bU,"TextColor3","Text")
local bV=Instance.new"TextLabel"bV.BackgroundTransparency=1
bV.Position=UDim2.new(0,20,0,78)bV.Size=UDim2.new(1,-40,0,36)
bV.Font=Enum.Font.Gotham bV.TextSize=12 bV.TextWrapped=true
bV.Text=bK.Hint or"This section is empty."bV.Parent=bS
af:_tag(bV,"TextColor3","Dim")
return bN{Title=bK.Title,Frame=bS,_handle=bS}
end end function a.C():typeof(__modImpl())local aa=a.cache.C if not aa then aa={c=__modImpl()}a.cache.C=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local bH=ab.T
local bI=ab.tween local bJ=
ac.guid local bK=
ac.spawnCb
local bN=ac.corner
local bQ=ac.hairline local bR=
ac.pad
local bS=ac.lighting local bT=
ac.ripple local bU=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bV,bW)local bX=
bV.row local bY=
bV.titleBlock
local bZ=bV.reg
local b_=bV.tab local b0=
bV.Window
local b1=bV.Th local b2=
bV.opts or{}
bW=bW or{}
local b3=Instance.new"Frame"b3.Size=UDim2.new(1,-4,0,64)
b3.BackgroundColor3=b1.Surface2 b3.BorderSizePixel=0
bN(b3,10)b3.Parent=page
bQ(b3,true)
af:_tag(b3,"BackgroundColor3","Surface2")
bS(b3,10)
local b4=Instance.new"Frame"b4.AnchorPoint=Vector2.new(0,0.5)
b4.Position=UDim2.new(0,12,0.5,0)b4.Size=UDim2.fromOffset(40,40)
b4.BorderSizePixel=0 bN(b4,99)b4.Parent=b3
af:agrad(b4,45)
local b5=Instance.new"TextLabel"b5.Size=UDim2.fromScale(1,1)
b5.BackgroundTransparency=1 b5.Font=Enum.Font.GothamBlack
b5.TextSize=18
b5.Text=string.upper(string.sub(bW.Name or"?",1,1))b5.Parent=b4
af:oa(b5)
local b6=Instance.new"TextLabel"b6.BackgroundTransparency=1
b6.Position=UDim2.new(0,62,0,12)b6.Size=UDim2.new(1,-120,0,18)
b6.Font=Enum.Font.GothamBold b6.TextSize=14 b6.TextXAlignment=0
b6.TextTruncate=Enum.TextTruncate.AtEnd b6.Text=bW.Name or"guest"b6.Parent=b3
af:_tag(b6,"TextColor3","Text")
local b7=Instance.new"TextLabel"b7.BackgroundTransparency=1
b7.Position=UDim2.new(0,62,0,32)b7.Size=UDim2.new(1,-120,0,14)
b7.Font=Enum.Font.Gotham b7.TextSize=11 b7.TextXAlignment=0
b7.TextTruncate=Enum.TextTruncate.AtEnd b7.Text=bW.Tag or"Premium"b7.Parent=b3
af:_tag(b7,"TextColor3","Dim")
local b8=Instance.new"Frame"b8.AnchorPoint=Vector2.new(1,0.5)
b8.Position=UDim2.new(1,-14,0.5,0)b8.Size=UDim2.fromOffset(10,10)
b8.BorderSizePixel=0 bN(b8,99)b8.Parent=b3
af:_tag(b8,"BackgroundColor3","Success")
b3.BackgroundTransparency=1
task.delay(#b_.Elements*0.025,function()
bI(b3,bH.Med,{BackgroundTransparency=0})
end)
return bZ{Title=bW.Name,Frame=b3,_handle=b3}
end end function a.D():typeof(__modImpl())local aa=a.cache.D if not aa then aa={c=__modImpl()}a.cache.D=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local bH=ab.T
local bI=ab.tween local bN=
ac.guid
local bQ=ac.spawnCb
local bS=ac.corner
local bU=ac.hairline local bV=
ac.pad
local bW=ac.lighting local bZ=
ac.ripple
local b_=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b1,b2)local b3=
b1.row local b4=
b1.titleBlock
local b5=b1.reg local b6=
b1.tab local b7=
b1.Window
local b8=b1.Th local b9=
b1.opts or{}
b2=b2 or{}
local c=b2.Cards or{}
local ca=math.clamp(b2.Columns or 2,1,3)
local cb=Instance.new"Frame"cb.BackgroundTransparency=1
cb.Size=UDim2.new(1,-4,0,0)cb.AutomaticSize=Enum.AutomaticSize.Y
cb.Parent=page
local cc=Instance.new"UIListLayout"cc.Padding=UDim.new(0,8)
cc.SortOrder=Enum.SortOrder.LayoutOrder cc.Parent=cb




local cd,cf=0
for ch,cj in ipairs(c)do
if(ch-1)%ca==0 then
cf=Instance.new"Frame"cf.BackgroundTransparency=1
cf.Size=UDim2.new(1,0,0,68)cf.AutomaticSize=Enum.AutomaticSize.Y
cf.Parent=cb
local cl=Instance.new"UIListLayout"cl.FillDirection=Enum.FillDirection.Horizontal
cl.Padding=UDim.new(0,8)cl.SortOrder=Enum.SortOrder.LayoutOrder cl.Parent=cf
cd+=1
end
local cl=false
local cm=Instance.new"Frame"
cm.Size=UDim2.new(1/ca,-8+8/ca,0,68)
cm.BackgroundColor3=b8.Surface cm.BorderSizePixel=0
bS(cm,10)cm.LayoutOrder=ch cm.Parent=cf
bU(cm,true)
af:_tag(cm,"BackgroundColor3","Surface")
bW(cm,10)


local cn=Instance.new"TextButton"cn.Text=""
cn.Size=UDim2.fromScale(1,1)cn.BackgroundTransparency=1 cn.Parent=cm
local co=b_(cj.Icon or"box",16,b8.Dim)
co.Position=UDim2.new(0,10,0,10)co.Parent=cm
if co:IsA"TextLabel"then co.Size=UDim2.new(0,16,0,16)end
local cp=Instance.new"TextLabel"cp.BackgroundTransparency=1
cp.Position=UDim2.new(0,34,0,8)cp.Size=UDim2.new(1,-42,0,18)
cp.Font=Enum.Font.GothamBold cp.TextSize=13 cp.TextXAlignment=0
cp.TextTruncate=Enum.TextTruncate.AtEnd cp.Text=cj.Title or"Script"cp.Parent=cm
af:_tag(cp,"TextColor3","Text")
local cq=Instance.new"TextLabel"cq.BackgroundTransparency=1
cq.Position=UDim2.new(0,10,0,30)cq.Size=UDim2.new(1,-20,0,28)
cq.Font=Enum.Font.Gotham cq.TextSize=11
cq.TextXAlignment=0 cq.TextYAlignment=0
cq.TextWrapped=true cq.TextTruncate=Enum.TextTruncate.AtEnd
cq.Text=cj.Desc or""cq.Visible=false cq.Parent=cm
af:_tag(cq,"TextColor3","Dim")
local cr=Instance.new"TextButton"cr.Text=""
cr.AnchorPoint=Vector2.new(0,1)cr.Position=UDim2.new(0,10,1,-10)
cr.Size=UDim2.new(1,-20,0,28)cr.BorderSizePixel=0
bS(cr,7)cr.AutoButtonColor=false cr.Visible=false cr.Parent=cm
af:agrad(cr,15)
local cs=Instance.new"TextLabel"cs.BackgroundTransparency=1
cs.Size=UDim2.fromScale(1,1)cs.Font=Enum.Font.GothamBold
cs.TextSize=11
cs.Text="LAUNCH"cs.Parent=cr
af:oa(cs)
cn.MouseButton1Click:Connect(function()
cl=not cl
af:_sfx"Click"
bI(cm,bH.Med,{Size=UDim2.new(1/ca,-8+8/ca,0,cl and 118 or 68)})
cq.Visible,cr.Visible=cl,cl
end)
cr.MouseButton1Click:Connect(function()
af:_sfx"Click"bQ(cj.Callback)
end)
end
return b5{Title=b2.Title or"Scripts",Frame=cb,_handle=cb}
end end function a.E():typeof(__modImpl())local aa=a.cache.E if not aa then aa={c=__modImpl()}a.cache.E=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local bH=
ab.T local bI=
ab.tween local bQ=
ac.guid local bS=
ac.spawnCb
local bU=ac.corner local bW=
ac.hairline local bZ=
ac.pad local b_=
ac.lighting local b1=
ac.ripple local b2=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b5,b8)local b9=
b5.row local c=
b5.titleBlock
local ca=b5.reg local cb=
b5.tab local cc=
b5.Window
local cd=b5.Th local cf=
b5.opts or{}
b8=b8 or{}
local ch=b8.Limit or 5
local cj=Instance.new"Frame"cj.BackgroundTransparency=1
cj.Size=UDim2.new(1,-4,0,0)cj.AutomaticSize=Enum.AutomaticSize.Y
cj.Parent=page
local cl=Instance.new"UIListLayout"cl.Padding=UDim.new(0,4)
cl.SortOrder=Enum.SortOrder.LayoutOrder cl.Parent=cj
local function refresh()
for cm,cn in ipairs(cj:GetChildren())do
if cn:IsA"TextButton"then pcall(function()cn:Destroy()end)end
end
local cm=af._recent or{}
if#cm==0 then
local cn=Instance.new"TextLabel"cn.BackgroundTransparency=1
cn.Size=UDim2.new(1,0,0,24)cn.Font=Enum.Font.Gotham
cn.TextSize=11 cn.Text="Use any control and it lands here."cn.Parent=cj
af:_tag(cn,"TextColor3","Dim")
return
end
for cn=1,math.min(ch,#cm)do
local co=cm[cn]
local cp=Instance.new"TextButton"cp.Text=""
cp.Size=UDim2.new(1,0,0,30)cp.BackgroundColor3=cd.Surface
cp.BackgroundTransparency=0.35 cp.BorderSizePixel=0
bU(cp,7)cp.Parent=cj
af:_tag(cp,"BackgroundColor3","Surface")
local cq=Instance.new"TextLabel"cq.BackgroundTransparency=1
cq.Position=UDim2.new(0,10,0,0)cq.Size=UDim2.new(1,-90,1,0)
cq.Font=Enum.Font.Gotham cq.TextSize=12 cq.TextXAlignment=0
cq.TextTruncate=Enum.TextTruncate.AtEnd cq.Text=co.label cq.Parent=cp
af:_tag(cq,"TextColor3","Text")
local cr=Instance.new"TextLabel"cr.BackgroundTransparency=1
cr.AnchorPoint=Vector2.new(1,0)cr.Position=UDim2.new(1,-10,0,0)
cr.Size=UDim2.new(0,74,1,0)cr.Font=Enum.Font.Gotham
cr.TextSize=10 cr.TextXAlignment=1 cr.Text=co.tab cr.Parent=cp
af:_tag(cr,"TextColor3","Dim")
cp.MouseButton1Click:Connect(function()
if co.go then af:_sfx"Click"pcall(co.go)end
end)
end
end
af._recentRefresh=af._recentRefresh or{}
table.insert(af._recentRefresh,refresh)
refresh()
return ca{Title=b8.Title or"Recent",Frame=cj,_handle={Refresh=refresh}}
end end function a.F():typeof(__modImpl())local aa=a.cache.F if not aa then aa={c=__modImpl()}a.cache.F=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local b5=
ac.guid local b8=
ac.spawnCb
local ca=ac.corner local cd=
ac.hairline local cf=
ac.pad local ch=
ac.lighting local cj=
ac.ripple local cl=
ad.makeIcon
local cm=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local cn=ae.cloneref_check(game:GetService"Players")

local co={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(cp,cq)
local cr=cp.row local cs=
cp.titleBlock
local ct=cp.reg
local cu=cp.tab local cv=
cp.Window
local cw=cp.Th local f=
cp.opts or{}local g=
cp.page
cq=cq or{}
local N=cq.Accent or cq.Color or cw.Accent
if type(N)=="table"then
N=Color3.new(N[1]or 0,N[2]or 0,N[3]or 0)
end
local S=tostring(cq.Mode or"Chams")
if not co[S]then S="Chams"end
local _,cx,cy,cz=true,true,false,100
local cA
pcall(function()cA=cn.LocalPlayer end)
local cB=cq.Name or((cA and cA.DisplayName)or"Noob")
local cC=(cA and("@"..cA.Name))or""
local cD=cr(170)
local cE=Instance.new"TextLabel"cE.BackgroundTransparency=1
cE.Position=UDim2.new(0,12,0,6)cE.Size=UDim2.new(1,-24,0,16)
cE.Font=Enum.Font.GothamMedium cE.TextSize=12 cE.TextXAlignment=0
cE.TextTruncate=Enum.TextTruncate.AtEnd cE.Text=cq.Title or"Rig Preview"cE.Parent=cD
af:_tag(cE,"TextColor3","Text")
local cF=Instance.new"ViewportFrame"
cF.Position=UDim2.new(0,10,0,26)cF.Size=UDim2.new(1,-20,1,-34)
cF.BackgroundColor3=cw.Bg cF.BorderSizePixel=0
cF.LightColor=Color3.fromRGB(255,255,255)
cF.LightDirection=Vector3.new(-0.5,-1,-0.6)
cF.Ambient=Color3.fromRGB(150,150,168)
ca(cF,8)cF.Parent=cD
af:_tag(cF,"BackgroundColor3","Bg")
local cG=Instance.new"Frame"cG.BackgroundTransparency=1
cG.Size=UDim2.fromScale(1,1)cG.Parent=cF
local cH={}
local function bracket(cI,cJ)
local cK=Instance.new"Frame"cK.BorderSizePixel=0
cK.AnchorPoint=Vector2.new(cI,cJ)cK.Position=UDim2.new(cI,0,cJ,0)
cK.Size=UDim2.new(0,12,0,2)cK.Parent=cG
af:_tag(cK,"BackgroundColor3","Accent")
local cL=Instance.new"Frame"cL.BorderSizePixel=0
cL.AnchorPoint=Vector2.new(cI,cJ)cL.Position=UDim2.new(cI,0,cJ,0)
cL.Size=UDim2.new(0,2,0,12)cL.Parent=cG
af:_tag(cL,"BackgroundColor3","Accent")
table.insert(cH,cK)table.insert(cH,cL)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local cI=Instance.new"TextLabel"cI.BackgroundTransparency=1
cI.AnchorPoint=Vector2.new(0.5,0)cI.Position=UDim2.new(0.5,0,0,4)
cI.Size=UDim2.new(1,-16,0,14)cI.Font=Enum.Font.GothamBold
cI.TextSize=11 cI.Text=cB cI.Parent=cG
af:_tag(cI,"TextColor3","Text")
local cJ=Instance.new"TextLabel"cJ.BackgroundTransparency=1
cJ.AnchorPoint=Vector2.new(0.5,0)cJ.Position=UDim2.new(0.5,0,0,18)
cJ.Size=UDim2.new(1,-16,0,11)cJ.Font=Enum.Font.Gotham
cJ.TextSize=10 cJ.Text=cC cJ.Parent=cG
af:_tag(cJ,"TextColor3","Dim")
local cK=Instance.new"Frame"cK.BorderSizePixel=0
cK.AnchorPoint=Vector2.new(0,0.5)cK.Position=UDim2.new(0,6,0.5,0)
cK.Size=UDim2.new(0,4,1,-30)cK.BackgroundColor3=cw.Surface2
ca(cK,99)cK.Parent=cG
af:_tag(cK,"BackgroundColor3","Surface2")
local cL=Instance.new"Frame"cL.BorderSizePixel=0
cL.AnchorPoint=Vector2.new(0,1)cL.Position=UDim2.new(0,0,1,0)
cL.Size=UDim2.new(1,0,1,0)cL.BackgroundColor3=cw.Success
ca(cL,99)cL.Parent=cK
af:_tag(cL,"BackgroundColor3","Success")
local cM=Instance.new"WorldModel"cM.Parent=cF
local cN=Instance.new"Camera"cN.Parent=cF
cF.CurrentCamera=cN

cN.CFrame=CFrame.new(Vector3.new(0,2.9,7),Vector3.new(0,2.3,0))
local cO,cP={},{}
local function part(cQ,cR,cS)
local cT=Instance.new"Part"cT.Name=cQ
cT.Size=cR cT.Position=cS cT.Anchored=true cT.CanCollide=false
cT.TopSurface=Enum.SurfaceType.Smooth
cT.BottomSurface=Enum.SurfaceType.Smooth
cT.Color=Color3.fromRGB(200,200,215)
cT.Material=Enum.Material.Plastic
cT.Parent=cM
table.insert(cO,cT)
local cU=Instance.new"SelectionBox"
cU.Adornee=cT cU.LineThickness=0.05
cU.Color3=Color3.fromRGB(255,255,255)
cU.SurfaceTransparency=1 cU.Visible=false
cU.Parent=cT
cP[cT]=cU
return cT
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local cQ={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local cR={}
local function paint()
for cS,cT in ipairs(cO)do
if cT and cT.Parent then
if S=="Noob"then
cT.Color=cQ[cT.Name]or Color3.fromRGB(200,200,215)
cT.Material=Enum.Material.Plastic
cT.Transparency=0
elseif S=="Ghost"then
cT.Color=N
cT.Material=Enum.Material.ForceField
cT.Transparency=0
elseif S=="Solid"or S=="Box"then
cT.Color=Color3.fromRGB(200,200,215)
cT.Material=Enum.Material.Plastic
cT.Transparency=0
else
cT.Color=N
cT.Material=Enum.Material.Plastic
cT.Transparency=0
end
local cU=cP[cT]
if cU then
cU.Visible=cy or S=="Outline"
cU.Color3=N
end
end
end
for cS,cT in ipairs(cH)do
if cT then cT.Visible=_ or S=="Box"end
end
cI.Visible=cx or S=="Name"
cJ.Visible=cI.Visible
cK.Visible=_ or S=="HP bar"
end
function cR.SetAccent(cS,cT)
if type(cT)=="table"then
cT=Color3.new(cT[1]or 0,cT[2]or 0,cT[3]or 0)
end
if typeof(cT)=="Color3"then N=cT paint()end
end
function cR.SetMode(cS,cT)S=tostring(cT)if not co[S]then S="Chams"end paint()end
function cR.SetBox(cS,cT)_=cT and true or false paint()end
function cR.SetOutline(cS,cT)cy=cT and true or false paint()end
function cR.SetName(cS,cT)cx=cT and true or false paint()end
function cR.SetHealth(cS,cT)
cz=math.clamp(tonumber(cT)or 100,0,100)
b2(cL,bU.Fast,{Size=UDim2.new(1,0,cz/100,0)})
end
function cR.Get(cS)return N end
paint()
local cS=0
local cT={}
for cU,cV in ipairs(cO)do cT[cV]=cV.Position end
local cU
cU=cm.RenderStepped:Connect(function(cV)
if not cF.Parent then pcall(function()cU:Disconnect()end)return end
if not cD:IsDescendantOf(game)then return end
cS+=cV
local cW=math.sin(cS*2.2)*0.045
for cX,cY in ipairs(cO)do
if cY and cY.Parent and cT[cY]then
cY.Position=cT[cY]+Vector3.new(0,cW,0)
end
end
end)
cu._window:Track(cU)
aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(cV,cW)
local cX=cV
if type(cX)=="table"then
cX=Color3.new(cX[1]or 0,cX[2]or 0,cX[3]or 0)
end
if typeof(cX)=="Color3"then N=cX paint()end
end)
if aa.Flags.ESPColor~=nil then
local cV=aa.Flags.ESPColor
if type(cV)=="table"then
cV=Color3.new(cV[1]or 0,cV[2]or 0,cV[3]or 0)
end
if typeof(cV)=="Color3"then N=cV paint()end
end
return ct{Title=cq.Title or"Rig Preview",Frame=cD,_handle=cR}
end end function a.G():typeof(__modImpl())local aa=a.cache.G if not aa then aa={c=__modImpl()}a.cache.G=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local ca=
ac.guid
local cl=ac.spawnCb
local cm=ac.corner
local cn=ac.hairline local co=
ac.pad local cp=
ac.lighting local cq=
ac.ripple
local cr=ac.spotlight
local ct=ac.attachTip local cu=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cw,cx)
local cy=cw.row
local cz=cw.titleBlock
local cA=cw.reg local cB=
cw.tab local cC=
cw.Window
local cD=cw.Th local cE=
cw.opts or{}local cF=
cw.page
cx=cx or{}
local cG=cx.Values or cx.Options or{"A","B"}
local cH=cx.Value or cx.Default or cG[1]
local cI=cy(56)
cz(cI,cx.Title or"Mode",cx.Description,90,true)
cr(cI,0.1)
if cx.Tooltip then ct(cI,cx.Tooltip)end
local cJ=Instance.new"Frame"cJ.BackgroundTransparency=1
cJ.Position=UDim2.new(0,12,0,30)cJ.Size=UDim2.new(1,-24,0,20)
cJ.Parent=cI
local cK=Instance.new"UIListLayout"cK.FillDirection=Enum.FillDirection.Horizontal
cK.Padding=UDim.new(0,4)cK.Parent=cJ
local cL,cM={},{}
local function paint()
for cN,cO in pairs(cM)do
local cP=cN==cH
b2(cO,bU.Hover,{BackgroundTransparency=cP and 0 or 0.65})
local cQ=cO:FindFirstChildOfClass"TextLabel"
if cQ then af:_tag(cQ,"TextColor3",cP and"Text"or"Dim")end
end
end
function cL.Set(cN,cO,cP)
cH=cO paint()
if cx.Flag then af.Flags[cx.Flag]=cH end
if not cP then cl(cx.Callback,cH)cl(cx.OnChanged,cH)end
end
function cL.Get(cN)return cH end
for cN,cO in ipairs(cG)do
local cP=Instance.new"TextButton"cP.Text=""
cP.Size=UDim2.new(1/#cG,-4,0,20)cP.BackgroundColor3=cD.Surface2
cP.BorderSizePixel=0 cm(cP,6)cP.AutoButtonColor=false cP.Parent=cJ
cn(cP,true)
af:_tag(cP,"BackgroundColor3","Surface2")
local cQ=Instance.new"TextLabel"cQ.BackgroundTransparency=1
cQ.Size=UDim2.fromScale(1,1)cQ.Font=Enum.Font.GothamBold
cQ.TextSize=11 cQ.Text=tostring(cO)cQ.Parent=cP
af:_tag(cQ,"TextColor3","Dim")
cM[cO]=cP
cP.MouseButton1Click:Connect(function()
af:_sfx"Click"cL:Set(cO)
end)
end
paint()
local cN={Title=cx.Title,Frame=cI,Value=cH,Flag=cx.Flag,_handle=cL,
_set=function(cN,cO)cL:Set(cN,cO)end}
return cA(cN)
end end function a.H():typeof(__modImpl())local aa=a.cache.H if not aa then aa={c=__modImpl()}a.cache.H=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local cl=
ac.guid
local cm=ac.spawnCb
local cn=ac.corner
local cr=ac.hairline local ct=
ac.pad local cu=
ac.lighting local cw=
ac.ripple local cx=
ac.spotlight
local cy=ac.attachTip local cz=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cA,cD)local cF=
cA.row local cG=
cA.titleBlock
local cH=cA.reg local cI=
cA.tab local cJ=
cA.Window
local cK=cA.Th local cL=
cA.opts or{}
local cM=cA.page
cD=cD or{}
local cN=cD.Values or cD.Options or{"A","B"}
local cO=cD.Value or cD.Default or cN[1]
local cP=Instance.new"Frame"cP.BackgroundTransparency=1
cP.Size=UDim2.new(1,-4,0,#cN*28+26)cP.Parent=cM
local cQ=Instance.new"TextLabel"cQ.BackgroundTransparency=1
cQ.Position=UDim2.new(0,2,0,0)cQ.Size=UDim2.new(1,0,0,18)
cQ.Font=Enum.Font.GothamMedium cQ.TextSize=13 cQ.TextXAlignment=0
cQ.Text=cD.Title or"Choice"cQ.Parent=cP
af:_tag(cQ,"TextColor3","Text")
if cD.Tooltip then cy(cP,cD.Tooltip)end
local cR,cS={},{}
local function paint()
for cT,cU in pairs(cS)do
local cV=cU:FindFirstChild("_dot",true)
local cW=cT==cO
if cV then af:_tag(cV,"BackgroundColor3",cW and"Accent"or"Surface2")end
b2(cU,bU.Hover,{BackgroundTransparency=cW and 0.5 or 1})
end
end
function cR.Set(cT,cU,cV)
cO=cU paint()
if cD.Flag then af.Flags[cD.Flag]=cO end
if not cV then cm(cD.Callback,cO)cm(cD.OnChanged,cO)end
end
function cR.Get(cT)return cO end
for cT,cU in ipairs(cN)do
local cV=Instance.new"TextButton"cV.Text=""
cV.Position=UDim2.new(0,0,0,22+(cT-1)*28)
cV.Size=UDim2.new(1,0,0,24)cV.BackgroundColor3=cK.Surface
cV.BackgroundTransparency=1 cV.BorderSizePixel=0 cn(cV,7)cV.Parent=cP
local cW=Instance.new"Frame"cW.Name="_dot"
cW.Position=UDim2.new(0,10,0.5,-7)cW.Size=UDim2.fromOffset(14,14)
cW.BorderSizePixel=0 cn(cW,99)cW.Parent=cV
cr(cW,true)
local cX=Instance.new"TextLabel"cX.BackgroundTransparency=1
cX.Position=UDim2.new(0,32,0,0)cX.Size=UDim2.new(1,-40,1,0)
cX.Font=Enum.Font.Gotham cX.TextSize=12 cX.TextXAlignment=0
cX.Text=tostring(cU)cX.Parent=cV
af:_tag(cX,"TextColor3","Text")
cS[cU]=cV
cV.MouseButton1Click:Connect(function()af:_sfx"Click"cR:Set(cU)end)
end
paint()
local cT={Title=cD.Title,Frame=cP,Value=cO,Flag=cD.Flag,_handle=cR,
_set=function(cT,cU)cR:Set(cT,cU)end}
return cH(cT)
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local cm=
ac.guid
local cn=ac.spawnCb
local cr=ac.corner local cy=
ac.hairline local cz=
ac.pad local cA=
ac.lighting local cD=
ac.ripple
local cH=ac.spotlight
local cK=ac.attachTip local cL=
ad.makeIcon
local cM=ae.cloneref_check(game:GetService"RunService")
local cN=ae.cloneref_check(game:GetService"UserInputService")

return function(cO,cP)
local cQ=cO.row
local cR=cO.titleBlock
local cS=cO.reg local cT=
cO.tab local cU=
cO.Window
local cV=cO.Th local cW=
cO.opts or{}
local cX=cO.page
cP=cP or{}
local cY=cP.Min or 0 local g=cP.Max or 100 local N=cP.Step or 1
local S=(cP.Value and cP.Value[1])or cP.Lo or cY
local _=(cP.Value and cP.Value[2])or cP.Hi or g
local cZ=cQ(56)
cR(cZ,cP.Title or"Range",cP.Description,90,true)
cH(cZ,0.1)
if cP.Tooltip then cK(cZ,cP.Tooltip)end
local c_=Instance.new"TextLabel"c_.BackgroundTransparency=1
c_.AnchorPoint=Vector2.new(1,0)c_.Position=UDim2.new(1,-12,0,6)
c_.Size=UDim2.new(0,90,0,18)c_.Font=Enum.Font.Code
c_.TextSize=11 c_.TextXAlignment=1 c_.Parent=cZ
af:_tag(c_,"TextColor3","Dim")
local c0=Instance.new"TextButton"c0.Text=""c0.AutoButtonColor=false
c0.Position=UDim2.new(0,12,0,36)c0.Size=UDim2.new(1,-24,0,6)
c0.BackgroundColor3=cV.Surface2 c0.BorderSizePixel=0 cr(c0,99)c0.Parent=cZ
af:_tag(c0,"BackgroundColor3","Surface2")
local c1=Instance.new"Frame"c1.BorderSizePixel=0 cr(c1,99)c1.Parent=c0
af:agrad(c1,0)
local c2=Instance.new"Frame"c2.AnchorPoint=Vector2.new(0.5,0.5)
c2.Size=UDim2.fromOffset(13,13)c2.BackgroundColor3=Color3.fromRGB(255,255,255)
c2.BorderSizePixel=0 cr(c2,99)c2.Parent=c0
local c3=Instance.new"Frame"c3.AnchorPoint=Vector2.new(0.5,0.5)
c3.Size=UDim2.fromOffset(13,13)c3.BackgroundColor3=Color3.fromRGB(255,255,255)
c3.BorderSizePixel=0 cr(c3,99)c3.Parent=c0
local c4={}
local function snap(c5)c5=math.clamp(c5,cY,g)return math.round(c5/N)*N end
local function render(c5)
S,_=math.min(S,_),math.max(S,_)
local c6=(S-cY)/math.max(1e-6,g-cY)
local c7=(_-cY)/math.max(1e-6,g-cY)
local c8=c5 and bU.Fill08 or TweenInfo.new(0)
b2(c1,c8,{Position=UDim2.new(c6,0,0,0),Size=UDim2.new(c7-c6,0,1,0)})
c2.Position=UDim2.new(c6,0,0.5,0)
c3.Position=UDim2.new(c7,0,0.5,0)
c_.Text=tostring(S).." - "..tostring(_)
end
function c4.Set(c5,c6,c7)
if type(c6)=="table"then S,_=snap(c6[1]or S),snap(c6[2]or _)end
render(true)
if cP.Flag then af.Flags[cP.Flag]={S,_}end
if not c7 then cn(cP.Callback,{S,_})end
end
function c4.Get(c5)return{S,_}end
render(false)
local c5
c0.InputBegan:Connect(function(c6)
if c6.UserInputType~=Enum.UserInputType.MouseButton1 and c6.UserInputType~=Enum.UserInputType.Touch then return end
local c7=c6.Position.X
local c8=c2.AbsolutePosition.X local c9=c3.AbsolutePosition.X
c5=(math.abs(c7-c8)<math.abs(c7-c9))and 1 or 2
cX.ScrollingEnabled=false
local da;da=cM.RenderStepped:Connect(function()
if not c5 then da:Disconnect()return end
local db=cN:GetMouseLocation().X
local dc=math.clamp((db-c0.AbsolutePosition.X)/math.max(1,c0.AbsoluteSize.X),0,1)
local dd=snap(cY+dc*(g-cY))
if c5==1 then S=math.min(dd,_)else _=math.max(dd,S)end
render(false)
end)
local db;db=cN.InputEnded:Connect(function(dc)
if dc.UserInputType==Enum.UserInputType.MouseButton1 or dc.UserInputType==Enum.UserInputType.Touch then
c5=nil cX.ScrollingEnabled=true
if da then da:Disconnect()end if db then db:Disconnect()end
if cP.Flag then af.Flags[cP.Flag]={S,_}end
cn(cP.Callback,{S,_})cn(cP.OnRelease,{S,_})
end
end)
end)
local c6={Title=cP.Title,Frame=cZ,Value={S,_},Flag=cP.Flag,_handle=c4,
_set=function(c6,c7)c4:Set(c6,c7)end}
return cS(c6)
end end function a.J():typeof(__modImpl())local aa=a.cache.J if not aa then aa={c=__modImpl()}a.cache.J=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local bU=
ab.T local b2=
ab.tween local cn=
ac.guid local cr=
ac.spawnCb
local cH=ac.corner local cK=
ac.hairline local cL=
ac.pad local cM=
ac.lighting local cN=
ac.ripple
local cO=ac.spotlight
local cP=ac.attachTip local cQ=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cR,cS)
local cV=cR.row
local cW=cR.titleBlock
local cX=cR.reg local cY=
cR.tab local cZ=
cR.Window
local c_=cR.Th local c0=
cR.opts or{}local c1=
cR.page
cS=cS or{}
local c2=math.clamp(cS.Points or 60,10,200)
local c3={}
for c4,c5 in ipairs(cS.Values or{})do table.insert(c3,c5)end
local c4=cV(74)
cW(c4,cS.Title or"Graph",cS.Description,70,true)
cO(c4,0.08)
if cS.Tooltip then cP(c4,cS.Tooltip)end
local c5=Instance.new"TextLabel"c5.BackgroundTransparency=1
c5.AnchorPoint=Vector2.new(1,0)c5.Position=UDim2.new(1,-12,0,6)
c5.Size=UDim2.new(0,60,0,18)c5.Font=Enum.Font.GothamBold
c5.TextSize=12 c5.TextXAlignment=1 c5.Parent=c4
af:_tag(c5,"TextColor3","Text")
local c6=Instance.new"Frame"c6.BorderSizePixel=0
c6.Position=UDim2.new(0,12,0,28)c6.Size=UDim2.new(1,-24,0,36)
c6.BackgroundColor3=c_.Bg cH(c6,6)c6.ClipsDescendants=true c6.Parent=c4
af:_tag(c6,"BackgroundColor3","Bg")
local c7=Instance.new"Frame"c7.BorderSizePixel=0 c7.Parent=c6
af:agrad(c7,0)
cH(c7,99)
local c8={}
local c9={}
local function draw()
for da,db in ipairs(c8)do pcall(function()db:Destroy()end)end
c8={}
if#c3==0 then c5.Text="--"return end
local da,db=math.huge,-math.huge
for dc,dd in ipairs(c3)do da=math.min(da,dd)db=math.max(db,dd)end
if db-da<1e-6 then db=da+1 end
c5.Text=tostring(math.round(c3[#c3]*10)/10)
local dc=c6.AbsoluteSize.X if dc<10 then dc=200 end local dd=
#c3
for g,N in ipairs(c3)do
local S=(N-da)/(db-da)
local _=Instance.new"Frame"_.BorderSizePixel=0
_.AnchorPoint=Vector2.new(0.5,1)_.Size=UDim2.fromOffset(3,3)
_.Position=UDim2.new((g-1)/math.max(1,c2-1),0,1-S*0.85-0.07,0)
_.BackgroundColor3=c_.Accent cH(_,99)_.Parent=c6
af:_tag(_,"BackgroundColor3","Accent")
table.insert(c8,_)
end
c7.Position=UDim2.new(0,0,1,-2)c7.Size=UDim2.new(1,0,0,2)
end
function c9.Push(da,db)
table.insert(c3,tonumber(db)or 0)
while#c3>c2 do table.remove(c3,1)end
draw()
end
function c9.Set(da,db)
c3={}
if type(db)=="table"then for dc,dd in ipairs(db)do table.insert(c3,tonumber(dd)or 0)end end
draw()
end
function c9.Get(da)return c3 end
c9.Frame=c4
task.defer(draw)
return cX{Title=cS.Title,Frame=c4,_handle=c9}
end end function a.K():typeof(__modImpl())local aa=a.cache.K if not aa then aa={c=__modImpl()}a.cache.K=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local cH=
ab.T local cO=
ab.tween local cP=
ac.guid local cQ=
ac.spawnCb local cR=
ac.corner local cS=
ac.hairline local cV=
ac.pad local cW=
ac.lighting local cX=
ac.ripple local c_=
ac.spotlight local c1=
ac.attachTip
local c2=ac.mdToRich local c3=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(c4,c5)local c6=
c4.row local c7=
c4.titleBlock
local c8=c4.reg local c9=
c4.tab local da=
c4.Window local db=
c4.Th local dc=
c4.opts or{}
local dd=c4.page
if type(c5)=="string"then c5={Text=c5}end c5=c5 or{}
local g=Instance.new"TextLabel"g.BackgroundTransparency=1
g.Size=UDim2.new(1,-4,0,0)g.AutomaticSize=Enum.AutomaticSize.Y
g.Font=Enum.Font.Gotham g.TextSize=c5.Size or 12
g.TextXAlignment=0 g.TextYAlignment=0 g.TextWrapped=true
g.RichText=true g.Text=c2(c5.Text or"")g.Parent=dd
af:_tag(g,"TextColor3","Text")
return c8{Title=c5.Title or"Text",Frame=g,_handle=g}
end end function a.L():typeof(__modImpl())local aa=a.cache.L if not aa then aa={c=__modImpl()}a.cache.L=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local c2=
ab.T local c3=
ab.tween local c4=
ac.guid local c5=
ac.spawnCb
local c8=ac.corner
local dc=ac.hairline local dd=
ac.pad local g=
ac.lighting local N=
ac.ripple local S=
ac.spotlight local _=
ac.attachTip local de=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(df,dg)
local dh=df.row local di=
df.titleBlock
local dj=df.reg local dk=
df.tab local dl=
df.Window
local dm=df.Th local dn=
df.opts or{}local dp=
df.page
dg=dg or{}
local dq=dh(math.clamp(38+14*#(string.split(dg.Text or"print('hi')","\n")),52,160))
local dr=Instance.new"TextLabel"dr.BackgroundTransparency=1
dr.Position=UDim2.new(0,12,0,6)dr.Size=UDim2.new(1,-90,1,-12)
dr.Font=Enum.Font.Code dr.TextSize=12 dr.TextXAlignment=0 dr.TextYAlignment=0
dr.TextWrapped=true dr.TextTruncate=Enum.TextTruncate.AtEnd
dr.Text=dg.Text or""dr.Parent=dq
af:_tag(dr,"TextColor3","Text")
local ds=Instance.new"TextButton"ds.Text=""
ds.AnchorPoint=Vector2.new(1,0)ds.Position=UDim2.new(1,-10,0,8)
ds.Size=UDim2.new(0,56,0,24)ds.BackgroundColor3=dm.Surface2
ds.BorderSizePixel=0 c8(ds,6)ds.AutoButtonColor=false ds.Parent=dq
dc(ds,true)
af:_tag(ds,"BackgroundColor3","Surface2")
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Size=UDim2.fromScale(1,1)dt.Font=Enum.Font.GothamBold
dt.TextSize=10 dt.Text="COPY"dt.Parent=ds
af:_tag(dt,"TextColor3","Dim")
ds.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(dr.Text)end end)
dt.Text="COPIED"
task.delay(1.2,function()pcall(function()dt.Text="COPY"end)end)
end)
return dj{Title=dg.Title or"Code",Frame=dq,_handle=dr}
end end function a.M():typeof(__modImpl())local aa=a.cache.M if not aa then aa={c=__modImpl()}a.cache.M=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local c8=
ab.T local dc=
ab.tween local de=
ac.guid
local df=ac.spawnCb
local dg=ac.corner
local dh=ac.hairline local dj=
ac.pad local dm=
ac.lighting local dp=
ac.ripple
local dq=ac.spotlight
local dr=ac.attachTip
local ds=ac.setDisabled
local dt=ac.attachCtx local du=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local dv=ae.cloneref_check(game:GetService"UserInputService")

return function(dw,dx)
local dy=dw.row
local dz=dw.titleBlock
local dA=dw.reg local dB=
dw.tab local dC=
dw.Window
local dD=dw.Th local dE=
dw.opts or{}local dF=
dw.page
local dG=dw.pgui
dx=dx or{}
local dH=dx.Min or 0 local dI=dx.Max or 100 local dJ=dx.Step or 1
local dK=dx.Value or dx.Default or dH
local dL=dy(40)
dz(dL,dx.Title or"Count",dx.Description,130)
dq(dL,0.08)
if dx.Tooltip then dr(dL,dx.Tooltip)end
if dx.ContextMenu then dt(dG,dL,dx.ContextMenu)end
local dM=Instance.new"TextButton"dM.Text=""
dM.AnchorPoint=Vector2.new(1,0.5)dM.Position=UDim2.new(1,-92,0.5,0)
dM.Size=UDim2.fromOffset(28,28)dM.BackgroundColor3=dD.Surface2
dM.BorderSizePixel=0 dg(dM,7)dM.AutoButtonColor=false dM.Parent=dL
dh(dM,true)
af:_tag(dM,"BackgroundColor3","Surface2")
local dN=Instance.new"TextLabel"dN.BackgroundTransparency=1 dN.Size=UDim2.fromScale(1,1)
dN.Font=Enum.Font.GothamBold dN.TextSize=14 dN.Text="-"dN.Parent=dM
af:_tag(dN,"TextColor3","Text")
local dO=Instance.new"TextLabel"dO.BackgroundTransparency=1
dO.AnchorPoint=Vector2.new(1,0.5)dO.Position=UDim2.new(1,-60,0.5,0)
dO.Size=UDim2.new(0,28,0,20)dO.Font=Enum.Font.GothamBold
dO.TextSize=13 dO.Text=tostring(dK)dO.Parent=dL
af:_tag(dO,"TextColor3","Text")
local dP=Instance.new"TextButton"dP.Text=""
dP.AnchorPoint=Vector2.new(1,0.5)dP.Position=UDim2.new(1,-12,0.5,0)
dP.Size=UDim2.fromOffset(28,28)dP.BackgroundColor3=dD.Surface2
dP.BorderSizePixel=0 dg(dP,7)dP.AutoButtonColor=false dP.Parent=dL
dh(dP,true)
af:_tag(dP,"BackgroundColor3","Surface2")
local dQ=Instance.new"TextLabel"dQ.BackgroundTransparency=1 dQ.Size=UDim2.fromScale(1,1)
dQ.Font=Enum.Font.GothamBold dQ.TextSize=14 dQ.Text="+"dQ.Parent=dP
af:_tag(dQ,"TextColor3","Text")
local dR={}
local function render()dO.Text=tostring(dK)end
function dR.Set(dS,dT,dU)
dK=math.clamp(tonumber(dT)or dK,dH,dI)
render()
if dx.Flag then af.Flags[dx.Flag]=dK end
if not dU then df(dx.Callback,dK)df(dx.OnChanged,dK)end
end
function dR.Get(dS)return dK end
local function hold(dS,dT)
dS.InputBegan:Connect(function(dU)
if dU.UserInputType~=Enum.UserInputType.MouseButton1 and dU.UserInputType~=Enum.UserInputType.Touch then return end
dR:Set(dK+dT*dJ)
local dV=os.clock()
task.spawn(function()
while dv:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
if os.clock()-dV<0.35 then task.wait(0.05)
else dR:Set(dK+dT*dJ)task.wait(0.08)end
end
end)
end)
end
hold(dM,-1)hold(dP,1)
if dx.Disabled then task.defer(function()pcall(ds,dL,true)end)end
local dS={Title=dx.Title,Frame=dL,Value=dK,Flag=dx.Flag,_handle=dR,
_set=function(dS,dT)dR:Set(dS,dT)end,Tooltip=dx.Tooltip}
return dA(dS)
end end function a.N():typeof(__modImpl())local aa=a.cache.N if not aa then aa={c=__modImpl()}a.cache.N=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local df=
ab.T local dg=
ab.tween local dh=
ac.guid
local dq=ac.spawnCb
local dr=ac.corner local ds=
ac.hairline local dt=
ac.pad local du=
ac.lighting local dv=
ac.ripple local dw=
ac.spotlight local dx=
ac.attachTip local dy=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dz,dA)local dD=
dz.row local dF=
dz.titleBlock
local dG=dz.reg local dH=
dz.tab local dI=
dz.Window
local dJ=dz.Th local dK=
dz.opts or{}
local dL=dz.page
dA=dA or{}
local dM=dA.Columns or{"Key","Value"}
local dN=dA.Rows or{}
local dO=Instance.new"Frame"dO.BackgroundTransparency=1
dO.Size=UDim2.new(1,-4,0,30+math.min(6,math.max(1,#dN))*24+8)
dO.AutomaticSize=Enum.AutomaticSize.Y dO.Parent=dL
local dP=Instance.new"Frame"dP.Size=UDim2.new(1,0,0,22)
dP.BackgroundTransparency=1 dP.Parent=dO
local dQ,dR=1,true
local dS={}
local dT
local function draw()
if dT then pcall(function()dT:Destroy()end)end
dT=Instance.new"Frame"dT.BackgroundTransparency=1
dT.Position=UDim2.new(0,0,0,26)dT.Size=UDim2.new(1,0,0,#dN*24)
dT.Parent=dO
local dU=Instance.new"UIListLayout"dU.Padding=UDim.new(0,2)dU.Parent=dT
local dV={}
for dW,dX in ipairs(dN)do table.insert(dV,{i=dW,r=dX})end
table.sort(dV,function(dW,dX)
local dY,dZ=tostring(dW.r[dQ]or""),tostring(dX.r[dQ]or"")
if dR then return dY<dZ else return dY>dZ end
end)
for dW,dX in ipairs(dV)do
local dY=Instance.new"TextButton"dY.Text=""
dY.Size=UDim2.new(1,0,0,22)dY.BackgroundColor3=dJ.Surface
dY.BackgroundTransparency=0.4 dY.BorderSizePixel=0 dr(dY,6)dY.Parent=dT
af:_tag(dY,"BackgroundColor3","Surface")
for dZ=1,#dM do
local d_=Instance.new"TextLabel"d_.BackgroundTransparency=1
d_.Position=UDim2.new((dZ-1)/#dM,8,0,0)
d_.Size=UDim2.new(1/#dM,-16,1,0)
d_.Font=Enum.Font.Gotham d_.TextSize=11 d_.TextXAlignment=0
d_.TextTruncate=Enum.TextTruncate.AtEnd
d_.Text=tostring(dX.r[dZ]or"")d_.Parent=dY
af:_tag(d_,"TextColor3",dZ==1 and"Text"or"Dim")
end
dY.MouseButton1Click:Connect(function()
af:_sfx"Click"dq(dA.OnSelect,dX.r,dX.i)
end)
end
end
for dU,dV in ipairs(dM)do
local dW=Instance.new"TextButton"dW.Text=""
dW.Position=UDim2.new((dU-1)/#dM,0,0,0)
dW.Size=UDim2.new(1/#dM,0,1,0)dW.BackgroundTransparency=1 dW.Parent=dP
local dX=Instance.new"TextLabel"dX.BackgroundTransparency=1
dX.Position=UDim2.new(0,8,0,0)dX.Size=UDim2.new(1,-16,1,0)
dX.Font=Enum.Font.GothamBold dX.TextSize=10 dX.TextXAlignment=0
dX.Text=string.upper(tostring(dV))..((dQ==dU)and(dR and" ^"or" v")or"")dX.Parent=dW
af:_tag(dX,"TextColor3","Dim")
local dY=dU
dW.MouseButton1Click:Connect(function()
if dQ==dY then dR=not dR else dQ,dR=dY,true end
draw()
for dZ,d_ in ipairs(dP:GetChildren())do
if d_:IsA"TextButton"then
local d0=d_:FindFirstChildOfClass"TextLabel"
if d0 then d0.Text=string.upper(tostring(dM[dZ]))..((dQ==dZ)and(dR and" ^"or" v")or"")end
end
end
end)
end
function dS.SetRows(dU,dV)dN=dV or{}draw()end
function dS.GetRows(dU)return dN end
draw()
return dG{Title=dA.Title or"Table",Frame=dO,_handle=dS}
end end function a.O():typeof(__modImpl())local aa=a.cache.O if not aa then aa={c=__modImpl()}a.cache.O=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local dq=
ab.T local dr=
ab.tween local dy=
ac.guid local dz=
ac.spawnCb
local dA=ac.corner local dG=
ac.hairline local dJ=
ac.pad local dK=
ac.lighting local dL=
ac.ripple local dM=
ac.spotlight local dN=
ac.attachTip local dO=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dP,dQ)local dR=
dP.row local dS=
dP.titleBlock
local dT=dP.reg local dU=
dP.tab local dV=
dP.Window local dW=
dP.Th local dX=
dP.opts or{}
local dY=dP.page
dQ=dQ or{}
local dZ={}
for d_,d0 in ipairs(dQ.Items or{})do table.insert(dZ,d0)end
local d_=Instance.new"Frame"d_.BackgroundTransparency=1
d_.Size=UDim2.new(1,-4,0,0)d_.AutomaticSize=Enum.AutomaticSize.Y d_.Parent=dY
local d0=Instance.new"UIListLayout"d0.Padding=UDim.new(0,2)d0.Parent=d_
local d1={}
local function draw()
for d2,d3 in ipairs(d_:GetChildren())do
if d3:IsA"Frame"then pcall(function()d3:Destroy()end)end
end
if#dZ==0 then
local d2=Instance.new"TextLabel"d2.BackgroundTransparency=1
d2.Size=UDim2.new(1,0,0,22)d2.Font=Enum.Font.Gotham
d2.TextSize=11 d2.TextXAlignment=0 d2.Text="No activity yet."d2.Parent=d_
af:_tag(d2,"TextColor3","Dim")
return
end
local d2={info="Accent",ok="Success",warn="Warn",err="Danger"}
for d3,d4 in ipairs(dZ)do
local d5=Instance.new"Frame"d5.BackgroundTransparency=1
d5.Size=UDim2.new(1,0,0,30)d5.Parent=d_
local d6=Instance.new"Frame"d6.Position=UDim2.new(0,4,0,8)
d6.Size=UDim2.fromOffset(8,8)d6.BorderSizePixel=0 dA(d6,99)d6.Parent=d5
af:_tag(d6,"BackgroundColor3",d2[d4.Kind or"info"]or"Accent")
local d7=Instance.new"TextLabel"d7.BackgroundTransparency=1
d7.Position=UDim2.new(0,20,0,2)d7.Size=UDim2.new(1,-70,0,16)
d7.Font=Enum.Font.Gotham d7.TextSize=12 d7.TextXAlignment=0
d7.TextTruncate=Enum.TextTruncate.AtEnd d7.Text=tostring(d4.Title or"")d7.Parent=d5
af:_tag(d7,"TextColor3","Text")
local d8=Instance.new"TextLabel"d8.BackgroundTransparency=1
d8.Position=UDim2.new(0,20,0,17)d8.Size=UDim2.new(1,-70,0,12)
d8.Font=Enum.Font.Gotham d8.TextSize=10 d8.TextXAlignment=0
d8.TextTruncate=Enum.TextTruncate.AtEnd
d8.Text=tostring(d4.Sub or"")d8.Parent=d5
af:_tag(d8,"TextColor3","Dim")
local d9=Instance.new"TextLabel"d9.BackgroundTransparency=1
d9.AnchorPoint=Vector2.new(1,0)d9.Position=UDim2.new(1,0,0,6)
d9.Size=UDim2.new(0,60,0,14)d9.Font=Enum.Font.Code
d9.TextSize=10 d9.TextXAlignment=1 d9.Text=tostring(d4.At or"")d9.Parent=d5
af:_tag(d9,"TextColor3","Dim")
end
end
function d1.Add(d2,d3)table.insert(dZ,1,d3 or{})while#dZ>20 do table.remove(dZ)end draw()end
function d1.Clear(d2)dZ={}draw()end
d1.Frame=d_
draw()
return dT{Title=dQ.Title or"Timeline",Frame=d_,_handle=d1}
end end function a.P():typeof(__modImpl())local aa=a.cache.P if not aa then aa={c=__modImpl()}a.cache.P=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local dA=
ab.T local dO=
ab.tween local dP=
ac.guid local dQ=
ac.spawnCb
local dT=ac.corner
local dX=ac.hairline local dY=
ac.pad local dZ=
ac.lighting local d_=
ac.ripple local d0=
ac.spotlight local d1=
ac.attachTip
local d2=ac.attachCtx local d3=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")


aa._favs=aa._favs or{}
aa._favRefresh=aa._favRefresh or{}
local function refreshAll()
for d4,d5 in ipairs(aa._favRefresh)do pcall(d5)end
end
if not aa.Pin then
function aa.Pin(d4,d5,d6)
if not d5 or d5==""then return end
for d7,d8 in ipairs(aa._favs)do
if d8.label==d5 and d8.tab==d4 then return end
end
table.insert(aa._favs,1,{tab=d4,label=d5,go=d6})
while#aa._favs>24 do table.remove(aa._favs)end
refreshAll()
end
function aa.Unpin(d4,d5)
for d6,d7 in ipairs(aa._favs)do
if(not d4 or d7.tab==d4)and(not d5 or d7.label==d5)then
table.remove(aa._favs,d6)
end
end
refreshAll()
end
function aa.IsPinned(d4,d5)
for d6,d7 in ipairs(aa._favs)do
if d7.label==d5 and(not d4 or d7.tab==d4)then return true end
end
return false
end
end

return function(d4,d5)local d6=
d4.row local d7=
d4.titleBlock
local d8=d4.reg local d9=
d4.tab
local ea=d4.Window
local eb=d4.Th local ec=
d4.opts or{}
local ed=d4.page
local ee=d4.pgui
d5=d5 or{}
local ef=d5.Limit or 6
local eg=Instance.new"Frame"eg.BackgroundTransparency=1
eg.Size=UDim2.new(1,-4,0,0)eg.AutomaticSize=Enum.AutomaticSize.Y
eg.Parent=ed
local eh=Instance.new"UIListLayout"eh.Padding=UDim.new(0,4)
eh.SortOrder=Enum.SortOrder.LayoutOrder eh.Parent=eg
local function refresh()
for ei,ej in ipairs(eg:GetChildren())do
if ej:IsA"TextButton"or ej:IsA"TextLabel"then pcall(function()ej:Destroy()end)end
end
if#aa._favs==0 then
local ei=Instance.new"TextLabel"ei.BackgroundTransparency=1
ei.Size=UDim2.new(1,0,0,24)ei.Font=Enum.Font.Gotham
ei.TextSize=11 ei.TextXAlignment=0 ei.Text="Pin controls here with Kronos:Pin()."ei.Parent=eg
af:_tag(ei,"TextColor3","Dim")
return
end
for ei=1,math.min(ef,#aa._favs)do
local ej=aa._favs[ei]
local ek=Instance.new"TextButton"ek.Text=""
ek.Size=UDim2.new(1,0,0,30)ek.BackgroundColor3=eb.Surface
ek.BackgroundTransparency=0.35 ek.BorderSizePixel=0
dT(ek,7)ek.Parent=eg
dX(ek,true)
af:_tag(ek,"BackgroundColor3","Surface")
local el=Instance.new"TextLabel"el.BackgroundTransparency=1
el.Position=UDim2.new(0,8,0,0)el.Size=UDim2.new(0,18,1,0)
el.Font=Enum.Font.GothamBold el.TextSize=12 el.Text="*"el.Parent=ek
af:_tag(el,"TextColor3","Accent")
local em=Instance.new"TextLabel"em.BackgroundTransparency=1
em.Position=UDim2.new(0,26,0,0)em.Size=UDim2.new(1,-106,1,0)
em.Font=Enum.Font.Gotham em.TextSize=12 em.TextXAlignment=0
em.TextTruncate=Enum.TextTruncate.AtEnd em.Text=ej.label em.Parent=ek
af:_tag(em,"TextColor3","Text")
local en=Instance.new"TextLabel"en.BackgroundTransparency=1
en.AnchorPoint=Vector2.new(1,0)en.Position=UDim2.new(1,-10,0,0)
en.Size=UDim2.new(0,74,1,0)en.Font=Enum.Font.Gotham
en.TextSize=10 en.TextXAlignment=1 en.Text=ej.tab en.Parent=ek
af:_tag(en,"TextColor3","Dim")
ek.MouseButton1Click:Connect(function()
if ej.go then af:_sfx"Click"pcall(ej.go)
else ea:Notify{Title="Unavailable",Content=ej.label,Duration=1.5}end
end)
d2(ee,ek,{{Title="Unpin",Callback=function()
aa.Unpin(ej.tab,ej.label)
end}})
end
end
table.insert(aa._favRefresh,refresh)
refresh()
return d8{Title=d5.Title or"Favorites",Frame=eg,_handle={Refresh=refresh}}
end end function a.Q():typeof(__modImpl())local aa=a.cache.Q if not aa then aa={c=__modImpl()}a.cache.Q=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local dT=
ab.T local dX=
ab.tween local d2=
ac.guid
local d3=ac.spawnCb
local d4=ac.corner
local d5=ac.hairline local d8=
ac.pad local ea=
ac.lighting local eb=
ac.ripple
local ec=ac.spotlight
local ed=ac.attachTip
local ee=ac.attachCtx local ef=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local eg=ae.cloneref_check(game:GetService"Players")

return function(eh,ei)
local ej=eh.row local ek=
eh.titleBlock
local el=eh.reg local em=
eh.tab local en=
eh.Window
local eo=eh.Th local ep=
eh.opts or{}local eq=
eh.page
local er=eh.pgui
ei=ei or{}
local es=math.clamp(ei.Height or 230,140,320)
local et=ej(es)
ec(et,0.06)
if ei.Tooltip then ed(et,ei.Tooltip)end
if ei.ContextMenu then ee(er,et,ei.ContextMenu)end
local eu=Instance.new"TextLabel"eu.BackgroundTransparency=1
eu.Position=UDim2.new(0,12,0,6)eu.Size=UDim2.new(1,-60,0,16)
eu.Font=Enum.Font.GothamMedium eu.TextSize=12 eu.TextXAlignment=0
eu.TextTruncate=Enum.TextTruncate.AtEnd
eu.Text=ei.Title or"Preview"eu.Parent=et
af:_tag(eu,"TextColor3","Text")
local ev=Instance.new"Frame"ev.AnchorPoint=Vector2.new(1,0)
ev.Position=UDim2.new(1,-12,0,10)ev.Size=UDim2.fromOffset(8,8)
ev.BorderSizePixel=0 d4(ev,99)ev.Parent=et
af:_tag(ev,"BackgroundColor3","Success")
local ew=Instance.new"ViewportFrame"ew.BackgroundColor3=eo.Bg
ew.BorderSizePixel=0 ew.Position=UDim2.new(0,10,0,28)
ew.Size=UDim2.new(1,-20,1,-36)d4(ew,8)ew.Parent=et
af:_tag(ew,"BackgroundColor3","Bg")
d5(ew,true)
pcall(function()
ew.LightColor=Color3.fromRGB(235,235,240)
ew.LightDirection=Vector3.new(-0.4,-1,-0.7)
end)
local ex=Instance.new"WorldModel"ex.Parent=ew
local ey=Instance.new"Camera"ey.Parent=ew
ey.CFrame=CFrame.lookAt(Vector3.new(0,4,10),Vector3.new(0,2,0))
ew.CurrentCamera=ey
local ez=Instance.new"Part"ez.Name="_lamp"
ez.Size=Vector3.new(1,1,1)ez.Transparency=1 ez.Anchored=true
ez.CanCollide=false ez.CanQuery=false ez.CanTouch=false
ez.Position=Vector3.new(4,6,6)ez.Parent=ex
local eA=Instance.new"PointLight"eA.Brightness=1.6 eA.Range=40
eA.Color=Color3.fromRGB(255,244,230)eA.Parent=ez
local eB=Instance.new"Part"eB.Name="_lamp2"
eB.Size=Vector3.new(1,1,1)eB.Transparency=1 eB.Anchored=true
eB.CanCollide=false eB.CanQuery=false eB.CanTouch=false
eB.Position=Vector3.new(-5,3,-6)eB.Parent=ex
local eC=Instance.new"PointLight"eC.Brightness=1 eC.Range=40
eC.Color=Color3.fromRGB(140,170,255)eC.Parent=eB
local eD=Instance.new"TextLabel"eD.BackgroundTransparency=1
eD.Size=UDim2.fromScale(1,1)eD.Font=Enum.Font.Gotham
eD.TextSize=12 eD.Text="Summoning avatar..."eD.Parent=ew
af:_tag(eD,"TextColor3","Dim")
local eE
pcall(function()eE=eg.LocalPlayer end)
local eF=ei.Character or ei.Preset or(ei.UserId and"Player")or"Noob"
local eG=tonumber(ei.UserId)or(eE and eE.UserId)or 1
if tonumber(eF)then eG,eF=tonumber(eF),"Player"end
local eH
pcall(function()
eH=(ei.Rig=="R6")and Enum.HumanoidRigType.R6 or Enum.HumanoidRigType.R15
end)
local eI=ei.Zoom or 7.5
local eJ=ei.Spin~=false
local eK,eL,eM=0.6,Vector3.new(0,2,0),1.2
local eN={rig=nil,humanoid=nil,desc=nil,tracks={}}
local eO={}
local function aimAt(eP)
eL=eP+Vector3.new(0,1,0)
eM=1.4
ey.CFrame=CFrame.new(eL+Vector3.new(2.4,eM,eI),eL)
eK=math.atan2(2.4,eI)
end
local function applyDesc(eP)
if not eP then return false end
local eQ=eN.humanoid
if not eQ or not eQ.Parent then return false end
local eR=pcall(function()eQ:ApplyDescription(eP)end)
if eR then eN.desc=eP end
return eR
end
local function noobDescription()
local eP=Instance.new"HumanoidDescription"
pcall(function()
eP.HeadColor=Color3.fromRGB(245,205,30)
eP.TorsoColor=Color3.fromRGB(13,105,172)
eP.LeftArmColor=Color3.fromRGB(245,205,30)
eP.RightArmColor=Color3.fromRGB(245,205,30)
eP.LeftLegColor=Color3.fromRGB(164,189,71)
eP.RightLegColor=Color3.fromRGB(164,189,71)
eP.Face=48474313
eP.Head,eP.Torso=0,0
eP.LeftArm,eP.RightArm=0,0
eP.LeftLeg,eP.RightLeg=0,0
eP.Shirt,eP.Pants,eP.GraphicTShirt=0,0,0
end)
return eP
end
local function loadModel()
local eP,eQ
if eF=="Noob"then
eP=noobDescription()
local eR
pcall(function()eR=Enum.HumanoidRigType.R6 end)
local eS,eT=pcall(function()
if eR then
return eg:CreateHumanoidModelFromDescription(eP,eR)
end
return eg:CreateHumanoidModelFromDescription(eP)
end)
if not eS then
eS,eT=pcall(function()
return eg:CreateHumanoidModelFromDescription(eP)
end)
end
if eS and eT then eQ=eT end
else
local eR,eS=pcall(function()
return eg:GetHumanoidDescriptionFromUserIdAsync(eG)
end)
if eR and eS then
local eT,eU=pcall(function()
if eH then
return eg:CreateHumanoidModelFromDescription(eS,eH)
end
return eg:CreateHumanoidModelFromDescription(eS)
end)
if not eT then
eT,eU=pcall(function()
return eg:CreateHumanoidModelFromDescription(eS)
end)
end
if eT and eU then eQ,eP=eU,eS end
end
if not eQ and eE then
local eT=eE.Character
if eT then
local eU,eV=pcall(function()return eT:Clone()end)
if eU and eV then
for eW,eX in ipairs(eV:GetDescendants())do
pcall(function()
if eX:IsA"Script"or eX:IsA"LocalScript"or eX:IsA"ModuleScript"then
eX:Destroy()
elseif eX:IsA"BasePart"then
eX.Anchored=true eX.CanCollide=false
eX.CanQuery=false eX.CanTouch=false
end
end)
end
eQ=eV
if not eP then
pcall(function()eP=eg:GetHumanoidDescriptionFromUserIdAsync(eG)end)
end
end
end
end
end
if not eQ then
pcall(function()eD.Text="Avatar failed to build."end)
pcall(function()ev.BackgroundColor3=eo.Danger end)
return
end
for eR,eS in ipairs(eQ:GetDescendants())do
pcall(function()
if eS:IsA"BasePart"then
eS.Anchored=true eS.CanCollide=false
eS.CanQuery=false eS.CanTouch=false
end
end)
end
eQ.Parent=ex
eN.rig=eQ
eN.humanoid=eQ:FindFirstChildOfClass"Humanoid"
if eP then eN.desc=eP end
local eR=eL
pcall(function()
local eS=eQ:FindFirstChild"HumanoidRootPart"
if eS then eR=eS.Position end
end)
aimAt(eR)
pcall(function()eD:Destroy()end)
end
local eP={"Head","Torso","LeftArm","RightArm","LeftLeg","RightLeg"}
function eO.SetColors(eQ,eR)
if type(eR)~="table"then return end
local eS=eN.desc
if not eS then return end
if eR.All then
for eT,eU in ipairs(eP)do
pcall(function()eS[eU.."Color"]=eR.All end)
end
else
for eT,eU in ipairs(eP)do
if eR[eU]then pcall(function()eS[eU.."Color"]=eR[eU]end)end
end
end
applyDesc(eS)
if ei.Flag then af.Flags[ei.Flag]=eR end
d3(ei.Callback,eR)d3(ei.OnChanged,eR)
end
function eO.SetOutfit(eQ,eR)
if type(eR)~="table"then return end
local eS=eN.desc
if not eS then return end
for eT,eU in pairs(eR)do pcall(function()eS[eT]=eU end)end
applyDesc(eS)
end
function eO.ApplyDescription(eQ,eR)applyDesc(eR)end
function eO.GetDescription(eQ)return eN.desc end
function eO.SetZoom(eQ,eR)
eI=math.clamp(tonumber(eR)or eI,3,20)
pcall(function()
ey.CFrame=CFrame.new(eL+Vector3.new(math.sin(eK)*eI,eM,math.cos(eK)*eI),eL)
end)
end
function eO.SetSpin(eQ,eR)eJ=eR and true or false end
function eO.SetSource(eQ,eR)
if eR=="Player"or eR=="Noob"then eF=eR eO:Refresh()end
end
function eO.PlayAnimation(eQ,eR)
if not eR then return end
task.spawn(function()
pcall(function()
for eS,eT in ipairs(eN.tracks)do pcall(function()eT:Stop()eT:Destroy()end)end
eN.tracks={}
local eS=eN.humanoid
local eT=eN.rig
if not eS or not eS.Parent or not eT then return end
eT.Parent=workspace
local eU=eS:FindFirstChildOfClass"Animator"
if not eU then
eU=Instance.new"Animator"eU.Parent=eS
end
local eV=Instance.new"Animation"
eV.AnimationId="rbxassetid://"..tostring(eR)
local eW=eU:LoadAnimation(eV)
table.insert(eN.tracks,eW)
eT.Parent=ex
eW:Play()
end)
end)
end
function eO.StopAnimations(eQ)
pcall(function()
for eR,eS in ipairs(eN.tracks)do pcall(function()eS:Stop()eS:Destroy()end)end
eN.tracks={}
end)
end
function eO.Refresh(eQ)
pcall(function()
if eN.rig then eN.rig:Destroy()end
eN.rig,eN.humanoid,eN.tracks=nil,nil,{}
end)
task.spawn(loadModel)
end
task.spawn(loadModel)
task.spawn(function()
while ew.Parent do
task.wait(0.03)
pcall(function()
if eJ and eN.rig and eN.rig.Parent and ey then
eK=eK+0.03*(ei.SpinSpeed or 0.6)
ey.CFrame=CFrame.new(
eL+Vector3.new(math.sin(eK)*eI,eM,math.cos(eK)*eI),eL)
end
end)
end
end)
local eQ={Title=ei.Title,Frame=et,Flag=ei.Flag,_handle=eO,
_set=function(eQ,eR)
if type(eQ)=="table"then eO:SetColors(eQ)end
end}
return el(eQ)
end end function a.R():typeof(__modImpl())local aa=a.cache.R if not aa then aa={c=__modImpl()}a.cache.R=aa end return aa.c end end do local function __modImpl()




local aa={
Section=a.l(),
Label=a.m(),
Paragraph=a.m(),
Divider=a.n(),
Progress=a.o(),
Log=a.p(),
Button=a.q(),
Toggle=a.r(),
Slider=a.s(),
Input=a.t(),
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
Segment=a.H(),
Radio=a.I(),
RangeSlider=a.J(),
Sparkline=a.K(),
Markdown=a.L(),
Code=a.M(),
Stepper=a.N(),
Table=a.O(),
Timeline=a.P(),
Favorites=a.Q(),
Avatar=a.R(),
}

local function attach(ab,ac)
for ad,ae in pairs(aa)do
ab[ad]=function(af,d3)
return ae(ac,d3)
end
end
end

return{attach=attach,map=aa}end function a.S():typeof(__modImpl())local aa=a.cache.S if not aa then aa={c=__modImpl()}a.cache.S=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.i()
local af=a.g()


local d3=ab.T
local d4=ab.tween local d5=
ac.spawnCb
local ec=ac.corner
local ed=ac.hairline
local ee=ac.pad
local ef=ac.lighting
local eg=ad.makeIcon
local eh=a.S()

return function(ei,ej)
local el=ei.Window
local eo=ei.opts or{}
local eq=ei.Th
local er=ei.pgui
local es=ei.pages
local et=ei.nav
local eu=ei.pill
local ev=ei.subLbl
ej=ej or{}
local ew=ej.Title or("Tab "..(#el._tabs+1))
local ex=ej.Icon or ew

local ey=Instance.new"TextButton"
ey.Text=""
ey.Size=UDim2.new(1,0,0,34)
ey.BackgroundColor3=eq.Surface2
ey.BackgroundTransparency=1
ey.BorderSizePixel=0
ec(ey,8)
ey.LayoutOrder=#el._tabs+10
ey.AutoButtonColor=false
ey.Parent=et
ey.ZIndex=2
ey.Visible=true
local ez=#el._tabs+1
local eA=eg(ex,15,eq.Dim)
eA.AnchorPoint=Vector2.new(0,0.5)
eA.Position=UDim2.new(0,14,0.5,0)
eA.Parent=ey
eA.Visible=true
eA.ZIndex=3
if eA:IsA"TextLabel"then eA.Size=UDim2.new(0,15,0,15)end
local eB=Instance.new"TextLabel"
eB.BackgroundTransparency=1
eB.Position=UDim2.new(0,37,0,0)
eB.Size=UDim2.new(1,-49,1,0)
eB.Font=Enum.Font.GothamMedium
eB.TextSize=13
eB.TextXAlignment=0
eB.TextTruncate=Enum.TextTruncate.AtEnd
eB.Text=ew
eB.Parent=ey
eB.Visible=true
eB.TextTransparency=0
eB.ZIndex=3
ae.tag(eB,"TextColor3","Dim")
ey.MouseEnter:Connect(function()
if el._active and el._active.Btn==ey then return end
d4(ey,d3.Hover,{BackgroundTransparency=0.55})
ae.tag(eB,"TextColor3","Text")
end)
ey.MouseLeave:Connect(function()
if el._active and el._active.Btn==ey then return end
d4(ey,d3.Hover,{BackgroundTransparency=1})
ae.tag(eB,"TextColor3","Dim")
end)

local eC=Instance.new"ScrollingFrame"
eC.Visible=false
eC.Size=UDim2.fromScale(1,1)
eC.BackgroundTransparency=1
eC.BorderSizePixel=0
eC.ScrollBarThickness=3
eC.ScrollBarImageColor3=eq.Surface2
eC.CanvasSize=UDim2.new(0,0,0,0)
eC.AutomaticCanvasSize=Enum.AutomaticSize.Y
eC.Parent=es
ae.tag(eC,"ScrollBarImageColor3","Surface2")
local eD=Instance.new"UIListLayout"
eD.Padding=UDim.new(0,8)
eD.SortOrder=Enum.SortOrder.LayoutOrder
eD.Parent=eC
ee(eC,2,8,2,6)

local eE={Title=ew,Btn=ey,Page=eC,Elements={},_label=eB,_icon=eA}
eE._pl=eD

local eF=eo.SubTitle or eo.Subtitle or"scripthub"

local function setActive(eG)
el._active=eE
pcall(function()
ev.Text=string.upper(eF).."  /  "..string.upper(ew)
end)
for eH,eI in ipairs(el._tabs)do
local eJ=eI==eE
eI.Page.Visible=eJ
local eK=eI._label
eK.TextTransparency=0
d4(eI.Btn,d3.Hover,{BackgroundTransparency=1})
if eJ then
ae.tag(eK,"TextColor3","Text")
if eI._icon and eI._icon:IsA"ImageLabel"then
eI._icon.ImageTransparency=0
d4(eI._icon,d3.Hover,{ImageColor3=aa.Theme.Accent})
end
else
ae.tag(eK,"TextColor3","Dim")
if eI._icon and eI._icon:IsA"ImageLabel"then
eI._icon.ImageTransparency=0
d4(eI._icon,d3.Hover,{ImageColor3=aa.Theme.Dim})
end
end
end
d4(eu,d3.Med,{Position=UDim2.new(0,0,0,(ez-1)*38-2)})
if eG then
eC.Position=UDim2.new(0,14,0,0)
d4(eC,d3.Med,{Position=UDim2.new(0,0,0,0)})
local eH=0
for eI,eJ in ipairs(eC:GetChildren())do
if eJ:IsA"Frame"or eJ:IsA"CanvasGroup"then
eH+=1
local eK=math.min(eH*0.02,0.3)
task.delay(eK,function()
if not eJ.Parent then return end
local eL=Instance.new"Frame"
eL.Name="_cascade"
eL.Size=UDim2.fromScale(1,1)
eL.BackgroundColor3=eq.Surface2
eL.BackgroundTransparency=0.55
eL.BorderSizePixel=0
ec(eL,10)
eL.Parent=eJ
d4(eL,d3.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()eL:Destroy()end)end)
end)
end
end
end
end
ey.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

table.insert(el._tabs,eE)
if#el._tabs==1 then
setActive(false)
eu.Position=UDim2.new(0,0,0,-2)
eu.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
eB.TextTransparency=0
if eA:IsA"ImageLabel"then eA.ImageTransparency=0 end
end)
end)

local function row(eG)
local eH=Instance.new"Frame"
eH.Size=UDim2.new(1,-4,0,eG)
eH.BackgroundColor3=eq.Surface
eH.BorderSizePixel=0
local eI=math.clamp((eo.Radius or 12)-2,4,12)
ec(eH,eI)
ef(eH,eI)
eH.Parent=eC
ed(eH,true)
ae.tag(eH,"BackgroundColor3","Surface")
local eJ=eH:FindFirstChild"_light"
if eJ then eJ.Visible=false end
eH.BackgroundTransparency=1
task.delay(#eE.Elements*0.025,function()
d4(eH,d3.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if eJ and eJ.Parent then eJ.Visible=true end end)
end)
return eH
end
local function titleBlock(eG,eH,eI,eJ,eK)
eJ=eJ or 112
local eL=Instance.new"TextLabel"
eL.BackgroundTransparency=1
if eI then
eL.Position=UDim2.new(0,14,0,9)
eL.Size=UDim2.new(1,-eJ,0,17)
elseif eK then
eL.Position=UDim2.new(0,14,0,8)
eL.Size=UDim2.new(1,-eJ,0,17)
else
eL.Position=UDim2.new(0,14,0,0)
eL.Size=UDim2.new(1,-eJ,1,0)
end
eL.Font=Enum.Font.GothamMedium
eL.TextSize=13
eL.TextXAlignment=0
eL.TextTruncate=Enum.TextTruncate.AtEnd
eL.Text=eH
eL.Parent=eG
ae.tag(eL,"TextColor3","Text")
if eI then
local eM=Instance.new"TextLabel"
eM.BackgroundTransparency=1
eM.Position=UDim2.new(0,14,0,30)
eM.Size=UDim2.new(1,-eJ,0,14)
eM.Font=Enum.Font.Gotham
eM.TextSize=11
eM.TextXAlignment=0
eM.TextTruncate=Enum.TextTruncate.AtEnd
eM.Text=eI
eM.Parent=eG
ae.tag(eM,"TextColor3","Dim")
end
end
local function reg(eG)
table.insert(eE.Elements,eG)
eG._tab=eE
if not eG._go then
eG._go=function()
if el._activateTab then el._activateTab(eE,true)end
el:_flash(eG.Frame)
end
end
if eG.Flag and eG._set then
aa._live[eG.Flag]=aa._live[eG.Flag]or{}
table.insert(aa._live[eG.Flag],eG._set)
if aa.Flags["_loaded_"..eG.Flag]~=nil then
local eH=aa.Flags["_loaded_"..eG.Flag]
aa.Flags["_loaded_"..eG.Flag]=nil
task.defer(function()pcall(eG._set,eH,true)end)
elseif eG.Value~=nil and aa.Flags[eG.Flag]==nil then
aa.Flags[eG.Flag]=eG.Value
end
elseif eG.Flag and eG.Value~=nil and aa.Flags[eG.Flag]==nil then
aa.Flags[eG.Flag]=eG.Value
end
return eG._handle
end

local eG={}
local eH={row=row,titleBlock=titleBlock,reg=reg,tab=eE,Window=el,Th=eq,opts=eo,page=eC,pgui=er}
eh.attach(eG,eH)

eE.Api=eG
eE._window=el
eE._activate=function(eI)setActive(eI~=false)end
for eI,eJ in pairs(eG)do eE[eI]=function(eK,...)return eJ(eE,...)end end
return eE
end end function a.T():typeof(__modImpl())local aa=a.cache.T if not aa then aa={c=__modImpl()}a.cache.T=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.i()
local ae=a.b()

local af=ab.T
local d3=ab.tween
local d4=ac.spawnCb
local d5=ac.corner
local ec=ac.hairline
local ed=ac.lighting
local ee=ac.shadow
local ef=ae.cloneref_check(game:GetService"RunService")
local eg=ae.cloneref_check(game:GetService"Players")

local eh={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(ei,ej)
local el=ei.Window
local eo=ei.Th
local eq=ei.main
local er=ei.gui

ej=ej or{}
local es,et=ej.Width or 175,ej.Height or 370
local eu=ej.Accent or eo.Accent
if type(eu)=="table"then
eu=Color3.new(eu[1]or 0,eu[2]or 0,eu[3]or 0)
end
local ev=tostring(ej.Mode or"Chams")
if not eh[ev]then ev="Chams"end
local ew,ex,ey,ez=true,true,false,100
local eA
pcall(function()eA=eg.LocalPlayer end)
local eB=ej.Name or((eA and eA.DisplayName)or"Noob")
local eC=(eA and("@"..eA.Name))or""
local eD=Instance.new"Frame"
eD.Name=ae.GetStealthName()
eD.AnchorPoint=Vector2.new(0,0.5)
eD.Size=UDim2.fromOffset(es,et)
eD.BackgroundColor3=eo.Surface eD.BorderSizePixel=0
d5(eD,12)eD.Parent=er eD.Visible=false
ec(eD,true)ed(eD,12)ee(eD,0.5,40)
ad.tag(eD,"BackgroundColor3","Surface")
local eE=Instance.new"UIScale"eE.Scale=0.92 eE.Parent=eD
local function dock()
if not eq or not eq.Parent then return end
local eF=eq.Size.X.Offset
eD.Position=UDim2.new(eq.Position.X.Scale,
eq.Position.X.Offset+eF/2+12,
eq.Position.Y.Scale,eq.Position.Y.Offset)
end
el:Track(eq:GetPropertyChangedSignal"Position":Connect(dock))
el:Track(eq:GetPropertyChangedSignal"Size":Connect(dock))
local eF=Instance.new"TextLabel"eF.BackgroundTransparency=1
eF.Position=UDim2.new(0,14,0,0)eF.Size=UDim2.new(1,-48,0,34)
eF.Font=Enum.Font.GothamBold eF.TextSize=14 eF.TextXAlignment=0
eF.TextTruncate=Enum.TextTruncate.AtEnd eF.Text=ej.Title or"Preview"eF.Parent=eD
ad.tag(eF,"TextColor3","Text")
local eG={open=false}
local function setOpen(eH,eI)
eH=eH and true or false
if eH==eG.open and eD.Visible==eH then return end
eG.open=eH
if eH then
dock()
eD.Visible=true
local eJ=eD.Position.X.Offset
eD.Position=UDim2.new(eD.Position.X.Scale,eJ-24,
eD.Position.Y.Scale,eD.Position.Y.Offset)
d3(eD,af.Med,{Position=UDim2.new(eD.Position.X.Scale,eJ,
eD.Position.Y.Scale,eD.Position.Y.Offset)})
d3(eE,af.Spring,{Scale=1})
else
d3(eD,af.Fast,{Position=UDim2.new(eD.Position.X.Scale,
eD.Position.X.Offset-16,eD.Position.Y.Scale,eD.Position.Y.Offset)})
task.delay(0.18,function()
if not eG.open then eD.Visible=false end
end)
if eI then d4(ej.OnClose)end
end
end
local eH=Instance.new"TextButton"eH.Text=""
eH.AnchorPoint=Vector2.new(1,0)eH.Position=UDim2.new(1,-10,0,8)
eH.Size=UDim2.fromOffset(14,14)eH.BackgroundColor3=Color3.fromRGB(255,95,86)
eH.BorderSizePixel=0 eH.AutoButtonColor=false eH.Parent=eD
d5(eH,99)
eH.MouseEnter:Connect(function()
d3(eH,af.Hover,{BackgroundColor3=Color3.fromRGB(215,70,62)})
end)
eH.MouseLeave:Connect(function()
d3(eH,af.Hover,{BackgroundColor3=Color3.fromRGB(255,95,86)})
end)
eH.MouseButton1Click:Connect(function()setOpen(false,true)end)

local eI=Instance.new"ViewportFrame"
eI.Position=UDim2.new(0,10,0,36)eI.Size=UDim2.new(1,-20,1,-48)
eI.BackgroundColor3=eo.Bg eI.BorderSizePixel=0
eI.LightColor=Color3.fromRGB(255,255,255)
eI.LightDirection=Vector3.new(-0.5,-1,-0.6)
eI.Ambient=Color3.fromRGB(150,150,168)
d5(eI,8)eI.Parent=eD
ad.tag(eI,"BackgroundColor3","Bg")
local eJ=Instance.new"Frame"eJ.BackgroundTransparency=1
eJ.Size=UDim2.fromScale(1,1)eJ.Parent=eI
local eK={}
local function bracket(eL,eM)
local eN=Instance.new"Frame"eN.BorderSizePixel=0
eN.AnchorPoint=Vector2.new(eL,eM)eN.Position=UDim2.new(eL,0,eM,0)
eN.Size=UDim2.new(0,14,0,2)eN.Parent=eJ
ad.tag(eN,"BackgroundColor3","Accent")
local eO=Instance.new"Frame"eO.BorderSizePixel=0
eO.AnchorPoint=Vector2.new(eL,eM)eO.Position=UDim2.new(eL,0,eM,0)
eO.Size=UDim2.new(0,2,0,14)eO.Parent=eJ
ad.tag(eO,"BackgroundColor3","Accent")
table.insert(eK,eN)table.insert(eK,eO)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local eL=Instance.new"TextLabel"eL.BackgroundTransparency=1
eL.AnchorPoint=Vector2.new(0.5,0)eL.Position=UDim2.new(0.5,0,0,4)
eL.Size=UDim2.new(1,-16,0,15)eL.Font=Enum.Font.GothamBold
eL.TextSize=11 eL.Text=eB eL.Parent=eJ
ad.tag(eL,"TextColor3","Text")
local eM=Instance.new"TextLabel"eM.BackgroundTransparency=1
eM.AnchorPoint=Vector2.new(0.5,0)eM.Position=UDim2.new(0.5,0,0,19)
eM.Size=UDim2.new(1,-16,0,12)eM.Font=Enum.Font.Gotham
eM.TextSize=10 eM.Text=eC eM.Parent=eJ
ad.tag(eM,"TextColor3","Dim")
local eN=Instance.new"Frame"eN.BorderSizePixel=0
eN.AnchorPoint=Vector2.new(0,0.5)eN.Position=UDim2.new(0,6,0.5,0)
eN.Size=UDim2.new(0,4,1,-40)eN.BackgroundColor3=eo.Surface2
d5(eN,99)eN.Parent=eJ
ad.tag(eN,"BackgroundColor3","Surface2")
local eO=Instance.new"Frame"eO.BorderSizePixel=0
eO.AnchorPoint=Vector2.new(0,1)eO.Position=UDim2.new(0,0,1,0)
eO.Size=UDim2.new(1,0,1,0)eO.BackgroundColor3=eo.Success
d5(eO,99)eO.Parent=eN
ad.tag(eO,"BackgroundColor3","Success")

local eP=Instance.new"WorldModel"eP.Parent=eI
local eQ=Instance.new"Camera"eQ.Parent=eI
eI.CurrentCamera=eQ
eQ.CFrame=CFrame.new(Vector3.new(0,3.0,9),Vector3.new(0,2.4,0))
local eR,eS,eT={},{},{}
local function part(eU,eV,eW)
local eX=Instance.new"Part"eX.Name=eU
eX.Size=eV eX.Position=eW eX.Anchored=true eX.CanCollide=false
eX.TopSurface=Enum.SurfaceType.Smooth
eX.BottomSurface=Enum.SurfaceType.Smooth
eX.Color=Color3.fromRGB(200,200,215)
eX.Material=Enum.Material.Plastic
eX.Parent=eP
table.insert(eR,eX)
if eU=="Left Arm"or eU=="Right Arm"then eS[eU]=eX end
local eY=Instance.new"SelectionBox"
eY.Adornee=eX eY.LineThickness=0.05
eY.Color3=Color3.fromRGB(255,255,255)
eY.SurfaceTransparency=1 eY.Visible=false
eY.Parent=eX
eT[eX]=eY
return eX
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local eU={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local function paint()
for eV,eW in ipairs(eR)do
if eW and eW.Parent then
if ev=="Noob"then
eW.Color=eU[eW.Name]or Color3.fromRGB(200,200,215)
eW.Material=Enum.Material.Plastic
eW.Transparency=0
elseif ev=="Ghost"then
eW.Color=eu
eW.Material=Enum.Material.ForceField
eW.Transparency=0
elseif ev=="Solid"or ev=="Box"then
eW.Color=Color3.fromRGB(200,200,215)
eW.Material=Enum.Material.Plastic
eW.Transparency=0
else
eW.Color=eu
eW.Material=Enum.Material.Plastic
eW.Transparency=0
end
local eX=eT[eW]
if eX then
eX.Visible=ey or ev=="Outline"
eX.Color3=eu
end
end
end
for eV,eW in ipairs(eK)do
if eW then eW.Visible=ew or ev=="Box"end
end
eL.Visible=ex or ev=="Name"
eM.Visible=eL.Visible
eN.Visible=ew or ev=="HP bar"
end
paint()

local eV=0
local eW={}
for eX,eY in ipairs(eR)do eW[eY]=eY.Position end
local eX={
["Left Arm"]=Vector3.new(-1,3.9,0),
["Right Arm"]=Vector3.new(1,3.9,0),
}
local eY
eY=ef.RenderStepped:Connect(function(eZ)
if not eI.Parent then pcall(function()eY:Disconnect()end)return end
if not eG.open then return end
eV+=eZ
local e_=math.sin(eV*2.2)*0.045
local e0=math.sin(eV*2.2)*0.09
for e1,e2 in ipairs(eR)do
if e2 and e2.Parent and eW[e2]then
local e3=eX[e2.Name]
if e3 then
local e4=e2.Name=="Left Arm"and 1 or-1
e2.CFrame=CFrame.new(e3)
*CFrame.Angles(e0*e4,0,0.05*e4)
*CFrame.new(eW[e2]-e3+Vector3.new(0,e_,0))
else
e2.Position=eW[e2]+Vector3.new(0,e_,0)
end
end
end
end)
el:Track(eY)
function eG.Show(eZ)setOpen(true)end
function eG.Hide(eZ,e_)setOpen(false,not e_)end
function eG.Toggle(eZ)setOpen(not eG.open,not eG.open)end
function eG.SetVisible(eZ,e_)
if e_ then eZ:Show()else eZ:Hide(true)end
end
function eG.IsOpen(eZ)return eG.open end
function eG.SetAccent(eZ,e_)
if type(e_)=="table"then
e_=Color3.new(e_[1]or 0,e_[2]or 0,e_[3]or 0)
end
if typeof(e_)=="Color3"then eu=e_ paint()end
end
function eG.SetMode(eZ,e_)ev=tostring(e_)if not eh[ev]then ev="Chams"end paint()end
function eG.SetBox(eZ,e_)
ew=e_ and true or false paint()
end
function eG.SetOutline(eZ,e_)
ey=e_ and true or false paint()
end
function eG.SetName(eZ,e_)
ex=e_ and true or false paint()
end
function eG.SetNameText(eZ,e_)
local e0=tostring(e_ or"")
local e1=string.find(e0,"@")
if e1 then
eL.Text=string.sub(e0,1,e1-1)
eM.Text="@"..string.gsub(string.sub(e0,e1+1),"^@","")
else
eL.Text=e0
end
eB=eL.Text
end
function eG.SetHealth(eZ,e_)
ez=math.clamp(tonumber(e_)or 100,0,100)
d3(eO,af.Fast,{Size=UDim2.new(1,0,ez/100,0)})
end

aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(eZ,e_)
local e0=eZ
if type(e0)=="table"then
e0=Color3.new(e0[1]or 0,e0[2]or 0,e0[3]or 0)
end
if typeof(e0)=="Color3"then eu=e0 paint()end
end)
if aa.Flags.ESPColor~=nil then
local eZ=aa.Flags.ESPColor
if type(eZ)=="table"then
eZ=Color3.new(eZ[1]or 0,eZ[2]or 0,eZ[3]or 0)
end
if typeof(eZ)=="Color3"then eu=eZ paint()end
end
return eG
end end function a.U():typeof(__modImpl())local aa=a.cache.U if not aa then aa={c=__modImpl()}a.cache.U=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.b()
local ae=a.f()a.i()a.g()


local af=a.h()
local d3=a.k()
local d4=a.T()
local d5=a.U()
local ec=a.d()

local ed=aa
local ee=ab.T
local ef=ab.tween
local eg=ac.spawnCb
local eh=ac.corner
local ei=ac.hairline
local ej=ac.pad
local el=ac.lighting
local eo=ac.topLight
local eq=ac.shadow
local er=ac.makeDraggable
local es=ae.makeIcon
local et=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(eu)
local ev=eu:FindFirstChild"Notification"
if ev then return ev end
ev=Instance.new"Frame"
ev.Name="Notification"
ev.AnchorPoint=Vector2.new(1,1)
ev.Position=UDim2.new(1,-18,1,-18)
ev.Size=UDim2.new(0,300,1,-36)
ev.BackgroundTransparency=1
ev.Parent=eu
local ew=Instance.new"UIListLayout"
ew.VerticalAlignment=Enum.VerticalAlignment.Bottom
ew.Padding=UDim.new(0,10)
ew.SortOrder=Enum.SortOrder.LayoutOrder
ew.Parent=ev
return ev
end

local function bumpRecent(eu,ev,ew)
if not ev or ev==""then return end
for ex,ey in ipairs(aa._recent)do
if ey.label==ev and ey.tab==eu then table.remove(aa._recent,ex)break end
end
table.insert(aa._recent,1,{tab=eu,label=ev,go=ew})
while#aa._recent>8 do table.remove(aa._recent)end
for ex,ey in ipairs(aa._recentRefresh)do pcall(ey)end
end
aa._bumpRecent=function(eu,ev,ew,ex)
return bumpRecent(ev,ew,ex)
end







local eu={}
local function flyTo(ev,ew,ex,ey)
local ez=eu[ev]
if ez then pcall(function()ez:Cancel()end)end
eu[ev]=nil
local eA=ef(ev,ex or ee.Med,ew)
if not eA then
pcall(function()
for eB,eC in pairs(ew)do ev[eB]=eC end
end)
if ey then ey()end
return nil
end
eu[ev]=eA
if ey then
eA.Completed:Connect(function(eB)
if eu[ev]==eA then
eu[ev]=nil
if eB==Enum.PlaybackState.Completed then ey()end
end
end)
end
return eA
end

return function(ev,ew)
ew=ew or{}
local ex=ew.Title or"Kronos"
local ey=ew.SubTitle or ew.Subtitle or"scripthub"
local ez=ew.ToggleKey or Enum.KeyCode.RightControl
local eA=ew.Acrylic
if eA==nil then eA=true end
if ew.Theme then ev:SetTheme(ew.Theme)end
local eB=ev.Theme
ev:SetAcrylic(eA,ew.Blur or 16)

local eC=ad.GetRoot()
if ev._gui then pcall(function()ev._gui:Destroy()end)end

local eD=Instance.new"ScreenGui"
eD.Name=ad.GetStealthName()eD.ResetOnSpawn=false eD.IgnoreGuiInset=true eD.DisplayOrder=999
eD.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(eD)
eD.Parent=eC
ev._gui=eD



local eE=Instance.new"ScreenGui"
eE.Name=ad.GetStealthName()eE.ResetOnSpawn=false eE.IgnoreGuiInset=true eE.DisplayOrder=1000
eE.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(eE)
eE.Parent=eC

local eF=Instance.new"Frame"
eF.Name="Dim"eF.Size=UDim2.fromScale(1,1)
eF.BackgroundColor3=Color3.fromRGB(3,4,7)eF.BackgroundTransparency=1
eF.BorderSizePixel=0 eF.Parent=eD


local eG=ew.Background~=false
eF.Visible=eG
local function dimTo(eH,eI)
if not eG then
if eH>=1 then eF.Visible=false end
return
end
eF.Visible=true
ef(eF,eI,{BackgroundTransparency=eH})
end
dimTo(0.5,ee.Slow)


if ew.Ambient~=false then
local eH=Instance.new"Frame"eH.Name="_ambient"
eH.AnchorPoint=Vector2.new(0.5,0.5)eH.Position=UDim2.new(0.5,0,0.5,0)
eH.Size=UDim2.new(1.4,0,1.4,0)eH.BackgroundColor3=Color3.fromRGB(255,255,255)
eH.BackgroundTransparency=0 eH.BorderSizePixel=0 eH.Parent=eF
local eI=Instance.new"UIGradient"eI.Rotation=25
eI.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,eB.Accent),
ColorSequenceKeypoint.new(1,eB.Accent2 or eB.Accent)}
eI.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
eI.Parent=eH
table.insert(ed._gradients,eI)
task.spawn(function()
while eD.Parent do
ef(eI,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not eD.Parent then break end
ef(eI,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local eH=Instance.new"CanvasGroup"
eH.Name="Main"eH.AnchorPoint=Vector2.new(0.5,0.5)
eH.Position=UDim2.new(0.5,0,0.5,0)eH.Size=UDim2.fromOffset(620,440)
eH.BackgroundColor3=eB.Surface
eH.BackgroundTransparency=(eA and not ev._transparent)and 0.08 or 0
eH.GroupTransparency=1 eH.BorderSizePixel=0 eH.Parent=eD
eh(eH,ew.Radius or 12)ei(eH,true)eo(eH)eq(eH,0.5,48)



local eI,eJ=1,1
local eK=Instance.new"UIScale"eK.Scale=0.94 eK.Parent=eH
local function baseScale()return eI*eJ end





local function brandInto(eL,eM)
if ew.Logo and ew.Logo~=""then
local eN=Instance.new"ImageLabel"eN.BackgroundTransparency=1
eN.AnchorPoint=Vector2.new(0.5,0.5)eN.Position=UDim2.new(0.5,0,0.5,0)
eN.Size=UDim2.new(1,-8,1,-8)eN.Image=ew.Logo
eN.ScaleType=Enum.ScaleType.Fit eN.Parent=eL
eh(eN,8)
if eM then eM.Visible=false end
return eN
end
return nil
end


local function kronosFace(eL,eM,eN,eO)
local eP=eN or 26
local eQ=Instance.new"Frame"eQ.Name="_disc"
eQ.AnchorPoint=Vector2.new(0.5,0.5)eQ.Position=UDim2.new(0.5,0,0.5,0)
eQ.Size=UDim2.fromOffset(eP,eP)eQ.BackgroundColor3=Color3.fromRGB(0,0,0)
eQ.BorderSizePixel=0 eQ.Parent=eL
local eR=Instance.new"UICorner"eR.CornerRadius=UDim.new(0.5,0)eR.Parent=eQ
local eS=Instance.new"UIStroke"eS.Thickness=2
eS.Color=Color3.fromRGB(255,255,255)eS.Transparency=0.12 eS.Parent=eQ
pcall(function()
local eT=Instance.new"UIShadow"eT.Color=Color3.fromRGB(255,255,255)
eT.Transparency=0.82 eT.BlurSize=10 eT.Parent=eQ
end)
if eM then
eM.AnchorPoint=Vector2.new(0.5,0.5)eM.Position=UDim2.new(0.5,0,0.5,0)
eM.Size=UDim2.fromOffset(eP,eP)eM.TextSize=eO or 16
eM.ZIndex=2
end
return eQ
end

local function playEntrance()
ed:_sfx"Open"
ef(eH,ee.Slow,{GroupTransparency=0})
ef(eK,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})
end
playEntrance()


local eL=Instance.new"Frame"
eL.Size=UDim2.new(1,-24,0,2)eL.Position=UDim2.new(0,12,0,0)
eL.BackgroundTransparency=1 eL.Parent=eH
local eM=Instance.new"Frame"eM.Size=UDim2.new(0,0,1,0)
eh(eM,99)eM.Parent=eL
ed:agrad(eM,0)
ef(eM,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()eL:Destroy()end)end)


local eN=Instance.new"Frame"
eN.Name="Header"eN.Size=UDim2.new(1,0,0,62)
eN.BackgroundTransparency=1 eN.Parent=eH
ej(eN,14,6,14,14)


local eO=Instance.new"Frame"eO.Name="Mark"
eO.Size=UDim2.fromOffset(36,36)eO.BackgroundColor3=eB.Surface2
eO.BorderSizePixel=0 eh(eO,10)eO.Parent=eN
ei(eO,true)
local eP=Instance.new"TextLabel"eP.Size=UDim2.fromScale(1,1)
eP.BackgroundTransparency=1 eP.Font=Enum.Font.GothamBlack
eP.TextSize=18 ev:_tag(eP,"TextColor3","Text")eP.Text="K"eP.Parent=eO
local eQ=Instance.new"Frame"eQ.Size=UDim2.fromOffset(8,8)
eQ.Position=UDim2.new(1,-5,0,-3)eQ.BorderSizePixel=0
ev:_tag(eQ,"BackgroundColor3","Accent")
eh(eQ,99)eQ.Parent=eO
brandInto(eO,eP)
if not ew.Logo or ew.Logo==""then kronosFace(eO,eP,26,15)end

local eR=Instance.new"TextLabel"eR.BackgroundTransparency=1
eR.Position=UDim2.new(0,48,0,0)eR.Size=UDim2.new(0,230,0,20)
eR.Font=Enum.Font.GothamBold eR.TextSize=15 eR.TextXAlignment=0
ev:_tag(eR,"TextColor3","Text")eR.Text=ex eR.Parent=eN
local eS=Instance.new"TextLabel"eS.BackgroundTransparency=1
eS.Position=UDim2.new(0,48,0,21)eS.Size=UDim2.new(0,230,0,15)
eS.Font=Enum.Font.Gotham eS.TextSize=11 eR.TextXAlignment=0
eS.TextXAlignment=0 ev:_tag(eS,"TextColor3","Dim")
eS.Text=string.upper(ey).."  |  V"..ev.Version eS.Parent=eN


local eT=Instance.new"Frame"
eT.AnchorPoint=Vector2.new(1,0)eT.Position=UDim2.new(1,-64,0,4)
eT.Size=UDim2.new(0,170,0,32)eT.BackgroundColor3=eB.Bg
eT.BorderSizePixel=0 eh(eT,8)eT.Parent=eN
ei(eT,true)
local eU=es("search",14,eB.Dim)
eU.Position=UDim2.new(0,9,0.5,-7)eU.Parent=eT
local eV=Instance.new"TextBox"eV.PlaceholderText="Search"
eV.PlaceholderColor3=eB.Dim eV.Text=""eV.Font=Enum.Font.GothamBold
eV.TextSize=12 ev:_tag(eV,"TextColor3","Text")
eV.Position=UDim2.new(0,28,0,0)eV.Size=UDim2.new(1,-80,1,0)
eV.BackgroundTransparency=1 eV.ClearTextOnFocus=false eV.Parent=eT
local eW=Instance.new"TextLabel"eW.BackgroundTransparency=1
eW.AnchorPoint=Vector2.new(1,0.5)eW.Position=UDim2.new(1,-8,0.5,0)
eW.Size=UDim2.new(0,44,0,18)eW.Font=Enum.Font.Code eW.TextSize=11
ev:_tag(eW,"TextColor3","Text")eW.Text="Ctrl K"eW.Parent=eT
ev:_tag(eT,"BackgroundColor3","Bg")


local eX=Instance.new"TextButton"eX.Text=""
eX.AnchorPoint=Vector2.new(1,0)eX.Position=UDim2.new(1,-256,0,4)
eX.Size=UDim2.fromOffset(32,32)eX.BackgroundColor3=eB.Bg
eX.BorderSizePixel=0 eh(eX,8)eX.Parent=eN
ei(eX,true)
ev:_tag(eX,"BackgroundColor3","Bg")
local eY=es("keyboard",15,eB.Dim)
eY.AnchorPoint=Vector2.new(0.5,0.5)eY.Position=UDim2.new(0.5,0,0.5,0)
eY.Parent=eX
eX.MouseButton1Click:Connect(function()end)

local eZ=Instance.new"TextButton"eZ.Text=""
eZ.AnchorPoint=Vector2.new(1,0)eZ.Position=UDim2.new(1,-296,0,4)
eZ.Size=UDim2.fromOffset(32,32)eZ.BackgroundColor3=eB.Bg
eZ.BorderSizePixel=0 eh(eZ,8)eZ.Parent=eN
ei(eZ,true)
ev:_tag(eZ,"BackgroundColor3","Bg")
local e_=es("menu",15,eB.Dim)
e_.AnchorPoint=Vector2.new(0.5,0.5)e_.Position=UDim2.new(0.5,0,0.5,0)
e_.Parent=eZ
eZ.MouseButton1Click:Connect(function()end)


local e0=Instance.new"Frame"e0.BackgroundTransparency=1
e0.AnchorPoint=Vector2.new(1,0)e0.Position=UDim2.new(1,0,0,4)
e0.Size=UDim2.new(0,56,0,32)e0.Parent=eN
local e1=Instance.new"UIListLayout"e1.FillDirection=Enum.FillDirection.Horizontal
e1.VerticalAlignment=Enum.VerticalAlignment.Center
e1.HorizontalAlignment=Enum.HorizontalAlignment.Center
e1.Padding=UDim.new(0,7)e1.Parent=e0
local function dot(e2,e3)
local e4=Instance.new"TextButton"e4.Text=""
e4.Size=UDim2.fromOffset(12,12)e4.BackgroundColor3=e2
e4.BorderSizePixel=0 eh(e4,99)e4.AutoButtonColor=false e4.Parent=e0
e4.MouseEnter:Connect(function()ef(e4,ee.Hover,{BackgroundTransparency=0.25})end)
e4.MouseLeave:Connect(function()ef(e4,ee.Hover,{BackgroundTransparency=0})end)
return e4
end
local e2=dot(Color3.fromRGB(39,201,63))
local e3=dot(Color3.fromRGB(255,189,46))
local e4=dot(Color3.fromRGB(255,95,86))
e4.MouseButton1Click:Connect(function()end)
e3.MouseButton1Click:Connect(function()end)
e2.MouseButton1Click:Connect(function()end)


local e5=Instance.new"TextButton"e5.Text=""
e5.AnchorPoint=Vector2.new(1,0)e5.Position=UDim2.new(1,-336,0,4)
e5.Size=UDim2.fromOffset(32,32)e5.BackgroundColor3=eB.Bg
e5.BorderSizePixel=0 eh(e5,8)e5.Parent=eN
ei(e5,true)
ev:_tag(e5,"BackgroundColor3","Bg")
local e6=es("bellring",14,eB.Dim)
e6.AnchorPoint=Vector2.new(0.5,0.5)e6.Position=UDim2.new(0.5,0,0.5,0)
e6.Parent=e5
local e7=Instance.new"Frame"e7.Size=UDim2.fromOffset(8,8)
e7.Position=UDim2.new(1,-7,0,3)e7.BorderSizePixel=0
e7.BackgroundColor3=Color3.fromRGB(248,113,113)
eh(e7,99)e7.Parent=e5 e7.Visible=false
e5.MouseButton1Click:Connect(function()end)

er(eN,eH)


local e8=Instance.new"Frame"e8.Name="Body"
e8.Position=UDim2.new(0,0,0,62)e8.Size=UDim2.new(1,0,1,-62)
e8.BackgroundTransparency=1 e8.Parent=eH
local e9=Instance.new"UIPadding"e9.PaddingLeft=UDim.new(0,12)
e9.PaddingRight=UDim.new(0,12)e9.PaddingBottom=UDim.new(0,12)e9.Parent=e8

local fa=Instance.new"Frame"fa.Name="Sidebar"
fa.Size=UDim2.new(0,164,1,0)fa.BackgroundColor3=eB.Bg
fa.BackgroundTransparency=(eA and not ev._transparent)and 0.15 or 0
fa.BorderSizePixel=0 eh(fa,10)fa.Parent=e8
ei(fa,true)
ev:_tag(fa,"BackgroundColor3","Bg")
el(fa,10)
ej(fa,8,8,8,8)

local fb=Instance.new"Frame"fb.Name="Nav"
fb.Size=UDim2.new(1,0,1,0)fb.BackgroundTransparency=1 fb.Parent=fa
local fc=Instance.new"UIListLayout"fc.Padding=UDim.new(0,4)
fc.SortOrder=Enum.SortOrder.LayoutOrder fc.Parent=fb




local fd=Instance.new"Frame"fd.Name="_pill"
fd.Size=UDim2.new(1,0,0,38)fd.Position=UDim2.new(0,0,0,-2)
fd.BackgroundColor3=eB.Surface2 fd.BorderSizePixel=0
fd.ZIndex=0
eh(fd,8)fd.Parent=fa
ei(fd,true)
ev:_tag(fd,"BackgroundColor3","Surface2")

local fe=Instance.new"Frame"fe.Name="Pages"
fe.Position=UDim2.new(0,176,0,0)fe.Size=UDim2.new(1,-176,1,0)
fe.BackgroundTransparency=1 fe.ClipsDescendants=true fe.Parent=e8

local ff={
_gui=eD,_main=eH,_side=fa,_nav=fb,_pages=fe,_pill=fd,
_tabs={},_active=nil,_toggleKey=ez,_visible=true,_keybinds={},
_conns={},_acrylicPref=eA,
}

function ff.Track(fg,fh)table.insert(fg._conns,fh)return fh end
local fg
local fh
local fi,fj
ff._cfgTitle=ex
ff._body=e8

ff._folder="Kronos/"..tostring(ex)
pcall(function()
if makefolder and isfolder and not isfolder"Kronos"then makefolder"Kronos"end
if makefolder and isfolder and not isfolder(ff._folder)then makefolder(ff._folder)end
end)

function ff._activateTab(fk,fl)
if fk and fk._activate then pcall(fk._activate,fl~=false)end
end

function ff._flash(fk,fl)
if not fl or not fl.Parent then return end
local fm=Instance.new"Frame"fm.Name="_flash"
fm.Size=UDim2.fromScale(1,1)fm.BackgroundColor3=eB.Accent
fm.BackgroundTransparency=0.75 fm.BorderSizePixel=0
eh(fm,10)fm.Parent=fl
ef(fm,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()fm:Destroy()end)end)
end

ff:Track(et.InputBegan:Connect(function(fk,fl)
if fl then return end
if fk.KeyCode==ff._toggleKey then ff:Toggle()end
if fk.KeyCode==Enum.KeyCode.K and et:IsKeyDown(Enum.KeyCode.LeftControl)then
ff:TogglePalette()
end
if fk.KeyCode==Enum.KeyCode.P and et:IsKeyDown(Enum.KeyCode.LeftControl)then
ff:TogglePalette()
end
if fk.KeyCode==Enum.KeyCode.Tab and et:IsKeyDown(Enum.KeyCode.LeftControl)then
local fm=table.find(ff._tabs,ff._active)or 0
local fn=ff._tabs[(fm%#ff._tabs)+1]
if fn then ed:_sfx"Swap"ff._activateTab(fn,true)end
end
end))

eV:GetPropertyChangedSignal"Text":Connect(function()
local fk=string.lower(eV.Text)
for fl,fm in ipairs(ff._tabs)do
local fn=fk==""or string.find(string.lower(fm.Title),fk,1,true)~=nil
for fo,fp in ipairs(fm.Elements)do
local fq
if fk==""then
fq=true
elseif fn then
fq=true
else




local fr=string.lower(tostring(fp.Title or"").." "..tostring(fp.Flag or""))
local fs=fp._handle
local ft
if type(fs)=="table"then
ft=fs.Get
elseif fs~=nil then
local fu,fv=pcall(function()return fs.Get end)
if fu then ft=fv end
end
if type(ft)=="function"then
local fu,fv=pcall(ft,fs)
if fu then
if type(fv)=="string"or type(fv)=="number"then
fr=fr.." "..string.lower(tostring(fv))
elseif type(fv)=="table"then
for fw,fx in ipairs(fv)do fr=fr.." "..string.lower(tostring(fx))end
end
end
end
fq=string.find(fr,fk,1,true)~=nil
end
fp._searchVisible=(fk=="")and nil or fq
if fp.Frame then fp.Frame.Visible=fq end
end
fm.Btn.Visible=(fn or fk=="")
if fk~=""then

for fo,fp in ipairs(fm.Elements)do
if fp.Frame and fp.Frame.Visible then fm.Btn.Visible=true break end
end
else

for fo,fp in ipairs(fm.Elements)do
if fp._refreshSection then pcall(fp._refreshSection)end
end
end
end
end)


eV.Focused:Connect(function()ef(eT,ee.Hover,{Size=UDim2.new(0,190,0,32)})end)
eV.FocusLost:Connect(function()ef(eT,ee.Hover,{Size=UDim2.new(0,170,0,32)})end)

function ff.SetVisible(fk,fl)
fk._visible=fl

local function pillTarget()
local fm,fn=eD.AbsoluteSize.X,eD.AbsoluteSize.Y
if fm<1 then fm,fn=1200,800 end
local fo,fp=fg.AbsolutePosition,fg.AbsoluteSize
return UDim2.new(0,fo.X+fp.X/2-fm/2,0,fo.Y+fp.Y/2-fn/2)
end
if fl then
eD.Enabled=true
fk._mini=false
if fi then fi.Visible=false end
if fg then fg.Visible=false end
eH.Position=pillTarget()
eK.Scale=baseScale()*0.55
eH.GroupTransparency=1
eF.BackgroundTransparency=1
if fk._acrylicPref then ed:SetAcrylic(true,ew.Blur or 16)end
ed:_sfx"Open"

ef(eH,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=fk._lastPos or UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
ef(eK,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})

dimTo(0.5,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
else
fk._mini=false
fk._lastPos=eH.Position
if fi then fi.Visible=false end
ed:SetAcrylic(false)
for fm,fn in pairs(ed.Sound._cache)do pcall(function()fn:Stop()end)end
ef(eH,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
ef(eK,ee.Fast,{Scale=baseScale()*0.55})

dimTo(1,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In))
task.delay(0.36,function()
if fk._visible then return end
eD.Enabled=false
if fg then
fg.Visible=true
fh.Scale=0.5
ef(fh,ee.Spring,{Scale=1})
end
end)
end
end
function ff.Toggle(fk)fk:SetVisible(not fk._visible)end


function ff.SetToggleKey(fk,fl)
if type(fl)=="string"then fl=Enum.KeyCode[fl]end
if typeof(fl)=="EnumItem"then
if fk._toggleKey==fl then return end
fk._toggleKey=fl
fk:Notify{Title="Hide key",Content="Now bound to "..fl.Name,Duration=1.5}
end
end
function ff.GetToggleKey(fk)return fk._toggleKey end


function ff.OnClose(fk,fl)
if type(fl)=="function"then fk._onCloseCb=fl end
end

function ff.SetMini(fk,fl)
fl=fl and true or false
if fl==fk._mini then return end
fk._mini=fl
if fl then
fk._visible=false
fk._lastPos=eH.Position
fg.Visible=false
ed:SetAcrylic(false)
for fm,fn in pairs(ed.Sound._cache)do pcall(function()fn:Stop()end)end
ef(eH,ee.Fast,{GroupTransparency=1})
ef(eK,ee.Fast,{Scale=baseScale()*0.7})
dimTo(1,ee.Fast)
task.delay(0.2,function()
if not fk._mini then return end
eD.Enabled=false
fi.Visible=true
fj.Scale=0.5
ef(fj,ee.Spring,{Scale=1})
end)
else
fi.Visible=false
fk:SetVisible(true)
end
end



ff._sbMode=0
ff._focus=false
function ff._applyLayout(fk)
local fl=fk._focus and 2 or fk._sbMode
local fm=fl==1
fa.Visible=fl~=2
if fl==0 then
ef(fa,ee.Fast,{Size=UDim2.new(0,164,1,0)})
fe.Position=UDim2.new(0,176,0,0)
fe.Size=UDim2.new(1,-176,1,0)
elseif fl==1 then
ef(fa,ee.Fast,{Size=UDim2.new(0,58,1,0)})
fe.Position=UDim2.new(0,70,0,0)
fe.Size=UDim2.new(1,-70,1,0)
else
fe.Position=UDim2.new(0,0,0,0)
fe.Size=UDim2.new(1,0,1,0)
end
for fn,fo in ipairs(fk._tabs)do
if fo._label then fo._label.Visible=not fm end
if fo._icon and fo._icon:IsA"GuiObject"then
fo._icon.Position=fm and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end
end
function ff.CycleSidebar(fk)
fk._sbMode=(fk._sbMode+1)%3
fk:_applyLayout()
fk:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[fk._sbMode+1],Duration=1.5}
end
function ff.SetFocus(fk,fl)
fk._focus=fl and true or false
fk:_applyLayout()
end
local function fitCard()
local fk=Vector2.new(1200,800)
pcall(function()fk=workspace.CurrentCamera.ViewportSize end)
local fl=math.clamp(math.min(fk.X/700,fk.Y/520),0.6,1)
eI=fl
eK.Scale=baseScale()
if fk.X<760 or et.TouchEnabled then
if ff._sbMode==0 and not ff._userToggledSide then
ff._sbMode=2 ff:_applyLayout()
end
end
end
eZ.MouseButton1Click:Connect(function()
ed:_sfx"Click"
ff._userToggledSide=true
ff:CycleSidebar()
end)
eX.MouseButton1Click:Connect(function()
ed:_sfx"Click"ff:ToggleKeybindList()
end)


local fk=ew.ConfirmClose
if fk==nil then fk=true end
local function requestClose()
ed:_sfx"Click"
if fk==false then ff:Destroy()return end
local fl=(type(fk)=="table")and fk or{}
ff:Dialog{
Title=fl.Title or"Close Kronos?",
Content=fl.Content or"The hub will close permanently and all features will be disabled.",
Buttons={
{Title=fl.Cancel or"Cancel"},
{Title=fl.Confirm or"Close",Callback=function()ff:Destroy()end},
},
}
end
e4.MouseButton1Click:Connect(function()requestClose()end)
e3.MouseButton1Click:Connect(function()
ed:_sfx"Click"ff:SetMini(not ff._mini)
end)
ff._zoomed=false
e2.MouseButton1Click:Connect(function()
ed:_sfx"Click"
ff._zoomed=not ff._zoomed
ef(eH,ee.Med,{Size=ff._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
e5.MouseButton1Click:Connect(function()
ed:_sfx"Click"ff:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
ff:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

fg=Instance.new"TextButton"fg.Name=ad.GetStealthName()
fg.Text=""
fg.AnchorPoint=Vector2.new(0,0.5)fg.Position=UDim2.new(0,12,0.5,0)
fg.Size=UDim2.fromOffset(42,42)
fg.BackgroundColor3=eB.Surface2 fg.BorderSizePixel=0
ev:_tag(fg,"BackgroundColor3","Surface2")
eh(fg,13)fg.Parent=eD fg.Visible=false
ei(fg,true)
eq(fg,0.6,20)

local fl=Instance.new"TextLabel"fl.Size=UDim2.fromScale(1,1)
fl.BackgroundTransparency=1 fl.Font=Enum.Font.GothamBlack
fl.TextSize=20 fl.Text="K"fl.Parent=fg
ev:_tag(fl,"TextColor3","Text")
local fm=Instance.new"Frame"fm.Size=UDim2.fromOffset(9,9)
fm.Position=UDim2.new(1,-6,0,-3)fm.BorderSizePixel=0
ev:_tag(fm,"BackgroundColor3","Accent")
eh(fm,99)fm.Parent=fg
brandInto(fg,fl)
if not ew.Logo or ew.Logo==""then kronosFace(fg,fl,32,17)end
fh=Instance.new"UIScale"fh.Parent=fg
er(fg,fg)
fg.MouseButton1Click:Connect(function()ff:SetVisible(true)end)


fi=Instance.new"TextButton"fi.Name=ad.GetStealthName()
fi.Text=""
fi.AnchorPoint=Vector2.new(0,0)fi.Position=UDim2.new(0,12,0,12)
fi.Size=UDim2.fromOffset(44,44)
fi.BackgroundColor3=eB.Surface2 fi.BorderSizePixel=0
ev:_tag(fi,"BackgroundColor3","Surface2")
eh(fi,13)fi.Parent=eC fi.Visible=false
ei(fi,true)
eq(fi,0.6,20)
local fn=Instance.new"TextLabel"fn.Size=UDim2.fromScale(1,1)
fn.BackgroundTransparency=1 fn.Font=Enum.Font.GothamBlack
fn.TextSize=20 fn.Text="K"fn.Parent=fi
ev:_tag(fn,"TextColor3","Text")
local fo=Instance.new"Frame"fo.Size=UDim2.fromOffset(9,9)
fo.Position=UDim2.new(1,-6,0,-3)fo.BorderSizePixel=0
ev:_tag(fo,"BackgroundColor3","Accent")
eh(fo,99)fo.Parent=fi
brandInto(fi,fn)
if not ew.Logo or ew.Logo==""then kronosFace(fi,fn,34,17)end
fj=Instance.new"UIScale"fj.Parent=fi
er(fi,fi)
fi.MouseButton1Click:Connect(function()ff:SetMini(false)end)


local fp=Instance.new"TextButton"fp.Text=""
fp.AnchorPoint=Vector2.new(1,1)fp.Position=UDim2.new(1,0,1,0)
fp.Size=UDim2.fromOffset(28,28)fp.BackgroundTransparency=1
fp.Parent=eH fp.ZIndex=50
fp.ClipsDescendants=true


local fq=0
fp.MouseButton1Click:Connect(function()
local fr=os.clock()
if fr-fq<0.35 then
ed:_sfx"Click"
ff._zoomed=not ff._zoomed
ef(eH,ee.Med,{Size=ff._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
fq=fr
end)
local fr,fs,ft=false
fp.InputBegan:Connect(function(fu)
if fu.UserInputType==Enum.UserInputType.MouseButton1 or fu.UserInputType==Enum.UserInputType.Touch then
fr,fs,ft=true,fu.Position,eH.Size
fu.Changed:Connect(function()
if fu.UserInputState==Enum.UserInputState.End then fr=false end
end)
end
end)
ff:Track(et.InputChanged:Connect(function(fu)
if not fr then return end
if fu.UserInputType~=Enum.UserInputType.MouseMovement
and fu.UserInputType~=Enum.UserInputType.Touch then return end
local fv=fu.Position-fs
eH.Size=UDim2.fromOffset(
math.clamp(ft.X.Offset+fv.X,520,920),
math.clamp(ft.Y.Offset+fv.Y,380,660))
end))

function ff.Notify(fu,fv)
fv=fv or{}
ed:_sfx"Notify"
ec.closeAny()
table.insert(ed._inbox,1,{Title=fv.Title or"Kronos",
Content=fv.Content or fv.Text or"",At=os.date"%H:%M"})
while#ed._inbox>30 do table.remove(ed._inbox)end
pcall(function()e7.Visible=true end)
local fw=ensureNotifyHost(eE)
local fx=Instance.new"CanvasGroup"fx.Size=UDim2.new(1,0,0,62)
fx.BackgroundColor3=eB.Surface2 fx.BorderSizePixel=0 fx.GroupTransparency=1
eh(fx,10)fx.Parent=fw
ei(fx,true)
eq(fx,0.65,24)
ed:_tag(fx,"BackgroundColor3","Surface2")
fx.Position=UDim2.new(0,40,0,0)
ef(fx,ee.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local fy=Instance.new"TextLabel"fy.BackgroundTransparency=1
fy.Position=UDim2.new(0,12,0,8)fy.Size=UDim2.new(1,-24,0,17)
fy.Font=Enum.Font.GothamBold fy.TextSize=13 fy.TextXAlignment=0
ed:_tag(fy,"TextColor3","Text")fy.Text=fv.Title or"Kronos"fy.Parent=fx
local fz=Instance.new"TextLabel"fz.BackgroundTransparency=1
fz.Position=UDim2.new(0,12,0,27)fz.Size=UDim2.new(1,-24,0,16)
fz.Font=Enum.Font.Gotham fz.TextSize=12 fz.TextXAlignment=0
ed:_tag(fz,"TextColor3","Dim")
fz.TextTruncate=Enum.TextTruncate.AtEnd fz.Text=fv.Content or fv.Text or""fz.Parent=fx
local fA=Instance.new"Frame"fA.AnchorPoint=Vector2.new(0,1)
fA.Position=UDim2.new(0,10,1,-6)fA.Size=UDim2.new(1,-20,0,2)
fA.BorderSizePixel=0 ed:agrad(fA,0)
eh(fA,99)fA.Parent=fx
local fB=fv.Duration or 4
ef(fA,TweenInfo.new(fB,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(fB+0.1,function()
ef(fx,ee.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()fx:Destroy()end)end)
end)
end


function ff.Dialog(fu,fv)
fv=fv or{}
ed:_sfx"Open"
local fw=Instance.new"TextButton"fw.Text=""fw.AutoButtonColor=false
fw.Size=UDim2.fromScale(1,1)fw.BackgroundColor3=Color3.fromRGB(0,0,0)
fw.BackgroundTransparency=1 fw.Parent=eD
ef(fw,ee.Med,{BackgroundTransparency=0.55})
local fx=Instance.new"CanvasGroup"fx.AnchorPoint=Vector2.new(0.5,0.5)

local fy=eD.AbsoluteSize
if fy.X<1 then fy=Vector2.new(1200,800)end
local fz,fA=eH.AbsolutePosition,eH.AbsoluteSize
fx.Position=UDim2.new(0,fz.X+fA.X/2-fy.X/2,0,fz.Y+fA.Y/2-fy.Y/2)
fx.Size=UDim2.fromOffset(320,170)
fx.BackgroundColor3=eB.Surface fx.BorderSizePixel=0 fx.GroupTransparency=1
eh(fx,12)fx.Parent=fw
ei(fx,true)
el(fx,12)
eq(fx,0.5,40)
ed:_tag(fx,"BackgroundColor3","Surface")
local fB=Instance.new"UIScale"fB.Scale=0.94 fB.Parent=fx
ef(fx,ee.Med,{GroupTransparency=0})
ef(fB,ee.Spring,{Scale=1})
local fC=false
local function close()
if fC then return end fC=true
ec.close(close)
ef(fx,ee.Fast,{GroupTransparency=1})
ef(fw,ee.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()fw:Destroy()end)end)
end
ec.open(close)
fw.MouseButton1Click:Connect(function()close()end)
local fD=Instance.new"TextLabel"fD.BackgroundTransparency=1
fD.Position=UDim2.new(0,16,0,14)fD.Size=UDim2.new(1,-32,0,20)
fD.Font=Enum.Font.GothamBold fD.TextSize=15 fD.TextXAlignment=0
ed:_tag(fD,"TextColor3","Text")fD.Text=fv.Title or"Confirm"fD.Parent=fx
local fE=Instance.new"TextLabel"fE.BackgroundTransparency=1
fE.Position=UDim2.new(0,16,0,38)fE.Size=UDim2.new(1,-32,0,60)
fE.Font=Enum.Font.Gotham fE.TextSize=12 fD.TextXAlignment=0
fE.TextXAlignment=0 fE.TextYAlignment=0 fE.TextWrapped=true
ed:_tag(fE,"TextColor3","Dim")fE.Text=fv.Content or""fE.Parent=fx
local fF=Instance.new"Frame"fF.BackgroundTransparency=1
fF.AnchorPoint=Vector2.new(0,1)fF.Position=UDim2.new(0,0,1,-12)
fF.Size=UDim2.new(1,0,0,34)fF.Parent=fx
local fG=Instance.new"UIListLayout"fG.FillDirection=Enum.FillDirection.Horizontal
fG.HorizontalAlignment=Enum.HorizontalAlignment.Right fG.Padding=UDim.new(0,8)fG.Parent=fF
ej(fF,0,0,12,12)
for fH,fI in ipairs(fv.Buttons or{{Title="OK"}})do
local fJ=Instance.new"TextButton"fJ.Text=""
fJ.Size=UDim2.new(0,96,0,30)fJ.BackgroundColor3=eB.Surface2
fJ.BorderSizePixel=0 eh(fJ,7)fJ.AutoButtonColor=false fJ.Parent=fF
ei(fJ,true)
ed:_tag(fJ,"BackgroundColor3","Surface2")
local fK=Instance.new"TextLabel"fK.BackgroundTransparency=1 fK.Size=UDim2.fromScale(1,1)
fK.Font=Enum.Font.GothamBold fK.TextSize=12
ed:_tag(fK,"TextColor3","Text")fK.Text=fI.Title fK.Parent=fJ
local fL=Instance.new"UIScale"fL.Parent=fJ
fJ.MouseButton1Down:Connect(function()ef(fL,ee.Hover,{Scale=0.95})end)
fJ.MouseButton1Up:Connect(function()ef(fL,ee.Spring,{Scale=1})end)
fJ.MouseButton1Click:Connect(function()
close()eg(fI.Callback)
end)
end
return{Close=close}
end




function ff.KeySystem(fu,fv)
fv=fv or{}
local fw,fx=false,fv.FileName or("kronos_key_"..tostring(ex))

local fy=(fu._folder or"Kronos").."/"..fx..".txt"

if fv.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(fy)then
local fz=readfile(fy)
if fz and fu:_checkKey(fv,fz)then fw=true end
end
end)
end
local fz=Instance.new"TextButton"fz.Text=""fz.AutoButtonColor=false
fz.Size=UDim2.fromScale(1,1)fz.BackgroundColor3=Color3.fromRGB(0,0,0)
fz.BackgroundTransparency=1 fz.ZIndex=200 fz.Parent=eD
ef(fz,ee.Med,{BackgroundTransparency=0.6})
local fA=Instance.new"CanvasGroup"fA.AnchorPoint=Vector2.new(0.5,0.5)
fA.Position=UDim2.new(0.5,0,0.5,0)fA.Size=UDim2.fromOffset(300,210)
fA.BackgroundColor3=eB.Surface fA.BorderSizePixel=0 fA.GroupTransparency=1
eh(fA,12)fA.Parent=fz
ei(fA,true)
el(fA,12)
eq(fA,0.5,40)
ed:_tag(fA,"BackgroundColor3","Surface")
local fB=Instance.new"UIScale"fB.Scale=0.94 fB.Parent=fA
ef(fA,ee.Med,{GroupTransparency=0})
ef(fB,ee.Spring,{Scale=1})
local fC=Instance.new"TextLabel"fC.BackgroundTransparency=1
fC.Position=UDim2.new(0,16,0,14)fC.Size=UDim2.new(1,-32,0,20)
fC.Font=Enum.Font.GothamBold fC.TextSize=15 fC.TextXAlignment=0
ed:_tag(fC,"TextColor3","Text")fC.Text=fv.Title or"Enter Key"fC.Parent=fA
local fD=Instance.new"TextLabel"fD.BackgroundTransparency=1
fD.Position=UDim2.new(0,16,0,36)fD.Size=UDim2.new(1,-32,0,15)
fD.Font=Enum.Font.Gotham fD.TextSize=11 fC.TextXAlignment=0 fD.TextXAlignment=0
ed:_tag(fD,"TextColor3","Dim")fD.Text=string.upper(fv.Subtitle or"key required")fD.Parent=fA
local fE=Instance.new"TextBox"fE.PlaceholderText="Paste key..."
fE.PlaceholderColor3=eB.Dim fE.Text=""
fE.Font=Enum.Font.Code fE.TextSize=12
fE.Position=UDim2.new(0,16,0,60)fE.Size=UDim2.new(1,-32,0,32)
fE.BackgroundColor3=eB.Surface2 fE.BorderSizePixel=0
eh(fE,8)fE.Parent=fA
ej(fE,4,4,10,10)
ei(fE,true)
ed:_tag(fE,"BackgroundColor3","Surface2")
ed:_tag(fE,"TextColor3","Text")
local fF=Instance.new"TextLabel"fF.BackgroundTransparency=1
fF.Position=UDim2.new(0,16,0,96)fF.Size=UDim2.new(1,-32,0,15)
fF.Font=Enum.Font.Gotham fF.TextSize=11 fF.TextXAlignment=0 fF.Text=""
ed:_tag(fF,"TextColor3","Danger")fF.Parent=fA
local fG=Instance.new"TextButton"fG.Text=""
fG.Position=UDim2.new(0,16,0,118)fG.Size=UDim2.new(1,-32,0,32)
fG.BorderSizePixel=0 eh(fG,8)fG.AutoButtonColor=false fG.Parent=fA
ed:agrad(fG,15)
local fH=Instance.new"TextLabel"fH.BackgroundTransparency=1 fH.Size=UDim2.fromScale(1,1)
fH.Font=Enum.Font.GothamBold fH.TextSize=13 fH.Text="UNLOCK"
ed:oa(fH)fH.Parent=fG
local fI=Instance.new"UIScale"fI.Parent=fG
local fJ
if fv.GetKeyLink then
fJ=Instance.new"TextButton"fJ.Text=""
fJ.Position=UDim2.new(0,16,0,156)fJ.Size=UDim2.new(1,-32,0,26)
fJ.BackgroundTransparency=1 fJ.Parent=fA
local fK=Instance.new"TextLabel"fK.BackgroundTransparency=1 fK.Size=UDim2.fromScale(1,1)
fK.Font=Enum.Font.Gotham fK.TextSize=11 fK.Text="Copy key link"
ed:_tag(fK,"TextColor3","Dim")fK.Parent=fJ
fJ.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(fv.GetKeyLink)end end)
fK.Text="Link copied"
task.delay(2,function()pcall(function()fK.Text="Copy key link"end)end)
end)
end
local function shake()local fK=
fA.Position.X.Offset
for fL=1,3 do
ef(fA,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
ef(fA,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
ef(fA,ee.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
fw=true
if fv.SaveKey~=false then
pcall(function()
if makefolder and isfolder and not isfolder(fu._folder or"Kronos")then
makefolder(fu._folder or"Kronos")
end
if writefile then writefile(fy,fE.Text)end
end)
end
ef(fA,ee.Fast,{GroupTransparency=1})
ef(fz,ee.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()fz:Destroy()end)end)
fu:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
eg(fv.OnSuccess)
end
local function check()
local fK=fE.Text
if fu:_checkKey(fv,fK)then unlock()
else fF.Text="Invalid key."task.spawn(shake)end
end
fG.MouseButton1Down:Connect(function()ef(fI,ee.Hover,{Scale=0.96})end)
fG.MouseButton1Up:Connect(function()ef(fI,ee.Spring,{Scale=1})end)
fG.MouseButton1Click:Connect(check)
fE.FocusLost:Connect(function(fK)if fK then check()end end)
if fw then pcall(function()fz:Destroy()end)eg(fv.OnSuccess)end
return{Passed=function()return fw end}
end

function ed._checkKey(fu,fv,fw)
if fv.Validate and type(fv.Validate)=="function"then
local fx,fy=pcall(fv.Validate,fw)
if fx and fy then return true end
end
if fv.Key and fw==fv.Key then return true end
if fv.Keys and table.find(fv.Keys,fw)then return true end
if not fv.Key and not fv.Keys and not fv.Validate then return true end
return false
end


function ff.TogglePalette(fu,fv)
local fw=fu._palette
if not fw then
local fx=Instance.new"TextButton"fx.Text=""fx.AutoButtonColor=false
fx.Size=UDim2.fromScale(1,1)fx.BackgroundColor3=Color3.fromRGB(0,0,0)
fx.BackgroundTransparency=1 fx.Visible=false fx.ZIndex=ec.Z.Popup fx.Parent=eE
local fy=Instance.new"Frame"fy.AnchorPoint=Vector2.new(0.5,0)
fy.Position=UDim2.new(0.5,0,0,90)fy.Size=UDim2.fromOffset(380,300)
fy.BackgroundColor3=eB.Bg fy.BorderSizePixel=0
eh(fy,12)fy.Parent=fx
ei(fy,true)
eq(fy,0.5,40)
ed:_tag(fy,"BackgroundColor3","Bg")
local fz=Instance.new"TextBox"fz.PlaceholderText="Type a command..."
fz.PlaceholderColor3=eB.Dim fz.Text=""
fz.Font=Enum.Font.Gotham fz.TextSize=14
fz.Position=UDim2.new(0,14,0,12)fz.Size=UDim2.new(1,-28,0,32)
fz.BackgroundTransparency=1 fz.ClearTextOnFocus=false fz.Parent=fy
ed:_tag(fz,"TextColor3","Text")
local fA=Instance.new"Frame"fA.BorderSizePixel=0
fA.Position=UDim2.new(0,12,0,50)fA.Size=UDim2.new(1,-24,0,1)
fA.BackgroundColor3=Color3.fromRGB(255,255,255)
fA.BackgroundTransparency=0.93 fA.Parent=fy
local fB=Instance.new"ScrollingFrame"
fB.Position=UDim2.new(0,8,0,56)fB.Size=UDim2.new(1,-16,1,-64)
fB.BackgroundTransparency=1 fB.BorderSizePixel=0
fB.ScrollBarThickness=2 fB.CanvasSize=UDim2.new(0,0,0,0)
fB.AutomaticCanvasSize=Enum.AutomaticSize.Y fB.Parent=fy
ed:_tag(fB,"ScrollBarImageColor3","Surface2")
local fC=Instance.new"UIListLayout"fC.Padding=UDim.new(0,2)
fC.SortOrder=Enum.SortOrder.LayoutOrder fC.Parent=fB
fw={ov=fx,card=fy,box=fz,list=fB,open=false,sel=1,rows={}}
fu._palette=fw
local function fuzzy(fD,fE)
fD,fE=string.lower(fD),string.lower(fE)
if fD==""then return 0 end
local fF,fG,fH=1,0,0
for fI=1,#fE do
if string.sub(fE,fI,fI)==string.sub(fD,fF,fF)then
fG+=(fH==fI-1)and 2 or 1
fH,fF=fI,fF+1
if fF>#fD then return fG-fI*0.01 end
end
end
return nil
end
local function run(fD)
if not fD then return end
fw.ov.Visible,fw.open=false,false
ec.close(fw._closeLayer)
ef(fw.ov,ee.Fast,{BackgroundTransparency=1})
if fD.go then pcall(fD.go)end
end
fw._run=run
local function render()
for fD,fE in ipairs(fw.rows)do pcall(function()fE.frame:Destroy()end)end
fw.rows={}
local fD=fz.Text
local fE={}
for fF,fG in ipairs(fu._tabs)do
local fH=fuzzy(fD,fG.Title)
if fH then table.insert(fE,{label=fG.Title,hint="tab",score=fH+100,
go=function()fu._activateTab(fG,true)end})end
for fI,fJ in ipairs(fG.Elements)do
if fJ.Title and fJ.Frame then
local fK=fuzzy(fD,fG.Title.." "..fJ.Title)
if fK then table.insert(fE,{label=fJ.Title,hint=fG.Title,score=fK,
go=fJ._go})end
end
end
end
table.sort(fE,function(fF,fG)return fF.score>fG.score end)
fw.sel=math.clamp(fw.sel,1,math.max(1,math.min(12,#fE)))
if#fE==0 then
local fF=Instance.new"TextLabel"fF.BackgroundTransparency=1
fF.Size=UDim2.new(1,0,0,30)fF.Font=Enum.Font.Gotham
fF.TextSize=12 fF.Text="No results"fF.Parent=fB
ed:_tag(fF,"TextColor3","Dim")
fw.rows={{frame=fF}}
return
end
for fF=1,math.min(12,#fE)do
local fG=fE[fF]
local fH=Instance.new"TextButton"fH.Text=""
fH.Size=UDim2.new(1,-4,0,32)fH.BorderSizePixel=0
fH.BackgroundColor3=eB.Surface2
fH.BackgroundTransparency=(fF==fw.sel)and 0.35 or 1
eh(fH,7)fH.Parent=fB
ed:_tag(fH,"BackgroundColor3","Surface2")
local fI=Instance.new"TextLabel"fI.BackgroundTransparency=1
fI.Position=UDim2.new(0,10,0,0)fI.Size=UDim2.new(1,-90,1,0)
fI.Font=Enum.Font.Gotham fI.TextSize=13 fI.TextXAlignment=0
fI.TextTruncate=Enum.TextTruncate.AtEnd fI.Text=fG.label fI.Parent=fH
ed:_tag(fI,"TextColor3","Text")
local fJ=Instance.new"TextLabel"fJ.BackgroundTransparency=1
fJ.AnchorPoint=Vector2.new(1,0)fJ.Position=UDim2.new(1,-10,0,0)
fJ.Size=UDim2.new(0,70,1,0)fJ.Font=Enum.Font.Gotham
fJ.TextSize=10 fJ.TextXAlignment=1 fI.TextTruncate=Enum.TextTruncate.AtEnd
fJ.Text=fG.hint fJ.Parent=fH
ed:_tag(fJ,"TextColor3","Dim")
local fK=fF
fH.MouseButton1Click:Connect(function()run(fG)end)
fH.MouseEnter:Connect(function()
fw.sel=fK render()
end)
table.insert(fw.rows,{frame=fH,item=fG})
end
end
fw._render=render
fz:GetPropertyChangedSignal"Text":Connect(function()fw.sel=1 render()end)
fx.MouseButton1Click:Connect(function()
if fw.open then fu:TogglePalette(false)end
end)
fu:Track(et.InputBegan:Connect(function(fD,fE)
if not fw.open then return end
if fD.KeyCode==Enum.KeyCode.Escape then fu:TogglePalette(false)
elseif fD.KeyCode==Enum.KeyCode.Return or fD.KeyCode==Enum.KeyCode.KeypadEnter then
local fF=fw.rows[fw.sel]
run(fF and fF.item)
elseif fD.KeyCode==Enum.KeyCode.Up then
fw.sel=math.max(1,fw.sel-1)render()
elseif fD.KeyCode==Enum.KeyCode.Down then
fw.sel=math.min(#fw.rows,fw.sel+1)render()
end
end))
fw._closeLayer=function()
if fw.open then fu:TogglePalette(false)end
end
end
local fx=(fv~=nil)and fv or(not fw.open)
fw.open=fx
fw.ov.Visible=fx
if fx then
ec.open(fw._closeLayer)
ed:_sfx"Open"
flyTo(fw.ov,{BackgroundTransparency=0.45})
fw.card.Position=UDim2.new(0.5,0,0,78)
flyTo(fw.card,{Position=UDim2.new(0.5,0,0,90)})
fw.box.Text,fw.sel="",1
fw._render()
task.defer(function()pcall(function()fw.box:CaptureFocus()end)end)
else
ec.close(fw._closeLayer)
flyTo(fw.ov,{BackgroundTransparency=1},ee.Fast,function()
if not fw.open then fw.ov.Visible=false end
end)
end
end

function ff.SetTheme(fu,fv)ed:SetTheme(fv)end

function ed.SetAccent(fu,fv)
if typeof(fv)~="Color3"then return end
fu.Themes[fu.ThemeName].Accent=fv
fu:SetTheme(fu.ThemeName)
end


ed.FontPacks={
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
ed.FontPack="Gotham+"
ed._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function ed._resolveFont(fu,fv)
local fw,fx=pcall(function()return Enum.Font[fv]end)
if fw and fx then return fx end
return nil
end
function ed._paintFonts(fu,fv)
local fw=fu.FontPacks[fu.FontPack]
if not fw then return end
for fx,fy in ipairs(fv:GetDescendants())do
if fy:IsA"TextLabel"or fy:IsA"TextButton"or fy:IsA"TextBox"then
local fz=fy:GetAttribute"KronosFontRole"
if not fz then
fz=fu._roleFromDefault[fy.Font]or"Body"
fy:SetAttribute("KronosFontRole",fz)
fy:SetAttribute("KronosBaseSize",fy.TextSize)
end
local fA=fy:GetAttribute"KronosBaseSize"or fy.TextSize
local fB=(fw.Bump and fw.Bump[fz])or 0
local fC=fw[fz]and fu:_resolveFont(fw[fz])or nil
pcall(function()
if fC then fy.Font=fC end
fy.TextSize=math.clamp(fA+fB,8,30)
end)
end
end
end
function ed.SetFontPack(fu,fv)
if not fu.FontPacks[fv]then return end
fu.FontPack=fv
if fu._gui then fu:_paintFonts(fu._gui)end
end
function ed.RefreshFonts(fu)
if fu._gui then fu:_paintFonts(fu._gui)end
end
function ff.SetAccent(fu,fv)ed:SetAccent(fv)end
function ff.SetScale(fu,fv)
eJ=math.clamp(tonumber(fv)or 1,0.7,1.25)
eK.Scale=baseScale()
end
function ff.SetCompact(fu,fv)
fv=fv and true or false
if fv then

if not fu._preCompactSize then
pcall(function()fu._preCompactSize=eH.Size end)
end
ef(eH,ee.Med,{Size=UDim2.fromOffset(560,400)})
else
local fw=fu._preCompactSize
or(fu._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))
fu._preCompactSize=nil
ef(eH,ee.Med,{Size=fw})
end
for fw,fx in ipairs(fu._tabs)do
if fx._pl then fx._pl.Padding=fv and UDim.new(0,4)or UDim.new(0,8)end
end
end
function ff.ToggleAcrylic(fu,fv)
ed:ToggleAcrylic(fv)
eH.BackgroundTransparency=(fv and not ed._transparent)and 0.08 or 0
fa.BackgroundTransparency=(fv and not ed._transparent)and 0.15 or 0
end
function ff.ToggleTransparency(fu,fv)
ed._transparent=fv and true or false
local fw=(ed._acrylicOn and not fv)and 0.08 or(fv and 0.25 or 0)
eH.BackgroundTransparency=fw
fa.BackgroundTransparency=fv and 0.4 or((ed._acrylicOn and not fv)and 0.15 or 0)
end


function ff.SetBackdrop(fu,fv)
fv=fv and true or false
eG=fv
fu._backdrop=fv
if fv then
if fu._visible and not fu._mini then
eF.Visible=true
ef(eF,ee.Med,{BackgroundTransparency=0.5})
end
else
ef(eF,ee.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
if not eG then eF.Visible=false end
end)
end
end




local fu=Instance.new"TextButton"
fu.Name=ad.GetStealthName()
fu.Text=""fu.AutoButtonColor=false
fu.Size=UDim2.fromScale(1,1)
fu.BackgroundColor3=Color3.fromRGB(0,0,0)
fu.BackgroundTransparency=1 fu.BorderSizePixel=0
fu.Visible=false fu.Parent=e8
eh(fu,10)
local function slideCloseAll()
if ff._inboxPanel and ff._inboxPanel.open then ff:ToggleInbox(false)end
if ff._kbPanel and ff._kbPanel.open then ff:ToggleKeybindList(false)end
end
fu.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(fv)
if fv then
ec.open(slideCloseAll)
fu.Visible=true
ef(fu,ee.Med,{BackgroundTransparency=0.5})
else
ec.close(slideCloseAll)
ef(fu,ee.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local fw=ff._inboxPanel and ff._inboxPanel.open
local fx=ff._kbPanel and ff._kbPanel.open
if not fw and not fx then fu.Visible=false end
end)
end
end


function ff.ToggleInbox(fv,fw)
local fx=fv._inboxPanel
if not fx then
local fy=Instance.new"Frame"fy.AnchorPoint=Vector2.new(1,0)
fy.Position=UDim2.new(1,12,0,0)fy.Size=UDim2.new(0,230,1,0)
fy.BackgroundColor3=eB.Bg fy.BorderSizePixel=0
eh(fy,10)fy.Parent=e8 fy.Visible=false
ei(fy,true)
ed:_tag(fy,"BackgroundColor3","Bg")
local fz=Instance.new"TextLabel"fz.BackgroundTransparency=1
fz.Position=UDim2.new(0,12,0,10)fz.Size=UDim2.new(1,-70,0,18)
fz.Font=Enum.Font.GothamBold fz.TextSize=11 fz.TextXAlignment=0
fz.Text="INBOX"fz.Parent=fy
ed:_tag(fz,"TextColor3","Dim")
local fA=Instance.new"TextButton"fA.Text=""
fA.AnchorPoint=Vector2.new(1,0)fA.Position=UDim2.new(1,-10,0,10)
fA.Size=UDim2.new(0,52,0,18)fA.BackgroundColor3=eB.Surface2
fA.BorderSizePixel=0 eh(fA,6)fA.AutoButtonColor=false fA.Parent=fy
ei(fA,true)
ed:_tag(fA,"BackgroundColor3","Surface2")
local fB=Instance.new"TextLabel"fB.BackgroundTransparency=1
fB.Size=UDim2.fromScale(1,1)fB.Font=Enum.Font.GothamBold
fB.TextSize=10 fB.Text="CLEAR"fB.Parent=fA
ed:_tag(fB,"TextColor3","Dim")
local fC=Instance.new"ScrollingFrame"
fC.Position=UDim2.new(0,8,0,34)fC.Size=UDim2.new(1,-16,1,-42)
fC.BackgroundTransparency=1 fC.BorderSizePixel=0
fC.ScrollBarThickness=2 fC.CanvasSize=UDim2.new(0,0,0,0)
fC.AutomaticCanvasSize=Enum.AutomaticSize.Y fC.Parent=fy
ed:_tag(fC,"ScrollBarImageColor3","Surface2")
local fD=Instance.new"UIListLayout"fD.Padding=UDim.new(0,4)
fD.SortOrder=Enum.SortOrder.LayoutOrder fD.Parent=fC
fx={panel=fy,list=fC,open=false}
fv._inboxPanel=fx
local function refresh()
for fE,fF in ipairs(fC:GetChildren())do


if fF:IsA"Frame"or fF:IsA"TextLabel"then pcall(function()fF:Destroy()end)end
end
if#ed._inbox==0 then
local fE=Instance.new"TextLabel"fE.BackgroundTransparency=1
fE.Size=UDim2.new(1,0,0,24)fE.Font=Enum.Font.Gotham
fE.TextSize=11 fE.Text="All caught up."fE.Parent=fC
ed:_tag(fE,"TextColor3","Dim")
return
end
for fE,fF in ipairs(ed._inbox)do
local fG=Instance.new"Frame"
fG.Size=UDim2.new(1,-2,0,44)fG.BackgroundColor3=eB.Surface2
fG.BackgroundTransparency=0.35 fG.BorderSizePixel=0
eh(fG,7)fG.Parent=fC
ed:_tag(fG,"BackgroundColor3","Surface2")
local fH=Instance.new"TextLabel"fH.BackgroundTransparency=1
fH.Position=UDim2.new(0,8,0,4)fH.Size=UDim2.new(1,-52,0,15)
fH.Font=Enum.Font.GothamBold fH.TextSize=11 fH.TextXAlignment=0
fH.TextTruncate=Enum.TextTruncate.AtEnd fH.Text=fF.Title fH.Parent=fG
ed:_tag(fH,"TextColor3","Text")
local fI=Instance.new"TextLabel"fI.BackgroundTransparency=1
fI.Position=UDim2.new(0,8,0,20)fI.Size=UDim2.new(1,-52,0,18)
fI.Font=Enum.Font.Gotham fI.TextSize=11 fI.TextXAlignment=0
fI.TextTruncate=Enum.TextTruncate.AtEnd fI.Text=fF.Content fI.Parent=fG
ed:_tag(fI,"TextColor3","Dim")
local fJ=Instance.new"TextLabel"fJ.BackgroundTransparency=1
fJ.AnchorPoint=Vector2.new(1,0)fJ.Position=UDim2.new(1,-8,0,4)
fJ.Size=UDim2.new(0,40,0,14)fJ.Font=Enum.Font.Code
fJ.TextSize=10 fJ.TextXAlignment=1 fJ.Text=fF.At fJ.Parent=fG
ed:_tag(fJ,"TextColor3","Dim")
end
end
fx.refresh=refresh
fA.MouseButton1Click:Connect(function()
ed._inbox={}
refresh()
pcall(function()e7.Visible=false end)
end)
end
local fy=(fw~=nil)and fw or(not fx.open)
fx.open=fy
if fy then
if fv._kbPanel and fv._kbPanel.open then fv:ToggleKeybindList(false)end
slideShadeSet(true)
fx.refresh()
fx.panel.Visible=true
pcall(function()e7.Visible=false end)
flyTo(fx.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(fx.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not fx.open then fx.panel.Visible=false end
end)
slideShadeSet(fv._kbPanel~=nil and fv._kbPanel.open==true)
end
end


function ff.ToggleKeybindList(fv,fw)
local fx=fv._kbPanel
if not fx then
local fy=Instance.new"Frame"fy.AnchorPoint=Vector2.new(1,0)
fy.Position=UDim2.new(1,12,0,0)fy.Size=UDim2.new(0,210,1,0)
fy.BackgroundColor3=eB.Bg fy.BorderSizePixel=0
eh(fy,10)fy.Parent=e8 fy.Visible=false
ei(fy,true)
ed:_tag(fy,"BackgroundColor3","Bg")
local fz=Instance.new"TextLabel"fz.BackgroundTransparency=1
fz.Position=UDim2.new(0,12,0,10)fz.Size=UDim2.new(1,-24,0,18)
fz.Font=Enum.Font.GothamBold fz.TextSize=11 fz.TextXAlignment=0
fz.Text="KEYBINDS"fz.Parent=fy
ed:_tag(fz,"TextColor3","Dim")
local fA=Instance.new"ScrollingFrame"
fA.Position=UDim2.new(0,8,0,34)fA.Size=UDim2.new(1,-16,1,-42)
fA.BackgroundTransparency=1 fA.BorderSizePixel=0
fA.ScrollBarThickness=2 fA.CanvasSize=UDim2.new(0,0,0,0)
fA.AutomaticCanvasSize=Enum.AutomaticSize.Y fA.Parent=fy
ed:_tag(fA,"ScrollBarImageColor3","Surface2")
local fB=Instance.new"UIListLayout"fB.Padding=UDim.new(0,4)
fB.SortOrder=Enum.SortOrder.LayoutOrder fB.Parent=fA
fx={panel=fy,list=fA,open=false}
fv._kbPanel=fx
local function refresh()
for fC,fD in ipairs(fA:GetChildren())do
if fD:IsA"TextButton"then pcall(function()fD:Destroy()end)end
end
if#fv._keybinds==0 then
local fC=Instance.new"TextLabel"fC.BackgroundTransparency=1
fC.Size=UDim2.new(1,0,0,24)fC.Font=Enum.Font.Gotham
fC.TextSize=11 fC.Text="No keybinds yet"fC.Parent=fA
ed:_tag(fC,"TextColor3","Dim")
return
end
for fC,fD in ipairs(fv._keybinds)do
local fE=Instance.new"TextButton"fE.Text=""
fE.Size=UDim2.new(1,-2,0,30)fE.BackgroundColor3=eB.Surface2
fE.BackgroundTransparency=0.35 fE.BorderSizePixel=0
eh(fE,7)fE.Parent=fA
ed:_tag(fE,"BackgroundColor3","Surface2")
local fF=Instance.new"TextLabel"fF.BackgroundTransparency=1
fF.Position=UDim2.new(0,8,0,0)fF.Size=UDim2.new(1,-70,1,0)
fF.Font=Enum.Font.Gotham fF.TextSize=11 fF.TextXAlignment=0
fF.TextTruncate=Enum.TextTruncate.AtEnd fF.Text=fD.Title fF.Parent=fE
ed:_tag(fF,"TextColor3","Text")
local fG=Instance.new"TextLabel"fG.BackgroundTransparency=1
fG.AnchorPoint=Vector2.new(1,0)fG.Position=UDim2.new(1,-8,0,0)
fG.Size=UDim2.new(0,56,1,0)fG.Font=Enum.Font.Code
fG.TextSize=10 fG.TextXAlignment=1 fG.Text=fD.GetName()fG.Parent=fE
ed:_tag(fG,"TextColor3","Dim")
fE.MouseButton1Click:Connect(function()
ed:_sfx"Click"fD.Rebind()
task.delay(0.2,function()pcall(function()fG.Text=fD.GetName()end)end)
end)
end
end
fx.refresh=refresh
fv._kbPanelRefresh=refresh
end
local fy=(fw~=nil)and fw or(not fx.open)
fx.open=fy
if fy then
if fv._inboxPanel and fv._inboxPanel.open then fv:ToggleInbox(false)end
slideShadeSet(true)
fx.refresh()
fx.panel.Visible=true
flyTo(fx.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(fx.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not fx.open then fx.panel.Visible=false end
end)
slideShadeSet(fv._inboxPanel~=nil and fv._inboxPanel.open==true)
end
end


function ff.Onboarding(fv,fw)
fw=fw or{}
local fx=fw.Steps or fw.Pages or{{Title="Welcome",Content="This is Kronos."}}
local fy=1
local fz=Instance.new"TextButton"fz.Text=""fz.AutoButtonColor=false
fz.Size=UDim2.fromScale(1,1)fz.BackgroundColor3=Color3.fromRGB(0,0,0)
fz.BackgroundTransparency=1 fz.ZIndex=180 fz.Parent=eD
ef(fz,ee.Med,{BackgroundTransparency=0.6})
local fA=Instance.new"CanvasGroup"fA.AnchorPoint=Vector2.new(0.5,0.5)
fA.Position=UDim2.new(0.5,0,0.5,0)fA.Size=UDim2.fromOffset(340,220)
fA.BackgroundColor3=eB.Surface fA.BorderSizePixel=0 fA.GroupTransparency=1
eh(fA,12)fA.Parent=fz
ei(fA,true)
el(fA,12)
eq(fA,0.5,40)
ed:_tag(fA,"BackgroundColor3","Surface")
local fB=Instance.new"UIScale"fB.Scale=0.94 fB.Parent=fA
ef(fA,ee.Med,{GroupTransparency=0})
ef(fB,ee.Spring,{Scale=1})
local fC=Instance.new"TextLabel"fC.BackgroundTransparency=1
fC.Position=UDim2.new(0,20,0,18)fC.Size=UDim2.new(1,-40,0,24)
fC.Font=Enum.Font.GothamBold fC.TextSize=17 fC.TextXAlignment=0 fC.Parent=fA
ed:_tag(fC,"TextColor3","Text")
local fD=Instance.new"TextLabel"fD.BackgroundTransparency=1
fD.Position=UDim2.new(0,20,0,48)fD.Size=UDim2.new(1,-40,0,90)
fD.Font=Enum.Font.Gotham fD.TextSize=13 fC.TextXAlignment=0
fD.TextXAlignment=0 fD.TextYAlignment=0 fD.TextWrapped=true fD.Parent=fA
ed:_tag(fD,"TextColor3","Dim")
local fE=Instance.new"Frame"fE.BackgroundTransparency=1
fE.AnchorPoint=Vector2.new(0,1)fE.Position=UDim2.new(0,20,1,-52)
fE.Size=UDim2.new(0,120,0,10)fE.Parent=fA
local fF=Instance.new"UIListLayout"fF.FillDirection=Enum.FillDirection.Horizontal
fF.Padding=UDim.new(0,6)fF.Parent=fE
local fG={}
for fH=1,#fx do
local fI=Instance.new"Frame"fI.Size=UDim2.fromOffset(8,8)
fI.BorderSizePixel=0 eh(fI,99)fI.Parent=fE
ed:_tag(fI,"BackgroundColor3","Surface2")
fG[fH]=fI
end
local fH,fI,fJ
local function paint()
fC.Text,fD.Text=fx[fy].Title or"",fx[fy].Content or""
for fK,fL in ipairs(fG)do
if fK==fy then ed:_tag(fL,"BackgroundColor3","Accent")
else ed:_tag(fL,"BackgroundColor3","Surface2")end
end
fH.Visible=fy>1
fJ.Text=(fy==#fx)and"FINISH"or"NEXT"
fC.Position=UDim2.new(0,26,0,18)
ef(fC,ee.Fast,{Position=UDim2.new(0,20,0,18)})
end
local fK=Instance.new"Frame"fK.BackgroundTransparency=1
fK.AnchorPoint=Vector2.new(0,1)fK.Position=UDim2.new(0,0,1,-12)
fK.Size=UDim2.new(1,0,0,34)fK.Parent=fA
local fL=Instance.new"UIListLayout"fL.FillDirection=Enum.FillDirection.Horizontal
fL.HorizontalAlignment=Enum.HorizontalAlignment.Right fL.Padding=UDim.new(0,8)fL.Parent=fK
ej(fK,0,0,12,12)
fH=Instance.new"TextButton"fH.Text=""
fH.Size=UDim2.new(0,80,0,30)fH.BackgroundTransparency=1 fH.Parent=fK
local fM=Instance.new"TextLabel"fM.BackgroundTransparency=1
fM.Size=UDim2.fromScale(1,1)fM.Font=Enum.Font.GothamBold
fM.TextSize=12 fM.Text="BACK"fM.Parent=fH
ed:_tag(fM,"TextColor3","Dim")
local fN=Instance.new"TextButton"fN.Text=""
fN.Size=UDim2.new(0,80,0,30)fN.BackgroundTransparency=1 fN.Parent=fK
local fO=Instance.new"TextLabel"fO.BackgroundTransparency=1
fO.Size=UDim2.fromScale(1,1)fO.Font=Enum.Font.Gotham
fO.TextSize=12 fO.Text="Skip"fO.Parent=fN
ed:_tag(fO,"TextColor3","Dim")
fI=Instance.new"TextButton"fI.Text=""
fI.Size=UDim2.new(0,96,0,30)fI.BorderSizePixel=0
eh(fI,7)fI.AutoButtonColor=false fI.Parent=fK
ed:agrad(fI,15)
fJ=Instance.new"TextLabel"fJ.BackgroundTransparency=1
fJ.Size=UDim2.fromScale(1,1)fJ.Font=Enum.Font.GothamBold
fJ.TextSize=12
fJ.Text="NEXT"fJ.Parent=fI
ed:oa(fJ)
local function close()
ef(fA,ee.Fast,{GroupTransparency=1})
ef(fz,ee.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()fz:Destroy()end)end)
eg(fw.OnFinish)
end
fH.MouseButton1Click:Connect(function()
ed:_sfx"Click"fy=math.max(1,fy-1)paint()
end)
fN.MouseButton1Click:Connect(function()close()end)
fI.MouseButton1Click:Connect(function()
ed:_sfx"Click"
if fy>=#fx then close()else fy+=1 paint()end
end)
paint()
end



function ff.Tab(fv,fw)
return d4({
Window=ff,opts=ew,Th=eB,pgui=eE,
pages=fe,nav=fb,pill=fd,subLbl=eS,
},fw)
end


function ff.EspPreview(fv,fw)
return d5({Window=ff,Th=eB,main=eH,gui=eD},fw)
end

function ff.SaveConfig(fv,fw)
d3.Save(fv,fw)
end
function ff.LoadConfig(fv,fw)
d3.Load(fv,fw)
end


ff._focusIdx=1
local fv




local function focusables()
local fw=ff._active
if not fw then return{}end
local fx={}
for fy,fz in ipairs(fw.Elements)do
if fz.Frame and fz.Frame.Visible and fz.Frame.Parent then
local fA,fB=pcall(function()return fz.Frame.AbsoluteSize.Y>4 end)
if fA and fB then table.insert(fx,fz)end
end
end
return fx
end
function ff.FocusMove(fw,fx)
if not fw._visible then return end
if fw._palette and fw._palette.open then return end
local fy=focusables()
if#fy==0 then return end
fw._focusIdx=((fw._focusIdx-1+fx)%#fy)+1
local fz=fy[fw._focusIdx]
if not fz or not fz.Frame then return end
if not fv then
fv=Instance.new"UIStroke"fv.Thickness=1.5
fv.Transparency=0.15
ed:_tag(fv,"Color","Accent")
end
pcall(function()
fv.Parent=fz.Frame
local fA=fw._active and fw._active.Page
if fA then
local fB=fz.Frame.AbsolutePosition.Y
local fC=fA.AbsolutePosition.Y
fA.CanvasPosition=Vector2.new(0,math.max(0,fA.CanvasPosition.Y+(fB-fC)-120))
end
end)
ed:_sfx"Hover"
end
function ff.FocusActivate(fw)
if not fw._visible then return end
local fx=focusables()
local fy=fx[fw._focusIdx]
if not fy then return end
fw:_flash(fy.Frame)
if fy._go then pcall(fy._go)end
end


ff._clean=ff._clean or{on=false,idle=6,last=os.clock(),faded=false,edge=nil}
function ff.SetCleanScreen(fw,fx,fy)
fx=fx and true or false
fw._clean.on=fx
if fy then fw._clean.idle=math.clamp(tonumber(fy)or 6,2,60)end
fw._clean.last=os.clock()
if not fx and fw._clean.faded then fw:_cleanRestore()end
if fx then fw:_cleanTouch()end
end
function ff._cleanTouch(fw)fw._clean.last=os.clock()end
function ff._cleanFade(fw)
if fw._clean.faded or not fw._visible or fw._mini then return end
fw._clean.faded=true
ef(eH,ee.Med,{GroupTransparency=0.88})
dimTo(1,ee.Med)
if not fw._clean.edge then
local fx=Instance.new"TextButton"
fx.Name=ad.GetStealthName()
fx.Text=""fx.AnchorPoint=Vector2.new(0,0.5)fx.Position=UDim2.new(0,0,0.5,0)
fx.Size=UDim2.fromOffset(6,120)fx.BackgroundColor3=eB.Accent
fx.BackgroundTransparency=0.35 fx.BorderSizePixel=0 fx.ZIndex=200
eh(fx,99)fx.Parent=eD
ed:_tag(fx,"BackgroundColor3","Accent")
fx.MouseEnter:Connect(function()fw:_cleanRestore()end)
fx.InputBegan:Connect(function(fy)
if fy.UserInputType==Enum.UserInputType.Touch then fw:_cleanRestore()end
end)
fw._clean.edge=fx
else
fw._clean.edge.Visible=true
end
end
function ff._cleanRestore(fw)
if not fw._clean.faded then fw._clean.last=os.clock()return end
fw._clean.faded=false
fw._clean.last=os.clock()
if not fw._visible or fw._mini then return end
ef(eH,ee.Med,{GroupTransparency=0})
dimTo(0.5,ee.Med)
if fw._clean.edge then fw._clean.edge.Visible=false end
ed:_sfx"Hover"
end
ff:Track(et.InputChanged:Connect(function(fw)
if fw.UserInputType~=Enum.UserInputType.MouseMovement
and fw.UserInputType~=Enum.UserInputType.Touch then return end
if ff._clean.on and ff._clean.faded then
local fx=fw.Position
local fy,fz=pcall(function()
local fy,fz=eH.AbsolutePosition,eH.AbsoluteSize
return fx.X>=fy.X-30 and fx.X<=fy.X+fz.X+30
and fx.Y>=fy.Y-30 and fx.Y<=fy.Y+fz.Y+30
end)
if fx.X<=24 then ff:_cleanRestore()return end
if fy and fz then ff:_cleanRestore()return end
end
ff:_cleanTouch()
end))
ff:Track(et.InputBegan:Connect(function(fw)
if fw.UserInputType==Enum.UserInputType.MouseButton1
or fw.UserInputType==Enum.UserInputType.Touch then
if ff._clean.on and ff._clean.faded then ff:_cleanRestore()else ff:_cleanTouch()end
end
end))
task.spawn(function()
while eD.Parent do
task.wait(0.5)
pcall(function()
if ff._clean.on and not ff._clean.faded and ff._visible and not ff._mini then
if os.clock()-ff._clean.last>ff._clean.idle then
ff:_cleanFade()
end
end
end)
end
end)


function ff.SetPerformance(fw,fx)
fx=fx and true or false
ed._perfLow=fx
if fx then ed:SetAcrylic(false)end
pcall(function()
for fy,fz in ipairs(eH:GetDescendants())do
if fz.Name=="_light"or fz.Name=="_toplight"then fz.Visible=not fx end
if fz:IsA"UIShadow"then fz.Enabled=not fx end
end
end)
if not fx and fw._acrylicPref then ed:SetAcrylic(true,ew.Blur or 16)end
end


function ff.ExportString(fw)
return d3.Export(fw)
end
function ff.ImportString(fw,fx)
return d3.Import(fw,fx)
end
function ff.AutoSave(fw,fx,fy,fz)
d3.AutoSave(fw,fx,fy,fz)
end

function ff.SetBadge(fw,fx,fy)
if not fx or not(fx.Btn or fx.Button)then return end
local fz=fx.Btn or fx.Button
local fA=fz:FindFirstChild"_badge"
if not fy or fy==""or fy==0 then
if fA then pcall(function()fA:Destroy()end)end
return
end
if not fA then
fA=Instance.new"Frame"fA.Name="_badge"
fA.AnchorPoint=Vector2.new(1,0.5)fA.Position=UDim2.new(1,-8,0.5,0)
fA.Size=UDim2.new(0,20,0,16)fA.BackgroundColor3=Color3.fromRGB(248,113,113)
fA.BorderSizePixel=0 eh(fA,99)fA.Parent=fz fA.ZIndex=4
local fB=Instance.new"TextLabel"fB.Name="_l"fB.BackgroundTransparency=1
fB.Size=UDim2.fromScale(1,1)fB.Font=Enum.Font.GothamBold
fB.TextSize=10 fB.TextColor3=Color3.fromRGB(255,255,255)fB.Parent=fA
end
pcall(function()
local fB=fA:FindFirstChild"_l"
fB.Text=tostring(fy)
fA.Size=UDim2.new(0,math.clamp(10+string.len(tostring(fy))*7,20,64),0,16)
end)
end

function ff.Debug(fw)
local fx={}
local function log(fy)table.insert(fx,tostring(fy))end
log("version="..tostring(ed.Version).." visible="..tostring(fw._visible))
local fy=(ed._gui and ed._gui.Parent)and 1 or 0
log("hubs="..tostring(fy))
local function box(fz,fA)
local fB,fC=pcall(function()
return fA.." class="..fz.ClassName
.." clip="..tostring(fz.ClipsDescendants)
.." pos="..tostring(fz.AbsolutePosition)
.." size="..tostring(fz.AbsoluteSize)
end)
log(fB and fC or(fA.." ERR"))
end
box(fw._main,"main")
box(fw._body,"body")
box(fw._pages,"pages")
for fz,fA in ipairs(fw._tabs)do
local fB=fA.Page
local fC,fD=pcall(function()
return"page["..fA.Title.."] vis="..tostring(fB.Visible)
.." clip="..tostring(fB.ClipsDescendants)
.." vp="..tostring(fB.AbsoluteSize)
.." canvas="..tostring(fB.AbsoluteCanvasSize)
.." canvPos="..tostring(fB.CanvasPosition)
.." scroll="..tostring(fB.ScrollingEnabled)
end)
log(fC and fD or("page["..tostring(fA.Title).."] ERR"))
pcall(function()
local fE,fF=fB.AbsolutePosition.Y,fB.AbsoluteSize.Y
local fG,fH=0,0
for fI,fJ in ipairs(fA.Elements)do
if fJ.Frame and fJ.Frame.Visible then
fH=fH+1
local fK,fL=fJ.Frame.AbsolutePosition.Y,fJ.Frame.AbsoluteSize.Y
if fK+fL<fE or fK>fE+fF then fG=fG+1 end
end
end
log("  rows="..fH.." outsideViewport="..fG)
end)
end
log"done"
return table.concat(fx,"\n")
end

function ff.Destroy(fw)
if fw._destroyed then return end
fw._destroyed=true
local fx=fw._onCloseCb
fw._onCloseCb=nil
if type(fx)=="function"then task.spawn(function()pcall(fx)end)end
for fy,fz in ipairs(fw._conns)do pcall(function()fz:Disconnect()end)end
fw._conns={}
for fy,fz in pairs(ed.Sound._cache)do pcall(function()fz:Stop()fz:Destroy()end)end
ed.Sound._cache={}
ed:SetAcrylic(false)
if ed._gui==eD then ed._gui=nil end
pcall(function()fi:Destroy()end)
pcall(function()eD:Destroy()end)
pcall(function()eE:Destroy()end)
end

ad.registerUnload(function()
pcall(function()ff:Destroy()end)
end)
af.paintFonts(eD)
aa._lastWindow=ff
return ff
end end function a.V():typeof(__modImpl())local aa=a.cache.V if not aa then aa={c=__modImpl()}a.cache.V=aa end return aa.c end end do local function __modImpl()




return function(aa)
task.defer(function()
local ab=aa:CreateWindow{
Title="Kronos",SubTitle="premiere",Theme="Kronos",
ToggleKey=Enum.KeyCode.RightControl,Acrylic=true,Blur=16,
}
local ac=ab:Tab{Title="Home",Icon="dashboard"}
ac:Banner{Title="Welcome to Kronos",Icon="ghost",
Content="v2.0 modular build: same clean hub, new engine underneath.",
Button="Notes",Callback=function()
ab:Dialog{Title="v2.0 notes",
Content="WindUI-style modules, stealth names, exclusive layers. Nothing else moved.",
Buttons={{Title="Nice"}}}
end}
ac:StatsRow{Stats={
{Label="Version",Value="v2.0",Accent=true},
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
local d3=ae:Log{Title="Console",Lines={"hub loaded"}}
d3:Add"aimbot armed"
local d4=ab:Tab{Title="Visuals",Icon="eye"}
d4:Section"ESP"
local d5
local ec
local ed
d5=ab:EspPreview{Title="Chams preview",
Accent=Color3.fromRGB(110,140,255),Mode="Chams",
OnClose=function()if ec then ec:Set(false,true)end end}
ed=d4:RigPreview{Title="Rig Preview",Mode="Chams"}
ec=d4:Toggle{Title="Show preview",Description="Pops out right, live rig",Value=false,
Callback=function(ee)d5:SetVisible(ee)end}
d4:Toggle{Title="Box ESP",Value=true,Flag="BoxESP",
Callback=function(ee)d5:SetBox(ee)ed:SetBox(ee)end}
d4:Colorpicker{Title="ESP Color",Value=Color3.fromRGB(110,140,255),Flag="ESPColor",
Callback=function(ee)d5:SetAccent(ee)ed:SetAccent(ee)end}
d4:Dropdown{Title="Preview style",
Values={"Chams","Box","Outline","HP bar","Name","Ghost","Noob","Solid"},Value="Chams",
Callback=function(ee)d5:SetMode(ee)ed:SetMode(ee)end}
d4:Slider{Title="Preview health",Min=0,Max=100,Step=1,Value=100,
Callback=function(ee)d5:SetHealth(ee)ed:SetHealth(ee)end}
d4:Dropdown{Title="Chams",Values={"Enemies","Team","NPCs","Chests","Ores"},
Multi=true,Value={"Enemies"},Flag="Chams"}
local ee=ab:Tab{Title="Settings",Icon="settings"}
ee:Profile{Name="kronos_user",Tag="Premium | keyless"}
ee:Section"Interface"
ee:Dropdown{Title="Theme",
Values={"Kronos","Dark","Midnight","Light","Rose","Indigo","Forest","Amber","Ocean","Crimson","Ghost","Cyberpunk","Terminal","Discord","Mono"},
Value="Kronos",Callback=function(ef)ab:SetTheme(ef)end}
ee:Colorpicker{Title="Accent color",Description="Repaints every accent live",
Value=Color3.fromRGB(232,236,245),
Callback=function(ef)ab:SetAccent(ef)end}
ee:Dropdown{Title="Font",Description="Bigger, bolder, yours",
Values={"Gotham+","Gotham","Builder","Arimo","Source","Cartoon","Arcade","SciFi","Fantasy","Highway"},
Value="Gotham+",Callback=function(ef)aa:SetFontPack(ef)end}
ee:Slider{Title="UI scale",Min=70,Max=125,Step=5,Value=100,
Callback=function(ef)ab:SetScale(ef/100)end}
ee:Toggle{Title="Compact mode",Description="Smaller card, tighter lists",Value=false,
Callback=function(ef)ab:SetCompact(ef)end}
ee:Toggle{Title="Focus mode",Description="Hide sidebar, just content",Value=false,
Callback=function(ef)ab:SetFocus(ef)end}
ee:Toggle{Title="Acrylic",Description="Card glass",Value=true,
Callback=function(ef)ab:ToggleAcrylic(ef)end}
ee:Toggle{Title="Transparency",Description="Ghost mode",Value=false,
Callback=function(ef)ab:ToggleTransparency(ef)end}
ee:Toggle{Title="Background",Description="Dim + tint behind the hub",Value=true,
Callback=function(ef)ab:SetBackdrop(ef)end}
ee:Toggle{Title="UI Sounds",Description="Clicks, toggles, notifications",Value=true,
Callback=function(ef)aa.Sound.Enabled=ef end}
ee:Keybind{Title="Panic key",Value=Enum.KeyCode.F,
Callback=function()ab:SetVisible(false)end}
ee:Keybind{Title="Hide UI key",Description="Rebinds the hide hotkey",
Value=Enum.KeyCode.RightControl,
Callback=function(ef)ab:SetToggleKey(ef)end}
ee:Button{Title="Keybinds panel",Description="Slide-over, click a row to rebind",
Callback=function()ab:ToggleKeybindList()end}
ee:Button{Title="Command palette",Description="Same as Ctrl+K",
Callback=function()ab:TogglePalette(true)end}
ee:Section"Profiles"
ee:Profiles{Title="My profiles"}
ab:Notify{Title="Kronos loaded",Content="Ctrl+K palette | RightControl hide",Duration=5}
aa:RefreshFonts()
end)
end end function a.W():typeof(__modImpl())local aa=a.cache.W if not aa then aa={c=__modImpl()}a.cache.W=aa end return aa.c end end end




local aa=a.a()
local ab=a.b()a.c()a.e()


local ac=a.f()
local ad=a.g()
local ae=a.h()
local af=a.i()
local d3=a.j()
local d4=a.V()

ab.claimUnload()

local d5=aa
d5.Themes=af.Themes
d5.Icons=ac.Icons
d5.IconAlias=ac.IconAlias

d5._tag=function(ec,ed,ee,ef)
return af.tag(ed,ee,ef)
end
d5.agrad=function(ec,ed,ee)
return af.agrad(ed,ee)
end
d5.oa=function(ec,ed)
return af.oa(ed)
end
d5.SetTheme=function(ec,ed)
return af.SetTheme(ed)
end
d5.SetAccent=function(ec,ed)
return af.SetAccent(ed)
end
d5.SetAcrylic=function(ec,ed,ee)
return d3.SetAcrylic(ed,ee)
end
d5.ToggleAcrylic=function(ec,ed)
return d3.ToggleAcrylic(ed)
end
d5._sfx=function(ec,ed)
return ad.sfx(ed)
end
d5.SetFontPack=function(ec,ed)
return ae.SetFontPack(ed)
end
d5.RefreshFonts=function(ec)
return ae.RefreshFonts()
end
d5._paintFonts=function(ec,ed)
return ae.paintFonts(ed)
end
d5.SetMotion=function(ec,ed)
aa.ReducedMotion=not(ed and true or false)
end
d5.SetSharp=function(ec,ed)
return af.SetSharp(ed)
end
d5.Debug=function(ec)
local ed=aa._lastWindow
if ed and ed.Debug then
local ee,ef=pcall(function()return ed:Debug()end)
if ee and ef then print(ef)return ef end
end
return nil
end

d5.CreateWindow=d4


local ec=a.W()
ec(d5)

return d5
