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
]]
local a={cache={}::any}do do local function __modImpl()
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




local i="rbxassetid://90467498707278"
local j="rbxassetid://6031068423"
local k=Color3.fromRGB(150,155,172)
local function starRow(l,m,n,o,p,q)
n=math.max(1,n or 5)
p=p or 20
local r=Instance.new"Frame"r.BackgroundTransparency=1
r.Size=UDim2.new(1,0,0,p)r.LayoutOrder=m or 1 r.Parent=l
local s=Instance.new"UIListLayout"
s.FillDirection=Enum.FillDirection.Horizontal
s.HorizontalAlignment=Enum.HorizontalAlignment.Center
s.VerticalAlignment=Enum.VerticalAlignment.Center
s.Padding=UDim.new(0,8)s.Parent=r
local t={}
local u=math.clamp(q or 0,0,n)
local v={frame=r}
local function paint(w)
local x=w or u
for y,z in ipairs(t)do
local A=y<=x
z.Image=A and j or i
d(z,e.Hover,{ImageColor3=A and o or k})
end
end
function v.Get()return u end
function v.Set(w)
u=math.clamp(math.round(tonumber(w)or 0),0,n)
paint()
end
function v.Nudge()
for w,x in ipairs(t)do d(x,TweenInfo.new(0.06),{Rotation=8})end
task.delay(0.06,function()
for w,x in ipairs(t)do d(x,TweenInfo.new(0.12),{Rotation=0})end
end)
end
for w=1,n do
local x=Instance.new"ImageButton"
x.Name="Star"..w
x.BackgroundTransparency=1
x.AutoButtonColor=false
x.Image=i
x.ImageColor3=k
x.Size=UDim2.fromOffset(p,p)
x.LayoutOrder=w
x.Parent=r
x.MouseEnter:Connect(function()paint(w)end)
x.MouseLeave:Connect(function()paint()end)
x.MouseButton1Click:Connect(function()
u=w
paint()
end)
t[w]=x
end
paint()
return v
end


local function feedbackRow(l,m,n,o)
local p=Instance.new"Frame"p.BackgroundTransparency=1
p.Size=UDim2.new(1,0,0,n or 26)p.LayoutOrder=m or 2 p.Parent=l
local q=Instance.new"TextBox"
q.PlaceholderText=o or"Leave a comment..."
q.PlaceholderColor3=Color3.fromRGB(120,126,142)
q.Text=""q.Font=Enum.Font.Gotham q.TextSize=12
q.Position=UDim2.new(0,0,0,0)q.Size=UDim2.new(1,-40,1,0)
q.BackgroundColor3=Color3.fromRGB(28,30,40)
q.BorderSizePixel=0 corner(q,7)q.ClearTextOnFocus=false q.Parent=p
pad(q,0,0,8,8)
local r=Instance.new"TextButton"r.Text=""
r.AnchorPoint=Vector2.new(1,0)r.Position=UDim2.new(1,0,0,0)
r.Size=UDim2.fromOffset(32,n or 26)
r.BackgroundColor3=Color3.fromRGB(45,48,60)
r.BorderSizePixel=0 corner(r,7)r.AutoButtonColor=false r.Parent=p
local s=Instance.new"TextLabel"s.BackgroundTransparency=1
s.Size=UDim2.fromScale(1,1)s.Font=Enum.Font.GothamBold
s.TextSize=12 s.TextColor3=Color3.fromRGB(235,238,245)
s.Text=">"s.Parent=r
return{frame=p,Box=q,SendBtn=r}
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
Bg=Color3.fromRGB(8,5,6),Surface=Color3.fromRGB(16,10,11),
Surface2=Color3.fromRGB(30,17,19),Text=Color3.fromRGB(255,242,242),
Dim=Color3.fromRGB(150,130,130),Accent=Color3.fromRGB(178,34,34),
Accent2=Color3.fromRGB(122,20,20),Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),Danger=Color3.fromRGB(255,90,90),
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

return{SetAcrylic=SetAcrylic,ToggleAcrylic=ToggleAcrylic}end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()a.a()





local b=a.b()

local c=b.cloneref_check(game:GetService"HttpService")

local function reqFn()
return b.hasFn"syn"and b.hasFn"syn".request
or b.hasFn"http_request"
or b.hasFn"request"
end

local function identityPath()
return"Kronos/identity.txt"
end
local function getOrCreateIdentity()
local d
pcall(function()
local e,f=b.hasFn"readfile",b.hasFn"isfile"
if e and f and f(identityPath())then
d=e(identityPath())
end
end)
if d and d~=""then return{Id=d}end
d="kronos-"..string.gsub(c:GenerateGUID(false),"[{}-]","")
pcall(function()
local e,f,g=b.hasFn"writefile",b.hasFn"makefolder",b.hasFn"isfolder"
if f and g and not g"Kronos"then f"Kronos"end
if e then e(identityPath(),d)end
end)
return{Id=d}
end

local function sanitize(d,e)
d=tostring(d or"")
d=d:gsub("%c","")
if e and#d>e then d=string.sub(d,1,e)end
return d
end

local function create(d)
d=d or{}
local e=d.BaseUrl
local f=d.Script or"default"
local g=getOrCreateIdentity()
local h=reqFn()
local i=0
local j=10

local function apiRequest(k,l,m)
if not h then
return nil,"Your executor doesn't support HTTP requests."
end
if not e or e==""then
return nil,"No cloud BaseUrl configured."
end
local n,o=pcall(h,{
Url=e..l,
Method=k,
Headers={
["Content-Type"]="application/json",
["X-KronosUI-Identity"]=g.Id,
["X-KronosUI-Script"]=f,
},
Body=m and c:JSONEncode(m)or nil,
})
if not n then return nil,tostring(o)end
if o.StatusCode and(o.StatusCode<200 or o.StatusCode>=300)then
local p=o.Body
local q,r=pcall(function()return c:JSONDecode(o.Body)end)
if q and type(r)=="table"and r.error then
p=tostring(r.error)
end
return nil,"HTTP "..tostring(o.StatusCode)..": "..tostring(p)
end
if o.Body==nil or o.Body==""then return{},nil end
local p,q=pcall(function()return c:JSONDecode(o.Body)end)
if not p then return nil,"Failed to decode response."end
return q,nil
end

local k={Identity=g.Id}

function k.List(l,m)
m=m or{}
local n="?sort="..c:UrlEncode(m.Sort or"top")
if m.Query and m.Query~=""then
n=n.."&q="..c:UrlEncode(m.Query)
end
if m.Cursor then
n=n.."&cursor="..c:UrlEncode(tostring(m.Cursor))
end
n=n.."&limit="..tostring(m.PageSize or 20)
local o,p=apiRequest("GET","/configs"..n)
if not o then return nil,p end
return o.Items or{},o.NextCursor
end
function k.ListMine(l)
local m,n=apiRequest("GET","/configs/mine")
if not m then return nil,n end
return m.Items or{}
end
function k.GetByShareCode(l,m)
return apiRequest("GET","/configs/code/"..c:UrlEncode(tostring(m)))
end
function k.Publish(l,m,n)
m=m or{}
local o=os.clock()
if o-i<j then
return nil,string.format("Please wait %ds before publishing again.",
math.ceil(j-(o-i)))
end
local p=sanitize(m.Name,60)
if p==""then return nil,"Name was empty."end
i=o
return apiRequest("POST","/configs",{
name=p,
description=sanitize(m.Description or"",280),
data=n or{},
})
end
function k.Heartbeat(l)
pcall(apiRequest,"POST","/heartbeat",{})
end
function k.GetActiveCount(l)
local m,n=apiRequest("GET","/active")
if not m then return nil,n end
return m.count or m.Count or 0
end

return k
end

return{create=create,sanitize=sanitize}end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()a.a()





local b=a.b()

local c=b.cloneref_check(game:GetService"HttpService")

local function reqFn()
return b.hasFn"syn"and b.hasFn"syn".request
or b.hasFn"http_request"
or b.hasFn"request"
end

local function create(d)
d=d or{}
local e=d.Providers or{}
local f=math.clamp(tonumber(d.MaxRounds)or 6,1,20)
local g=tonumber(d.MaxTokens)or 800
local h=d.SystemPrompt or"Keep answers short and useful."
local i=d.Context or{}
local j=i.Enabled~=false
local k={}
local l=false
local m=false

local n={}

function n.SetContextEnabled(o,p)
j=p and true or false
end
function n.Reset(o)
k={}
l=false
end
function n.Stop(o)
l=true
end
function n.IsBusy(o)return m end

local function ctxBlock()
if not j then return nil end
local o={}
for p,q in pairs(i)do
if p~="Enabled"and type(q)~="function"then
o[p]=q
end
end
return o
end

function n.Ask(o,p,q)
q=tostring(q or"")
if q==""or m then return end
m,l=true,false
if p and p.AddMessage then
pcall(function()p:AddMessage("you",q)end)
pcall(function()p:SetTyping(true)end)
end
table.insert(k,{role="user",text=q})
while#k>f*2 do table.remove(k,1)end
task.spawn(function()
local r,s
local t=reqFn()
if not t then
r=nil s="no-request"
else
for u,v in ipairs(e)do
if l then break end
if v.Endpoint=="mock"then
task.wait(0.4)
if not l then r="Mock reply to: "..q end
break
end
local w,x=pcall(t,{
Url=v.Endpoint,
Method="POST",
Headers={["Content-Type"]="application/json"},
Body=c:JSONEncode{
message=q,
history=k,
system=h,
maxTokens=g,
context=ctxBlock(),
script=d.Script,
},
})
if l then break end
local y=w and x and x.StatusCode or 0
if w and(y==0 or(y>=200 and y<300))then
local z,A=pcall(function()
return c:JSONDecode(x.Body)
end)
if z and type(A)=="table"then
r=A.text or A.reply or A.message
or A.output or A.response
elseif z then
r=tostring(A)
end
if r and r~=""then break end
r=nil s="empty"
else
s=y
if y~=429 then break end
end
end
end
m=false
if l then
if p and p.AddMessage then
pcall(function()p:SetTyping(false)end)
end
return
end
if r and r~=""then
table.insert(k,{role="assistant",text=r})
while#k>f*2 do table.remove(k,1)end
end
if p then
pcall(function()p:SetTyping(false)end)
pcall(function()
p:AddMessage("ai",(r and r~="")and r
or("No answer ("..tostring(s or"?")..")"))
end)
end
end)
end

return n
end

return{create=create}end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()


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
local function AutoSave(f,g,h,i)if f._autoConn then pcall(function()f._autoConn:Disconnect()end)f._autoConn=nil end
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

local function deepcopy(f,g)
if type(f)~="table"then return f end
g=g or{}
if g[f]then return g[f]end
local h={}
g[f]=h
for i,j in pairs(f)do h[deepcopy(i,g)]=deepcopy(j,g)end
return h
end

local function Snapshot()
return{flags=deepcopy(b.Flags),at=os.clock()}
end
local function Restore(f)
if type(f)~="table"or type(f.flags)~="table"then return false end
for g,h in pairs(f.flags)do
b.Flags[g]=deepcopy(h)
local i=b._live[g]
if i then
for j,k in ipairs(i)do pcall(k,deepcopy(h),true)end
end
end
return true
end


local function GetFlags()
return collectFlags()
end
local function ApplyTable(f,g)
if type(g)~="table"then return false end
applyData(f,g)
return true
end

return{Save=Save,Load=Load,Export=Export,Import=Import,AutoSave=AutoSave,Snapshot=Snapshot,Restore=Restore,GetFlags=GetFlags,ApplyTable=ApplyTable}end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()



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
end end function a.n():typeof(__modImpl())local b=a.cache.n if not b then b={c=__modImpl()}a.cache.n=b end return b.c end end do local function __modImpl()




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
end end function a.o():typeof(__modImpl())local b=a.cache.o if not b then b={c=__modImpl()}a.cache.o=b end return b.c end end do local function __modImpl()




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
end end function a.p():typeof(__modImpl())local aa=a.cache.p if not aa then aa={c=__modImpl()}a.cache.p=aa end return aa.c end end do local function __modImpl()




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
end end function a.q():typeof(__modImpl())local aa=a.cache.q if not aa then aa={c=__modImpl()}a.cache.q=aa end return aa.c end end do local function __modImpl()




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
end end function a.r():typeof(__modImpl())local aa=a.cache.r if not aa then aa={c=__modImpl()}a.cache.r=aa end return aa.c end end do local function __modImpl()






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
end end function a.s():typeof(__modImpl())local aa=a.cache.s if not aa then aa={c=__modImpl()}a.cache.s=aa end return aa.c end end do local function __modImpl()



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
end end function a.t():typeof(__modImpl())local aa=a.cache.t if not aa then aa={c=__modImpl()}a.cache.t=aa end return aa.c end end do local function __modImpl()




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
end end function a.u():typeof(__modImpl())local aa=a.cache.u if not aa then aa={c=__modImpl()}a.cache.u=aa end return aa.c end end do local function __modImpl()




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
end end function a.v():typeof(__modImpl())local aa=a.cache.v if not aa then aa={c=__modImpl()}a.cache.v=aa end return aa.c end end do local function __modImpl()






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
end end function a.w():typeof(__modImpl())local aa=a.cache.w if not aa then aa={c=__modImpl()}a.cache.w=aa end return aa.c end end do local function __modImpl()



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
end end function a.x():typeof(__modImpl())local aa=a.cache.x if not aa then aa={c=__modImpl()}a.cache.x=aa end return aa.c end end do local function __modImpl()






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

local bY=bg._popouts
if bY then
for bZ,b_ in ipairs(bY)do
local b0=b_.frame
if b0 and b0.Visible and b0.Parent then
local b1,b2=b0.AbsolutePosition,b0.AbsoluteSize
if b2.X>0 and bX<b1.X+b2.X+bS and bX+bP>b1.X
and bW<b1.Y+b2.Y and bW+bQ>b1.Y then
bX=b1.X+b2.X+bS
end
end
end
if bX+bP>bR.X-10 then
bX=math.max(10,bR.X-bP-10)
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
end end function a.y():typeof(__modImpl())local aa=a.cache.y if not aa then aa={c=__modImpl()}a.cache.y=aa end return aa.c end end do local function __modImpl()



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
end end function a.z():typeof(__modImpl())local aa=a.cache.z if not aa then aa={c=__modImpl()}a.cache.z=aa end return aa.c end end do local function __modImpl()




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
end end function a.A():typeof(__modImpl())local aa=a.cache.A if not aa then aa={c=__modImpl()}a.cache.A=aa end return aa.c end end do local function __modImpl()




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
end end function a.B():typeof(__modImpl())local aa=a.cache.B if not aa then aa={c=__modImpl()}a.cache.B=aa end return aa.c end end do local function __modImpl()




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
end end function a.C():typeof(__modImpl())local aa=a.cache.C if not aa then aa={c=__modImpl()}a.cache.C=aa end return aa.c end end do local function __modImpl()




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
end end function a.D():typeof(__modImpl())local aa=a.cache.D if not aa then aa={c=__modImpl()}a.cache.D=aa end return aa.c end end do local function __modImpl()




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
end end function a.E():typeof(__modImpl())local aa=a.cache.E if not aa then aa={c=__modImpl()}a.cache.E=aa end return aa.c end end do local function __modImpl()




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
end end function a.F():typeof(__modImpl())local aa=a.cache.F if not aa then aa={c=__modImpl()}a.cache.F=aa end return aa.c end end do local function __modImpl()




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
end end function a.G():typeof(__modImpl())local aa=a.cache.G if not aa then aa={c=__modImpl()}a.cache.G=aa end return aa.c end end do local function __modImpl()




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
end end function a.H():typeof(__modImpl())local aa=a.cache.H if not aa then aa={c=__modImpl()}a.cache.H=aa end return aa.c end end do local function __modImpl()






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
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()




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
end end function a.J():typeof(__modImpl())local aa=a.cache.J if not aa then aa={c=__modImpl()}a.cache.J=aa end return aa.c end end do local function __modImpl()




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
end end function a.K():typeof(__modImpl())local aa=a.cache.K if not aa then aa={c=__modImpl()}a.cache.K=aa end return aa.c end end do local function __modImpl()




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
end end function a.L():typeof(__modImpl())local aa=a.cache.L if not aa then aa={c=__modImpl()}a.cache.L=aa end return aa.c end end do local function __modImpl()




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
end end function a.M():typeof(__modImpl())local aa=a.cache.M if not aa then aa={c=__modImpl()}a.cache.M=aa end return aa.c end end do local function __modImpl()




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
end end function a.N():typeof(__modImpl())local aa=a.cache.N if not aa then aa={c=__modImpl()}a.cache.N=aa end return aa.c end end do local function __modImpl()




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
end end function a.O():typeof(__modImpl())local aa=a.cache.O if not aa then aa={c=__modImpl()}a.cache.O=aa end return aa.c end end do local function __modImpl()




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
end end function a.P():typeof(__modImpl())local aa=a.cache.P if not aa then aa={c=__modImpl()}a.cache.P=aa end return aa.c end end do local function __modImpl()




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
end end function a.Q():typeof(__modImpl())local aa=a.cache.Q if not aa then aa={c=__modImpl()}a.cache.Q=aa end return aa.c end end do local function __modImpl()




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
end end function a.R():typeof(__modImpl())local aa=a.cache.R if not aa then aa={c=__modImpl()}a.cache.R=aa end return aa.c end end do local function __modImpl()





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
end end function a.S():typeof(__modImpl())local aa=a.cache.S if not aa then aa={c=__modImpl()}a.cache.S=aa end return aa.c end end do local function __modImpl()







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
end end function a.T():typeof(__modImpl())local aa=a.cache.T if not aa then aa={c=__modImpl()}a.cache.T=aa end return aa.c end end do local function __modImpl()





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
end end function a.U():typeof(__modImpl())local aa=a.cache.U if not aa then aa={c=__modImpl()}a.cache.U=aa end return aa.c end end do local function __modImpl()





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
end end function a.V():typeof(__modImpl())local aa=a.cache.V if not aa then aa={c=__modImpl()}a.cache.V=aa end return aa.c end end do local function __modImpl()





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



local function normalizeFeedback(eL)
eL=tostring(eL or"")
eL=eL:gsub("[\226\128\139\226\128\142\226\128\143\239\187\191\194\173]","")
eL=eL:gsub("%s+"," ")
eL=eL:gsub("^%s+","")
eL=eL:gsub("%s+$","")
return eL
end
local eL={
"d%s*i%s*s%s*c%s*o%s*r%s*d","t%s*e%s*l%s*e%s*g%s*r%s*a%s*m",
"w%s*h%s*a%s*t%s*s%s*a%s*p%s*p","h%s*t%s*t%s*p%s*s","w%s*w%s*w",
"c%s*o%s*m","o%s*r%s*g","n%s*e%s*t",".%s*g%s*g",".%s*c%s*o%s*m",
"/%s*i%s*n%s*v%s*i%s*t%s*e",
}
local function feedbackBlocked(eM)
for eP,eR in ipairs(eL)do
if eM:match(eR)then return true end
end
return false
end

