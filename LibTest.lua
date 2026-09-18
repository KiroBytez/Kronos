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




local function applyLock(h,i)
if not h or not h.Parent then return end
setDisabled(h,i)
local j=h:FindFirstChild"_lockbadge"
if i then
if not j then
j=Instance.new"Frame"
j.Name="_lockbadge"
j.AnchorPoint=Vector2.new(0.5,0.5)
j.Position=UDim2.new(0.5,0,0.5,0)
j.Size=UDim2.fromOffset(30,30)
j.BackgroundColor3=Color3.fromRGB(0,0,0)
j.BackgroundTransparency=0.35
j.BorderSizePixel=0
j.ZIndex=10
j.Parent=h
corner(j,99)
local k=Instance.new"ImageLabel"
k.BackgroundTransparency=1
k.Image="rbxassetid://10723434711"
k.ImageColor3=Color3.fromRGB(255,255,255)
k.Size=UDim2.fromOffset(15,15)
k.AnchorPoint=Vector2.new(0.5,0.5)
k.Position=UDim2.fromScale(0.5,0.5)
k.ZIndex=11
k.Parent=j
else
j.Visible=true
end
else
if j then j.Visible=false end
end
return j
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


local function starRow(i,j,k,l,m,n)
k=math.max(1,k or 5)
m=m or 20
local o=Instance.new"Frame"o.BackgroundTransparency=1
o.Size=UDim2.new(1,0,0,m)o.LayoutOrder=j or 1 o.Parent=i
local p=Instance.new"UIListLayout"
p.FillDirection=Enum.FillDirection.Horizontal
p.Padding=UDim.new(0,6)p.Parent=o
local q,r={},n or 0
local s={}
local function paint()
for t,u in ipairs(q)do
local v=t<=r
d(u,e.Hover,{BackgroundColor3=v and l or Color3.fromRGB(45,48,60)})
end
end
function s.Get()return r end
function s.Set(t)
r=math.clamp(math.round(tonumber(t)or 0),0,k)
paint()
end
function s.Nudge()
d(o,TweenInfo.new(0.07),{Position=UDim2.new(0,4,0,0)})
task.delay(0.07,function()
d(o,TweenInfo.new(0.07),{Position=UDim2.new(0,0,0,0)})
end)
end
for t=1,k do
local u=Instance.new"TextButton"u.Text=""
u.Size=UDim2.fromOffset(m,m)
u.BackgroundTransparency=1 u.AutoButtonColor=false u.Parent=o
local v=Instance.new"Frame"
v.AnchorPoint=Vector2.new(0.5,0.5)v.Position=UDim2.fromScale(0.5,0.5)
v.Size=UDim2.fromOffset(m-6,m-6)
v.BackgroundColor3=Color3.fromRGB(45,48,60)
v.BorderSizePixel=0 corner(v,99)v.Parent=u
table.insert(q,v)
u.MouseButton1Click:Connect(function()s.Set(t)end)
end
paint()
return s
end


local function feedbackRow(i,j,k,l)
local m=Instance.new"Frame"m.BackgroundTransparency=1
m.Size=UDim2.new(1,0,0,k or 26)m.LayoutOrder=j or 2 m.Parent=i
local n=Instance.new"TextBox"
n.PlaceholderText=l or"Leave a comment..."
n.PlaceholderColor3=Color3.fromRGB(120,126,142)
n.Text=""n.Font=Enum.Font.Gotham n.TextSize=12
n.Position=UDim2.new(0,0,0,0)n.Size=UDim2.new(1,-40,1,0)
n.BackgroundColor3=Color3.fromRGB(28,30,40)
n.BorderSizePixel=0 corner(n,7)n.ClearTextOnFocus=false n.Parent=m
pad(n,0,0,8,8)
local o=Instance.new"TextButton"o.Text=""
o.AnchorPoint=Vector2.new(1,0)o.Position=UDim2.new(1,0,0,0)
o.Size=UDim2.fromOffset(32,k or 26)
o.BackgroundColor3=Color3.fromRGB(45,48,60)
o.BorderSizePixel=0 corner(o,7)o.AutoButtonColor=false o.Parent=m
local p=Instance.new"TextLabel"p.BackgroundTransparency=1
p.Size=UDim2.fromScale(1,1)p.Font=Enum.Font.GothamBold
p.TextSize=12 p.TextColor3=Color3.fromRGB(235,238,245)
p.Text=">"p.Parent=o
return{frame=m,Box=n,SendBtn=o}
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
applyLock=applyLock,
attachCtx=attachCtx,
starRow=starRow,
feedbackRow=feedbackRow,
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
if type(s)=="string"then s={Title=s}end s=s or{}
local A=s.Open
if A==nil then A=s.DefaultOpen~=false end
local B=Instance.new"Frame"B.BackgroundTransparency=1
B.Size=UDim2.new(1,-4,0,22)B.Parent=r.getParent()
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
if I.Frame and I.Frame.Parent==r.getParent()then
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
J.TextXAlignment=0 J.TextWrapped=true J.Text=B.Text or"Label"J.Parent=A.getParent()
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
X.Size=UDim2.new(1,-4,0,P.Text and 20 or 12)X.Parent=O.getParent()
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
aI=aI or{}
local aQ=aI.Min or(aI.Range and aI.Range[1])or 0
local aR=aI.Max or(aI.Range and aI.Range[2])or 100
local aS=aI.Step or aI.Increment or 1
local aT=aI.Rounding or(aS%1~=0 and 2 or 0)
local aU=aI.Value~=nil and aI.Value or(aI.Default or aQ)
local function fmt(aV)return aT>0 and string.format("%."..aT.."f",aV)or tostring(math.round(aV))end
local aV=aJ(aI.Description and 66 or 56)


local function scrollLock(aW)
local aX=aV:FindFirstAncestorOfClass"ScrollingFrame"
if aX then pcall(function()aX.ScrollingEnabled=not aW end)end
end
aK(aV,aI.Title or"Slider",aI.Description,90,true)
local aW=Instance.new"TextBox"aW.Text=fmt(aU)
aW.Font=Enum.Font.GothamBold aW.TextSize=11
aW.AnchorPoint=Vector2.new(1,0)aW.Position=UDim2.new(1,-12,0,6)
aW.Size=UDim2.new(0,60,0,22)aW.BackgroundColor3=aO.Surface2
aW.BorderSizePixel=0 at(aW,6)
af:_tag(aW,"BackgroundColor3","Surface2")
af:_tag(aW,"TextColor3","Text")
aw(aW,true)
aW.ClearTextOnFocus=false aW.Parent=aV
local aX=Instance.new"TextButton"aX.Text=""aX.AutoButtonColor=false
aX.Position=UDim2.new(0,12,0,aI.Description and 48 or 36)aX.Size=UDim2.new(1,-24,0,6)
aX.BackgroundColor3=aO.Surface2 aX.BorderSizePixel=0
at(aX,99)aX.Parent=aV
af:_tag(aX,"BackgroundColor3","Surface2")
local c=Instance.new"Frame"c.BorderSizePixel=0
c.Size=UDim2.new(0,0,1,0)at(c,99)c.Parent=aX
af:agrad(c,0)
local f=Instance.new"Frame"f.AnchorPoint=Vector2.new(0.5,0.5)
f.Size=UDim2.fromOffset(12,12)f.BackgroundColor3=Color3.fromRGB(255,255,255)
f.BorderSizePixel=0 at(f,99)f.Parent=aX
local g=Instance.new"UIStroke"g.Thickness=1.5
g.Color=aO.Accent g.Transparency=0.35 g.Parent=f
af:_tag(g,"Color","Accent")


local N=ar()
local S,_,aY,aZ=false,false
local function alpha(a_)return math.clamp((a_-aQ)/math.max(1e-6,aR-aQ),0,1)end
local function render(a_)
local a0=alpha(aU)
if a_ then
an(c,am.Fill08,{Size=UDim2.new(a0,0,1,0)})
else