return function(eM,eP)
local eR=eM.row
local eS=eM.titleBlock
local eT=eM.reg local eU=
eM.tab
local eV=eM.Window local eW=
eM.Th local eX=
eM.opts or{}local eY=
eM.page
eP=eP or{}
local eZ=eP.Locked==true
local e_=math.max(1,eP.MaxStars or 5)
local e0=eP.Title and eP.Title~=""
local e1=eR(e0 and 108 or 84)
if e0 then
eS(e1,eP.Title,nil,24)
end
eF(e1,0.08)
if eP.Tooltip then eG(e1,eP.Tooltip)end
local e2=eI(e1,0,e_,eP.StarColor or Color3.fromRGB(255,196,64),20,eP.Default or 0)
e2.frame.Position=UDim2.new(0,12,0,e0 and 34 or 8)
local e3=eJ(e1,0,26,eP.Placeholder or"Leave a comment...")
e3.frame.Position=UDim2.new(0,12,0,e0 and 60 or 34)
e3.frame.Size=UDim2.new(1,-24,0,26)
local e4=eP.ClearOnSubmit~=false
e3.SendBtn.MouseButton1Click:Connect(function()
if eZ then return end
local e5=e2.Get()
if e5<=0 then e2.Nudge()return end
af:_sfx"Click"
local e6=normalizeFeedback(e3.Box.Text)
e3.Box.Text=e6
ew(eP.Callback,e5,e6)
if feedbackBlocked(e6)then
eV:Notify{Title="Blocked",Content="Links are not allowed here.",Duration=2}
e2.Nudge()
else
postWebhook(eP.WebhookUrl,e5,e6)
end
if e4 then
e3.Box.Text=""
e2.Set(eP.Default or 0)
end
end)
eH(e1,eZ)
local e5={}
function e5.Get(e6)return e2.Get(),e3.Box.Text end
function e5.Set(e6,e7,e8)
e2.Set(e7)
if e8~=nil then e3.Box.Text=e8 end
end
function e5.SetLocked(e6,e7)
eZ=e7 and true or false
eH(e1,eZ)
end
function e5.GetLocked(e6)return eZ end
return eT{Title=eP.Title or"Rating",Frame=e1,_handle=e5}
end end function a.W():typeof(__modImpl())local aa=a.cache.W if not aa then aa={c=__modImpl()}a.cache.W=aa end return aa.c end end do local function __modImpl()





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
local eS=ac.applyLock local eT=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(eV,eY)
local eZ=eV.row local e_=
eV.titleBlock
local e0=eV.reg local e1=
eV.tab local e2=
eV.Window
local e3=eV.Th local e4=
eV.opts or{}local e5=
eV.page
eY=eY or{}
local e6=eY.Locked==true
local e7=eY.Title or"Info"
local e8=eY.Items or{}
local e9=eY.Color
local fa=math.clamp(eY.Columns or 2,1,4)local
fb, fc, fd=32, 40, 8
local fe=math.ceil(#e8/fa)
local ff=fe>0 and(fe*fc+(fe-1)*fd)or 0
local fg=56+(fe>0 and(8+ff)or 0)+8
local fh=eZ(fg)
if e9 then
local fi=Instance.new"Frame"fi.BorderSizePixel=0
fi.Position=UDim2.new(0,0,0,14)fi.Size=UDim2.new(0,3,1,-28)
eI(fi,99)fi.BackgroundColor3=e9 fi.Parent=fh
end
local fi=Instance.new"TextLabel"fi.BackgroundTransparency=1
fi.Position=UDim2.new(0,14,0,8)fi.Size=UDim2.new(1,-28,0,18)
fi.Font=Enum.Font.GothamBold fi.TextSize=14 fi.TextXAlignment=0
fi.TextTruncate=Enum.TextTruncate.AtEnd fi.Text=e7 fi.Parent=fh
af:_tag(fi,"TextColor3","Text")
if eY.Description and eY.Description~=""then
local fj=Instance.new"TextLabel"fj.BackgroundTransparency=1
fj.Position=UDim2.new(0,14,0,28)fj.Size=UDim2.new(1,-28,0,14)
fj.Font=Enum.Font.Gotham fj.TextSize=11 fj.TextXAlignment=0
fj.TextTruncate=Enum.TextTruncate.AtEnd fj.Text=eY.Description fj.Parent=fh
af:_tag(fj,"TextColor3","Dim")
fb=46
else
fb=30
end
local fj={}
local fk=Instance.new"Frame"fk.BackgroundTransparency=1
fk.Position=UDim2.new(0,12,0,fb+8)
fk.Size=UDim2.new(1,-24,0,ff)fk.Parent=fh
local fl={}
local function build(fm)
for fn,fo in ipairs(fk:GetChildren())do pcall(function()fo:Destroy()end)end
table.clear(fj)
for fn,fo in ipairs(fm)do
local fp,fq=(fn-1)%fa,math.floor((fn-1)/fa)
local fr=Instance.new"Frame"
fr.Position=UDim2.new(fp/fa,fp==0 and 0 or 4,0,fq*(fc+fd))
fr.Size=UDim2.new(1/fa,fa==1 and 0 or-4,0,fc)
fr.BackgroundColor3=e3.Surface2 fr.BorderSizePixel=0
eI(fr,8)fr.Parent=fk
eJ(fr,true)
af:_tag(fr,"BackgroundColor3","Surface2")
local fs=Instance.new"TextLabel"fs.BackgroundTransparency=1
fs.Position=UDim2.new(0,10,0,4)fs.Size=UDim2.new(1,-20,0,12)
fs.Font=Enum.Font.GothamBold fs.TextSize=10 fs.TextXAlignment=0
fs.TextTruncate=Enum.TextTruncate.AtEnd
fs.Text=string.upper(tostring(fo.Label or fo.label or""))fs.Parent=fr
af:_tag(fs,"TextColor3","Dim")
local ft=Instance.new"TextLabel"ft.BackgroundTransparency=1
ft.Position=UDim2.new(0,10,0,18)ft.Size=UDim2.new(1,-20,0,16)
ft.Font=Enum.Font.GothamBold ft.TextSize=13 ft.TextXAlignment=0
ft.TextTruncate=Enum.TextTruncate.AtEnd
ft.Text=tostring(fo.Value or fo.value or"-")ft.Parent=fr
af:_tag(ft,"TextColor3","Text")
fj[tostring(fo.Label or fo.label or"")]=ft
end
end
function fl.SetValue(fm,fn,fo)
local fp=fj[tostring(fn)]
if fp then fp.Text=tostring(fo)end
end
function fl.Set(fm,fn)
e8=fn or{}
build(e8)
end
function fl.Get(fm)return e8 end
function fl.SetLocked(fm,fn)
e6=fn and true or false
eS(fh,e6)
end
function fl.GetLocked(fm)return e6 end
build(e8)
eS(fh,e6)
return e0{Title=e7,Frame=fh,_handle=fl}
end end function a.X():typeof(__modImpl())local aa=a.cache.X if not aa then aa={c=__modImpl()}a.cache.X=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local eI=
ab.T local eJ=
ab.tween local eS=
ac.guid local eT=
ac.spawnCb
local eV=ac.corner local eY=
ac.hairline local eZ=
ac.pad local e0=
ac.lighting local e3=
ac.ripple
local e5=ac.spotlight
local e6=ac.attachTip
local e7=ac.applyLock local e8=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(e9,fa)
local fb=e9.row
local fc=e9.titleBlock
local fd=e9.reg
local fe=e9.tab local ff=
e9.Window local fg=
e9.Th local fh=
e9.opts or{}local fi=
e9.page
fa=fa or{}
local fj=fa.Locked==true
local fk=fa.Service
local fl=fa.Interval or 30
local fm=fb(96)
fc(fm,fa.Title or"Active Users",fa.Description,24,true)
e5(fm,0.08)
if fa.Tooltip then e6(fm,fa.Tooltip)end
local fn=Instance.new"TextLabel"fn.BackgroundTransparency=1
fn.AnchorPoint=Vector2.new(1,0)fn.Position=UDim2.new(1,-14,0,8)
fn.Size=UDim2.new(0,120,0,34)fn.Font=Enum.Font.GothamBold
fn.TextSize=30 fn.TextXAlignment=1 fn.Text="--"fn.Parent=fm
af:_tag(fn,"TextColor3","Text")
local fo=Instance.new"TextLabel"fo.BackgroundTransparency=1
fo.AnchorPoint=Vector2.new(1,0)fo.Position=UDim2.new(1,-14,0,44)
fo.Size=UDim2.new(0,120,0,14)fo.Font=Enum.Font.Gotham
fo.TextSize=11 fo.TextXAlignment=1 fo.Text="active now"fo.Parent=fm
af:_tag(fo,"TextColor3","Dim")
local fp=Instance.new"Frame"
fp.Position=UDim2.new(0,14,0,48)fp.Size=UDim2.fromOffset(10,10)
fp.BorderSizePixel=0 eV(fp,99)fp.Parent=fm
af:_tag(fp,"BackgroundColor3","Success")
local fq={}
local fr=true
local function setCount(fs)
fn.Text=tostring(fs)
end
local function poll()
if fk then
pcall(function()fk:Heartbeat()end)
local fs,ft=pcall(function()return fk:GetActiveCount()end)
if fs and ft~=nil then
setCount(ft)
return
end
setCount"err"
return
end
if fa.Users then
setCount(#fa.Users)
else
setCount"--"
end
end
function fq.Refresh(fs)poll()end
function fq.Get(fs)return fn.Text end
function fq.SetLocked(fs,ft)
fj=ft and true or false
e7(fm,fj)
end
function fq.GetLocked(fs)return fj end
poll()
if fk then
task.spawn(function()
while fr and fm.Parent do
task.wait(math.clamp(tonumber(fl)or 30,5,600))
if fr and fm.Parent then pcall(poll)end
end
end)
end
fe._window:Track(function()fr=false end)
e7(fm,fj)
return fd{Title=fa.Title or"Active Users",Frame=fm,_handle=fq}
end end function a.Y():typeof(__modImpl())local aa=a.cache.Y if not aa then aa={c=__modImpl()}a.cache.Y=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.i()a.g()


local ae=a.b()

local af=aa local eV=
ab.T local e5=
ab.tween local e6=
ac.guid
local e7=ac.spawnCb
local e8=ac.corner
local e9=ac.hairline local fa=
ac.pad local fb=
ac.lighting local fc=
ac.ripple local fd=
ac.spotlight local fe=
ac.attachTip
local fi=ac.applyLock
local fj=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(fk,fl)
local fm=fk.row
local fn=fk.titleBlock
local fo=fk.reg local fp=
fk.tab local fq=
fk.Window
local fr=fk.Th local fs=
fk.opts or{}local ft=
fk.page
fl=fl or{}
local fu=fl.Locked==true
local fv=fl.Height or 300
local fw=math.max(1,fl.Columns or 2)
local fx=fl.Search~=false
local fy=fl.Sorts or{}
local fz=fl.DefaultSort or fy[1]
local fA=fm(fv)
if fl.Title then fn(fA,fl.Title,nil,24)end
local fB=fl.Title and 30 or 8
local fC,fD=""
if fx then
local fE=Instance.new"Frame"
fE.Position=UDim2.new(0,12,0,fB)fE.Size=UDim2.new(1,-24,0,28)
fE.BackgroundColor3=fr.Surface2 fE.BorderSizePixel=0
e8(fE,8)fE.Parent=fA
e9(fE,true)
af:_tag(fE,"BackgroundColor3","Surface2")
local fF=fj("search",13,fr.Dim)
fF.Position=UDim2.new(0,10,0.5,-7)fF.Parent=fE
fD=Instance.new"TextBox"
fD.PlaceholderText=fl.SearchPlaceholder or"Search..."
fD.PlaceholderColor3=fr.Dim fD.Text=""
fD.Font=Enum.Font.Gotham fD.TextSize=12
fD.TextXAlignment=0
fD.Position=UDim2.new(0,30,0,0)fD.Size=UDim2.new(1,-38,1,0)
fD.BackgroundTransparency=1 fD.ClearTextOnFocus=false fD.Parent=fE
af:_tag(fD,"TextColor3","Text")
fB+=36
end
if#fy>1 then
for fE,fF in ipairs(fy)do
local fG=Instance.new"TextButton"fG.Text=""
fG.Position=UDim2.new(0,12+(fE-1)*86,0,fB)
fG.Size=UDim2.new(0,80,0,22)fG.BackgroundColor3=fr.Surface2
fG.BackgroundTransparency=(fF==fz)and 0.4 or 1
fG.BorderSizePixel=0 e8(fG,6)fG.AutoButtonColor=false fG.Parent=fA
local fH=Instance.new"TextLabel"fH.BackgroundTransparency=1
fH.Size=UDim2.fromScale(1,1)fH.Font=Enum.Font.GothamBold
fH.TextSize=10 fH.Text=string.upper(tostring(fF))fH.Parent=fG
af:_tag(fH,"TextColor3",(fF==fz)and"Text"or"Dim")
fG.MouseButton1Click:Connect(function()
fz=fF
for fI,fJ in ipairs(fA:GetChildren())do
if fJ:IsA"TextButton"and fJ.Size.Y.Offset==22 then
fJ.BackgroundTransparency=1
end
end
fG.BackgroundTransparency=0.4
render()
end)
end
fB+=30
end
local fE=Instance.new"ScrollingFrame"
fE.Position=UDim2.new(0,8,0,fB)fE.Size=UDim2.new(1,-16,1,-fB-8)
fE.BackgroundTransparency=1 fE.BorderSizePixel=0
fE.ScrollBarThickness=3 fE.CanvasSize=UDim2.new(0,0,0,0)
fE.AutomaticCanvasSize=Enum.AutomaticSize.Y fE.Parent=fA
af:_tag(fE,"ScrollBarImageColor3","Surface2")
local fF=Instance.new"UIGridLayout"
fF.CellPadding=UDim2.fromOffset(8,8)
fF.CellSize=UDim2.new(1/fw,-8,0,fl.CardHeight or 76)
fF.SortOrder=Enum.SortOrder.LayoutOrder fF.Parent=fE
local fG={}
local fH={}
local function render()
for fI,fJ in ipairs(fE:GetChildren())do
if fJ:IsA"TextButton"then pcall(function()fJ:Destroy()end)end
end
local fI=string.lower(fC)
local fJ,fK=0,0
for fL,fM in ipairs(fH)do
fK+=1
local fN=string.lower(tostring(fM.Name or fM.Title or"")
.." "..tostring(fM.Description or"")
.." "..table.concat(fM.Tags or{}," "))
if fI~=""and not string.find(fN,fI,1,true)then continue end
fJ+=1
local fO=Instance.new"TextButton"fO.Text=""
fO.BackgroundColor3=fr.Surface2 fO.BorderSizePixel=0
e8(fO,8)fO.AutoButtonColor=false fO.LayoutOrder=fK fO.Parent=fE
e9(fO,true)
af:_tag(fO,"BackgroundColor3","Surface2")
local fP=Instance.new"TextLabel"fP.BackgroundTransparency=1
fP.Position=UDim2.new(0,10,0,8)fP.Size=UDim2.new(1,-20,0,16)
fP.Font=Enum.Font.GothamBold fP.TextSize=13 fP.TextXAlignment=0
fP.TextTruncate=Enum.TextTruncate.AtEnd
fP.Text=tostring(fM.Name or fM.Title or"Config")fP.Parent=fO
af:_tag(fP,"TextColor3","Text")
local fQ=Instance.new"TextLabel"fQ.BackgroundTransparency=1
fQ.Position=UDim2.new(0,10,0,26)fQ.Size=UDim2.new(1,-20,0,28)
fQ.Font=Enum.Font.Gotham fQ.TextSize=11 fQ.TextXAlignment=0
fQ.TextYAlignment=0 fQ.TextWrapped=true fQ.TextTruncate=Enum.TextTruncate.AtEnd
fQ.Text=tostring(fM.Description or"")fQ.Parent=fO
af:_tag(fQ,"TextColor3","Dim")
fO.MouseButton1Click:Connect(function()
if fu then return end
af:_sfx"Click"e7(fl.OnSelect,fM)
end)
end
if fJ==0 then
local fL=Instance.new"TextLabel"fL.BackgroundTransparency=1
fL.Size=UDim2.new(1,0,0,30)fL.Font=Enum.Font.Gotham
fL.TextSize=12 fL.Text=fl.EmptyText or"Nothing here yet."fL.Parent=fE
af:_tag(fL,"TextColor3","Dim")
end
end
function fG.Refresh(fI)
if type(fl.Fetch)=="function"then
local fJ,fK=pcall(fl.Fetch,{Query=fC,Sort=fz})
if fJ and type(fK)=="table"then fH=fK end
elseif type(fl.Items)=="table"then
fH=fl.Items
end
render()
end
function fG.Get(fI)return fH end
function fG.SetLocked(fI,fJ)
fu=fJ and true or false
fi(fA,fu)
end
function fG.GetLocked(fI)return fu end
if fD then
fD:GetPropertyChangedSignal"Text":Connect(function()
fC=fD.Text
render()
end)
end
fG:Refresh()
fi(fA,fu)
return fo{Title=fl.Title or"Cards",Frame=fA,_handle=fG}
end end function a.Z():typeof(__modImpl())local aa=a.cache.Z if not aa then aa={c=__modImpl()}a.cache.Z=aa end return aa.c end end do local function __modImpl()




local aa={
Section=a.n(),
Label=a.o(),
Divider=a.p(),
Progress=a.q(),
Log=a.r(),
Button=a.s(),
Toggle=a.t(),
Slider=a.u(),
Input=a.v(),
Dropdown=a.w(),
Keybind=a.x(),
Colorpicker=a.y(),
Profiles=a.z(),
Banner=a.A(),
StatsRow=a.B(),
Skeleton=a.C(),
Status=a.D(),
Empty=a.E(),
Profile=a.F(),
Cards=a.G(),
Recent=a.H(),
RigPreview=a.I(),
Segment=a.J(),
Radio=a.K(),
RangeSlider=a.L(),
Sparkline=a.M(),
Markdown=a.N(),
Code=a.O(),
Stepper=a.P(),
Table=a.Q(),
Timeline=a.R(),
Favorites=a.S(),
Avatar=a.T(),
Paragraph=a.U(),
Card=a.V(),
Rating=a.W(),
InfoGrid=a.X(),
ActiveUsersGrid=a.Y(),
CardGrid=a.Z(),
}

local ab=a.e()

local function attach(ac,ad)
for ae,af in pairs(aa)do
ac[ae]=function(e7,e8)
local e9=af(ad,e8)



if e8 and e8.Locked then
local fe=ad.tab
local fi=fe and fe.Elements and fe.Elements[#fe.Elements]
if fi and fi.Frame then
pcall(function()ab.applyLock(fi.Frame,true)end)
end
end
return e9
end
end
end

return{attach=attach,map=aa}end function a._():typeof(__modImpl())local aa=a.cache._ if not aa then aa={c=__modImpl()}a.cache._=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.i()
local af=a.g()
local e7=a.d()

local e8=aa
local e9=ab.T
local fe=ab.tween local fi=
ac.spawnCb
local fj=ac.corner
local fk=ac.hairline
local fl=ac.pad
local fm=ac.lighting
local fn=ad.makeIcon
local fo=a._()

return function(fr,ft)
local fu=fr.Window
local fv=fr.opts or{}
local fw=fr.Th
local fx=fr.pgui
local fy=fr.pages
local fz=fr.nav
local fA=fr.pill
local fB=fr.subLbl
ft=ft or{}
local fC=ft.Title or("Tab "..(#fu._tabs+1))
local fD=ft.Icon or fC

local fE=Instance.new"TextButton"
fE.Text=""
fE.Size=UDim2.new(1,0,0,34)
fE.BackgroundColor3=fw.Surface2
fE.BackgroundTransparency=1
fE.BorderSizePixel=0
fj(fE,8)
fE.LayoutOrder=#fu._tabs+10
fE.AutoButtonColor=false
fE.Parent=fz
fE.ZIndex=2
fE.Visible=true
local fF=#fu._tabs+1
local fG=fn(fD,15,fw.Dim)
fG.AnchorPoint=Vector2.new(0,0.5)
fG.Position=UDim2.new(0,14,0.5,0)
fG.Parent=fE
fG.Visible=true
fG.ZIndex=3
if fG:IsA"TextLabel"then fG.Size=UDim2.new(0,15,0,15)end
local fH=Instance.new"TextLabel"fH.BackgroundTransparency=1
fH.Position=UDim2.new(0,37,0,0)
fH.Size=UDim2.new(1,-49,1,0)
fH.Font=Enum.Font.GothamMedium
fH.TextSize=13
fH.TextXAlignment=0
fH.TextTruncate=Enum.TextTruncate.AtEnd
fH.Text=fC
fH.Parent=fE
fH.Visible=true
fH.TextTransparency=0
fH.ZIndex=3
ae.tag(fH,"TextColor3","Dim")
fE.MouseEnter:Connect(function()
if fu._active and fu._active.Btn==fE then return end
fe(fE,e9.Hover,{BackgroundTransparency=0.55})
ae.tag(fH,"TextColor3","Text")
end)
fE.MouseLeave:Connect(function()
if fu._active and fu._active.Btn==fE then return end
fe(fE,e9.Hover,{BackgroundTransparency=1})
ae.tag(fH,"TextColor3","Dim")
end)

local fI=Instance.new"ScrollingFrame"
fI.Visible=false
fI.Size=UDim2.fromScale(1,1)
fI.BackgroundTransparency=1
fI.BorderSizePixel=0
fI.ScrollBarThickness=3
fI.ScrollBarImageColor3=fw.Surface2
fI.CanvasSize=UDim2.new(0,0,0,0)
fI.AutomaticCanvasSize=Enum.AutomaticSize.Y
fI.Parent=fy
ae.tag(fI,"ScrollBarImageColor3","Surface2")
local fJ=Instance.new"UIListLayout"
fJ.Padding=UDim.new(0,8)
fJ.SortOrder=Enum.SortOrder.LayoutOrder
fJ.Parent=fI
fl(fI,2,8,2,6)




local fK=fI

local fL={Title=fC,Btn=fE,Page=fI,Elements={},_label=fH,_icon=fG}
fL._pl=fJ

local fM=fv.SubTitle or fv.Subtitle or"scripthub"

local function setActive(fN)
fu._active=fL
pcall(function()
fB.Text=string.upper(fM).."  /  "..string.upper(fC)
end)
for fO,fP in ipairs(fu._tabs)do
local fQ=fP==fL
fP.Page.Visible=fQ
local fR=fP._label
fR.TextTransparency=0
fe(fP.Btn,e9.Hover,{BackgroundTransparency=1})
if fQ then
ae.tag(fR,"TextColor3","Text")
if fP._icon and fP._icon:IsA"ImageLabel"then
fP._icon.ImageTransparency=0
fe(fP._icon,e9.Hover,{ImageColor3=aa.Theme.Accent})
end
else
ae.tag(fR,"TextColor3","Dim")
if fP._icon and fP._icon:IsA"ImageLabel"then
fP._icon.ImageTransparency=0
fe(fP._icon,e9.Hover,{ImageColor3=aa.Theme.Dim})
end
end
end
fe(fA,e9.Med,{Position=UDim2.new(0,0,0,(fF-1)*38-2)})
if fN then
fI.Position=UDim2.new(0,14,0,0)
fe(fI,e9.Med,{Position=UDim2.new(0,0,0,0)})
local fO=0
for fP,fQ in ipairs(fI:GetChildren())do
if fQ:IsA"Frame"or fQ:IsA"CanvasGroup"then
fO+=1
local fR=math.min(fO*0.02,0.3)
task.delay(fR,function()
if not fQ.Parent then return end
local fS=Instance.new"Frame"
fS.Name="_cascade"
fS.Size=UDim2.fromScale(1,1)
fS.BackgroundColor3=fw.Surface2
fS.BackgroundTransparency=0.55
fS.BorderSizePixel=0
fj(fS,10)
fS.Parent=fQ
fe(fS,e9.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()fS:Destroy()end)end)
end)
end
end
end
for fO,fP in ipairs(fu._tabChangeListeners or{})do
pcall(fP,fL)
end
end
fE.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

if ft.Hidden then fE.Visible=false end
fL._hidden=ft.Hidden and true or false
table.insert(fu._tabs,fL)

if string.lower(fC)=="settings"and not fu._settingsDock
and fu._dockAdd then
fu._settingsDock=true
fu._dockAdd("Settings",ft.Icon or"settings",function()
fu._activateTab(fL,true)
end,fL)
end
if#fu._tabs==1 then
setActive(false)
fA.Position=UDim2.new(0,0,0,-2)
fA.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
fH.TextTransparency=0
if fG:IsA"ImageLabel"then fG.ImageTransparency=0 end
end)
end)

local function row(fN)
local fO=Instance.new"Frame"
fO.Size=UDim2.new(1,-4,0,fN)
fO.BackgroundColor3=fw.Surface
fO.BorderSizePixel=0
local fP=math.clamp((fv.Radius or 12)-2,4,12)
fj(fO,fP)
fm(fO,fP)
fO.Parent=fK
fk(fO,true)
ae.tag(fO,"BackgroundColor3","Surface")
local fQ=fO:FindFirstChild"_light"
if fQ then fQ.Visible=false end
fO.BackgroundTransparency=1
task.delay(#fL.Elements*0.025,function()
fe(fO,e9.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if fQ and fQ.Parent then fQ.Visible=true end end)
end)
return fO
end
local function titleBlock(fN,fO,fP,fQ,fR)
fQ=fQ or 112
local fS=Instance.new"TextLabel"
fS.BackgroundTransparency=1
if fP then
fS.Position=UDim2.new(0,14,0,9)
fS.Size=UDim2.new(1,-fQ,0,17)
elseif fR then
fS.Position=UDim2.new(0,14,0,8)
fS.Size=UDim2.new(1,-fQ,0,17)
else
fS.Position=UDim2.new(0,14,0,0)
fS.Size=UDim2.new(1,-fQ,1,0)
end
fS.Font=Enum.Font.GothamMedium
fS.TextSize=13
fS.TextXAlignment=0
fS.TextTruncate=Enum.TextTruncate.AtEnd
fS.Text=fO
fS.Parent=fN
ae.tag(fS,"TextColor3","Text")
if fP then
local fT=Instance.new"TextLabel"
fT.BackgroundTransparency=1
fT.Position=UDim2.new(0,14,0,30)
fT.Size=UDim2.new(1,-fQ,0,14)
fT.Font=Enum.Font.Gotham
fT.TextSize=11
fT.TextXAlignment=0
fT.TextTruncate=Enum.TextTruncate.AtEnd
fT.Text=fP
fT.Parent=fN
ae.tag(fT,"TextColor3","Dim")
end
end
local function reg(fN)
table.insert(fL.Elements,fN)
fN._tab=fL
if not fN._go then
fN._go=function()
if fu._activateTab then fu._activateTab(fL,true)end
fu:_flash(fN.Frame)
end
end
if fN.Flag and fN._set then
aa._live[fN.Flag]=aa._live[fN.Flag]or{}
table.insert(aa._live[fN.Flag],fN._set)
if aa.Flags["_loaded_"..fN.Flag]~=nil then
local fO=aa.Flags["_loaded_"..fN.Flag]
aa.Flags["_loaded_"..fN.Flag]=nil
task.defer(function()pcall(fN._set,fO,true)end)
elseif fN.Value~=nil and aa.Flags[fN.Flag]==nil then
aa.Flags[fN.Flag]=fN.Value
end
elseif fN.Flag and fN.Value~=nil and aa.Flags[fN.Flag]==nil then
aa.Flags[fN.Flag]=fN.Value
end
return fN._handle
end

local fN={}
local fO={row=row,titleBlock=titleBlock,reg=reg,tab=fL,Window=fu,Th=fw,opts=fv,page=fI,pgui=fx,
getParent=function()return fK end}
fo.attach(fN,fO)




fL._subtabs={}
fL.SelectedSubTab=nil
local fP,fQ
local function selBtn(fR,fS)
if fR.btn then
fe(fR.btn,e9.Hover,{BackgroundTransparency=fS and 0.35 or 1})
local fT=fR.btn:FindFirstChildOfClass"TextLabel"
if fT then ae.tag(fT,"TextColor3",fS and"Text"or"Dim")end
end
if fQ and fR.btn and fR.btn.Parent and fI.Parent then
pcall(function()


local fT=fI.AbsolutePosition
local fU,fV=fR.btn.AbsolutePosition,fR.btn.AbsoluteSize
fe(fQ,e9.Med,{
Position=UDim2.new(0,fU.X-fT.X,0,5),
Size=UDim2.new(0,math.max(24,fV.X),0,28),
})
end)
end
end
local function selectSub(fR,fS)
local fT=fL._subtabs
if#fT==0 then return end
local fU
if type(fR)=="number"then
fU=math.clamp(fR,1,#fT)
else
for fV,fW in ipairs(fT)do
if fW.name==fR then fU=fV break end
end
fU=fU or 1
end
fL.SelectedSubTab=fT[fU].name
for fV,fW in ipairs(fT)do
local fX=fV==fU
fW.holder.Visible=fX
if fX then fK=fW.holder end
selBtn(fW,fX)
end
if not fS then
e8:_sfx"Swap"
e7.closeAny()
end
end
fL.SelectSubTab=function(fR,fS)selectSub(fS)end
fL.SubTab=function(fR,fS)
fS=fS or{}
if type(fS)=="string"then fS={Name=fS}end
local fT=fS.Name or("Sub "..(#fL._subtabs+1))
if#fL._subtabs==0 then


fI.ScrollingEnabled=false
if fJ and fJ.Parent then pcall(function()fJ:Destroy()end)end
fL._pl=nil
for fU,fV in ipairs(fI:GetChildren())do
if fV:IsA"UIPadding"then pcall(function()fV:Destroy()end)end
end
if fJ and fJ.Parent then pcall(function()fJ:Destroy()end)end
fL._pl=nil
fP=Instance.new"ScrollingFrame"
fP.Name="_subbar"
fP.Position=UDim2.new(0,2,0,2)fP.Size=UDim2.new(1,-4,0,36)
fP.BackgroundTransparency=1 fP.BorderSizePixel=0
fP.ScrollingDirection=Enum.ScrollingDirection.X
fP.ScrollBarThickness=0
fP.AutomaticCanvasSize=Enum.AutomaticSize.X
fP.CanvasSize=UDim2.new(0,0,0,0)
fP.Parent=fI
local fU=Instance.new"UIListLayout"
fU.FillDirection=Enum.FillDirection.Horizontal
fU.VerticalAlignment=Enum.VerticalAlignment.Center
fU.Padding=UDim.new(0,6)fU.Parent=fP
fQ=Instance.new"Frame"
fQ.Name="_subind"
fQ.Size=UDim2.new(0,24,0,28)fQ.Position=UDim2.new(0,2,0,5)
fQ.BackgroundColor3=fw.Surface2 fQ.BorderSizePixel=0
fQ.ZIndex=0
fj(fQ,8)fQ.Parent=fI
fk(fQ,true)
ae.tag(fQ,"BackgroundColor3","Surface2")

fP:GetPropertyChangedSignal"CanvasPosition":Connect(function()
if fL.SelectedSubTab then selectSub(fL.SelectedSubTab,true)end
end)
end
local fU=Instance.new"ScrollingFrame"
fU.Name="_subbody"
fU.Position=UDim2.new(0,0,0,44)fU.Size=UDim2.new(1,0,1,-44)
fU.BackgroundTransparency=1 fU.BorderSizePixel=0
fU.ScrollBarThickness=3 fU.CanvasSize=UDim2.new(0,0,0,0)
fU.AutomaticCanvasSize=Enum.AutomaticSize.Y
fU.Visible=false fU.Parent=fI
ae.tag(fU,"ScrollBarImageColor3","Surface2")
local fV=Instance.new"UIListLayout"fV.Padding=UDim.new(0,8)
fV.SortOrder=Enum.SortOrder.LayoutOrder fV.Parent=fU
fl(fU,2,8,2,6)
local fW=Instance.new"TextButton"fW.Text=""
fW.Size=UDim2.new(0,0,0,30)fW.AutomaticSize=Enum.AutomaticSize.X
fW.BackgroundColor3=fw.Surface2 fW.BackgroundTransparency=1
fW.BorderSizePixel=0 fj(fW,8)fW.AutoButtonColor=false fW.Parent=fP
local fX=Instance.new"UIPadding"
fX.PaddingLeft=UDim.new(0,12)fX.PaddingRight=UDim.new(0,12)
fX.Parent=fW
local fY=fn(fS.Icon or fT,14,fw.Dim)
fY.AnchorPoint=Vector2.new(0,0.5)fY.Position=UDim2.new(0,0,0.5,0)
fY.Parent=fW
if fY:IsA"TextLabel"then fY.Size=UDim2.new(0,14,0,14)end
local fZ=Instance.new"TextLabel"fZ.BackgroundTransparency=1
fZ.Position=UDim2.new(0,20,0,0)fZ.Size=UDim2.new(0,0,1,0)
fZ.AutomaticSize=Enum.AutomaticSize.X
fZ.Font=Enum.Font.GothamMedium fZ.TextSize=12 fZ.TextXAlignment=0
fZ.TextTruncate=Enum.TextTruncate.AtEnd fZ.Text=fT fZ.Parent=fW
ae.tag(fZ,"TextColor3","Dim")
local f_={name=fT,btn=fW,label=fZ,holder=fU}
table.insert(fL._subtabs,f_)
fW.MouseButton1Click:Connect(function()
for f0,f1 in ipairs(fL._subtabs)do
if f1==f_ then selectSub(f0)break end
end
end)
if#fL._subtabs==1 then

for f0,f1 in ipairs(fI:GetChildren())do
if f1:IsA"GuiObject"and f1~=fP and f1~=fU then
pcall(function()f1.Parent=fU end)
end
end
fK=fU
selectSub(1,true)

task.defer(function()
if fL.SelectedSubTab then selectSub(fL.SelectedSubTab,true)end
end)
end
return setmetatable({_sub=f_,_tab=fL},{
__index=function(f0,f1)
if f1=="Select"then return function()selectSub(fT)end end
local f2=fL[f1]
if type(f2)=="function"then
return function(f3,...)return f2(fL,...)end
end
return f2
end,
})
end

fL.Api=fN
fL._window=fu
fL._activate=function(fR)setActive(fR~=false)end
for fR,fS in pairs(fN)do fL[fR]=function(fT,...)return fS(fL,...)end end
return fL
end end function a.aa():typeof(__modImpl())local aa=a.cache.aa if not aa then aa={c=__modImpl()}a.cache.aa=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.i()
local ae=a.b()

local af=ab.T
local e7=ab.tween
local e8=ac.spawnCb
local e9=ac.corner
local fe=ac.hairline
local fi=ac.lighting
local fj=ac.shadow
local fk=ae.cloneref_check(game:GetService"RunService")
local fl=ae.cloneref_check(game:GetService"Players")

local fm={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(fn,fo)
local fr=fn.Window
local ft=fn.Th
local fu=fn.main
local fv=fn.gui

fo=fo or{}
local fw,fx=fo.Width or 175,fo.Height or 370
local fy=fo.Accent or ft.Accent
if type(fy)=="table"then
fy=Color3.new(fy[1]or 0,fy[2]or 0,fy[3]or 0)
end
local fz=tostring(fo.Mode or"Chams")
if not fm[fz]then fz="Chams"end
local fA,fB,fC,fD=true,true,false,100
local fE
pcall(function()fE=fl.LocalPlayer end)
local fF=fo.Name or((fE and fE.DisplayName)or"Noob")
local fG=(fE and("@"..fE.Name))or""
local fH=Instance.new"Frame"
fH.Name=ae.GetStealthName()
fH.AnchorPoint=Vector2.new(0,0.5)
fH.Size=UDim2.fromOffset(fw,fx)
fH.BackgroundColor3=ft.Surface fH.BorderSizePixel=0
e9(fH,12)fH.Parent=fv fH.Visible=false
fe(fH,true)fi(fH,12)fj(fH,0.5,40)
ad.tag(fH,"BackgroundColor3","Surface")
local fI=Instance.new"UIScale"fI.Scale=0.92 fI.Parent=fH
local function dock()
if not fu or not fu.Parent then return end
local fJ=fu.Size.X.Offset
fH.Position=UDim2.new(fu.Position.X.Scale,
fu.Position.X.Offset+fJ/2+12,
fu.Position.Y.Scale,fu.Position.Y.Offset)
end
fr:Track(fu:GetPropertyChangedSignal"Position":Connect(dock))
fr:Track(fu:GetPropertyChangedSignal"Size":Connect(dock))
local fJ=Instance.new"TextLabel"fJ.BackgroundTransparency=1
fJ.Position=UDim2.new(0,14,0,0)fJ.Size=UDim2.new(1,-48,0,34)
fJ.Font=Enum.Font.GothamBold fJ.TextSize=14 fJ.TextXAlignment=0
fJ.TextTruncate=Enum.TextTruncate.AtEnd fJ.Text=fo.Title or"Preview"fJ.Parent=fH
ad.tag(fJ,"TextColor3","Text")
local fK={open=false}
local function setOpen(fL,fM)
fL=fL and true or false
if fL==fK.open and fH.Visible==fL then return end
fK.open=fL
if fL then
dock()
fH.Visible=true

local fN=fr._popouts
if fN then
local fO
for fP,fQ in ipairs(fN)do
if fQ.frame==fH then fO=fQ break end
end
if not fO then
fO={frame=fH}
table.insert(fN,fO)
end
fO.open=true
end
local fO=fH.Position.X.Offset
fH.Position=UDim2.new(fH.Position.X.Scale,fO-24,
fH.Position.Y.Scale,fH.Position.Y.Offset)
e7(fH,af.Med,{Position=UDim2.new(fH.Position.X.Scale,fO,
fH.Position.Y.Scale,fH.Position.Y.Offset)})
e7(fI,af.Spring,{Scale=1})
else
local fN=fr._popouts
if fN then
for fO,fP in ipairs(fN)do
if fP.frame==fH then table.remove(fN,fO)break end
end
end
e7(fH,af.Fast,{Position=UDim2.new(fH.Position.X.Scale,
fH.Position.X.Offset-16,fH.Position.Y.Scale,fH.Position.Y.Offset)})
task.delay(0.18,function()
if not fK.open then fH.Visible=false end
end)
if fM then e8(fo.OnClose)end
end
end
local fL=Instance.new"TextButton"fL.Text=""
fL.AnchorPoint=Vector2.new(1,0)fL.Position=UDim2.new(1,-10,0,8)
fL.Size=UDim2.fromOffset(14,14)fL.BackgroundColor3=Color3.fromRGB(255,95,86)
fL.BorderSizePixel=0 fL.AutoButtonColor=false fL.Parent=fH
e9(fL,99)
fL.MouseEnter:Connect(function()
e7(fL,af.Hover,{BackgroundColor3=Color3.fromRGB(215,70,62)})
end)
fL.MouseLeave:Connect(function()
e7(fL,af.Hover,{BackgroundColor3=Color3.fromRGB(255,95,86)})
end)
fL.MouseButton1Click:Connect(function()setOpen(false,true)end)

local fM=Instance.new"ViewportFrame"
fM.Position=UDim2.new(0,10,0,36)fM.Size=UDim2.new(1,-20,1,-48)
fM.BackgroundColor3=ft.Bg fM.BorderSizePixel=0
fM.LightColor=Color3.fromRGB(255,255,255)
fM.LightDirection=Vector3.new(-0.5,-1,-0.6)
fM.Ambient=Color3.fromRGB(150,150,168)
e9(fM,8)fM.Parent=fH
ad.tag(fM,"BackgroundColor3","Bg")
local fN=Instance.new"Frame"fN.BackgroundTransparency=1
fN.Size=UDim2.fromScale(1,1)fN.Parent=fM
local fO={}
local function bracket(fP,fQ)
local fR=Instance.new"Frame"fR.BorderSizePixel=0
fR.AnchorPoint=Vector2.new(fP,fQ)fR.Position=UDim2.new(fP,0,fQ,0)
fR.Size=UDim2.new(0,14,0,2)fR.Parent=fN
ad.tag(fR,"BackgroundColor3","Accent")
local fS=Instance.new"Frame"fS.BorderSizePixel=0
fS.AnchorPoint=Vector2.new(fP,fQ)fS.Position=UDim2.new(fP,0,fQ,0)
fS.Size=UDim2.new(0,2,0,14)fS.Parent=fN
ad.tag(fS,"BackgroundColor3","Accent")
table.insert(fO,fR)table.insert(fO,fS)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local fP=Instance.new"TextLabel"fP.BackgroundTransparency=1
fP.AnchorPoint=Vector2.new(0.5,0)fP.Position=UDim2.new(0.5,0,0,4)
fP.Size=UDim2.new(1,-16,0,15)fP.Font=Enum.Font.GothamBold
fP.TextSize=11 fP.Text=fF fP.Parent=fN
ad.tag(fP,"TextColor3","Text")
local fQ=Instance.new"TextLabel"fQ.BackgroundTransparency=1
fQ.AnchorPoint=Vector2.new(0.5,0)fQ.Position=UDim2.new(0.5,0,0,19)
fQ.Size=UDim2.new(1,-16,0,12)fQ.Font=Enum.Font.Gotham
fQ.TextSize=10 fQ.Text=fG fQ.Parent=fN
ad.tag(fQ,"TextColor3","Dim")
local fR=Instance.new"Frame"fR.BorderSizePixel=0
fR.AnchorPoint=Vector2.new(0,0.5)fR.Position=UDim2.new(0,6,0.5,0)
fR.Size=UDim2.new(0,4,1,-40)fR.BackgroundColor3=ft.Surface2
e9(fR,99)fR.Parent=fN
ad.tag(fR,"BackgroundColor3","Surface2")
local fS=Instance.new"Frame"fS.BorderSizePixel=0
fS.AnchorPoint=Vector2.new(0,1)fS.Position=UDim2.new(0,0,1,0)
fS.Size=UDim2.new(1,0,1,0)fS.BackgroundColor3=ft.Success
e9(fS,99)fS.Parent=fR
ad.tag(fS,"BackgroundColor3","Success")

local fT=Instance.new"WorldModel"fT.Parent=fM
local fU=Instance.new"Camera"fU.Parent=fM
fM.CurrentCamera=fU
fU.CFrame=CFrame.new(Vector3.new(0,3.0,9),Vector3.new(0,2.4,0))
local fV,fW,fX={},{},{}
local function part(fY,fZ,f_)
local f0=Instance.new"Part"f0.Name=fY
f0.Size=fZ f0.Position=f_ f0.Anchored=true f0.CanCollide=false
f0.TopSurface=Enum.SurfaceType.Smooth
f0.BottomSurface=Enum.SurfaceType.Smooth
f0.Color=Color3.fromRGB(200,200,215)
f0.Material=Enum.Material.Plastic
f0.Parent=fT
table.insert(fV,f0)
if fY=="Left Arm"or fY=="Right Arm"then fW[fY]=f0 end
local f1=Instance.new"SelectionBox"
f1.Adornee=f0 f1.LineThickness=0.05
f1.Color3=Color3.fromRGB(255,255,255)
f1.SurfaceTransparency=1 f1.Visible=false
f1.Parent=f0
fX[f0]=f1
return f0
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local fY={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local function paint()
for fZ,f_ in ipairs(fV)do
if f_ and f_.Parent then
if fz=="Noob"then
f_.Color=fY[f_.Name]or Color3.fromRGB(200,200,215)
f_.Material=Enum.Material.Plastic
f_.Transparency=0
elseif fz=="Ghost"then
f_.Color=fy
f_.Material=Enum.Material.ForceField
f_.Transparency=0
elseif fz=="Solid"or fz=="Box"then
f_.Color=Color3.fromRGB(200,200,215)
f_.Material=Enum.Material.Plastic
f_.Transparency=0
else
f_.Color=fy
f_.Material=Enum.Material.Plastic
f_.Transparency=0
end
local f0=fX[f_]
if f0 then
f0.Visible=fC or fz=="Outline"
f0.Color3=fy
end
end
end
for fZ,f_ in ipairs(fO)do
if f_ then f_.Visible=fA or fz=="Box"end
end
fP.Visible=fB or fz=="Name"
fQ.Visible=fP.Visible
fR.Visible=fA or fz=="HP bar"
end
paint()

local fZ=0
local f_={}
for f0,f1 in ipairs(fV)do f_[f1]=f1.Position end
local f0={
["Left Arm"]=Vector3.new(-1,3.9,0),
["Right Arm"]=Vector3.new(1,3.9,0),
}
local f1
f1=fk.RenderStepped:Connect(function(f2)
if not fM.Parent then pcall(function()f1:Disconnect()end)return end
if not fK.open then return end
fZ+=f2
local f3=math.sin(fZ*2.2)*0.045
local f4=math.sin(fZ*2.2)*0.09
for f5,f6 in ipairs(fV)do
if f6 and f6.Parent and f_[f6]then
local f7=f0[f6.Name]
if f7 then
local f8=f6.Name=="Left Arm"and 1 or-1
f6.CFrame=CFrame.new(f7)
*CFrame.Angles(f4*f8,0,0.05*f8)
*CFrame.new(f_[f6]-f7+Vector3.new(0,f3,0))
else
f6.Position=f_[f6]+Vector3.new(0,f3,0)
end
end
end
end)
fr:Track(f1)
function fK.Show(f2)setOpen(true)end
function fK.Hide(f2,f3)setOpen(false,not f3)end
function fK.Toggle(f2)setOpen(not fK.open,not fK.open)end
function fK.SetVisible(f2,f3)
if f3 then f2:Show()else f2:Hide(true)end
end
function fK.IsOpen(f2)return fK.open end
function fK.SetAccent(f2,f3)
if type(f3)=="table"then
f3=Color3.new(f3[1]or 0,f3[2]or 0,f3[3]or 0)
end
if typeof(f3)=="Color3"then fy=f3 paint()end
end
function fK.SetMode(f2,f3)fz=tostring(f3)if not fm[fz]then fz="Chams"end paint()end
function fK.SetBox(f2,f3)
fA=f3 and true or false paint()
end
function fK.SetOutline(f2,f3)
fC=f3 and true or false paint()
end
function fK.SetName(f2,f3)
fB=f3 and true or false paint()
end
function fK.SetNameText(f2,f3)
local f4=tostring(f3 or"")
local f5=string.find(f4,"@")
if f5 then
fP.Text=string.sub(f4,1,f5-1)
fQ.Text="@"..string.gsub(string.sub(f4,f5+1),"^@","")
else
fP.Text=f4
end
fF=fP.Text
end
function fK.SetHealth(f2,f3)
fD=math.clamp(tonumber(f3)or 100,0,100)
e7(fS,af.Fast,{Size=UDim2.new(1,0,fD/100,0)})
end

aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(f2,f3)
local f4=f2
if type(f4)=="table"then
f4=Color3.new(f4[1]or 0,f4[2]or 0,f4[3]or 0)
end
if typeof(f4)=="Color3"then fy=f4 paint()end
end)
if aa.Flags.ESPColor~=nil then
local f2=aa.Flags.ESPColor
if type(f2)=="table"then
f2=Color3.new(f2[1]or 0,f2[2]or 0,f2[3]or 0)
end
if typeof(f2)=="Color3"then fy=f2 paint()end
end
return fK
end end function a.ab():typeof(__modImpl())local aa=a.cache.ab if not aa then aa={c=__modImpl()}a.cache.ab=aa end return aa.c end end do local function __modImpl()a.a()






local aa=a.b()
local ab=a.m()

local function localConfigs(ac)
local ad={}
local ae=ac._folder or"Kronos"
pcall(function()
local af,e7=aa.hasFn"listfiles",aa.hasFn"isfolder"
if af and e7 and e7(ae)then
for e8,e9 in ipairs(af(ae))do
local fe=string.match(e9,"([^/\\]+)%.json$")
if fe then table.insert(ad,{Name=fe,Description="On this device"})end
end
end
end)
table.sort(ad,function(af,e7)return af.Name<e7.Name end)
return ad
end

return function(ac,ad)
ad=ad or{}
local ae=ad.Service
local af=ac:Tab{Title=ad.Name or"Cloud",Icon=ad.Icon or"cloud",Hidden=ad.Hidden~=false}
if ad.OnToggle then
table.insert(ac._tabChangeListeners,function(e7)
if e7==af then task.spawn(ad.OnToggle,true)
else
for e8,e9 in ipairs(ac._tabs)do
if e9==af then task.spawn(ad.OnToggle,false)break end
end
end
end)
end
function af.Open(e7)
ac._activateTab(af,true)
end

local e7,e8,e9
local fe=af:SubTab{Name="Local Configs"}
fe:Paragraph{Title="Local Library",
Description="Private presets on this device. Load, save and publish them."}
fe:Button{Title="Save current locally",Description="Stays on this device only",
Callback=function()
ac:Modal{
Title="Save Config Locally",Text="Stays only on this device.",
ConfirmText="Save",CancelText="Cancel",
Fields={
{Key="Name",Label="Name",Placeholder="Enter a name...",MaxLength=60},
{Key="Description",Label="Description (optional)",
Placeholder="What's different?",MaxLength=280,Type="textarea"},
},
Callback=function(fi,fj)
if not fi then return end
if not fj.Name or fj.Name:gsub("%s+","")==""then
ac:Notify{Title="Local Save",Content="Name can't be empty.",Duration=3}
return
end
ac:SaveConfig(fj.Name)
if e7 then e7:Refresh()end
end,
}
end}
e7=fe:CardGrid{Title="Local Configs",Height=260,Columns=2,
Search=true,SearchPlaceholder="Search local configs...",
EmptyText="No local configs saved yet.",
Fetch=function(fi)
local fj=localConfigs(ac)
local fk=string.lower(tostring(fi and fi.Query or""))
if fk==""then return fj end
local fl={}
for fm,fn in ipairs(fj)do
if string.find(string.lower(fn.Name),fk,1,true)then table.insert(fl,fn)end
end
return fl
end,
OnSelect=function(fi)
ac:Confirm{
Title="Load \""..tostring(fi.Name).."\"?",
Text="Overwrites current settings. A snapshot is kept for undo.",
ConfirmText="Load",CancelText="Cancel",
Callback=function(fj)
if not fj then return end
local fk=ab.Snapshot()
ac:LoadConfig(fi.Name)
ac:Notify{Title="Loaded",Content=fi.Name,Duration=2}
fi._snap=fk
end,
}
end}

local fi=af:SubTab{Name="Publish"}
fi:Paragraph{Title="Publish",Description="Share the current setup to your cloud."}
fi:Button{Title="Publish current",Description="Uploads flags + meta",
Callback=function()
if not ae then
ac:Notify{Title="No Service",Content="Attach a cloud service first.",Duration=3}
return
end
ac:Modal{
Title="Publish Config",ConfirmText="Publish",CancelText="Cancel",
Fields={
{Key="Name",Label="Name",Placeholder="Public name...",MaxLength=60},
{Key="Description",Label="Description",Placeholder="What is it?",MaxLength=280,Type="textarea"},
},
Callback=function(fj,fk)
if not fj then return end
task.spawn(function()
local fl,fm=ae:Publish(fk,ab.GetFlags())
if fl then
ac:Notify{Title="Published",Content=tostring(fk.Name),Duration=3}
else
ac:Notify{Title="Publish failed",Content=tostring(fm),Duration=3}
end
end)
end,
}
end}
e8=fi:CardGrid{Title="My Configs",Height=260,Columns=2,
EmptyText=ae and"Nothing published yet."or"Attach a cloud service.",
Fetch=function()
if not ae then return{}end
local fj,fk=ae:ListMine()
if fk then return{}end
return fj or{}
end,
OnSelect=function(fj)
ac:Confirm{
Title="Load \""..tostring(fj.name or fj.Name or"?").."\"?",
Text="Overwrites current settings.",
ConfirmText="Load",CancelText="Cancel",
Callback=function(fk)
if not fk then return end
local fl=ab.Snapshot()
if fj.data and ab.ApplyTable(ac,fj.data)then
ac:Notify{Title="Loaded",Content="From cloud.",Duration=2}
else
ab.Restore(fl)
ac:Notify{Title="Load failed",Content="Rolled back.",Duration=2}
end
end,
}
end}

local fj=af:SubTab{Name="Explore"}
fj:Paragraph{Title="Public Configs",Description="Shared by the community."}
e9=fj:CardGrid{Title="Public Configs",Height=300,Columns=2,
Search=true,SearchPlaceholder="Search public configs...",
EmptyText=ae and"Nothing found."or"Attach a cloud service.",
Fetch=function(fk)
if not ae then return{}end
local fl,fm=ae:List(fk)
if fm then return{}end
return fl or{}
end,
OnSelect=function(fk)
ac:Confirm{
Title="Import \""..tostring(fk.name or fk.Name or"?").."\"?",
Text="Overwrites current settings. Snapshot kept.",
ConfirmText="Import",CancelText="Cancel",
Callback=function(fl)
if not fl then return end
local fm=ab.Snapshot()
local fn=fk.data
if not fn and fk.shareCode and ae then
local fo=ae:GetByShareCode(fk.shareCode)
if fo then fn=fo.data or fo end
end
if fn and ab.ApplyTable(ac,fn)then
ac:Notify{Title="Imported",Content="Applied.",Duration=2}
else
ab.Restore(fm)
ac:Notify{Title="Import failed",Content="Rolled back.",Duration=2}
end
end,
}
end}

local fk={
Tab=af,
Open=function()ac._activateTab(af,true)end,
Refresh=function()
pcall(function()e7:Refresh()end)
pcall(function()e8:Refresh()end)
pcall(function()e9:Refresh()end)
end,
}
if ac._dockAdd then
ac._dockAdd("Config",ad.DockIcon or"cloud",
function()ac._activateTab(af,true)end,af)
end
return fk
end end function a.ac():typeof(__modImpl())local aa=a.cache.ac if not aa then aa={c=__modImpl()}a.cache.ac=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.i()a.b()local ae=


ab.T local af=
ab.tween
local e7=ac.corner
local e8=ac.hairline
local e9=ac.pad
local fe=ac.spawnCb

return function(fi,fj)
fj=fj or{}
local fk=aa.Theme
local fl=fi:Tab{Title=fj.Title or fj.Name or"Chat",Icon=fj.Icon or"chat",Hidden=fj.Hidden~=false}

local fm=Instance.new"Frame"fm.BackgroundTransparency=1
fm.Size=UDim2.fromScale(1,1)fm.Parent=fl.Page
local fn=Instance.new"ScrollingFrame"
fn.BackgroundTransparency=1 fn.BorderSizePixel=0
fn.ScrollBarThickness=3 fn.CanvasSize=UDim2.new(0,0,0,0)
fn.AutomaticCanvasSize=Enum.AutomaticSize.Y
ad.tag(fn,"ScrollBarImageColor3","Surface2")
local fo=Instance.new"UIListLayout"fo.Padding=UDim.new(0,6)
fo.SortOrder=Enum.SortOrder.LayoutOrder fo.Parent=fn
fn.Parent=fm
local fr=34
local ft=Instance.new"Frame"ft.BackgroundTransparency=1
ft.Size=UDim2.new(1,0,0,fr)ft.Parent=fm
local fu=Instance.new"TextBox"
fu.PlaceholderText=fj.Placeholder or"Write a message..."
fu.PlaceholderColor3=fk.Dim fu.Text=""
fu.Font=Enum.Font.Gotham fu.TextSize=13
fu.Position=UDim2.new(0,0,0,0)fu.Size=UDim2.new(1,-114,1,0)
fu.BackgroundColor3=fk.Surface2 fu.BorderSizePixel=0
e7(fu,8)fu.ClearTextOnFocus=false fu.Parent=ft
e9(fu,0,0,10,10)
e8(fu,true)
ad.tag(fu,"BackgroundColor3","Surface2")
ad.tag(fu,"TextColor3","Text")
local function layout()
local fv=fm.AbsoluteSize.Y
if fv<10 then fv=380 end
fn.Position=UDim2.new(0,0,0,0)
fn.Size=UDim2.new(1,0,1,-(fr+8))
ft.Position=UDim2.new(0,0,1,-fr)
end
task.defer(layout)
local fv={}
function fv.AddMessage(fw,fx,fy)local fz=
fx=="you"
local fA=Instance.new"Frame"
fA.BackgroundColor3=fk.Surface2 fA.BorderSizePixel=0
e7(fA,8)fA.Parent=fn
e8(fA,true)
ad.tag(fA,"BackgroundColor3","Surface2")
local fB=Instance.new"TextLabel"fB.BackgroundTransparency=1
fB.Font=Enum.Font.Gotham fB.TextSize=13
fB.TextXAlignment=0 fB.TextYAlignment=0 fB.TextWrapped=true
fB.AutomaticSize=Enum.AutomaticSize.Y
fB.Size=UDim2.new(1,-20,0,0)
fB.Position=UDim2.new(0,10,0,8)
fB.Text=tostring(fy or"")fB.Parent=fA
ad.tag(fB,"TextColor3","Text")
fA.Size=UDim2.new(1,0,0,0)
fA.AutomaticSize=Enum.AutomaticSize.Y
task.defer(function()
pcall(function()
fn.CanvasPosition=Vector2.new(0,math.max(0,fn.AbsoluteCanvasSize.Y))
end)
end)
return fA
end
function fv.Clear(fw)
for fx,fy in ipairs(fn:GetChildren())do
if fy:IsA"Frame"then pcall(function()fy:Destroy()end)end
end
end
function fv.SetTyping(fw,fx)
fu.PlaceholderText=(fx and"Thinking...")or(fj.Placeholder or"Write a message...")
end
local function send()
local fw=fu.Text
if fw==""then return end
fu.Text=""
fe(fj.OnSend,fv,fw)
end
local fw=Instance.new"TextButton"fw.Text=""
fw.AnchorPoint=Vector2.new(1,0)fw.Position=UDim2.new(1,0,0,0)
fw.Size=UDim2.fromOffset(34,fr)
fw.BackgroundColor3=fk.Surface2 fw.BorderSizePixel=0
e7(fw,8)fw.AutoButtonColor=false fw.Parent=ft
e8(fw,true)
ad.tag(fw,"BackgroundColor3","Surface2")
local fx=Instance.new"TextLabel"fx.BackgroundTransparency=1
fx.Size=UDim2.fromScale(1,1)fx.Font=Enum.Font.GothamBold
fx.TextSize=13 fx.TextColor3=Color3.fromRGB(235,238,245)
fx.Text=">"fx.Parent=fw
fw.MouseButton1Click:Connect(function()
pcall(function()aa:_sfx"Click"end)
send()
end)
local fy=Instance.new"TextButton"fy.Text=""
fy.AnchorPoint=Vector2.new(1,0)fy.Position=UDim2.new(1,-38,0,0)
fy.Size=UDim2.fromOffset(34,fr)
fy.BackgroundTransparency=1 fy.AutoButtonColor=false fy.Parent=ft
local fz=Instance.new"TextLabel"fz.BackgroundTransparency=1
fz.Size=UDim2.fromScale(1,1)fz.Font=Enum.Font.GothamBold
fz.TextSize=12 fz.Text="[]"fz.Parent=fy
ad.tag(fz,"TextColor3","Dim")
fy.MouseButton1Click:Connect(function()fe(fj.OnStop)end)
local fA=Instance.new"TextButton"fA.Text=""
fA.AnchorPoint=Vector2.new(1,0)fA.Position=UDim2.new(1,-76,0,0)
fA.Size=UDim2.fromOffset(34,fr)
fA.BackgroundTransparency=1 fA.AutoButtonColor=false fA.Parent=ft
local fB=Instance.new"TextLabel"fB.BackgroundTransparency=1
fB.Size=UDim2.fromScale(1,1)fB.Font=Enum.Font.GothamBold
fB.TextSize=11 fB.Text="X"fB.Parent=fA
ad.tag(fB,"TextColor3","Dim")
fA.MouseButton1Click:Connect(function()
fv:Clear()fe(fj.OnClear)
end)
fu.FocusLost:Connect(function(fC)
if fC then send()end
end)
function fv.Open(fC)
fi._activateTab(fl,true)
end

if fi._dockAdd then
local fC=string.find(string.lower(fj.Icon or""),"bot")~=nil
fi._dockAdd(fC and"AI"or"Chat",fj.Icon or"chat",
function()fi._activateTab(fl,true)end,fl)
end
if fj.OnToggle then
table.insert(fi._tabChangeListeners,function(fC)
if fC==fl then task.spawn(fj.OnToggle,true)end
end)
end
return fv
end end function a.ad():typeof(__modImpl())local aa=a.cache.ad if not aa then aa={c=__modImpl()}a.cache.ad=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.b()
local af=a.f()a.i()a.g()


local e7=a.h()
local e8=a.m()
local e9=a.aa()
local fe=a.ab()
local fi=a.ac()
local fj=a.ad()
local fk=a.d()

local fl=aa
local fm=ab.T
local fn=ab.tween
local fo=ac.spawnCb
local fr=ac.corner
local ft=ac.hairline
local fu=ac.pad
local fv=ac.lighting
local fw=ac.topLight
local fx=ac.shadow
local fy=ac.makeDraggable
local fz=af.makeIcon
local fA=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(fB)
local fC=fB:FindFirstChild"Notification"
if fC then return fC end
fC=Instance.new"Frame"
fC.Name="Notification"
fC.AnchorPoint=Vector2.new(1,1)
fC.Position=UDim2.new(1,-18,1,-18)
fC.Size=UDim2.new(0,300,1,-36)
fC.BackgroundTransparency=1
fC.Parent=fB
local fD=Instance.new"UIListLayout"
fD.VerticalAlignment=Enum.VerticalAlignment.Bottom
fD.Padding=UDim.new(0,10)
fD.SortOrder=Enum.SortOrder.LayoutOrder
fD.Parent=fC
return fC
end

local function bumpRecent(fB,fC,fD)
if not fC or fC==""then return end
for fE,fF in ipairs(aa._recent)do
if fF.label==fC and fF.tab==fB then table.remove(aa._recent,fE)break end
end
table.insert(aa._recent,1,{tab=fB,label=fC,go=fD})
while#aa._recent>8 do table.remove(aa._recent)end
for fE,fF in ipairs(aa._recentRefresh)do pcall(fF)end
end
aa._bumpRecent=function(fB,fC,fD,fE)
return bumpRecent(fC,fD,fE)
end







local fB={}
local function flyTo(fC,fD,fE,fF)
local fG=fB[fC]
if fG then pcall(function()fG:Cancel()end)end
fB[fC]=nil
local fH=fn(fC,fE or fm.Med,fD)
if not fH then
pcall(function()
for fI,fJ in pairs(fD)do fC[fI]=fJ end
end)
if fF then fF()end
return nil
end
fB[fC]=fH
if fF then
fH.Completed:Connect(function(fI)
if fB[fC]==fH then
fB[fC]=nil
if fI==Enum.PlaybackState.Completed then fF()end
end
end)
end
return fH
end

return function(fC,fD)
fD=fD or{}
local fE=fD.Title or"Kronos"
local fF=fD.SubTitle or fD.Subtitle or"scripthub"
local fG=fD.ToggleKey or Enum.KeyCode.RightControl
local fH=fD.Acrylic
if fH==nil then fH=true end
if fD.Theme then fC:SetTheme(fD.Theme)end
local fI=fC.Theme
fC:SetAcrylic(fH,fD.Blur or 16)

local fJ=ad.GetRoot()
if fC._gui then pcall(function()fC._gui:Destroy()end)end

local fK=Instance.new"ScreenGui"
fK.Name=ad.GetStealthName()fK.ResetOnSpawn=false fK.IgnoreGuiInset=true fK.DisplayOrder=999
fK.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fK)
fK.Parent=fJ
fC._gui=fK



local fL=Instance.new"ScreenGui"
fL.Name=ad.GetStealthName()fL.ResetOnSpawn=false fL.IgnoreGuiInset=true fL.DisplayOrder=1000
fL.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fL)
fL.Parent=fJ

local fM=Instance.new"Frame"
fM.Name="Dim"fM.Size=UDim2.fromScale(1,1)
fM.BackgroundColor3=Color3.fromRGB(3,4,7)fM.BackgroundTransparency=1
fM.BorderSizePixel=0 fM.Parent=fK


local fN=fD.Background~=false
fM.Visible=fN
local function dimTo(fO,fP)
if not fN then
if fO>=1 then fM.Visible=false end
return
end
fM.Visible=true
fn(fM,fP,{BackgroundTransparency=fO})
end
dimTo(0.5,fm.Slow)


if fD.Ambient~=false then
local fO=Instance.new"Frame"fO.Name="_ambient"
fO.AnchorPoint=Vector2.new(0.5,0.5)fO.Position=UDim2.new(0.5,0,0.5,0)
fO.Size=UDim2.new(1.4,0,1.4,0)fO.BackgroundColor3=Color3.fromRGB(255,255,255)
fO.BackgroundTransparency=0 fO.BorderSizePixel=0 fO.Parent=fM
local fP=Instance.new"UIGradient"fP.Rotation=25
fP.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,fI.Accent),
ColorSequenceKeypoint.new(1,fI.Accent2 or fI.Accent)}
fP.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
fP.Parent=fO
table.insert(fl._gradients,fP)
task.spawn(function()
while fK.Parent do
fn(fP,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not fK.Parent then break end
fn(fP,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local fO=Instance.new"CanvasGroup"
fO.Name="Main"fO.AnchorPoint=Vector2.new(0.5,0.5)
fO.Position=UDim2.new(0.5,0,0.5,0)fO.Size=UDim2.fromOffset(620,440)
fO.BackgroundColor3=fI.Surface
fO.BackgroundTransparency=(fH and not fC._transparent)and 0.08 or 0
fO.GroupTransparency=1 fO.BorderSizePixel=0 fO.Parent=fK
fr(fO,fD.Radius or 12)ft(fO,true)fw(fO)fx(fO,0.5,48)



local fP,fQ=1,1
local fR=Instance.new"UIScale"fR.Scale=0.94 fR.Parent=fO
local function baseScale()return fP*fQ end





local function brandInto(fS,fT)
if fD.Logo and fD.Logo~=""then
local fU=Instance.new"ImageLabel"fU.BackgroundTransparency=1
fU.AnchorPoint=Vector2.new(0.5,0.5)fU.Position=UDim2.new(0.5,0,0.5,0)
fU.Size=UDim2.new(1,-8,1,-8)fU.Image=fD.Logo
fU.ScaleType=Enum.ScaleType.Fit fU.Parent=fS
fr(fU,8)
if fT then fT.Visible=false end
return fU
end
return nil
end


local function kronosFace(fS,fT,fU,fV)
local fW=fU or 26
local fX=Instance.new"Frame"fX.Name="_disc"
fX.AnchorPoint=Vector2.new(0.5,0.5)fX.Position=UDim2.new(0.5,0,0.5,0)
fX.Size=UDim2.fromOffset(fW,fW)fX.BackgroundColor3=Color3.fromRGB(0,0,0)
fX.BorderSizePixel=0 fX.Parent=fS
local fY=Instance.new"UICorner"fY.CornerRadius=UDim.new(0.5,0)fY.Parent=fX
local fZ=Instance.new"UIStroke"fZ.Thickness=2
fZ.Color=Color3.fromRGB(255,255,255)fZ.Transparency=0.12 fZ.Parent=fX
pcall(function()
local f_=Instance.new"UIShadow"f_.Color=Color3.fromRGB(255,255,255)
f_.Transparency=0.82 f_.BlurSize=10 f_.Parent=fX
end)
if fT then
fT.AnchorPoint=Vector2.new(0.5,0.5)fT.Position=UDim2.new(0.5,0,0.5,0)
fT.Size=UDim2.fromOffset(fW,fW)fT.TextSize=fV or 16
fT.ZIndex=2
end
return fX
end

local function playEntrance()
fl:_sfx"Open"
fn(fO,fm.Slow,{GroupTransparency=0})
fn(fR,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})
end
playEntrance()


local fS=Instance.new"Frame"
fS.Size=UDim2.new(1,-24,0,2)fS.Position=UDim2.new(0,12,0,0)
fS.BackgroundTransparency=1 fS.Parent=fO
local fT=Instance.new"Frame"fT.Size=UDim2.new(0,0,1,0)
fr(fT,99)fT.Parent=fS
fl:agrad(fT,0)
fn(fT,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()fS:Destroy()end)end)


local fU=Instance.new"Frame"
fU.Name="Header"fU.Size=UDim2.new(1,0,0,62)
fU.BackgroundTransparency=1 fU.Parent=fO
fu(fU,14,6,14,14)


local fV=Instance.new"Frame"fV.Name="Mark"
fV.Size=UDim2.fromOffset(36,36)fV.BackgroundColor3=fI.Surface2
fV.BorderSizePixel=0 fr(fV,10)fV.Parent=fU
ft(fV,true)
local fW=Instance.new"TextLabel"fW.Size=UDim2.fromScale(1,1)
fW.BackgroundTransparency=1 fW.Font=Enum.Font.GothamBlack
fW.TextSize=18 fC:_tag(fW,"TextColor3","Text")fW.Text="K"fW.Parent=fV
local fX=Instance.new"Frame"fX.Size=UDim2.fromOffset(8,8)
fX.Position=UDim2.new(1,-5,0,-3)fX.BorderSizePixel=0
fC:_tag(fX,"BackgroundColor3","Accent")
fr(fX,99)fX.Parent=fV
brandInto(fV,fW)
if not fD.Logo or fD.Logo==""then kronosFace(fV,fW,26,15)end

local fY=Instance.new"TextLabel"fY.BackgroundTransparency=1
fY.Position=UDim2.new(0,48,0,0)fY.Size=UDim2.new(0,230,0,20)
fY.Font=Enum.Font.GothamBold fY.TextSize=15 fY.TextXAlignment=0
fC:_tag(fY,"TextColor3","Text")fY.Text=fE fY.Parent=fU
local fZ=Instance.new"TextLabel"fZ.BackgroundTransparency=1
fZ.Position=UDim2.new(0,48,0,21)fZ.Size=UDim2.new(0,230,0,15)
fZ.Font=Enum.Font.Gotham fZ.TextSize=11 fY.TextXAlignment=0
fZ.TextXAlignment=0 fC:_tag(fZ,"TextColor3","Dim")
fZ.Text=string.upper(fF).."  |  V"..fC.Version fZ.Parent=fU


local f_=Instance.new"Frame"
f_.AnchorPoint=Vector2.new(1,0)f_.Position=UDim2.new(1,-64,0,4)
f_.Size=UDim2.new(0,170,0,32)f_.BackgroundColor3=fI.Bg
f_.BorderSizePixel=0 fr(f_,8)f_.Parent=fU
ft(f_,true)
local f0=fz("search",14,fI.Dim)
f0.Position=UDim2.new(0,9,0.5,-7)f0.Parent=f_
local f1=Instance.new"TextBox"f1.PlaceholderText="Search"
f1.PlaceholderColor3=fI.Dim f1.Text=""f1.Font=Enum.Font.GothamBold
f1.TextSize=12 fC:_tag(f1,"TextColor3","Text")
f1.Position=UDim2.new(0,28,0,0)f1.Size=UDim2.new(1,-80,1,0)
f1.BackgroundTransparency=1 f1.ClearTextOnFocus=false f1.Parent=f_
local f2=Instance.new"TextLabel"f2.BackgroundTransparency=1
f2.AnchorPoint=Vector2.new(1,0.5)f2.Position=UDim2.new(1,-8,0.5,0)
f2.Size=UDim2.new(0,44,0,18)f2.Font=Enum.Font.Code f2.TextSize=11
fC:_tag(f2,"TextColor3","Text")f2.Text="Ctrl K"f2.Parent=f_
fC:_tag(f_,"BackgroundColor3","Bg")


local f3=Instance.new"TextButton"f3.Text=""
f3.AnchorPoint=Vector2.new(1,0)f3.Position=UDim2.new(1,-256,0,4)
f3.Size=UDim2.fromOffset(32,32)f3.BackgroundColor3=fI.Bg
f3.BorderSizePixel=0 fr(f3,8)f3.Parent=fU
ft(f3,true)
fC:_tag(f3,"BackgroundColor3","Bg")
local f4=fz("keyboard",15,fI.Dim)
f4.AnchorPoint=Vector2.new(0.5,0.5)f4.Position=UDim2.new(0.5,0,0.5,0)
f4.Parent=f3
f3.MouseButton1Click:Connect(function()end)

local f5=Instance.new"TextButton"f5.Text=""
f5.AnchorPoint=Vector2.new(1,0)f5.Position=UDim2.new(1,-296,0,4)
f5.Size=UDim2.fromOffset(32,32)f5.BackgroundColor3=fI.Bg
f5.BorderSizePixel=0 fr(f5,8)f5.Parent=fU
ft(f5,true)
fC:_tag(f5,"BackgroundColor3","Bg")
local f6=fz("menu",15,fI.Dim)
f6.AnchorPoint=Vector2.new(0.5,0.5)f6.Position=UDim2.new(0.5,0,0.5,0)
f6.Parent=f5
f5.MouseButton1Click:Connect(function()end)


local f7=Instance.new"Frame"f7.BackgroundTransparency=1
f7.AnchorPoint=Vector2.new(1,0)f7.Position=UDim2.new(1,0,0,4)
f7.Size=UDim2.new(0,56,0,32)f7.Parent=fU
local f8=Instance.new"UIListLayout"f8.FillDirection=Enum.FillDirection.Horizontal
f8.VerticalAlignment=Enum.VerticalAlignment.Center
f8.HorizontalAlignment=Enum.HorizontalAlignment.Center
f8.Padding=UDim.new(0,7)f8.Parent=f7
local function dot(f9,ga)
local gb=Instance.new"TextButton"gb.Text=""
gb.Size=UDim2.fromOffset(12,12)gb.BackgroundColor3=f9
gb.BorderSizePixel=0 fr(gb,99)gb.AutoButtonColor=false gb.Parent=f7
gb.MouseEnter:Connect(function()fn(gb,fm.Hover,{BackgroundTransparency=0.25})end)
gb.MouseLeave:Connect(function()fn(gb,fm.Hover,{BackgroundTransparency=0})end)
return gb
end
local f9=dot(Color3.fromRGB(39,201,63))
local ga=dot(Color3.fromRGB(255,189,46))
local gb=dot(Color3.fromRGB(255,95,86))
gb.MouseButton1Click:Connect(function()end)
ga.MouseButton1Click:Connect(function()end)
f9.MouseButton1Click:Connect(function()end)


local gc=Instance.new"TextButton"gc.Text=""
gc.AnchorPoint=Vector2.new(1,0)gc.Position=UDim2.new(1,-336,0,4)
gc.Size=UDim2.fromOffset(32,32)gc.BackgroundColor3=fI.Bg
gc.BorderSizePixel=0 fr(gc,8)gc.Parent=fU
ft(gc,true)
fC:_tag(gc,"BackgroundColor3","Bg")
local gd=fz("bellring",14,fI.Dim)
gd.AnchorPoint=Vector2.new(0.5,0.5)gd.Position=UDim2.new(0.5,0,0.5,0)
gd.Parent=gc
local ge=Instance.new"Frame"ge.Size=UDim2.fromOffset(8,8)
ge.Position=UDim2.new(1,-7,0,3)ge.BorderSizePixel=0
ge.BackgroundColor3=Color3.fromRGB(248,113,113)
fr(ge,99)ge.Parent=gc ge.Visible=false
gc.MouseButton1Click:Connect(function()end)

fy(fU,fO)


local gf=Instance.new"Frame"gf.Name="Body"
gf.Position=UDim2.new(0,0,0,62)gf.Size=UDim2.new(1,0,1,-62)
gf.BackgroundTransparency=1 gf.Parent=fO
local gg=Instance.new"UIPadding"gg.PaddingLeft=UDim.new(0,12)
gg.PaddingRight=UDim.new(0,12)gg.PaddingBottom=UDim.new(0,12)gg.Parent=gf

local gh=Instance.new"Frame"gh.Name="Sidebar"
gh.Size=UDim2.new(0,164,1,0)gh.BackgroundColor3=fI.Bg
gh.BackgroundTransparency=(fH and not fC._transparent)and 0.15 or 0
gh.BorderSizePixel=0 fr(gh,10)gh.Parent=gf
ft(gh,true)
fC:_tag(gh,"BackgroundColor3","Bg")
fv(gh,10)
fu(gh,8,8,8,8)

local gi=Instance.new"Frame"gi.Name="Nav"
gi.Size=UDim2.new(1,0,1,0)gi.BackgroundTransparency=1 gi.Parent=gh
local gj=Instance.new"UIListLayout"gj.Padding=UDim.new(0,4)
gj.SortOrder=Enum.SortOrder.LayoutOrder gj.Parent=gi




local gk=Instance.new"Frame"gk.Name="_pill"
gk.Size=UDim2.new(1,0,0,38)gk.Position=UDim2.new(0,0,0,-2)
gk.BackgroundColor3=fI.Surface2 gk.BorderSizePixel=0
gk.ZIndex=0
fr(gk,8)gk.Parent=gh
ft(gk,true)
fC:_tag(gk,"BackgroundColor3","Surface2")

local gl=Instance.new"Frame"gl.Name="Pages"
gl.Position=UDim2.new(0,176,0,0)gl.Size=UDim2.new(1,-176,1,0)
gl.BackgroundTransparency=1 gl.ClipsDescendants=true gl.Parent=gf

local gm={
_gui=fK,_main=fO,_side=gh,_nav=gi,_pages=gl,_pill=gk,
_tabs={},_active=nil,_toggleKey=fG,_visible=true,_keybinds={},
_conns={},_acrylicPref=fH,_popouts={},
_tabChangeListeners={},
}

function gm.Track(gn,go)table.insert(gn._conns,go)return go end
local gn
local go
local gp,gq
gm._cfgTitle=fE
gm._body=gf

gm._folder="Kronos/"..tostring(fE)
pcall(function()
if makefolder and isfolder and not isfolder"Kronos"then makefolder"Kronos"end
if makefolder and isfolder and not isfolder(gm._folder)then makefolder(gm._folder)end
end)




gm._dock=nil
gm._dockBtns={}
local gr=false
local function dockRefresh(gs)
for gt,gu in ipairs(gm._dockBtns)do
if gu.tab then pcall(function()gu.api.SetActive(gs==gu.tab)end)end
end
end
local function ensureDock()
if gm._dock and gm._dock.Parent then return gm._dock end
local gs=Instance.new"Frame"
gs.Name=ad.GetStealthName()
gs.AnchorPoint=Vector2.new(0,1)
gs.Position=UDim2.new(0,8,1,-8)
gs.Size=UDim2.new(1,-16,0,32)
gs.BackgroundTransparency=1 gs.BorderSizePixel=0
gs.Parent=gh
local gt=Instance.new"UIListLayout"
gt.FillDirection=Enum.FillDirection.Horizontal
gt.VerticalAlignment=Enum.VerticalAlignment.Center
gt.Padding=UDim.new(0,6)gt.Parent=gs
local gu=Instance.new"UIPadding"
gu.PaddingBottom=UDim.new(0,40)gu.Parent=gi
gm._dock=gs
return gs
end
local function dockAdd(gs,gt,gu,gv)
for gw,gx in ipairs(gm._dockBtns)do
if gx.name==gs then
gx.cb=gu or gx.cb
gx.tab=gv or gx.tab
return gx.api
end
end
local gw=ensureDock()
local gx=Instance.new"TextButton"gx.Text=""
gx.Size=UDim2.fromOffset(28,28)gx.BackgroundColor3=fI.Surface2
gx.BackgroundTransparency=0.5
gx.BorderSizePixel=0 fr(gx,8)gx.AutoButtonColor=false gx.Parent=gw
ft(gx,true)
fl:_tag(gx,"BackgroundColor3","Surface2")
local gy=af.makeIcon(gt or"box",15,fI.Dim)
gy.AnchorPoint=Vector2.new(0.5,0.5)gy.Position=UDim2.new(0.5,0,0.5,0)
gy.Parent=gx
local gz=false
local gA={}
function gA.SetActive(gB)
gz=gB and true or false
fn(gx,fm.Hover,{BackgroundTransparency=gz and 0.15 or 0.5})
if gy:IsA"ImageLabel"then
fn(gy,fm.Hover,{ImageColor3=gz and fI.Text or fI.Dim})
end
end
gx.MouseEnter:Connect(function()
if gz then return end
fn(gx,fm.Hover,{BackgroundTransparency=0.3})
end)
gx.MouseLeave:Connect(function()
if gz then return end
fn(gx,fm.Hover,{BackgroundTransparency=0.5})
end)
gx.MouseButton1Click:Connect(function()
fl:_sfx"Click"fo(gu)
end)
table.insert(gm._dockBtns,{name=gs,tab=gv,cb=gu,api=gA})
if gv and not gr then
gr=true
table.insert(gm._tabChangeListeners,function(gB)
dockRefresh(gB)
end)
end
return gA
end
gm._dockAdd=dockAdd
function gm.AddDockButton(gs,gt)
gt=gt or{}
return dockAdd(gt.Name or"Dock",gt.Icon or"box",gt.Callback,gt.Tab)
end

function gm._activateTab(gs,gt)
if gs and gs._activate then pcall(gs._activate,gt~=false)end
end

function gm._flash(gs,gt)
if not gt or not gt.Parent then return end
local gu=Instance.new"Frame"gu.Name="_flash"
gu.Size=UDim2.fromScale(1,1)gu.BackgroundColor3=fI.Accent
gu.BackgroundTransparency=0.75 gu.BorderSizePixel=0
fr(gu,10)gu.Parent=gt
fn(gu,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()gu:Destroy()end)end)
end

gm:Track(fA.InputBegan:Connect(function(gs,gt)
if gt then return end
if gs.KeyCode==gm._toggleKey then gm:Toggle()end
if gs.KeyCode==Enum.KeyCode.K and fA:IsKeyDown(Enum.KeyCode.LeftControl)then
gm:TogglePalette()
end
if gs.KeyCode==Enum.KeyCode.P and fA:IsKeyDown(Enum.KeyCode.LeftControl)then
gm:TogglePalette()
end
if gs.KeyCode==Enum.KeyCode.Tab and fA:IsKeyDown(Enum.KeyCode.LeftControl)then
local gu=table.find(gm._tabs,gm._active)or 0
local gv=gm._tabs[(gu%#gm._tabs)+1]
if gv then fl:_sfx"Swap"gm._activateTab(gv,true)end
end
end))

f1:GetPropertyChangedSignal"Text":Connect(function()
local gs=string.lower(f1.Text)
for gt,gu in ipairs(gm._tabs)do
local gv=gs==""or string.find(string.lower(gu.Title),gs,1,true)~=nil
for gw,gx in ipairs(gu.Elements)do
local gy
if gs==""then
gy=true
elseif gv then
gy=true
else




local gz=string.lower(tostring(gx.Title or"").." "..tostring(gx.Flag or""))
local gA=gx._handle
local gB
if type(gA)=="table"then
gB=gA.Get
elseif gA~=nil then
local gC,gD=pcall(function()return gA.Get end)
if gC then gB=gD end
end
if type(gB)=="function"then
local gC,gD=pcall(gB,gA)
if gC then
if type(gD)=="string"or type(gD)=="number"then
gz=gz.." "..string.lower(tostring(gD))
elseif type(gD)=="table"then
for gE,gF in ipairs(gD)do gz=gz.." "..string.lower(tostring(gF))end
end
end
end
gy=string.find(gz,gs,1,true)~=nil
end
gx._searchVisible=(gs=="")and nil or gy
if gx.Frame then gx.Frame.Visible=gy end
end
gu.Btn.Visible=(gv or gs=="")and not gu._hidden
if gs~=""and not gu._hidden then

for gw,gx in ipairs(gu.Elements)do
if gx.Frame and gx.Frame.Visible then gu.Btn.Visible=true break end
end
else

for gw,gx in ipairs(gu.Elements)do
if gx._refreshSection then pcall(gx._refreshSection)end
end
end
end
end)


f1.Focused:Connect(function()fn(f_,fm.Hover,{Size=UDim2.new(0,190,0,32)})end)
f1.FocusLost:Connect(function()fn(f_,fm.Hover,{Size=UDim2.new(0,170,0,32)})end)

function gm.SetVisible(gs,gt)
gs._visible=gt

local function pillTarget()
local gu,gv=fK.AbsoluteSize.X,fK.AbsoluteSize.Y
if gu<1 then gu,gv=1200,800 end
local gw,gx=gn.AbsolutePosition,gn.AbsoluteSize
return UDim2.new(0,gw.X+gx.X/2-gu/2,0,gw.Y+gx.Y/2-gv/2)
end
if gt then
fK.Enabled=true
gs._mini=false
if gp then gp.Visible=false end
if gn then gn.Visible=false end
fO.Position=pillTarget()
fR.Scale=baseScale()*0.55
fO.GroupTransparency=1
fM.BackgroundTransparency=1
if gs._acrylicPref then fl:SetAcrylic(true,fD.Blur or 16)end
fl:_sfx"Open"

fn(fO,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=gs._lastPos or UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
fn(fR,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})

dimTo(0.5,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
else
gs._mini=false
gs._lastPos=fO.Position
if gp then gp.Visible=false end
fl:SetAcrylic(false)
for gu,gv in pairs(fl.Sound._cache)do pcall(function()gv:Stop()end)end
fn(fO,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
fn(fR,fm.Fast,{Scale=baseScale()*0.55})

dimTo(1,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In))
task.delay(0.36,function()
if gs._visible then return end
fK.Enabled=false
if gn then
gn.Visible=true
go.Scale=0.5
fn(go,fm.Spring,{Scale=1})
end
end)
end
end
function gm.Toggle(gs)gs:SetVisible(not gs._visible)end


function gm.SetToggleKey(gs,gt)
if type(gt)=="string"then gt=Enum.KeyCode[gt]end
if typeof(gt)=="EnumItem"then
if gs._toggleKey==gt then return end
gs._toggleKey=gt
gs:Notify{Title="Hide key",Content="Now bound to "..gt.Name,Duration=1.5}
end
end
function gm.GetToggleKey(gs)return gs._toggleKey end


function gm.OnClose(gs,gt)
if type(gt)=="function"then gs._onCloseCb=gt end
end

function gm.SetMini(gs,gt)
gt=gt and true or false
if gt==gs._mini then return end
gs._mini=gt
if gt then
gs._visible=false
gs._lastPos=fO.Position
gn.Visible=false
fl:SetAcrylic(false)
for gu,gv in pairs(fl.Sound._cache)do pcall(function()gv:Stop()end)end
fn(fO,fm.Fast,{GroupTransparency=1})
fn(fR,fm.Fast,{Scale=baseScale()*0.7})
dimTo(1,fm.Fast)
task.delay(0.2,function()
if not gs._mini then return end
fK.Enabled=false
gp.Visible=true
gq.Scale=0.5
fn(gq,fm.Spring,{Scale=1})
end)
else
gp.Visible=false
gs:SetVisible(true)
end
end



gm._sbMode=0
gm._focus=false
function gm._applyLayout(gs)
local gt=gs._focus and 2 or gs._sbMode
local gu=gt==1
gh.Visible=gt~=2
if gt==0 then
fn(gh,fm.Fast,{Size=UDim2.new(0,164,1,0)})
gl.Position=UDim2.new(0,176,0,0)
gl.Size=UDim2.new(1,-176,1,0)
elseif gt==1 then
fn(gh,fm.Fast,{Size=UDim2.new(0,58,1,0)})
gl.Position=UDim2.new(0,70,0,0)
gl.Size=UDim2.new(1,-70,1,0)
else
gl.Position=UDim2.new(0,0,0,0)
gl.Size=UDim2.new(1,0,1,0)
end
for gv,gw in ipairs(gs._tabs)do
if gw._label then gw._label.Visible=not gu end
if gw._icon and gw._icon:IsA"GuiObject"then
gw._icon.Position=gu and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end
end
function gm.CycleSidebar(gs)
gs._sbMode=(gs._sbMode+1)%3
gs:_applyLayout()
gs:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[gs._sbMode+1],Duration=1.5}
end
function gm.SetFocus(gs,gt)
gs._focus=gt and true or false
gs:_applyLayout()
end
local function fitCard()
local gs=Vector2.new(1200,800)
pcall(function()gs=workspace.CurrentCamera.ViewportSize end)
local gt=math.clamp(math.min(gs.X/700,gs.Y/520),0.6,1)
fP=gt
fR.Scale=baseScale()
if gs.X<760 or fA.TouchEnabled then
if gm._sbMode==0 and not gm._userToggledSide then
gm._sbMode=2 gm:_applyLayout()
end
end
end
f5.MouseButton1Click:Connect(function()
fl:_sfx"Click"
gm._userToggledSide=true
gm:CycleSidebar()
end)
f3.MouseButton1Click:Connect(function()
fl:_sfx"Click"gm:ToggleKeybindList()
end)


local gs=fD.ConfirmClose
if gs==nil then gs=true end
local function requestClose()
fl:_sfx"Click"
if gs==false then gm:Destroy()return end
local gt=(type(gs)=="table")and gs or{}
gm:Dialog{
Title=gt.Title or"Close Kronos?",
Content=gt.Content or"The hub will close permanently and all features will be disabled.",
Buttons={
{Title=gt.Cancel or"Cancel"},
{Title=gt.Confirm or"Close",Callback=function()gm:Destroy()end},
},
}
end
gb.MouseButton1Click:Connect(function()requestClose()end)
ga.MouseButton1Click:Connect(function()
fl:_sfx"Click"gm:SetMini(not gm._mini)
end)
gm._zoomed=false
f9.MouseButton1Click:Connect(function()
fl:_sfx"Click"
gm._zoomed=not gm._zoomed
fn(fO,fm.Med,{Size=gm._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
gc.MouseButton1Click:Connect(function()
fl:_sfx"Click"gm:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
gm:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

gn=Instance.new"TextButton"gn.Name=ad.GetStealthName()
gn.Text=""
gn.AnchorPoint=Vector2.new(0,0.5)gn.Position=UDim2.new(0,12,0.5,0)
gn.Size=UDim2.fromOffset(42,42)
gn.BackgroundColor3=fI.Surface2 gn.BorderSizePixel=0
fC:_tag(gn,"BackgroundColor3","Surface2")
fr(gn,13)gn.Parent=fK gn.Visible=false
ft(gn,true)
fx(gn,0.6,20)

local gt=Instance.new"TextLabel"gt.Size=UDim2.fromScale(1,1)
gt.BackgroundTransparency=1 gt.Font=Enum.Font.GothamBlack
gt.TextSize=20 gt.Text="K"gt.Parent=gn
fC:_tag(gt,"TextColor3","Text")
local gu=Instance.new"Frame"gu.Size=UDim2.fromOffset(9,9)
gu.Position=UDim2.new(1,-6,0,-3)gu.BorderSizePixel=0
fC:_tag(gu,"BackgroundColor3","Accent")
fr(gu,99)gu.Parent=gn
brandInto(gn,gt)
if not fD.Logo or fD.Logo==""then kronosFace(gn,gt,32,17)end
go=Instance.new"UIScale"go.Parent=gn
fy(gn,gn)
gn.MouseButton1Click:Connect(function()gm:SetVisible(true)end)


gp=Instance.new"TextButton"gp.Name=ad.GetStealthName()
gp.Text=""
gp.AnchorPoint=Vector2.new(0,0)gp.Position=UDim2.new(0,12,0,12)
gp.Size=UDim2.fromOffset(44,44)
gp.BackgroundColor3=fI.Surface2 gp.BorderSizePixel=0
fC:_tag(gp,"BackgroundColor3","Surface2")
fr(gp,13)gp.Parent=fJ gp.Visible=false
ft(gp,true)
fx(gp,0.6,20)
local gv=Instance.new"TextLabel"gv.Size=UDim2.fromScale(1,1)
gv.BackgroundTransparency=1 gv.Font=Enum.Font.GothamBlack
gv.TextSize=20 gv.Text="K"gv.Parent=gp
fC:_tag(gv,"TextColor3","Text")
local gw=Instance.new"Frame"gw.Size=UDim2.fromOffset(9,9)
gw.Position=UDim2.new(1,-6,0,-3)gw.BorderSizePixel=0
fC:_tag(gw,"BackgroundColor3","Accent")
fr(gw,99)gw.Parent=gp
brandInto(gp,gv)
if not fD.Logo or fD.Logo==""then kronosFace(gp,gv,34,17)end
gq=Instance.new"UIScale"gq.Parent=gp
fy(gp,gp)
gp.MouseButton1Click:Connect(function()gm:SetMini(false)end)


local gx=Instance.new"TextButton"gx.Text=""
gx.AnchorPoint=Vector2.new(1,1)gx.Position=UDim2.new(1,0,1,0)
gx.Size=UDim2.fromOffset(28,28)gx.BackgroundTransparency=1
gx.Parent=fO gx.ZIndex=50
gx.ClipsDescendants=true


local gy=0
gx.MouseButton1Click:Connect(function()
local gz=os.clock()
if gz-gy<0.35 then
fl:_sfx"Click"
gm._zoomed=not gm._zoomed
fn(fO,fm.Med,{Size=gm._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
gy=gz
end)
local gz,gA,gB=false
gx.InputBegan:Connect(function(gC)
if gC.UserInputType==Enum.UserInputType.MouseButton1 or gC.UserInputType==Enum.UserInputType.Touch then
gz,gA,gB=true,gC.Position,fO.Size
gC.Changed:Connect(function()
if gC.UserInputState==Enum.UserInputState.End then gz=false end
end)
end
end)
gm:Track(fA.InputChanged:Connect(function(gC)
if not gz then return end
if gC.UserInputType~=Enum.UserInputType.MouseMovement
and gC.UserInputType~=Enum.UserInputType.Touch then return end
local gD=gC.Position-gA
fO.Size=UDim2.fromOffset(
math.clamp(gB.X.Offset+gD.X,520,920),
math.clamp(gB.Y.Offset+gD.Y,380,660))
end))

function gm.Notify(gC,gD)
gD=gD or{}
fl:_sfx"Notify"
fk.closeAny()
table.insert(fl._inbox,1,{Title=gD.Title or"Kronos",
Content=gD.Content or gD.Text or"",At=os.date"%H:%M"})
while#fl._inbox>30 do table.remove(fl._inbox)end
pcall(function()ge.Visible=true end)
local gE=ensureNotifyHost(fL)
local gF=Instance.new"CanvasGroup"gF.Size=UDim2.new(1,0,0,62)
gF.BackgroundColor3=fI.Surface2 gF.BorderSizePixel=0 gF.GroupTransparency=1
fr(gF,10)gF.Parent=gE
ft(gF,true)
fx(gF,0.65,24)
fl:_tag(gF,"BackgroundColor3","Surface2")
gF.Position=UDim2.new(0,40,0,0)
fn(gF,fm.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local gG=Instance.new"TextLabel"gG.BackgroundTransparency=1
gG.Position=UDim2.new(0,12,0,8)gG.Size=UDim2.new(1,-24,0,17)
gG.Font=Enum.Font.GothamBold gG.TextSize=13 gG.TextXAlignment=0
fl:_tag(gG,"TextColor3","Text")gG.Text=gD.Title or"Kronos"gG.Parent=gF
local gH=Instance.new"TextLabel"gH.BackgroundTransparency=1
gH.Position=UDim2.new(0,12,0,27)gH.Size=UDim2.new(1,-24,0,16)
gH.Font=Enum.Font.Gotham gH.TextSize=12 gH.TextXAlignment=0
fl:_tag(gH,"TextColor3","Dim")
gH.TextTruncate=Enum.TextTruncate.AtEnd gH.Text=gD.Content or gD.Text or""gH.Parent=gF
local gI=Instance.new"Frame"gI.AnchorPoint=Vector2.new(0,1)
gI.Position=UDim2.new(0,10,1,-6)gI.Size=UDim2.new(1,-20,0,2)
gI.BorderSizePixel=0 fl:agrad(gI,0)
fr(gI,99)gI.Parent=gF
local gJ=gD.Duration or 4
fn(gI,TweenInfo.new(gJ,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(gJ+0.1,function()
fn(gF,fm.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()gF:Destroy()end)end)
end)
end




local function fadeModal(gC,gD,gE)
fn(gC,fm.Fast,{GroupTransparency=1})
pcall(function()
for gF,gG in ipairs(gC:GetDescendants())do
if gG:IsA"UIStroke"then fn(gG,fm.Fast,{Transparency=1})end
end
end)
fn(gD,fm.Fast,{BackgroundTransparency=1})
task.delay(gE or 0.18,function()pcall(function()gD:Destroy()end)end)
end


function gm.Dialog(gC,gD)
gD=gD or{}
fl:_sfx"Open"
local gE=Instance.new"TextButton"gE.Text=""gE.AutoButtonColor=false
gE.Size=UDim2.fromScale(1,1)gE.BackgroundColor3=Color3.fromRGB(0,0,0)
gE.BackgroundTransparency=1 gE.Parent=fK
fn(gE,fm.Med,{BackgroundTransparency=0.55})
local gF=Instance.new"CanvasGroup"gF.AnchorPoint=Vector2.new(0.5,0.5)



gF.Position=UDim2.new(0.5,fO.Position.X.Offset,0.5,fO.Position.Y.Offset)
gF.Size=UDim2.fromOffset(320,170)
gF.BackgroundColor3=fI.Surface gF.BorderSizePixel=0 gF.GroupTransparency=1
fr(gF,12)gF.Parent=gE
ft(gF,true)
fv(gF,12)
fx(gF,0.5,40)
fl:_tag(gF,"BackgroundColor3","Surface")
local gG=Instance.new"UIScale"gG.Scale=0.94 gG.Parent=gF
fn(gF,fm.Med,{GroupTransparency=0})
fn(gG,fm.Spring,{Scale=1})
local gH=false
local function close()
if gH then return end gH=true
fk.close(close)
fadeModal(gF,gE)
end
fk.open(close)
gE.MouseButton1Click:Connect(function()close()end)
local gI=Instance.new"TextLabel"gI.BackgroundTransparency=1
gI.Position=UDim2.new(0,16,0,14)gI.Size=UDim2.new(1,-32,0,20)
gI.Font=Enum.Font.GothamBold gI.TextSize=15 gI.TextXAlignment=0
fl:_tag(gI,"TextColor3","Text")gI.Text=gD.Title or"Confirm"gI.Parent=gF
local gJ=Instance.new"TextLabel"gJ.BackgroundTransparency=1
gJ.Position=UDim2.new(0,16,0,38)gJ.Size=UDim2.new(1,-32,0,60)
gJ.Font=Enum.Font.Gotham gJ.TextSize=12 gI.TextXAlignment=0
gJ.TextXAlignment=0 gJ.TextYAlignment=0 gJ.TextWrapped=true
fl:_tag(gJ,"TextColor3","Dim")gJ.Text=gD.Content or""gJ.Parent=gF
local gK=Instance.new"Frame"gK.BackgroundTransparency=1
gK.AnchorPoint=Vector2.new(0,1)gK.Position=UDim2.new(0,0,1,-12)
gK.Size=UDim2.new(1,0,0,34)gK.Parent=gF
local gL=Instance.new"UIListLayout"gL.FillDirection=Enum.FillDirection.Horizontal
gL.HorizontalAlignment=Enum.HorizontalAlignment.Right gL.Padding=UDim.new(0,8)gL.Parent=gK
fu(gK,0,0,12,12)
for gM,gN in ipairs(gD.Buttons or{{Title="OK"}})do
local gO=Instance.new"TextButton"gO.Text=""
gO.Size=UDim2.new(0,96,0,30)gO.BackgroundColor3=fI.Surface2
gO.BorderSizePixel=0 fr(gO,7)gO.AutoButtonColor=false gO.Parent=gK
ft(gO,true)
fl:_tag(gO,"BackgroundColor3","Surface2")
local gP=Instance.new"TextLabel"gP.BackgroundTransparency=1 gP.Size=UDim2.fromScale(1,1)
gP.Font=Enum.Font.GothamBold gP.TextSize=12
fl:_tag(gP,"TextColor3","Text")gP.Text=gN.Title gP.Parent=gO
local gQ=Instance.new"UIScale"gQ.Parent=gO
gO.MouseButton1Down:Connect(function()fn(gQ,fm.Hover,{Scale=0.95})end)
gO.MouseButton1Up:Connect(function()fn(gQ,fm.Spring,{Scale=1})end)
gO.MouseButton1Click:Connect(function()
close()fo(gN.Callback)
end)
end
return{Close=close}
end



function gm.Confirm(gC,gD)
gD=gD or{}
local gE=gD.Danger==true
local gF=Instance.new"TextButton"gF.Text=""gF.AutoButtonColor=false
gF.Size=UDim2.fromScale(1,1)gF.BackgroundColor3=Color3.fromRGB(0,0,0)
gF.BackgroundTransparency=1 gF.Parent=fK
fn(gF,fm.Med,{BackgroundTransparency=0.55})
local gG=Instance.new"CanvasGroup"gG.AnchorPoint=Vector2.new(0.5,0.5)
gG.Position=UDim2.new(0.5,fO.Position.X.Offset,0.5,fO.Position.Y.Offset)
gG.Size=UDim2.fromOffset(320,150)
gG.BackgroundColor3=fI.Surface gG.BorderSizePixel=0 gG.GroupTransparency=1
fr(gG,12)gG.Parent=gF
ft(gG,true)
fv(gG,12)
fx(gG,0.5,40)
fl:_tag(gG,"BackgroundColor3","Surface")
local gH=Instance.new"UIScale"gH.Scale=0.94 gH.Parent=gG
fn(gG,fm.Med,{GroupTransparency=0})
fn(gH,fm.Spring,{Scale=1})
local gI=false
local function close(gJ)
if gI then return end gI=true
fk.close(close)
fadeModal(gG,gF)
fo(gD.Callback,gJ and true or false)
end
fk.open(close)
gF.MouseButton1Click:Connect(function()close(false)end)
gm:Track(fA.InputBegan:Connect(function(gJ,gK)
if gI or gK then return end
if gJ.KeyCode==Enum.KeyCode.Return or gJ.KeyCode==Enum.KeyCode.KeypadEnter then
close(true)
elseif gJ.KeyCode==Enum.KeyCode.Escape then
close(false)
end
end))
local gJ=Instance.new"TextLabel"gJ.BackgroundTransparency=1
gJ.Position=UDim2.new(0,16,0,14)gJ.Size=UDim2.new(1,-32,0,22)
gJ.Font=Enum.Font.GothamBold gJ.TextSize=15 gJ.TextXAlignment=0
fl:_tag(gJ,"TextColor3",gE and"Danger"or"Text")
gJ.Text=gD.Title or"Confirm"gJ.Parent=gG
local gK=Instance.new"TextLabel"gK.BackgroundTransparency=1
gK.Position=UDim2.new(0,16,0,40)gK.Size=UDim2.new(1,-32,0,52)
gK.Font=Enum.Font.Gotham gK.TextSize=12
gK.TextXAlignment=0 gK.TextYAlignment=0 gK.TextWrapped=true
fl:_tag(gK,"TextColor3","Dim")gK.Text=gD.Text or""gK.Parent=gG
local gL=Instance.new"Frame"gL.BackgroundTransparency=1
gL.AnchorPoint=Vector2.new(0,1)gL.Position=UDim2.new(0,0,1,-12)
gL.Size=UDim2.new(1,0,0,34)gL.Parent=gG
local gM=Instance.new"UIListLayout"gM.FillDirection=Enum.FillDirection.Horizontal
gM.HorizontalAlignment=Enum.HorizontalAlignment.Right gM.Padding=UDim.new(0,8)gM.Parent=gL
fu(gL,0,0,12,12)
local function mkBtn(gN,gO,gP)
local gQ=Instance.new"TextButton"gQ.Text=""
gQ.Size=UDim2.new(0,110,0,30)gQ.BackgroundColor3=fI.Surface2
gQ.BorderSizePixel=0 fr(gQ,7)gQ.AutoButtonColor=false gQ.Parent=gL
ft(gQ,true)
fl:_tag(gQ,"BackgroundColor3","Surface2")
local gR=Instance.new"TextLabel"gR.BackgroundTransparency=1 gR.Size=UDim2.fromScale(1,1)
gR.Font=Enum.Font.GothamBold gR.TextSize=12
fl:_tag(gR,"TextColor3",gO and"Accent"or"Text")
gR.Text=gN gR.Parent=gQ
gQ.MouseButton1Click:Connect(function()gP()end)
return gQ
end
mkBtn(gD.CancelText or"Cancel",false,function()close(false)end)
mkBtn(gD.ConfirmText or"Confirm",true,function()close(true)end)
return{Close=function()close(false)end}
end



function gm.Modal(gC,gD)
gD=gD or{}
local gE=gD.Fields or{}
local gF=gD.Danger==true
local gG=Instance.new"TextButton"gG.Text=""gG.AutoButtonColor=false
gG.Size=UDim2.fromScale(1,1)gG.BackgroundColor3=Color3.fromRGB(0,0,0)
gG.BackgroundTransparency=1 gG.Parent=fK
fn(gG,fm.Med,{BackgroundTransparency=0.55})
local gH=Instance.new"CanvasGroup"gH.AnchorPoint=Vector2.new(0.5,0.5)
gH.Position=UDim2.new(0.5,fO.Position.X.Offset,0.5,fO.Position.Y.Offset)
gH.Size=UDim2.fromOffset(340,0)gH.AutomaticSize=Enum.AutomaticSize.Y
gH.BackgroundColor3=fI.Surface gH.BorderSizePixel=0 gH.GroupTransparency=1
fr(gH,12)gH.Parent=gG
ft(gH,true)
fv(gH,12)
fx(gH,0.5,40)
fl:_tag(gH,"BackgroundColor3","Surface")
local gI=Instance.new"UIScale"gI.Scale=0.94 gI.Parent=gH
fn(gH,fm.Med,{GroupTransparency=0})
fn(gI,fm.Spring,{Scale=1})
local gJ=false
local gK={}
local function values()
local gL={}
for gM,gN in pairs(gK)do
gL[gM]=gN.Text
end
return gL
end
local function close(gL)
if gJ then return end gJ=true
fk.close(close)
fadeModal(gH,gG)
if gL then fo(gD.Callback,true,values())else fo(gD.Callback,false,values())end
end
fk.open(close)
gG.MouseButton1Click:Connect(function()close(false)end)
local gL=Instance.new"TextLabel"gL.BackgroundTransparency=1
gL.Position=UDim2.new(0,16,0,14)gL.Size=UDim2.new(1,-32,0,22)
gL.Font=Enum.Font.GothamBold gL.TextSize=15 gL.TextXAlignment=0
fl:_tag(gL,"TextColor3",gF and"Danger"or"Text")
gL.Text=gD.Title or"Modal"gL.Parent=gH
local gM=42
if gD.Text and gD.Text~=""then
local gN=Instance.new"TextLabel"gN.BackgroundTransparency=1
gN.Position=UDim2.new(0,16,0,gM)gN.Size=UDim2.new(1,-32,0,30)
gN.Font=Enum.Font.Gotham gN.TextSize=12
gN.TextXAlignment=0 gN.TextYAlignment=0 gN.TextWrapped=true
fl:_tag(gN,"TextColor3","Dim")gN.Text=gD.Text gN.Parent=gH
gM+=36
end
for gN,gO in ipairs(gE)do
local gP=gO.Type=="textarea"
local gQ=gP and 56 or 30
if gO.Label and gO.Label~=""then
local gR=Instance.new"TextLabel"gR.BackgroundTransparency=1
gR.Position=UDim2.new(0,16,0,gM)gR.Size=UDim2.new(1,-32,0,14)
gR.Font=Enum.Font.GothamBold gR.TextSize=11 gR.TextXAlignment=0
fl:_tag(gR,"TextColor3","Dim")gR.Text=string.upper(tostring(gO.Label))gR.Parent=gH
gM+=16
end
local gR=Instance.new"TextBox"
gR.PlaceholderText=gO.Placeholder or""gR.PlaceholderColor3=fI.Dim
gR.Text=gO.Default or""
gR.Font=Enum.Font.Gotham gR.TextSize=13
gR.TextXAlignment=0 gR.TextYAlignment=gP and 0 or 1
gR.TextWrapped=gP gR.MultiLine=gP
gR.ClearTextOnFocus=false
gR.Position=UDim2.new(0,16,0,gM)gR.Size=UDim2.new(1,-32,0,gQ)
gR.BackgroundColor3=fI.Surface2 gR.BorderSizePixel=0
fr(gR,7)gR.Parent=gH
fu(gR,4,4,10,10)
ft(gR,true)
fl:_tag(gR,"BackgroundColor3","Surface2")
fl:_tag(gR,"TextColor3","Text")
if tonumber(gO.MaxLength)then
local gS=tonumber(gO.MaxLength)
gR:GetPropertyChangedSignal"Text":Connect(function()
if string.len(gR.Text)>gS then gR.Text=string.sub(gR.Text,1,gS)end
end)
end
gK[gO.Key]=gR
gM+=gQ+10
end
local gN=Instance.new"Frame"gN.BackgroundTransparency=1
gN.Position=UDim2.new(0,0,0,gM)gN.Size=UDim2.new(1,0,0,46)
gN.Parent=gH
local gO=Instance.new"UIListLayout"gO.FillDirection=Enum.FillDirection.Horizontal
gO.HorizontalAlignment=Enum.HorizontalAlignment.Right gO.Padding=UDim.new(0,8)gO.Parent=gN
fu(gN,0,12,12,12)
local function mkBtn2(gP,gQ,gR)
local gS=Instance.new"TextButton"gS.Text=""
gS.Size=UDim2.new(0,110,0,30)gS.BackgroundColor3=fI.Surface2
gS.BorderSizePixel=0 fr(gS,7)gS.AutoButtonColor=false gS.Parent=gN
ft(gS,true)
fl:_tag(gS,"BackgroundColor3","Surface2")
local gT=Instance.new"TextLabel"gT.BackgroundTransparency=1 gT.Size=UDim2.fromScale(1,1)
gT.Font=Enum.Font.GothamBold gT.TextSize=12
fl:_tag(gT,"TextColor3",gQ and"Accent"or"Text")
gT.Text=gP gT.Parent=gS
gS.MouseButton1Click:Connect(function()gR()end)
return gS
end
mkBtn2(gD.CancelText or"Cancel",false,function()close(false)end)
mkBtn2(gD.ConfirmText or"Confirm",true,function()close(true)end)
return{Close=function()close(false)end}
end




function gm.KeySystem(gC,gD)
gD=gD or{}
local gE,gF=false,gD.FileName or("kronos_key_"..tostring(fE))

local gG=(gC._folder or"Kronos").."/"..gF..".txt"

if gD.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(gG)then
local gH=readfile(gG)
if gH and gC:_checkKey(gD,gH)then gE=true end
end
end)
end
local gH=Instance.new"TextButton"gH.Text=""gH.AutoButtonColor=false
gH.Size=UDim2.fromScale(1,1)gH.BackgroundColor3=Color3.fromRGB(0,0,0)
gH.BackgroundTransparency=1 gH.ZIndex=200 gH.Parent=fK
fn(gH,fm.Med,{BackgroundTransparency=0.6})
local gI=Instance.new"CanvasGroup"gI.AnchorPoint=Vector2.new(0.5,0.5)
gI.Position=UDim2.new(0.5,0,0.5,0)gI.Size=UDim2.fromOffset(300,210)
gI.BackgroundColor3=fI.Surface gI.BorderSizePixel=0 gI.GroupTransparency=1
fr(gI,12)gI.Parent=gH
ft(gI,true)
fv(gI,12)
fx(gI,0.5,40)
fl:_tag(gI,"BackgroundColor3","Surface")
local gJ=Instance.new"UIScale"gJ.Scale=0.94 gJ.Parent=gI
fn(gI,fm.Med,{GroupTransparency=0})
fn(gJ,fm.Spring,{Scale=1})
local gK=Instance.new"TextLabel"gK.BackgroundTransparency=1
gK.Position=UDim2.new(0,16,0,14)gK.Size=UDim2.new(1,-32,0,20)
gK.Font=Enum.Font.GothamBold gK.TextSize=15 gK.TextXAlignment=0
fl:_tag(gK,"TextColor3","Text")gK.Text=gD.Title or"Enter Key"gK.Parent=gI
local gL=Instance.new"TextLabel"gL.BackgroundTransparency=1
gL.Position=UDim2.new(0,16,0,36)gL.Size=UDim2.new(1,-32,0,15)
gL.Font=Enum.Font.Gotham gL.TextSize=11 gK.TextXAlignment=0 gL.TextXAlignment=0
fl:_tag(gL,"TextColor3","Dim")gL.Text=string.upper(gD.Subtitle or"key required")gL.Parent=gI
local gM=Instance.new"TextBox"gM.PlaceholderText="Paste key..."
gM.PlaceholderColor3=fI.Dim gM.Text=""
gM.Font=Enum.Font.Code gM.TextSize=12
gM.Position=UDim2.new(0,16,0,60)gM.Size=UDim2.new(1,-32,0,32)
gM.BackgroundColor3=fI.Surface2 gM.BorderSizePixel=0
fr(gM,8)gM.Parent=gI
fu(gM,4,4,10,10)
ft(gM,true)
fl:_tag(gM,"BackgroundColor3","Surface2")
fl:_tag(gM,"TextColor3","Text")
local gN=Instance.new"TextLabel"gN.BackgroundTransparency=1
gN.Position=UDim2.new(0,16,0,96)gN.Size=UDim2.new(1,-32,0,15)
gN.Font=Enum.Font.Gotham gN.TextSize=11 gN.TextXAlignment=0 gN.Text=""
fl:_tag(gN,"TextColor3","Danger")gN.Parent=gI
local gO=Instance.new"TextButton"gO.Text=""
gO.Position=UDim2.new(0,16,0,118)gO.Size=UDim2.new(1,-32,0,32)
gO.BorderSizePixel=0 fr(gO,8)gO.AutoButtonColor=false gO.Parent=gI
fl:agrad(gO,15)
local gP=Instance.new"TextLabel"gP.BackgroundTransparency=1 gP.Size=UDim2.fromScale(1,1)
gP.Font=Enum.Font.GothamBold gP.TextSize=13 gP.Text="UNLOCK"
fl:oa(gP)gP.Parent=gO
local gQ=Instance.new"UIScale"gQ.Parent=gO
local gR
if gD.GetKeyLink then
gR=Instance.new"TextButton"gR.Text=""
gR.Position=UDim2.new(0,16,0,156)gR.Size=UDim2.new(1,-32,0,26)
gR.BackgroundTransparency=1 gR.Parent=gI
local gS=Instance.new"TextLabel"gS.BackgroundTransparency=1 gS.Size=UDim2.fromScale(1,1)
gS.Font=Enum.Font.Gotham gS.TextSize=11 gS.Text="Copy key link"
fl:_tag(gS,"TextColor3","Dim")gS.Parent=gR
gR.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(gD.GetKeyLink)end end)
gS.Text="Link copied"
task.delay(2,function()pcall(function()gS.Text="Copy key link"end)end)
end)
end
local function shake()local gS=
gI.Position.X.Offset
for gT=1,3 do
fn(gI,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
fn(gI,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
fn(gI,fm.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
gE=true
if gD.SaveKey~=false then
pcall(function()
if makefolder and isfolder and not isfolder(gC._folder or"Kronos")then
makefolder(gC._folder or"Kronos")
end
if writefile then writefile(gG,gM.Text)end
end)
end
fadeModal(gI,gH,0.2)
gC:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
fo(gD.OnSuccess)
end
local function check()
local gS=gM.Text
if gC:_checkKey(gD,gS)then unlock()
else gN.Text="Invalid key."task.spawn(shake)end
end
gO.MouseButton1Down:Connect(function()fn(gQ,fm.Hover,{Scale=0.96})end)
gO.MouseButton1Up:Connect(function()fn(gQ,fm.Spring,{Scale=1})end)
gO.MouseButton1Click:Connect(check)
gM.FocusLost:Connect(function(gS)if gS then check()end end)
if gE then pcall(function()gH:Destroy()end)fo(gD.OnSuccess)end
return{Passed=function()return gE end}
end

function fl._checkKey(gC,gD,gE)
if gD.Validate and type(gD.Validate)=="function"then
local gF,gG=pcall(gD.Validate,gE)
if gF and gG then return true end
end
if gD.Key and gE==gD.Key then return true end
if gD.Keys and table.find(gD.Keys,gE)then return true end
if not gD.Key and not gD.Keys and not gD.Validate then return true end
return false
end


function gm.TogglePalette(gC,gD)
local gE=gC._palette
if not gE then
local gF=Instance.new"TextButton"gF.Text=""gF.AutoButtonColor=false
gF.Size=UDim2.fromScale(1,1)gF.BackgroundColor3=Color3.fromRGB(0,0,0)
gF.BackgroundTransparency=1 gF.Visible=false gF.ZIndex=fk.Z.Popup gF.Parent=fL
local gG=Instance.new"Frame"gG.AnchorPoint=Vector2.new(0.5,0)
gG.Position=UDim2.new(0.5,0,0,90)gG.Size=UDim2.fromOffset(380,300)
gG.BackgroundColor3=fI.Bg gG.BorderSizePixel=0
fr(gG,12)gG.Parent=gF
ft(gG,true)
fx(gG,0.5,40)
fl:_tag(gG,"BackgroundColor3","Bg")
local gH=Instance.new"TextBox"gH.PlaceholderText="Type a command..."
gH.PlaceholderColor3=fI.Dim gH.Text=""
gH.Font=Enum.Font.Gotham gH.TextSize=14
gH.Position=UDim2.new(0,14,0,12)gH.Size=UDim2.new(1,-28,0,32)
gH.BackgroundTransparency=1 gH.ClearTextOnFocus=false gH.Parent=gG
fl:_tag(gH,"TextColor3","Text")
local gI=Instance.new"Frame"gI.BorderSizePixel=0
gI.Position=UDim2.new(0,12,0,50)gI.Size=UDim2.new(1,-24,0,1)
gI.BackgroundColor3=Color3.fromRGB(255,255,255)
gI.BackgroundTransparency=0.93 gI.Parent=gG
local gJ=Instance.new"ScrollingFrame"
gJ.Position=UDim2.new(0,8,0,56)gJ.Size=UDim2.new(1,-16,1,-64)
gJ.BackgroundTransparency=1 gJ.BorderSizePixel=0
gJ.ScrollBarThickness=2 gJ.CanvasSize=UDim2.new(0,0,0,0)
gJ.AutomaticCanvasSize=Enum.AutomaticSize.Y gJ.Parent=gG
fl:_tag(gJ,"ScrollBarImageColor3","Surface2")
local gK=Instance.new"UIListLayout"gK.Padding=UDim.new(0,2)
gK.SortOrder=Enum.SortOrder.LayoutOrder gK.Parent=gJ
gE={ov=gF,card=gG,box=gH,list=gJ,open=false,sel=1,rows={}}
gC._palette=gE
local function fuzzy(gL,gM)
gL,gM=string.lower(gL),string.lower(gM)
if gL==""then return 0 end
local gN,gO,gP=1,0,0
for gQ=1,#gM do
if string.sub(gM,gQ,gQ)==string.sub(gL,gN,gN)then
gO+=(gP==gQ-1)and 2 or 1
gP,gN=gQ,gN+1
if gN>#gL then return gO-gQ*0.01 end
end
end
return nil
end
local function run(gL)
if not gL then return end
gE.ov.Visible,gE.open=false,false
fk.close(gE._closeLayer)
fn(gE.ov,fm.Fast,{BackgroundTransparency=1})
if gL.go then pcall(gL.go)end
end
gE._run=run
local function render()
for gL,gM in ipairs(gE.rows)do pcall(function()gM.frame:Destroy()end)end
gE.rows={}
local gL=gH.Text
local gM={}
for gN,gO in ipairs(gC._tabs)do
local gP=fuzzy(gL,gO.Title)
if gP then table.insert(gM,{label=gO.Title,hint="tab",score=gP+100,
go=function()gC._activateTab(gO,true)end})end
for gQ,gR in ipairs(gO.Elements)do
if gR.Title and gR.Frame then
local gS=fuzzy(gL,gO.Title.." "..gR.Title)
if gS then table.insert(gM,{label=gR.Title,hint=gO.Title,score=gS,
go=gR._go})end
end
end
end
table.sort(gM,function(gN,gO)return gN.score>gO.score end)
gE.sel=math.clamp(gE.sel,1,math.max(1,math.min(12,#gM)))
if#gM==0 then
local gN=Instance.new"TextLabel"gN.BackgroundTransparency=1
gN.Size=UDim2.new(1,0,0,30)gN.Font=Enum.Font.Gotham
gN.TextSize=12 gN.Text="No results"gN.Parent=gJ
fl:_tag(gN,"TextColor3","Dim")
gE.rows={{frame=gN}}
return
end
for gN=1,math.min(12,#gM)do
local gO=gM[gN]
local gP=Instance.new"TextButton"gP.Text=""
gP.Size=UDim2.new(1,-4,0,32)gP.BorderSizePixel=0
gP.BackgroundColor3=fI.Surface2
gP.BackgroundTransparency=(gN==gE.sel)and 0.35 or 1
fr(gP,7)gP.Parent=gJ
fl:_tag(gP,"BackgroundColor3","Surface2")
local gQ=Instance.new"TextLabel"gQ.BackgroundTransparency=1
gQ.Position=UDim2.new(0,10,0,0)gQ.Size=UDim2.new(1,-90,1,0)
gQ.Font=Enum.Font.Gotham gQ.TextSize=13 gQ.TextXAlignment=0
gQ.TextTruncate=Enum.TextTruncate.AtEnd gQ.Text=gO.label gQ.Parent=gP
fl:_tag(gQ,"TextColor3","Text")
local gR=Instance.new"TextLabel"gR.BackgroundTransparency=1
gR.AnchorPoint=Vector2.new(1,0)gR.Position=UDim2.new(1,-10,0,0)
gR.Size=UDim2.new(0,70,1,0)gR.Font=Enum.Font.Gotham
gR.TextSize=10 gR.TextXAlignment=1 gQ.TextTruncate=Enum.TextTruncate.AtEnd
gR.Text=gO.hint gR.Parent=gP
fl:_tag(gR,"TextColor3","Dim")
local gS=gN
gP.MouseButton1Click:Connect(function()run(gO)end)
gP.MouseEnter:Connect(function()
gE.sel=gS render()
end)
table.insert(gE.rows,{frame=gP,item=gO})
end
end
gE._render=render
gH:GetPropertyChangedSignal"Text":Connect(function()gE.sel=1 render()end)
gF.MouseButton1Click:Connect(function()
if gE.open then gC:TogglePalette(false)end
end)
gC:Track(fA.InputBegan:Connect(function(gL,gM)
if not gE.open then return end
if gL.KeyCode==Enum.KeyCode.Escape then gC:TogglePalette(false)
elseif gL.KeyCode==Enum.KeyCode.Return or gL.KeyCode==Enum.KeyCode.KeypadEnter then
local gN=gE.rows[gE.sel]
run(gN and gN.item)
elseif gL.KeyCode==Enum.KeyCode.Up then
gE.sel=math.max(1,gE.sel-1)render()
elseif gL.KeyCode==Enum.KeyCode.Down then
gE.sel=math.min(#gE.rows,gE.sel+1)render()
end
end))
gE._closeLayer=function()
if gE.open then gC:TogglePalette(false)end
end
end
local gF=(gD~=nil)and gD or(not gE.open)
gE.open=gF
gE.ov.Visible=gF
if gF then
fk.open(gE._closeLayer)
fl:_sfx"Open"
flyTo(gE.ov,{BackgroundTransparency=0.45})
gE.card.Position=UDim2.new(0.5,0,0,78)
flyTo(gE.card,{Position=UDim2.new(0.5,0,0,90)})
gE.box.Text,gE.sel="",1
gE._render()
task.defer(function()pcall(function()gE.box:CaptureFocus()end)end)
else
fk.close(gE._closeLayer)
flyTo(gE.ov,{BackgroundTransparency=1},fm.Fast,function()
if not gE.open then gE.ov.Visible=false end
end)
end
end

function gm.SetTheme(gC,gD)fl:SetTheme(gD)end

function fl.SetAccent(gC,gD)
if typeof(gD)~="Color3"then return end
gC.Themes[gC.ThemeName].Accent=gD
gC:SetTheme(gC.ThemeName)
end


fl.FontPacks={
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
fl.FontPack="Gotham+"
fl._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function fl._resolveFont(gC,gD)
local gE,gF=pcall(function()return Enum.Font[gD]end)
if gE and gF then return gF end
return nil
end
function fl._paintFonts(gC,gD)
local gE=gC.FontPacks[gC.FontPack]
if not gE then return end
for gF,gG in ipairs(gD:GetDescendants())do
if gG:IsA"TextLabel"or gG:IsA"TextButton"or gG:IsA"TextBox"then
local gH=gG:GetAttribute"KronosFontRole"
if not gH then
gH=gC._roleFromDefault[gG.Font]or"Body"
gG:SetAttribute("KronosFontRole",gH)
gG:SetAttribute("KronosBaseSize",gG.TextSize)
end
local gI=gG:GetAttribute"KronosBaseSize"or gG.TextSize
local gJ=(gE.Bump and gE.Bump[gH])or 0
local gK=gE[gH]and gC:_resolveFont(gE[gH])or nil
pcall(function()
if gK then gG.Font=gK end
gG.TextSize=math.clamp(gI+gJ,8,30)
end)
end
end
end
function fl.SetFontPack(gC,gD)
if not gC.FontPacks[gD]then return end
gC.FontPack=gD
if gC._gui then gC:_paintFonts(gC._gui)end
end
function fl.RefreshFonts(gC)
if gC._gui then gC:_paintFonts(gC._gui)end
end
function gm.SetAccent(gC,gD)fl:SetAccent(gD)end
function gm.SetScale(gC,gD)
fQ=math.clamp(tonumber(gD)or 1,0.7,1.25)
fR.Scale=baseScale()
end
function gm.SetCompact(gC,gD)
gD=gD and true or false
if gD then

if not gC._preCompactSize then
pcall(function()gC._preCompactSize=fO.Size end)
end
fn(fO,fm.Med,{Size=UDim2.fromOffset(560,400)})
else
local gE=gC._preCompactSize
or(gC._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))
gC._preCompactSize=nil
fn(fO,fm.Med,{Size=gE})
end
for gE,gF in ipairs(gC._tabs)do
if gF._pl then gF._pl.Padding=gD and UDim.new(0,4)or UDim.new(0,8)end
end
end
function gm.ToggleAcrylic(gC,gD)
fl:ToggleAcrylic(gD)
fO.BackgroundTransparency=(gD and not fl._transparent)and 0.08 or 0
gh.BackgroundTransparency=(gD and not fl._transparent)and 0.15 or 0
end
function gm.ToggleTransparency(gC,gD)
fl._transparent=gD and true or false
local gE=(fl._acrylicOn and not gD)and 0.08 or(gD and 0.25 or 0)
fO.BackgroundTransparency=gE
gh.BackgroundTransparency=gD and 0.4 or((fl._acrylicOn and not gD)and 0.15 or 0)
end


function gm.SetBackdrop(gC,gD)
gD=gD and true or false
fN=gD
gC._backdrop=gD
if gD then
if gC._visible and not gC._mini then
fM.Visible=true
fn(fM,fm.Med,{BackgroundTransparency=0.5})
end
else
fn(fM,fm.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
if not fN then fM.Visible=false end
end)
end
end




local gC=Instance.new"TextButton"
gC.Name=ad.GetStealthName()
gC.Text=""gC.AutoButtonColor=false
gC.Size=UDim2.fromScale(1,1)
gC.BackgroundColor3=Color3.fromRGB(0,0,0)
gC.BackgroundTransparency=1 gC.BorderSizePixel=0
gC.Visible=false gC.Parent=gf
fr(gC,10)
local function slideCloseAll()
if gm._inboxPanel and gm._inboxPanel.open then gm:ToggleInbox(false)end
if gm._kbPanel and gm._kbPanel.open then gm:ToggleKeybindList(false)end
end
gC.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(gD)
if gD then
fk.open(slideCloseAll)
gC.Visible=true
fn(gC,fm.Med,{BackgroundTransparency=0.5})
else
fk.close(slideCloseAll)
fn(gC,fm.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local gE=gm._inboxPanel and gm._inboxPanel.open
local gF=gm._kbPanel and gm._kbPanel.open
if not gE and not gF then gC.Visible=false end
end)
end
end


function gm.ToggleInbox(gD,gE)
local gF=gD._inboxPanel
if not gF then
local gG=Instance.new"Frame"gG.AnchorPoint=Vector2.new(1,0)
gG.Position=UDim2.new(1,12,0,0)gG.Size=UDim2.new(0,230,1,0)
gG.BackgroundColor3=fI.Bg gG.BorderSizePixel=0
fr(gG,10)gG.Parent=gf gG.Visible=false
ft(gG,true)
fl:_tag(gG,"BackgroundColor3","Bg")
local gH=Instance.new"TextLabel"gH.BackgroundTransparency=1
gH.Position=UDim2.new(0,12,0,10)gH.Size=UDim2.new(1,-70,0,18)
gH.Font=Enum.Font.GothamBold gH.TextSize=11 gH.TextXAlignment=0
gH.Text="INBOX"gH.Parent=gG
fl:_tag(gH,"TextColor3","Dim")
local gI=Instance.new"TextButton"gI.Text=""
gI.AnchorPoint=Vector2.new(1,0)gI.Position=UDim2.new(1,-10,0,10)
gI.Size=UDim2.new(0,52,0,18)gI.BackgroundColor3=fI.Surface2
gI.BorderSizePixel=0 fr(gI,6)gI.AutoButtonColor=false gI.Parent=gG
ft(gI,true)
fl:_tag(gI,"BackgroundColor3","Surface2")
local gJ=Instance.new"TextLabel"gJ.BackgroundTransparency=1
gJ.Size=UDim2.fromScale(1,1)gJ.Font=Enum.Font.GothamBold
gJ.TextSize=10 gJ.Text="CLEAR"gJ.Parent=gI
fl:_tag(gJ,"TextColor3","Dim")
local gK=Instance.new"ScrollingFrame"
gK.Position=UDim2.new(0,8,0,34)gK.Size=UDim2.new(1,-16,1,-42)
gK.BackgroundTransparency=1 gK.BorderSizePixel=0
gK.ScrollBarThickness=2 gK.CanvasSize=UDim2.new(0,0,0,0)
gK.AutomaticCanvasSize=Enum.AutomaticSize.Y gK.Parent=gG
fl:_tag(gK,"ScrollBarImageColor3","Surface2")
local gL=Instance.new"UIListLayout"gL.Padding=UDim.new(0,4)
gL.SortOrder=Enum.SortOrder.LayoutOrder gL.Parent=gK
gF={panel=gG,list=gK,open=false}
gD._inboxPanel=gF
local function refresh()
for gM,gN in ipairs(gK:GetChildren())do


if gN:IsA"Frame"or gN:IsA"TextLabel"then pcall(function()gN:Destroy()end)end
end
if#fl._inbox==0 then
local gM=Instance.new"TextLabel"gM.BackgroundTransparency=1
gM.Size=UDim2.new(1,0,0,24)gM.Font=Enum.Font.Gotham
gM.TextSize=11 gM.Text="All caught up."gM.Parent=gK
fl:_tag(gM,"TextColor3","Dim")
return
end
for gM,gN in ipairs(fl._inbox)do
local gO=Instance.new"Frame"
gO.Size=UDim2.new(1,-2,0,44)gO.BackgroundColor3=fI.Surface2
gO.BackgroundTransparency=0.35 gO.BorderSizePixel=0
fr(gO,7)gO.Parent=gK
fl:_tag(gO,"BackgroundColor3","Surface2")
local gP=Instance.new"TextLabel"gP.BackgroundTransparency=1
gP.Position=UDim2.new(0,8,0,4)gP.Size=UDim2.new(1,-52,0,15)
gP.Font=Enum.Font.GothamBold gP.TextSize=11 gP.TextXAlignment=0
gP.TextTruncate=Enum.TextTruncate.AtEnd gP.Text=gN.Title gP.Parent=gO
fl:_tag(gP,"TextColor3","Text")
local gQ=Instance.new"TextLabel"gQ.BackgroundTransparency=1
gQ.Position=UDim2.new(0,8,0,20)gQ.Size=UDim2.new(1,-52,0,18)
gQ.Font=Enum.Font.Gotham gQ.TextSize=11 gQ.TextXAlignment=0
gQ.TextTruncate=Enum.TextTruncate.AtEnd gQ.Text=gN.Content gQ.Parent=gO
fl:_tag(gQ,"TextColor3","Dim")
local gR=Instance.new"TextLabel"gR.BackgroundTransparency=1
gR.AnchorPoint=Vector2.new(1,0)gR.Position=UDim2.new(1,-8,0,4)
gR.Size=UDim2.new(0,40,0,14)gR.Font=Enum.Font.Code
gR.TextSize=10 gR.TextXAlignment=1 gR.Text=gN.At gR.Parent=gO
fl:_tag(gR,"TextColor3","Dim")
end
end
gF.refresh=refresh
gI.MouseButton1Click:Connect(function()
fl._inbox={}
refresh()
pcall(function()ge.Visible=false end)
end)
end
local gG=(gE~=nil)and gE or(not gF.open)
gF.open=gG
if gG then
if gD._kbPanel and gD._kbPanel.open then gD:ToggleKeybindList(false)end
slideShadeSet(true)
gF.refresh()
gF.panel.Visible=true
pcall(function()ge.Visible=false end)
flyTo(gF.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(gF.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not gF.open then gF.panel.Visible=false end
end)
slideShadeSet(gD._kbPanel~=nil and gD._kbPanel.open==true)
end
end


function gm.ToggleKeybindList(gD,gE)
local gF=gD._kbPanel
if not gF then
local gG=Instance.new"Frame"gG.AnchorPoint=Vector2.new(1,0)
gG.Position=UDim2.new(1,12,0,0)gG.Size=UDim2.new(0,210,1,0)
gG.BackgroundColor3=fI.Bg gG.BorderSizePixel=0
fr(gG,10)gG.Parent=gf gG.Visible=false
ft(gG,true)
fl:_tag(gG,"BackgroundColor3","Bg")
local gH=Instance.new"TextLabel"gH.BackgroundTransparency=1
gH.Position=UDim2.new(0,12,0,10)gH.Size=UDim2.new(1,-24,0,18)
gH.Font=Enum.Font.GothamBold gH.TextSize=11 gH.TextXAlignment=0
gH.Text="KEYBINDS"gH.Parent=gG
fl:_tag(gH,"TextColor3","Dim")
local gI=Instance.new"ScrollingFrame"
gI.Position=UDim2.new(0,8,0,34)gI.Size=UDim2.new(1,-16,1,-42)
gI.BackgroundTransparency=1 gI.BorderSizePixel=0
gI.ScrollBarThickness=2 gI.CanvasSize=UDim2.new(0,0,0,0)
gI.AutomaticCanvasSize=Enum.AutomaticSize.Y gI.Parent=gG
fl:_tag(gI,"ScrollBarImageColor3","Surface2")
local gJ=Instance.new"UIListLayout"gJ.Padding=UDim.new(0,4)
gJ.SortOrder=Enum.SortOrder.LayoutOrder gJ.Parent=gI
gF={panel=gG,list=gI,open=false}
gD._kbPanel=gF
local function refresh()
for gK,gL in ipairs(gI:GetChildren())do
if gL:IsA"TextButton"then pcall(function()gL:Destroy()end)end
end
if#gD._keybinds==0 then
local gK=Instance.new"TextLabel"gK.BackgroundTransparency=1
gK.Size=UDim2.new(1,0,0,24)gK.Font=Enum.Font.Gotham
gK.TextSize=11 gK.Text="No keybinds yet"gK.Parent=gI
fl:_tag(gK,"TextColor3","Dim")
return
end
for gK,gL in ipairs(gD._keybinds)do
local gM=Instance.new"TextButton"gM.Text=""
gM.Size=UDim2.new(1,-2,0,30)gM.BackgroundColor3=fI.Surface2
gM.BackgroundTransparency=0.35 gM.BorderSizePixel=0
fr(gM,7)gM.Parent=gI
fl:_tag(gM,"BackgroundColor3","Surface2")
local gN=Instance.new"TextLabel"gN.BackgroundTransparency=1
gN.Position=UDim2.new(0,8,0,0)gN.Size=UDim2.new(1,-70,1,0)
gN.Font=Enum.Font.Gotham gN.TextSize=11 gN.TextXAlignment=0
gN.TextTruncate=Enum.TextTruncate.AtEnd gN.Text=gL.Title gN.Parent=gM
fl:_tag(gN,"TextColor3","Text")
local gO=Instance.new"TextLabel"gO.BackgroundTransparency=1
gO.AnchorPoint=Vector2.new(1,0)gO.Position=UDim2.new(1,-8,0,0)
gO.Size=UDim2.new(0,56,1,0)gO.Font=Enum.Font.Code
gO.TextSize=10 gO.TextXAlignment=1 gO.Text=gL.GetName()gO.Parent=gM
fl:_tag(gO,"TextColor3","Dim")
gM.MouseButton1Click:Connect(function()
fl:_sfx"Click"gL.Rebind()
task.delay(0.2,function()pcall(function()gO.Text=gL.GetName()end)end)
end)
end
end
gF.refresh=refresh
gD._kbPanelRefresh=refresh
end
local gG=(gE~=nil)and gE or(not gF.open)
gF.open=gG
if gG then
if gD._inboxPanel and gD._inboxPanel.open then gD:ToggleInbox(false)end
slideShadeSet(true)
gF.refresh()
gF.panel.Visible=true
flyTo(gF.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(gF.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not gF.open then gF.panel.Visible=false end
end)
slideShadeSet(gD._inboxPanel~=nil and gD._inboxPanel.open==true)
end
end


function gm.Onboarding(gD,gE)
gE=gE or{}
local gF=gE.Steps or gE.Pages or{{Title="Welcome",Content="This is Kronos."}}
local gG=1
local gH=Instance.new"TextButton"gH.Text=""gH.AutoButtonColor=false
gH.Size=UDim2.fromScale(1,1)gH.BackgroundColor3=Color3.fromRGB(0,0,0)
gH.BackgroundTransparency=1 gH.ZIndex=180 gH.Parent=fK
fn(gH,fm.Med,{BackgroundTransparency=0.6})
local gI=Instance.new"CanvasGroup"gI.AnchorPoint=Vector2.new(0.5,0.5)
gI.Position=UDim2.new(0.5,0,0.5,0)gI.Size=UDim2.fromOffset(340,220)
gI.BackgroundColor3=fI.Surface gI.BorderSizePixel=0 gI.GroupTransparency=1
fr(gI,12)gI.Parent=gH
ft(gI,true)
fv(gI,12)
fx(gI,0.5,40)
fl:_tag(gI,"BackgroundColor3","Surface")
local gJ=Instance.new"UIScale"gJ.Scale=0.94 gJ.Parent=gI
fn(gI,fm.Med,{GroupTransparency=0})
fn(gJ,fm.Spring,{Scale=1})
local gK=Instance.new"TextLabel"gK.BackgroundTransparency=1
gK.Position=UDim2.new(0,20,0,18)gK.Size=UDim2.new(1,-40,0,24)
gK.Font=Enum.Font.GothamBold gK.TextSize=17 gK.TextXAlignment=0 gK.Parent=gI
fl:_tag(gK,"TextColor3","Text")
local gL=Instance.new"TextLabel"gL.BackgroundTransparency=1
gL.Position=UDim2.new(0,20,0,48)gL.Size=UDim2.new(1,-40,0,90)
gL.Font=Enum.Font.Gotham gL.TextSize=13 gK.TextXAlignment=0
gL.TextXAlignment=0 gL.TextYAlignment=0 gL.TextWrapped=true gL.Parent=gI
fl:_tag(gL,"TextColor3","Dim")
local gM=Instance.new"Frame"gM.BackgroundTransparency=1
gM.AnchorPoint=Vector2.new(0,1)gM.Position=UDim2.new(0,20,1,-52)
gM.Size=UDim2.new(0,120,0,10)gM.Parent=gI
local gN=Instance.new"UIListLayout"gN.FillDirection=Enum.FillDirection.Horizontal
gN.Padding=UDim.new(0,6)gN.Parent=gM
local gO={}
for gP=1,#gF do
local gQ=Instance.new"Frame"gQ.Size=UDim2.fromOffset(8,8)
gQ.BorderSizePixel=0 fr(gQ,99)gQ.Parent=gM
fl:_tag(gQ,"BackgroundColor3","Surface2")
gO[gP]=gQ
end
local gP,gQ,gR
local function paint()
gK.Text,gL.Text=gF[gG].Title or"",gF[gG].Content or""
for gS,gT in ipairs(gO)do
if gS==gG then fl:_tag(gT,"BackgroundColor3","Accent")
else fl:_tag(gT,"BackgroundColor3","Surface2")end
end
gP.Visible=gG>1
gR.Text=(gG==#gF)and"FINISH"or"NEXT"
gK.Position=UDim2.new(0,26,0,18)
fn(gK,fm.Fast,{Position=UDim2.new(0,20,0,18)})
end
local gS=Instance.new"Frame"gS.BackgroundTransparency=1
gS.AnchorPoint=Vector2.new(0,1)gS.Position=UDim2.new(0,0,1,-12)
gS.Size=UDim2.new(1,0,0,34)gS.Parent=gI
local gT=Instance.new"UIListLayout"gT.FillDirection=Enum.FillDirection.Horizontal
gT.HorizontalAlignment=Enum.HorizontalAlignment.Right gT.Padding=UDim.new(0,8)gT.Parent=gS
fu(gS,0,0,12,12)
gP=Instance.new"TextButton"gP.Text=""
gP.Size=UDim2.new(0,80,0,30)gP.BackgroundTransparency=1 gP.Parent=gS
local gU=Instance.new"TextLabel"gU.BackgroundTransparency=1
gU.Size=UDim2.fromScale(1,1)gU.Font=Enum.Font.GothamBold
gU.TextSize=12 gU.Text="BACK"gU.Parent=gP
fl:_tag(gU,"TextColor3","Dim")
local gV=Instance.new"TextButton"gV.Text=""
gV.Size=UDim2.new(0,80,0,30)gV.BackgroundTransparency=1 gV.Parent=gS
local gW=Instance.new"TextLabel"gW.BackgroundTransparency=1
gW.Size=UDim2.fromScale(1,1)gW.Font=Enum.Font.Gotham
gW.TextSize=12 gW.Text="Skip"gW.Parent=gV
fl:_tag(gW,"TextColor3","Dim")
gQ=Instance.new"TextButton"gQ.Text=""
gQ.Size=UDim2.new(0,96,0,30)gQ.BorderSizePixel=0
fr(gQ,7)gQ.AutoButtonColor=false gQ.Parent=gS
fl:agrad(gQ,15)
gR=Instance.new"TextLabel"gR.BackgroundTransparency=1
gR.Size=UDim2.fromScale(1,1)gR.Font=Enum.Font.GothamBold
gR.TextSize=12
gR.Text="NEXT"gR.Parent=gQ
fl:oa(gR)
local function close()
fadeModal(gI,gH)
fo(gE.OnFinish)
end
gP.MouseButton1Click:Connect(function()
fl:_sfx"Click"gG=math.max(1,gG-1)paint()
end)
gV.MouseButton1Click:Connect(function()close()end)
gQ.MouseButton1Click:Connect(function()
fl:_sfx"Click"
if gG>=#gF then close()else gG+=1 paint()end
end)
paint()
end



function gm.Tab(gD,gE)
return e9({
Window=gm,opts=fD,Th=fI,pgui=fL,
pages=gl,nav=gi,pill=gk,subLbl=fZ,
},gE)
end


function gm.EspPreview(gD,gE)
return fe({Window=gm,Th=fI,main=fO,gui=fK},gE)
end

function gm.AddCloudPanel(gD,gE)
return fi(gD,gE)
end

function gm.AddChatPanel(gD,gE)
return fj(gD,gE)
end

function gm.SaveConfig(gD,gE)
e8.Save(gD,gE)
end
function gm.LoadConfig(gD,gE)
e8.Load(gD,gE)
end


gm._focusIdx=1
local gD




local function focusables()
local gE=gm._active
if not gE then return{}end
local gF={}
for gG,gH in ipairs(gE.Elements)do
if gH.Frame and gH.Frame.Visible and gH.Frame.Parent then
local gI,gJ=pcall(function()return gH.Frame.AbsoluteSize.Y>4 end)
if gI and gJ then table.insert(gF,gH)end
end
end
return gF
end
function gm.FocusMove(gE,gF)
if not gE._visible then return end
if gE._palette and gE._palette.open then return end
local gG=focusables()
if#gG==0 then return end
gE._focusIdx=((gE._focusIdx-1+gF)%#gG)+1
local gH=gG[gE._focusIdx]
if not gH or not gH.Frame then return end
if not gD then
gD=Instance.new"UIStroke"gD.Thickness=1.5
gD.Transparency=0.15
fl:_tag(gD,"Color","Accent")
end
pcall(function()
gD.Parent=gH.Frame
local gI=gE._active and gE._active.Page
if gI then
local gJ=gH.Frame.AbsolutePosition.Y
local gK=gI.AbsolutePosition.Y
gI.CanvasPosition=Vector2.new(0,math.max(0,gI.CanvasPosition.Y+(gJ-gK)-120))
end
end)
fl:_sfx"Hover"
end
function gm.FocusActivate(gE)
if not gE._visible then return end
local gF=focusables()
local gG=gF[gE._focusIdx]
if not gG then return end
gE:_flash(gG.Frame)
if gG._go then pcall(gG._go)end
end


gm._clean=gm._clean or{on=false,idle=6,last=os.clock(),faded=false,edge=nil}
function gm.SetCleanScreen(gE,gF,gG)
gF=gF and true or false
gE._clean.on=gF
if gG then gE._clean.idle=math.clamp(tonumber(gG)or 6,2,60)end
gE._clean.last=os.clock()
if not gF and gE._clean.faded then gE:_cleanRestore()end
if gF then gE:_cleanTouch()end
end
function gm._cleanTouch(gE)gE._clean.last=os.clock()end
function gm._cleanFade(gE)
if gE._clean.faded or not gE._visible or gE._mini then return end
gE._clean.faded=true
fn(fO,fm.Med,{GroupTransparency=0.88})
dimTo(1,fm.Med)
if not gE._clean.edge then
local gF=Instance.new"TextButton"
gF.Name=ad.GetStealthName()
gF.Text=""gF.AnchorPoint=Vector2.new(0,0.5)gF.Position=UDim2.new(0,0,0.5,0)
gF.Size=UDim2.fromOffset(6,120)gF.BackgroundColor3=fI.Accent
gF.BackgroundTransparency=0.35 gF.BorderSizePixel=0 gF.ZIndex=200
fr(gF,99)gF.Parent=fK
fl:_tag(gF,"BackgroundColor3","Accent")
gF.MouseEnter:Connect(function()gE:_cleanRestore()end)
gF.InputBegan:Connect(function(gG)
if gG.UserInputType==Enum.UserInputType.Touch then gE:_cleanRestore()end
end)
gE._clean.edge=gF
else
gE._clean.edge.Visible=true
end
end
function gm._cleanRestore(gE)
if not gE._clean.faded then gE._clean.last=os.clock()return end
gE._clean.faded=false
gE._clean.last=os.clock()
if not gE._visible or gE._mini then return end
fn(fO,fm.Med,{GroupTransparency=0})
dimTo(0.5,fm.Med)
if gE._clean.edge then gE._clean.edge.Visible=false end
fl:_sfx"Hover"
end
gm:Track(fA.InputChanged:Connect(function(gE)
if gE.UserInputType~=Enum.UserInputType.MouseMovement
and gE.UserInputType~=Enum.UserInputType.Touch then return end
if gm._clean.on and gm._clean.faded then
local gF=gE.Position
local gG,gH=pcall(function()
local gG,gH=fO.AbsolutePosition,fO.AbsoluteSize
return gF.X>=gG.X-30 and gF.X<=gG.X+gH.X+30
and gF.Y>=gG.Y-30 and gF.Y<=gG.Y+gH.Y+30
end)
if gF.X<=24 then gm:_cleanRestore()return end
if gG and gH then gm:_cleanRestore()return end
end
gm:_cleanTouch()
end))
gm:Track(fA.InputBegan:Connect(function(gE)
if gE.UserInputType==Enum.UserInputType.MouseButton1
or gE.UserInputType==Enum.UserInputType.Touch then
if gm._clean.on and gm._clean.faded then gm:_cleanRestore()else gm:_cleanTouch()end
end
end))
task.spawn(function()
while fK.Parent do
task.wait(0.5)
pcall(function()
if gm._clean.on and not gm._clean.faded and gm._visible and not gm._mini then
if os.clock()-gm._clean.last>gm._clean.idle then
gm:_cleanFade()
end
end
end)
end
end)


function gm.SetPerformance(gE,gF)
gF=gF and true or false
fl._perfLow=gF
if gF then fl:SetAcrylic(false)end
pcall(function()
for gG,gH in ipairs(fO:GetDescendants())do
if gH.Name=="_light"or gH.Name=="_toplight"then gH.Visible=not gF end
if gH:IsA"UIShadow"then gH.Enabled=not gF end
end
end)
if not gF and gE._acrylicPref then fl:SetAcrylic(true,fD.Blur or 16)end
end


function gm.ExportString(gE)
return e8.Export(gE)
end
function gm.ImportString(gE,gF)
return e8.Import(gE,gF)
end
function gm.AutoSave(gE,gF,gG,gH)
e8.AutoSave(gE,gF,gG,gH)
end

function gm.SetBadge(gE,gF,gG)
if not gF or not(gF.Btn or gF.Button)then return end
local gH=gF.Btn or gF.Button
local gI=gH:FindFirstChild"_badge"
if not gG or gG==""or gG==0 then
if gI then pcall(function()gI:Destroy()end)end
return
end
if not gI then
gI=Instance.new"Frame"gI.Name="_badge"
gI.AnchorPoint=Vector2.new(1,0.5)gI.Position=UDim2.new(1,-8,0.5,0)
gI.Size=UDim2.new(0,20,0,16)gI.BackgroundColor3=Color3.fromRGB(248,113,113)
gI.BorderSizePixel=0 fr(gI,99)gI.Parent=gH gI.ZIndex=4
local gJ=Instance.new"TextLabel"gJ.Name="_l"gJ.BackgroundTransparency=1
gJ.Size=UDim2.fromScale(1,1)gJ.Font=Enum.Font.GothamBold
gJ.TextSize=10 gJ.TextColor3=Color3.fromRGB(255,255,255)gJ.Parent=gI
end
pcall(function()
local gJ=gI:FindFirstChild"_l"
gJ.Text=tostring(gG)
gI.Size=UDim2.new(0,math.clamp(10+string.len(tostring(gG))*7,20,64),0,16)
end)
end

function gm.Debug(gE)
local gF={}
local function log(gG)table.insert(gF,tostring(gG))end
log("version="..tostring(fl.Version).." visible="..tostring(gE._visible))
local gG=(fl._gui and fl._gui.Parent)and 1 or 0
log("hubs="..tostring(gG))
local function box(gH,gI)
local gJ,gK=pcall(function()
return gI.." class="..gH.ClassName
.." clip="..tostring(gH.ClipsDescendants)
.." pos="..tostring(gH.AbsolutePosition)
.." size="..tostring(gH.AbsoluteSize)
end)
log(gJ and gK or(gI.." ERR"))
end
box(gE._main,"main")
box(gE._body,"body")
box(gE._pages,"pages")
for gH,gI in ipairs(gE._tabs)do
local gJ=gI.Page
local gK,gL=pcall(function()
return"page["..gI.Title.."] vis="..tostring(gJ.Visible)
.." clip="..tostring(gJ.ClipsDescendants)
.." vp="..tostring(gJ.AbsoluteSize)
.." canvas="..tostring(gJ.AbsoluteCanvasSize)
.." canvPos="..tostring(gJ.CanvasPosition)
.." scroll="..tostring(gJ.ScrollingEnabled)
end)
log(gK and gL or("page["..tostring(gI.Title).."] ERR"))
pcall(function()
local gM,gN=gJ.AbsolutePosition.Y,gJ.AbsoluteSize.Y
local gO,gP=0,0
for gQ,gR in ipairs(gI.Elements)do
if gR.Frame and gR.Frame.Visible then
gP=gP+1
local gS,gT=gR.Frame.AbsolutePosition.Y,gR.Frame.AbsoluteSize.Y
if gS+gT<gM or gS>gM+gN then gO=gO+1 end
end
end
log("  rows="..gP.." outsideViewport="..gO)
end)
end
log"done"
return table.concat(gF,"\n")
end

function gm.Destroy(gE)
if gE._destroyed then return end
gE._destroyed=true
local gF=gE._onCloseCb
gE._onCloseCb=nil
if type(gF)=="function"then task.spawn(function()pcall(gF)end)end
for gG,gH in ipairs(gE._conns)do pcall(function()gH:Disconnect()end)end
gE._conns={}
for gG,gH in pairs(fl.Sound._cache)do pcall(function()gH:Stop()gH:Destroy()end)end
fl.Sound._cache={}
fl:SetAcrylic(false)
if fl._gui==fK then fl._gui=nil end
pcall(function()gp:Destroy()end)
pcall(function()fK:Destroy()end)
pcall(function()fL:Destroy()end)
end

ad.registerUnload(function()
pcall(function()gm:Destroy()end)
end)
e7.paintFonts(fK)
aa._lastWindow=gm
return gm
end end function a.ae():typeof(__modImpl())local aa=a.cache.ae if not aa then aa={c=__modImpl()}a.cache.ae=aa end return aa.c end end end





local aa=a.a()
local ab=a.b()a.c()a.e()


local ac=a.f()
local ad=a.g()
local af=a.h()
local e7=a.i()
local e8=a.j()
local e9=a.k()
local fe=a.l()
local fi=a.ae()

ab.claimUnload()

local fj=aa
fj.Themes=e7.Themes
fj.Icons=ac.Icons
fj.IconAlias=ac.IconAlias

fj._tag=function(fk,fl,fm,fn)
return e7.tag(fl,fm,fn)
end
fj.agrad=function(fk,fl,fm)
return e7.agrad(fl,fm)
end
fj.oa=function(fk,fl)
return e7.oa(fl)
end
fj.SetTheme=function(fk,fl)
return e7.SetTheme(fl)
end
fj.SetAccent=function(fk,fl)
return e7.SetAccent(fl)
end
fj.SetAcrylic=function(fk,fl,fm)
return e8.SetAcrylic(fl,fm)
end
fj.ToggleAcrylic=function(fk,fl)
return e8.ToggleAcrylic(fl)
end
fj._sfx=function(fk,fl)
return ad.sfx(fl)
end
fj.SetFontPack=function(fk,fl)
return af.SetFontPack(fl)
end
fj.RefreshFonts=function(fk)
return af.RefreshFonts()
end
fj._paintFonts=function(fk,fl)
return af.paintFonts(fl)
end
fj.SetMotion=function(fk,fl)
aa.ReducedMotion=not(fl and true or false)
end
fj.SetSharp=function(fk,fl)
return e7.SetSharp(fl)
end
fj.Debug=function(fk)
local fl=aa._lastWindow
if fl and fl.Debug then
local fm,fn=pcall(function()return fl:Debug()end)
if fm and fn then print(fn)return fn end
end
return nil
end
fj.CloudService=function(fk,fl)
return e9.create(fl)
end
fj.CreateAIAssistant=function(fk,fl)
return fe.create(fl)
end

fj.CreateWindow=fi




return fj