c.Size=UDim2.new(a0,0,1,0)
end
f.Position=UDim2.new(a0,0,0.5,0)
if aW:IsFocused()==false then aW.Text=fmt(aU)end
end
local a_={}
function a_.Set(a0,a1,a2)
a1=math.clamp(tonumber(a1)or aU,aQ,aR)
a1=math.round(a1/aS)*aS
if aT>0 then a1=tonumber(string.format("%."..aT.."f",a1))end
aU=a1 render(not S)
if aI.Flag then af.Flags[aI.Flag]=aU end
if not a2 then as(aI.Callback,aU)as(aI.OnChanged,aU)end
end
function a_.Get(a0)return aU end
function a_.SetMax(a0,a1)aR=a1 a_:Set(aU,true)end
function a_.SetMin(a0,a1)aQ=a1 a_:Set(aU,true)end
render(false)
aW.FocusLost:Connect(function()
local a0=tonumber(aW.Text)
if a0 then a_:Set(a0)else aW.Text=fmt(aU)end
end)
aX.InputBegan:Connect(function(a0)
if aI.Locked then return end
if a0.UserInputType~=Enum.UserInputType.MouseButton1 and a0.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=N then return end
af.CurrentInput,S,_=N,true,a0.UserInputType==Enum.UserInputType.Touch
scrollLock(true)
an(f,am.Hover,{Size=UDim2.fromOffset(16,16)})
local function fromX(a1)
local a2=math.clamp((a1-aX.AbsolutePosition.X)/math.max(1,aX.AbsoluteSize.X),0,1)
a_:Set(aQ+a2*(aR-aQ))
end
fromX(_ and a0.Position.X or aG:GetMouseLocation().X)
if aY then aY:Disconnect()end
aY=aE.RenderStepped:Connect(function()
if not S then return end
if aM._window and aM._window._visible==false then return end
fromX(aG:GetMouseLocation().X)
end)
if aZ then aZ:Disconnect()end
aZ=aG.InputEnded:Connect(function(a1)
if(a1.UserInputType==Enum.UserInputType.MouseButton1 or a1.UserInputType==Enum.UserInputType.Touch)and S then
S=false
if aY then aY:Disconnect()aY=nil end
if aZ then aZ:Disconnect()aZ=nil end
af.CurrentInput=nil
scrollLock(false)
an(f,am.Hover,{Size=UDim2.fromOffset(12,12)})
as(aI.OnRelease,aU)
end
end)
end)
local a0={Title=aI.Title,Frame=aV,Value=aU,Flag=aI.Flag,_handle=a_,
_set=function(a0,a1)a_:Set(a0,a1)end}
return aL(a0)
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
local aS=aJ.Locked==true
local aT=aK(aJ.Description and 50 or 40)
aL(aT,aJ.Title or"Input",nil,200)
local aU=Instance.new"TextBox"
aU.PlaceholderText=aJ.Placeholder or"Type..."aU.PlaceholderColor3=aQ.Dim
aU.Text=aJ.Value or aJ.Default or""
aU.Font=Enum.Font.Gotham aU.TextSize=12
aU.AnchorPoint=Vector2.new(1,0.5)aU.Position=UDim2.new(1,-12,0.5,0)
aU.Size=UDim2.new(0,170,0,28)aU.BackgroundColor3=aQ.Surface2
aU.BorderSizePixel=0 at(aU,7)aU.ClearTextOnFocus=false aU.Parent=aT
aD(aU,4,4,8,8)
aw(aU,true)
af:_tag(aU,"BackgroundColor3","Surface2")
af:_tag(aU,"TextColor3","Text")
aU.Focused:Connect(function()
an(aU,am.Hover,{})
end)
aU.FocusLost:Connect(function(aV)
if aS then return end
if aJ.Flag then af.Flags[aJ.Flag]=aU.Text end
as(aJ.Callback,aU.Text)as(aJ.OnChanged,aU.Text)
end)
local aV={}
function aV.Set(aW,aX)
aU.Text=tostring(aX or"")
end
function aV.Get(aW)return aU.Text end
function aV.SetLocked(aW,aX)
aS=aX and true or false
if aS then pcall(function()aU:ReleaseFocus()end)end
ac.applyLock(aT,aS)
end
function aV.GetLocked(aW)return aS end
return aM{Title=aJ.Title,Frame=aT,_handle=aV}
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
local c=aU.pgui
aV=aV or{}
local f=aV.Values or aV.Options or{}
local g=aV.Multi or aV.MultipleOptions or false
local N=aV.Value or aV.Default or aV.CurrentOption
if not g and type(N)=="table"then N=N[1]end
if g and type(N)~="table"then N=N and{N}or{}end
local S=aW(aV.Description and 50 or 40)S.ClipsDescendants=false
aX(S,aV.Title or"Dropdown",nil,200)
local _=Instance.new"TextButton"_.Text=""
_.AnchorPoint=Vector2.new(1,0.5)_.Position=UDim2.new(1,-12,0.5,0)
_.Size=UDim2.new(0,170,0,28)_.BackgroundColor3=a0.Surface2
_.BorderSizePixel=0 aD(_,7)_.AutoButtonColor=false _.Parent=S
aH(_,true)
am:_tag(_,"BackgroundColor3","Surface2")
local a3=Instance.new"TextLabel"a3.BackgroundTransparency=1
a3.Position=UDim2.new(0,8,0,0)a3.Size=UDim2.new(1,-28,1,0)
a3.Font=Enum.Font.Gotham a3.TextSize=12 a3.TextXAlignment=0
a3.TextTruncate=Enum.TextTruncate.AtEnd a3.Parent=_
a3.ZIndex=2
am:_tag(a3,"TextColor3","Text")
local a4=aL("chevron",13,a0.Dim)
a4.AnchorPoint=Vector2.new(1,0.5)a4.Position=UDim2.new(1,-8,0.5,0)
a4.Parent=_
local function curText()
if g then return(#N==0 and"None"or table.concat(N,", "))end
return tostring(N or"Select...")
end
a3.Text=curText()
local a5,a6,a7,a8,a9,ba=false
local bb={}
function bb.Set(bc,bd,be)
N=bd
if not g and type(N)=="table"then N=N[1]end
a3.Text=curText()
if aV.Flag then am.Flags[aV.Flag]=N end
if not be then aw(aV.Callback,N)aw(aV.OnChanged,N)end
end
function bb.Get(bc)return N end
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
f=bd or{}
closeList()
end
local function renderItems(bc)
if not a7 then return end
for bd,be in ipairs(a7:GetChildren())do
if be:IsA"TextButton"then pcall(function()be:Destroy()end)end
end
local bd={}
for be,bf in ipairs(f)do
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
local bj=g and table.find(N,bg)or N==bg
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
bh.MouseLeave:Connect(function()if not(g and table.find(N,bg)or N==bg)then bh.BackgroundTransparency=1 end end)
bh.MouseButton1Click:Connect(function()
am:_sfx"Click"
if g then
local bk=table.find(N,bg)
if bk then table.remove(N,bk)else table.insert(N,bg)end
bb:Set(N)
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
if not a7 or not S.Parent then return end
local bd,be=S.AbsolutePosition,S.AbsoluteSize
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
a6=af.backdrop(c,closeList)
a7=Instance.new"Frame"
a7.Size=UDim2.new(0,aQ,0,0)a7.BackgroundColor3=a0.Bg
a7.BorderSizePixel=0 aD(a7,8)a7.Parent=c
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
if not S:IsDescendantOf(game)then closeList()return end
if a_._visible==false then closeList()return end
if aZ.Page and aZ.Page.Visible==false then closeList()return end
placeList()
end)
end
_.MouseButton1Click:Connect(function()
am:_sfx"Click"
if a5 then closeList()else openList()end
end)
local bc={Title=aV.Title,Frame=S,Value=N,Flag=aV.Flag,_handle=bb,
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
local a7=aT.Locked==true
local function startRebind()
if a7 then return end
a5=true a4.Text="..."
end
a4.MouseButton1Click:Connect(startRebind)
aX._window:Track(aR.InputBegan:Connect(function(a8,a9)
if a7 then return end
if a5 and a8.UserInputType==Enum.UserInputType.Keyboard then
a5=false a2=a8.KeyCode a4.Text=a2.Name
if aT.Flag then af.Flags[aT.Flag]=a2.Name end
aw(aT.ChangedCallback,a2)aw(aT.OnChanged,a2)
elseif not a5 and not a9 and a8.KeyCode==a2 then
if a0=="Hold"then a6=true end
aw(aT.Callback,a2)
end
end))
aX._window:Track(aR.InputEnded:Connect(function(a8)
if a8.KeyCode==a2 then a6=false end
end))
local a8={
Set=function(a8,a9)
if type(a9)=="string"then a9=Enum.KeyCode[a9]or a2 end
a2,a4.Text=a9,a9.Name
end,
Get=function()return a2 end,
GetState=function()return a0=="Hold"and a6 or nil end,
Rebind=startRebind,
SetLocked=function(a8,a9)
a7=a9 and true or false
a5=false
if not a7 then a4.Text=a2.Name end
ac.applyLock(a3,a7)
end,
GetLocked=function()return a7 end,
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
return aW{Title=aT.Title,Frame=a3,_handle=a8}
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
a_(bh,10)bh.Parent=a8.getParent()
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
bo.Size=UDim2.new(1,-4,0,64)bo.Parent=a9.getParent()
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
bx.Size=UDim2.new(1,-4,0,bw*18+8)bx.Parent=bn.getParent()
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
bS.Size=UDim2.new(1,-4,0,130)bS.Parent=bJ.getParent()
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
bN(b3,10)b3.Parent=bV.getParent()
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
cb.Parent=b1.getParent()
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
cj.Parent=b5.getParent()
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
cA.opts or{}local cM=
cA.page
cD=cD or{}
local cN=cD.Values or cD.Options or{"A","B"}
local cO=cD.Value or cD.Default or cN[1]
local cP=Instance.new"Frame"cP.BackgroundTransparency=1
cP.Size=UDim2.new(1,-4,0,#cN*28+26)cP.Parent=cA.getParent()
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
local cK=ac.attachTip local cM=
ad.makeIcon
local cN=ae.cloneref_check(game:GetService"RunService")
local cO=ae.cloneref_check(game:GetService"UserInputService")

return function(cP,cQ)
local cR=cP.row
local cS=cP.titleBlock
local cT=cP.reg local cU=
cP.tab local cV=
cP.Window
local cW=cP.Th local cX=
cP.opts or{}
cQ=cQ or{}
local cY=cQ.Min or 0 local g=cQ.Max or 100 local N=cQ.Step or 1
local S=(cQ.Value and cQ.Value[1])or cQ.Lo or cY
local _=(cQ.Value and cQ.Value[2])or cQ.Hi or g
local cZ=cR(56)
local function scrollLock(c_)
local c0=cZ:FindFirstAncestorOfClass"ScrollingFrame"
if c0 then pcall(function()c0.ScrollingEnabled=not c_ end)end
end
cS(cZ,cQ.Title or"Range",cQ.Description,90,true)
cH(cZ,0.1)
if cQ.Tooltip then cK(cZ,cQ.Tooltip)end
local c_=Instance.new"TextLabel"c_.BackgroundTransparency=1
c_.AnchorPoint=Vector2.new(1,0)c_.Position=UDim2.new(1,-12,0,6)
c_.Size=UDim2.new(0,90,0,18)c_.Font=Enum.Font.Code
c_.TextSize=11 c_.TextXAlignment=1 c_.Parent=cZ
af:_tag(c_,"TextColor3","Dim")
local c0=Instance.new"TextButton"c0.Text=""c0.AutoButtonColor=false
c0.Position=UDim2.new(0,12,0,36)c0.Size=UDim2.new(1,-24,0,6)
c0.BackgroundColor3=cW.Surface2 c0.BorderSizePixel=0 cr(c0,99)c0.Parent=cZ
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
if cQ.Flag then af.Flags[cQ.Flag]={S,_}end
if not c7 then cn(cQ.Callback,{S,_})end
end
function c4.Get(c5)return{S,_}end
render(false)
local c5
c0.InputBegan:Connect(function(c6)
if c6.UserInputType~=Enum.UserInputType.MouseButton1 and c6.UserInputType~=Enum.UserInputType.Touch then return end
local c7=c6.Position.X
local c8=c2.AbsolutePosition.X local c9=c3.AbsolutePosition.X
c5=(math.abs(c7-c8)<math.abs(c7-c9))and 1 or 2
scrollLock(true)
local da;da=cN.RenderStepped:Connect(function()
if not c5 then da:Disconnect()return end
local db=cO:GetMouseLocation().X
local dc=math.clamp((db-c0.AbsolutePosition.X)/math.max(1,c0.AbsoluteSize.X),0,1)
local dd=snap(cY+dc*(g-cY))
if c5==1 then S=math.min(dd,_)else _=math.max(dd,S)end
render(false)
end)
local db;db=cO.InputEnded:Connect(function(dc)
if dc.UserInputType==Enum.UserInputType.MouseButton1 or dc.UserInputType==Enum.UserInputType.Touch then
c5=nil scrollLock(false)
if da then da:Disconnect()end if db then db:Disconnect()end
if cQ.Flag then af.Flags[cQ.Flag]={S,_}end
cn(cQ.Callback,{S,_})cn(cQ.OnRelease,{S,_})
end
end)
end)
local c6={Title=cQ.Title,Frame=cZ,Value={S,_},Flag=cQ.Flag,_handle=c4,
_set=function(c6,c7)c4:Set(c6,c7)end}
return cT(c6)
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
ac.hairline local cM=
ac.pad local cN=
ac.lighting local cO=
ac.ripple
local cP=ac.spotlight
local cQ=ac.attachTip local cR=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cS,cT)
local cW=cS.row
local cX=cS.titleBlock
local cY=cS.reg local cZ=
cS.tab local c_=
cS.Window
local c0=cS.Th local c1=
cS.opts or{}local c2=
cS.page
cT=cT or{}
local c3=math.clamp(cT.Points or 60,10,200)
local c4={}
for c5,c6 in ipairs(cT.Values or{})do table.insert(c4,c6)end
local c5=cW(74)
cX(c5,cT.Title or"Graph",cT.Description,70,true)
cP(c5,0.08)
if cT.Tooltip then cQ(c5,cT.Tooltip)end
local c6=Instance.new"TextLabel"c6.BackgroundTransparency=1
c6.AnchorPoint=Vector2.new(1,0)c6.Position=UDim2.new(1,-12,0,6)
c6.Size=UDim2.new(0,60,0,18)c6.Font=Enum.Font.GothamBold
c6.TextSize=12 c6.TextXAlignment=1 c6.Parent=c5
af:_tag(c6,"TextColor3","Text")
local c7=Instance.new"Frame"c7.BorderSizePixel=0
c7.Position=UDim2.new(0,12,0,28)c7.Size=UDim2.new(1,-24,0,36)
c7.BackgroundColor3=c0.Bg cH(c7,6)c7.ClipsDescendants=true c7.Parent=c5
af:_tag(c7,"BackgroundColor3","Bg")
local c8=Instance.new"Frame"c8.BorderSizePixel=0 c8.Parent=c7
af:agrad(c8,0)
cH(c8,99)
local c9={}
local da={}
local function draw()
for db,dc in ipairs(c9)do pcall(function()dc:Destroy()end)end
c9={}
if#c4==0 then c6.Text="--"return end
local db,dc=math.huge,-math.huge
for dd,g in ipairs(c4)do db=math.min(db,g)dc=math.max(dc,g)end
if dc-db<1e-6 then dc=db+1 end
c6.Text=tostring(math.round(c4[#c4]*10)/10)
local dd=c7.AbsoluteSize.X if dd<10 then dd=200 end local g=
#c4
for N,S in ipairs(c4)do
local _=(S-db)/(dc-db)
local de=Instance.new"Frame"de.BorderSizePixel=0
de.AnchorPoint=Vector2.new(0.5,1)de.Size=UDim2.fromOffset(3,3)
de.Position=UDim2.new((N-1)/math.max(1,c3-1),0,1-_*0.85-0.07,0)
de.BackgroundColor3=c0.Accent cH(de,99)de.Parent=c7
af:_tag(de,"BackgroundColor3","Accent")
table.insert(c9,de)
end
c8.Position=UDim2.new(0,0,1,-2)c8.Size=UDim2.new(1,0,0,2)
end
function da.Push(db,dc)
table.insert(c4,tonumber(dc)or 0)
while#c4>c3 do table.remove(c4,1)end
draw()
end
function da.Set(db,dc)
c4={}
if type(dc)=="table"then for dd,de in ipairs(dc)do table.insert(c4,tonumber(de)or 0)end end
draw()
end
function da.Get(db)return c4 end
da.Frame=c5
task.defer(draw)
return cY{Title=cT.Title,Frame=c5,_handle=da}
end end function a.K():typeof(__modImpl())local aa=a.cache.K if not aa then aa={c=__modImpl()}a.cache.K=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local cH=
ab.T local cP=
ab.tween local cQ=
ac.guid local cR=
ac.spawnCb local cS=
ac.corner local cT=
ac.hairline local cW=
ac.pad local cX=
ac.lighting local cY=
ac.ripple local c0=
ac.spotlight local c2=
ac.attachTip
local c3=ac.mdToRich local c4=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(c5,c6)local c7=
c5.row local c8=
c5.titleBlock
local c9=c5.reg local da=
c5.tab local db=
c5.Window local dc=
c5.Th local dd=
c5.opts or{}local de=
c5.page
if type(c6)=="string"then c6={Text=c6}end c6=c6 or{}
local g=Instance.new"TextLabel"g.BackgroundTransparency=1
g.Size=UDim2.new(1,-4,0,0)g.AutomaticSize=Enum.AutomaticSize.Y
g.Font=Enum.Font.Gotham g.TextSize=c6.Size or 12
g.TextXAlignment=0 g.TextYAlignment=0 g.TextWrapped=true
g.RichText=true g.Text=c3(c6.Text or"")g.Parent=c5.getParent()
af:_tag(g,"TextColor3","Text")
return c9{Title=c6.Title or"Text",Frame=g,_handle=g}
end end function a.L():typeof(__modImpl())local aa=a.cache.L if not aa then aa={c=__modImpl()}a.cache.L=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local c3=
ab.T local c4=
ab.tween local c5=
ac.guid local c6=
ac.spawnCb
local c9=ac.corner
local de=ac.hairline local g=
ac.pad local N=
ac.lighting local S=
ac.ripple local _=
ac.spotlight local df=
ac.attachTip local dg=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dh,di)
local dj=dh.row local dk=
dh.titleBlock
local dl=dh.reg local dm=
dh.tab local dn=
dh.Window
local dp=dh.Th local dq=
dh.opts or{}local dr=
dh.page
di=di or{}
local ds=dj(math.clamp(38+14*#(string.split(di.Text or"print('hi')","\n")),52,160))
local dt=Instance.new"TextLabel"dt.BackgroundTransparency=1
dt.Position=UDim2.new(0,12,0,6)dt.Size=UDim2.new(1,-90,1,-12)
dt.Font=Enum.Font.Code dt.TextSize=12 dt.TextXAlignment=0 dt.TextYAlignment=0
dt.TextWrapped=true dt.TextTruncate=Enum.TextTruncate.AtEnd
dt.Text=di.Text or""dt.Parent=ds
af:_tag(dt,"TextColor3","Text")
local du=Instance.new"TextButton"du.Text=""
du.AnchorPoint=Vector2.new(1,0)du.Position=UDim2.new(1,-10,0,8)
du.Size=UDim2.new(0,56,0,24)du.BackgroundColor3=dp.Surface2
du.BorderSizePixel=0 c9(du,6)du.AutoButtonColor=false du.Parent=ds
de(du,true)
af:_tag(du,"BackgroundColor3","Surface2")
local dv=Instance.new"TextLabel"dv.BackgroundTransparency=1
dv.Size=UDim2.fromScale(1,1)dv.Font=Enum.Font.GothamBold
dv.TextSize=10 dv.Text="COPY"dv.Parent=du
af:_tag(dv,"TextColor3","Dim")
du.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(dt.Text)end end)
dv.Text="COPIED"
task.delay(1.2,function()pcall(function()dv.Text="COPY"end)end)
end)
return dl{Title=di.Title or"Code",Frame=ds,_handle=dt}
end end function a.M():typeof(__modImpl())local aa=a.cache.M if not aa then aa={c=__modImpl()}a.cache.M=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local c9=
ab.T local de=
ab.tween local dg=
ac.guid
local dh=ac.spawnCb
local di=ac.corner
local dj=ac.hairline local dl=
ac.pad local dp=
ac.lighting local dr=
ac.ripple
local ds=ac.spotlight
local dt=ac.attachTip
local du=ac.setDisabled
local dv=ac.attachCtx local dw=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local dx=ae.cloneref_check(game:GetService"UserInputService")

return function(dy,dz)
local dA=dy.row
local dB=dy.titleBlock
local dC=dy.reg local dD=
dy.tab local dE=
dy.Window
local dF=dy.Th local dG=
dy.opts or{}local dH=
dy.page
local dI=dy.pgui
dz=dz or{}
local dJ=dz.Min or 0 local dK=dz.Max or 100 local dL=dz.Step or 1
local dM=dz.Value or dz.Default or dJ
local dN=dA(40)
dB(dN,dz.Title or"Count",dz.Description,130)
ds(dN,0.08)
if dz.Tooltip then dt(dN,dz.Tooltip)end
if dz.ContextMenu then dv(dI,dN,dz.ContextMenu)end
local dO=Instance.new"TextButton"dO.Text=""
dO.AnchorPoint=Vector2.new(1,0.5)dO.Position=UDim2.new(1,-92,0.5,0)
dO.Size=UDim2.fromOffset(28,28)dO.BackgroundColor3=dF.Surface2
dO.BorderSizePixel=0 di(dO,7)dO.AutoButtonColor=false dO.Parent=dN
dj(dO,true)
af:_tag(dO,"BackgroundColor3","Surface2")
local dP=Instance.new"TextLabel"dP.BackgroundTransparency=1 dP.Size=UDim2.fromScale(1,1)
dP.Font=Enum.Font.GothamBold dP.TextSize=14 dP.Text="-"dP.Parent=dO
af:_tag(dP,"TextColor3","Text")
local dQ=Instance.new"TextLabel"dQ.BackgroundTransparency=1
dQ.AnchorPoint=Vector2.new(1,0.5)dQ.Position=UDim2.new(1,-60,0.5,0)
dQ.Size=UDim2.new(0,28,0,20)dQ.Font=Enum.Font.GothamBold
dQ.TextSize=13 dQ.Text=tostring(dM)dQ.Parent=dN
af:_tag(dQ,"TextColor3","Text")
local dR=Instance.new"TextButton"dR.Text=""
dR.AnchorPoint=Vector2.new(1,0.5)dR.Position=UDim2.new(1,-12,0.5,0)
dR.Size=UDim2.fromOffset(28,28)dR.BackgroundColor3=dF.Surface2
dR.BorderSizePixel=0 di(dR,7)dR.AutoButtonColor=false dR.Parent=dN
dj(dR,true)
af:_tag(dR,"BackgroundColor3","Surface2")
local dS=Instance.new"TextLabel"dS.BackgroundTransparency=1 dS.Size=UDim2.fromScale(1,1)
dS.Font=Enum.Font.GothamBold dS.TextSize=14 dS.Text="+"dS.Parent=dR
af:_tag(dS,"TextColor3","Text")
local dT={}
local function render()dQ.Text=tostring(dM)end
function dT.Set(dU,dV,dW)
dM=math.clamp(tonumber(dV)or dM,dJ,dK)
render()
if dz.Flag then af.Flags[dz.Flag]=dM end
if not dW then dh(dz.Callback,dM)dh(dz.OnChanged,dM)end
end
function dT.Get(dU)return dM end
local function hold(dU,dV)
dU.InputBegan:Connect(function(dW)
if dW.UserInputType~=Enum.UserInputType.MouseButton1 and dW.UserInputType~=Enum.UserInputType.Touch then return end
dT:Set(dM+dV*dL)
local dX=os.clock()
task.spawn(function()
while dx:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
if os.clock()-dX<0.35 then task.wait(0.05)
else dT:Set(dM+dV*dL)task.wait(0.08)end
end
end)
end)
end
hold(dO,-1)hold(dR,1)
if dz.Disabled then task.defer(function()pcall(du,dN,true)end)end
local dU={Title=dz.Title,Frame=dN,Value=dM,Flag=dz.Flag,_handle=dT,
_set=function(dU,dV)dT:Set(dU,dV)end,Tooltip=dz.Tooltip}
return dC(dU)
end end function a.N():typeof(__modImpl())local aa=a.cache.N if not aa then aa={c=__modImpl()}a.cache.N=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local dh=
ab.T local di=
ab.tween local dj=
ac.guid
local ds=ac.spawnCb
local dt=ac.corner local du=
ac.hairline local dv=
ac.pad local dw=
ac.lighting local dx=
ac.ripple local dy=
ac.spotlight local dz=
ac.attachTip local dA=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dB,dC)local dF=
dB.row local dH=
dB.titleBlock
local dI=dB.reg local dJ=
dB.tab local dK=
dB.Window
local dL=dB.Th local dM=
dB.opts or{}local dN=
dB.page
dC=dC or{}
local dO=dC.Columns or{"Key","Value"}
local dP=dC.Rows or{}
local dQ=Instance.new"Frame"dQ.BackgroundTransparency=1
dQ.Size=UDim2.new(1,-4,0,30+math.min(6,math.max(1,#dP))*24+8)
dQ.AutomaticSize=Enum.AutomaticSize.Y dQ.Parent=dB.getParent()
local dR=Instance.new"Frame"dR.Size=UDim2.new(1,0,0,22)
dR.BackgroundTransparency=1 dR.Parent=dQ
local dS,dT=1,true
local dU={}
local dV
local function draw()
if dV then pcall(function()dV:Destroy()end)end
dV=Instance.new"Frame"dV.BackgroundTransparency=1
dV.Position=UDim2.new(0,0,0,26)dV.Size=UDim2.new(1,0,0,#dP*24)
dV.Parent=dQ
local dW=Instance.new"UIListLayout"dW.Padding=UDim.new(0,2)dW.Parent=dV
local dX={}
for dY,dZ in ipairs(dP)do table.insert(dX,{i=dY,r=dZ})end
table.sort(dX,function(dY,dZ)
local d_,d0=tostring(dY.r[dS]or""),tostring(dZ.r[dS]or"")
if dT then return d_<d0 else return d_>d0 end
end)
for dY,dZ in ipairs(dX)do
local d_=Instance.new"TextButton"d_.Text=""
d_.Size=UDim2.new(1,0,0,22)d_.BackgroundColor3=dL.Surface
d_.BackgroundTransparency=0.4 d_.BorderSizePixel=0 dt(d_,6)d_.Parent=dV
af:_tag(d_,"BackgroundColor3","Surface")
for d0=1,#dO do
local d1=Instance.new"TextLabel"d1.BackgroundTransparency=1
d1.Position=UDim2.new((d0-1)/#dO,8,0,0)
d1.Size=UDim2.new(1/#dO,-16,1,0)
d1.Font=Enum.Font.Gotham d1.TextSize=11 d1.TextXAlignment=0
d1.TextTruncate=Enum.TextTruncate.AtEnd
d1.Text=tostring(dZ.r[d0]or"")d1.Parent=d_
af:_tag(d1,"TextColor3",d0==1 and"Text"or"Dim")
end
d_.MouseButton1Click:Connect(function()
af:_sfx"Click"ds(dC.OnSelect,dZ.r,dZ.i)
end)
end
end
for dW,dX in ipairs(dO)do
local dY=Instance.new"TextButton"dY.Text=""
dY.Position=UDim2.new((dW-1)/#dO,0,0,0)
dY.Size=UDim2.new(1/#dO,0,1,0)dY.BackgroundTransparency=1 dY.Parent=dR
local dZ=Instance.new"TextLabel"dZ.BackgroundTransparency=1
dZ.Position=UDim2.new(0,8,0,0)dZ.Size=UDim2.new(1,-16,1,0)
dZ.Font=Enum.Font.GothamBold dZ.TextSize=10 dZ.TextXAlignment=0
dZ.Text=string.upper(tostring(dX))..((dS==dW)and(dT and" ^"or" v")or"")dZ.Parent=dY
af:_tag(dZ,"TextColor3","Dim")
local d_=dW
dY.MouseButton1Click:Connect(function()
if dS==d_ then dT=not dT else dS,dT=d_,true end
draw()
for d0,d1 in ipairs(dR:GetChildren())do
if d1:IsA"TextButton"then
local d2=d1:FindFirstChildOfClass"TextLabel"
if d2 then d2.Text=string.upper(tostring(dO[d0]))..((dS==d0)and(dT and" ^"or" v")or"")end
end
end
end)
end
function dU.SetRows(dW,dX)dP=dX or{}draw()end
function dU.GetRows(dW)return dP end
draw()
return dI{Title=dC.Title or"Table",Frame=dQ,_handle=dU}
end end function a.O():typeof(__modImpl())local aa=a.cache.O if not aa then aa={c=__modImpl()}a.cache.O=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local ds=
ab.T local dt=
ab.tween local dA=
ac.guid local dB=
ac.spawnCb
local dC=ac.corner local dI=
ac.hairline local dL=
ac.pad local dN=
ac.lighting local dO=
ac.ripple local dP=
ac.spotlight local dQ=
ac.attachTip local dR=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dS,dT)local dU=
dS.row local dV=
dS.titleBlock
local dW=dS.reg local dX=
dS.tab local dY=
dS.Window local dZ=
dS.Th local d_=
dS.opts or{}local d0=
dS.page
dT=dT or{}
local d1={}
for d2,d3 in ipairs(dT.Items or{})do table.insert(d1,d3)end
local d2=Instance.new"Frame"d2.BackgroundTransparency=1
d2.Size=UDim2.new(1,-4,0,0)d2.AutomaticSize=Enum.AutomaticSize.Y d2.Parent=dS.getParent()
local d3=Instance.new"UIListLayout"d3.Padding=UDim.new(0,2)d3.Parent=d2
local d4={}
local function draw()
for d5,d6 in ipairs(d2:GetChildren())do
if d6:IsA"Frame"then pcall(function()d6:Destroy()end)end
end
if#d1==0 then
local d5=Instance.new"TextLabel"d5.BackgroundTransparency=1
d5.Size=UDim2.new(1,0,0,22)d5.Font=Enum.Font.Gotham
d5.TextSize=11 d5.TextXAlignment=0 d5.Text="No activity yet."d5.Parent=d2
af:_tag(d5,"TextColor3","Dim")
return
end
local d5={info="Accent",ok="Success",warn="Warn",err="Danger"}
for d6,d7 in ipairs(d1)do
local d8=Instance.new"Frame"d8.BackgroundTransparency=1
d8.Size=UDim2.new(1,0,0,30)d8.Parent=d2
local d9=Instance.new"Frame"d9.Position=UDim2.new(0,4,0,8)
d9.Size=UDim2.fromOffset(8,8)d9.BorderSizePixel=0 dC(d9,99)d9.Parent=d8
af:_tag(d9,"BackgroundColor3",d5[d7.Kind or"info"]or"Accent")
local ea=Instance.new"TextLabel"ea.BackgroundTransparency=1
ea.Position=UDim2.new(0,20,0,2)ea.Size=UDim2.new(1,-70,0,16)
ea.Font=Enum.Font.Gotham ea.TextSize=12 ea.TextXAlignment=0
ea.TextTruncate=Enum.TextTruncate.AtEnd ea.Text=tostring(d7.Title or"")ea.Parent=d8
af:_tag(ea,"TextColor3","Text")
local eb=Instance.new"TextLabel"eb.BackgroundTransparency=1
eb.Position=UDim2.new(0,20,0,17)eb.Size=UDim2.new(1,-70,0,12)
eb.Font=Enum.Font.Gotham eb.TextSize=10 eb.TextXAlignment=0
eb.TextTruncate=Enum.TextTruncate.AtEnd
eb.Text=tostring(d7.Sub or"")eb.Parent=d8
af:_tag(eb,"TextColor3","Dim")
local ec=Instance.new"TextLabel"ec.BackgroundTransparency=1
ec.AnchorPoint=Vector2.new(1,0)ec.Position=UDim2.new(1,0,0,6)
ec.Size=UDim2.new(0,60,0,14)ec.Font=Enum.Font.Code
ec.TextSize=10 ec.TextXAlignment=1 ec.Text=tostring(d7.At or"")ec.Parent=d8
af:_tag(ec,"TextColor3","Dim")
end
end
function d4.Add(d5,d6)table.insert(d1,1,d6 or{})while#d1>20 do table.remove(d1)end draw()end
function d4.Clear(d5)d1={}draw()end
d4.Frame=d2
draw()
return dW{Title=dT.Title or"Timeline",Frame=d2,_handle=d4}
end end function a.P():typeof(__modImpl())local aa=a.cache.P if not aa then aa={c=__modImpl()}a.cache.P=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local dC=
ab.T local dR=
ab.tween local dS=
ac.guid local dT=
ac.spawnCb
local dW=ac.corner
local d0=ac.hairline local d1=
ac.pad local d2=
ac.lighting local d3=
ac.ripple local d4=
ac.spotlight local d5=
ac.attachTip
local d6=ac.attachCtx local d7=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")


aa._favs=aa._favs or{}
aa._favRefresh=aa._favRefresh or{}
local function refreshAll()
for d8,d9 in ipairs(aa._favRefresh)do pcall(d9)end
end
if not aa.Pin then
function aa.Pin(d8,d9,ea)
if not d9 or d9==""then return end
for eb,ec in ipairs(aa._favs)do
if ec.label==d9 and ec.tab==d8 then return end
end
table.insert(aa._favs,1,{tab=d8,label=d9,go=ea})
while#aa._favs>24 do table.remove(aa._favs)end
refreshAll()
end
function aa.Unpin(d8,d9)
for ea,eb in ipairs(aa._favs)do
if(not d8 or eb.tab==d8)and(not d9 or eb.label==d9)then
table.remove(aa._favs,ea)
end
end
refreshAll()
end
function aa.IsPinned(d8,d9)
for ea,eb in ipairs(aa._favs)do
if eb.label==d9 and(not d8 or eb.tab==d8)then return true end
end
return false
end
end

return function(d8,d9)local ea=
d8.row local eb=
d8.titleBlock
local ec=d8.reg local ed=
d8.tab
local ee=d8.Window
local ef=d8.Th local eg=
d8.opts or{}local eh=
d8.page
local ei=d8.pgui
d9=d9 or{}
local ej=d9.Limit or 6
local ek=Instance.new"Frame"ek.BackgroundTransparency=1
ek.Size=UDim2.new(1,-4,0,0)ek.AutomaticSize=Enum.AutomaticSize.Y
ek.Parent=d8.getParent()
local el=Instance.new"UIListLayout"el.Padding=UDim.new(0,4)
el.SortOrder=Enum.SortOrder.LayoutOrder el.Parent=ek
local function refresh()
for em,en in ipairs(ek:GetChildren())do
if en:IsA"TextButton"or en:IsA"TextLabel"then pcall(function()en:Destroy()end)end
end
if#aa._favs==0 then
local em=Instance.new"TextLabel"em.BackgroundTransparency=1
em.Size=UDim2.new(1,0,0,24)em.Font=Enum.Font.Gotham
em.TextSize=11 em.TextXAlignment=0 em.Text="Pin controls here with Kronos:Pin()."em.Parent=ek
af:_tag(em,"TextColor3","Dim")
return
end
for em=1,math.min(ej,#aa._favs)do
local en=aa._favs[em]
local eo=Instance.new"TextButton"eo.Text=""
eo.Size=UDim2.new(1,0,0,30)eo.BackgroundColor3=ef.Surface
eo.BackgroundTransparency=0.35 eo.BorderSizePixel=0
dW(eo,7)eo.Parent=ek
d0(eo,true)
af:_tag(eo,"BackgroundColor3","Surface")
local ep=Instance.new"TextLabel"ep.BackgroundTransparency=1
ep.Position=UDim2.new(0,8,0,0)ep.Size=UDim2.new(0,18,1,0)
ep.Font=Enum.Font.GothamBold ep.TextSize=12 ep.Text="*"ep.Parent=eo
af:_tag(ep,"TextColor3","Accent")
local eq=Instance.new"TextLabel"eq.BackgroundTransparency=1
eq.Position=UDim2.new(0,26,0,0)eq.Size=UDim2.new(1,-106,1,0)
eq.Font=Enum.Font.Gotham eq.TextSize=12 eq.TextXAlignment=0
eq.TextTruncate=Enum.TextTruncate.AtEnd eq.Text=en.label eq.Parent=eo
af:_tag(eq,"TextColor3","Text")
local er=Instance.new"TextLabel"er.BackgroundTransparency=1
er.AnchorPoint=Vector2.new(1,0)er.Position=UDim2.new(1,-10,0,0)
er.Size=UDim2.new(0,74,1,0)er.Font=Enum.Font.Gotham
er.TextSize=10 er.TextXAlignment=1 er.Text=en.tab er.Parent=eo
af:_tag(er,"TextColor3","Dim")
eo.MouseButton1Click:Connect(function()
if en.go then af:_sfx"Click"pcall(en.go)
else ee:Notify{Title="Unavailable",Content=en.label,Duration=1.5}end
end)
d6(ei,eo,{{Title="Unpin",Callback=function()
aa.Unpin(en.tab,en.label)
end}})
end
end
table.insert(aa._favRefresh,refresh)
refresh()
return ec{Title=d9.Title or"Favorites",Frame=ek,_handle={Refresh=refresh}}
end end function a.Q():typeof(__modImpl())local aa=a.cache.Q if not aa then aa={c=__modImpl()}a.cache.Q=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local dW=
ab.T local d0=
ab.tween local d6=
ac.guid
local d7=ac.spawnCb
local d8=ac.corner
local d9=ac.hairline local ec=
ac.pad local ee=
ac.lighting local ef=
ac.ripple
local eh=ac.spotlight
local ei=ac.attachTip
local ej=ac.attachCtx local ek=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local el=ae.cloneref_check(game:GetService"Players")

return function(em,en)
local eo=em.row local ep=
em.titleBlock
local eq=em.reg local er=
em.tab local es=
em.Window
local et=em.Th local eu=
em.opts or{}local ev=
em.page
local ew=em.pgui
en=en or{}
local ex=math.clamp(en.Height or 230,140,320)
local ey=eo(ex)
eh(ey,0.06)
if en.Tooltip then ei(ey,en.Tooltip)end
if en.ContextMenu then ej(ew,ey,en.ContextMenu)end
local ez=Instance.new"TextLabel"ez.BackgroundTransparency=1
ez.Position=UDim2.new(0,12,0,6)ez.Size=UDim2.new(1,-60,0,16)
ez.Font=Enum.Font.GothamMedium ez.TextSize=12 ez.TextXAlignment=0
ez.TextTruncate=Enum.TextTruncate.AtEnd
ez.Text=en.Title or"Preview"ez.Parent=ey
af:_tag(ez,"TextColor3","Text")
local eA=Instance.new"Frame"eA.AnchorPoint=Vector2.new(1,0)
eA.Position=UDim2.new(1,-12,0,10)eA.Size=UDim2.fromOffset(8,8)
eA.BorderSizePixel=0 d8(eA,99)eA.Parent=ey
af:_tag(eA,"BackgroundColor3","Success")
local eB=Instance.new"ViewportFrame"eB.BackgroundColor3=et.Bg
eB.BorderSizePixel=0 eB.Position=UDim2.new(0,10,0,28)
eB.Size=UDim2.new(1,-20,1,-36)d8(eB,8)eB.Parent=ey
af:_tag(eB,"BackgroundColor3","Bg")
d9(eB,true)
pcall(function()
eB.LightColor=Color3.fromRGB(235,235,240)
eB.LightDirection=Vector3.new(-0.4,-1,-0.7)
end)
local eC=Instance.new"WorldModel"eC.Parent=eB
local eD=Instance.new"Camera"eD.Parent=eB
eD.CFrame=CFrame.lookAt(Vector3.new(0,4,10),Vector3.new(0,2,0))
eB.CurrentCamera=eD
local eE=Instance.new"Part"eE.Name="_lamp"
eE.Size=Vector3.new(1,1,1)eE.Transparency=1 eE.Anchored=true
eE.CanCollide=false eE.CanQuery=false eE.CanTouch=false
eE.Position=Vector3.new(4,6,6)eE.Parent=eC
local eF=Instance.new"PointLight"eF.Brightness=1.6 eF.Range=40
eF.Color=Color3.fromRGB(255,244,230)eF.Parent=eE
local eG=Instance.new"Part"eG.Name="_lamp2"
eG.Size=Vector3.new(1,1,1)eG.Transparency=1 eG.Anchored=true
eG.CanCollide=false eG.CanQuery=false eG.CanTouch=false
eG.Position=Vector3.new(-5,3,-6)eG.Parent=eC
local eH=Instance.new"PointLight"eH.Brightness=1 eH.Range=40
eH.Color=Color3.fromRGB(140,170,255)eH.Parent=eG
local eI=Instance.new"TextLabel"eI.BackgroundTransparency=1
eI.Size=UDim2.fromScale(1,1)eI.Font=Enum.Font.Gotham
eI.TextSize=12 eI.Text="Summoning avatar..."eI.Parent=eB
af:_tag(eI,"TextColor3","Dim")
local eJ
pcall(function()eJ=el.LocalPlayer end)
local eK=en.Character or en.Preset or(en.UserId and"Player")or"Noob"
local eL=tonumber(en.UserId)or(eJ and eJ.UserId)or 1
if tonumber(eK)then eL,eK=tonumber(eK),"Player"end
local eM
pcall(function()
eM=(en.Rig=="R6")and Enum.HumanoidRigType.R6 or Enum.HumanoidRigType.R15
end)
local eN=en.Zoom or 7.5
local eO=en.Spin~=false
local eP,eQ,eR=0.6,Vector3.new(0,2,0),1.2
local eS={rig=nil,humanoid=nil,desc=nil,tracks={}}
local eT={}
local function aimAt(eU)
eQ=eU+Vector3.new(0,1,0)
eR=1.4
eD.CFrame=CFrame.new(eQ+Vector3.new(2.4,eR,eN),eQ)
eP=math.atan2(2.4,eN)
end
local function applyDesc(eU)
if not eU then return false end
local eV=eS.humanoid
if not eV or not eV.Parent then return false end
local eW=pcall(function()eV:ApplyDescription(eU)end)
if eW then eS.desc=eU end
return eW
end
local function noobDescription()
local eU=Instance.new"HumanoidDescription"
pcall(function()
eU.HeadColor=Color3.fromRGB(245,205,30)
eU.TorsoColor=Color3.fromRGB(13,105,172)
eU.LeftArmColor=Color3.fromRGB(245,205,30)
eU.RightArmColor=Color3.fromRGB(245,205,30)
eU.LeftLegColor=Color3.fromRGB(164,189,71)
eU.RightLegColor=Color3.fromRGB(164,189,71)
eU.Face=48474313
eU.Head,eU.Torso=0,0
eU.LeftArm,eU.RightArm=0,0
eU.LeftLeg,eU.RightLeg=0,0
eU.Shirt,eU.Pants,eU.GraphicTShirt=0,0,0
end)
return eU
end
local function loadModel()
local eU,eV
if eK=="Noob"then
eU=noobDescription()
local eW
pcall(function()eW=Enum.HumanoidRigType.R6 end)
local eX,eY=pcall(function()
if eW then
return el:CreateHumanoidModelFromDescription(eU,eW)
end
return el:CreateHumanoidModelFromDescription(eU)
end)
if not eX then
eX,eY=pcall(function()
return el:CreateHumanoidModelFromDescription(eU)
end)
end
if eX and eY then eV=eY end
else
local eW,eX=pcall(function()
return el:GetHumanoidDescriptionFromUserIdAsync(eL)
end)
if eW and eX then
local eY,eZ=pcall(function()
if eM then
return el:CreateHumanoidModelFromDescription(eX,eM)
end
return el:CreateHumanoidModelFromDescription(eX)
end)
if not eY then
eY,eZ=pcall(function()
return el:CreateHumanoidModelFromDescription(eX)
end)
end
if eY and eZ then eV,eU=eZ,eX end
end
if not eV and eJ then
local eY=eJ.Character
if eY then
local eZ,e_=pcall(function()return eY:Clone()end)
if eZ and e_ then
for e0,e1 in ipairs(e_:GetDescendants())do
pcall(function()
if e1:IsA"Script"or e1:IsA"LocalScript"or e1:IsA"ModuleScript"then
e1:Destroy()
elseif e1:IsA"BasePart"then
e1.Anchored=true e1.CanCollide=false
e1.CanQuery=false e1.CanTouch=false
end
end)
end
eV=e_
if not eU then
pcall(function()eU=el:GetHumanoidDescriptionFromUserIdAsync(eL)end)
end
end
end
end
end
if not eV then
pcall(function()eI.Text="Avatar failed to build."end)
pcall(function()eA.BackgroundColor3=et.Danger end)
return
end
for eW,eX in ipairs(eV:GetDescendants())do
pcall(function()
if eX:IsA"BasePart"then
eX.Anchored=true eX.CanCollide=false
eX.CanQuery=false eX.CanTouch=false
end
end)
end
eV.Parent=eC
eS.rig=eV
eS.humanoid=eV:FindFirstChildOfClass"Humanoid"
if eU then eS.desc=eU end
local eW=eQ
pcall(function()
local eX=eV:FindFirstChild"HumanoidRootPart"
if eX then eW=eX.Position end
end)
aimAt(eW)
pcall(function()eI:Destroy()end)
end
local eU={"Head","Torso","LeftArm","RightArm","LeftLeg","RightLeg"}
function eT.SetColors(eV,eW)
if type(eW)~="table"then return end
local eX=eS.desc
if not eX then return end
if eW.All then
for eY,eZ in ipairs(eU)do
pcall(function()eX[eZ.."Color"]=eW.All end)
end
else
for eY,eZ in ipairs(eU)do
if eW[eZ]then pcall(function()eX[eZ.."Color"]=eW[eZ]end)end
end
end
applyDesc(eX)
if en.Flag then af.Flags[en.Flag]=eW end
d7(en.Callback,eW)d7(en.OnChanged,eW)
end
function eT.SetOutfit(eV,eW)
if type(eW)~="table"then return end
local eX=eS.desc
if not eX then return end
for eY,eZ in pairs(eW)do pcall(function()eX[eY]=eZ end)end
applyDesc(eX)
end
function eT.ApplyDescription(eV,eW)applyDesc(eW)end
function eT.GetDescription(eV)return eS.desc end
function eT.SetZoom(eV,eW)
eN=math.clamp(tonumber(eW)or eN,3,20)
pcall(function()
eD.CFrame=CFrame.new(eQ+Vector3.new(math.sin(eP)*eN,eR,math.cos(eP)*eN),eQ)
end)
end
function eT.SetSpin(eV,eW)eO=eW and true or false end
function eT.SetSource(eV,eW)
if eW=="Player"or eW=="Noob"then eK=eW eT:Refresh()end
end
function eT.PlayAnimation(eV,eW)
if not eW then return end
task.spawn(function()
pcall(function()
for eX,eY in ipairs(eS.tracks)do pcall(function()eY:Stop()eY:Destroy()end)end
eS.tracks={}
local eX=eS.humanoid
local eY=eS.rig
if not eX or not eX.Parent or not eY then return end
eY.Parent=workspace
local eZ=eX:FindFirstChildOfClass"Animator"
if not eZ then
eZ=Instance.new"Animator"eZ.Parent=eX
end
local e_=Instance.new"Animation"
e_.AnimationId="rbxassetid://"..tostring(eW)
local e0=eZ:LoadAnimation(e_)
table.insert(eS.tracks,e0)
eY.Parent=eC
e0:Play()
end)
end)
end
function eT.StopAnimations(eV)
pcall(function()
for eW,eX in ipairs(eS.tracks)do pcall(function()eX:Stop()eX:Destroy()end)end
eS.tracks={}
end)
end
function eT.Refresh(eV)
pcall(function()
if eS.rig then eS.rig:Destroy()end
eS.rig,eS.humanoid,eS.tracks=nil,nil,{}
end)
task.spawn(loadModel)
end
task.spawn(loadModel)
task.spawn(function()
while eB.Parent do
task.wait(0.03)
pcall(function()
if eO and eS.rig and eS.rig.Parent and eD then
eP=eP+0.03*(en.SpinSpeed or 0.6)
eD.CFrame=CFrame.new(
eQ+Vector3.new(math.sin(eP)*eN,eR,math.cos(eP)*eN),eQ)
end
end)
end
end)
local eV={Title=en.Title,Frame=ey,Flag=en.Flag,_handle=eT,
_set=function(eV,eW)
if type(eV)=="table"then eT:SetColors(eV)end
end}
return eq(eV)
end end function a.R():typeof(__modImpl())local aa=a.cache.R if not aa then aa={c=__modImpl()}a.cache.R=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local d7=
ab.T local d8=
ab.tween local d9=
ac.guid
local eh=ac.spawnCb
local ei=ac.corner
local ej=ac.hairline local ek=
ac.pad local el=
ac.lighting
local em=ac.ripple local en=
ac.spotlight local eo=
ac.attachTip
local eq=ac.applyLock local et=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(ev,ew)
local ex=ev.row
local ey=ev.titleBlock
local ez=ev.reg local eA=
ev.tab local eB=
ev.Window
local eC=ev.Th local eD=
ev.opts or{}local eE=
ev.page
ew=ew or{}
local eF=ew.Locked==true
local eG=ew.Buttons or{}
local eH=ew.Image and ew.Image~=""
local eI=ex(ew.Description and 64 or 46)
if#eG>0 then
eI.Size=UDim2.new(1,-4,0,eI.Size.Y.Offset+34)
end
ey(eI,ew.Title or"Paragraph",ew.Description,eH and 160 or 24)
if eH then
local eJ=Instance.new"ImageLabel"
eJ.BackgroundTransparency=1
eJ.AnchorPoint=Vector2.new(1,0)eJ.Position=UDim2.new(1,-12,0,8)
eJ.Size=UDim2.fromOffset(ew.ImageSize or 48,ew.ImageSize or 48)
eJ.Image=ew.Image eJ.ScaleType=Enum.ScaleType.Crop
eJ.Parent=eI
ei(eJ,8)
end
for eJ,eK in ipairs(eG)do
local eL=Instance.new"TextButton"eL.Text=""
eL.Position=UDim2.new(0,12+(eJ-1)*118,1,-30)
eL.Size=UDim2.new(0,110,0,24)eL.BackgroundColor3=eC.Surface2
eL.BorderSizePixel=0 ei(eL,6)eL.AutoButtonColor=false eL.Parent=eI
ej(eL,true)
af:_tag(eL,"BackgroundColor3","Surface2")
local eM=Instance.new"TextLabel"eM.BackgroundTransparency=1
eM.Size=UDim2.fromScale(1,1)eM.Font=Enum.Font.GothamBold
eM.TextSize=11 eM.TextTruncate=Enum.TextTruncate.AtEnd
eM.Text=tostring(eK.Title or eK.Text or"Open")eM.Parent=eL
af:_tag(eM,"TextColor3","Text")
em(eL)
eL.MouseButton1Click:Connect(function()
if eF then return end
af:_sfx"Click"eh(eK.Callback)
end)
end
eq(eI,eF)
local eJ={}
function eJ.SetLocked(eK,eL)
eF=eL and true or false
eq(eI,eF)
end
function eJ.GetLocked(eK)return eF end
return ez{Title=ew.Title,Frame=eI,_handle=eJ}
end end function a.S():typeof(__modImpl())local aa=a.cache.S if not aa then aa={c=__modImpl()}a.cache.S=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local eh=
ab.T local ei=
ab.tween local ej=
ac.guid
local em=ac.spawnCb
local eq=ac.corner
local et=ac.hairline local ev=
ac.pad local ew=
ac.lighting
local ex=ac.ripple
local ey=ac.spotlight
local ez=ac.attachTip
local eC=ac.applyLock
local eE=ac.starRow
local eF=ac.feedbackRow
local eG=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local eH=ae.cloneref_check(game:GetService"Players")

return function(eI,eJ)
local eK=eI.row
local eL=eI.titleBlock
local eM=eI.reg local eN=
eI.tab local eO=
eI.Window
local eP=eI.Th local eQ=
eI.opts or{}local eR=
eI.page
eJ=eJ or{}
local eS=eJ.Locked==true
local eT=eJ.Description and eJ.Description~=""
local eU=(eJ.Image and eJ.Image~="")or eJ.UserId~=nil
local eV=eJ.ButtonText~=nil and eJ.ButtonText~=""
local eW=type(eJ.Rating)=="table"
local eX=eT and 56 or 44
local eY=(eV and 42 or 0)+(eW and 96 or 0)
local eZ=eK(eX+eY)
eL(eZ,eJ.Title or"Card",eJ.Description,90)
ey(eZ,0.08)
if eJ.Tooltip then ez(eZ,eJ.Tooltip)end
local e_=14
if eU then
local e0=Instance.new"Frame"
e0.BackgroundTransparency=1
e0.AnchorPoint=Vector2.new(0,0.5)
e0.Position=UDim2.new(0,10,0,eX/2)
e0.Size=UDim2.fromOffset(34,34)
e0.BorderSizePixel=0 e0.ClipsDescendants=true
e0.Parent=eZ
eq(e0,8)
local e1=Instance.new"ImageLabel"
e1.BackgroundTransparency=1
e1.ScaleType=Enum.ScaleType.Crop
e1.Size=UDim2.fromScale(1,1)
e1.Parent=e0
eq(e1,8)
if eJ.UserId then
task.spawn(function()
local e2,e3=pcall(eH.GetUserThumbnailAsync,eH,
eJ.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
if e2 and e3 and e1.Parent then e1.Image=e3 end
end)
else
e1.Image=eJ.Image
end
e_=54
end
for e0,e1 in ipairs(eZ:GetChildren())do
if e1:IsA"TextLabel"and e1.Position.X.Offset==14 then
e1.Position=UDim2.new(0,e_,e1.Position.Y.Scale,e1.Position.Y.Offset)
end
end
if eJ.Callback then
local e0=eG("chevron",14,eP.Dim)
e0.AnchorPoint=Vector2.new(1,0.5)e0.Position=UDim2.new(1,-14,0,eX/2)
e0.Parent=eZ
local e1=Instance.new"TextButton"e1.Text=""
e1.BackgroundTransparency=1 e1.AutoButtonColor=false
e1.Size=UDim2.new(1,0,0,eX)e1.Parent=eZ
e1.MouseButton1Click:Connect(function()
if eS then return end
af:_sfx"Click"em(eJ.Callback)
end)
end
if eV then
local e0=Instance.new"TextButton"e0.Text=""
e0.Position=UDim2.new(0,12,0,eX+4)
e0.Size=UDim2.new(1,-24,0,30)e0.BackgroundColor3=eP.Surface2
e0.BorderSizePixel=0 eq(e0,7)e0.AutoButtonColor=false e0.Parent=eZ
et(e0,true)
af:_tag(e0,"BackgroundColor3","Surface2")
local e1=Instance.new"TextLabel"e1.BackgroundTransparency=1
e1.Size=UDim2.fromScale(1,1)e1.Font=Enum.Font.GothamBold
e1.TextSize=12
e1.Text=tostring(eJ.ButtonText)e1.Parent=e0
af:_tag(e1,"TextColor3","Text")
ex(e0)
e0.MouseButton1Click:Connect(function()
if eS then return end
af:_sfx"Click"em(eJ.ButtonCallback or eJ.Callback)
end)
end
if eW then
local e0=eJ.Rating
local e1=eX+(eV and 42 or 0)+8
local e2=eE(eZ,0,5,Color3.fromRGB(255,196,64),20,e0.Default or 0)
e2.frame.Position=UDim2.new(0,12,0,e1)
local e3=eF(eZ,0,26,e0.Placeholder or"Leave a comment...")
e3.frame.Position=UDim2.new(0,12,0,e1+24)
e3.frame.Size=UDim2.new(1,-24,0,26)
e3.SendBtn.MouseButton1Click:Connect(function()
if eS then return end
local e4=e2.Get()
if e4<=0 then e2.Nudge()return end
em(e0.Callback,e4,e3.Box.Text)
em(eJ.Callback,e4,e3.Box.Text)
e3.Box.Text=""
e2.Set(e0.Default or 0)
end)
end
eC(eZ,eS)
local e0={}
function e0.SetLocked(e1,e2)
eS=e2 and true or false
eC(eZ,eS)
end
function e0.GetLocked(e1)return eS end
return eM{Title=eJ.Title or"Card",Frame=eZ,_handle=e0}
end end function a.T():typeof(__modImpl())local aa=a.cache.T if not aa then aa={c=__modImpl()}a.cache.T=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local em=
ab.T local eq=
ab.tween local et=
ac.guid
local ew=ac.spawnCb local ex=
ac.corner local ey=
ac.hairline local ez=
ac.pad local eC=
ac.lighting local eE=
ac.ripple
local eF=ac.spotlight
local eG=ac.attachTip
local eH=ac.applyLock
local eI=ac.starRow
local eJ=ac.feedbackRow local eK=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

local function postWebhook(eL,eM,eP)
if not eL or eL==""then return end
task.spawn(function()
pcall(function()
local eR=(syn and syn.request)or http_request or request
if not eR then return end
eR{
Url=eL,
Method="POST",
Headers={["Content-Type"]="application/json"},
Body=game:GetService"HttpService":JSONEncode{
stars=eM,text=tostring(eP or""),
},
}
end)
end)
end

return function(eL,eM)
local eP=eL.row
local eR=eL.titleBlock
local eS=eL.reg local eT=
eL.tab local eU=
eL.Window local eV=
eL.Th local eW=
eL.opts or{}local eX=
eL.page
eM=eM or{}
local eY=eM.Locked==true
local eZ=math.max(1,eM.MaxStars or 5)
local e_=eM.Title and eM.Title~=""
local e0=eP(e_ and 108 or 84)
if e_ then
eR(e0,eM.Title,nil,24)
end
eF(e0,0.08)
if eM.Tooltip then eG(e0,eM.Tooltip)end
local e1=eI(e0,0,eZ,eM.StarColor or Color3.fromRGB(255,196,64),20,eM.Default or 0)
e1.frame.Position=UDim2.new(0,12,0,e_ and 34 or 8)
local e2=eJ(e0,0,26,eM.Placeholder or"Leave a comment...")
e2.frame.Position=UDim2.new(0,12,0,e_ and 60 or 34)
e2.frame.Size=UDim2.new(1,-24,0,26)
local e3=eM.ClearOnSubmit~=false
e2.SendBtn.MouseButton1Click:Connect(function()
if eY then return end
local e4=e1.Get()
if e4<=0 then e1.Nudge()return end
af:_sfx"Click"
ew(eM.Callback,e4,e2.Box.Text)
postWebhook(eM.WebhookUrl,e4,e2.Box.Text)
if e3 then
e2.Box.Text=""
e1.Set(eM.Default or 0)
end
end)
eH(e0,eY)
local e4={}
function e4.Get(e5)return e1.Get(),e2.Box.Text end
function e4.Set(e5,e6,e7)
e1.Set(e6)
if e7~=nil then e2.Box.Text=e7 end
end
function e4.SetLocked(e5,e6)
eY=e6 and true or false
eH(e0,eY)
end
function e4.GetLocked(e5)return eY end
return eS{Title=eM.Title or"Rating",Frame=e0,_handle=e4}
end end function a.U():typeof(__modImpl())local aa=a.cache.U if not aa then aa={c=__modImpl()}a.cache.U=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local ew=
ab.T local eF=
ab.tween local eG=
ac.guid local eH=
ac.spawnCb
local eI=ac.corner
local eJ=ac.hairline local eK=
ac.pad local eL=
ac.lighting local eM=
ac.ripple local eP=
ac.spotlight local eR=
ac.attachTip
local eS=ac.applyLock local eX=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(eY,eZ)
local e_=eY.row local e0=
eY.titleBlock
local e1=eY.reg local e2=
eY.tab local e3=
eY.Window
local e4=eY.Th local e5=
eY.opts or{}local e6=
eY.page
eZ=eZ or{}
local e7=eZ.Locked==true
local e8=eZ.Title or"Info"
local e9=eZ.Items or{}
local fa=eZ.Color
local fb=math.clamp(eZ.Columns or 2,1,4)local
fc, fd, fe=32, 40, 8
local ff=math.ceil(#e9/fb)
local fg=ff>0 and(ff*fd+(ff-1)*fe)or 0
local fh=56+(ff>0 and(8+fg)or 0)+8
local fi=e_(fh)
if fa then
local fj=Instance.new"Frame"fj.BorderSizePixel=0
fj.Position=UDim2.new(0,0,0,14)fj.Size=UDim2.new(0,3,1,-28)
eI(fj,99)fj.BackgroundColor3=fa fj.Parent=fi
end
local fj=Instance.new"TextLabel"fj.BackgroundTransparency=1
fj.Position=UDim2.new(0,14,0,8)fj.Size=UDim2.new(1,-28,0,18)
fj.Font=Enum.Font.GothamBold fj.TextSize=14 fj.TextXAlignment=0
fj.TextTruncate=Enum.TextTruncate.AtEnd fj.Text=e8 fj.Parent=fi
af:_tag(fj,"TextColor3","Text")
if eZ.Description and eZ.Description~=""then
local fk=Instance.new"TextLabel"fk.BackgroundTransparency=1
fk.Position=UDim2.new(0,14,0,28)fk.Size=UDim2.new(1,-28,0,14)
fk.Font=Enum.Font.Gotham fk.TextSize=11 fk.TextXAlignment=0
fk.TextTruncate=Enum.TextTruncate.AtEnd fk.Text=eZ.Description fk.Parent=fi
af:_tag(fk,"TextColor3","Dim")
fc=46
else
fc=30
end
local fk={}
local fl=Instance.new"Frame"fl.BackgroundTransparency=1
fl.Position=UDim2.new(0,12,0,fc+8)
fl.Size=UDim2.new(1,-24,0,fg)fl.Parent=fi
local fm={}
local function build(fn)
for fo,fp in ipairs(fl:GetChildren())do pcall(function()fp:Destroy()end)end
table.clear(fk)
for fo,fp in ipairs(fn)do
local fq,fr=(fo-1)%fb,math.floor((fo-1)/fb)
local fs=Instance.new"Frame"
fs.Position=UDim2.new(fq/fb,fq==0 and 0 or 4,0,fr*(fd+fe))
fs.Size=UDim2.new(1/fb,fb==1 and 0 or-4,0,fd)
fs.BackgroundColor3=e4.Surface2 fs.BorderSizePixel=0
eI(fs,8)fs.Parent=fl
eJ(fs,true)
af:_tag(fs,"BackgroundColor3","Surface2")
local ft=Instance.new"TextLabel"ft.BackgroundTransparency=1
ft.Position=UDim2.new(0,10,0,4)ft.Size=UDim2.new(1,-20,0,12)
ft.Font=Enum.Font.GothamBold ft.TextSize=10 ft.TextXAlignment=0
ft.TextTruncate=Enum.TextTruncate.AtEnd
ft.Text=string.upper(tostring(fp.Label or fp.label or""))ft.Parent=fs
af:_tag(ft,"TextColor3","Dim")
local fu=Instance.new"TextLabel"fu.BackgroundTransparency=1
fu.Position=UDim2.new(0,10,0,18)fu.Size=UDim2.new(1,-20,0,16)
fu.Font=Enum.Font.GothamBold fu.TextSize=13 fu.TextXAlignment=0
fu.TextTruncate=Enum.TextTruncate.AtEnd
fu.Text=tostring(fp.Value or fp.value or"-")fu.Parent=fs
af:_tag(fu,"TextColor3","Text")
fk[tostring(fp.Label or fp.label or"")]=fu
end
end
function fm.SetValue(fn,fo,fp)
local fq=fk[tostring(fo)]
if fq then fq.Text=tostring(fp)end
end
function fm.Set(fn,fo)
e9=fo or{}
build(e9)
end
function fm.Get(fn)return e9 end
function fm.SetLocked(fn,fo)
e7=fo and true or false
eS(fi,e7)
end
function fm.GetLocked(fn)return e7 end
build(e9)
eS(fi,e7)
return e1{Title=e8,Frame=fi,_handle=fm}
end end function a.V():typeof(__modImpl())local aa=a.cache.V if not aa then aa={c=__modImpl()}a.cache.V=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local eI=
ab.T local eJ=
ab.tween local eS=
ac.guid local eX=
ac.spawnCb
local eY=ac.corner local eZ=
ac.hairline
local e_=ac.pad local e1=
ac.lighting local e4=
ac.ripple
local e6=ac.spotlight
local e7=ac.attachTip
local e8=ac.applyLock local e9=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

local fa={
online="Success",Online="Success",
idle="Warn",Idle="Warn",away="Warn",
busy="Danger",offline="Dim",Offline="Dim",
}

return function(fb,fc)
local fd=fb.row
local fe=fb.titleBlock
local ff=fb.reg local fg=
fb.tab local fh=
fb.Window
local fi=fb.Th local fj=
fb.opts or{}local fk=
fb.page
fc=fc or{}
local fl=fc.Locked==true
local fm={}
for fn,fo in ipairs(fc.Users or{})do table.insert(fm,fo)end
local fn=fd(120)
fe(fn,fc.Title or"Active Users",fc.Description,90,true)
e6(fn,0.08)
if fc.Tooltip then e7(fn,fc.Tooltip)end
local fo=Instance.new"ScrollingFrame"
fo.Position=UDim2.new(0,10,0,34)fo.Size=UDim2.new(1,-20,1,-42)
fo.BackgroundTransparency=1 fo.BorderSizePixel=0
fo.ScrollBarThickness=2 fo.CanvasSize=UDim2.new(0,0,0,0)
fo.AutomaticCanvasSize=Enum.AutomaticSize.Y fo.Parent=fn
af:_tag(fo,"ScrollBarImageColor3","Surface2")
local fp=Instance.new"UIListLayout"fp.Padding=UDim.new(0,4)
fp.SortOrder=Enum.SortOrder.LayoutOrder fp.Parent=fo
e_(fo,0,0,2,2)
local fq={}
local function draw()
for fr,fs in ipairs(fo:GetChildren())do
if fs:IsA"Frame"then pcall(function()fs:Destroy()end)end
end
if#fm==0 then
local fr=Instance.new"TextLabel"fr.BackgroundTransparency=1
fr.Size=UDim2.new(1,0,0,22)fr.Font=Enum.Font.Gotham
fr.TextSize=11 fr.Text="Nobody online."fr.Parent=fo
af:_tag(fr,"TextColor3","Dim")
return
end
for fr,fs in ipairs(fm)do
local ft,fu
if type(fs)=="table"then
ft=fs.Name or fs.name or"?"
fu=fs.Status or fs.status or"online"
else
ft,fu=tostring(fs),"online"
end
local fv=Instance.new"Frame"
fv.Size=UDim2.new(1,-2,0,26)fv.BackgroundColor3=fi.Surface2
fv.BackgroundTransparency=0.5 fv.BorderSizePixel=0
eY(fv,7)fv.Parent=fo
af:_tag(fv,"BackgroundColor3","Surface2")
local fw=Instance.new"Frame"
fw.Position=UDim2.new(0,8,0.5,-4)fw.Size=UDim2.fromOffset(8,8)
fw.BorderSizePixel=0 eY(fw,99)fw.Parent=fv
af:_tag(fw,"BackgroundColor3",fa[fu]or"Success")
local fx=Instance.new"TextLabel"fx.BackgroundTransparency=1
fx.Position=UDim2.new(0,24,0,0)fx.Size=UDim2.new(1,-80,1,0)
fx.Font=Enum.Font.Gotham fx.TextSize=12 fx.TextXAlignment=0
fx.TextTruncate=Enum.TextTruncate.AtEnd fx.Text=ft fx.Parent=fv
af:_tag(fx,"TextColor3","Text")
local fy=Instance.new"TextLabel"fy.BackgroundTransparency=1
fy.AnchorPoint=Vector2.new(1,0)fy.Position=UDim2.new(1,-8,0,0)
fy.Size=UDim2.new(0,52,1,0)fy.Font=Enum.Font.Gotham
fy.TextSize=10 fy.TextXAlignment=1 fy.Text=tostring(fu)fy.Parent=fv
af:_tag(fy,"TextColor3","Dim")
end
end
local function fetch()
if type(fc.Fetch)=="function"then
local fr,fs=pcall(fc.Fetch)
if fr and type(fs)=="table"then fm=fs draw()return true end
return false
end
local fr=fc.Service
if type(fr)=="table"and type(fr.GetActiveUsers)=="function"then
local fs,ft=pcall(fr.GetActiveUsers,fr)
if fs and type(ft)=="table"then fm=ft draw()return true end
end
return false
end
function fq.Refresh(fr)
if not fetch()then draw()end
end
function fq.Set(fr,fs)
if type(fs)=="table"then fm=fs draw()end
end
function fq.Get(fr)return fm end
function fq.SetLocked(fr,fs)
fl=fs and true or false
e8(fn,fl)
end
function fq.GetLocked(fr)return fl end
draw()
if(fc.Interval or 0)>0 or fc.Service then
task.spawn(function()
local fr=math.clamp(tonumber(fc.Interval)or 60,5,600)
while fn.Parent do
task.wait(fr)
if not fn.Parent then break end
pcall(function()fq:Refresh()end)
end
end)
end
e8(fn,fl)
return ff{Title=fc.Title or"Active Users",Frame=fn,_handle=fq}
end end function a.W():typeof(__modImpl())local aa=a.cache.W if not aa then aa={c=__modImpl()}a.cache.W=aa end return aa.c end end do local function __modImpl()




local aa={
Section=a.l(),
Label=a.m(),
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
Paragraph=a.S(),
Card=a.T(),
Rating=a.U(),
InfoGrid=a.V(),
ActiveUsersGrid=a.W(),
}

local ab=a.e()

local function attach(ac,ad)
for ae,af in pairs(aa)do
ac[ae]=function(eY,e_)
local e6=af(ad,e_)



if e_ and e_.Locked then
local e7=ad.tab
local e8=e7 and e7.Elements and e7.Elements[#e7.Elements]
if e8 and e8.Frame then
pcall(function()ab.applyLock(e8.Frame,true)end)
end
end
return e6
end
end
end

return{attach=attach,map=aa}end function a.X():typeof(__modImpl())local aa=a.cache.X if not aa then aa={c=__modImpl()}a.cache.X=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.i()
local af=a.g()
local eY=a.d()

local e_=aa
local e6=ab.T
local e7=ab.tween local e8=
ac.spawnCb
local e9=ac.corner
local fa=ac.hairline
local fb=ac.pad
local fc=ac.lighting
local fd=ad.makeIcon
local fe=a.X()

return function(ff,fi)
local fk=ff.Window
local fl=ff.opts or{}
local fm=ff.Th
local fn=ff.pgui
local fo=ff.pages
local fp=ff.nav
local fq=ff.pill
local fr=ff.subLbl
fi=fi or{}
local fs=fi.Title or("Tab "..(#fk._tabs+1))
local ft=fi.Icon or fs

local fu=Instance.new"TextButton"
fu.Text=""
fu.Size=UDim2.new(1,0,0,34)
fu.BackgroundColor3=fm.Surface2
fu.BackgroundTransparency=1
fu.BorderSizePixel=0
e9(fu,8)
fu.LayoutOrder=#fk._tabs+10
fu.AutoButtonColor=false
fu.Parent=fp
fu.ZIndex=2
fu.Visible=true
local fv=#fk._tabs+1
local fw=fd(ft,15,fm.Dim)
fw.AnchorPoint=Vector2.new(0,0.5)
fw.Position=UDim2.new(0,14,0.5,0)
fw.Parent=fu
fw.Visible=true
fw.ZIndex=3
if fw:IsA"TextLabel"then fw.Size=UDim2.new(0,15,0,15)end
local fx=Instance.new"TextLabel"
fx.BackgroundTransparency=1
fx.Position=UDim2.new(0,37,0,0)
fx.Size=UDim2.new(1,-49,1,0)
fx.Font=Enum.Font.GothamMedium
fx.TextSize=13
fx.TextXAlignment=0
fx.TextTruncate=Enum.TextTruncate.AtEnd
fx.Text=fs
fx.Parent=fu
fx.Visible=true
fx.TextTransparency=0
fx.ZIndex=3
ae.tag(fx,"TextColor3","Dim")
fu.MouseEnter:Connect(function()
if fk._active and fk._active.Btn==fu then return end
e7(fu,e6.Hover,{BackgroundTransparency=0.55})
ae.tag(fx,"TextColor3","Text")
end)
fu.MouseLeave:Connect(function()
if fk._active and fk._active.Btn==fu then return end
e7(fu,e6.Hover,{BackgroundTransparency=1})
ae.tag(fx,"TextColor3","Dim")
end)

local fy=Instance.new"ScrollingFrame"
fy.Visible=false
fy.Size=UDim2.fromScale(1,1)
fy.BackgroundTransparency=1
fy.BorderSizePixel=0
fy.ScrollBarThickness=3
fy.ScrollBarImageColor3=fm.Surface2
fy.CanvasSize=UDim2.new(0,0,0,0)
fy.AutomaticCanvasSize=Enum.AutomaticSize.Y
fy.Parent=fo
ae.tag(fy,"ScrollBarImageColor3","Surface2")
local fz=Instance.new"UIListLayout"
fz.Padding=UDim.new(0,8)
fz.SortOrder=Enum.SortOrder.LayoutOrder
fz.Parent=fy
fb(fy,2,8,2,6)




local fA=fy

local fB={Title=fs,Btn=fu,Page=fy,Elements={},_label=fx,_icon=fw}
fB._pl=fz

local fC=fl.SubTitle or fl.Subtitle or"scripthub"

local function setActive(fD)
fk._active=fB
pcall(function()
fr.Text=string.upper(fC).."  /  "..string.upper(fs)
end)
for fE,fF in ipairs(fk._tabs)do
local fG=fF==fB
fF.Page.Visible=fG
local fH=fF._label
fH.TextTransparency=0
e7(fF.Btn,e6.Hover,{BackgroundTransparency=1})
if fG then
ae.tag(fH,"TextColor3","Text")
if fF._icon and fF._icon:IsA"ImageLabel"then
fF._icon.ImageTransparency=0
e7(fF._icon,e6.Hover,{ImageColor3=aa.Theme.Accent})
end
else
ae.tag(fH,"TextColor3","Dim")
if fF._icon and fF._icon:IsA"ImageLabel"then
fF._icon.ImageTransparency=0
e7(fF._icon,e6.Hover,{ImageColor3=aa.Theme.Dim})
end
end
end
e7(fq,e6.Med,{Position=UDim2.new(0,0,0,(fv-1)*38-2)})
if fD then
fy.Position=UDim2.new(0,14,0,0)
e7(fy,e6.Med,{Position=UDim2.new(0,0,0,0)})
local fE=0
for fF,fG in ipairs(fy:GetChildren())do
if fG:IsA"Frame"or fG:IsA"CanvasGroup"then
fE+=1
local fH=math.min(fE*0.02,0.3)
task.delay(fH,function()
if not fG.Parent then return end
local fI=Instance.new"Frame"
fI.Name="_cascade"
fI.Size=UDim2.fromScale(1,1)
fI.BackgroundColor3=fm.Surface2
fI.BackgroundTransparency=0.55
fI.BorderSizePixel=0
e9(fI,10)
fI.Parent=fG
e7(fI,e6.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()fI:Destroy()end)end)
end)
end
end
end
end
fu.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

table.insert(fk._tabs,fB)
if#fk._tabs==1 then
setActive(false)
fq.Position=UDim2.new(0,0,0,-2)
fq.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
fx.TextTransparency=0
if fw:IsA"ImageLabel"then fw.ImageTransparency=0 end
end)
end)

local function row(fD)
local fE=Instance.new"Frame"
fE.Size=UDim2.new(1,-4,0,fD)
fE.BackgroundColor3=fm.Surface
fE.BorderSizePixel=0
local fF=math.clamp((fl.Radius or 12)-2,4,12)
e9(fE,fF)
fc(fE,fF)
fE.Parent=fA
fa(fE,true)
ae.tag(fE,"BackgroundColor3","Surface")
local fG=fE:FindFirstChild"_light"
if fG then fG.Visible=false end
fE.BackgroundTransparency=1
task.delay(#fB.Elements*0.025,function()
e7(fE,e6.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if fG and fG.Parent then fG.Visible=true end end)
end)
return fE
end
local function titleBlock(fD,fE,fF,fG,fH)
fG=fG or 112
local fI=Instance.new"TextLabel"
fI.BackgroundTransparency=1
if fF then
fI.Position=UDim2.new(0,14,0,9)
fI.Size=UDim2.new(1,-fG,0,17)
elseif fH then
fI.Position=UDim2.new(0,14,0,8)
fI.Size=UDim2.new(1,-fG,0,17)
else
fI.Position=UDim2.new(0,14,0,0)
fI.Size=UDim2.new(1,-fG,1,0)
end
fI.Font=Enum.Font.GothamMedium
fI.TextSize=13
fI.TextXAlignment=0
fI.TextTruncate=Enum.TextTruncate.AtEnd
fI.Text=fE
fI.Parent=fD
ae.tag(fI,"TextColor3","Text")
if fF then
local fJ=Instance.new"TextLabel"
fJ.BackgroundTransparency=1
fJ.Position=UDim2.new(0,14,0,30)
fJ.Size=UDim2.new(1,-fG,0,14)
fJ.Font=Enum.Font.Gotham
fJ.TextSize=11
fJ.TextXAlignment=0
fJ.TextTruncate=Enum.TextTruncate.AtEnd
fJ.Text=fF
fJ.Parent=fD
ae.tag(fJ,"TextColor3","Dim")
end
end
local function reg(fD)
table.insert(fB.Elements,fD)
fD._tab=fB
if not fD._go then
fD._go=function()
if fk._activateTab then fk._activateTab(fB,true)end
fk:_flash(fD.Frame)
end
end
if fD.Flag and fD._set then
aa._live[fD.Flag]=aa._live[fD.Flag]or{}
table.insert(aa._live[fD.Flag],fD._set)
if aa.Flags["_loaded_"..fD.Flag]~=nil then
local fE=aa.Flags["_loaded_"..fD.Flag]
aa.Flags["_loaded_"..fD.Flag]=nil
task.defer(function()pcall(fD._set,fE,true)end)
elseif fD.Value~=nil and aa.Flags[fD.Flag]==nil then
aa.Flags[fD.Flag]=fD.Value
end
elseif fD.Flag and fD.Value~=nil and aa.Flags[fD.Flag]==nil then
aa.Flags[fD.Flag]=fD.Value
end
return fD._handle
end

local fD={}
local fE={row=row,titleBlock=titleBlock,reg=reg,tab=fB,Window=fk,Th=fm,opts=fl,page=fy,pgui=fn,
getParent=function()return fA end}
fe.attach(fD,fE)




fB._subtabs={}
fB.SelectedSubTab=nil
local fF,fG
local function selBtn(fH,fI)
if fH.btn then
e7(fH.btn,e6.Hover,{BackgroundTransparency=fI and 0.35 or 1})
local fJ=fH.btn:FindFirstChildOfClass"TextLabel"
if fJ then ae.tag(fJ,"TextColor3",fI and"Text"or"Dim")end
end
if fG and fH.btn and fH.btn.Parent then
pcall(function()
local fJ=fF and fF.AbsolutePosition or Vector2.new(0,0)
local fK,fL=fH.btn.AbsolutePosition,fH.btn.AbsoluteSize
e7(fG,e6.Med,{
Position=UDim2.new(0,fK.X-fJ.X,0,3),
Size=UDim2.new(0,math.max(24,fL.X),0,28),
})
end)
end
end
local function selectSub(fH,fI)
local fJ=fB._subtabs
if#fJ==0 then return end
local fK
if type(fH)=="number"then
fK=math.clamp(fH,1,#fJ)
else
for fL,fM in ipairs(fJ)do
if fM.name==fH then fK=fL break end
end
fK=fK or 1
end
fB.SelectedSubTab=fJ[fK].name
for fL,fM in ipairs(fJ)do
local fN=fL==fK
fM.holder.Visible=fN
if fN then fA=fM.holder end
selBtn(fM,fN)
end
if not fI then
e_:_sfx"Swap"
eY.closeAny()
end
end
fB.SelectSubTab=function(fH,fI)selectSub(fI)end
fB.SubTab=function(fH,fI)
fI=fI or{}
if type(fI)=="string"then fI={Name=fI}end
local fJ=fI.Name or("Sub "..(#fB._subtabs+1))
if#fB._subtabs==0 then


fy.ScrollingEnabled=false
if fz and fz.Parent then pcall(function()fz:Destroy()end)end
fB._pl=nil
for fK,fL in ipairs(fy:GetChildren())do
if fL:IsA"UIPadding"then pcall(function()fL:Destroy()end)end
end
if fz and fz.Parent then pcall(function()fz:Destroy()end)end
fB._pl=nil
fF=Instance.new"ScrollingFrame"
fF.Name="_subbar"
fF.Position=UDim2.new(0,2,0,2)fF.Size=UDim2.new(1,-4,0,36)
fF.BackgroundTransparency=1 fF.BorderSizePixel=0
fF.ScrollingDirection=Enum.ScrollingDirection.X
fF.ScrollBarThickness=0
fF.AutomaticCanvasSize=Enum.AutomaticSize.X
fF.CanvasSize=UDim2.new(0,0,0,0)
fF.Parent=fy
local fK=Instance.new"UIListLayout"
fK.FillDirection=Enum.FillDirection.Horizontal
fK.VerticalAlignment=Enum.VerticalAlignment.Center
fK.Padding=UDim.new(0,6)fK.Parent=fF
fG=Instance.new"Frame"
fG.Name="_subind"
fG.Size=UDim2.new(0,24,0,28)fG.Position=UDim2.new(0,0,0,3)
fG.BackgroundColor3=fm.Surface2 fG.BorderSizePixel=0
e9(fG,8)fG.Parent=fF
fa(fG,true)
ae.tag(fG,"BackgroundColor3","Surface2")
end
local fK=Instance.new"ScrollingFrame"
fK.Name="_subbody"
fK.Position=UDim2.new(0,0,0,44)fK.Size=UDim2.new(1,0,1,-44)
fK.BackgroundTransparency=1 fK.BorderSizePixel=0
fK.ScrollBarThickness=3 fK.CanvasSize=UDim2.new(0,0,0,0)
fK.AutomaticCanvasSize=Enum.AutomaticSize.Y
fK.Visible=false fK.Parent=fy
ae.tag(fK,"ScrollBarImageColor3","Surface2")
local fL=Instance.new"UIListLayout"fL.Padding=UDim.new(0,8)
fL.SortOrder=Enum.SortOrder.LayoutOrder fL.Parent=fK
fb(fK,2,8,2,6)
local fM=Instance.new"TextButton"fM.Text=""
fM.Size=UDim2.new(0,0,0,30)fM.AutomaticSize=Enum.AutomaticSize.X
fM.BackgroundColor3=fm.Surface2 fM.BackgroundTransparency=1
fM.BorderSizePixel=0 e9(fM,8)fM.AutoButtonColor=false fM.Parent=fF
local fN=Instance.new"UIPadding"
fN.PaddingLeft=UDim.new(0,12)fN.PaddingRight=UDim.new(0,12)
fN.Parent=fM
local fO=fd(fI.Icon or fJ,14,fm.Dim)
fO.AnchorPoint=Vector2.new(0,0.5)fO.Position=UDim2.new(0,0,0.5,0)
fO.Parent=fM
if fO:IsA"TextLabel"then fO.Size=UDim2.new(0,14,0,14)end
local fP=Instance.new"TextLabel"fP.BackgroundTransparency=1
fP.Position=UDim2.new(0,20,0,0)fP.Size=UDim2.new(0,0,1,0)
fP.AutomaticSize=Enum.AutomaticSize.X
fP.Font=Enum.Font.GothamMedium fP.TextSize=12 fP.TextXAlignment=0
fP.TextTruncate=Enum.TextTruncate.AtEnd fP.Text=fJ fP.Parent=fM
ae.tag(fP,"TextColor3","Dim")
local fQ={name=fJ,btn=fM,label=fP,holder=fK}
table.insert(fB._subtabs,fQ)
fM.MouseButton1Click:Connect(function()
for fR,fS in ipairs(fB._subtabs)do
if fS==fQ then selectSub(fR)break end
end
end)
if#fB._subtabs==1 then

for fR,fS in ipairs(fy:GetChildren())do
if fS:IsA"GuiObject"and fS~=fF and fS~=fK then
pcall(function()fS.Parent=fK end)
end
end
fA=fK
selectSub(1,true)

task.defer(function()
if fB.SelectedSubTab then selectSub(fB.SelectedSubTab,true)end
end)
end
return setmetatable({_sub=fQ,_tab=fB},{
__index=function(fR,fS)
if fS=="Select"then return function()selectSub(fJ)end end
local fT=fB[fS]
if type(fT)=="function"then
return function(fU,...)return fT(fB,...)end
end
return fT
end,
})
end

fB.Api=fD
fB._window=fk
fB._activate=function(fH)setActive(fH~=false)end
for fH,fI in pairs(fD)do fB[fH]=function(fJ,...)return fI(fB,...)end end
return fB
end end function a.Y():typeof(__modImpl())local aa=a.cache.Y if not aa then aa={c=__modImpl()}a.cache.Y=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.i()
local ae=a.b()

local af=ab.T
local eY=ab.tween
local e_=ac.spawnCb
local e6=ac.corner
local e7=ac.hairline
local e8=ac.lighting
local e9=ac.shadow
local fa=ae.cloneref_check(game:GetService"RunService")
local fb=ae.cloneref_check(game:GetService"Players")

local fc={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(fd,fe)
local ff=fd.Window
local fi=fd.Th
local fk=fd.main
local fl=fd.gui

fe=fe or{}
local fm,fn=fe.Width or 175,fe.Height or 370
local fo=fe.Accent or fi.Accent
if type(fo)=="table"then
fo=Color3.new(fo[1]or 0,fo[2]or 0,fo[3]or 0)
end
local fp=tostring(fe.Mode or"Chams")
if not fc[fp]then fp="Chams"end
local fq,fr,fs,ft=true,true,false,100
local fu
pcall(function()fu=fb.LocalPlayer end)
local fv=fe.Name or((fu and fu.DisplayName)or"Noob")
local fw=(fu and("@"..fu.Name))or""
local fx=Instance.new"Frame"
fx.Name=ae.GetStealthName()
fx.AnchorPoint=Vector2.new(0,0.5)
fx.Size=UDim2.fromOffset(fm,fn)
fx.BackgroundColor3=fi.Surface fx.BorderSizePixel=0
e6(fx,12)fx.Parent=fl fx.Visible=false
e7(fx,true)e8(fx,12)e9(fx,0.5,40)
ad.tag(fx,"BackgroundColor3","Surface")
local fy=Instance.new"UIScale"fy.Scale=0.92 fy.Parent=fx
local function dock()
if not fk or not fk.Parent then return end
local fz=fk.Size.X.Offset
fx.Position=UDim2.new(fk.Position.X.Scale,
fk.Position.X.Offset+fz/2+12,
fk.Position.Y.Scale,fk.Position.Y.Offset)
end
ff:Track(fk:GetPropertyChangedSignal"Position":Connect(dock))
ff:Track(fk:GetPropertyChangedSignal"Size":Connect(dock))
local fz=Instance.new"TextLabel"fz.BackgroundTransparency=1
fz.Position=UDim2.new(0,14,0,0)fz.Size=UDim2.new(1,-48,0,34)
fz.Font=Enum.Font.GothamBold fz.TextSize=14 fz.TextXAlignment=0
fz.TextTruncate=Enum.TextTruncate.AtEnd fz.Text=fe.Title or"Preview"fz.Parent=fx
ad.tag(fz,"TextColor3","Text")
local fA={open=false}
local function setOpen(fB,fC)
fB=fB and true or false
if fB==fA.open and fx.Visible==fB then return end
fA.open=fB
if fB then
dock()
fx.Visible=true
local fD=fx.Position.X.Offset
fx.Position=UDim2.new(fx.Position.X.Scale,fD-24,
fx.Position.Y.Scale,fx.Position.Y.Offset)
eY(fx,af.Med,{Position=UDim2.new(fx.Position.X.Scale,fD,
fx.Position.Y.Scale,fx.Position.Y.Offset)})
eY(fy,af.Spring,{Scale=1})
else
eY(fx,af.Fast,{Position=UDim2.new(fx.Position.X.Scale,
fx.Position.X.Offset-16,fx.Position.Y.Scale,fx.Position.Y.Offset)})
task.delay(0.18,function()
if not fA.open then fx.Visible=false end
end)
if fC then e_(fe.OnClose)end
end
end
local fB=Instance.new"TextButton"fB.Text=""
fB.AnchorPoint=Vector2.new(1,0)fB.Position=UDim2.new(1,-10,0,8)
fB.Size=UDim2.fromOffset(14,14)fB.BackgroundColor3=Color3.fromRGB(255,95,86)
fB.BorderSizePixel=0 fB.AutoButtonColor=false fB.Parent=fx
e6(fB,99)
fB.MouseEnter:Connect(function()
eY(fB,af.Hover,{BackgroundColor3=Color3.fromRGB(215,70,62)})
end)
fB.MouseLeave:Connect(function()
eY(fB,af.Hover,{BackgroundColor3=Color3.fromRGB(255,95,86)})
end)
fB.MouseButton1Click:Connect(function()setOpen(false,true)end)

local fC=Instance.new"ViewportFrame"
fC.Position=UDim2.new(0,10,0,36)fC.Size=UDim2.new(1,-20,1,-48)
fC.BackgroundColor3=fi.Bg fC.BorderSizePixel=0
fC.LightColor=Color3.fromRGB(255,255,255)
fC.LightDirection=Vector3.new(-0.5,-1,-0.6)
fC.Ambient=Color3.fromRGB(150,150,168)
e6(fC,8)fC.Parent=fx
ad.tag(fC,"BackgroundColor3","Bg")
local fD=Instance.new"Frame"fD.BackgroundTransparency=1
fD.Size=UDim2.fromScale(1,1)fD.Parent=fC
local fE={}
local function bracket(fF,fG)
local fH=Instance.new"Frame"fH.BorderSizePixel=0
fH.AnchorPoint=Vector2.new(fF,fG)fH.Position=UDim2.new(fF,0,fG,0)
fH.Size=UDim2.new(0,14,0,2)fH.Parent=fD
ad.tag(fH,"BackgroundColor3","Accent")
local fI=Instance.new"Frame"fI.BorderSizePixel=0
fI.AnchorPoint=Vector2.new(fF,fG)fI.Position=UDim2.new(fF,0,fG,0)
fI.Size=UDim2.new(0,2,0,14)fI.Parent=fD
ad.tag(fI,"BackgroundColor3","Accent")
table.insert(fE,fH)table.insert(fE,fI)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local fF=Instance.new"TextLabel"fF.BackgroundTransparency=1
fF.AnchorPoint=Vector2.new(0.5,0)fF.Position=UDim2.new(0.5,0,0,4)
fF.Size=UDim2.new(1,-16,0,15)fF.Font=Enum.Font.GothamBold
fF.TextSize=11 fF.Text=fv fF.Parent=fD
ad.tag(fF,"TextColor3","Text")
local fG=Instance.new"TextLabel"fG.BackgroundTransparency=1
fG.AnchorPoint=Vector2.new(0.5,0)fG.Position=UDim2.new(0.5,0,0,19)
fG.Size=UDim2.new(1,-16,0,12)fG.Font=Enum.Font.Gotham
fG.TextSize=10 fG.Text=fw fG.Parent=fD
ad.tag(fG,"TextColor3","Dim")
local fH=Instance.new"Frame"fH.BorderSizePixel=0
fH.AnchorPoint=Vector2.new(0,0.5)fH.Position=UDim2.new(0,6,0.5,0)
fH.Size=UDim2.new(0,4,1,-40)fH.BackgroundColor3=fi.Surface2
e6(fH,99)fH.Parent=fD
ad.tag(fH,"BackgroundColor3","Surface2")
local fI=Instance.new"Frame"fI.BorderSizePixel=0
fI.AnchorPoint=Vector2.new(0,1)fI.Position=UDim2.new(0,0,1,0)
fI.Size=UDim2.new(1,0,1,0)fI.BackgroundColor3=fi.Success
e6(fI,99)fI.Parent=fH
ad.tag(fI,"BackgroundColor3","Success")

local fJ=Instance.new"WorldModel"fJ.Parent=fC
local fK=Instance.new"Camera"fK.Parent=fC
fC.CurrentCamera=fK
fK.CFrame=CFrame.new(Vector3.new(0,3.0,9),Vector3.new(0,2.4,0))
local fL,fM,fN={},{},{}
local function part(fO,fP,fQ)
local fR=Instance.new"Part"fR.Name=fO
fR.Size=fP fR.Position=fQ fR.Anchored=true fR.CanCollide=false
fR.TopSurface=Enum.SurfaceType.Smooth
fR.BottomSurface=Enum.SurfaceType.Smooth
fR.Color=Color3.fromRGB(200,200,215)
fR.Material=Enum.Material.Plastic
fR.Parent=fJ
table.insert(fL,fR)
if fO=="Left Arm"or fO=="Right Arm"then fM[fO]=fR end
local fS=Instance.new"SelectionBox"
fS.Adornee=fR fS.LineThickness=0.05
fS.Color3=Color3.fromRGB(255,255,255)
fS.SurfaceTransparency=1 fS.Visible=false
fS.Parent=fR
fN[fR]=fS
return fR
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local fO={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local function paint()
for fP,fQ in ipairs(fL)do
if fQ and fQ.Parent then
if fp=="Noob"then
fQ.Color=fO[fQ.Name]or Color3.fromRGB(200,200,215)
fQ.Material=Enum.Material.Plastic
fQ.Transparency=0
elseif fp=="Ghost"then
fQ.Color=fo
fQ.Material=Enum.Material.ForceField
fQ.Transparency=0
elseif fp=="Solid"or fp=="Box"then
fQ.Color=Color3.fromRGB(200,200,215)
fQ.Material=Enum.Material.Plastic
fQ.Transparency=0
else
fQ.Color=fo
fQ.Material=Enum.Material.Plastic
fQ.Transparency=0
end
local fR=fN[fQ]
if fR then
fR.Visible=fs or fp=="Outline"
fR.Color3=fo
end
end
end
for fP,fQ in ipairs(fE)do
if fQ then fQ.Visible=fq or fp=="Box"end
end
fF.Visible=fr or fp=="Name"
fG.Visible=fF.Visible
fH.Visible=fq or fp=="HP bar"
end
paint()

local fP=0
local fQ={}
for fR,fS in ipairs(fL)do fQ[fS]=fS.Position end
local fR={
["Left Arm"]=Vector3.new(-1,3.9,0),
["Right Arm"]=Vector3.new(1,3.9,0),
}
local fS
fS=fa.RenderStepped:Connect(function(fT)
if not fC.Parent then pcall(function()fS:Disconnect()end)return end
if not fA.open then return end
fP+=fT
local fU=math.sin(fP*2.2)*0.045
local fV=math.sin(fP*2.2)*0.09
for fW,fX in ipairs(fL)do
if fX and fX.Parent and fQ[fX]then
local fY=fR[fX.Name]
if fY then
local fZ=fX.Name=="Left Arm"and 1 or-1
fX.CFrame=CFrame.new(fY)
*CFrame.Angles(fV*fZ,0,0.05*fZ)
*CFrame.new(fQ[fX]-fY+Vector3.new(0,fU,0))
else
fX.Position=fQ[fX]+Vector3.new(0,fU,0)
end
end
end
end)
ff:Track(fS)
function fA.Show(fT)setOpen(true)end
function fA.Hide(fT,fU)setOpen(false,not fU)end
function fA.Toggle(fT)setOpen(not fA.open,not fA.open)end
function fA.SetVisible(fT,fU)
if fU then fT:Show()else fT:Hide(true)end
end
function fA.IsOpen(fT)return fA.open end
function fA.SetAccent(fT,fU)
if type(fU)=="table"then
fU=Color3.new(fU[1]or 0,fU[2]or 0,fU[3]or 0)
end
if typeof(fU)=="Color3"then fo=fU paint()end
end
function fA.SetMode(fT,fU)fp=tostring(fU)if not fc[fp]then fp="Chams"end paint()end
function fA.SetBox(fT,fU)
fq=fU and true or false paint()
end
function fA.SetOutline(fT,fU)
fs=fU and true or false paint()
end
function fA.SetName(fT,fU)
fr=fU and true or false paint()
end
function fA.SetNameText(fT,fU)
local fV=tostring(fU or"")
local fW=string.find(fV,"@")
if fW then
fF.Text=string.sub(fV,1,fW-1)
fG.Text="@"..string.gsub(string.sub(fV,fW+1),"^@","")
else
fF.Text=fV
end
fv=fF.Text
end
function fA.SetHealth(fT,fU)
ft=math.clamp(tonumber(fU)or 100,0,100)
eY(fI,af.Fast,{Size=UDim2.new(1,0,ft/100,0)})
end

aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(fT,fU)
local fV=fT
if type(fV)=="table"then
fV=Color3.new(fV[1]or 0,fV[2]or 0,fV[3]or 0)
end
if typeof(fV)=="Color3"then fo=fV paint()end
end)
if aa.Flags.ESPColor~=nil then
local fT=aa.Flags.ESPColor
if type(fT)=="table"then
fT=Color3.new(fT[1]or 0,fT[2]or 0,fT[3]or 0)
end
if typeof(fT)=="Color3"then fo=fT paint()end
end
return fA
end end function a.Z():typeof(__modImpl())local aa=a.cache.Z if not aa then aa={c=__modImpl()}a.cache.Z=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.b()
local ae=a.f()a.i()a.g()


local af=a.h()
local eY=a.k()
local e_=a.Y()
local e6=a.Z()
local e7=a.d()

local e8=aa
local e9=ab.T
local fa=ab.tween
local fb=ac.spawnCb
local fc=ac.corner
local fd=ac.hairline
local fe=ac.pad
local ff=ac.lighting
local fi=ac.topLight
local fk=ac.shadow
local fl=ac.makeDraggable
local fm=ae.makeIcon
local fn=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(fo)
local fp=fo:FindFirstChild"Notification"
if fp then return fp end
fp=Instance.new"Frame"
fp.Name="Notification"
fp.AnchorPoint=Vector2.new(1,1)
fp.Position=UDim2.new(1,-18,1,-18)
fp.Size=UDim2.new(0,300,1,-36)
fp.BackgroundTransparency=1
fp.Parent=fo
local fq=Instance.new"UIListLayout"
fq.VerticalAlignment=Enum.VerticalAlignment.Bottom
fq.Padding=UDim.new(0,10)
fq.SortOrder=Enum.SortOrder.LayoutOrder
fq.Parent=fp
return fp
end

local function bumpRecent(fo,fp,fq)
if not fp or fp==""then return end
for fr,fs in ipairs(aa._recent)do
if fs.label==fp and fs.tab==fo then table.remove(aa._recent,fr)break end
end
table.insert(aa._recent,1,{tab=fo,label=fp,go=fq})
while#aa._recent>8 do table.remove(aa._recent)end
for fr,fs in ipairs(aa._recentRefresh)do pcall(fs)end
end
aa._bumpRecent=function(fo,fp,fq,fr)
return bumpRecent(fp,fq,fr)
end







local fo={}
local function flyTo(fp,fq,fr,fs)
local ft=fo[fp]
if ft then pcall(function()ft:Cancel()end)end
fo[fp]=nil
local fu=fa(fp,fr or e9.Med,fq)
if not fu then
pcall(function()
for fv,fw in pairs(fq)do fp[fv]=fw end
end)
if fs then fs()end
return nil
end
fo[fp]=fu
if fs then
fu.Completed:Connect(function(fv)
if fo[fp]==fu then
fo[fp]=nil
if fv==Enum.PlaybackState.Completed then fs()end
end
end)
end
return fu
end

return function(fp,fq)
fq=fq or{}
local fr=fq.Title or"Kronos"
local fs=fq.SubTitle or fq.Subtitle or"scripthub"
local ft=fq.ToggleKey or Enum.KeyCode.RightControl
local fu=fq.Acrylic
if fu==nil then fu=true end
if fq.Theme then fp:SetTheme(fq.Theme)end
local fv=fp.Theme
fp:SetAcrylic(fu,fq.Blur or 16)

local fw=ad.GetRoot()
if fp._gui then pcall(function()fp._gui:Destroy()end)end

local fx=Instance.new"ScreenGui"
fx.Name=ad.GetStealthName()fx.ResetOnSpawn=false fx.IgnoreGuiInset=true fx.DisplayOrder=999
fx.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fx)
fx.Parent=fw
fp._gui=fx



local fy=Instance.new"ScreenGui"
fy.Name=ad.GetStealthName()fy.ResetOnSpawn=false fy.IgnoreGuiInset=true fy.DisplayOrder=1000
fy.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fy)
fy.Parent=fw

local fz=Instance.new"Frame"
fz.Name="Dim"fz.Size=UDim2.fromScale(1,1)
fz.BackgroundColor3=Color3.fromRGB(3,4,7)fz.BackgroundTransparency=1
fz.BorderSizePixel=0 fz.Parent=fx


local fA=fq.Background~=false
fz.Visible=fA
local function dimTo(fB,fC)
if not fA then
if fB>=1 then fz.Visible=false end
return
end
fz.Visible=true
fa(fz,fC,{BackgroundTransparency=fB})
end
dimTo(0.5,e9.Slow)


if fq.Ambient~=false then
local fB=Instance.new"Frame"fB.Name="_ambient"
fB.AnchorPoint=Vector2.new(0.5,0.5)fB.Position=UDim2.new(0.5,0,0.5,0)
fB.Size=UDim2.new(1.4,0,1.4,0)fB.BackgroundColor3=Color3.fromRGB(255,255,255)
fB.BackgroundTransparency=0 fB.BorderSizePixel=0 fB.Parent=fz
local fC=Instance.new"UIGradient"fC.Rotation=25
fC.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,fv.Accent),
ColorSequenceKeypoint.new(1,fv.Accent2 or fv.Accent)}
fC.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
fC.Parent=fB
table.insert(e8._gradients,fC)
task.spawn(function()
while fx.Parent do
fa(fC,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not fx.Parent then break end
fa(fC,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local fB=Instance.new"CanvasGroup"
fB.Name="Main"fB.AnchorPoint=Vector2.new(0.5,0.5)
fB.Position=UDim2.new(0.5,0,0.5,0)fB.Size=UDim2.fromOffset(620,440)
fB.BackgroundColor3=fv.Surface
fB.BackgroundTransparency=(fu and not fp._transparent)and 0.08 or 0
fB.GroupTransparency=1 fB.BorderSizePixel=0 fB.Parent=fx
fc(fB,fq.Radius or 12)fd(fB,true)fi(fB)fk(fB,0.5,48)



local fC,fD=1,1
local fE=Instance.new"UIScale"fE.Scale=0.94 fE.Parent=fB
local function baseScale()return fC*fD end





local function brandInto(fF,fG)
if fq.Logo and fq.Logo~=""then
local fH=Instance.new"ImageLabel"fH.BackgroundTransparency=1
fH.AnchorPoint=Vector2.new(0.5,0.5)fH.Position=UDim2.new(0.5,0,0.5,0)
fH.Size=UDim2.new(1,-8,1,-8)fH.Image=fq.Logo
fH.ScaleType=Enum.ScaleType.Fit fH.Parent=fF
fc(fH,8)
if fG then fG.Visible=false end
return fH
end
return nil
end


local function kronosFace(fF,fG,fH,fI)
local fJ=fH or 26
local fK=Instance.new"Frame"fK.Name="_disc"
fK.AnchorPoint=Vector2.new(0.5,0.5)fK.Position=UDim2.new(0.5,0,0.5,0)
fK.Size=UDim2.fromOffset(fJ,fJ)fK.BackgroundColor3=Color3.fromRGB(0,0,0)
fK.BorderSizePixel=0 fK.Parent=fF
local fL=Instance.new"UICorner"fL.CornerRadius=UDim.new(0.5,0)fL.Parent=fK
local fM=Instance.new"UIStroke"fM.Thickness=2
fM.Color=Color3.fromRGB(255,255,255)fM.Transparency=0.12 fM.Parent=fK
pcall(function()
local fN=Instance.new"UIShadow"fN.Color=Color3.fromRGB(255,255,255)
fN.Transparency=0.82 fN.BlurSize=10 fN.Parent=fK
end)
if fG then
fG.AnchorPoint=Vector2.new(0.5,0.5)fG.Position=UDim2.new(0.5,0,0.5,0)
fG.Size=UDim2.fromOffset(fJ,fJ)fG.TextSize=fI or 16
fG.ZIndex=2
end
return fK
end

local function playEntrance()
e8:_sfx"Open"
fa(fB,e9.Slow,{GroupTransparency=0})
fa(fE,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})
end
playEntrance()


local fF=Instance.new"Frame"
fF.Size=UDim2.new(1,-24,0,2)fF.Position=UDim2.new(0,12,0,0)
fF.BackgroundTransparency=1 fF.Parent=fB
local fG=Instance.new"Frame"fG.Size=UDim2.new(0,0,1,0)
fc(fG,99)fG.Parent=fF
e8:agrad(fG,0)
fa(fG,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()fF:Destroy()end)end)


local fH=Instance.new"Frame"
fH.Name="Header"fH.Size=UDim2.new(1,0,0,62)
fH.BackgroundTransparency=1 fH.Parent=fB
fe(fH,14,6,14,14)


local fI=Instance.new"Frame"fI.Name="Mark"
fI.Size=UDim2.fromOffset(36,36)fI.BackgroundColor3=fv.Surface2
fI.BorderSizePixel=0 fc(fI,10)fI.Parent=fH
fd(fI,true)
local fJ=Instance.new"TextLabel"fJ.Size=UDim2.fromScale(1,1)
fJ.BackgroundTransparency=1 fJ.Font=Enum.Font.GothamBlack
fJ.TextSize=18 fp:_tag(fJ,"TextColor3","Text")fJ.Text="K"fJ.Parent=fI
local fK=Instance.new"Frame"fK.Size=UDim2.fromOffset(8,8)
fK.Position=UDim2.new(1,-5,0,-3)fK.BorderSizePixel=0
fp:_tag(fK,"BackgroundColor3","Accent")
fc(fK,99)fK.Parent=fI
brandInto(fI,fJ)
if not fq.Logo or fq.Logo==""then kronosFace(fI,fJ,26,15)end

local fL=Instance.new"TextLabel"fL.BackgroundTransparency=1
fL.Position=UDim2.new(0,48,0,0)fL.Size=UDim2.new(0,230,0,20)
fL.Font=Enum.Font.GothamBold fL.TextSize=15 fL.TextXAlignment=0
fp:_tag(fL,"TextColor3","Text")fL.Text=fr fL.Parent=fH
local fM=Instance.new"TextLabel"fM.BackgroundTransparency=1
fM.Position=UDim2.new(0,48,0,21)fM.Size=UDim2.new(0,230,0,15)
fM.Font=Enum.Font.Gotham fM.TextSize=11 fL.TextXAlignment=0
fM.TextXAlignment=0 fp:_tag(fM,"TextColor3","Dim")
fM.Text=string.upper(fs).."  |  V"..fp.Version fM.Parent=fH


local fN=Instance.new"Frame"
fN.AnchorPoint=Vector2.new(1,0)fN.Position=UDim2.new(1,-64,0,4)
fN.Size=UDim2.new(0,170,0,32)fN.BackgroundColor3=fv.Bg
fN.BorderSizePixel=0 fc(fN,8)fN.Parent=fH
fd(fN,true)
local fO=fm("search",14,fv.Dim)
fO.Position=UDim2.new(0,9,0.5,-7)fO.Parent=fN
local fP=Instance.new"TextBox"fP.PlaceholderText="Search"
fP.PlaceholderColor3=fv.Dim fP.Text=""fP.Font=Enum.Font.GothamBold
fP.TextSize=12 fp:_tag(fP,"TextColor3","Text")
fP.Position=UDim2.new(0,28,0,0)fP.Size=UDim2.new(1,-80,1,0)
fP.BackgroundTransparency=1 fP.ClearTextOnFocus=false fP.Parent=fN
local fQ=Instance.new"TextLabel"fQ.BackgroundTransparency=1
fQ.AnchorPoint=Vector2.new(1,0.5)fQ.Position=UDim2.new(1,-8,0.5,0)
fQ.Size=UDim2.new(0,44,0,18)fQ.Font=Enum.Font.Code fQ.TextSize=11
fp:_tag(fQ,"TextColor3","Text")fQ.Text="Ctrl K"fQ.Parent=fN
fp:_tag(fN,"BackgroundColor3","Bg")


local fR=Instance.new"TextButton"fR.Text=""
fR.AnchorPoint=Vector2.new(1,0)fR.Position=UDim2.new(1,-256,0,4)
fR.Size=UDim2.fromOffset(32,32)fR.BackgroundColor3=fv.Bg
fR.BorderSizePixel=0 fc(fR,8)fR.Parent=fH
fd(fR,true)
fp:_tag(fR,"BackgroundColor3","Bg")
local fS=fm("keyboard",15,fv.Dim)
fS.AnchorPoint=Vector2.new(0.5,0.5)fS.Position=UDim2.new(0.5,0,0.5,0)
fS.Parent=fR
fR.MouseButton1Click:Connect(function()end)

local fT=Instance.new"TextButton"fT.Text=""
fT.AnchorPoint=Vector2.new(1,0)fT.Position=UDim2.new(1,-296,0,4)
fT.Size=UDim2.fromOffset(32,32)fT.BackgroundColor3=fv.Bg
fT.BorderSizePixel=0 fc(fT,8)fT.Parent=fH
fd(fT,true)
fp:_tag(fT,"BackgroundColor3","Bg")
local fU=fm("menu",15,fv.Dim)
fU.AnchorPoint=Vector2.new(0.5,0.5)fU.Position=UDim2.new(0.5,0,0.5,0)
fU.Parent=fT
fT.MouseButton1Click:Connect(function()end)


local fV=Instance.new"Frame"fV.BackgroundTransparency=1
fV.AnchorPoint=Vector2.new(1,0)fV.Position=UDim2.new(1,0,0,4)
fV.Size=UDim2.new(0,56,0,32)fV.Parent=fH
local fW=Instance.new"UIListLayout"fW.FillDirection=Enum.FillDirection.Horizontal
fW.VerticalAlignment=Enum.VerticalAlignment.Center
fW.HorizontalAlignment=Enum.HorizontalAlignment.Center
fW.Padding=UDim.new(0,7)fW.Parent=fV
local function dot(fX,fY)
local fZ=Instance.new"TextButton"fZ.Text=""
fZ.Size=UDim2.fromOffset(12,12)fZ.BackgroundColor3=fX
fZ.BorderSizePixel=0 fc(fZ,99)fZ.AutoButtonColor=false fZ.Parent=fV
fZ.MouseEnter:Connect(function()fa(fZ,e9.Hover,{BackgroundTransparency=0.25})end)
fZ.MouseLeave:Connect(function()fa(fZ,e9.Hover,{BackgroundTransparency=0})end)
return fZ
end
local fX=dot(Color3.fromRGB(39,201,63))
local fY=dot(Color3.fromRGB(255,189,46))
local fZ=dot(Color3.fromRGB(255,95,86))
fZ.MouseButton1Click:Connect(function()end)
fY.MouseButton1Click:Connect(function()end)
fX.MouseButton1Click:Connect(function()end)


local f_=Instance.new"TextButton"f_.Text=""
f_.AnchorPoint=Vector2.new(1,0)f_.Position=UDim2.new(1,-336,0,4)
f_.Size=UDim2.fromOffset(32,32)f_.BackgroundColor3=fv.Bg
f_.BorderSizePixel=0 fc(f_,8)f_.Parent=fH
fd(f_,true)
fp:_tag(f_,"BackgroundColor3","Bg")
local f0=fm("bellring",14,fv.Dim)
f0.AnchorPoint=Vector2.new(0.5,0.5)f0.Position=UDim2.new(0.5,0,0.5,0)
f0.Parent=f_
local f1=Instance.new"Frame"f1.Size=UDim2.fromOffset(8,8)
f1.Position=UDim2.new(1,-7,0,3)f1.BorderSizePixel=0
f1.BackgroundColor3=Color3.fromRGB(248,113,113)
fc(f1,99)f1.Parent=f_ f1.Visible=false
f_.MouseButton1Click:Connect(function()end)

fl(fH,fB)


local f2=Instance.new"Frame"f2.Name="Body"
f2.Position=UDim2.new(0,0,0,62)f2.Size=UDim2.new(1,0,1,-62)
f2.BackgroundTransparency=1 f2.Parent=fB
local f3=Instance.new"UIPadding"f3.PaddingLeft=UDim.new(0,12)
f3.PaddingRight=UDim.new(0,12)f3.PaddingBottom=UDim.new(0,12)f3.Parent=f2

local f4=Instance.new"Frame"f4.Name="Sidebar"
f4.Size=UDim2.new(0,164,1,0)f4.BackgroundColor3=fv.Bg
f4.BackgroundTransparency=(fu and not fp._transparent)and 0.15 or 0
f4.BorderSizePixel=0 fc(f4,10)f4.Parent=f2
fd(f4,true)
fp:_tag(f4,"BackgroundColor3","Bg")
ff(f4,10)
fe(f4,8,8,8,8)

local f5=Instance.new"Frame"f5.Name="Nav"
f5.Size=UDim2.new(1,0,1,0)f5.BackgroundTransparency=1 f5.Parent=f4
local f6=Instance.new"UIListLayout"f6.Padding=UDim.new(0,4)
f6.SortOrder=Enum.SortOrder.LayoutOrder f6.Parent=f5




local f7=Instance.new"Frame"f7.Name="_pill"
f7.Size=UDim2.new(1,0,0,38)f7.Position=UDim2.new(0,0,0,-2)
f7.BackgroundColor3=fv.Surface2 f7.BorderSizePixel=0
f7.ZIndex=0
fc(f7,8)f7.Parent=f4
fd(f7,true)
fp:_tag(f7,"BackgroundColor3","Surface2")

local f8=Instance.new"Frame"f8.Name="Pages"
f8.Position=UDim2.new(0,176,0,0)f8.Size=UDim2.new(1,-176,1,0)
f8.BackgroundTransparency=1 f8.ClipsDescendants=true f8.Parent=f2

local f9={
_gui=fx,_main=fB,_side=f4,_nav=f5,_pages=f8,_pill=f7,
_tabs={},_active=nil,_toggleKey=ft,_visible=true,_keybinds={},
_conns={},_acrylicPref=fu,
}

function f9.Track(ga,gb)table.insert(ga._conns,gb)return gb end
local ga
local gb
local gc,gd
f9._cfgTitle=fr
f9._body=f2

f9._folder="Kronos/"..tostring(fr)
pcall(function()
if makefolder and isfolder and not isfolder"Kronos"then makefolder"Kronos"end
if makefolder and isfolder and not isfolder(f9._folder)then makefolder(f9._folder)end
end)

function f9._activateTab(ge,gf)
if ge and ge._activate then pcall(ge._activate,gf~=false)end
end

function f9._flash(ge,gf)
if not gf or not gf.Parent then return end
local gg=Instance.new"Frame"gg.Name="_flash"
gg.Size=UDim2.fromScale(1,1)gg.BackgroundColor3=fv.Accent
gg.BackgroundTransparency=0.75 gg.BorderSizePixel=0
fc(gg,10)gg.Parent=gf
fa(gg,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()gg:Destroy()end)end)
end

f9:Track(fn.InputBegan:Connect(function(ge,gf)
if gf then return end
if ge.KeyCode==f9._toggleKey then f9:Toggle()end
if ge.KeyCode==Enum.KeyCode.K and fn:IsKeyDown(Enum.KeyCode.LeftControl)then
f9:TogglePalette()
end
if ge.KeyCode==Enum.KeyCode.P and fn:IsKeyDown(Enum.KeyCode.LeftControl)then
f9:TogglePalette()
end
if ge.KeyCode==Enum.KeyCode.Tab and fn:IsKeyDown(Enum.KeyCode.LeftControl)then
local gg=table.find(f9._tabs,f9._active)or 0
local gh=f9._tabs[(gg%#f9._tabs)+1]
if gh then e8:_sfx"Swap"f9._activateTab(gh,true)end
end
end))

fP:GetPropertyChangedSignal"Text":Connect(function()
local ge=string.lower(fP.Text)
for gf,gg in ipairs(f9._tabs)do
local gh=ge==""or string.find(string.lower(gg.Title),ge,1,true)~=nil
for gi,gj in ipairs(gg.Elements)do
local gk
if ge==""then
gk=true
elseif gh then
gk=true
else




local gl=string.lower(tostring(gj.Title or"").." "..tostring(gj.Flag or""))
local gm=gj._handle
local gn
if type(gm)=="table"then
gn=gm.Get
elseif gm~=nil then
local go,gp=pcall(function()return gm.Get end)
if go then gn=gp end
end
if type(gn)=="function"then
local go,gp=pcall(gn,gm)
if go then
if type(gp)=="string"or type(gp)=="number"then
gl=gl.." "..string.lower(tostring(gp))
elseif type(gp)=="table"then
for gq,gr in ipairs(gp)do gl=gl.." "..string.lower(tostring(gr))end
end
end
end
gk=string.find(gl,ge,1,true)~=nil
end
gj._searchVisible=(ge=="")and nil or gk
if gj.Frame then gj.Frame.Visible=gk end
end
gg.Btn.Visible=(gh or ge=="")
if ge~=""then

for gi,gj in ipairs(gg.Elements)do
if gj.Frame and gj.Frame.Visible then gg.Btn.Visible=true break end
end
else

for gi,gj in ipairs(gg.Elements)do
if gj._refreshSection then pcall(gj._refreshSection)end
end
end
end
end)


fP.Focused:Connect(function()fa(fN,e9.Hover,{Size=UDim2.new(0,190,0,32)})end)
fP.FocusLost:Connect(function()fa(fN,e9.Hover,{Size=UDim2.new(0,170,0,32)})end)

function f9.SetVisible(ge,gf)
ge._visible=gf

local function pillTarget()
local gg,gh=fx.AbsoluteSize.X,fx.AbsoluteSize.Y
if gg<1 then gg,gh=1200,800 end
local gi,gj=ga.AbsolutePosition,ga.AbsoluteSize
return UDim2.new(0,gi.X+gj.X/2-gg/2,0,gi.Y+gj.Y/2-gh/2)
end
if gf then
fx.Enabled=true
ge._mini=false
if gc then gc.Visible=false end
if ga then ga.Visible=false end
fB.Position=pillTarget()
fE.Scale=baseScale()*0.55
fB.GroupTransparency=1
fz.BackgroundTransparency=1
if ge._acrylicPref then e8:SetAcrylic(true,fq.Blur or 16)end
e8:_sfx"Open"

fa(fB,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=ge._lastPos or UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
fa(fE,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})

dimTo(0.5,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
else
ge._mini=false
ge._lastPos=fB.Position
if gc then gc.Visible=false end
e8:SetAcrylic(false)
for gg,gh in pairs(e8.Sound._cache)do pcall(function()gh:Stop()end)end
fa(fB,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
fa(fE,e9.Fast,{Scale=baseScale()*0.55})

dimTo(1,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In))
task.delay(0.36,function()
if ge._visible then return end
fx.Enabled=false
if ga then
ga.Visible=true
gb.Scale=0.5
fa(gb,e9.Spring,{Scale=1})
end
end)
end
end
function f9.Toggle(ge)ge:SetVisible(not ge._visible)end


function f9.SetToggleKey(ge,gf)
if type(gf)=="string"then gf=Enum.KeyCode[gf]end
if typeof(gf)=="EnumItem"then
if ge._toggleKey==gf then return end
ge._toggleKey=gf
ge:Notify{Title="Hide key",Content="Now bound to "..gf.Name,Duration=1.5}
end
end
function f9.GetToggleKey(ge)return ge._toggleKey end


function f9.OnClose(ge,gf)
if type(gf)=="function"then ge._onCloseCb=gf end
end

function f9.SetMini(ge,gf)
gf=gf and true or false
if gf==ge._mini then return end
ge._mini=gf
if gf then
ge._visible=false
ge._lastPos=fB.Position
ga.Visible=false
e8:SetAcrylic(false)
for gg,gh in pairs(e8.Sound._cache)do pcall(function()gh:Stop()end)end
fa(fB,e9.Fast,{GroupTransparency=1})
fa(fE,e9.Fast,{Scale=baseScale()*0.7})
dimTo(1,e9.Fast)
task.delay(0.2,function()
if not ge._mini then return end
fx.Enabled=false
gc.Visible=true
gd.Scale=0.5
fa(gd,e9.Spring,{Scale=1})
end)
else
gc.Visible=false
ge:SetVisible(true)
end
end



f9._sbMode=0
f9._focus=false
function f9._applyLayout(ge)
local gf=ge._focus and 2 or ge._sbMode
local gg=gf==1
f4.Visible=gf~=2
if gf==0 then
fa(f4,e9.Fast,{Size=UDim2.new(0,164,1,0)})
f8.Position=UDim2.new(0,176,0,0)
f8.Size=UDim2.new(1,-176,1,0)
elseif gf==1 then
fa(f4,e9.Fast,{Size=UDim2.new(0,58,1,0)})
f8.Position=UDim2.new(0,70,0,0)
f8.Size=UDim2.new(1,-70,1,0)
else
f8.Position=UDim2.new(0,0,0,0)
f8.Size=UDim2.new(1,0,1,0)
end
for gh,gi in ipairs(ge._tabs)do
if gi._label then gi._label.Visible=not gg end
if gi._icon and gi._icon:IsA"GuiObject"then
gi._icon.Position=gg and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end
end
function f9.CycleSidebar(ge)
ge._sbMode=(ge._sbMode+1)%3
ge:_applyLayout()
ge:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[ge._sbMode+1],Duration=1.5}
end
function f9.SetFocus(ge,gf)
ge._focus=gf and true or false
ge:_applyLayout()
end
local function fitCard()
local ge=Vector2.new(1200,800)
pcall(function()ge=workspace.CurrentCamera.ViewportSize end)
local gf=math.clamp(math.min(ge.X/700,ge.Y/520),0.6,1)
fC=gf
fE.Scale=baseScale()
if ge.X<760 or fn.TouchEnabled then
if f9._sbMode==0 and not f9._userToggledSide then
f9._sbMode=2 f9:_applyLayout()
end
end
end
fT.MouseButton1Click:Connect(function()
e8:_sfx"Click"
f9._userToggledSide=true
f9:CycleSidebar()
end)
fR.MouseButton1Click:Connect(function()
e8:_sfx"Click"f9:ToggleKeybindList()
end)


local ge=fq.ConfirmClose
if ge==nil then ge=true end
local function requestClose()
e8:_sfx"Click"
if ge==false then f9:Destroy()return end
local gf=(type(ge)=="table")and ge or{}
f9:Dialog{
Title=gf.Title or"Close Kronos?",
Content=gf.Content or"The hub will close permanently and all features will be disabled.",
Buttons={
{Title=gf.Cancel or"Cancel"},
{Title=gf.Confirm or"Close",Callback=function()f9:Destroy()end},
},
}
end
fZ.MouseButton1Click:Connect(function()requestClose()end)
fY.MouseButton1Click:Connect(function()
e8:_sfx"Click"f9:SetMini(not f9._mini)
end)
f9._zoomed=false
fX.MouseButton1Click:Connect(function()
e8:_sfx"Click"
f9._zoomed=not f9._zoomed
fa(fB,e9.Med,{Size=f9._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
f_.MouseButton1Click:Connect(function()
e8:_sfx"Click"f9:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
f9:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

ga=Instance.new"TextButton"ga.Name=ad.GetStealthName()
ga.Text=""
ga.AnchorPoint=Vector2.new(0,0.5)ga.Position=UDim2.new(0,12,0.5,0)
ga.Size=UDim2.fromOffset(42,42)
ga.BackgroundColor3=fv.Surface2 ga.BorderSizePixel=0
fp:_tag(ga,"BackgroundColor3","Surface2")
fc(ga,13)ga.Parent=fx ga.Visible=false
fd(ga,true)
fk(ga,0.6,20)

local gf=Instance.new"TextLabel"gf.Size=UDim2.fromScale(1,1)
gf.BackgroundTransparency=1 gf.Font=Enum.Font.GothamBlack
gf.TextSize=20 gf.Text="K"gf.Parent=ga
fp:_tag(gf,"TextColor3","Text")
local gg=Instance.new"Frame"gg.Size=UDim2.fromOffset(9,9)
gg.Position=UDim2.new(1,-6,0,-3)gg.BorderSizePixel=0
fp:_tag(gg,"BackgroundColor3","Accent")
fc(gg,99)gg.Parent=ga
brandInto(ga,gf)
if not fq.Logo or fq.Logo==""then kronosFace(ga,gf,32,17)end
gb=Instance.new"UIScale"gb.Parent=ga
fl(ga,ga)
ga.MouseButton1Click:Connect(function()f9:SetVisible(true)end)


gc=Instance.new"TextButton"gc.Name=ad.GetStealthName()
gc.Text=""
gc.AnchorPoint=Vector2.new(0,0)gc.Position=UDim2.new(0,12,0,12)
gc.Size=UDim2.fromOffset(44,44)
gc.BackgroundColor3=fv.Surface2 gc.BorderSizePixel=0
fp:_tag(gc,"BackgroundColor3","Surface2")
fc(gc,13)gc.Parent=fw gc.Visible=false
fd(gc,true)
fk(gc,0.6,20)
local gh=Instance.new"TextLabel"gh.Size=UDim2.fromScale(1,1)
gh.BackgroundTransparency=1 gh.Font=Enum.Font.GothamBlack
gh.TextSize=20 gh.Text="K"gh.Parent=gc
fp:_tag(gh,"TextColor3","Text")
local gi=Instance.new"Frame"gi.Size=UDim2.fromOffset(9,9)
gi.Position=UDim2.new(1,-6,0,-3)gi.BorderSizePixel=0
fp:_tag(gi,"BackgroundColor3","Accent")
fc(gi,99)gi.Parent=gc
brandInto(gc,gh)
if not fq.Logo or fq.Logo==""then kronosFace(gc,gh,34,17)end
gd=Instance.new"UIScale"gd.Parent=gc
fl(gc,gc)
gc.MouseButton1Click:Connect(function()f9:SetMini(false)end)


local gj=Instance.new"TextButton"gj.Text=""
gj.AnchorPoint=Vector2.new(1,1)gj.Position=UDim2.new(1,0,1,0)
gj.Size=UDim2.fromOffset(28,28)gj.BackgroundTransparency=1
gj.Parent=fB gj.ZIndex=50
gj.ClipsDescendants=true


local gk=0
gj.MouseButton1Click:Connect(function()
local gl=os.clock()
if gl-gk<0.35 then
e8:_sfx"Click"
f9._zoomed=not f9._zoomed
fa(fB,e9.Med,{Size=f9._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
gk=gl
end)
local gl,gm,gn=false
gj.InputBegan:Connect(function(go)
if go.UserInputType==Enum.UserInputType.MouseButton1 or go.UserInputType==Enum.UserInputType.Touch then
gl,gm,gn=true,go.Position,fB.Size
go.Changed:Connect(function()
if go.UserInputState==Enum.UserInputState.End then gl=false end
end)
end
end)
f9:Track(fn.InputChanged:Connect(function(go)
if not gl then return end
if go.UserInputType~=Enum.UserInputType.MouseMovement
and go.UserInputType~=Enum.UserInputType.Touch then return end
local gp=go.Position-gm
fB.Size=UDim2.fromOffset(
math.clamp(gn.X.Offset+gp.X,520,920),
math.clamp(gn.Y.Offset+gp.Y,380,660))
end))

function f9.Notify(go,gp)
gp=gp or{}
e8:_sfx"Notify"
e7.closeAny()
table.insert(e8._inbox,1,{Title=gp.Title or"Kronos",
Content=gp.Content or gp.Text or"",At=os.date"%H:%M"})
while#e8._inbox>30 do table.remove(e8._inbox)end
pcall(function()f1.Visible=true end)
local gq=ensureNotifyHost(fy)
local gr=Instance.new"CanvasGroup"gr.Size=UDim2.new(1,0,0,62)
gr.BackgroundColor3=fv.Surface2 gr.BorderSizePixel=0 gr.GroupTransparency=1
fc(gr,10)gr.Parent=gq
fd(gr,true)
fk(gr,0.65,24)
e8:_tag(gr,"BackgroundColor3","Surface2")
gr.Position=UDim2.new(0,40,0,0)
fa(gr,e9.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local gs=Instance.new"TextLabel"gs.BackgroundTransparency=1
gs.Position=UDim2.new(0,12,0,8)gs.Size=UDim2.new(1,-24,0,17)
gs.Font=Enum.Font.GothamBold gs.TextSize=13 gs.TextXAlignment=0
e8:_tag(gs,"TextColor3","Text")gs.Text=gp.Title or"Kronos"gs.Parent=gr
local gt=Instance.new"TextLabel"gt.BackgroundTransparency=1
gt.Position=UDim2.new(0,12,0,27)gt.Size=UDim2.new(1,-24,0,16)
gt.Font=Enum.Font.Gotham gt.TextSize=12 gt.TextXAlignment=0
e8:_tag(gt,"TextColor3","Dim")
gt.TextTruncate=Enum.TextTruncate.AtEnd gt.Text=gp.Content or gp.Text or""gt.Parent=gr
local gu=Instance.new"Frame"gu.AnchorPoint=Vector2.new(0,1)
gu.Position=UDim2.new(0,10,1,-6)gu.Size=UDim2.new(1,-20,0,2)
gu.BorderSizePixel=0 e8:agrad(gu,0)
fc(gu,99)gu.Parent=gr
local gv=gp.Duration or 4
fa(gu,TweenInfo.new(gv,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(gv+0.1,function()
fa(gr,e9.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()gr:Destroy()end)end)
end)
end


function f9.Dialog(go,gp)
gp=gp or{}
e8:_sfx"Open"
local gq=Instance.new"TextButton"gq.Text=""gq.AutoButtonColor=false
gq.Size=UDim2.fromScale(1,1)gq.BackgroundColor3=Color3.fromRGB(0,0,0)
gq.BackgroundTransparency=1 gq.Parent=fx
fa(gq,e9.Med,{BackgroundTransparency=0.55})
local gr=Instance.new"CanvasGroup"gr.AnchorPoint=Vector2.new(0.5,0.5)

local gs=fx.AbsoluteSize
if gs.X<1 then gs=Vector2.new(1200,800)end
local gt,gu=fB.AbsolutePosition,fB.AbsoluteSize
gr.Position=UDim2.new(0,gt.X+gu.X/2-gs.X/2,0,gt.Y+gu.Y/2-gs.Y/2)
gr.Size=UDim2.fromOffset(320,170)
gr.BackgroundColor3=fv.Surface gr.BorderSizePixel=0 gr.GroupTransparency=1
fc(gr,12)gr.Parent=gq
fd(gr,true)
ff(gr,12)
fk(gr,0.5,40)
e8:_tag(gr,"BackgroundColor3","Surface")
local gv=Instance.new"UIScale"gv.Scale=0.94 gv.Parent=gr
fa(gr,e9.Med,{GroupTransparency=0})
fa(gv,e9.Spring,{Scale=1})
local gw=false
local function close()
if gw then return end gw=true
e7.close(close)
fa(gr,e9.Fast,{GroupTransparency=1})
fa(gq,e9.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()gq:Destroy()end)end)
end
e7.open(close)
gq.MouseButton1Click:Connect(function()close()end)
local gx=Instance.new"TextLabel"gx.BackgroundTransparency=1
gx.Position=UDim2.new(0,16,0,14)gx.Size=UDim2.new(1,-32,0,20)
gx.Font=Enum.Font.GothamBold gx.TextSize=15 gx.TextXAlignment=0
e8:_tag(gx,"TextColor3","Text")gx.Text=gp.Title or"Confirm"gx.Parent=gr
local gy=Instance.new"TextLabel"gy.BackgroundTransparency=1
gy.Position=UDim2.new(0,16,0,38)gy.Size=UDim2.new(1,-32,0,60)
gy.Font=Enum.Font.Gotham gy.TextSize=12 gx.TextXAlignment=0
gy.TextXAlignment=0 gy.TextYAlignment=0 gy.TextWrapped=true
e8:_tag(gy,"TextColor3","Dim")gy.Text=gp.Content or""gy.Parent=gr
local gz=Instance.new"Frame"gz.BackgroundTransparency=1
gz.AnchorPoint=Vector2.new(0,1)gz.Position=UDim2.new(0,0,1,-12)
gz.Size=UDim2.new(1,0,0,34)gz.Parent=gr
local gA=Instance.new"UIListLayout"gA.FillDirection=Enum.FillDirection.Horizontal
gA.HorizontalAlignment=Enum.HorizontalAlignment.Right gA.Padding=UDim.new(0,8)gA.Parent=gz
fe(gz,0,0,12,12)
for gB,gC in ipairs(gp.Buttons or{{Title="OK"}})do
local gD=Instance.new"TextButton"gD.Text=""
gD.Size=UDim2.new(0,96,0,30)gD.BackgroundColor3=fv.Surface2
gD.BorderSizePixel=0 fc(gD,7)gD.AutoButtonColor=false gD.Parent=gz
fd(gD,true)
e8:_tag(gD,"BackgroundColor3","Surface2")
local gE=Instance.new"TextLabel"gE.BackgroundTransparency=1 gE.Size=UDim2.fromScale(1,1)
gE.Font=Enum.Font.GothamBold gE.TextSize=12
e8:_tag(gE,"TextColor3","Text")gE.Text=gC.Title gE.Parent=gD
local gF=Instance.new"UIScale"gF.Parent=gD
gD.MouseButton1Down:Connect(function()fa(gF,e9.Hover,{Scale=0.95})end)
gD.MouseButton1Up:Connect(function()fa(gF,e9.Spring,{Scale=1})end)
gD.MouseButton1Click:Connect(function()
close()fb(gC.Callback)
end)
end
return{Close=close}
end




function f9.KeySystem(go,gp)
gp=gp or{}
local gq,gr=false,gp.FileName or("kronos_key_"..tostring(fr))

local gs=(go._folder or"Kronos").."/"..gr..".txt"

if gp.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(gs)then
local gt=readfile(gs)
if gt and go:_checkKey(gp,gt)then gq=true end
end
end)
end
local gt=Instance.new"TextButton"gt.Text=""gt.AutoButtonColor=false
gt.Size=UDim2.fromScale(1,1)gt.BackgroundColor3=Color3.fromRGB(0,0,0)
gt.BackgroundTransparency=1 gt.ZIndex=200 gt.Parent=fx
fa(gt,e9.Med,{BackgroundTransparency=0.6})
local gu=Instance.new"CanvasGroup"gu.AnchorPoint=Vector2.new(0.5,0.5)
gu.Position=UDim2.new(0.5,0,0.5,0)gu.Size=UDim2.fromOffset(300,210)
gu.BackgroundColor3=fv.Surface gu.BorderSizePixel=0 gu.GroupTransparency=1
fc(gu,12)gu.Parent=gt
fd(gu,true)
ff(gu,12)
fk(gu,0.5,40)
e8:_tag(gu,"BackgroundColor3","Surface")
local gv=Instance.new"UIScale"gv.Scale=0.94 gv.Parent=gu
fa(gu,e9.Med,{GroupTransparency=0})
fa(gv,e9.Spring,{Scale=1})
local gw=Instance.new"TextLabel"gw.BackgroundTransparency=1
gw.Position=UDim2.new(0,16,0,14)gw.Size=UDim2.new(1,-32,0,20)
gw.Font=Enum.Font.GothamBold gw.TextSize=15 gw.TextXAlignment=0
e8:_tag(gw,"TextColor3","Text")gw.Text=gp.Title or"Enter Key"gw.Parent=gu
local gx=Instance.new"TextLabel"gx.BackgroundTransparency=1
gx.Position=UDim2.new(0,16,0,36)gx.Size=UDim2.new(1,-32,0,15)
gx.Font=Enum.Font.Gotham gx.TextSize=11 gw.TextXAlignment=0 gx.TextXAlignment=0
e8:_tag(gx,"TextColor3","Dim")gx.Text=string.upper(gp.Subtitle or"key required")gx.Parent=gu
local gy=Instance.new"TextBox"gy.PlaceholderText="Paste key..."
gy.PlaceholderColor3=fv.Dim gy.Text=""
gy.Font=Enum.Font.Code gy.TextSize=12
gy.Position=UDim2.new(0,16,0,60)gy.Size=UDim2.new(1,-32,0,32)
gy.BackgroundColor3=fv.Surface2 gy.BorderSizePixel=0
fc(gy,8)gy.Parent=gu
fe(gy,4,4,10,10)
fd(gy,true)
e8:_tag(gy,"BackgroundColor3","Surface2")
e8:_tag(gy,"TextColor3","Text")
local gz=Instance.new"TextLabel"gz.BackgroundTransparency=1
gz.Position=UDim2.new(0,16,0,96)gz.Size=UDim2.new(1,-32,0,15)
gz.Font=Enum.Font.Gotham gz.TextSize=11 gz.TextXAlignment=0 gz.Text=""
e8:_tag(gz,"TextColor3","Danger")gz.Parent=gu
local gA=Instance.new"TextButton"gA.Text=""
gA.Position=UDim2.new(0,16,0,118)gA.Size=UDim2.new(1,-32,0,32)
gA.BorderSizePixel=0 fc(gA,8)gA.AutoButtonColor=false gA.Parent=gu
e8:agrad(gA,15)
local gB=Instance.new"TextLabel"gB.BackgroundTransparency=1 gB.Size=UDim2.fromScale(1,1)
gB.Font=Enum.Font.GothamBold gB.TextSize=13 gB.Text="UNLOCK"
e8:oa(gB)gB.Parent=gA
local gC=Instance.new"UIScale"gC.Parent=gA
local gD
if gp.GetKeyLink then
gD=Instance.new"TextButton"gD.Text=""
gD.Position=UDim2.new(0,16,0,156)gD.Size=UDim2.new(1,-32,0,26)
gD.BackgroundTransparency=1 gD.Parent=gu
local gE=Instance.new"TextLabel"gE.BackgroundTransparency=1 gE.Size=UDim2.fromScale(1,1)
gE.Font=Enum.Font.Gotham gE.TextSize=11 gE.Text="Copy key link"
e8:_tag(gE,"TextColor3","Dim")gE.Parent=gD
gD.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(gp.GetKeyLink)end end)
gE.Text="Link copied"
task.delay(2,function()pcall(function()gE.Text="Copy key link"end)end)
end)
end
local function shake()local gE=
gu.Position.X.Offset
for gF=1,3 do
fa(gu,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
fa(gu,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
fa(gu,e9.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
gq=true
if gp.SaveKey~=false then
pcall(function()
if makefolder and isfolder and not isfolder(go._folder or"Kronos")then
makefolder(go._folder or"Kronos")
end
if writefile then writefile(gs,gy.Text)end
end)
end
fa(gu,e9.Fast,{GroupTransparency=1})
fa(gt,e9.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()gt:Destroy()end)end)
go:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
fb(gp.OnSuccess)
end
local function check()
local gE=gy.Text
if go:_checkKey(gp,gE)then unlock()
else gz.Text="Invalid key."task.spawn(shake)end
end
gA.MouseButton1Down:Connect(function()fa(gC,e9.Hover,{Scale=0.96})end)
gA.MouseButton1Up:Connect(function()fa(gC,e9.Spring,{Scale=1})end)
gA.MouseButton1Click:Connect(check)
gy.FocusLost:Connect(function(gE)if gE then check()end end)
if gq then pcall(function()gt:Destroy()end)fb(gp.OnSuccess)end
return{Passed=function()return gq end}
end

function e8._checkKey(go,gp,gq)
if gp.Validate and type(gp.Validate)=="function"then
local gr,gs=pcall(gp.Validate,gq)
if gr and gs then return true end
end
if gp.Key and gq==gp.Key then return true end
if gp.Keys and table.find(gp.Keys,gq)then return true end
if not gp.Key and not gp.Keys and not gp.Validate then return true end
return false
end


function f9.TogglePalette(go,gp)
local gq=go._palette
if not gq then
local gr=Instance.new"TextButton"gr.Text=""gr.AutoButtonColor=false
gr.Size=UDim2.fromScale(1,1)gr.BackgroundColor3=Color3.fromRGB(0,0,0)
gr.BackgroundTransparency=1 gr.Visible=false gr.ZIndex=e7.Z.Popup gr.Parent=fy
local gs=Instance.new"Frame"gs.AnchorPoint=Vector2.new(0.5,0)
gs.Position=UDim2.new(0.5,0,0,90)gs.Size=UDim2.fromOffset(380,300)
gs.BackgroundColor3=fv.Bg gs.BorderSizePixel=0
fc(gs,12)gs.Parent=gr
fd(gs,true)
fk(gs,0.5,40)
e8:_tag(gs,"BackgroundColor3","Bg")
local gt=Instance.new"TextBox"gt.PlaceholderText="Type a command..."
gt.PlaceholderColor3=fv.Dim gt.Text=""
gt.Font=Enum.Font.Gotham gt.TextSize=14
gt.Position=UDim2.new(0,14,0,12)gt.Size=UDim2.new(1,-28,0,32)
gt.BackgroundTransparency=1 gt.ClearTextOnFocus=false gt.Parent=gs
e8:_tag(gt,"TextColor3","Text")
local gu=Instance.new"Frame"gu.BorderSizePixel=0
gu.Position=UDim2.new(0,12,0,50)gu.Size=UDim2.new(1,-24,0,1)
gu.BackgroundColor3=Color3.fromRGB(255,255,255)
gu.BackgroundTransparency=0.93 gu.Parent=gs
local gv=Instance.new"ScrollingFrame"
gv.Position=UDim2.new(0,8,0,56)gv.Size=UDim2.new(1,-16,1,-64)
gv.BackgroundTransparency=1 gv.BorderSizePixel=0
gv.ScrollBarThickness=2 gv.CanvasSize=UDim2.new(0,0,0,0)
gv.AutomaticCanvasSize=Enum.AutomaticSize.Y gv.Parent=gs
e8:_tag(gv,"ScrollBarImageColor3","Surface2")
local gw=Instance.new"UIListLayout"gw.Padding=UDim.new(0,2)
gw.SortOrder=Enum.SortOrder.LayoutOrder gw.Parent=gv
gq={ov=gr,card=gs,box=gt,list=gv,open=false,sel=1,rows={}}
go._palette=gq
local function fuzzy(gx,gy)
gx,gy=string.lower(gx),string.lower(gy)
if gx==""then return 0 end
local gz,gA,gB=1,0,0
for gC=1,#gy do
if string.sub(gy,gC,gC)==string.sub(gx,gz,gz)then
gA+=(gB==gC-1)and 2 or 1
gB,gz=gC,gz+1
if gz>#gx then return gA-gC*0.01 end
end
end
return nil
end
local function run(gx)
if not gx then return end
gq.ov.Visible,gq.open=false,false
e7.close(gq._closeLayer)
fa(gq.ov,e9.Fast,{BackgroundTransparency=1})
if gx.go then pcall(gx.go)end
end
gq._run=run
local function render()
for gx,gy in ipairs(gq.rows)do pcall(function()gy.frame:Destroy()end)end
gq.rows={}
local gx=gt.Text
local gy={}
for gz,gA in ipairs(go._tabs)do
local gB=fuzzy(gx,gA.Title)
if gB then table.insert(gy,{label=gA.Title,hint="tab",score=gB+100,
go=function()go._activateTab(gA,true)end})end
for gC,gD in ipairs(gA.Elements)do
if gD.Title and gD.Frame then
local gE=fuzzy(gx,gA.Title.." "..gD.Title)
if gE then table.insert(gy,{label=gD.Title,hint=gA.Title,score=gE,
go=gD._go})end
end
end
end
table.sort(gy,function(gz,gA)return gz.score>gA.score end)
gq.sel=math.clamp(gq.sel,1,math.max(1,math.min(12,#gy)))
if#gy==0 then
local gz=Instance.new"TextLabel"gz.BackgroundTransparency=1
gz.Size=UDim2.new(1,0,0,30)gz.Font=Enum.Font.Gotham
gz.TextSize=12 gz.Text="No results"gz.Parent=gv
e8:_tag(gz,"TextColor3","Dim")
gq.rows={{frame=gz}}
return
end
for gz=1,math.min(12,#gy)do
local gA=gy[gz]
local gB=Instance.new"TextButton"gB.Text=""
gB.Size=UDim2.new(1,-4,0,32)gB.BorderSizePixel=0
gB.BackgroundColor3=fv.Surface2
gB.BackgroundTransparency=(gz==gq.sel)and 0.35 or 1
fc(gB,7)gB.Parent=gv
e8:_tag(gB,"BackgroundColor3","Surface2")
local gC=Instance.new"TextLabel"gC.BackgroundTransparency=1
gC.Position=UDim2.new(0,10,0,0)gC.Size=UDim2.new(1,-90,1,0)
gC.Font=Enum.Font.Gotham gC.TextSize=13 gC.TextXAlignment=0
gC.TextTruncate=Enum.TextTruncate.AtEnd gC.Text=gA.label gC.Parent=gB
e8:_tag(gC,"TextColor3","Text")
local gD=Instance.new"TextLabel"gD.BackgroundTransparency=1
gD.AnchorPoint=Vector2.new(1,0)gD.Position=UDim2.new(1,-10,0,0)
gD.Size=UDim2.new(0,70,1,0)gD.Font=Enum.Font.Gotham
gD.TextSize=10 gD.TextXAlignment=1 gC.TextTruncate=Enum.TextTruncate.AtEnd
gD.Text=gA.hint gD.Parent=gB
e8:_tag(gD,"TextColor3","Dim")
local gE=gz
gB.MouseButton1Click:Connect(function()run(gA)end)
gB.MouseEnter:Connect(function()
gq.sel=gE render()
end)
table.insert(gq.rows,{frame=gB,item=gA})
end
end
gq._render=render
gt:GetPropertyChangedSignal"Text":Connect(function()gq.sel=1 render()end)
gr.MouseButton1Click:Connect(function()
if gq.open then go:TogglePalette(false)end
end)
go:Track(fn.InputBegan:Connect(function(gx,gy)
if not gq.open then return end
if gx.KeyCode==Enum.KeyCode.Escape then go:TogglePalette(false)
elseif gx.KeyCode==Enum.KeyCode.Return or gx.KeyCode==Enum.KeyCode.KeypadEnter then
local gz=gq.rows[gq.sel]
run(gz and gz.item)
elseif gx.KeyCode==Enum.KeyCode.Up then
gq.sel=math.max(1,gq.sel-1)render()
elseif gx.KeyCode==Enum.KeyCode.Down then
gq.sel=math.min(#gq.rows,gq.sel+1)render()
end
end))
gq._closeLayer=function()
if gq.open then go:TogglePalette(false)end
end
end
local gr=(gp~=nil)and gp or(not gq.open)
gq.open=gr
gq.ov.Visible=gr
if gr then
e7.open(gq._closeLayer)
e8:_sfx"Open"
flyTo(gq.ov,{BackgroundTransparency=0.45})
gq.card.Position=UDim2.new(0.5,0,0,78)
flyTo(gq.card,{Position=UDim2.new(0.5,0,0,90)})
gq.box.Text,gq.sel="",1
gq._render()
task.defer(function()pcall(function()gq.box:CaptureFocus()end)end)
else
e7.close(gq._closeLayer)
flyTo(gq.ov,{BackgroundTransparency=1},e9.Fast,function()
if not gq.open then gq.ov.Visible=false end
end)
end
end

function f9.SetTheme(go,gp)e8:SetTheme(gp)end

function e8.SetAccent(go,gp)
if typeof(gp)~="Color3"then return end
go.Themes[go.ThemeName].Accent=gp
go:SetTheme(go.ThemeName)
end


e8.FontPacks={
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
e8.FontPack="Gotham+"
e8._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function e8._resolveFont(go,gp)
local gq,gr=pcall(function()return Enum.Font[gp]end)
if gq and gr then return gr end
return nil
end
function e8._paintFonts(go,gp)
local gq=go.FontPacks[go.FontPack]
if not gq then return end
for gr,gs in ipairs(gp:GetDescendants())do
if gs:IsA"TextLabel"or gs:IsA"TextButton"or gs:IsA"TextBox"then
local gt=gs:GetAttribute"KronosFontRole"
if not gt then
gt=go._roleFromDefault[gs.Font]or"Body"
gs:SetAttribute("KronosFontRole",gt)
gs:SetAttribute("KronosBaseSize",gs.TextSize)
end
local gu=gs:GetAttribute"KronosBaseSize"or gs.TextSize
local gv=(gq.Bump and gq.Bump[gt])or 0
local gw=gq[gt]and go:_resolveFont(gq[gt])or nil
pcall(function()
if gw then gs.Font=gw end
gs.TextSize=math.clamp(gu+gv,8,30)
end)
end
end
end
function e8.SetFontPack(go,gp)
if not go.FontPacks[gp]then return end
go.FontPack=gp
if go._gui then go:_paintFonts(go._gui)end
end
function e8.RefreshFonts(go)
if go._gui then go:_paintFonts(go._gui)end
end
function f9.SetAccent(go,gp)e8:SetAccent(gp)end
function f9.SetScale(go,gp)
fD=math.clamp(tonumber(gp)or 1,0.7,1.25)
fE.Scale=baseScale()
end
function f9.SetCompact(go,gp)
gp=gp and true or false
if gp then

if not go._preCompactSize then
pcall(function()go._preCompactSize=fB.Size end)
end
fa(fB,e9.Med,{Size=UDim2.fromOffset(560,400)})
else
local gq=go._preCompactSize
or(go._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))
go._preCompactSize=nil
fa(fB,e9.Med,{Size=gq})
end
for gq,gr in ipairs(go._tabs)do
if gr._pl then gr._pl.Padding=gp and UDim.new(0,4)or UDim.new(0,8)end
end
end
function f9.ToggleAcrylic(go,gp)
e8:ToggleAcrylic(gp)
fB.BackgroundTransparency=(gp and not e8._transparent)and 0.08 or 0
f4.BackgroundTransparency=(gp and not e8._transparent)and 0.15 or 0
end
function f9.ToggleTransparency(go,gp)
e8._transparent=gp and true or false
local gq=(e8._acrylicOn and not gp)and 0.08 or(gp and 0.25 or 0)
fB.BackgroundTransparency=gq
f4.BackgroundTransparency=gp and 0.4 or((e8._acrylicOn and not gp)and 0.15 or 0)
end


function f9.SetBackdrop(go,gp)
gp=gp and true or false
fA=gp
go._backdrop=gp
if gp then
if go._visible and not go._mini then
fz.Visible=true
fa(fz,e9.Med,{BackgroundTransparency=0.5})
end
else
fa(fz,e9.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
if not fA then fz.Visible=false end
end)
end
end




local go=Instance.new"TextButton"
go.Name=ad.GetStealthName()
go.Text=""go.AutoButtonColor=false
go.Size=UDim2.fromScale(1,1)
go.BackgroundColor3=Color3.fromRGB(0,0,0)
go.BackgroundTransparency=1 go.BorderSizePixel=0
go.Visible=false go.Parent=f2
fc(go,10)
local function slideCloseAll()
if f9._inboxPanel and f9._inboxPanel.open then f9:ToggleInbox(false)end
if f9._kbPanel and f9._kbPanel.open then f9:ToggleKeybindList(false)end
end
go.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(gp)
if gp then
e7.open(slideCloseAll)
go.Visible=true
fa(go,e9.Med,{BackgroundTransparency=0.5})
else
e7.close(slideCloseAll)
fa(go,e9.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local gq=f9._inboxPanel and f9._inboxPanel.open
local gr=f9._kbPanel and f9._kbPanel.open
if not gq and not gr then go.Visible=false end
end)
end
end


function f9.ToggleInbox(gp,gq)
local gr=gp._inboxPanel
if not gr then
local gs=Instance.new"Frame"gs.AnchorPoint=Vector2.new(1,0)
gs.Position=UDim2.new(1,12,0,0)gs.Size=UDim2.new(0,230,1,0)
gs.BackgroundColor3=fv.Bg gs.BorderSizePixel=0
fc(gs,10)gs.Parent=f2 gs.Visible=false
fd(gs,true)
e8:_tag(gs,"BackgroundColor3","Bg")
local gt=Instance.new"TextLabel"gt.BackgroundTransparency=1
gt.Position=UDim2.new(0,12,0,10)gt.Size=UDim2.new(1,-70,0,18)
gt.Font=Enum.Font.GothamBold gt.TextSize=11 gt.TextXAlignment=0
gt.Text="INBOX"gt.Parent=gs
e8:_tag(gt,"TextColor3","Dim")
local gu=Instance.new"TextButton"gu.Text=""
gu.AnchorPoint=Vector2.new(1,0)gu.Position=UDim2.new(1,-10,0,10)
gu.Size=UDim2.new(0,52,0,18)gu.BackgroundColor3=fv.Surface2
gu.BorderSizePixel=0 fc(gu,6)gu.AutoButtonColor=false gu.Parent=gs
fd(gu,true)
e8:_tag(gu,"BackgroundColor3","Surface2")
local gv=Instance.new"TextLabel"gv.BackgroundTransparency=1
gv.Size=UDim2.fromScale(1,1)gv.Font=Enum.Font.GothamBold
gv.TextSize=10 gv.Text="CLEAR"gv.Parent=gu
e8:_tag(gv,"TextColor3","Dim")
local gw=Instance.new"ScrollingFrame"
gw.Position=UDim2.new(0,8,0,34)gw.Size=UDim2.new(1,-16,1,-42)
gw.BackgroundTransparency=1 gw.BorderSizePixel=0
gw.ScrollBarThickness=2 gw.CanvasSize=UDim2.new(0,0,0,0)
gw.AutomaticCanvasSize=Enum.AutomaticSize.Y gw.Parent=gs
e8:_tag(gw,"ScrollBarImageColor3","Surface2")
local gx=Instance.new"UIListLayout"gx.Padding=UDim.new(0,4)
gx.SortOrder=Enum.SortOrder.LayoutOrder gx.Parent=gw
gr={panel=gs,list=gw,open=false}
gp._inboxPanel=gr
local function refresh()
for gy,gz in ipairs(gw:GetChildren())do


if gz:IsA"Frame"or gz:IsA"TextLabel"then pcall(function()gz:Destroy()end)end
end
if#e8._inbox==0 then
local gy=Instance.new"TextLabel"gy.BackgroundTransparency=1
gy.Size=UDim2.new(1,0,0,24)gy.Font=Enum.Font.Gotham
gy.TextSize=11 gy.Text="All caught up."gy.Parent=gw
e8:_tag(gy,"TextColor3","Dim")
return
end
for gy,gz in ipairs(e8._inbox)do
local gA=Instance.new"Frame"
gA.Size=UDim2.new(1,-2,0,44)gA.BackgroundColor3=fv.Surface2
gA.BackgroundTransparency=0.35 gA.BorderSizePixel=0
fc(gA,7)gA.Parent=gw
e8:_tag(gA,"BackgroundColor3","Surface2")
local gB=Instance.new"TextLabel"gB.BackgroundTransparency=1
gB.Position=UDim2.new(0,8,0,4)gB.Size=UDim2.new(1,-52,0,15)
gB.Font=Enum.Font.GothamBold gB.TextSize=11 gB.TextXAlignment=0
gB.TextTruncate=Enum.TextTruncate.AtEnd gB.Text=gz.Title gB.Parent=gA
e8:_tag(gB,"TextColor3","Text")
local gC=Instance.new"TextLabel"gC.BackgroundTransparency=1
gC.Position=UDim2.new(0,8,0,20)gC.Size=UDim2.new(1,-52,0,18)
gC.Font=Enum.Font.Gotham gC.TextSize=11 gC.TextXAlignment=0
gC.TextTruncate=Enum.TextTruncate.AtEnd gC.Text=gz.Content gC.Parent=gA
e8:_tag(gC,"TextColor3","Dim")
local gD=Instance.new"TextLabel"gD.BackgroundTransparency=1
gD.AnchorPoint=Vector2.new(1,0)gD.Position=UDim2.new(1,-8,0,4)
gD.Size=UDim2.new(0,40,0,14)gD.Font=Enum.Font.Code
gD.TextSize=10 gD.TextXAlignment=1 gD.Text=gz.At gD.Parent=gA
e8:_tag(gD,"TextColor3","Dim")
end
end
gr.refresh=refresh
gu.MouseButton1Click:Connect(function()
e8._inbox={}
refresh()
pcall(function()f1.Visible=false end)
end)
end
local gs=(gq~=nil)and gq or(not gr.open)
gr.open=gs
if gs then
if gp._kbPanel and gp._kbPanel.open then gp:ToggleKeybindList(false)end
slideShadeSet(true)
gr.refresh()
gr.panel.Visible=true
pcall(function()f1.Visible=false end)
flyTo(gr.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(gr.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not gr.open then gr.panel.Visible=false end
end)
slideShadeSet(gp._kbPanel~=nil and gp._kbPanel.open==true)
end
end


function f9.ToggleKeybindList(gp,gq)
local gr=gp._kbPanel
if not gr then
local gs=Instance.new"Frame"gs.AnchorPoint=Vector2.new(1,0)
gs.Position=UDim2.new(1,12,0,0)gs.Size=UDim2.new(0,210,1,0)
gs.BackgroundColor3=fv.Bg gs.BorderSizePixel=0
fc(gs,10)gs.Parent=f2 gs.Visible=false
fd(gs,true)
e8:_tag(gs,"BackgroundColor3","Bg")
local gt=Instance.new"TextLabel"gt.BackgroundTransparency=1
gt.Position=UDim2.new(0,12,0,10)gt.Size=UDim2.new(1,-24,0,18)
gt.Font=Enum.Font.GothamBold gt.TextSize=11 gt.TextXAlignment=0
gt.Text="KEYBINDS"gt.Parent=gs
e8:_tag(gt,"TextColor3","Dim")
local gu=Instance.new"ScrollingFrame"
gu.Position=UDim2.new(0,8,0,34)gu.Size=UDim2.new(1,-16,1,-42)
gu.BackgroundTransparency=1 gu.BorderSizePixel=0
gu.ScrollBarThickness=2 gu.CanvasSize=UDim2.new(0,0,0,0)
gu.AutomaticCanvasSize=Enum.AutomaticSize.Y gu.Parent=gs
e8:_tag(gu,"ScrollBarImageColor3","Surface2")
local gv=Instance.new"UIListLayout"gv.Padding=UDim.new(0,4)
gv.SortOrder=Enum.SortOrder.LayoutOrder gv.Parent=gu
gr={panel=gs,list=gu,open=false}
gp._kbPanel=gr
local function refresh()
for gw,gx in ipairs(gu:GetChildren())do
if gx:IsA"TextButton"then pcall(function()gx:Destroy()end)end
end
if#gp._keybinds==0 then
local gw=Instance.new"TextLabel"gw.BackgroundTransparency=1
gw.Size=UDim2.new(1,0,0,24)gw.Font=Enum.Font.Gotham
gw.TextSize=11 gw.Text="No keybinds yet"gw.Parent=gu
e8:_tag(gw,"TextColor3","Dim")
return
end
for gw,gx in ipairs(gp._keybinds)do
local gy=Instance.new"TextButton"gy.Text=""
gy.Size=UDim2.new(1,-2,0,30)gy.BackgroundColor3=fv.Surface2
gy.BackgroundTransparency=0.35 gy.BorderSizePixel=0
fc(gy,7)gy.Parent=gu
e8:_tag(gy,"BackgroundColor3","Surface2")
local gz=Instance.new"TextLabel"gz.BackgroundTransparency=1
gz.Position=UDim2.new(0,8,0,0)gz.Size=UDim2.new(1,-70,1,0)
gz.Font=Enum.Font.Gotham gz.TextSize=11 gz.TextXAlignment=0
gz.TextTruncate=Enum.TextTruncate.AtEnd gz.Text=gx.Title gz.Parent=gy
e8:_tag(gz,"TextColor3","Text")
local gA=Instance.new"TextLabel"gA.BackgroundTransparency=1
gA.AnchorPoint=Vector2.new(1,0)gA.Position=UDim2.new(1,-8,0,0)
gA.Size=UDim2.new(0,56,1,0)gA.Font=Enum.Font.Code
gA.TextSize=10 gA.TextXAlignment=1 gA.Text=gx.GetName()gA.Parent=gy
e8:_tag(gA,"TextColor3","Dim")
gy.MouseButton1Click:Connect(function()
e8:_sfx"Click"gx.Rebind()
task.delay(0.2,function()pcall(function()gA.Text=gx.GetName()end)end)
end)
end
end
gr.refresh=refresh
gp._kbPanelRefresh=refresh
end
local gs=(gq~=nil)and gq or(not gr.open)
gr.open=gs
if gs then
if gp._inboxPanel and gp._inboxPanel.open then gp:ToggleInbox(false)end
slideShadeSet(true)
gr.refresh()
gr.panel.Visible=true
flyTo(gr.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(gr.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not gr.open then gr.panel.Visible=false end
end)
slideShadeSet(gp._inboxPanel~=nil and gp._inboxPanel.open==true)
end
end


function f9.Onboarding(gp,gq)
gq=gq or{}
local gr=gq.Steps or gq.Pages or{{Title="Welcome",Content="This is Kronos."}}
local gs=1
local gt=Instance.new"TextButton"gt.Text=""gt.AutoButtonColor=false
gt.Size=UDim2.fromScale(1,1)gt.BackgroundColor3=Color3.fromRGB(0,0,0)
gt.BackgroundTransparency=1 gt.ZIndex=180 gt.Parent=fx
fa(gt,e9.Med,{BackgroundTransparency=0.6})
local gu=Instance.new"CanvasGroup"gu.AnchorPoint=Vector2.new(0.5,0.5)
gu.Position=UDim2.new(0.5,0,0.5,0)gu.Size=UDim2.fromOffset(340,220)
gu.BackgroundColor3=fv.Surface gu.BorderSizePixel=0 gu.GroupTransparency=1
fc(gu,12)gu.Parent=gt
fd(gu,true)
ff(gu,12)
fk(gu,0.5,40)
e8:_tag(gu,"BackgroundColor3","Surface")
local gv=Instance.new"UIScale"gv.Scale=0.94 gv.Parent=gu
fa(gu,e9.Med,{GroupTransparency=0})
fa(gv,e9.Spring,{Scale=1})
local gw=Instance.new"TextLabel"gw.BackgroundTransparency=1
gw.Position=UDim2.new(0,20,0,18)gw.Size=UDim2.new(1,-40,0,24)
gw.Font=Enum.Font.GothamBold gw.TextSize=17 gw.TextXAlignment=0 gw.Parent=gu
e8:_tag(gw,"TextColor3","Text")
local gx=Instance.new"TextLabel"gx.BackgroundTransparency=1
gx.Position=UDim2.new(0,20,0,48)gx.Size=UDim2.new(1,-40,0,90)
gx.Font=Enum.Font.Gotham gx.TextSize=13 gw.TextXAlignment=0
gx.TextXAlignment=0 gx.TextYAlignment=0 gx.TextWrapped=true gx.Parent=gu
e8:_tag(gx,"TextColor3","Dim")
local gy=Instance.new"Frame"gy.BackgroundTransparency=1
gy.AnchorPoint=Vector2.new(0,1)gy.Position=UDim2.new(0,20,1,-52)
gy.Size=UDim2.new(0,120,0,10)gy.Parent=gu
local gz=Instance.new"UIListLayout"gz.FillDirection=Enum.FillDirection.Horizontal
gz.Padding=UDim.new(0,6)gz.Parent=gy
local gA={}
for gB=1,#gr do
local gC=Instance.new"Frame"gC.Size=UDim2.fromOffset(8,8)
gC.BorderSizePixel=0 fc(gC,99)gC.Parent=gy
e8:_tag(gC,"BackgroundColor3","Surface2")
gA[gB]=gC
end
local gB,gC,gD
local function paint()
gw.Text,gx.Text=gr[gs].Title or"",gr[gs].Content or""
for gE,gF in ipairs(gA)do
if gE==gs then e8:_tag(gF,"BackgroundColor3","Accent")
else e8:_tag(gF,"BackgroundColor3","Surface2")end
end
gB.Visible=gs>1
gD.Text=(gs==#gr)and"FINISH"or"NEXT"
gw.Position=UDim2.new(0,26,0,18)
fa(gw,e9.Fast,{Position=UDim2.new(0,20,0,18)})
end
local gE=Instance.new"Frame"gE.BackgroundTransparency=1
gE.AnchorPoint=Vector2.new(0,1)gE.Position=UDim2.new(0,0,1,-12)
gE.Size=UDim2.new(1,0,0,34)gE.Parent=gu
local gF=Instance.new"UIListLayout"gF.FillDirection=Enum.FillDirection.Horizontal
gF.HorizontalAlignment=Enum.HorizontalAlignment.Right gF.Padding=UDim.new(0,8)gF.Parent=gE
fe(gE,0,0,12,12)
gB=Instance.new"TextButton"gB.Text=""
gB.Size=UDim2.new(0,80,0,30)gB.BackgroundTransparency=1 gB.Parent=gE
local gG=Instance.new"TextLabel"gG.BackgroundTransparency=1
gG.Size=UDim2.fromScale(1,1)gG.Font=Enum.Font.GothamBold
gG.TextSize=12 gG.Text="BACK"gG.Parent=gB
e8:_tag(gG,"TextColor3","Dim")
local gH=Instance.new"TextButton"gH.Text=""
gH.Size=UDim2.new(0,80,0,30)gH.BackgroundTransparency=1 gH.Parent=gE
local gI=Instance.new"TextLabel"gI.BackgroundTransparency=1
gI.Size=UDim2.fromScale(1,1)gI.Font=Enum.Font.Gotham
gI.TextSize=12 gI.Text="Skip"gI.Parent=gH
e8:_tag(gI,"TextColor3","Dim")
gC=Instance.new"TextButton"gC.Text=""
gC.Size=UDim2.new(0,96,0,30)gC.BorderSizePixel=0
fc(gC,7)gC.AutoButtonColor=false gC.Parent=gE
e8:agrad(gC,15)
gD=Instance.new"TextLabel"gD.BackgroundTransparency=1
gD.Size=UDim2.fromScale(1,1)gD.Font=Enum.Font.GothamBold
gD.TextSize=12
gD.Text="NEXT"gD.Parent=gC
e8:oa(gD)
local function close()
fa(gu,e9.Fast,{GroupTransparency=1})
fa(gt,e9.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()pcall(function()gt:Destroy()end)end)
fb(gq.OnFinish)
end
gB.MouseButton1Click:Connect(function()
e8:_sfx"Click"gs=math.max(1,gs-1)paint()
end)
gH.MouseButton1Click:Connect(function()close()end)
gC.MouseButton1Click:Connect(function()
e8:_sfx"Click"
if gs>=#gr then close()else gs+=1 paint()end
end)
paint()
end



function f9.Tab(gp,gq)
return e_({
Window=f9,opts=fq,Th=fv,pgui=fy,
pages=f8,nav=f5,pill=f7,subLbl=fM,
},gq)
end


function f9.EspPreview(gp,gq)
return e6({Window=f9,Th=fv,main=fB,gui=fx},gq)
end

function f9.SaveConfig(gp,gq)
eY.Save(gp,gq)
end
function f9.LoadConfig(gp,gq)
eY.Load(gp,gq)
end


f9._focusIdx=1
local gp




local function focusables()
local gq=f9._active
if not gq then return{}end
local gr={}
for gs,gt in ipairs(gq.Elements)do
if gt.Frame and gt.Frame.Visible and gt.Frame.Parent then
local gu,gv=pcall(function()return gt.Frame.AbsoluteSize.Y>4 end)
if gu and gv then table.insert(gr,gt)end
end
end
return gr
end
function f9.FocusMove(gq,gr)
if not gq._visible then return end
if gq._palette and gq._palette.open then return end
local gs=focusables()
if#gs==0 then return end
gq._focusIdx=((gq._focusIdx-1+gr)%#gs)+1
local gt=gs[gq._focusIdx]
if not gt or not gt.Frame then return end
if not gp then
gp=Instance.new"UIStroke"gp.Thickness=1.5
gp.Transparency=0.15
e8:_tag(gp,"Color","Accent")
end
pcall(function()
gp.Parent=gt.Frame
local gu=gq._active and gq._active.Page
if gu then
local gv=gt.Frame.AbsolutePosition.Y
local gw=gu.AbsolutePosition.Y
gu.CanvasPosition=Vector2.new(0,math.max(0,gu.CanvasPosition.Y+(gv-gw)-120))
end
end)
e8:_sfx"Hover"
end
function f9.FocusActivate(gq)
if not gq._visible then return end
local gr=focusables()
local gs=gr[gq._focusIdx]
if not gs then return end
gq:_flash(gs.Frame)
if gs._go then pcall(gs._go)end
end


f9._clean=f9._clean or{on=false,idle=6,last=os.clock(),faded=false,edge=nil}
function f9.SetCleanScreen(gq,gr,gs)
gr=gr and true or false
gq._clean.on=gr
if gs then gq._clean.idle=math.clamp(tonumber(gs)or 6,2,60)end
gq._clean.last=os.clock()
if not gr and gq._clean.faded then gq:_cleanRestore()end
if gr then gq:_cleanTouch()end
end
function f9._cleanTouch(gq)gq._clean.last=os.clock()end
function f9._cleanFade(gq)
if gq._clean.faded or not gq._visible or gq._mini then return end
gq._clean.faded=true
fa(fB,e9.Med,{GroupTransparency=0.88})
dimTo(1,e9.Med)
if not gq._clean.edge then
local gr=Instance.new"TextButton"
gr.Name=ad.GetStealthName()
gr.Text=""gr.AnchorPoint=Vector2.new(0,0.5)gr.Position=UDim2.new(0,0,0.5,0)
gr.Size=UDim2.fromOffset(6,120)gr.BackgroundColor3=fv.Accent
gr.BackgroundTransparency=0.35 gr.BorderSizePixel=0 gr.ZIndex=200
fc(gr,99)gr.Parent=fx
e8:_tag(gr,"BackgroundColor3","Accent")
gr.MouseEnter:Connect(function()gq:_cleanRestore()end)
gr.InputBegan:Connect(function(gs)
if gs.UserInputType==Enum.UserInputType.Touch then gq:_cleanRestore()end
end)
gq._clean.edge=gr
else
gq._clean.edge.Visible=true
end
end
function f9._cleanRestore(gq)
if not gq._clean.faded then gq._clean.last=os.clock()return end
gq._clean.faded=false
gq._clean.last=os.clock()
if not gq._visible or gq._mini then return end
fa(fB,e9.Med,{GroupTransparency=0})
dimTo(0.5,e9.Med)
if gq._clean.edge then gq._clean.edge.Visible=false end
e8:_sfx"Hover"
end
f9:Track(fn.InputChanged:Connect(function(gq)
if gq.UserInputType~=Enum.UserInputType.MouseMovement
and gq.UserInputType~=Enum.UserInputType.Touch then return end
if f9._clean.on and f9._clean.faded then
local gr=gq.Position
local gs,gt=pcall(function()
local gs,gt=fB.AbsolutePosition,fB.AbsoluteSize
return gr.X>=gs.X-30 and gr.X<=gs.X+gt.X+30
and gr.Y>=gs.Y-30 and gr.Y<=gs.Y+gt.Y+30
end)
if gr.X<=24 then f9:_cleanRestore()return end
if gs and gt then f9:_cleanRestore()return end
end
f9:_cleanTouch()
end))
f9:Track(fn.InputBegan:Connect(function(gq)
if gq.UserInputType==Enum.UserInputType.MouseButton1
or gq.UserInputType==Enum.UserInputType.Touch then
if f9._clean.on and f9._clean.faded then f9:_cleanRestore()else f9:_cleanTouch()end
end
end))
task.spawn(function()
while fx.Parent do
task.wait(0.5)
pcall(function()
if f9._clean.on and not f9._clean.faded and f9._visible and not f9._mini then
if os.clock()-f9._clean.last>f9._clean.idle then
f9:_cleanFade()
end
end
end)
end
end)


function f9.SetPerformance(gq,gr)
gr=gr and true or false
e8._perfLow=gr
if gr then e8:SetAcrylic(false)end
pcall(function()
for gs,gt in ipairs(fB:GetDescendants())do
if gt.Name=="_light"or gt.Name=="_toplight"then gt.Visible=not gr end
if gt:IsA"UIShadow"then gt.Enabled=not gr end
end
end)
if not gr and gq._acrylicPref then e8:SetAcrylic(true,fq.Blur or 16)end
end


function f9.ExportString(gq)
return eY.Export(gq)
end
function f9.ImportString(gq,gr)
return eY.Import(gq,gr)
end
function f9.AutoSave(gq,gr,gs,gt)
eY.AutoSave(gq,gr,gs,gt)
end

function f9.SetBadge(gq,gr,gs)
if not gr or not(gr.Btn or gr.Button)then return end
local gt=gr.Btn or gr.Button
local gu=gt:FindFirstChild"_badge"
if not gs or gs==""or gs==0 then
if gu then pcall(function()gu:Destroy()end)end
return
end
if not gu then
gu=Instance.new"Frame"gu.Name="_badge"
gu.AnchorPoint=Vector2.new(1,0.5)gu.Position=UDim2.new(1,-8,0.5,0)
gu.Size=UDim2.new(0,20,0,16)gu.BackgroundColor3=Color3.fromRGB(248,113,113)
gu.BorderSizePixel=0 fc(gu,99)gu.Parent=gt gu.ZIndex=4
local gv=Instance.new"TextLabel"gv.Name="_l"gv.BackgroundTransparency=1
gv.Size=UDim2.fromScale(1,1)gv.Font=Enum.Font.GothamBold
gv.TextSize=10 gv.TextColor3=Color3.fromRGB(255,255,255)gv.Parent=gu
end
pcall(function()
local gv=gu:FindFirstChild"_l"
gv.Text=tostring(gs)
gu.Size=UDim2.new(0,math.clamp(10+string.len(tostring(gs))*7,20,64),0,16)
end)
end

function f9.Debug(gq)
local gr={}
local function log(gs)table.insert(gr,tostring(gs))end
log("version="..tostring(e8.Version).." visible="..tostring(gq._visible))
local gs=(e8._gui and e8._gui.Parent)and 1 or 0
log("hubs="..tostring(gs))
local function box(gt,gu)
local gv,gw=pcall(function()
return gu.." class="..gt.ClassName
.." clip="..tostring(gt.ClipsDescendants)
.." pos="..tostring(gt.AbsolutePosition)
.." size="..tostring(gt.AbsoluteSize)
end)
log(gv and gw or(gu.." ERR"))
end
box(gq._main,"main")
box(gq._body,"body")
box(gq._pages,"pages")
for gt,gu in ipairs(gq._tabs)do
local gv=gu.Page
local gw,gx=pcall(function()
return"page["..gu.Title.."] vis="..tostring(gv.Visible)
.." clip="..tostring(gv.ClipsDescendants)
.." vp="..tostring(gv.AbsoluteSize)
.." canvas="..tostring(gv.AbsoluteCanvasSize)
.." canvPos="..tostring(gv.CanvasPosition)
.." scroll="..tostring(gv.ScrollingEnabled)
end)
log(gw and gx or("page["..tostring(gu.Title).."] ERR"))
pcall(function()
local gy,gz=gv.AbsolutePosition.Y,gv.AbsoluteSize.Y
local gA,gB=0,0
for gC,gD in ipairs(gu.Elements)do
if gD.Frame and gD.Frame.Visible then
gB=gB+1
local gE,gF=gD.Frame.AbsolutePosition.Y,gD.Frame.AbsoluteSize.Y
if gE+gF<gy or gE>gy+gz then gA=gA+1 end
end
end
log("  rows="..gB.." outsideViewport="..gA)
end)
end
log"done"
return table.concat(gr,"\n")
end

function f9.Destroy(gq)
if gq._destroyed then return end
gq._destroyed=true
local gr=gq._onCloseCb
gq._onCloseCb=nil
if type(gr)=="function"then task.spawn(function()pcall(gr)end)end
for gs,gt in ipairs(gq._conns)do pcall(function()gt:Disconnect()end)end
gq._conns={}
for gs,gt in pairs(e8.Sound._cache)do pcall(function()gt:Stop()gt:Destroy()end)end
e8.Sound._cache={}
e8:SetAcrylic(false)
if e8._gui==fx then e8._gui=nil end
pcall(function()gc:Destroy()end)
pcall(function()fx:Destroy()end)
pcall(function()fy:Destroy()end)
end

ad.registerUnload(function()
pcall(function()f9:Destroy()end)
end)
af.paintFonts(fx)
aa._lastWindow=f9
return f9
end end function a._():typeof(__modImpl())local aa=a.cache._ if not aa then aa={c=__modImpl()}a.cache._=aa end return aa.c end end do local function __modImpl()




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
local eY=ae:Log{Title="Console",Lines={"hub loaded"}}
eY:Add"aimbot armed"
local e_=ab:Tab{Title="Visuals",Icon="eye"}
e_:Section"ESP"
local e6
local e7
local e8
e6=ab:EspPreview{Title="Chams preview",
Accent=Color3.fromRGB(110,140,255),Mode="Chams",
OnClose=function()if e7 then e7:Set(false,true)end end}
e8=e_:RigPreview{Title="Rig Preview",Mode="Chams"}
e7=e_:Toggle{Title="Show preview",Description="Pops out right, live rig",Value=false,
Callback=function(e9)e6:SetVisible(e9)end}
e_:Toggle{Title="Box ESP",Value=true,Flag="BoxESP",
Callback=function(e9)e6:SetBox(e9)e8:SetBox(e9)end}
e_:Colorpicker{Title="ESP Color",Value=Color3.fromRGB(110,140,255),Flag="ESPColor",
Callback=function(e9)e6:SetAccent(e9)e8:SetAccent(e9)end}
e_:Dropdown{Title="Preview style",
Values={"Chams","Box","Outline","HP bar","Name","Ghost","Noob","Solid"},Value="Chams",
Callback=function(e9)e6:SetMode(e9)e8:SetMode(e9)end}
e_:Slider{Title="Preview health",Min=0,Max=100,Step=1,Value=100,
Callback=function(e9)e6:SetHealth(e9)e8:SetHealth(e9)end}
e_:Dropdown{Title="Chams",Values={"Enemies","Team","NPCs","Chests","Ores"},
Multi=true,Value={"Enemies"},Flag="Chams"}
local e9=ab:Tab{Title="Settings",Icon="settings"}
e9:Profile{Name="kronos_user",Tag="Premium | keyless"}
e9:Section"Interface"
e9:Dropdown{Title="Theme",
Values={"Kronos","Dark","Midnight","Light","Rose","Indigo","Forest","Amber","Ocean","Crimson","Ghost","Cyberpunk","Terminal","Discord","Mono"},
Value="Kronos",Callback=function(fa)ab:SetTheme(fa)end}
e9:Colorpicker{Title="Accent color",Description="Repaints every accent live",
Value=Color3.fromRGB(232,236,245),
Callback=function(fa)ab:SetAccent(fa)end}
e9:Dropdown{Title="Font",Description="Bigger, bolder, yours",
Values={"Gotham+","Gotham","Builder","Arimo","Source","Cartoon","Arcade","SciFi","Fantasy","Highway"},
Value="Gotham+",Callback=function(fa)aa:SetFontPack(fa)end}
e9:Slider{Title="UI scale",Min=70,Max=125,Step=5,Value=100,
Callback=function(fa)ab:SetScale(fa/100)end}
e9:Toggle{Title="Compact mode",Description="Smaller card, tighter lists",Value=false,
Callback=function(fa)ab:SetCompact(fa)end}
e9:Toggle{Title="Focus mode",Description="Hide sidebar, just content",Value=false,
Callback=function(fa)ab:SetFocus(fa)end}
e9:Toggle{Title="Acrylic",Description="Card glass",Value=true,
Callback=function(fa)ab:ToggleAcrylic(fa)end}
e9:Toggle{Title="Transparency",Description="Ghost mode",Value=false,
Callback=function(fa)ab:ToggleTransparency(fa)end}
e9:Toggle{Title="Background",Description="Dim + tint behind the hub",Value=true,
Callback=function(fa)ab:SetBackdrop(fa)end}
e9:Toggle{Title="UI Sounds",Description="Clicks, toggles, notifications",Value=true,
Callback=function(fa)aa.Sound.Enabled=fa end}
e9:Keybind{Title="Panic key",Value=Enum.KeyCode.F,
Callback=function()ab:SetVisible(false)end}
e9:Keybind{Title="Hide UI key",Description="Rebinds the hide hotkey",
Value=Enum.KeyCode.RightControl,
Callback=function(fa)ab:SetToggleKey(fa)end}
e9:Button{Title="Keybinds panel",Description="Slide-over, click a row to rebind",
Callback=function()ab:ToggleKeybindList()end}
e9:Button{Title="Command palette",Description="Same as Ctrl+K",
Callback=function()ab:TogglePalette(true)end}
e9:Section"Profiles"
e9:Profiles{Title="My profiles"}
ab:Notify{Title="Kronos loaded",Content="Ctrl+K palette | RightControl hide",Duration=5}
aa:RefreshFonts()
end)
end end function a.aa():typeof(__modImpl())local aa=a.cache.aa if not aa then aa={c=__modImpl()}a.cache.aa=aa end return aa.c end end end




local aa=a.a()
local ab=a.b()a.c()a.e()


local ac=a.f()
local ad=a.g()
local ae=a.h()
local af=a.i()
local eY=a.j()
local e_=a._()

ab.claimUnload()

local e6=aa
e6.Themes=af.Themes
e6.Icons=ac.Icons
e6.IconAlias=ac.IconAlias

e6._tag=function(e7,e8,e9,fa)
return af.tag(e8,e9,fa)
end
e6.agrad=function(e7,e8,e9)
return af.agrad(e8,e9)
end
e6.oa=function(e7,e8)
return af.oa(e8)
end
e6.SetTheme=function(e7,e8)
return af.SetTheme(e8)
end
e6.SetAccent=function(e7,e8)
return af.SetAccent(e8)
end
e6.SetAcrylic=function(e7,e8,e9)
return eY.SetAcrylic(e8,e9)
end
e6.ToggleAcrylic=function(e7,e8)
return eY.ToggleAcrylic(e8)
end
e6._sfx=function(e7,e8)
return ad.sfx(e8)
end
e6.SetFontPack=function(e7,e8)
return ae.SetFontPack(e8)
end
e6.RefreshFonts=function(e7)
return ae.RefreshFonts()
end
e6._paintFonts=function(e7,e8)
return ae.paintFonts(e8)
end
e6.SetMotion=function(e7,e8)
aa.ReducedMotion=not(e8 and true or false)
end
e6.SetSharp=function(e7,e8)
return af.SetSharp(e8)
end
e6.Debug=function(e7)
local e8=aa._lastWindow
if e8 and e8.Debug then
local e9,fa=pcall(function()return e8:Debug()end)
if e9 and fa then print(fa)return fa end
end
return nil
end

e6.CreateWindow=e_


local e7=a.aa()
e7(e6)

return e6
