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
_Windows={},
ThemeName="Kronos",
Theme=nil,
FontPack="Gotham+",
}




function b.ListUIElements(c)
local d={}
local e={}
for f,g in ipairs(b._Windows)do
for h,i in ipairs(g._tabs or{})do
for j,k in ipairs(i.Elements or{})do
if k.Flag~=nil and k.Flag~=""and not e[k.Flag]then
e[k.Flag]=true
table.insert(d,{
Flag=k.Flag,
Kind=k.Kind,
Label=k.Title,
Value=b.Flags[k.Flag],
})
end
end
end
end
table.sort(d,function(f,g)return f.Flag<g.Flag end)
return d
end

function b.SetUIElementValue(c,d,e,f)
local g=b._live[d]
if not g or#g==0 then
return false,"Unknown UI element: "..tostring(d)
end
local h,i=pcall(function()
for h,i in ipairs(g)do i(e,f~=false)end
b.Flags[d]=e
end)
if not h then return false,tostring(i)end
return true
end

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


local function Tween(e,f,g,h,i)
if c.ReducedMotion then
pcall(function()
for j,k in pairs(f)do e[j]=k end
end)
return nil
end
local j=b:Create(
e,
TweenInfo.new(
math.max(g or 0.25,0),
h or Enum.EasingStyle.Quint,
i or Enum.EasingDirection.Out
),
f
)
j:Play()
return j
end

return{T=d,tween=tween,Tween=Tween}end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()



local b=a.b()

local c=b.cloneref_check(game:GetService"UserInputService")

local d={
Glass=0,
Window=1,
Content=2,
Backdrop=390,
Popup=400,
PopupTop=410,
Toast=600,
Modal=800,
ModalTop=810,
}

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
j.CornerRadius=UDim.new(0,i or 16)
pcall(function()j:SetAttribute("KRadius",i or 16)end)
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
d(k,TweenInfo.new(0.25,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{Size=UDim2.fromOffset(l,l),BackgroundTransparency=1})
task.delay(0.3,function()pcall(function()k:Destroy()end)end)
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
local l
local function spTo(m)
if l then pcall(function()l:Cancel()end)end
l=d(j,e.Hover,{BackgroundTransparency=m})
end
h.MouseEnter:Connect(function()
spTo(0.55)
end)
h.MouseLeave:Connect(function()
spTo(1)
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
local w={}
local function paint(x)
local y=x or u
for z,A in ipairs(t)do
local B=z<=y
A.Image=B and j or i
if w[z]then pcall(function()w[z]:Cancel()end)end
w[z]=d(A,e.Hover,{ImageColor3=B and o or k})
end
end
function v.Get()return u end
function v.Set(x)
u=math.clamp(math.round(tonumber(x)or 0),0,n)
paint()
end
function v.Nudge()
for x,y in ipairs(t)do
if w[y]then pcall(function()w[y]:Cancel()end)end
w[y]=d(y,TweenInfo.new(0.06,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation=8})
end
task.delay(0.06,function()
for x,y in ipairs(t)do
if w[y]then pcall(function()w[y]:Cancel()end)end
w[y]=d(y,TweenInfo.new(0.12,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation=0})
end
end)
end
for x=1,n do
local y=Instance.new"ImageButton"
y.Name="Star"..x
y.BackgroundTransparency=1
y.AutoButtonColor=false
y.Image=i
y.ImageColor3=k
y.Size=UDim2.fromOffset(p,p)
y.LayoutOrder=x
y.Parent=r
y.MouseEnter:Connect(function()paint(x)end)
y.MouseLeave:Connect(function()paint()end)
y.MouseButton1Click:Connect(function()
u=x
paint()
end)
t[x]=y
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


local function stroke(l,m,n,o)
local p=Instance.new"UIStroke"
p.Color=m or Color3.new(1,1,1)
p.Thickness=n or 1
p.Transparency=o or 0.9
p.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
p.Parent=l
return p
end

local function baseCard(l,m)
local n=Instance.new"Frame"
n.BackgroundColor3=Color3.new(1,1,1)
n.BackgroundTransparency=0.96
n.BorderSizePixel=0
n.Size=UDim2.new(1,0,0,m or 44)
n.ZIndex=2
n.Parent=l
corner(n,8)
stroke(n,Color3.new(1,1,1),1,0.95)
return n
end

return{
guid=guid,
spawnCb=spawnCb,
corner=corner,
stroke=stroke,
baseCard=baseCard,
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
local c=a.b()

local d={
Material="https://raw.githubusercontent.com/KiroBytez/Kronos/main/Assets/icons/MaterialIcons.luau",
Lucide="https://raw.githubusercontent.com/KiroBytez/Kronos/main/Assets/icons/LucideIcons.luau",
Phosphor="https://raw.githubusercontent.com/KiroBytez/Kronos/main/Assets/icons/Phosphor.luau",
["Phosphor-Filled"]="https://raw.githubusercontent.com/KiroBytez/Kronos/main/Assets/icons/Phosphor%20Filled.luau",
SF="https://raw.githubusercontent.com/KiroBytez/Kronos/main/Assets/icons/SFSymbols.luau",
}

local function reqFn()
return c.hasFn"syn"and c.hasFn"syn".request
or c.hasFn"http_request"
or c.hasFn"request"
end

local function fetchText(e)
local f=reqFn()
if f then
local g,h=pcall(f,{Url=e,Method="GET"})
if g and h and type(h)=="table"and type(h.Body)=="string"and#h.Body>0 then
return h.Body
end
end
local g,h=pcall(function()return game:HttpGet(e)end)
if g and type(h)=="string"and#h>0 then
return h
end
return nil
end

local e={}
local f={}
local g={}

local h

local function LoadIconSource(i)
if e[i]~=nil then
return e[i]or nil
end

if f[i]then
local j=os.clock()
while f[i]and os.clock()-j<10 do
task.wait()
end
return e[i]or nil
end

local j=d[i]
if not j then
e[i]=false
return nil
end

f[i]=true
local k,l=pcall(function()
return loadstring(fetchText(j))()
end)
f[i]=nil

if k and type(l)=="table"then
e[i]=l
if h then task.spawn(h)end
return l
end

e[i]=false
return nil
end

local function GetIcon(i,j)
j=j or"Lucide"
if type(j)=="string"then
for k,l in pairs(d)do
if string.lower(k)==string.lower(j)then j=k break end
end
end
local k=LoadIconSource(j)
local l=k and k[i]
if not l then return""end
return"rbxassetid://"..tostring(l)
end

local function PreloadIcons(i)
for j,k in ipairs(i or{"Lucide"})do
task.spawn(LoadIconSource,k)
end
return true
end

local i={
main="dashboard",combat="swords",visuals="eye",esp="eye",
aim="crosshair",aimbot="crosshair",movement="move",player="user",
world="globe",misc="box",config="save",profiles="save",
themes="paintbrush",theme="paintbrush",console="terminal",log="terminal",
keybinds="keyboard",premium="crown",home="house",settings="settings",
performance="gauge",notifications="bell",

chevron="chevron-down",sliders="sliders-horizontal",
dashboard="layout-dashboard",bellring="bell-ring",
eyeoff="eye-off",settings2="settings-2",unlock="lock-open",
volumex="volume-x",shieldcheck="shield-check",
}

local function defaultColor()
if b.Theme and b.Theme.Dim then return b.Theme.Dim end
return Color3.fromRGB(142,150,171)
end

local function resolveAlias(j)
for k=1,4 do
local l=i[j]
if not l or l==j then break end
j=l
end
return j
end

local function ResolveIcon(j)
if j==nil or j==""then return""end
if type(j)~="string"then return j end
if j:match"^%a[%w%+%-%.]*://"then return j end
if j:match"^%d+$"then return"rbxassetid://"..j end
local k,l=j:match"^(%a[%w%-]*):(.+)$"
if k and l then
return GetIcon(resolveAlias(string.lower(l)),k)
end
return GetIcon(resolveAlias(string.lower(j)),"Lucide")
end

local function makeIcon(j,k,l)
local m=ResolveIcon(j)
l=l or defaultColor()
local n=Instance.new"ImageLabel"
n.BackgroundTransparency=1
n.Size=UDim2.fromOffset(k,k)
n.Image=(m and m~="")and m or""
n.ImageColor3=l
n.ScaleType=Enum.ScaleType.Fit
if not m or m==""then

local o=Instance.new"TextLabel"
o.Name="_letter"
o.BackgroundTransparency=1
o.Size=UDim2.fromScale(1,1)
o.Font=Enum.Font.GothamBold
o.TextSize=math.clamp(k-2,10,16)
o.TextColor3=l
o.Text=string.upper(string.sub(j or"?",1,1))
o.Parent=n
table.insert(g,{img=n,name=j})
end
return n
end

h=function()
for j=#g,1,-1 do
local k=g[j]
if not k.img or not k.img.Parent then
table.remove(g,j)
else
local l=ResolveIcon(k.name)
if l and l~=""then
pcall(function()
k.img.Image=l
local m=k.img:FindFirstChild"_letter"
if m then m:Destroy()end
end)
table.remove(g,j)
end
end
end
end

return{
GetIcon=GetIcon,
LoadIconSource=LoadIconSource,
PreloadIcons=PreloadIcons,
IconAlias=i,
makeIcon=makeIcon,
resolveIcon=ResolveIcon,

Icons=setmetatable({},{__index=function(j,k)
local l=LoadIconSource"Lucide"
return l and l[k]or nil
end}),
}end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()


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


f.TextSize=math.clamp((h+i)*(b._textScale or 1),8,30)
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


local c,d
pcall(function()
c=Font.fromEnum(Enum.Font.GothamSemibold)
d=Font.fromEnum(Enum.Font.Gotham)
end)

return{
FontPacks=b.FontPacks,
FontSemi=c,
FontReg=d,
resolveFont=resolveFont,
paintFonts=paintFonts,
SetFontPack=SetFontPack,
RefreshFonts=RefreshFonts,
}end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(3,4,8),
Surface=Color3.fromRGB(8,11,18),
Surface2=Color3.fromRGB(17,22,35),
Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(120,130,150),
Accent=Color3.fromRGB(91,140,255),
Accent2=Color3.fromRGB(142,91,255),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(14,8,12),
Surface=Color3.fromRGB(24,14,20),
Surface2=Color3.fromRGB(36,22,30),
Text=Color3.fromRGB(250,240,244),
Dim=Color3.fromRGB(160,130,145),
Accent=Color3.fromRGB(251,113,160),
Accent2=Color3.fromRGB(244,63,94),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(8,10,20),
Surface=Color3.fromRGB(14,16,32),
Surface2=Color3.fromRGB(22,26,48),
Text=Color3.fromRGB(238,240,252),
Dim=Color3.fromRGB(135,142,175),
Accent=Color3.fromRGB(129,140,248),
Accent2=Color3.fromRGB(167,139,250),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(6,12,9),
Surface=Color3.fromRGB(12,20,15),
Surface2=Color3.fromRGB(20,32,24),
Text=Color3.fromRGB(238,246,240),
Dim=Color3.fromRGB(125,150,135),
Accent=Color3.fromRGB(52,211,153),
Accent2=Color3.fromRGB(110,231,183),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(13,10,6),
Surface=Color3.fromRGB(22,17,10),
Surface2=Color3.fromRGB(34,27,16),
Text=Color3.fromRGB(250,244,232),
Dim=Color3.fromRGB(160,142,115),
Accent=Color3.fromRGB(251,191,36),
Accent2=Color3.fromRGB(249,115,22),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(5,11,15),
Surface=Color3.fromRGB(10,19,26),
Surface2=Color3.fromRGB(17,30,40),
Text=Color3.fromRGB(236,246,250),
Dim=Color3.fromRGB(120,150,165),
Accent=Color3.fromRGB(34,211,238),
Accent2=Color3.fromRGB(59,130,246),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.n():typeof(__modImpl())local b=a.cache.n if not b then b={c=__modImpl()}a.cache.n=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(13,6,8),
Surface=Color3.fromRGB(22,11,14),
Surface2=Color3.fromRGB(34,18,22),
Text=Color3.fromRGB(250,238,240),
Dim=Color3.fromRGB(165,128,134),
Accent=Color3.fromRGB(248,113,113),
Accent2=Color3.fromRGB(220,38,38),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.o():typeof(__modImpl())local b=a.cache.o if not b then b={c=__modImpl()}a.cache.o=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(10,10,14),
Surface=Color3.fromRGB(18,18,26),
Surface2=Color3.fromRGB(28,28,40),
Text=Color3.fromRGB(242,242,248),
Dim=Color3.fromRGB(140,140,160),
Accent=Color3.fromRGB(167,139,250),
Accent2=Color3.fromRGB(103,232,249),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.p():typeof(__modImpl())local b=a.cache.p if not b then b={c=__modImpl()}a.cache.p=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(10,8,4),
Surface=Color3.fromRGB(18,15,8),
Surface2=Color3.fromRGB(30,25,12),
Text=Color3.fromRGB(255,246,220),
Dim=Color3.fromRGB(165,150,105),
Accent=Color3.fromRGB(254,231,21),
Accent2=Color3.fromRGB(255,45,120),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.q():typeof(__modImpl())local b=a.cache.q if not b then b={c=__modImpl()}a.cache.q=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(2,6,3),
Surface=Color3.fromRGB(4,12,6),
Surface2=Color3.fromRGB(8,22,11),
Text=Color3.fromRGB(200,255,210),
Dim=Color3.fromRGB(90,140,100),
Accent=Color3.fromRGB(57,255,120),
Accent2=Color3.fromRGB(20,200,90),
Success=Color3.fromRGB(57,255,120),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.r():typeof(__modImpl())local b=a.cache.r if not b then b={c=__modImpl()}a.cache.r=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(30,31,34),
Surface=Color3.fromRGB(43,45,49),
Surface2=Color3.fromRGB(49,51,56),
Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(148,155,164),
Accent=Color3.fromRGB(88,101,242),
Accent2=Color3.fromRGB(235,69,158),
Success=Color3.fromRGB(87,242,135),
Warn=Color3.fromRGB(254,231,92),
Danger=Color3.fromRGB(237,66,69),
}end function a.s():typeof(__modImpl())local b=a.cache.s if not b then b={c=__modImpl()}a.cache.s=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(0,0,0),
Surface=Color3.fromRGB(12,12,12),
Surface2=Color3.fromRGB(26,26,26),
Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(140,140,140),
Accent=Color3.fromRGB(240,240,240),
Accent2=Color3.fromRGB(160,160,160),
Success=Color3.fromRGB(220,220,220),
Warn=Color3.fromRGB(180,180,180),
Danger=Color3.fromRGB(120,120,120),
}end function a.t():typeof(__modImpl())local b=a.cache.t if not b then b={c=__modImpl()}a.cache.t=b end return b.c end end do local function __modImpl()


return{
Bg=Color3.fromRGB(4,4,7),
Surface=Color3.fromRGB(10,10,15),
Surface2=Color3.fromRGB(20,21,30),
Text=Color3.fromRGB(255,255,255),
Dim=Color3.fromRGB(150,155,172),
Accent=Color3.fromRGB(232,236,245),
Accent2=Color3.fromRGB(148,156,178),
OnAccent=Color3.fromRGB(11,13,18),
Success=Color3.fromRGB(52,211,153),
Warn=Color3.fromRGB(251,191,36),
Danger=Color3.fromRGB(248,113,113),
}end function a.u():typeof(__modImpl())local b=a.cache.u if not b then b={c=__modImpl()}a.cache.u=b end return b.c end end do local function __modImpl()


local b=a.a()

b.Themes={
Midnight=a.i(),
Rose=a.j(),
Indigo=a.k(),
Forest=a.l(),
Amber=a.m(),
Ocean=a.n(),
Crimson=a.o(),
Ghost=a.p(),
Cyberpunk=a.q(),
Terminal=a.r(),
Discord=a.s(),
Mono=a.t(),
Kronos=a.u(),
}

if not b.Theme then
b.ThemeName="Kronos"
b.Theme=b.Themes.Kronos
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
}end function a.v():typeof(__modImpl())local b=a.cache.v if not b then b={c=__modImpl()}a.cache.v=b end return b.c end end do local function __modImpl()






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

return{SetAcrylic=SetAcrylic,ToggleAcrylic=ToggleAcrylic}end function a.w():typeof(__modImpl())local b=a.cache.w if not b then b={c=__modImpl()}a.cache.w=b end return b.c end end do local function __modImpl()




local b=a.a()
local c=a.b()

local d=c.cloneref_check(game:GetService"HttpService")

local function reqFn()
return c.hasFn"syn"and c.hasFn"syn".request
or c.hasFn"http_request"
or c.hasFn"request"
end

local e="Kronos/cloud_identity.json"

local function ensureAssetsFolder()
local f,g=c.hasFn"makefolder",c.hasFn"isfolder"
pcall(function()
if f and g and not g"Kronos"then f"Kronos"end
end)
end

local function LoadCloudIdentity()
local f=c.hasFn"isfile"
local g=c.hasFn"readfile"
if f and g then
local h,i=pcall(f,e)
if h and i then
local j,k=pcall(g,e)
if j then
local l,m=pcall(function()return d:JSONDecode(k)end)
if l and type(m)=="table"and m.Id then
m.Tokens=m.Tokens or{}
return m
end
end
end
end

local h
pcall(function()
local i,j=c.hasFn"readfile",c.hasFn"isfile"
if i and j and j"Kronos/identity.txt"then
h=i"Kronos/identity.txt"
end
end)
if h and h~=""then
return{Id=h,Tokens={}}
end
return nil
end

local function SaveCloudIdentity(f)
local g=c.hasFn"writefile"
if not g then return end
ensureAssetsFolder()
pcall(g,e,d:JSONEncode(f))
end

local function GetOrCreateCloudIdentity()
local f=LoadCloudIdentity()
if f then return f end
f={Id=d:GenerateGUID(false),Tokens={}}
SaveCloudIdentity(f)
return f
end

local function sanitize(f,g)
f=tostring(f or"")
f=f:gsub("%c","")
if g and#f>g then f=string.sub(f,1,g)end
return f
end


local function NormalizeFeedbackText(f)
local g={
["\226\128\139"]="",["\226\128\142"]="",["\226\128\143"]="",
["\239\187\191"]="",["\194\173"]="",
}
for h,i in pairs(g)do
f=f:gsub(h,i)
end
f=f:gsub("%s+"," ")
f=f:gsub("^%s+","")
f=f:gsub("%s+$","")
return f
end

local f={
{pattern="d%s*i%s*s%s*c%s*o%s*r%s*d",name="discord"},
{pattern="t%s*e%s*l%s*e%s*g%s*r%s*a%s*m",name="telegram"},
{pattern="w%s*h%s*a%s*t%s*s%s*a%s*p%s*p",name="whatsapp"},
{pattern="h%s*t%s*t%s*p",name="http"},
{pattern="h%s*t%s*t%s*p%s*s",name="https"},
{pattern="w%s*w%s*w",name="www"},
{pattern="c%s*o%s*m",name="com"},
{pattern="o%s*r%s*g",name="org"},
{pattern="n%s*e%s*t",name="net"},
{pattern=".%s*g%s*g",name=".gg"},
{pattern=".%s*c%s*o%s*m",name=".com"},
{pattern="/%s*i%s*n%s*v%s*i%s*t%s*e",name="/invite"},
{pattern="d%s*o%s*t%s*%s*c%s*o%s*m",name="dot com"},
{pattern="a%s*t%s*%s*%s*h%s*e%s*r%s*e",name="@here"},
{pattern="a%s*t%s*%s*%s*e%s*v%s*e%s*r%s*y%s*o%s*n%s*e",name="@everyone"},
}

local function DetectFeedbackEvasion(g)
for h,i in ipairs(f)do
if g:match(i.pattern)then
return true,i.name
end
end
local h,i=0,0
for j=1,#g do
local k=g:sub(j,j)
if k=="."then h=h+1 end
if k=="/"then i=i+1 end
end
if h>=3 or i>=3 then
return true,"suspicious link/invite"
end
return false,nil
end

local g={
["á"]="a",["à"]="a",["ã"]="a",["â"]="a",["ä"]="a",
["Á"]="A",["À"]="A",["Ã"]="A",["Â"]="A",["Ä"]="A",
["é"]="e",["è"]="e",["ê"]="e",["ë"]="e",
["É"]="E",["È"]="E",["Ê"]="E",["Ë"]="E",
["í"]="i",["ì"]="i",["î"]="i",["ï"]="i",
["Í"]="I",["Ì"]="I",["Î"]="I",["Ï"]="I",
["ó"]="o",["ò"]="o",["õ"]="o",["ô"]="o",["ö"]="o",
["Ó"]="O",["Ò"]="O",["Õ"]="O",["Ô"]="O",["Ö"]="O",
["ú"]="u",["ù"]="u",["û"]="u",["ü"]="u",
["Ú"]="U",["Ù"]="U",["Û"]="U",["Ü"]="U",
["ç"]="c",["Ç"]="C",["ñ"]="n",["Ñ"]="N",
["°"]=" ",["º"]=" ",["ª"]=" ",
}

local h="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 .,!?;:()[]{}@#%&*+-=/_\"'"

local function SanitizeFeedbackText(i)
if not i or i==""then
return"_No message_"
end

i=NormalizeFeedbackText(i)

local j,k=DetectFeedbackEvasion(i)
if j then
return"[Message blocked - "..k.."]"
end

i=i:gsub("@everyone","@\226\128\139everyone")
i=i:gsub("@here","@\226\128\139here")
i=i:gsub("<@!?(%d+)>","[user]")
i=i:gsub("<@&(%d+)>","[role]")

i=i:gsub("d[iI][sS][cC][oO][rR][dD]%.?[gG][gG]%s*/?%s*[%w%-_]+","[invite removed]")
i=i:gsub("d[iI][sS][cC][oO][rR][dD]%.?[cC][oO][mM]%s*/?%s*[iI][nN][vV][iI][tT][eE]%s*/?%s*[%w%-_]+","[invite removed]")
i=i:gsub("https?%s*:%s*//%s*[%w%-%.]+%s*%.%s*[%w]+[%w%-%./?=&%%]*","[link removed]")
i=i:gsub("www%s*%.%s*[%w%-]+%s*%.%s*[%w]+","[link removed]")
i=i:gsub("t[eE][lL][eE][gG][rR][aA][mM]%.?%s*[mM][eE]%s*/%s*[%w%-_]+","[invite removed]")

for l,m in pairs(g)do
i=i:gsub(l,m)
end

local l=""
for m=1,#i do
local n=i:sub(m,m)
if h:find(n,1,true)then
l=l..n
else
l=l.." "
end
end
i=l

i=i:gsub("%s+"," ")
i=i:gsub("^%s+","")
i=i:gsub("%s+$","")

local m=DetectFeedbackEvasion(i)
if m then
return"[Message blocked - suspicious content]"
end

if#i>500 then
i=i:sub(1,500).."..."
end

return i
end

local function SanitizeText(i,j)
j=j or{}
local k=j.MaxLength or 500

if not i or i==""then
return"",false,nil
end

local l=NormalizeFeedbackText(tostring(i))
local m,n=DetectFeedbackEvasion(l)
if m then
return"",true,n
end

local o=SanitizeFeedbackText(i)
if o=="_No message_"then
return"",false,nil
end
if o:find"^%[Message blocked"then
return"",true,"blocked content"
end

if#o>k then
o=o:sub(1,k)
end

return o,false,nil
end

local function GetExecutorHwid()
local i
pcall(function()
i=c.cloneref_check(game:GetService"Players")
end)
local j,k=pcall(function()
local j=c.hasFn"gethwid"
if type(j)=="function"then return j()end
error"no gethwid"
end)
if(not j or k==nil or tostring(k)=="")and i then
j,k=pcall(function()return i.LocalPlayer.UserId end)
end
if j and k~=nil and tostring(k)~=""then
return tostring(k)
end
return"Unavailable"
end

local i=30
local j=0




local function SendFeedbackWebhook(k,l,m,n,o,p)
n=n or{}
l=math.clamp(math.floor((tonumber(l)or 0)+0.5),0,5)
local q=tonumber(n.Cooldown)or i

local function say(r,s,t,u)
if type(p)=="function"then
pcall(p,{Title=r,Text=s,Type=t,Duration=u})
end
end

local r=os.clock()
if r-j<q then
say("Feedback",string.format(
"Please wait %ds before sending more feedback.",
math.ceil(q-(r-j))
),"warning",3)
return false
end

if not k or k==""then
say("Feedback","No webhook configured.","warning",4)
return false
end

local s=reqFn()
if not s then
say("Feedback","Your executor doesn't support HTTP requests.","error",4)
return false
end

local t=NormalizeFeedbackText(m or"")
local u=DetectFeedbackEvasion(t)
local v=SanitizeFeedbackText(m)

if u or v:find"blocked"then
j=r
say("Blocked","Unallowed content detected.","error",4)
return false
end

j=r

local w=d:JSONEncode{
Rating=l,
Message=v,
}

local x={
["Content-Type"]="application/json",
}

if o and o.Identity and o.Identity~=""then
x["X-KronosUI-Identity"]=o.Identity
end

x["X-KronosUI-Script"]=b._CloudServiceScript or"Kronos"

local y=GetExecutorHwid()
if y~=nil and y~=""and y~="Unavailable"then
x["X-KronosUI-HWID"]=tostring(y)
end

task.spawn(function()
local z,A=pcall(s,{
Url=k,
Method="POST",
Headers=x,
Body=w,
})
if not z then
say("Failed to Send",tostring(A),"error",3)
return
end local


B=pcall(function()
local B=A and tonumber(A.StatusCode)
if B==nil or(B>=200 and B<300)then
say("Feedback Sent","Thanks for rating the UI!","success",3)
return false
end
local C
pcall(function()
local D=d:JSONDecode(A.Body)
if type(D)=="table"then
local E=D.error
if type(E)=="table"and E.message then
C=tostring(E.message)
elseif type(E)=="string"and E~=""then
C=E
end
end
end)
if B==429 then
say("Slow Down",C or"You are rating too often. Please try again later.","warning",4)
return true
end
say("Failed to Send",C or("Request failed (HTTP "..tostring(B)..")."),"error",3)
return true
end)
if not B then
say("Slow Down","You are rating too often. Please try again later.","warning",4)
end
end)

return true
end


local function SendChatToDiscord(k,l,m,n)
n=n or{}
if not k or k==""then return false end
if not m or tostring(m):gsub("%s+","")==""then return false end

local o=reqFn()
if not o then return false end

local p,q=SanitizeText(m,{MaxLength=500})
if q or p==""then return false end
if p:find"blocked"then return false end
if#p>1900 then p=p:sub(1,1900).."..."end

l=tostring(l or"Someone"):sub(1,80)

local r,s=pcall(d.JSONEncode,d,{
allowed_mentions={parse={}},
embeds={{
title=n.Title or"Global Chat",
description=p,
color=n.Color or 0x7C5CFF,
fields={
{name="From",value=l,inline=true},
},
footer={text=n.Footer or"Sent from in-game"},
timestamp=DateTime.now():ToIsoDate(),
}},
})
if not r then return false end

local t=pcall(o,{
Url=k,
Method="POST",
Headers={["Content-Type"]="application/json"},
Body=s,
})
return t
end

local k=15
local l=0

local function create(m)
m=m or{}
local n=m.BaseUrl
local o=m.Script or"default"
local p=GetOrCreateCloudIdentity()

b._CloudServiceBaseUrl=n
b._CloudServiceScript=o
local q=reqFn()

local function apiRequest(r,s,t,u)
if not q then
return nil,"Your executor doesn't support HTTP requests."
end
if not n or n==""then
return nil,"No cloud BaseUrl configured -- point CloudService's BaseUrl at your own backend."
end
local v={
["Content-Type"]="application/json",
["X-KronosUI-Identity"]=p.Id,
["X-KronosUI-Script"]=o,
}
if type(u)=="table"then
for w,x in pairs(u)do v[w]=x end
end
local w,x=pcall(q,{
Url=n..s,
Method=r,
Headers=v,
Body=t and d:JSONEncode(t)or nil,
})
if not w then return nil,tostring(x)end
if x.StatusCode and(x.StatusCode<200 or x.StatusCode>=300)then
local y=x.Body
local z,A=pcall(function()return d:JSONDecode(x.Body)end)
if z and type(A)=="table"and A.error then
y=tostring(A.error)
end
return nil,"HTTP "..tostring(x.StatusCode)..": "..tostring(y)
end
if x.Body==nil or x.Body==""then return{},nil end
local y,z=pcall(function()return d:JSONDecode(x.Body)end)
if not y then return nil,"Failed to decode response."end
return z,nil
end

local r={Identity=p.Id}

function r.List(s,t)
t=t or{}
local u="?sort="..d:UrlEncode(t.Sort or"top")
if t.Query and t.Query~=""then
u=u.."&q="..d:UrlEncode(t.Query)
end
if t.Cursor then
u=u.."&cursor="..d:UrlEncode(tostring(t.Cursor))
end
u=u.."&limit="..tostring(t.PageSize or 20)
local v,w=apiRequest("GET","/configs"..u)
if not v then return nil,w end
return v.Items or{},v.NextCursor
end
function r.ListMine(s)
local t,u=apiRequest("GET","/configs/mine")
if not t then return nil,u end
return t.Items or{}
end
function r.GetByShareCode(s,t)
return apiRequest("GET","/configs/code/"..d:UrlEncode(tostring(t)))
end
function r.Publish(s,t,u)
t=t or{}
local v=os.clock()
if v-l<k then
return nil,string.format(
"Please wait %ds before publishing again.",
math.ceil(k-(v-l))
)
end

local w,x=SanitizeText(t.Name,{MaxLength=60})
if x or w==""then
return nil,"Name was empty or blocked by the content filter."
end
local y,z=SanitizeText(t.Description or"",{MaxLength=280})
if z then
return nil,"Description was blocked by the content filter."
end

local A={}
for B,C in ipairs(t.Tags or{})do
local D=SanitizeText(C,{MaxLength=24})
if D~=""then table.insert(A,D)end
if#A>=8 then break end
end

l=v

local B,C=apiRequest("POST","/configs",{
Name=w,
Description=y,
Tags=A,
Data=u or b.Flags,
})
if not B then return nil,C end

if B.Id and B.OwnerToken then
p.Tokens[B.Id]=B.OwnerToken
SaveCloudIdentity(p)
end
return B
end
function r.Delete(s,t)
local u=p.Tokens[t]
if not u then
return false,"You don't have publish rights for this config on this device."
end
local v,w=apiRequest("DELETE","/configs/"..t,nil,{
["X-KronosUI-Owner-Token"]=u,
})
if not v then return false,w end
p.Tokens[t]=nil
SaveCloudIdentity(p)
return true
end
function r.Like(s,t)
local u,v=apiRequest("POST","/configs/"..t.."/like")
if not u then return false,v end
return true
end
function r.Download(s,t)
return apiRequest("POST","/configs/"..t.."/download")
end
function r.SendChatMessage(s,t,u)
return apiRequest("POST","/chat/send",{UserId=t,Text=u})
end
function r.PollChatMessages(s,t)
local u,v=apiRequest("GET","/chat?since="..tostring(t or 0))
if not u then return nil,v end
return u.Messages or{}
end
function r.ReportChatMessage(s,t)
local u,v=apiRequest("POST","/chat/"..tostring(t).."/report")
if not u then return false,v end
return true
end
function r.Heartbeat(s,t)
local u,v=apiRequest("POST","/presence/heartbeat",t)
if not u then return false,v end
return true
end
function r.GetActiveCount(s)
local t,u=apiRequest("GET","/presence/count")
if not t then return nil,u end
return t.Count or 0
end
function r.GetLeaderboard(s,t)
local u,v=apiRequest("GET","/presence/leaderboard?limit="..tostring(t or 10))
if not u then return nil,v end
return u.Items or{}
end

return r
end

return{
create=create,
sanitize=sanitize,
SanitizeText=SanitizeText,
NormalizeFeedbackText=NormalizeFeedbackText,
DetectFeedbackEvasion=DetectFeedbackEvasion,
SanitizeFeedbackText=SanitizeFeedbackText,
GetExecutorHwid=GetExecutorHwid,
SendFeedbackWebhook=SendFeedbackWebhook,
SendChatToDiscord=SendChatToDiscord,
}end function a.x():typeof(__modImpl())local b=a.cache.x if not b then b={c=__modImpl()}a.cache.x=b end return b.c end end do local function __modImpl()




local b=a.b()

local c=b.cloneref_check(game:GetService"RunService")

local d=60
local e=false
local function ensureLiveStats()
if e then return end
e=true
pcall(function()
local f=0
local g=os.clock()
c.Heartbeat:Connect(function()
f=f+1
local h=os.clock()
local i=h-g
if i>=1 then
d=math.floor(f/i+0.5)
f=0
g=h
end
end)
end)
end

local function GetLivePingMs()
local f
pcall(function()
local g=b.cloneref_check(game:GetService"Stats")
f=math.clamp(g.Network.ServerStatsItem["Data Ping"]:GetValue(),0,9999)
end)
if type(f)=="number"and f>=0 and f==f then
return math.floor(f+0.5)
end
return nil
end

local function GetExecutorName()
local f,g,h=pcall(function()
local f=b.hasFn"identifyexecutor"
if type(f)=="function"then return f()end
local g=b.hasFn"getexecutorname"
if type(g)=="function"then return g()end
error"no executor probe"
end)
if f and g and g~=""then
if h and h~=""then
return tostring(g).." "..tostring(h)
end
return tostring(g)
end
return"Unknown"
end

local function RunCountPath()
return"Kronos/runcount.txt"
end
local function BumpRunCount()
local f=1
local g=b.hasFn"isfile"
local h=b.hasFn"readfile"
if g and h and g(RunCountPath())then
local i,j=pcall(h,RunCountPath())
local k=i and tonumber(j)
if k then f=math.floor(k)+1 end
end
local i=b.hasFn"writefile"
if i then
local j,k=b.hasFn"makefolder",b.hasFn"isfolder"
pcall(function()
if j and k and not k"Kronos"then j"Kronos"end
end)
pcall(i,RunCountPath(),tostring(f))
end
return f
end

local function FormatClock(f)
f=f or 0
local g=math.floor(f/60)%24
local h=math.floor(f%60)
local i=g>=12 and"PM"or"AM"
local j=g%12
if j==0 then j=12 end
return string.format("%02d:%02d %s",j,h,i)
end

local function GetRegion()
local f
pcall(function()
local g=b.cloneref_check(game:GetService"Players")
local h=b.cloneref_check(game:GetService"LocalizationService")
f=h:GetCountryRegionForPlayerAsync(g.LocalPlayer)
end)
return f
end

return{
ensure=ensureLiveStats,
GetFps=function()return d end,
GetPingMs=GetLivePingMs,
GetExecutorName=GetExecutorName,
BumpRunCount=BumpRunCount,
FormatClock=FormatClock,
GetRegion=GetRegion,
}end function a.y():typeof(__modImpl())local b=a.cache.y if not b then b={c=__modImpl()}a.cache.y=b end return b.c end end do local function __modImpl()





local b=a.a()
local c=a.b()
local d=a.y()

local e=c.cloneref_check(game:GetService"HttpService")
local f=c.cloneref_check(game:GetService"Players")
local g=c.cloneref_check(game:GetService"UserInputService")

local function reqFn()
return c.hasFn"syn"and c.hasFn"syn".request
or c.hasFn"http_request"
or c.hasFn"request"
end

local function create(h)
h=h or{}
local i=h.Providers or{}
local j=h.Tools or{}
local k=h.SystemPrompt or"You are a helpful assistant."
k=k
..[[ Do not reveal private chain-of-thought, hidden reasoning, or internal deliberation. Return only the useful answer and, when appropriate, a concise explanation. Never output <think>...</think> blocks.]]


local l=h.MaxRounds or 6
local m=h.MaxTokens or 2048
local n=reqFn()

local o=h.CloudService
local p=h.Script
or(o and o.Script)
or"default"

local q=o and o.Identity

local r=h.Context or{}
local s=r.Enabled~=false

local t={
apikey=true,
api_key=true,
token=true,
secret=true,
authorization=true,
password=true,
privatekey=true,
private_key=true,
}

local u={
KronosVersion=true,
GameName=true,
PlaceId=true,
JobId=true,
Executor=true,
Platform=true,
FPS=true,
Ping=true,
Username=true,
Enabled=true,
}

local function contextValueToString(v,w)
w=w or 0
local x=type(v)
if x=="string"or x=="number"or x=="boolean"then
return tostring(v)
end
if x~="table"or w>=2 then
return tostring(v)
end
local y={}
for z,A in pairs(v)do
table.insert(y,tostring(z).."="..contextValueToString(A,w+1))
end
table.sort(y)
return"{ "..table.concat(y,", ").." }"
end

local function getRuntimeInfo()
local v={}

v.kronosVersion=r.KronosVersion or b.Version or"Unknown"

v.gameName=r.GameName
if v.gameName==nil or v.gameName==""then
local w,x=pcall(function()return game.Name end)
if w and x~=nil and tostring(x)~=""then
v.gameName=tostring(x)
else
v.gameName="Unknown"
end
end

v.placeId=r.PlaceId
if v.placeId==nil or v.placeId==""then
local w,x=pcall(function()return game.PlaceId end)
if w and x~=nil and tostring(x)~=""then
v.placeId=x
else
v.placeId="Unknown"
end
end

v.jobId=r.JobId
if v.jobId==nil or v.jobId==""then
local w,x=pcall(function()return game.JobId end)
if w and x~=nil and tostring(x)~=""then
v.jobId=tostring(x)
else
v.jobId=nil
end
end

v.executorName=r.Executor
if v.executorName==nil or v.executorName==""then
v.executorName=d.GetExecutorName()
end

v.platform=r.Platform
if v.platform==nil or v.platform==""then
local w,x=pcall(function()return g:GetPlatform()end)
if w and x~=nil then
local y=tostring(x):match"%.([%w_]+)$"or tostring(x)
if y~=""then v.platform=y end
end
end

v.fps=r.FPS
if type(v.fps)~="number"or not(v.fps>=0)then
d.ensure()
v.fps=d.GetFps()
end

v.pingMs=r.Ping
if type(v.pingMs)~="number"or not(v.pingMs>=0)then
v.pingMs=d.GetPingMs()
end

v.username=r.Username
if v.username==nil or v.username==""then
local w,x=pcall(function()return f.LocalPlayer end)
if w and x~=nil then local
y, z=pcall(function()return x.DisplayName end)local
A, B=pcall(function()return x.Name end)
if type(B)=="string"and B~=""then
if type(z)=="string"and z~=""and z~=B then
v.username=z.." (@"..B..")"
else
v.username=B
end
end
end
end

return v
end

local function buildDynamicContext()
local v=getRuntimeInfo()
local w={"CURRENT KRONOS CONTEXT:"}
table.insert(w,"Kronos Version: "..tostring(v.kronosVersion))
table.insert(w,"Script ID: "..tostring(p or"Unknown"))
table.insert(w,"Game: "..tostring(v.gameName))
table.insert(w,"Place ID: "..tostring(v.placeId))
if v.jobId~=nil and v.jobId~=""then
table.insert(w,"Job ID: "..tostring(v.jobId))
end
table.insert(w,"Executor: "..tostring(v.executorName))
if v.platform~=nil and v.platform~=""then
table.insert(w,"Platform: "..tostring(v.platform))
end
if type(v.fps)=="number"then
table.insert(w,"FPS: "..tostring(math.floor(v.fps+0.5)))
end
if type(v.pingMs)=="number"then
table.insert(w,"Ping: "..tostring(math.floor(v.pingMs+0.5)).." ms")
end
if v.username~=nil and v.username~=""then
table.insert(w,"User: "..tostring(v.username))
end

for x,z in pairs(r)do
if not u[x]then
local A=tostring(x):lower():gsub("[%s_%-]","")
if not t[A]then
table.insert(w,tostring(x)..": "..contextValueToString(z,0))
end
end
end

return table.concat(w,"\n")
end

local function buildBodyContext()
local v=getRuntimeInfo()
local w={}
w.KronosVersion=tostring(v.kronosVersion)
w.GameName=tostring(v.gameName)
w.Executor=tostring(v.executorName)
local x=tonumber(v.placeId)
if x then w.PlaceId=x end
if type(v.jobId)=="string"and v.jobId~=""then
w.JobId=v.jobId
end
if type(v.platform)=="string"and v.platform~=""then
w.Platform=v.platform
end
if type(v.fps)=="number"and v.fps>=0 and v.fps==v.fps then
w.FPS=math.floor(v.fps+0.5)
end
if type(v.pingMs)=="number"and v.pingMs>=0 and v.pingMs==v.pingMs then
w.Ping=math.floor(v.pingMs+0.5)
end
return w
end

local v={{role="system",content=k}}

local function pruneEmptyProperties(w)
if type(w)~="table"then return w end
for x,z in pairs(w)do
if x=="properties"and type(z)=="table"and next(z)==nil then
w[x]=nil
elseif type(z)=="table"then
pruneEmptyProperties(z)
end
end
return w
end

local function toOpenAITools()
local w={}
for x,z in ipairs(j)do
table.insert(w,{
type="function",
["function"]={
name=z.Name,
description=z.Description,
parameters=pruneEmptyProperties(z.Parameters),
},
})
end
return w
end

local function buildRequestMessages()
local w={
{role="system",content=k},
}
if s then
table.insert(w,{role="system",content=buildDynamicContext()})
end
for x,z in ipairs(v)do
if type(z)=="table"and z.role~="system"then
table.insert(w,z)
end
end
return w
end

local w=30

local function trimHistory()
local x=1
if type(v[1])=="table"and v[1].role=="system"then
x=2
end
while(#v-x+1)>w do
table.remove(v,x)
end
while type(v[x])=="table"and v[x].role=="tool"do
table.remove(v,x)
end
while true do
local z=v[x]
if type(z)~="table"or z.role~="assistant"then break end
local A=z.tool_calls
if type(A)~="table"or#A==0 then break end
table.remove(v,x)
while type(v[x])=="table"and v[x].role=="tool"do
table.remove(v,x)
end
end
end

local function callProvider(x,z)
local A={
messages=z,
tools=toOpenAITools(),
max_tokens=m,
}
if x.Model and x.Model~=""then
A.model=x.Model
end
if s then
local B=buildBodyContext()
if next(B)~=nil then A.context=B end
end
local B=e:JSONEncode(A)

local C={
["Content-Type"]="application/json",
["X-KronosUI-Script"]=p,
}

if q and q~=""then
C["X-KronosUI-Identity"]=q
end

if x.ApiKey and x.ApiKey~=""then
C.Authorization="Bearer "..tostring(x.ApiKey)
end

local D,E=pcall(n,{
Url=x.Endpoint,
Method="POST",
Headers=C,
Body=B,
})
if not D then return nil,tostring(E),false,true end

if E.StatusCode and E.StatusCode~=200 then
local F=E.Body
local G,H=pcall(function()return e:JSONDecode(E.Body)end)
if G and type(H)=="table"then
local I=H.error
if type(I)=="table"and I.message then
F=tostring(I.message)
elseif type(I)=="string"then
F=I
end
end
local I=E.StatusCode==429
if I then F=F.." (rate limited)"end
local J=E.StatusCode==502 or E.StatusCode==503 or E.StatusCode==504
return nil,x.Name.." API error "..tostring(E.StatusCode)..": "..F,I,J
end

local F,G=pcall(function()return e:JSONDecode(E.Body)end)
if not F then return nil,x.Name..": failed to decode API response.",false,false end
return G,nil,false,false
end

local x=3

local function callAI(z)
if not n then
return nil,"Your executor doesn't support HTTP requests."
end
local A="No AI provider configured -- add at least one entry with an Endpoint to Providers."
for B,C in ipairs(i)do
if C.Endpoint and C.Endpoint~=""then
local D=false
for E=1,x do
if E>1 then task.wait(1.5*(E-1))end
local F,G,H,I=callProvider(C,z)
if F then return F end
A=G
if H then break end
if not I then return nil,A end
D=(E==x)
end
if D then return nil,A end
end
end
return nil,A
end

local function stripThinkTags(z)
if type(z)~="string"or z==""then return z end
z=z:gsub("<think[^>]*>.-</think>","")
z=z:gsub("<think[^>]*>.*$","")
z=z:gsub("^%s+","")
z=z:gsub("%s+$","")
return z
end

local z={}
local A=false
local B=false
local C=0
local D=0
local E

function z.Stop(F)
A=true
C=C+1
if B and D~=0 and E then
local G=E
D=0
E=nil
B=false
pcall(function()G:HideTyping()end)
pcall(function()G:AddMessage("assistant","(stopped)")end)
end
end

function z.IsBusy(F)
return B
end

function z.SetContextEnabled(F,G)
s=G~=false
end

function z.IsContextEnabled(F)
return s
end

function z.GetHistory(F)
return v
end

function z.Reset(F)
table.clear(v)
table.insert(v,{role="system",content=k})
trimHistory()
end

function z.Ask(F,G,H)
table.insert(v,{role="user",content=H})
G:ShowTyping()
A=false
B=true
C=C+1
local I=C
D=I
E=G

for J=1,l do
if A then
if D==I then
D=0
B=false
G:HideTyping()
G:AddMessage("assistant","(stopped)")
trimHistory()
end
return
end

local K,L=callAI(buildRequestMessages())
if I~=C then
if D==I then
D=0
B=false
G:HideTyping()
G:AddMessage("assistant","(stopped)")
trimHistory()
end
return
end
if not K then
B=false
G:HideTyping()
G:AddMessage("assistant","Error: "..tostring(L))
trimHistory()
return
end

local M=K.choices and K.choices[1]
local N=M and M.message
if not N then
B=false
G:HideTyping()
G:AddMessage("assistant","Error: empty response from API.")
trimHistory()
return
end

N.content=stripThinkTags(N.content)

table.insert(v,N)

local O=N.tool_calls
local P=O and#O>0 local Q=
N.content or""

local R=M.finish_reason=="length"

if N.content and N.content~=""then
if not P and not R then G:HideTyping()end
G:AddMessage("assistant",N.content)
end

if P then
for S,T in ipairs(O)do
local U,V=pcall(function()
return e:JSONDecode(T["function"].arguments)
end)
local W=G:HandleToolCall(T["function"].name,U and V or{})
table.insert(v,{
role="tool",
tool_call_id=T.id,
content=e:JSONEncode(W==nil and{}or W),
})
end
elseif R then
table.insert(v,{
role="user",
content=[[Continue the previous answer from the exact point where it stopped. Do not repeat, rephrase, summarize, or restart any text already written. Output only the missing continuation.]]

,
})
else
B=false
G:HideTyping()
trimHistory()
return
end
end

B=false
G:HideTyping()
G:AddMessage("assistant",
"(stopped after several rounds of tool calls/continuations -- ask me to continue if you need to)")
trimHistory()
end

return z
end

return{create=create}end function a.z():typeof(__modImpl())local b=a.cache.z if not b then b={c=__modImpl()}a.cache.z=b end return b.c end end do local function __modImpl()


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

return{Save=Save,Load=Load,Export=Export,Import=Import,AutoSave=AutoSave,Snapshot=Snapshot,Restore=Restore,GetFlags=GetFlags,ApplyTable=ApplyTable}end function a.A():typeof(__modImpl())local b=a.cache.A if not b then b={c=__modImpl()}a.cache.A=b end return b.c end end do local function __modImpl()



local b=a.a()
local c=a.c()
local d=a.e()
local e=a.f()a.v()a.g()


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
local z=r.Th local A=
r.opts or{}
if type(s)=="string"then s={Title=s}end s=s or{}
local B=s.Open
if B==nil then B=s.DefaultOpen~=false end
local C=Instance.new"Frame"C.BackgroundTransparency=1
C.Size=UDim2.new(1,-4,0,22)C.Parent=r.getParent()
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
if J.Frame and J.Frame.Parent==r.getParent()then
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
G=q("chevron",13,z.Dim)
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
end end function a.B():typeof(__modImpl())local b=a.cache.B if not b then b={c=__modImpl()}a.cache.B=b end return b.c end end do local function __modImpl()




local b=a.a()
local c=a.c()
local d=a.e()
local e=a.f()a.v()a.g()


local f=a.b()

local g=b local h=
c.T local i=
c.tween local p=
d.guid local q=
d.spawnCb local r=
d.corner local s=
d.hairline local v=
d.pad local w=
d.lighting local z=
d.ripple local A=
e.makeIcon
f.cloneref_check(game:GetService"RunService")
f.cloneref_check(game:GetService"UserInputService")

return function(B,C)local D=
B.row local E=
B.titleBlock
local F=B.reg local G=
B.tab local H=
B.Window local I=
B.Th local J=
B.opts or{}
if type(C)=="string"then C={Text=C}end C=C or{}
local K=Instance.new"TextLabel"K.BackgroundTransparency=1
K.Size=UDim2.new(1,-4,0,22)K.Font=Enum.Font.Gotham K.TextSize=12
K.TextXAlignment=0 K.TextWrapped=true K.Text=C.Text or"Label"K.Parent=B.getParent()
g:_tag(K,"TextColor3","Dim")
return F{Title=C.Text,Frame=K,_handle=K}
end end function a.C():typeof(__modImpl())local b=a.cache.C if not b then b={c=__modImpl()}a.cache.C=b end return b.c end end do local function __modImpl()




local b=a.a()
local c=a.c()
local d=a.e()
local e=a.f()a.v()a.g()


local f=a.b()

local g=b local A=
c.T local B=
c.tween local C=
d.guid local F=
d.spawnCb local J=
d.corner local K=
d.hairline local L=
d.pad local M=
d.lighting local N=
d.ripple local O=
e.makeIcon
f.cloneref_check(game:GetService"RunService")
f.cloneref_check(game:GetService"UserInputService")

return function(P,Q)local R=
P.row local S=
P.titleBlock
local T=P.reg local U=
P.tab local V=
P.Window local W=
P.Th local X=
P.opts or{}
if type(Q)=="string"then Q={Text=Q}end Q=Q or{}
local Y=Instance.new"Frame"Y.BackgroundTransparency=1
Y.Size=UDim2.new(1,-4,0,Q.Text and 20 or 12)Y.Parent=P.getParent()
local function hair(Z,_,aa)
local ab=Instance.new"Frame"ab.BorderSizePixel=0
ab.AnchorPoint=Vector2.new(0,0.5)ab.Position=UDim2.new(_,0,0.5,0)
ab.Size=UDim2.new(aa,0,0,1)ab.BackgroundColor3=Color3.fromRGB(255,255,255)
ab.BackgroundTransparency=0.93 ab.Parent=Y
end
if Q.Text and Q.Text~=""then
local aa=24+3.5*string.len(Q.Text)
local ab=Instance.new"TextLabel"ab.BackgroundTransparency=1
ab.AnchorPoint=Vector2.new(0.5,0.5)ab.Position=UDim2.new(0.5,0,0.5,0)
ab.Size=UDim2.new(0,aa*2,0,14)
ab.Font=Enum.Font.GothamBold ab.TextSize=10
ab.Text=string.upper(Q.Text)ab.Parent=Y
g:_tag(ab,"TextColor3","Dim")
local Z=Instance.new"Frame"Z.BorderSizePixel=0
Z.AnchorPoint=Vector2.new(0,0.5)Z.Position=UDim2.new(0,0,0.5,0)
Z.Size=UDim2.new(0.5,-aa,0,1)
Z.BackgroundColor3=Color3.fromRGB(255,255,255)
Z.BackgroundTransparency=0.93 Z.Parent=Y
local _=Instance.new"Frame"_.BorderSizePixel=0
_.AnchorPoint=Vector2.new(1,0.5)_.Position=UDim2.new(1,0,0.5,0)
_.Size=UDim2.new(0.5,-aa,0,1)
_.BackgroundColor3=Color3.fromRGB(255,255,255)
_.BackgroundTransparency=0.93 _.Parent=Y
else
hair(0,0,1)
end
return T{Title=Q.Text,Frame=Y,_handle=Y,_break=true}
end end function a.D():typeof(__modImpl())local aa=a.cache.D if not aa then aa={c=__modImpl()}a.cache.D=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local b=a.e()
local c=a.f()a.v()a.g()


local d=a.b()

local e=aa
local f=ab.T
local g=ab.tween local O=
b.guid local P=
b.spawnCb
local Q=b.corner local T=
b.hairline local X=
b.pad local Y=
b.lighting local Z=
b.ripple local _=
c.makeIcon
d.cloneref_check(game:GetService"RunService")
d.cloneref_check(game:GetService"UserInputService")

return function(ac,ad)
local ae=ac.row
local af=ac.titleBlock
local ag=ac.reg local ah=
ac.tab local ai=
ac.Window
local aj=ac.Th local ak=
ac.opts or{}
ad=ad or{}
local al=ad.Max or 100
local am=ad.Value or 0
local an=ae(48)
af(an,ad.Title or"Progress",ad.Description,90,true)
local ao=Instance.new"TextLabel"ao.BackgroundTransparency=1
ao.AnchorPoint=Vector2.new(1,0)ao.Position=UDim2.new(1,-12,0,7)
ao.Size=UDim2.new(0,60,0,17)ao.Font=Enum.Font.GothamBold
ao.TextSize=11 ao.TextXAlignment=1 ao.Parent=an
e:_tag(ao,"TextColor3","Dim")
local ap=Instance.new"Frame"ap.Position=UDim2.new(0,12,0,30)
ap.Size=UDim2.new(1,-24,0,6)ap.BackgroundColor3=aj.Surface2
ap.BorderSizePixel=0 Q(ap,99)ap.Parent=an
e:_tag(ap,"BackgroundColor3","Surface2")
local aq=Instance.new"Frame"aq.BorderSizePixel=0
aq.Size=UDim2.new(0,0,1,0)Q(aq,99)aq.Parent=ap
e:agrad(aq,0)
local ar=Instance.new"UIGradient"ar.Rotation=0
ar.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.7),
NumberSequenceKeypoint.new(0.5,0.9),
NumberSequenceKeypoint.new(1,0.7),
}
ar.Color=ColorSequence.new(Color3.fromRGB(255,255,255))
ar.Parent=aq
local as={}
function as.Set(at,au)
am=math.clamp(tonumber(au)or 0,0,al)
local av=am/al
g(aq,f.Fill08,{Size=UDim2.new(av,0,1,0)})
ao.Text=math.round(av*100).."%"
end
function as.Get(at)return am end
as:Set(am)
return ag{Title=ad.Title,Frame=an,_handle=as}
end end function a.E():typeof(__modImpl())local aa=a.cache.E if not aa then aa={c=__modImpl()}a.cache.E=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local ag=
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
local au=as.row local av=
as.titleBlock
local b=as.reg local c=
as.tab local d=
as.Window
local e=as.Th local f=
as.opts or{}
at=at or{}
local g=au(150)
local Q=Instance.new"TextLabel"Q.BackgroundTransparency=1
Q.Position=UDim2.new(0,12,0,6)Q.Size=UDim2.new(1,-100,0,16)
Q.Font=Enum.Font.GothamMedium Q.TextSize=12 Q.TextXAlignment=0
Q.Text=at.Title or"Log"Q.Parent=g
af:_tag(Q,"TextColor3","Text")
local _=Instance.new"TextButton"_.Text=""
_.AnchorPoint=Vector2.new(1,0)_.Position=UDim2.new(1,-10,0,6)
_.Size=UDim2.new(0,52,0,18)_.BackgroundColor3=e.Surface2
_.BorderSizePixel=0 am(_,6)_.AutoButtonColor=false _.Parent=g
an(_,true)
af:_tag(_,"BackgroundColor3","Surface2")
local aw=Instance.new"TextLabel"aw.BackgroundTransparency=1
aw.Size=UDim2.fromScale(1,1)aw.Font=Enum.Font.GothamBold
aw.TextSize=10 aw.Text="CLEAR"aw.Parent=_
af:_tag(aw,"TextColor3","Dim")
local ax=Instance.new"ScrollingFrame"
ax.Position=UDim2.new(0,10,0,28)ax.Size=UDim2.new(1,-20,1,-36)
ax.BackgroundColor3=e.Bg ax.BorderSizePixel=0
ax.ScrollBarThickness=2 ax.CanvasSize=UDim2.new(0,0,0,0)
ax.AutomaticCanvasSize=Enum.AutomaticSize.Y am(ax,6)ax.Parent=g
af:_tag(ax,"BackgroundColor3","Bg")
af:_tag(ax,"ScrollBarImageColor3","Surface2")
local ay=Instance.new"UIListLayout"ay.Padding=UDim.new(0,1)
ay.SortOrder=Enum.SortOrder.LayoutOrder ay.Parent=ax
ao(ax,4,4,6,6)
local az={}
function az.Add(aA,aB,aC)
local aD=tostring(aB)
if at.Stamp~=false then aD="["..os.date"%H:%M:%S".."] "..aD end
local aE=Instance.new"TextLabel"aE.BackgroundTransparency=1
aE.Size=UDim2.new(1,-4,0,14)aE.Font=Enum.Font.Code aE.TextSize=11
aE.TextXAlignment=0 aE.TextTruncate=Enum.TextTruncate.AtEnd
aE.Text=aD aE.Parent=ax
if typeof(aC)=="Color3"then aE.TextColor3=aC
else af:_tag(aE,"TextColor3","Dim")end
task.defer(function()
pcall(function()ax.CanvasPosition=Vector2.new(0,ax.AbsoluteCanvasSize.Y)end)
end)
end
function az.Clear(aA)
for aB,aC in ipairs(ax:GetChildren())do
if aC:IsA"TextLabel"then pcall(function()aC:Destroy()end)end
end
end
_.MouseButton1Click:Connect(function()az:Clear()end)
for aA,aB in ipairs(at.Lines or{})do az:Add(aB)end
return b{Title=at.Title,Frame=g,_handle=az}
end end function a.F():typeof(__modImpl())local aa=a.cache.F if not aa then aa={c=__modImpl()}a.cache.F=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween local ao=
ac.guid
local ar=ac.spawnCb
local as=ac.corner
local at=ac.hairline local au=
ac.pad local aw=
ac.lighting
local ax=ac.ripple
local ay=ac.spotlight
local az=ac.attachTip
local aA=ac.attachCtx
local aB=ac.setDisabled
local aC=ad.makeIcon
local aD=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")


aa._busy=aa._busy or{}
if not aa.Busy then
function aa.Busy(aE,b)
local e=aa._busy and aa._busy[aE]
if e then
if b==false or b==nil then pcall(function()e.done()end)
else pcall(function()e.set(b)end)end
end
end
function aa.Done(aE)
aa.Busy(aE,false)
end
end

return function(aE,b)
local e=aE.row
local f=aE.titleBlock
local g=aE.reg
local Q=aE.tab
local _=aE.Window
local aF=aE.Th local aG=
aE.opts or{}local aH=
aE.page
local aI=aE.pgui
b=b or{}
local aJ=e(b.Description and 54 or 40)
f(aJ,b.Title or"Button",b.Description,90)
ay(aJ,0.08)
if b.Tooltip then az(aJ,b.Tooltip)end
if b.ContextMenu then aA(aI,aJ,b.ContextMenu)end
local aK=Instance.new"TextButton"aK.Text=""
aK.Size=UDim2.fromScale(1,1)aK.BackgroundTransparency=1
aK.Parent=aJ as(aK,10)
local aL=Instance.new"Frame"aL.AnchorPoint=Vector2.new(1,0.5)
aL.Position=UDim2.new(1,-12,0.5,0)aL.Size=UDim2.fromOffset(62,28)
aL.BackgroundColor3=aF.Surface2 aL.BorderSizePixel=0
as(aL,7)aL.Parent=aJ
at(aL,true)
af:_tag(aL,"BackgroundColor3","Surface2")
local aM=Instance.new"TextLabel"aM.Size=UDim2.fromScale(1,1)
aM.BackgroundTransparency=1 aM.Font=Enum.Font.GothamBold aM.TextSize=11
aM.Text=b.HoldTime and("HOLD "..tostring(b.HoldTime).."s")or(b.Label or"RUN")aM.Parent=aL
af:_tag(aM,"TextColor3",b.Danger and"Danger"or"Dim")

local aN
if not b.HoldTime and(b.Label==nil or b.Label=="RUN")then
aM.Visible=false
aN=aC("mouse-pointer-2",16,b.Danger and aF.Danger or aF.Dim)
aN.AnchorPoint=Vector2.new(0.5,0.5)aN.Position=UDim2.new(0.5,0,0.5,0)
aN.Parent=aL
end
local aO=Instance.new"UIScale"aO.Parent=aL
ax(aK)
local aP
local function pressTo(aQ,aR)
if aP then pcall(function()aP:Cancel()end)end
aP=an(aO,aR,aQ)
end
aK.MouseButton1Down:Connect(function()pressTo({Scale=0.93},am.Hover)end)
aK.MouseButton1Up:Connect(function()pressTo({Scale=1},am.Spring)end)
aK.MouseEnter:Connect(function()
af:_tag(aM,"TextColor3","Text")
if aN and aN:IsA"ImageLabel"then
af:_tag(aN,"ImageColor3","Text")
end
end)
aK.MouseLeave:Connect(function()
af:_tag(aM,"TextColor3",b.Danger and"Danger"or"Dim")
if aN and aN:IsA"ImageLabel"then
af:_tag(aN,"ImageColor3",b.Danger and"Danger"or"Dim")
end
end)
local aQ=false
local function fireBtn()
if aQ then return end
if _._activateTab then _._activateTab(Q,true)end
_:_flash(aJ)af:_sfx"Click"ar(b.Callback)ar(b.OnChanged)
end



local aR,aS,aT,aU
local aV={}
local function ringBuild()
if aR and aR.Parent then return end
aR=Instance.new"Frame"aR.Name="_ring"
aR.AnchorPoint=Vector2.new(0.5,0.5)aR.Position=UDim2.new(0.5,0,0.5,0)
aR.Size=UDim2.fromOffset(20,20)aR.BackgroundTransparency=1
aR.Visible=false aR.Parent=aL
aS={}
for aW=0,11 do
local aX=(aW/12)*math.pi*2-math.pi/2
local aY=Instance.new"Frame"aY.BorderSizePixel=0
aY.Size=UDim2.fromOffset(3,3)
aY.Position=UDim2.new(0.5,math.cos(aX)*8-1.5,0.5,math.sin(aX)*8-1.5)
aY.BackgroundColor3=aF.Accent
aY.BackgroundTransparency=0.85
as(aY,99)aY.Parent=aR
af:_tag(aY,"BackgroundColor3","Accent")
table.insert(aS,aY)
end
aT=Instance.new"TextLabel"aT.BackgroundTransparency=1
aT.Size=UDim2.fromScale(1,1)aT.Font=Enum.Font.Code
aT.TextSize=8 aT.Text=""aT.Parent=aR
af:_tag(aT,"TextColor3","Text")
end
local function ringPaint(aW)
if not aS then return end
if aW==nil then
for aX,aY in ipairs(aS)do pcall(function()aY.BackgroundTransparency=0.15 end)end
if aT then aT.Text=""end
else
local aX=math.floor(math.clamp(tonumber(aW)or 0,0,1)*12+0.5)
for aY,aZ in ipairs(aS)do
pcall(function()aZ.BackgroundTransparency=(aY<=aX)and 0.1 or 0.88 end)
end
if aT then pcall(function()
aT.Text=tostring(math.floor(math.clamp(tonumber(aW)or 0,0,1)*100+0.5))
end)end
end
end
local function busyStart(aW)
if aQ then return end aQ=true
ringBuild()
aM.Visible=false
if aR then aR.Visible=true end
ringPaint(aW and 0 or nil)
if not aW then
local aX=0
aU=aD.RenderStepped:Connect(function()
if not aQ then return end
aX=(aX+4)%360
pcall(function()aR.Rotation=aX end)
end)
end
end
local function busyDone()
if not aQ then return end aQ=false
if aU then pcall(function()aU:Disconnect()end)aU=nil end
if aR then
aR.Visible=false
pcall(function()aR.Rotation=0 end)
end
aM.Visible=true
end
function aV.set(aW)
if not aQ then busyStart(true)end
ringPaint(tonumber(aW)or 0)
end
function aV.done()busyDone()end
if b.Flag and(b.Spin or b.Progress)then aa._busy[b.Flag]=aV end
local function fireBusy()
_:_flash(aJ)af:_sfx"Click"
local aW=b.Progress and true or false
busyStart(aW)
task.spawn(function()
local aX=false
local function set(aY)if not aX then ringPaint(tonumber(aY)or 0)end end
local function done()aX=true busyDone()end
pcall(b.Callback,set,done)
if not aX then busyDone()end
end)
end
local aW=function()
if aQ then return end
if(b.Spin or b.Progress)and type(b.Callback)=="function"then
af:_bumpRecent(Q.Title,b.Title or"Button",fireBtn)fireBusy()
else
af:_bumpRecent(Q.Title,b.Title or"Button",fireBtn)fireBtn()
end
end
if b.HoldTime and tonumber(b.HoldTime)then
local aX,aY=tonumber(b.HoldTime),false
local aZ=Instance.new"Frame"aZ.BorderSizePixel=0
aZ.Size=UDim2.new(0,0,1,0)as(aZ,7)aZ.Parent=aL
aZ.BackgroundTransparency=0.6
af:_tag(aZ,"BackgroundColor3","Accent")
aK.InputBegan:Connect(function(a_)
if a_.UserInputType~=Enum.UserInputType.MouseButton1 and a_.UserInputType~=Enum.UserInputType.Touch then return end
aY=true
an(aZ,TweenInfo.new(aX,Enum.EasingStyle.Linear),{Size=UDim2.new(1,0,1,0)})
task.delay(aX,function()
if aY then
aY=false
aW()
aZ.Size=UDim2.new(0,0,1,0)
end
end)
end)
aK.InputEnded:Connect(function(a_)
if a_.UserInputType==Enum.UserInputType.MouseButton1 or a_.UserInputType==Enum.UserInputType.Touch then
aY=false
an(aZ,am.Fast,{Size=UDim2.new(0,0,1,0)})
end
end)
else
aK.MouseButton1Click:Connect(function()
aW()
end)
end
if b.Disabled then task.defer(function()pcall(aB,aJ,true)end)end
local aX={Title=b.Title,Frame=aJ,_handle=aK,Tooltip=b.Tooltip}
aX._go=function()
af:_bumpRecent(Q.Title,b.Title or"Button",fireBtn)aW()
end
return g(aX)
end end function a.G():typeof(__modImpl())local aa=a.cache.G if not aa then aa={c=__modImpl()}a.cache.G=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


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
local aH=aC.reg
local aI=aC.tab
local aJ=aC.Window
local aK=aC.Th local aL=
aC.opts or{}
aD=aD or{}
local aM=aD.Value~=nil and aD.Value or(aD.Default or false)
local aN=aE(aD.Description and 54 or 40)
aF(aN,aD.Title or"Toggle",aD.Description,70)
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
local aW={}
local function twOnce(aX,aY,aZ,a_)
if aW[aX]then pcall(function()aW[aX]:Cancel()end)end
aW[aX]=an(aY,aZ,a_)
end
local function paint(aX)
local aY=aM and UDim2.new(1,-aQ-3,0.5,0)or UDim2.new(0,3,0.5,0)
local aZ=aM and onKnob()or Color3.fromRGB(255,255,255)
if not aX then
aS.BackgroundTransparency=aM and 0 or 1
aT.Position=aY
aT.BackgroundColor3=aZ
return
end
twOnce("glow",aS,am.Fast,{BackgroundTransparency=aM and 0 or 1})
twOnce("knobPos",aT,am.Med,{Position=aY})
twOnce("knobCol",aT,am.Fast,{BackgroundColor3=aZ})
end
aT.Position=aM and UDim2.new(1,-aQ-3,0.5,0)or UDim2.new(0,3,0.5,0)
aT.BackgroundColor3=aM and onKnob()or Color3.fromRGB(255,255,255)
paint(false)
local aX={}
function aX.Set(aY,aZ,a_)
aM=aZ and true or false paint(true)
if aD.Flag then af.Flags[aD.Flag]=aM end
if not a_ then af:_sfx(aM and"On"or"Off")as(aD.Callback,aM)as(aD.OnChanged,aM)end
end
function aX.Get(aY)return aM end

local aY,aZ,a_=0,false
aI._window:Track(aR.InputBegan:Connect(function(b)
if b.UserInputType~=Enum.UserInputType.MouseButton1 and b.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=aV then return end
af.CurrentInput=aV
a_,aY,aZ=b.Position,aT.Position.X.Offset,false
twOnce("ksc",aU,am.Hover,{Scale=1.25})
end))
aI._window:Track(aB.InputChanged:Connect(function(b)
if af.CurrentInput~=aV or not a_ then return end
if b.UserInputType~=Enum.UserInputType.MouseMovement and b.UserInputType~=Enum.UserInputType.Touch then return end
local e=b.Position.X-a_.X
if math.abs(e)>8 then aZ=true end
if aZ then
local f=math.clamp(aY+e,3,aO-aQ-3)
aT.Position=UDim2.new(0,f,0.5,0)
end
end))
local function fireTg()
if aJ._activateTab then aJ._activateTab(aI,true)end
aJ:_flash(aN)aX:Set(not aX:Get())
end
aI._window:Track(aB.InputEnded:Connect(function(b)
if af.CurrentInput~=aV then return end
if b.UserInputType~=Enum.UserInputType.MouseButton1 and b.UserInputType~=Enum.UserInputType.Touch then return end
af.CurrentInput,a_=nil,nil
twOnce("ksc",aU,am.Hover,{Scale=1})
if not aZ then aX:Set(not aM)
else
local e=aT.Position.X.Offset+aQ/2
aX:Set(e>aO/2)
end
af:_bumpRecent(aI.Title,aD.Title or"Toggle",fireTg)
end))
local b={Title=aD.Title,Frame=aN,Value=aM,Flag=aD.Flag,_handle=aX,
_set=function(b,e)aX:Set(b and true or false,e)end}
b._go=function()
af:_bumpRecent(aI.Title,aD.Title or"Toggle",fireTg)fireTg()
end
return aH(b)
end end function a.H():typeof(__modImpl())local aa=a.cache.H if not aa then aa={c=__modImpl()}a.cache.H=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


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
local aY=Instance.new"Frame"aY.BorderSizePixel=0
aY.Size=UDim2.new(0,0,1,0)at(aY,99)aY.Parent=aX
af:agrad(aY,0)
local aZ=Instance.new"Frame"aZ.AnchorPoint=Vector2.new(0.5,0.5)
aZ.Size=UDim2.fromOffset(12,12)aZ.BackgroundColor3=Color3.fromRGB(255,255,255)
aZ.BorderSizePixel=0 at(aZ,99)aZ.Parent=aX
local a_=Instance.new"UIStroke"a_.Thickness=1.5
a_.Color=aO.Accent a_.Transparency=0.35 a_.Parent=aZ
af:_tag(a_,"Color","Accent")


local b=ar()
local e,f,g,Q=false,false
local function alpha(_)return math.clamp((_-aQ)/math.max(1e-6,aR-aQ),0,1)end
local function render(_)
local a0=alpha(aU)
if _ then
an(aY,am.Fill08,{Size=UDim2.new(a0,0,1,0)})
else

aY.Size=UDim2.new(a0,0,1,0)
end
aZ.Position=UDim2.new(a0,0,0.5,0)
if aW:IsFocused()==false then aW.Text=fmt(aU)end
end
local a0={}
function a0.Set(_,a1,a2)
a1=math.clamp(tonumber(a1)or aU,aQ,aR)
a1=math.round(a1/aS)*aS
if aT>0 then a1=tonumber(string.format("%."..aT.."f",a1))end
aU=a1 render(not e)
if aI.Flag then af.Flags[aI.Flag]=aU end
if not a2 then as(aI.Callback,aU)as(aI.OnChanged,aU)end
end
function a0.Get(a1)return aU end
function a0.SetMax(a1,a2)aR=a2 a0:Set(aU,true)end
function a0.SetMin(a1,a2)aQ=a2 a0:Set(aU,true)end
render(false)
aW.FocusLost:Connect(function()
local a1=tonumber(aW.Text)
if a1 then a0:Set(a1)else aW.Text=fmt(aU)end
end)
aX.InputBegan:Connect(function(a1)
if aI.Locked then return end
if a1.UserInputType~=Enum.UserInputType.MouseButton1 and a1.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=b then return end
af.CurrentInput,e,f=b,true,a1.UserInputType==Enum.UserInputType.Touch
scrollLock(true)
local a2
local function thumbTo(_)
if a2 then pcall(function()a2:Cancel()end)end
a2=an(aZ,am.Hover,{Size=UDim2.fromOffset(_,_)})
end
thumbTo(16)
local _
local function fromX(a3)
if _ and math.abs(a3-_)<=1 then return end
_=a3
local a4=math.clamp((a3-aX.AbsolutePosition.X)/math.max(1,aX.AbsoluteSize.X),0,1)
a0:Set(aQ+a4*(aR-aQ))
end
fromX(f and a1.Position.X or aF:GetMouseLocation().X)
if g then g:Disconnect()end
g=aE.RenderStepped:Connect(function()
if not e then return end
if aM._window and aM._window._visible==false then return end
fromX(aF:GetMouseLocation().X)
end)
if Q then Q:Disconnect()end
Q=aF.InputEnded:Connect(function(a3)
if(a3.UserInputType==Enum.UserInputType.MouseButton1 or a3.UserInputType==Enum.UserInputType.Touch)and e then
e=false
if g then g:Disconnect()g=nil end
if Q then Q:Disconnect()Q=nil end
af.CurrentInput=nil
scrollLock(false)
thumbTo(12)
as(aI.OnRelease,aU)
end
end)
end)
local a1={Title=aI.Title,Frame=aV,Value=aU,Flag=aI.Flag,_handle=a0,
_set=function(a1,a2)a0:Set(a1,a2)end}
return aL(a1)
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local am=
ab.T local an=
ab.tween local ar=
ac.guid
local as=ac.spawnCb
local at=ac.corner
local aw=ac.hairline
local aD=ac.pad local aE=
ac.lighting local aF=
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
end end function a.J():typeof(__modImpl())local aa=a.cache.J if not aa then aa={c=__modImpl()}a.cache.J=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.v()a.g()

local af=a.b()
local as=a.d()

local at=aa
local aw=ab.T
local aD=ab.tween local aH=
ac.guid
local aI=ac.spawnCb
local aJ=ac.corner
local aK=ac.hairline local aL=
ac.pad local aM=
ac.lighting local aQ=
ac.ripple
local aR=ad.makeIcon
af.cloneref_check(game:GetService"RunService")
af.cloneref_check(game:GetService"UserInputService")

local aS=170
local aT=28
local aU=46
local aV=190

return function(aW,aX)
local aY=aW.row
local aZ=aW.titleBlock
local a_=aW.reg
local a0=aW.tab
local a1=aW.Window
local a2=aW.Th local a3=
aW.opts or{}local a4=
aW.page
local b=aW.pgui
aX=aX or{}
local e=aX.Values or aX.Options or{}
local f=aX.Multi or aX.MultipleOptions or false
local g=aX.Value or aX.Default or aX.CurrentOption
if not f and type(g)=="table"then g=g[1]end
if f and type(g)~="table"then g=g and{g}or{}end
local Q=aY(aX.Description and 50 or 40)Q.ClipsDescendants=false
aZ(Q,aX.Title or"Dropdown",nil,200)
local _=Instance.new"TextButton"_.Text=""
_.AnchorPoint=Vector2.new(1,0.5)_.Position=UDim2.new(1,-12,0.5,0)
_.Size=UDim2.new(0,170,0,28)_.BackgroundColor3=a2.Surface2
_.BorderSizePixel=0 aJ(_,7)_.AutoButtonColor=false _.Parent=Q
aK(_,true)
at:_tag(_,"BackgroundColor3","Surface2")
local a5=Instance.new"TextLabel"a5.BackgroundTransparency=1
a5.Position=UDim2.new(0,8,0,0)a5.Size=UDim2.new(1,-28,1,0)
a5.Font=Enum.Font.Gotham a5.TextSize=12 a5.TextXAlignment=0
a5.TextTruncate=Enum.TextTruncate.AtEnd a5.Parent=_
a5.ZIndex=2
at:_tag(a5,"TextColor3","Text")
local a6=aR("chevron",13,a2.Dim)
a6.AnchorPoint=Vector2.new(1,0.5)a6.Position=UDim2.new(1,-8,0.5,0)
a6.Parent=_
local function curText()
if f then return(#g==0 and"None"or table.concat(g,", "))end
return tostring(g or"Select...")
end
a5.Text=curText()
local a7,a8,a9,ba,bb,bc,bd=false
local be,bf,bg=false
local function chevTo(bh)
if bf then pcall(function()bf:Cancel()end)end
bf=aD(a6,aw.Fast,{Rotation=bh})
end
local bh={}
function bh.Set(bi,bj,bk)
g=bj
if not f and type(g)=="table"then g=g[1]end
a5.Text=curText()
if aX.Flag then at.Flags[aX.Flag]=g end
if not bk then aI(aX.Callback,g)aI(aX.OnChanged,g)end
end
function bh.Get(bi)return g end
local function closeList()
if not a7 then return end
a7=false
as.close(closeList)
chevTo(0)
if bc then pcall(function()bc:Disconnect()end)bc=nil end
if bd then
for bi,bj in ipairs(bd)do pcall(function()bj:Disconnect()end)end
bd=nil
end
if a8 then pcall(function()a8:Destroy()end)a8=nil end
if a9 then pcall(function()a9:Destroy()end)a9=nil end
ba,bb=nil,nil
end
function bh.Refresh(bi,bj)
e=bj or{}
closeList()
end
local function renderItems(bi)
if not ba then return end
for bj,bk in ipairs(ba:GetChildren())do
if bk:IsA"TextButton"then pcall(function()bk:Destroy()end)end
end
local bj={}
for bk,bl in ipairs(e)do
local bm=tostring(bl)
if(bi or"")==""or string.find(string.lower(bm),string.lower(bi),1,true)then
table.insert(bj,bm)
end
end
local bk=4
for bl,bm in ipairs(bj)do
local bn=Instance.new"TextButton"bn.Text=""
bn.Size=UDim2.new(1,-8,0,26)bn.Position=UDim2.new(0,4,0,bk)
bn.BackgroundColor3=a2.Surface2 bn.BackgroundTransparency=1
bn.BorderSizePixel=0 aJ(bn,6)bn.Parent=ba
bn.ZIndex=as.Z.Popup+1
local bo=Instance.new"TextLabel"bo.BackgroundTransparency=1
bo.Position=UDim2.new(0,8,0,0)bo.Size=UDim2.new(1,-36,1,0)
bo.Font=Enum.Font.Gotham bo.TextSize=12 bo.TextXAlignment=0
bo.TextTruncate=Enum.TextTruncate.AtEnd bo.Text=bm bo.Parent=bn
bo.ZIndex=as.Z.Popup+2
local bp=f and table.find(g,bm)or g==bm
if bp then

at:_tag(bo,"TextColor3","Accent")
at:_tag(bn,"BackgroundColor3","Surface2")
bn.BackgroundTransparency=0.4
local bq=aR("check",12,a2.Accent)
bq.AnchorPoint=Vector2.new(1,0.5)bq.Position=UDim2.new(1,-8,0.5,0)
bq.Parent=bn
if bq:IsA"GuiObject"then bq.ZIndex=as.Z.Popup+2 end
else
at:_tag(bo,"TextColor3","Text")
end
bn.MouseEnter:Connect(function()bn.BackgroundTransparency=0.4 at:_tag(bn,"BackgroundColor3","Surface2")end)
bn.MouseLeave:Connect(function()if not(f and table.find(g,bm)or g==bm)then bn.BackgroundTransparency=1 end end)
bn.MouseButton1Click:Connect(function()
at:_sfx"Click"
if f then
local bq=table.find(g,bm)
if bq then table.remove(g,bq)else table.insert(g,bm)end
bh:Set(g)
if bb then renderItems(bb.Text)else renderItems""end
else
bh:Set(bm)
closeList()
end
end)
bk+=aT
end

ba.CanvasSize=UDim2.new(0,0,0,math.max(bk+4,1))
local bl=math.clamp(bk+4+36,72,aV+36)
if be then
if bg then pcall(function()bg:Cancel()end)end
bg=aD(a9,aw.Med,{Size=UDim2.new(0,aS,0,bl)})
else
if bg then pcall(function()bg:Cancel()end)bg=nil end
a9.Size=UDim2.new(0,aS,0,bl)
end
return bl
end
local function placeList(bi)
if not a9 or not Q.Parent then return end
local bj,bk=Q.AbsolutePosition,Q.AbsoluteSize
local bl=Vector2.new(1200,800)
pcall(function()bl=workspace.CurrentCamera.ViewportSize end)
local bm=bi or a9.Size.Y.Offset
if bm<1 then bm=120 end
local bn=bj.X+bk.X-aS-12
local bo=bj.Y+aU
if bo+bm>bl.Y-10 then
bo=math.max(10,bj.Y-bm-6)
end
a9.Position=UDim2.fromOffset(bn,bo)
end
local function openList()
if a7 then return end
a7=true
as.open(closeList)
chevTo(180)
a8=as.backdrop(b,closeList)
a9=Instance.new"Frame"
a9.Size=UDim2.new(0,aS,0,0)a9.BackgroundColor3=a2.Bg
a9.BorderSizePixel=0 aJ(a9,8)a9.Parent=b
a9.ZIndex=as.Z.Popup a9.ClipsDescendants=true
aK(a9,true)
at:_tag(a9,"BackgroundColor3","Bg")
bb=Instance.new"TextBox"bb.PlaceholderText="Filter..."
bb.PlaceholderColor3=a2.Dim bb.Text=""
bb.Font=Enum.Font.Gotham bb.TextSize=11
bb.Size=UDim2.new(1,-8,0,24)bb.Position=UDim2.new(0,4,0,4)
bb.BackgroundColor3=a2.Surface2 bb.BorderSizePixel=0
aJ(bb,6)bb.Parent=a9
bb.ZIndex=as.Z.Popup+1
at:_tag(bb,"BackgroundColor3","Surface2")
at:_tag(bb,"TextColor3","Text")
ba=Instance.new"ScrollingFrame"
ba.BackgroundTransparency=1 ba.BorderSizePixel=0
ba.Position=UDim2.new(0,0,0,32)ba.Size=UDim2.new(1,0,1,-32)
ba.ScrollingDirection=Enum.ScrollingDirection.Y
ba.ScrollBarThickness=3 ba.CanvasSize=UDim2.new(0,0,0,0)
ba.ZIndex=as.Z.Popup ba.Parent=a9
ae.tag(ba,"ScrollBarImageColor3","Surface2")
be=true
renderItems""
be=false
local bi=a9.Size.Y.Offset
a9.Size=UDim2.new(0,aS,0,0)
placeList(bi)
if bg then pcall(function()bg:Cancel()end)end
bg=aD(a9,aw.Med,{Size=UDim2.new(0,aS,0,bi)})
bc=bb:GetPropertyChangedSignal"Text":Connect(function()
if a7 then renderItems(bb.Text)end
end)

bd={}
local function follow()
if not a7 then return end
if not Q:IsDescendantOf(game)then closeList()return end
if a1._visible==false then closeList()return end
if a0.Page and a0.Page.Visible==false then closeList()return end
placeList()
end
table.insert(bd,Q:GetPropertyChangedSignal"AbsolutePosition":Connect(follow))
table.insert(bd,Q:GetPropertyChangedSignal"AbsoluteSize":Connect(follow))
if a1._main then
table.insert(bd,a1._main:GetPropertyChangedSignal"AbsolutePosition":Connect(follow))
table.insert(bd,a1._main:GetPropertyChangedSignal"AbsoluteSize":Connect(follow))
end
pcall(function()
table.insert(bd,workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(follow))
end)
end
_.MouseButton1Click:Connect(function()
at:_sfx"Click"
if a7 then closeList()else openList()end
end)
local bi={Title=aX.Title,Frame=Q,Value=g,Flag=aX.Flag,_handle=bh,
_set=function(bi,bj)bh:Set(bi,bj)end}
return a_(bi)
end end function a.K():typeof(__modImpl())local aa=a.cache.K if not aa then aa={c=__modImpl()}a.cache.K=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local as=
ab.T local at=
ab.tween local aw=
ac.guid
local aD=ac.spawnCb
local aI=ac.corner
local aJ=ac.hairline local aK=
ac.pad local aQ=
ac.lighting local aR=
ac.ripple local aS=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local aT=ae.cloneref_check(game:GetService"UserInputService")

return function(aU,aV)
local aW=aU.row
local aX=aU.titleBlock
local aY=aU.reg
local aZ=aU.tab local a_=
aU.Window
local a0=aU.Th local a1=
aU.opts or{}
aV=aV or{}
local a2=aV.Mode or"Toggle"
local a4=aV.Value or aV.Default or Enum.KeyCode.F
if type(a4)=="string"then a4=Enum.KeyCode[a4]or Enum.KeyCode.F end
local a5=aW(aV.Description and 54 or 40)
aX(a5,aV.Title or"Keybind",aV.Description,130)
local a6=Instance.new"TextButton"a6.Font=Enum.Font.GothamBold a6.TextSize=11
a6.AnchorPoint=Vector2.new(1,0.5)a6.Position=UDim2.new(1,-12,0.5,0)
a6.Size=UDim2.new(0,92,0,28)a6.BackgroundColor3=a0.Surface2
a6.BorderSizePixel=0 aI(a6,7)a6.Text=a4.Name a6.Parent=a5
aJ(a6,true)
af:_tag(a6,"BackgroundColor3","Surface2")
af:_tag(a6,"TextColor3","Text")
local a7,a8=false,false
local a9=aV.Locked==true
local function startRebind()
if a9 then return end
a7=true a6.Text="..."
end
a6.MouseButton1Click:Connect(startRebind)
aZ._window:Track(aT.InputBegan:Connect(function(b,ba)
if a9 then return end
if a7 and b.UserInputType==Enum.UserInputType.Keyboard then
a7=false a4=b.KeyCode a6.Text=a4.Name
if aV.Flag then af.Flags[aV.Flag]=a4.Name end
aD(aV.ChangedCallback,a4)aD(aV.OnChanged,a4)
elseif not a7 and not ba and b.KeyCode==a4 then
if a2=="Hold"then a8=true end
aD(aV.Callback,a4)
end
end))
aZ._window:Track(aT.InputEnded:Connect(function(b)
if b.KeyCode==a4 then a8=false end
end))
local b={
Set=function(b,ba)
if type(ba)=="string"then ba=Enum.KeyCode[ba]or a4 end
a4,a6.Text=ba,ba.Name
end,
Get=function()return a4 end,
GetState=function()return a2=="Hold"and a8 or nil end,
Rebind=startRebind,
SetLocked=function(b,ba)
a9=ba and true or false
a7=false
if not a9 then a6.Text=a4.Name end
ac.applyLock(a5,a9)
end,
GetLocked=function()return a9 end,
}

if aZ._window and aZ._window._keybinds then
table.insert(aZ._window._keybinds,{
Title=aV.Title or"Keybind",
GetName=function()return a7 and"..."or a4.Name end,
Rebind=startRebind,
})
if aZ._window._kbPanelRefresh then
task.defer(function()pcall(aZ._window._kbPanelRefresh)end)
end
end
return aY{Title=aV.Title,Frame=a5,_handle=b}
end end function a.L():typeof(__modImpl())local aa=a.cache.L if not aa then aa={c=__modImpl()}a.cache.L=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()
local af=a.d()

local aD=aa
local aI=ab.T
local aJ=ab.tween local aS=
ac.guid
local aT=ac.spawnCb
local aU=ac.corner
local aV=ac.hairline
local aW=ac.pad local aX=
ac.lighting local aY=
ac.ripple local aZ=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local a0=ae.cloneref_check(game:GetService"UserInputService")

local a1="rbxassetid://4155801252"
local a2="http://www.roblox.com/asset/?id=14204231522"

local a4,a5=160,158 local
a6, a7=6, 10
local a8=150
local a9=40
local b=24


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
local bl=bb.Value or bb.Default or Color3.fromRGB(110,140,255)
if type(bl)=="table"then
bl=Color3.new(bl[1]or 0,bl[2]or 0,bl[3]or 0)
end
local bm,bn,bo=bl:ToHSV()
local bp=bb.Transparency or 0
local bq=bl
local e=bc(bb.Description and 54 or 40)e.ClipsDescendants=false
bd(e,bb.Title or"Color",bb.Description,90)
local f=Instance.new"TextButton"f.Text=""
f.AnchorPoint=Vector2.new(1,0.5)f.Position=UDim2.new(1,-12,0.5,0)
f.Size=UDim2.fromOffset(56,26)f.BackgroundColor3=bq
f.BorderSizePixel=0 aU(f,8)f.AutoButtonColor=false f.Parent=e
aV(f,true)
local g={}
local Q,_,br,bs=false
local bt
local bu,bv,bw
local bx,by,bz
local bA,bB,bC,bD,bE,bF
local bG,bH,bI,bJ
local bK,bL,bM=false,false,false
local bN,bO=0
local bP
local bQ={}
local function currentColor()
return Color3.fromHSV(bm,bn,bo)
end
local function colorsClose(bR,bS)
if bR==nil or bS==nil then return false end
return math.abs(bR.R-bS.R)<0.001
and math.abs(bR.G-bS.G)<0.001
and math.abs(bR.B-bS.B)<0.001
end
local function syncFields()
if bx then
bx.Position=UDim2.new(bn,0,1-bo,0)
bx.BackgroundColor3=currentColor()
end
if by then
by.Position=UDim2.new(0.5,0,bm,0)
by.BackgroundColor3=Color3.fromHSV(bm,1,1)
end
if bu then bu.BackgroundColor3=Color3.fromHSV(bm,1,1)end
if bw then
bw.BackgroundColor3=currentColor()
if bz then
bz.Position=UDim2.new(0.5,0,1-bp,0)
bz.BackgroundColor3=currentColor()
bz.BackgroundTransparency=bp
end
end
local bR=currentColor()
local bS=math.floor(bR.R*255+0.5)
local bT=math.floor(bR.G*255+0.5)
local bU=math.floor(bR.B*255+0.5)
if bB and not bB:IsFocused()then bB.Text="#"..bR:ToHex():upper()end
if bC and not bC:IsFocused()then bC.Text=tostring(bS)end
if bD and not bD:IsFocused()then bD.Text=tostring(bT)end
if bE and not bE:IsFocused()then bE.Text=tostring(bU)end
if bF and not bF:IsFocused()then
bF.Text=tostring(math.floor((1-bp)*100+0.5)).."%"
end
if bA then
bA.BackgroundColor3=bR
bA.BackgroundTransparency=bp
end
end
local function push(bR)
bq=currentColor()
aJ(f,aI.Hover,{BackgroundColor3=bq})
if bb.Flag then aD.Flags[bb.Flag]={bq.R,bq.G,bq.B}end
if not bR then aT(bb.Callback,bq,bp)aT(bb.OnChanged,bq,bp)end
end
local function applyColor(bR)
bq=currentColor()

f.BackgroundColor3=bq
if bb.Flag then aD.Flags[bb.Flag]={bq.R,bq.G,bq.B}end
syncFields()
if bR then
local bS=currentColor()
if not colorsClose(bS,bP)then
bP=bS
aT(bb.Callback,bS,bp)aT(bb.OnChanged,bS,bp)
end
end
end
function g.Set(bR,bS,bT,bU)
if type(bS)=="table"and typeof(bS)~="Color3"then
bS=Color3.new(bS[1]or 0,bS[2]or 0,bS[3]or 0)
end
if typeof(bS)=="Color3"then
if type(bT)=="boolean"and bU==nil then
bU=bT
elseif type(bT)=="number"then
bp=math.clamp(bT,0,1)
end
bm,bn,bo=bS:ToHSV()
push(bU)
syncFields()
end
end
function g.Get(bR)return bq,bp end
local function closePopup()
if not Q then return end
Q=false
af.close(closePopup)
bK,bL,bM=false,false,false
bO=nil
for bR,bS in ipairs(bQ)do pcall(function()bS:Disconnect()end)end
bQ={}
if bs then
for bR,bS in ipairs(bs)do pcall(function()bS:Disconnect()end)end
bs=nil
end
if br then pcall(function()br:Destroy()end)br=nil end
if _ then
local bR=_
_=nil
if bt then pcall(function()bt:Cancel()end)end
bt=aJ(bR,aI.Fast,{Size=UDim2.new(0,bR.Size.X.Offset,0,0)})
task.delay(0.2,function()pcall(function()bR:Destroy()end)end)
end
bx,by,bz=nil,nil,nil
bu,bv,bw=nil,nil,nil
bA=nil
bB,bC,bD,bE,bF=nil,nil,nil,nil,nil
end
local function updateSV(bR)
if not bu or bu.AbsoluteSize.X<=0 then return end
local bS,bT=bu.AbsolutePosition,bu.AbsoluteSize
bn=math.clamp((bR.X-bS.X)/bT.X,0,1)
bo=1-math.clamp((bR.Y-bS.Y)/bT.Y,0,1)
applyColor(true)
end
local function updateHue(bR)
if not bv or bv.AbsoluteSize.Y<=0 then return end
local bS,bT=bv.AbsolutePosition,bv.AbsoluteSize
bm=math.clamp((bR.Y-bS.Y)/bT.Y,0,1)
applyColor(true)
end
local function updateAlpha(bR)
if not bw or bw.AbsoluteSize.Y<=0 then return end
local bS,bT=bw.AbsolutePosition,bw.AbsoluteSize
bp=1-math.clamp((bR.Y-bS.Y)/bT.Y,0,1)
applyColor(true)
end
local function requestClose()
if bK or bL or bM then return end
if os.clock()-bN<0.2 then return end
closePopup()
end



local function placePopup(bR,bS)
if not _ then return end
local bT=Vector2.new(1200,800)
pcall(function()bT=workspace.CurrentCamera.ViewportSize end)
local bU=12
local bV=bg._main
if bV and bV.Parent and bV.AbsoluteSize.X>0 then
local bW,bX=bV.AbsolutePosition,bV.AbsoluteSize



local bY=_.AbsoluteSize.Y
if bY<1 then bY=bS end
local bZ=math.clamp(bW.Y+(bX.Y-bY)/2,10,math.max(10,bT.Y-bY-10))
local b_=bW.X+bX.X+bU
if b_+bR>bT.X-10 then
b_=bW.X-bR-bU
if b_<10 then
b_=math.clamp(bW.X+bX.X/2-bR/2,10,math.max(10,bT.X-bR-10))
end
end



local b0=bg._popouts
if b0 then
for b1,b2 in ipairs(b0)do
local b3=b2.frame
if b3 and b3.Visible and b3.Parent then
local b4,b5=b3.AbsolutePosition,b3.AbsoluteSize
if b5.X>0 and b_<b4.X+b5.X+bU and b_+bR>b4.X
and bZ<b4.Y+b5.Y and bZ+bY>b4.Y then
b_=b4.X+b5.X+bU
bZ=math.clamp(b4.Y,10,math.max(10,bT.Y-bY-10))
end
end
end
if b_+bR>bT.X-10 then
b_=math.max(10,bT.X-bR-10)
end
end
_.Position=UDim2.fromOffset(b_,bZ)
return
end

if not e.Parent then return end
local bW,bX=e.AbsolutePosition,e.AbsoluteSize
local bY=bW.X+bX.X-bR-12
if bY<10 then bY=math.max(10,bW.X-bR-8)end
local bZ=bW.Y+46
if bZ+bS>bT.Y-10 then bZ=math.max(10,bW.Y-bS-6)end
_.Position=UDim2.fromOffset(bY,bZ)
end
local function openPopup()
if Q then return end
Q=true
bG,bH,bI=bm,bn,bo
bJ=bp
bP=currentColor()
af.open(closePopup)
aD:_sfx"Click"

local bR=12
local bS=bR+a4+a7
local bT=bS+a6+a7
local bU=bT+a6+a7
local bV=bU+a8+bR
local bW=a9+a5+a7
local bX=bW+b+a7+22
local bY=bX+32+bR
br=af.backdrop(bk,requestClose)
_=Instance.new"Frame"
_.Name=ae.GetStealthName()
_.BackgroundColor3=bh.Bg
_.BackgroundTransparency=1
_.BorderSizePixel=0
_.ClipsDescendants=true
_.ZIndex=af.Z.Popup
_.Size=UDim2.new(0,bV,0,0)
_.Parent=bk
aU(_,10)
aV(_,true)
aD:_tag(_,"BackgroundColor3","Bg")
placePopup(bV,bY)
local bZ=Instance.new"TextLabel"bZ.BackgroundTransparency=1
bZ.Position=UDim2.new(0,bR,0,6)bZ.Size=UDim2.new(1,-bR*2,0,22)
bZ.Font=Enum.Font.GothamBold bZ.TextSize=14 bZ.TextXAlignment=0
bZ.TextTruncate=Enum.TextTruncate.AtEnd bZ.Text=bb.Title or"Color"
bZ.Parent=_
bZ.ZIndex=af.Z.Popup+1
aD:_tag(bZ,"TextColor3","Text")

bu=Instance.new"ImageLabel"
bu.Position=UDim2.new(0,bR,0,a9)
bu.Size=UDim2.fromOffset(a4,a5)
bu.BackgroundColor3=Color3.fromHSV(bm,1,1)
bu.BackgroundTransparency=0
bu.Image=a1
bu.ScaleType=Enum.ScaleType.Stretch
bu.BorderSizePixel=0
bu.ClipsDescendants=true
bu.ZIndex=af.Z.Popup+1
bu.Parent=_
aU(bu,8)
aV(bu,true)
bx=Instance.new"Frame"
bx.AnchorPoint=Vector2.new(0.5,0.5)
bx.Position=UDim2.new(bn,0,1-bo,0)
bx.Size=UDim2.fromOffset(14,14)
bx.BackgroundColor3=currentColor()
bx.BorderSizePixel=0
bx.ZIndex=af.Z.Popup+3
bx.Parent=bu
aU(bx,99)
local b_=Instance.new"UIStroke"b_.Thickness=2
b_.Color=Color3.fromRGB(255,255,255)b_.Transparency=0.1
b_.Parent=bx

bv=Instance.new"Frame"
bv.Position=UDim2.new(0,bS,0,a9)
bv.Size=UDim2.fromOffset(a6,a5+14)
bv.BackgroundColor3=Color3.fromRGB(255,255,255)
bv.BorderSizePixel=0
bv.ClipsDescendants=true
bv.ZIndex=af.Z.Popup+1
bv.Parent=_
aU(bv,3)
local b0=Instance.new"UIGradient"b0.Rotation=90
b0.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
}
b0.Parent=bv
by=Instance.new"Frame"
by.AnchorPoint=Vector2.new(0.5,0.5)
by.Position=UDim2.new(0.5,0,bm,0)
by.Size=UDim2.fromOffset(14,14)
by.BackgroundColor3=Color3.fromHSV(bm,1,1)
by.BorderSizePixel=0
by.ZIndex=af.Z.Popup+3
by.Parent=bv
aU(by,99)
local b1=Instance.new"UIStroke"b1.Thickness=2
b1.Color=Color3.fromRGB(255,255,255)b1.Transparency=0.1
b1.Parent=by

bw=Instance.new"Frame"
bw.Position=UDim2.new(0,bT,0,a9)
bw.Size=UDim2.fromOffset(a6,a5+14)
bw.BackgroundColor3=currentColor()
bw.BorderSizePixel=0
bw.ClipsDescendants=true
bw.ZIndex=af.Z.Popup+1
bw.Parent=_
aU(bw,3)
aV(bw,true)
local b2=Instance.new"ImageLabel"
b2.Image=a2
b2.ImageTransparency=0.45
b2.ScaleType=Enum.ScaleType.Tile
b2.TileSize=UDim2.fromOffset(40,40)
b2.BackgroundTransparency=1
b2.Size=UDim2.fromScale(1,1)
b2.ZIndex=af.Z.Popup+1
b2.Parent=bw
aU(b2,3)
local b3=Instance.new"Frame"
b3.Size=UDim2.fromScale(1,1)
b3.BackgroundColor3=Color3.fromRGB(255,255,255)
b3.BorderSizePixel=0
b3.ZIndex=af.Z.Popup+2
b3.Parent=bw
aU(b3,3)
local b4=Instance.new"UIGradient"b4.Rotation=90
b4.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
b4.Parent=b3
bz=Instance.new"Frame"
bz.AnchorPoint=Vector2.new(0.5,0.5)
bz.Position=UDim2.new(0.5,0,1-bp,0)
bz.Size=UDim2.fromOffset(14,14)
bz.BackgroundColor3=currentColor()
bz.BackgroundTransparency=bp
bz.BorderSizePixel=0
bz.ZIndex=af.Z.Popup+3
bz.Parent=bw
aU(bz,99)

local b5=(a4-a7)/2
local function checkerSw(b6)
local b7=Instance.new"ImageLabel"
b7.Image=a2
b7.ImageTransparency=0.45
b7.ScaleType=Enum.ScaleType.Tile
b7.TileSize=UDim2.fromOffset(40,40)
b7.BackgroundTransparency=1
b7.Position=UDim2.new(0,b6,0,bW)
b7.Size=UDim2.fromOffset(b5,b)
b7.ZIndex=af.Z.Popup+1
b7.Parent=_
aU(b7,8)
aV(b7,true)
return b7
end
local b6=checkerSw(bR)
bA=Instance.new"Frame"
bA.BackgroundColor3=currentColor()
bA.BackgroundTransparency=bp
bA.Size=UDim2.fromScale(1,1)
bA.ZIndex=af.Z.Popup+2
bA.Parent=b6
aU(bA,8)
local b7=checkerSw(bR+b5+a7)
local b8=Instance.new"Frame"
b8.BackgroundColor3=Color3.fromHSV(bG or bm,bH or bn,bI or bo)
b8.BackgroundTransparency=(bJ==nil)and bp or bJ
b8.Size=UDim2.fromScale(1,1)
b8.ZIndex=af.Z.Popup+2
b8.Parent=b7
aU(b8,8)

local b9=bU
local function makeInput(ca,cb,cc)
local cd=Instance.new"Frame"
cd.BackgroundTransparency=1
cd.Position=UDim2.new(0,b9,0,cc)
cd.Size=UDim2.new(0,a8,0,36)
cd.ZIndex=af.Z.Popup+1
cd.Parent=_
local ce=Instance.new"TextLabel"
ce.BackgroundTransparency=1
ce.Font=Enum.Font.Gotham ce.TextSize=11
ce.TextXAlignment=0 ce.Text=ca
ce.Size=UDim2.new(1,0,0,12)
ce.ZIndex=af.Z.Popup+2
ce.Parent=cd
aD:_tag(ce,"TextColor3","Dim")
local cf=Instance.new"Frame"
cf.Position=UDim2.new(0,0,0,12)
cf.Size=UDim2.new(1,0,0,24)
cf.BackgroundColor3=bh.Surface2
cf.BackgroundTransparency=0
cf.BorderSizePixel=0
cf.ZIndex=af.Z.Popup+2
cf.Parent=cd
aU(cf,7)
aV(cf,true)
aD:_tag(cf,"BackgroundColor3","Surface2")
local cg=Instance.new"TextBox"
cg.ClearTextOnFocus=false
cg.Font=Enum.Font.Code cg.TextSize=13
cg.TextXAlignment=1 cg.TextYAlignment=1
cg.Text=cb
cg.BackgroundTransparency=1
cg.Size=UDim2.fromScale(1,1)
cg.ZIndex=af.Z.Popup+3
cg.Parent=cf
aD:_tag(cg,"TextColor3","Text")
aW(cg,0,0,0,8)
return cd,cg
end
local ca=currentColor()
local cb=math.floor(ca.R*255+0.5)
local cc=math.floor(ca.G*255+0.5)
local cd=math.floor(ca.B*255+0.5)
local ce=a9
local cf=4 local
cg, ch=makeInput("Hex","#"..ca:ToHex():upper(),ce)
bB=ch
ce+=36+cf local
ci, cj=makeInput("Red",tostring(cb),ce)
bC=cj
ce+=36+cf local
ck, cl=makeInput("Green",tostring(cc),ce)
bD=cl
ce+=36+cf local
cm, cn=makeInput("Blue",tostring(cd),ce)
bE=cn
ce+=36+cf local
co, cp=makeInput("Alpha",tostring(math.floor((1-bp)*100+0.5)).."%",ce)
bF=cp


local cq=bV-bR*2
local cr=(cq-6)/2
local cs=32
local function makeBtn(ct,cu,cv,cw)
local cx=Instance.new"TextButton"
cx.Position=UDim2.new(0,cu,0,bX)
cx.Size=UDim2.fromOffset(cv,cs)
cx.Text=""
cx.AutoButtonColor=false
cx.BorderSizePixel=0
cx.ZIndex=af.Z.Popup+2
cx.BackgroundColor3=bh.Surface2
aV(cx,true)
aD:_tag(cx,"BackgroundColor3","Surface2")
cx.Parent=_
aU(cx,9)
local cy=Instance.new"TextLabel"
cy.BackgroundTransparency=1 cy.Size=UDim2.fromScale(1,1)
cy.Font=Enum.Font.GothamBold cy.TextSize=12
cy.Text=string.upper(ct)cy.Parent=cx
cy.ZIndex=af.Z.Popup+3
if cw then aD:_tag(cy,"TextColor3","Accent")
else aD:_tag(cy,"TextColor3","Text")end
return cx,cy
end
local ct=makeBtn("Cancel",bR,cr,false)
local cu=makeBtn("Apply",bR+cr+6,cr,true)
ct.MouseButton1Click:Connect(function()
bm,bn,bo=bG,bH,bI
bp=bJ
applyColor(true)
closePopup()
end)
cu.MouseButton1Click:Connect(function()
aD:_sfx"Click"
closePopup()
end)

bu.InputBegan:Connect(function(cv)
if cv.UserInputType==Enum.UserInputType.MouseButton1
or cv.UserInputType==Enum.UserInputType.Touch then
if bK or bL or bM then return end
bK=true
bO=cv
updateSV(cv.Position)
end
end)
bv.InputBegan:Connect(function(cv)
if cv.UserInputType==Enum.UserInputType.MouseButton1
or cv.UserInputType==Enum.UserInputType.Touch then
if bK or bL or bM then return end
bL=true
bO=cv
updateHue(cv.Position)
end
end)
bw.InputBegan:Connect(function(cv)
if cv.UserInputType==Enum.UserInputType.MouseButton1
or cv.UserInputType==Enum.UserInputType.Touch then
if bK or bL or bM then return end
bM=true
bO=cv
updateAlpha(cv.Position)
end
end)
table.insert(bQ,a0.InputChanged:Connect(function(cv)
if not _ then return end
if cv~=bO
and not(bO and bO.UserInputType==Enum.UserInputType.MouseButton1
and cv.UserInputType==Enum.UserInputType.MouseMovement)then
return
end
if bK then updateSV(cv.Position)end
if bL then updateHue(cv.Position)end
if bM then updateAlpha(cv.Position)end
end))
table.insert(bQ,a0.InputEnded:Connect(function(cv)
if cv==bO
or(bO and bO.UserInputType==Enum.UserInputType.MouseButton1
and cv.UserInputType==Enum.UserInputType.MouseButton1)then
if bK or bL or bM then
bN=os.clock()
end
bK,bL,bM=false,false,false
bO=nil
end
end))
bB:GetPropertyChangedSignal"Text":Connect(function()
if not _ then return end
local cv=bB.Text:gsub("[^%x]","")
cv=cv:sub(1,6)
if cv~=bB.Text then bB.Text=cv end
end)
bB.FocusLost:Connect(function()
if not _ then return end
local cv=bB.Text:gsub("#","")
if#cv==3 then
cv=cv:sub(1,1):rep(2)..cv:sub(2,2):rep(2)..cv:sub(3,3):rep(2)
end
if#cv==6 then
local cw,cx=pcall(Color3.fromHex,cv)
if cw and cx then
bm,bn,bo=cx:ToHSV()
applyColor(true)
return
end
end
syncFields()
end)
local function filterDigits(cv)
cv:GetPropertyChangedSignal"Text":Connect(function()
if not _ then return end
local cw=cv.Text:gsub("%D",""):sub(1,3)
if cw~=cv.Text then cv.Text=cw end
end)
end
filterDigits(bC)filterDigits(bD)filterDigits(bE)
local function onRGBCommit()
if not _ then return end
local cv=math.clamp(tonumber(bC.Text)or 0,0,255)
local cw=math.clamp(tonumber(bD.Text)or 0,0,255)
local cx=math.clamp(tonumber(bE.Text)or 0,0,255)
bm,bn,bo=Color3.toHSV(Color3.fromRGB(cv,cw,cx))
applyColor(true)
end
bC.FocusLost:Connect(onRGBCommit)
bD.FocusLost:Connect(onRGBCommit)
bE.FocusLost:Connect(onRGBCommit)
bF.FocusLost:Connect(function()
if not _ then return end
local cv=bF.Text:gsub("%%","")
local cw=math.clamp(tonumber(cv)or 0,0,100)
bp=1-cw/100
applyColor(true)
end)
syncFields()
if bt then pcall(function()bt:Cancel()end)end
bt=aJ(_,TweenInfo.new(0.44,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Size=UDim2.new(0,bV,0,bY),BackgroundTransparency=0})

bs={}
local function follow()
if not Q then return end
if not e:IsDescendantOf(game)then closePopup()return end
if bg._visible==false then closePopup()return end
if bf.Page and bf.Page.Visible==false then closePopup()return end
placePopup(bV,bY)
end
table.insert(bs,e:GetPropertyChangedSignal"AbsolutePosition":Connect(follow))
table.insert(bs,e:GetPropertyChangedSignal"AbsoluteSize":Connect(follow))
if bg._main then
table.insert(bs,bg._main:GetPropertyChangedSignal"AbsolutePosition":Connect(follow))
table.insert(bs,bg._main:GetPropertyChangedSignal"AbsoluteSize":Connect(follow))
end
pcall(function()
table.insert(bs,workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(follow))
end)
end
f.MouseButton1Click:Connect(function()
if Q then closePopup()else openPopup()end
end)
local bR={Title=bb.Title,Frame=e,Value=bq,Flag=bb.Flag,_handle=g,
_set=function(bR,bS)g:Set(bR,bS)end}
return be(bR)
end end function a.M():typeof(__modImpl())local aa=a.cache.M if not aa then aa={c=__modImpl()}a.cache.M=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local aD=
ab.T local aI=
ab.tween local aJ=
ac.guid local aT=
ac.spawnCb
local aU=ac.corner
local aV=ac.hairline
local aW=ac.pad local aZ=
ac.lighting local a0=
ac.ripple
local a1=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a2,a4)
local a5=a2.row local a6=
a2.titleBlock
local a7=a2.reg
local a8=a2.tab local a9=
a2.Window
local b=a2.Th local ba=
a2.opts or{}
a4=a4 or{}
local bb=a8._window
local bc=a5(196)
local bd=Instance.new"TextLabel"bd.BackgroundTransparency=1
bd.Position=UDim2.new(0,12,0,6)bd.Size=UDim2.new(1,-24,0,17)
bd.Font=Enum.Font.GothamMedium bd.TextSize=13 bd.TextXAlignment=0
bd.Text=a4.Title or"Profiles"bd.Parent=bc
af:_tag(bd,"TextColor3","Text")
local be=Instance.new"TextBox"be.PlaceholderText="Profile name..."
be.PlaceholderColor3=b.Dim be.Text="default"
be.Font=Enum.Font.Gotham be.TextSize=12
be.Position=UDim2.new(0,12,0,28)be.Size=UDim2.new(1,-94,0,28)
be.BackgroundColor3=b.Surface2 be.BorderSizePixel=0
aU(be,7)be.Parent=bc
aW(be,4,4,8,8)
aV(be,true)
af:_tag(be,"BackgroundColor3","Surface2")
af:_tag(be,"TextColor3","Text")
local bf=Instance.new"TextButton"bf.Text=""
bf.AnchorPoint=Vector2.new(1,0)bf.Position=UDim2.new(1,-12,0,28)
bf.Size=UDim2.new(0,70,0,28)bf.BorderSizePixel=0
aU(bf,7)bf.AutoButtonColor=false bf.Parent=bc
af:_tag(bf,"BackgroundColor3","Accent")
local bg=Instance.new"TextLabel"bg.BackgroundTransparency=1
bg.Size=UDim2.fromScale(1,1)bg.Font=Enum.Font.GothamBold
bg.TextSize=11 bg.Text="SAVE"
af:oa(bg)bg.Parent=bf
local bh=Instance.new"ScrollingFrame"
bh.Position=UDim2.new(0,12,0,62)bh.Size=UDim2.new(1,-24,1,-70)
bh.BackgroundTransparency=1 bh.BorderSizePixel=0
bh.ScrollBarThickness=2 bh.CanvasSize=UDim2.new(0,0,0,0)
bh.AutomaticCanvasSize=Enum.AutomaticSize.Y bh.Parent=bc
af:_tag(bh,"ScrollBarImageColor3","Surface2")
local bj=Instance.new"UIListLayout"bj.Padding=UDim.new(0,4)
bj.SortOrder=Enum.SortOrder.LayoutOrder bj.Parent=bh
local function folder()
return"Kronos/"..tostring(bb and bb._cfgTitle or"Kronos")
end
local function profiles()
local bk={}
pcall(function()
if listfiles and isfolder and isfolder(folder())then
for bl,bm in ipairs(listfiles(folder()))do
local bn=string.match(bm,"([^/\\]+)%.json$")
if bn then table.insert(bk,bn)end
end
end
end)
table.sort(bk)
return bk
end
local function refresh()
for bk,bl in ipairs(bh:GetChildren())do
if bl:IsA"TextButton"then pcall(function()bl:Destroy()end)end
end
local bk=profiles()
if#bk==0 then
local bl=Instance.new"TextLabel"bl.BackgroundTransparency=1
bl.Size=UDim2.new(1,0,0,22)bl.Font=Enum.Font.Gotham
bl.TextSize=11 bl.Text="No saved profiles"bl.Parent=bh
af:_tag(bl,"TextColor3","Dim")
return
end
for bl,bm in ipairs(bk)do
local bn=Instance.new"TextButton"bn.Text=""
bn.Size=UDim2.new(1,-2,0,28)bn.BackgroundColor3=b.Surface2
bn.BackgroundTransparency=0.35 bn.BorderSizePixel=0
aU(bn,7)bn.Parent=bh
af:_tag(bn,"BackgroundColor3","Surface2")
local bo=Instance.new"TextLabel"bo.BackgroundTransparency=1
bo.Position=UDim2.new(0,8,0,0)bo.Size=UDim2.new(1,-44,1,0)
bo.Font=Enum.Font.Gotham bo.TextSize=12 bo.TextXAlignment=0
bo.TextTruncate=Enum.TextTruncate.AtEnd bo.Text=bm bo.Parent=bn
af:_tag(bo,"TextColor3","Text")
local bp=Instance.new"TextButton"bp.Text=""
bp.AnchorPoint=Vector2.new(1,0.5)bp.Position=UDim2.new(1,-6,0.5,0)
bp.Size=UDim2.fromOffset(22,22)bp.BackgroundTransparency=1 bp.Parent=bn
local bq=a1("x",11,b.Dim)
bq.AnchorPoint=Vector2.new(0.5,0.5)bq.Position=UDim2.new(0.5,0,0.5,0)
bq.Parent=bp
bn.MouseButton1Click:Connect(function()
af:_sfx"Click"bb:LoadConfig(bm)
end)
bp.MouseButton1Click:Connect(function()
pcall(function()if delfile then delfile(folder().."/"..bm..".json")end end)
bb:Notify{Title="Profile deleted",Content=bm,Duration=2}
refresh()
end)
end
end
bf.MouseButton1Click:Connect(function()
af:_sfx"Click"
local bk=be.Text~=""and be.Text or"default"
bb:SaveConfig(bk)refresh()
end)
refresh()
return a7{Title=a4.Title or"Profiles",Frame=bc,_handle={Refresh=refresh}}
end end function a.N():typeof(__modImpl())local aa=a.cache.N if not aa then aa={c=__modImpl()}a.cache.N=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local aU=ab.T
local aV=ab.tween local aW=
ac.guid
local a0=ac.spawnCb
local a1=ac.corner
local a2=ac.hairline local a4=
ac.pad
local a5=ac.lighting
local a7=ac.ripple
local a8=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b,ba)local bb=
b.row local bc=
b.titleBlock
local bd=b.reg
local be=b.tab local bf=
b.Window
local bg=b.Th local bh=
b.opts or{}
ba=ba or{}
local bj=Instance.new"Frame"bj.Size=UDim2.new(1,-4,0,96)
bj.BackgroundColor3=bg.Surface2 bj.BorderSizePixel=0
a1(bj,10)bj.Parent=b.getParent()
a2(bj,true)
af:_tag(bj,"BackgroundColor3","Surface2")
a5(bj,10)

local bk=Instance.new"Frame"bk.BorderSizePixel=0
bk.Position=UDim2.new(0,0,0,18)bk.Size=UDim2.new(0,3,1,-36)
a1(bk,99)bk.Parent=bj
af:_tag(bk,"BackgroundColor3","Accent")
local bl=a8(ba.Icon or"bellring",18,bg.Accent)
bl.AnchorPoint=Vector2.new(0,0.5)bl.Position=UDim2.new(0,14,0,48)
bl.Parent=bj
if bl:IsA"TextLabel"then bl.Size=UDim2.new(0,18,0,18)end

local bm=ba.Button and-142 or-54
local bn=Instance.new"TextLabel"bn.BackgroundTransparency=1
bn.Position=UDim2.new(0,42,0,16)bn.Size=UDim2.new(1,bm,0,18)
bn.Font=Enum.Font.GothamBold bn.TextSize=14 bn.TextXAlignment=0
bn.TextTruncate=Enum.TextTruncate.AtEnd bn.Text=ba.Title or"News"bn.Parent=bj
af:_tag(bn,"TextColor3","Text")
local bo=Instance.new"TextLabel"bo.BackgroundTransparency=1
bo.Position=UDim2.new(0,42,0,38)bo.Size=UDim2.new(1,bm,0,42)
bo.Font=Enum.Font.Gotham bo.TextSize=12 bn.TextXAlignment=0
bo.TextXAlignment=0 bo.TextYAlignment=0 bo.TextWrapped=true
bo.TextTruncate=Enum.TextTruncate.AtEnd bo.Text=ba.Content or""bo.Parent=bj
af:_tag(bo,"TextColor3","Dim")
if ba.Button then
local bp=Instance.new"TextButton"bp.Text=""
bp.AnchorPoint=Vector2.new(1,0.5)bp.Position=UDim2.new(1,-12,0,48)
bp.Size=UDim2.new(0,76,0,30)bp.BorderSizePixel=0
a1(bp,7)bp.AutoButtonColor=false bp.Parent=bj
af:agrad(bp,15)
local bq=Instance.new"TextLabel"bq.BackgroundTransparency=1
bq.Size=UDim2.fromScale(1,1)bq.Font=Enum.Font.GothamBold
bq.TextSize=11
bq.Text=string.upper(ba.Button)bq.Parent=bp
af:oa(bq)
a7(bp)
bp.MouseButton1Click:Connect(function()
af:_sfx"Click"a0(ba.Callback)
end)
end
bj.BackgroundTransparency=1
task.delay(math.min(#be.Elements*0.025,0.3),function()
aV(bj,aU.Med,{BackgroundTransparency=0})
end)
return bd{Title=ba.Title,Frame=bj,_handle=bj}
end end function a.O():typeof(__modImpl())local aa=a.cache.O if not aa then aa={c=__modImpl()}a.cache.O=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local aU=
ab.T local aV=
ab.tween local a0=
ac.guid local a1=
ac.spawnCb
local a2=ac.corner
local a4=ac.hairline local a5=
ac.pad
local a7=ac.lighting local a8=
ac.ripple local b=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(ba,bd)local be=
ba.row local bg=
ba.titleBlock
local bh=ba.reg local bj=
ba.tab local bk=
ba.Window
local bl=ba.Th local bm=
ba.opts or{}
bd=bd or{}
local bn=bd.Stats or bd.Items or{}
local bo=math.max(1,#bn)
local bp=Instance.new"Frame"bp.BackgroundTransparency=1
bp.Size=UDim2.new(1,-4,0,64)bp.Parent=ba.getParent()
local bq=Instance.new"UIListLayout"bq.FillDirection=Enum.FillDirection.Horizontal
bq.Padding=UDim.new(0,8)bq.SortOrder=Enum.SortOrder.LayoutOrder bq.Parent=bp
local br={}
for bs,bt in ipairs(bn)do
local bu=Instance.new"Frame"
bu.Size=UDim2.new(1/bo,-8,1,0)
bu.BackgroundColor3=bl.Surface bu.BorderSizePixel=0
a2(bu,10)bu.LayoutOrder=bs bu.Parent=bp
a4(bu,true)
af:_tag(bu,"BackgroundColor3","Surface")
a7(bu,10)
local bv=Instance.new"TextLabel"bv.BackgroundTransparency=1
bv.Position=UDim2.new(0,0,0,10)bv.Size=UDim2.new(1,0,0,20)
bv.Font=Enum.Font.GothamBold bv.TextSize=16 bv.Text=tostring(bt.Value or"-")
bv.Parent=bu
af:_tag(bv,"TextColor3",bt.Accent and"Accent"or"Text")
local bw=Instance.new"TextLabel"bw.BackgroundTransparency=1
bw.Position=UDim2.new(0,0,0,32)bw.Size=UDim2.new(1,0,0,14)
bw.Font=Enum.Font.GothamBold bw.TextSize=9
bw.Text=string.upper(bt.Label or"")bw.Parent=bu
af:_tag(bw,"TextColor3","Dim")
br[bt.Label or bs]={Set=function(bx,by)bv.Text=tostring(by)end,Frame=bu}
end
return bh{Title=bd.Title or"Stats",Frame=bp,_handle=br}
end end function a.P():typeof(__modImpl())local aa=a.cache.P if not aa then aa={c=__modImpl()}a.cache.P=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local a2=
ab.T local a4=
ab.tween local a7=
ac.guid local b=
ac.spawnCb
local ba=ac.corner local bd=
ac.hairline local bh=
ac.pad local bl=
ac.lighting local bm=
ac.ripple local bn=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bo,bp)local bq=
bo.row local br=
bo.titleBlock
local bs=bo.reg local bt=
bo.tab local bu=
bo.Window
local bv=bo.Th local bw=
bo.opts or{}
bp=bp or{}
local bx=math.clamp(bp.Lines or 3,1,6)
local by=Instance.new"Frame"by.BackgroundTransparency=1
by.Size=UDim2.new(1,-4,0,bx*18+8)by.Parent=bo.getParent()
for bz=1,bx do
local bA=Instance.new"Frame"bA.BorderSizePixel=0
bA.Position=UDim2.new(0,0,0,(bz-1)*18)
bA.Size=UDim2.new(bz==bx and 0.6 or 1,0,0,12)
bA.BackgroundColor3=bv.Surface2 ba(bA,6)bA.Parent=by
af:_tag(bA,"BackgroundColor3","Surface2")
local bB=Instance.new"Frame"bB.Name="_sheen"bB.BorderSizePixel=0
bB.Size=UDim2.new(0.35,0,1,0)bB.BackgroundColor3=Color3.fromRGB(255,255,255)
bB.BackgroundTransparency=0.88 ba(bB,6)bB.Parent=bA
bA.ClipsDescendants=true
end
task.spawn(function()
local bz=0
while by.Parent do
bz+=0.03 task.wait(0.03)
for bA,bB in ipairs(by:GetChildren())do
if bB:IsA"Frame"then
for bC,bD in ipairs(bB:GetChildren())do
if bD.Name=="_sheen"then
local bE=((bz*0.9)%1.4)-0.2
pcall(function()bD.Position=UDim2.new(bE,0,0,0)end)
end
end
end
end
end
end)
return bs{Title=bp.Title or"Loading",Frame=by,_handle=by}
end end function a.Q():typeof(__modImpl())local aa=a.cache.Q if not aa then aa={c=__modImpl()}a.cache.Q=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local ba=
ab.T
local bn=ab.tween local bo=
ac.guid local bp=
ac.spawnCb
local bs=ac.corner local bv=
ac.hairline local bw=
ac.pad local bx=
ac.lighting local by=
ac.ripple local bz=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bA,bB)
local bC=bA.row
local bD=bA.titleBlock
local bE=bA.reg local bF=
bA.tab local bG=
bA.Window local bH=
bA.Th local bI=
bA.opts or{}
bB=bB or{}
local bJ={online="Success",idle="Warn",offline="Danger",busy="Accent"}
local bK=string.lower(bB.State or"online")
local bL=bC(bB.Description and 54 or 40)
bD(bL,bB.Title or"Status",bB.Description)
local bM=Instance.new"Frame"bM.AnchorPoint=Vector2.new(1,0.5)
bM.Position=UDim2.new(1,-84,0.5,0)bM.Size=UDim2.fromOffset(10,10)
bM.BorderSizePixel=0 bs(bM,99)bM.Parent=bL
af:_tag(bM,"BackgroundColor3",bJ[bK]or"Success")
local bN=Instance.new"TextLabel"bN.BackgroundTransparency=1
bN.AnchorPoint=Vector2.new(1,0.5)bN.Position=UDim2.new(1,-12,0.5,0)
bN.Size=UDim2.new(0,56,0,16)bN.Font=Enum.Font.GothamBold
bN.TextSize=10 bN.TextXAlignment=1 bN.Text=string.upper(bK)bN.Parent=bL
af:_tag(bN,"TextColor3","Dim")
task.spawn(function()
while bM.Parent do
if bM.Visible and not af.ReducedMotion then
bn(bM,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0.55})
task.wait(1.25)
if not bM.Parent then break end
bn(bM,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
{BackgroundTransparency=0})
end
task.wait(1.25)
end
end)
local bO={}
function bO.Set(bP,bQ)
bK=string.lower(bQ)
af:_tag(bM,"BackgroundColor3",bJ[bK]or"Success")
bN.Text=string.upper(bK)
end
return bE{Title=bB.Title,Frame=bL,_handle=bO}
end end function a.R():typeof(__modImpl())local aa=a.cache.R if not aa then aa={c=__modImpl()}a.cache.R=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local bn=
ab.T local bs=
ab.tween local bz=
ac.guid local bA=
ac.spawnCb local bB=
ac.corner local bC=
ac.hairline local bD=
ac.pad local bE=
ac.lighting local bI=
ac.ripple
local bJ=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bK,bL)local bM=
bK.row local bN=
bK.titleBlock
local bO=bK.reg local bP=
bK.tab local bQ=
bK.Window
local bR=bK.Th local bS=
bK.opts or{}
bL=bL or{}
local bT=Instance.new"Frame"bT.BackgroundTransparency=1
bT.Size=UDim2.new(1,-4,0,130)bT.Parent=bK.getParent()
local bU=bJ(bL.Icon or"box",30,bR.Dim)
bU.AnchorPoint=Vector2.new(0.5,0)bU.Position=UDim2.new(0.5,0,0,18)
bU.Parent=bT
if bU:IsA"TextLabel"then bU.Size=UDim2.new(0,30,0,30)end
local bV=Instance.new"TextLabel"bV.BackgroundTransparency=1
bV.Position=UDim2.new(0,0,0,56)bV.Size=UDim2.new(1,0,0,20)
bV.Font=Enum.Font.GothamBold bV.TextSize=14 bV.Text=bL.Title or"Nothing here"
bV.Parent=bT
af:_tag(bV,"TextColor3","Text")
local bW=Instance.new"TextLabel"bW.BackgroundTransparency=1
bW.Position=UDim2.new(0,20,0,78)bW.Size=UDim2.new(1,-40,0,36)
bW.Font=Enum.Font.Gotham bW.TextSize=12 bW.TextWrapped=true
bW.Text=bL.Hint or"This section is empty."bW.Parent=bT
af:_tag(bW,"TextColor3","Dim")
return bO{Title=bL.Title,Frame=bT,_handle=bT}
end end function a.S():typeof(__modImpl())local aa=a.cache.S if not aa then aa={c=__modImpl()}a.cache.S=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bI=ab.T
local bJ=ab.tween local bK=
ac.guid local bL=
ac.spawnCb
local bO=ac.corner
local bR=ac.hairline local bS=
ac.pad
local bT=ac.lighting local bU=
ac.ripple local bV=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(bW,bX)local bY=
bW.row local bZ=
bW.titleBlock
local b_=bW.reg
local b0=bW.tab local b1=
bW.Window
local b2=bW.Th local b3=
bW.opts or{}
bX=bX or{}
local b4=Instance.new"Frame"b4.Size=UDim2.new(1,-4,0,64)
b4.BackgroundColor3=b2.Surface2 b4.BorderSizePixel=0
bO(b4,10)b4.Parent=bW.getParent()
bR(b4,true)
af:_tag(b4,"BackgroundColor3","Surface2")
bT(b4,10)
local b5=Instance.new"Frame"b5.AnchorPoint=Vector2.new(0,0.5)
b5.Position=UDim2.new(0,12,0.5,0)b5.Size=UDim2.fromOffset(40,40)
b5.BorderSizePixel=0 bO(b5,99)b5.Parent=b4
af:agrad(b5,45)
local b6=Instance.new"TextLabel"b6.Size=UDim2.fromScale(1,1)
b6.BackgroundTransparency=1 b6.Font=Enum.Font.GothamBlack
b6.TextSize=18
b6.Text=string.upper(string.sub(bX.Name or"?",1,1))b6.Parent=b5
af:oa(b6)
local b7=Instance.new"TextLabel"b7.BackgroundTransparency=1
b7.Position=UDim2.new(0,62,0,12)b7.Size=UDim2.new(1,-120,0,18)
b7.Font=Enum.Font.GothamBold b7.TextSize=14 b7.TextXAlignment=0
b7.TextTruncate=Enum.TextTruncate.AtEnd b7.Text=bX.Name or"guest"b7.Parent=b4
af:_tag(b7,"TextColor3","Text")
local b8=Instance.new"TextLabel"b8.BackgroundTransparency=1
b8.Position=UDim2.new(0,62,0,32)b8.Size=UDim2.new(1,-120,0,14)
b8.Font=Enum.Font.Gotham b8.TextSize=11 b8.TextXAlignment=0
b8.TextTruncate=Enum.TextTruncate.AtEnd b8.Text=bX.Tag or"Premium"b8.Parent=b4
af:_tag(b8,"TextColor3","Dim")
local b9=Instance.new"Frame"b9.AnchorPoint=Vector2.new(1,0.5)
b9.Position=UDim2.new(1,-14,0.5,0)b9.Size=UDim2.fromOffset(10,10)
b9.BorderSizePixel=0 bO(b9,99)b9.Parent=b4
af:_tag(b9,"BackgroundColor3","Success")
b4.BackgroundTransparency=1
task.delay(math.min(#b0.Elements*0.025,0.3),function()
bJ(b4,bI.Med,{BackgroundTransparency=0})
end)
return b_{Title=bX.Name,Frame=b4,_handle=b4}
end end function a.T():typeof(__modImpl())local aa=a.cache.T if not aa then aa={c=__modImpl()}a.cache.T=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bI=ab.T
local bJ=ab.tween local bO=
ac.guid
local bR=ac.spawnCb
local bT=ac.corner
local bV=ac.hairline local bW=
ac.pad
local bX=ac.lighting local b_=
ac.ripple
local b0=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b2,b3)local b4=
b2.row local b5=
b2.titleBlock
local b6=b2.reg local b7=
b2.tab local b8=
b2.Window
local b9=b2.Th local ca=
b2.opts or{}
b3=b3 or{}
local cb=b3.Cards or{}
local cc=math.clamp(b3.Columns or 2,1,3)
local cd=Instance.new"Frame"cd.BackgroundTransparency=1
cd.Size=UDim2.new(1,-4,0,0)cd.AutomaticSize=Enum.AutomaticSize.Y
cd.Parent=b2.getParent()
local ce=Instance.new"UIListLayout"ce.Padding=UDim.new(0,8)
ce.SortOrder=Enum.SortOrder.LayoutOrder ce.Parent=cd




local cf,ch=0
for cj,cl in ipairs(cb)do
if(cj-1)%cc==0 then
ch=Instance.new"Frame"ch.BackgroundTransparency=1
ch.Size=UDim2.new(1,0,0,68)ch.AutomaticSize=Enum.AutomaticSize.Y
ch.Parent=cd
local cn=Instance.new"UIListLayout"cn.FillDirection=Enum.FillDirection.Horizontal
cn.Padding=UDim.new(0,8)cn.SortOrder=Enum.SortOrder.LayoutOrder cn.Parent=ch
cf+=1
end
local cn=false
local co=Instance.new"Frame"
co.Size=UDim2.new(1/cc,-8+8/cc,0,68)
co.BackgroundColor3=b9.Surface co.BorderSizePixel=0
bT(co,10)co.LayoutOrder=cj co.Parent=ch
bV(co,true)
af:_tag(co,"BackgroundColor3","Surface")
bX(co,10)


local cp=Instance.new"TextButton"cp.Text=""
cp.Size=UDim2.fromScale(1,1)cp.BackgroundTransparency=1 cp.Parent=co
local cq=b0(cl.Icon or"box",16,b9.Dim)
cq.Position=UDim2.new(0,10,0,10)cq.Parent=co
if cq:IsA"TextLabel"then cq.Size=UDim2.new(0,16,0,16)end
local cr=Instance.new"TextLabel"cr.BackgroundTransparency=1
cr.Position=UDim2.new(0,34,0,8)cr.Size=UDim2.new(1,-42,0,18)
cr.Font=Enum.Font.GothamBold cr.TextSize=13 cr.TextXAlignment=0
cr.TextTruncate=Enum.TextTruncate.AtEnd cr.Text=cl.Title or"Script"cr.Parent=co
af:_tag(cr,"TextColor3","Text")
local cs=Instance.new"TextLabel"cs.BackgroundTransparency=1
cs.Position=UDim2.new(0,10,0,30)cs.Size=UDim2.new(1,-20,0,28)
cs.Font=Enum.Font.Gotham cs.TextSize=11
cs.TextXAlignment=0 cs.TextYAlignment=0
cs.TextWrapped=true cs.TextTruncate=Enum.TextTruncate.AtEnd
cs.Text=cl.Desc or""cs.Visible=false cs.Parent=co
af:_tag(cs,"TextColor3","Dim")
local ct=Instance.new"TextButton"ct.Text=""
ct.AnchorPoint=Vector2.new(0,1)ct.Position=UDim2.new(0,10,1,-10)
ct.Size=UDim2.new(1,-20,0,28)ct.BorderSizePixel=0
bT(ct,7)ct.AutoButtonColor=false ct.Visible=false ct.Parent=co
af:agrad(ct,15)
local cu=Instance.new"TextLabel"cu.BackgroundTransparency=1
cu.Size=UDim2.fromScale(1,1)cu.Font=Enum.Font.GothamBold
cu.TextSize=11
cu.Text="LAUNCH"cu.Parent=ct
af:oa(cu)
cp.MouseButton1Click:Connect(function()
cn=not cn
af:_sfx"Click"
bJ(co,bI.Fast,{Size=UDim2.new(1/cc,-8+8/cc,0,cn and 118 or 68)})
cs.Visible,ct.Visible=cn,cn
end)
ct.MouseButton1Click:Connect(function()
af:_sfx"Click"bR(cl.Callback)
end)
end
return b6{Title=b3.Title or"Scripts",Frame=cd,_handle=cd}
end end function a.U():typeof(__modImpl())local aa=a.cache.U if not aa then aa={c=__modImpl()}a.cache.U=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local bI=
ab.T local bJ=
ab.tween local bR=
ac.guid local bT=
ac.spawnCb
local bV=ac.corner local bX=
ac.hairline local b_=
ac.pad local b0=
ac.lighting local b2=
ac.ripple local b3=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b6,b9)local ca=
b6.row local cb=
b6.titleBlock
local cc=b6.reg local cd=
b6.tab local ce=
b6.Window
local cf=b6.Th local ch=
b6.opts or{}
b9=b9 or{}
local cj=b9.Limit or 5
local cl=Instance.new"Frame"cl.BackgroundTransparency=1
cl.Size=UDim2.new(1,-4,0,0)cl.AutomaticSize=Enum.AutomaticSize.Y
cl.Parent=b6.getParent()
local cn=Instance.new"UIListLayout"cn.Padding=UDim.new(0,4)
cn.SortOrder=Enum.SortOrder.LayoutOrder cn.Parent=cl
local function refresh()
for co,cp in ipairs(cl:GetChildren())do
if cp:IsA"TextButton"then pcall(function()cp:Destroy()end)end
end
local co=af._recent or{}
if#co==0 then
local cp=Instance.new"TextLabel"cp.BackgroundTransparency=1
cp.Size=UDim2.new(1,0,0,24)cp.Font=Enum.Font.Gotham
cp.TextSize=11 cp.Text="Use any control and it lands here."cp.Parent=cl
af:_tag(cp,"TextColor3","Dim")
return
end
for cp=1,math.min(cj,#co)do
local cq=co[cp]
local cr=Instance.new"TextButton"cr.Text=""
cr.Size=UDim2.new(1,0,0,30)cr.BackgroundColor3=cf.Surface
cr.BackgroundTransparency=0.35 cr.BorderSizePixel=0
bV(cr,7)cr.Parent=cl
af:_tag(cr,"BackgroundColor3","Surface")
local cs=Instance.new"TextLabel"cs.BackgroundTransparency=1
cs.Position=UDim2.new(0,10,0,0)cs.Size=UDim2.new(1,-90,1,0)
cs.Font=Enum.Font.Gotham cs.TextSize=12 cs.TextXAlignment=0
cs.TextTruncate=Enum.TextTruncate.AtEnd cs.Text=cq.label cs.Parent=cr
af:_tag(cs,"TextColor3","Text")
local ct=Instance.new"TextLabel"ct.BackgroundTransparency=1
ct.AnchorPoint=Vector2.new(1,0)ct.Position=UDim2.new(1,-10,0,0)
ct.Size=UDim2.new(0,74,1,0)ct.Font=Enum.Font.Gotham
ct.TextSize=10 ct.TextXAlignment=1 ct.Text=cq.tab ct.Parent=cr
af:_tag(ct,"TextColor3","Dim")
cr.MouseButton1Click:Connect(function()
if cq.go then af:_sfx"Click"pcall(cq.go)end
end)
end
end
af._recentRefresh=af._recentRefresh or{}
table.insert(af._recentRefresh,refresh)
refresh()
return cc{Title=b9.Title or"Recent",Frame=cl,_handle={Refresh=refresh}}
end end function a.V():typeof(__modImpl())local aa=a.cache.V if not aa then aa={c=__modImpl()}a.cache.V=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bV=ab.T
local b3=ab.tween local b6=
ac.guid local b9=
ac.spawnCb
local cc=ac.corner local cf=
ac.hairline local ch=
ac.pad local cj=
ac.lighting local cl=
ac.ripple local cn=
ad.makeIcon
local co=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local cp=ae.cloneref_check(game:GetService"Players")

local cq={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(cr,cs)
local ct=cr.row local cu=
cr.titleBlock
local cv=cr.reg
local cw=cr.tab local cx=
cr.Window
local cy=cr.Th local e=
cr.opts or{}local f=
cr.page
cs=cs or{}
local g=cs.Accent or cs.Color or cy.Accent
if type(g)=="table"then
g=Color3.new(g[1]or 0,g[2]or 0,g[3]or 0)
end
local Q=tostring(cs.Mode or"Chams")
if not cq[Q]then Q="Chams"end
local _,cz,cA,cB=true,true,false,100
local cC
pcall(function()cC=cp.LocalPlayer end)
local cD=cs.Name or((cC and cC.DisplayName)or"Noob")
local cE=(cC and("@"..cC.Name))or""
local cF=ct(170)
local cG=Instance.new"TextLabel"cG.BackgroundTransparency=1
cG.Position=UDim2.new(0,12,0,6)cG.Size=UDim2.new(1,-24,0,16)
cG.Font=Enum.Font.GothamMedium cG.TextSize=12 cG.TextXAlignment=0
cG.TextTruncate=Enum.TextTruncate.AtEnd cG.Text=cs.Title or"Rig Preview"cG.Parent=cF
af:_tag(cG,"TextColor3","Text")
local cH=Instance.new"ViewportFrame"
cH.Position=UDim2.new(0,10,0,26)cH.Size=UDim2.new(1,-20,1,-34)
cH.BackgroundColor3=cy.Bg cH.BorderSizePixel=0
cH.LightColor=Color3.fromRGB(255,255,255)
cH.LightDirection=Vector3.new(-0.5,-1,-0.6)
cH.Ambient=Color3.fromRGB(150,150,168)
cc(cH,8)cH.Parent=cF
af:_tag(cH,"BackgroundColor3","Bg")
local cI=Instance.new"Frame"cI.BackgroundTransparency=1
cI.Size=UDim2.fromScale(1,1)cI.Parent=cH
local cJ={}
local function bracket(cK,cL)
local cM=Instance.new"Frame"cM.BorderSizePixel=0
cM.AnchorPoint=Vector2.new(cK,cL)cM.Position=UDim2.new(cK,0,cL,0)
cM.Size=UDim2.new(0,12,0,2)cM.Parent=cI
af:_tag(cM,"BackgroundColor3","Accent")
local cN=Instance.new"Frame"cN.BorderSizePixel=0
cN.AnchorPoint=Vector2.new(cK,cL)cN.Position=UDim2.new(cK,0,cL,0)
cN.Size=UDim2.new(0,2,0,12)cN.Parent=cI
af:_tag(cN,"BackgroundColor3","Accent")
table.insert(cJ,cM)table.insert(cJ,cN)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local cK=Instance.new"TextLabel"cK.BackgroundTransparency=1
cK.AnchorPoint=Vector2.new(0.5,0)cK.Position=UDim2.new(0.5,0,0,4)
cK.Size=UDim2.new(1,-16,0,14)cK.Font=Enum.Font.GothamBold
cK.TextSize=11 cK.Text=cD cK.Parent=cI
af:_tag(cK,"TextColor3","Text")
local cL=Instance.new"TextLabel"cL.BackgroundTransparency=1
cL.AnchorPoint=Vector2.new(0.5,0)cL.Position=UDim2.new(0.5,0,0,18)
cL.Size=UDim2.new(1,-16,0,11)cL.Font=Enum.Font.Gotham
cL.TextSize=10 cL.Text=cE cL.Parent=cI
af:_tag(cL,"TextColor3","Dim")
local cM=Instance.new"Frame"cM.BorderSizePixel=0
cM.AnchorPoint=Vector2.new(0,0.5)cM.Position=UDim2.new(0,6,0.5,0)
cM.Size=UDim2.new(0,4,1,-30)cM.BackgroundColor3=cy.Surface2
cc(cM,99)cM.Parent=cI
af:_tag(cM,"BackgroundColor3","Surface2")
local cN=Instance.new"Frame"cN.BorderSizePixel=0
cN.AnchorPoint=Vector2.new(0,1)cN.Position=UDim2.new(0,0,1,0)
cN.Size=UDim2.new(1,0,1,0)cN.BackgroundColor3=cy.Success
cc(cN,99)cN.Parent=cM
af:_tag(cN,"BackgroundColor3","Success")
local cO=Instance.new"WorldModel"cO.Parent=cH
local cP=Instance.new"Camera"cP.Parent=cH
cH.CurrentCamera=cP

cP.CFrame=CFrame.new(Vector3.new(0,2.9,7),Vector3.new(0,2.3,0))
local cQ,cR={},{}
local function part(cS,cT,cU)
local cV=Instance.new"Part"cV.Name=cS
cV.Size=cT cV.Position=cU cV.Anchored=true cV.CanCollide=false
cV.TopSurface=Enum.SurfaceType.Smooth
cV.BottomSurface=Enum.SurfaceType.Smooth
cV.Color=Color3.fromRGB(200,200,215)
cV.Material=Enum.Material.Plastic
cV.Parent=cO
table.insert(cQ,cV)
local cW=Instance.new"SelectionBox"
cW.Adornee=cV cW.LineThickness=0.05
cW.Color3=Color3.fromRGB(255,255,255)
cW.SurfaceTransparency=1 cW.Visible=false
cW.Parent=cV
cR[cV]=cW
return cV
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local cS={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local cT={}
local function paint()
for cU,cV in ipairs(cQ)do
if cV and cV.Parent then
if Q=="Noob"then
cV.Color=cS[cV.Name]or Color3.fromRGB(200,200,215)
cV.Material=Enum.Material.Plastic
cV.Transparency=0
elseif Q=="Ghost"then
cV.Color=g
cV.Material=Enum.Material.ForceField
cV.Transparency=0
elseif Q=="Solid"or Q=="Box"then
cV.Color=Color3.fromRGB(200,200,215)
cV.Material=Enum.Material.Plastic
cV.Transparency=0
else
cV.Color=g
cV.Material=Enum.Material.Plastic
cV.Transparency=0
end
local cW=cR[cV]
if cW then
cW.Visible=cA or Q=="Outline"
cW.Color3=g
end
end
end
for cU,cV in ipairs(cJ)do
if cV then cV.Visible=_ or Q=="Box"end
end
cK.Visible=cz or Q=="Name"
cL.Visible=cK.Visible
cM.Visible=_ or Q=="HP bar"
end
function cT.SetAccent(cU,cV)
if type(cV)=="table"then
cV=Color3.new(cV[1]or 0,cV[2]or 0,cV[3]or 0)
end
if typeof(cV)=="Color3"then g=cV paint()end
end
function cT.SetMode(cU,cV)Q=tostring(cV)if not cq[Q]then Q="Chams"end paint()end
function cT.SetBox(cU,cV)_=cV and true or false paint()end
function cT.SetOutline(cU,cV)cA=cV and true or false paint()end
function cT.SetName(cU,cV)cz=cV and true or false paint()end
function cT.SetHealth(cU,cV)
cB=math.clamp(tonumber(cV)or 100,0,100)
b3(cN,bV.Fill08,{Size=UDim2.new(1,0,cB/100,0)})
end
function cT.Get(cU)return g end
paint()
local cU=0
local cV={}
for cW,cX in ipairs(cQ)do cV[cX]=cX.Position end
local cW
cW=co.Heartbeat:Connect(function(cX)
if not cH.Parent then pcall(function()cW:Disconnect()end)return end
if not cF:IsDescendantOf(game)then return end
if not cF.Visible or not cw.Page.Visible then return end
cU+=cX
local cY=math.sin(cU*2.2)*0.045
for cZ,c_ in ipairs(cQ)do
if c_ and c_.Parent and cV[c_]then
c_.Position=cV[c_]+Vector3.new(0,cY,0)
end
end
end)
cw._window:Track(cW)
aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(cX,cY)
local cZ=cX
if type(cZ)=="table"then
cZ=Color3.new(cZ[1]or 0,cZ[2]or 0,cZ[3]or 0)
end
if typeof(cZ)=="Color3"then g=cZ paint()end
end)
if aa.Flags.ESPColor~=nil then
local cX=aa.Flags.ESPColor
if type(cX)=="table"then
cX=Color3.new(cX[1]or 0,cX[2]or 0,cX[3]or 0)
end
if typeof(cX)=="Color3"then g=cX paint()end
end
return cv{Title=cs.Title or"Rig Preview",Frame=cF,_handle=cT}
end end function a.W():typeof(__modImpl())local aa=a.cache.W if not aa then aa={c=__modImpl()}a.cache.W=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bV=ab.T
local b3=ab.tween local cc=
ac.guid
local cn=ac.spawnCb
local co=ac.corner
local cp=ac.hairline local cq=
ac.pad local cr=
ac.lighting local cs=
ac.ripple
local ct=ac.spotlight
local cv=ac.attachTip local cw=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cy,cz)
local cA=cy.row
local cB=cy.titleBlock
local cC=cy.reg local cD=
cy.tab local cE=
cy.Window
local cF=cy.Th local cG=
cy.opts or{}local cH=
cy.page
cz=cz or{}
local cI=cz.Values or cz.Options or{"A","B"}
local cJ=cz.Value or cz.Default or cI[1]
local cK=cA(56)
cB(cK,cz.Title or"Mode",cz.Description,90,true)
ct(cK,0.1)
if cz.Tooltip then cv(cK,cz.Tooltip)end
local cL=Instance.new"Frame"cL.BackgroundTransparency=1
cL.Position=UDim2.new(0,12,0,30)cL.Size=UDim2.new(1,-24,0,20)
cL.Parent=cK
local cM=Instance.new"UIListLayout"cM.FillDirection=Enum.FillDirection.Horizontal
cM.Padding=UDim.new(0,4)cM.Parent=cL
local cN,cO={},{}
local function paint()
for cP,cQ in pairs(cO)do
local cR=cP==cJ
b3(cQ,bV.Hover,{BackgroundTransparency=cR and 0 or 0.65})
local cS=cQ:FindFirstChildOfClass"TextLabel"
if cS then af:_tag(cS,"TextColor3",cR and"Text"or"Dim")end
end
end
function cN.Set(cP,cQ,cR)
cJ=cQ paint()
if cz.Flag then af.Flags[cz.Flag]=cJ end
if not cR then cn(cz.Callback,cJ)cn(cz.OnChanged,cJ)end
end
function cN.Get(cP)return cJ end
for cP,cQ in ipairs(cI)do
local cR=Instance.new"TextButton"cR.Text=""
cR.Size=UDim2.new(1/#cI,-4,0,20)cR.BackgroundColor3=cF.Surface2
cR.BorderSizePixel=0 co(cR,6)cR.AutoButtonColor=false cR.Parent=cL
cp(cR,true)
af:_tag(cR,"BackgroundColor3","Surface2")
local cS=Instance.new"TextLabel"cS.BackgroundTransparency=1
cS.Size=UDim2.fromScale(1,1)cS.Font=Enum.Font.GothamBold
cS.TextSize=11 cS.Text=tostring(cQ)cS.Parent=cR
af:_tag(cS,"TextColor3","Dim")
cO[cQ]=cR
cR.MouseButton1Click:Connect(function()
af:_sfx"Click"cN:Set(cQ)
end)
end
paint()
local cP={Title=cz.Title,Frame=cK,Value=cJ,Flag=cz.Flag,_handle=cN,
_set=function(cP,cQ)cN:Set(cP,cQ)end}
return cC(cP)
end end function a.X():typeof(__modImpl())local aa=a.cache.X if not aa then aa={c=__modImpl()}a.cache.X=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bV=ab.T
local b3=ab.tween local cn=
ac.guid
local co=ac.spawnCb
local cp=ac.corner
local ct=ac.hairline local cv=
ac.pad local cw=
ac.lighting local cy=
ac.ripple local cz=
ac.spotlight
local cA=ac.attachTip local cB=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cC,cF)local cH=
cC.row local cI=
cC.titleBlock
local cJ=cC.reg local cK=
cC.tab local cL=
cC.Window
local cM=cC.Th local cN=
cC.opts or{}local cO=
cC.page
cF=cF or{}
local cP=cF.Values or cF.Options or{"A","B"}
local cQ=cF.Value or cF.Default or cP[1]
local cR=Instance.new"Frame"cR.BackgroundTransparency=1
cR.Size=UDim2.new(1,-4,0,#cP*28+26)cR.Parent=cC.getParent()
local cS=Instance.new"TextLabel"cS.BackgroundTransparency=1
cS.Position=UDim2.new(0,2,0,0)cS.Size=UDim2.new(1,0,0,18)
cS.Font=Enum.Font.GothamMedium cS.TextSize=13 cS.TextXAlignment=0
cS.Text=cF.Title or"Choice"cS.Parent=cR
af:_tag(cS,"TextColor3","Text")
if cF.Tooltip then cA(cR,cF.Tooltip)end
local cT,cU={},{}
local function paint()
for cV,cW in pairs(cU)do
local cX=cW:FindFirstChild("_dot",true)
local cY=cV==cQ
if cX then af:_tag(cX,"BackgroundColor3",cY and"Accent"or"Surface2")end
b3(cW,bV.Hover,{BackgroundTransparency=cY and 0.35 or 0.75})
end
end
function cT.Set(cV,cW,cX)
cQ=cW paint()
if cF.Flag then af.Flags[cF.Flag]=cQ end
if not cX then co(cF.Callback,cQ)co(cF.OnChanged,cQ)end
end
function cT.Get(cV)return cQ end
for cV,cW in ipairs(cP)do
local cX=Instance.new"TextButton"cX.Text=""
cX.Position=UDim2.new(0,0,0,22+(cV-1)*28)
cX.Size=UDim2.new(1,0,0,24)cX.BackgroundColor3=cM.Surface2
cX.BackgroundTransparency=0.75 cX.BorderSizePixel=0 cp(cX,7)cX.Parent=cR
af:_tag(cX,"BackgroundColor3","Surface2")
local cY=Instance.new"Frame"cY.Name="_dot"
cY.Position=UDim2.new(0,10,0.5,-7)cY.Size=UDim2.fromOffset(14,14)
cY.BorderSizePixel=0 cp(cY,99)cY.Parent=cX
ct(cY,true)
local cZ=Instance.new"TextLabel"cZ.BackgroundTransparency=1
cZ.Position=UDim2.new(0,32,0,0)cZ.Size=UDim2.new(1,-40,1,0)
cZ.Font=Enum.Font.Gotham cZ.TextSize=12 cZ.TextXAlignment=0
cZ.Text=tostring(cW)cZ.Parent=cX
af:_tag(cZ,"TextColor3","Text")
cU[cW]=cX
cX.MouseButton1Click:Connect(function()af:_sfx"Click"cT:Set(cW)end)
end
paint()
local cV={Title=cF.Title,Frame=cR,Value=cQ,Flag=cF.Flag,_handle=cT,
_set=function(cV,cW)cT:Set(cV,cW)end}
return cJ(cV)
end end function a.Y():typeof(__modImpl())local aa=a.cache.Y if not aa then aa={c=__modImpl()}a.cache.Y=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bV=ab.T
local b3=ab.tween local co=
ac.guid
local cp=ac.spawnCb
local ct=ac.corner local cA=
ac.hairline local cB=
ac.pad local cC=
ac.lighting local cF=
ac.ripple
local cJ=ac.spotlight
local cM=ac.attachTip local cO=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local cP=ae.cloneref_check(game:GetService"UserInputService")

return function(cQ,cR)
local cS=cQ.row
local cT=cQ.titleBlock
local cU=cQ.reg local cV=
cQ.tab local cW=
cQ.Window
local cX=cQ.Th local cY=
cQ.opts or{}
cR=cR or{}
local cZ=cR.Min or 0 local c_=cR.Max or 100 local f=cR.Step or 1
local g=(cR.Value and cR.Value[1])or cR.Lo or cZ
local Q=(cR.Value and cR.Value[2])or cR.Hi or c_
local _=cS(56)
local function scrollLock(c0)
local c1=_:FindFirstAncestorOfClass"ScrollingFrame"
if c1 then pcall(function()c1.ScrollingEnabled=not c0 end)end
end
cT(_,cR.Title or"Range",cR.Description,90,true)
cJ(_,0.1)
if cR.Tooltip then cM(_,cR.Tooltip)end
local c0=Instance.new"TextLabel"c0.BackgroundTransparency=1
c0.AnchorPoint=Vector2.new(1,0)c0.Position=UDim2.new(1,-12,0,6)
c0.Size=UDim2.new(0,90,0,18)c0.Font=Enum.Font.Code
c0.TextSize=11 c0.TextXAlignment=1 c0.Parent=_
af:_tag(c0,"TextColor3","Dim")
local c1=Instance.new"TextButton"c1.Text=""c1.AutoButtonColor=false
c1.Position=UDim2.new(0,12,0,36)c1.Size=UDim2.new(1,-24,0,6)
c1.BackgroundColor3=cX.Surface2 c1.BorderSizePixel=0 ct(c1,99)c1.Parent=_
af:_tag(c1,"BackgroundColor3","Surface2")
local c2=Instance.new"Frame"c2.BorderSizePixel=0 ct(c2,99)c2.Parent=c1
af:agrad(c2,0)
local c3=Instance.new"Frame"c3.AnchorPoint=Vector2.new(0.5,0.5)
c3.Size=UDim2.fromOffset(13,13)c3.BackgroundColor3=Color3.fromRGB(255,255,255)
c3.BorderSizePixel=0 ct(c3,99)c3.Parent=c1
local c4=Instance.new"Frame"c4.AnchorPoint=Vector2.new(0.5,0.5)
c4.Size=UDim2.fromOffset(13,13)c4.BackgroundColor3=Color3.fromRGB(255,255,255)
c4.BorderSizePixel=0 ct(c4,99)c4.Parent=c1
local c5={}
local function snap(c6)c6=math.clamp(c6,cZ,c_)return math.round(c6/f)*f end
local function render(c6)
g,Q=math.min(g,Q),math.max(g,Q)
local c7=(g-cZ)/math.max(1e-6,c_-cZ)
local c8=(Q-cZ)/math.max(1e-6,c_-cZ)
local c9=UDim2.new(c7,0,0,0)
local da=UDim2.new(c8-c7,0,1,0)
if c6 then
b3(c2,bV.Fill08,{Position=c9,Size=da})
else
c2.Position=c9
c2.Size=da
end
c3.Position=UDim2.new(c7,0,0.5,0)
c4.Position=UDim2.new(c8,0,0.5,0)
c0.Text=tostring(g).." - "..tostring(Q)
end
function c5.Set(c6,c7,c8)
if type(c7)=="table"then g,Q=snap(c7[1]or g),snap(c7[2]or Q)end
render(true)
if cR.Flag then af.Flags[cR.Flag]={g,Q}end
if not c8 then cp(cR.Callback,{g,Q})end
end
function c5.Get(c6)return{g,Q}end
render(false)
local c6
c1.InputBegan:Connect(function(c7)
if c7.UserInputType~=Enum.UserInputType.MouseButton1 and c7.UserInputType~=Enum.UserInputType.Touch then return end
local c8=c7.Position.X
local c9=c3.AbsolutePosition.X local da=c4.AbsolutePosition.X
c6=(math.abs(c8-c9)<math.abs(c8-da))and 1 or 2
scrollLock(true)
local db
local dc;dc=cP.InputChanged:Connect(function(dd)
if not c6 then dc:Disconnect()return end
if dd.UserInputType~=Enum.UserInputType.MouseMovement
and dd.UserInputType~=Enum.UserInputType.Touch then return end
local de=dd.Position.X
if db and math.abs(de-db)<=1 then return end
db=de
local df=math.clamp((de-c1.AbsolutePosition.X)/math.max(1,c1.AbsoluteSize.X),0,1)
local dg=snap(cZ+df*(c_-cZ))
if c6==1 then g=math.min(dg,Q)else Q=math.max(dg,g)end
render(false)
end)
local dd;dd=cP.InputEnded:Connect(function(de)
if de.UserInputType==Enum.UserInputType.MouseButton1 or de.UserInputType==Enum.UserInputType.Touch then
c6=nil scrollLock(false)
if dc then dc:Disconnect()end if dd then dd:Disconnect()end
if cR.Flag then af.Flags[cR.Flag]={g,Q}end
cp(cR.Callback,{g,Q})cp(cR.OnRelease,{g,Q})
end
end)
end)
local c7={Title=cR.Title,Frame=_,Value={g,Q},Flag=cR.Flag,_handle=c5,
_set=function(c7,c8)c5:Set(c7,c8)end}
return cU(c7)
end end function a.Z():typeof(__modImpl())local aa=a.cache.Z if not aa then aa={c=__modImpl()}a.cache.Z=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local bV=
ab.T local b3=
ab.tween local cp=
ac.guid local ct=
ac.spawnCb
local cJ=ac.corner local cM=
ac.hairline local cO=
ac.pad local cP=
ac.lighting local cQ=
ac.ripple
local cR=ac.spotlight
local cS=ac.attachTip local cT=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cU,cX)
local cY=cU.row
local cZ=cU.titleBlock
local c_=cU.reg local c0=
cU.tab local c1=
cU.Window
local c2=cU.Th local c3=
cU.opts or{}local c4=
cU.page
cX=cX or{}
local c5=math.clamp(cX.Points or 60,10,200)
local c6={}
for c7,c8 in ipairs(cX.Values or{})do table.insert(c6,c8)end
local c7=cY(74)
cZ(c7,cX.Title or"Graph",cX.Description,70,true)
cR(c7,0.08)
if cX.Tooltip then cS(c7,cX.Tooltip)end
local c8=Instance.new"TextLabel"c8.BackgroundTransparency=1
c8.AnchorPoint=Vector2.new(1,0)c8.Position=UDim2.new(1,-12,0,6)
c8.Size=UDim2.new(0,60,0,18)c8.Font=Enum.Font.GothamBold
c8.TextSize=12 c8.TextXAlignment=1 c8.Parent=c7
af:_tag(c8,"TextColor3","Text")
local c9=Instance.new"Frame"c9.BorderSizePixel=0
c9.Position=UDim2.new(0,12,0,28)c9.Size=UDim2.new(1,-24,0,36)
c9.BackgroundColor3=c2.Bg cJ(c9,6)c9.ClipsDescendants=true c9.Parent=c7
af:_tag(c9,"BackgroundColor3","Bg")
local da=Instance.new"Frame"da.BorderSizePixel=0 da.Parent=c9
af:agrad(da,0)
cJ(da,99)
local db={}
local dc={}
local function draw()
for dd,de in ipairs(db)do pcall(function()de:Destroy()end)end
db={}
if#c6==0 then c8.Text="--"return end
local dd,de=math.huge,-math.huge
for df,dg in ipairs(c6)do dd=math.min(dd,dg)de=math.max(de,dg)end
if de-dd<1e-6 then de=dd+1 end
c8.Text=tostring(math.round(c6[#c6]*10)/10)
local df=c9.AbsoluteSize.X if df<10 then df=200 end local dg=
#c6
for f,g in ipairs(c6)do
local Q=(g-dd)/(de-dd)
local _=Instance.new"Frame"_.BorderSizePixel=0
_.AnchorPoint=Vector2.new(0.5,1)_.Size=UDim2.fromOffset(3,3)
_.Position=UDim2.new((f-1)/math.max(1,c5-1),0,1-Q*0.85-0.07,0)
_.BackgroundColor3=c2.Accent cJ(_,99)_.Parent=c9
af:_tag(_,"BackgroundColor3","Accent")
table.insert(db,_)
end
da.Position=UDim2.new(0,0,1,-2)da.Size=UDim2.new(1,0,0,2)
end
function dc.Push(dd,de)
table.insert(c6,tonumber(de)or 0)
while#c6>c5 do table.remove(c6,1)end
draw()
end
function dc.Set(dd,de)
c6={}
if type(de)=="table"then for df,dg in ipairs(de)do table.insert(c6,tonumber(dg)or 0)end end
draw()
end
function dc.Get(dd)return c6 end
dc.Frame=c7
task.defer(draw)
return c_{Title=cX.Title,Frame=c7,_handle=dc}
end end function a._():typeof(__modImpl())local aa=a.cache._ if not aa then aa={c=__modImpl()}a.cache._=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local cJ=
ab.T local cR=
ab.tween local cS=
ac.guid local cT=
ac.spawnCb local cU=
ac.corner local cX=
ac.hairline local cY=
ac.pad local cZ=
ac.lighting local c_=
ac.ripple local c2=
ac.spotlight local c4=
ac.attachTip
local c5=ac.mdToRich local c6=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(c7,c8)local c9=
c7.row local da=
c7.titleBlock
local db=c7.reg local dc=
c7.tab local dd=
c7.Window local de=
c7.Th local df=
c7.opts or{}local dg=
c7.page
if type(c8)=="string"then c8={Text=c8}end c8=c8 or{}
local f=Instance.new"TextLabel"f.BackgroundTransparency=1
f.Size=UDim2.new(1,-4,0,0)f.AutomaticSize=Enum.AutomaticSize.Y
f.Font=Enum.Font.Gotham f.TextSize=c8.Size or 12
f.TextXAlignment=0 f.TextYAlignment=0 f.TextWrapped=true
f.RichText=true f.Text=c5(c8.Text or"")f.Parent=c7.getParent()
af:_tag(f,"TextColor3","Text")
return db{Title=c8.Title or"Text",Frame=f,_handle=f}
end end function a.aa():typeof(__modImpl())local aa=a.cache.aa if not aa then aa={c=__modImpl()}a.cache.aa=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local c5=
ab.T local c6=
ab.tween local c7=
ac.guid local c8=
ac.spawnCb
local db=ac.corner
local dg=ac.hairline local f=
ac.pad local g=
ac.lighting local Q=
ac.ripple local _=
ac.spotlight local dh=
ac.attachTip local di=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dj,dk)
local dl=dj.row local dm=
dj.titleBlock
local dn=dj.reg local dp=
dj.tab local dq=
dj.Window
local dr=dj.Th local ds=
dj.opts or{}local dt=
dj.page
dk=dk or{}
local du=dl(math.clamp(38+14*#(string.split(dk.Text or"print('hi')","\n")),52,160))
local dv=Instance.new"TextLabel"dv.BackgroundTransparency=1
dv.Position=UDim2.new(0,12,0,6)dv.Size=UDim2.new(1,-90,1,-12)
dv.Font=Enum.Font.Code dv.TextSize=12 dv.TextXAlignment=0 dv.TextYAlignment=0
dv.TextWrapped=true dv.TextTruncate=Enum.TextTruncate.AtEnd
dv.Text=dk.Text or""dv.Parent=du
af:_tag(dv,"TextColor3","Text")
local dw=Instance.new"TextButton"dw.Text=""
dw.AnchorPoint=Vector2.new(1,0)dw.Position=UDim2.new(1,-10,0,8)
dw.Size=UDim2.new(0,56,0,24)dw.BackgroundColor3=dr.Surface2
dw.BorderSizePixel=0 db(dw,6)dw.AutoButtonColor=false dw.Parent=du
dg(dw,true)
af:_tag(dw,"BackgroundColor3","Surface2")
local dx=Instance.new"TextLabel"dx.BackgroundTransparency=1
dx.Size=UDim2.fromScale(1,1)dx.Font=Enum.Font.GothamBold
dx.TextSize=10 dx.Text="COPY"dx.Parent=dw
af:_tag(dx,"TextColor3","Dim")
dw.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(dv.Text)end end)
dx.Text="COPIED"
task.delay(1.2,function()pcall(function()dx.Text="COPY"end)end)
end)
return dn{Title=dk.Title or"Code",Frame=du,_handle=dv}
end end function a.ab():typeof(__modImpl())local aa=a.cache.ab if not aa then aa={c=__modImpl()}a.cache.ab=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local db=
ab.T local dg=
ab.tween local di=
ac.guid
local dj=ac.spawnCb
local dk=ac.corner
local dl=ac.hairline local dn=
ac.pad local dr=
ac.lighting local dt=
ac.ripple
local du=ac.spotlight
local dv=ac.attachTip
local dw=ac.setDisabled
local dx=ac.attachCtx local dy=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local dz=ae.cloneref_check(game:GetService"UserInputService")

return function(dA,dB)
local dC=dA.row
local dD=dA.titleBlock
local dE=dA.reg local dF=
dA.tab local dG=
dA.Window
local dH=dA.Th local dI=
dA.opts or{}local dJ=
dA.page
local dK=dA.pgui
dB=dB or{}
local dL=dB.Min or 0 local dM=dB.Max or 100 local dN=dB.Step or 1
local dO=dB.Value or dB.Default or dL
local dP=dC(40)
dD(dP,dB.Title or"Count",dB.Description,130)
du(dP,0.08)
if dB.Tooltip then dv(dP,dB.Tooltip)end
if dB.ContextMenu then dx(dK,dP,dB.ContextMenu)end
local dQ=Instance.new"TextButton"dQ.Text=""
dQ.AnchorPoint=Vector2.new(1,0.5)dQ.Position=UDim2.new(1,-92,0.5,0)
dQ.Size=UDim2.fromOffset(28,28)dQ.BackgroundColor3=dH.Surface2
dQ.BorderSizePixel=0 dk(dQ,7)dQ.AutoButtonColor=false dQ.Parent=dP
dl(dQ,true)
af:_tag(dQ,"BackgroundColor3","Surface2")
local dR=Instance.new"TextLabel"dR.BackgroundTransparency=1 dR.Size=UDim2.fromScale(1,1)
dR.Font=Enum.Font.GothamBold dR.TextSize=14 dR.Text="-"dR.Parent=dQ
af:_tag(dR,"TextColor3","Text")
local dS=Instance.new"TextLabel"dS.BackgroundTransparency=1
dS.AnchorPoint=Vector2.new(1,0.5)dS.Position=UDim2.new(1,-60,0.5,0)
dS.Size=UDim2.new(0,28,0,20)dS.Font=Enum.Font.GothamBold
dS.TextSize=13 dS.TextXAlignment=Enum.TextXAlignment.Center
dS.TextYAlignment=Enum.TextYAlignment.Center
dS.Text=tostring(dO)dS.Parent=dP
af:_tag(dS,"TextColor3","Text")
local dT=Instance.new"TextButton"dT.Text=""
dT.AnchorPoint=Vector2.new(1,0.5)dT.Position=UDim2.new(1,-28,0.5,0)
dT.Size=UDim2.fromOffset(28,28)dT.BackgroundColor3=dH.Surface2
dT.BorderSizePixel=0 dk(dT,7)dT.AutoButtonColor=false dT.Parent=dP
dl(dT,true)
af:_tag(dT,"BackgroundColor3","Surface2")
local dU=Instance.new"TextLabel"dU.BackgroundTransparency=1 dU.Size=UDim2.fromScale(1,1)
dU.Font=Enum.Font.GothamBold dU.TextSize=14 dU.Text="+"dU.Parent=dT
af:_tag(dU,"TextColor3","Text")
local dV={}
local function render()dS.Text=tostring(dO)end
function dV.Set(dW,dX,dY)
dO=math.clamp(tonumber(dX)or dO,dL,dM)
render()
if dB.Flag then af.Flags[dB.Flag]=dO end
if not dY then dj(dB.Callback,dO)dj(dB.OnChanged,dO)end
end
function dV.Get(dW)return dO end
local function hold(dW,dX)
dW.InputBegan:Connect(function(dY)
if dY.UserInputType~=Enum.UserInputType.MouseButton1 and dY.UserInputType~=Enum.UserInputType.Touch then return end
dV:Set(dO+dX*dN)
local dZ=os.clock()
task.spawn(function()
while dz:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
if os.clock()-dZ<0.35 then task.wait(0.05)
else dV:Set(dO+dX*dN)task.wait(0.08)end
end
end)
end)
end
hold(dQ,-1)hold(dT,1)
if dB.Disabled then task.defer(function()pcall(dw,dP,true)end)end
local dW={Title=dB.Title,Frame=dP,Value=dO,Flag=dB.Flag,_handle=dV,
_set=function(dW,dX)dV:Set(dW,dX)end,Tooltip=dB.Tooltip}
return dE(dW)
end end function a.ac():typeof(__modImpl())local aa=a.cache.ac if not aa then aa={c=__modImpl()}a.cache.ac=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local dj=
ab.T local dk=
ab.tween local dl=
ac.guid
local du=ac.spawnCb
local dv=ac.corner local dw=
ac.hairline local dx=
ac.pad local dy=
ac.lighting local dz=
ac.ripple local dA=
ac.spotlight local dB=
ac.attachTip local dC=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dD,dE)local dH=
dD.row local dJ=
dD.titleBlock
local dK=dD.reg local dL=
dD.tab local dM=
dD.Window
local dN=dD.Th local dO=
dD.opts or{}local dP=
dD.page
dE=dE or{}
local dQ=dE.Columns or{"Key","Value"}
local dR=dE.Rows or{}
local dS=Instance.new"Frame"dS.BackgroundTransparency=1
dS.Size=UDim2.new(1,-4,0,30+math.min(6,math.max(1,#dR))*24+8)
dS.AutomaticSize=Enum.AutomaticSize.Y dS.Parent=dD.getParent()
local dT=Instance.new"Frame"dT.Size=UDim2.new(1,0,0,22)
dT.BackgroundTransparency=1 dT.Parent=dS
local dU,dV=1,true
local dW={}
local dX
local function draw()
if dX then pcall(function()dX:Destroy()end)end
dX=Instance.new"Frame"dX.BackgroundTransparency=1
dX.Position=UDim2.new(0,0,0,26)dX.Size=UDim2.new(1,0,0,#dR*24)
dX.Parent=dS
local dY=Instance.new"UIListLayout"dY.Padding=UDim.new(0,2)dY.Parent=dX
local dZ={}
for d_,d0 in ipairs(dR)do table.insert(dZ,{i=d_,r=d0})end
table.sort(dZ,function(d_,d0)
local d1,d2=tostring(d_.r[dU]or""),tostring(d0.r[dU]or"")
if dV then return d1<d2 else return d1>d2 end
end)
for d_,d0 in ipairs(dZ)do
local d1=Instance.new"TextButton"d1.Text=""
d1.Size=UDim2.new(1,0,0,22)d1.BackgroundColor3=dN.Surface
d1.BackgroundTransparency=0.4 d1.BorderSizePixel=0 dv(d1,6)d1.Parent=dX
af:_tag(d1,"BackgroundColor3","Surface")
for d2=1,#dQ do
local d3=Instance.new"TextLabel"d3.BackgroundTransparency=1
d3.Position=UDim2.new((d2-1)/#dQ,8,0,0)
d3.Size=UDim2.new(1/#dQ,-16,1,0)
d3.Font=Enum.Font.Gotham d3.TextSize=11 d3.TextXAlignment=0
d3.TextTruncate=Enum.TextTruncate.AtEnd
d3.Text=tostring(d0.r[d2]or"")d3.Parent=d1
af:_tag(d3,"TextColor3",d2==1 and"Text"or"Dim")
end
d1.MouseButton1Click:Connect(function()
af:_sfx"Click"du(dE.OnSelect,d0.r,d0.i)
end)
end
end
for dY,dZ in ipairs(dQ)do
local d_=Instance.new"TextButton"d_.Text=""
d_.Position=UDim2.new((dY-1)/#dQ,0,0,0)
d_.Size=UDim2.new(1/#dQ,0,1,0)d_.BackgroundTransparency=1 d_.Parent=dT
local d0=Instance.new"TextLabel"d0.BackgroundTransparency=1
d0.Position=UDim2.new(0,8,0,0)d0.Size=UDim2.new(1,-16,1,0)
d0.Font=Enum.Font.GothamBold d0.TextSize=10 d0.TextXAlignment=0
d0.Text=string.upper(tostring(dZ))..((dU==dY)and(dV and" ^"or" v")or"")d0.Parent=d_
af:_tag(d0,"TextColor3","Dim")
local d1=dY
d_.MouseButton1Click:Connect(function()
if dU==d1 then dV=not dV else dU,dV=d1,true end
draw()
for d2,d3 in ipairs(dT:GetChildren())do
if d3:IsA"TextButton"then
local d4=d3:FindFirstChildOfClass"TextLabel"
if d4 then d4.Text=string.upper(tostring(dQ[d2]))..((dU==d2)and(dV and" ^"or" v")or"")end
end
end
end)
end
function dW.SetRows(dY,dZ)dR=dZ or{}draw()end
function dW.GetRows(dY)return dR end
draw()
return dK{Title=dE.Title or"Table",Frame=dS,_handle=dW}
end end function a.ad():typeof(__modImpl())local aa=a.cache.ad if not aa then aa={c=__modImpl()}a.cache.ad=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local du=
ab.T local dv=
ab.tween local dC=
ac.guid local dD=
ac.spawnCb
local dE=ac.corner local dK=
ac.hairline local dN=
ac.pad local dP=
ac.lighting local dQ=
ac.ripple local dR=
ac.spotlight local dS=
ac.attachTip local dT=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dU,dV)local dW=
dU.row local dX=
dU.titleBlock
local dY=dU.reg local dZ=
dU.tab local d_=
dU.Window local d0=
dU.Th local d1=
dU.opts or{}local d2=
dU.page
dV=dV or{}
local d3={}
for d4,d5 in ipairs(dV.Items or{})do table.insert(d3,d5)end
local d4=Instance.new"Frame"d4.BackgroundTransparency=1
d4.Size=UDim2.new(1,-4,0,0)d4.AutomaticSize=Enum.AutomaticSize.Y d4.Parent=dU.getParent()
local d5=Instance.new"UIListLayout"d5.Padding=UDim.new(0,2)d5.Parent=d4
local d6={}
local function draw()
for d7,d8 in ipairs(d4:GetChildren())do
if d8:IsA"Frame"then pcall(function()d8:Destroy()end)end
end
if#d3==0 then
local d7=Instance.new"TextLabel"d7.BackgroundTransparency=1
d7.Size=UDim2.new(1,0,0,22)d7.Font=Enum.Font.Gotham
d7.TextSize=11 d7.TextXAlignment=0 d7.Text="No activity yet."d7.Parent=d4
af:_tag(d7,"TextColor3","Dim")
return
end
local d7={info="Accent",ok="Success",warn="Warn",err="Danger"}
for d8,d9 in ipairs(d3)do
local ea=Instance.new"Frame"ea.BackgroundTransparency=1
ea.Size=UDim2.new(1,0,0,30)ea.Parent=d4
local eb=Instance.new"Frame"eb.Position=UDim2.new(0,4,0,8)
eb.Size=UDim2.fromOffset(8,8)eb.BorderSizePixel=0 dE(eb,99)eb.Parent=ea
af:_tag(eb,"BackgroundColor3",d7[d9.Kind or"info"]or"Accent")
local ec=Instance.new"TextLabel"ec.BackgroundTransparency=1
ec.Position=UDim2.new(0,20,0,2)ec.Size=UDim2.new(1,-70,0,16)
ec.Font=Enum.Font.Gotham ec.TextSize=12 ec.TextXAlignment=0
ec.TextTruncate=Enum.TextTruncate.AtEnd ec.Text=tostring(d9.Title or"")ec.Parent=ea
af:_tag(ec,"TextColor3","Text")
local ed=Instance.new"TextLabel"ed.BackgroundTransparency=1
ed.Position=UDim2.new(0,20,0,17)ed.Size=UDim2.new(1,-70,0,12)
ed.Font=Enum.Font.Gotham ed.TextSize=10 ed.TextXAlignment=0
ed.TextTruncate=Enum.TextTruncate.AtEnd
ed.Text=tostring(d9.Sub or"")ed.Parent=ea
af:_tag(ed,"TextColor3","Dim")
local ee=Instance.new"TextLabel"ee.BackgroundTransparency=1
ee.AnchorPoint=Vector2.new(1,0)ee.Position=UDim2.new(1,0,0,6)
ee.Size=UDim2.new(0,60,0,14)ee.Font=Enum.Font.Code
ee.TextSize=10 ee.TextXAlignment=1 ee.Text=tostring(d9.At or"")ee.Parent=ea
af:_tag(ee,"TextColor3","Dim")
end
end
function d6.Add(d7,d8)table.insert(d3,1,d8 or{})while#d3>20 do table.remove(d3)end draw()end
function d6.Clear(d7)d3={}draw()end
d6.Frame=d4
draw()
return dY{Title=dV.Title or"Timeline",Frame=d4,_handle=d6}
end end function a.ae():typeof(__modImpl())local aa=a.cache.ae if not aa then aa={c=__modImpl()}a.cache.ae=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local dE=
ab.T local dT=
ab.tween local dU=
ac.guid local dV=
ac.spawnCb
local dY=ac.corner
local d2=ac.hairline local d3=
ac.pad local d4=
ac.lighting local d5=
ac.ripple local d6=
ac.spotlight local d7=
ac.attachTip
local d8=ac.attachCtx local d9=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")


aa._favs=aa._favs or{}
aa._favRefresh=aa._favRefresh or{}
local function refreshAll()
for ea,eb in ipairs(aa._favRefresh)do pcall(eb)end
end
if not aa.Pin then
function aa.Pin(ea,eb,ec)
if not eb or eb==""then return end
for ed,ee in ipairs(aa._favs)do
if ee.label==eb and ee.tab==ea then return end
end
table.insert(aa._favs,1,{tab=ea,label=eb,go=ec})
while#aa._favs>24 do table.remove(aa._favs)end
refreshAll()
end
function aa.Unpin(ea,eb)
for ec,ed in ipairs(aa._favs)do
if(not ea or ed.tab==ea)and(not eb or ed.label==eb)then
table.remove(aa._favs,ec)
end
end
refreshAll()
end
function aa.IsPinned(ea,eb)
for ec,ed in ipairs(aa._favs)do
if ed.label==eb and(not ea or ed.tab==ea)then return true end
end
return false
end
end

return function(ea,eb)local ec=
ea.row local ed=
ea.titleBlock
local ee=ea.reg local ef=
ea.tab
local eg=ea.Window
local eh=ea.Th local ei=
ea.opts or{}local ej=
ea.page
local ek=ea.pgui
eb=eb or{}
local el=eb.Limit or 6
local em=Instance.new"Frame"em.BackgroundTransparency=1
em.Size=UDim2.new(1,-4,0,0)em.AutomaticSize=Enum.AutomaticSize.Y
em.Parent=ea.getParent()
local en=Instance.new"UIListLayout"en.Padding=UDim.new(0,4)
en.SortOrder=Enum.SortOrder.LayoutOrder en.Parent=em
local function refresh()
for eo,ep in ipairs(em:GetChildren())do
if ep:IsA"TextButton"or ep:IsA"TextLabel"then pcall(function()ep:Destroy()end)end
end
if#aa._favs==0 then
local eo=Instance.new"TextLabel"eo.BackgroundTransparency=1
eo.Size=UDim2.new(1,0,0,24)eo.Font=Enum.Font.Gotham
eo.TextSize=11 eo.TextXAlignment=0 eo.Text="Pin controls here with Kronos:Pin()."eo.Parent=em
af:_tag(eo,"TextColor3","Dim")
return
end
for eo=1,math.min(el,#aa._favs)do
local ep=aa._favs[eo]
local eq=Instance.new"TextButton"eq.Text=""
eq.Size=UDim2.new(1,0,0,30)eq.BackgroundColor3=eh.Surface
eq.BackgroundTransparency=0.35 eq.BorderSizePixel=0
dY(eq,7)eq.Parent=em
d2(eq,true)
af:_tag(eq,"BackgroundColor3","Surface")
local er=Instance.new"TextLabel"er.BackgroundTransparency=1
er.Position=UDim2.new(0,8,0,0)er.Size=UDim2.new(0,18,1,0)
er.Font=Enum.Font.GothamBold er.TextSize=12 er.Text="*"er.Parent=eq
af:_tag(er,"TextColor3","Accent")
local es=Instance.new"TextLabel"es.BackgroundTransparency=1
es.Position=UDim2.new(0,26,0,0)es.Size=UDim2.new(1,-106,1,0)
es.Font=Enum.Font.Gotham es.TextSize=12 es.TextXAlignment=0
es.TextTruncate=Enum.TextTruncate.AtEnd es.Text=ep.label es.Parent=eq
af:_tag(es,"TextColor3","Text")
local et=Instance.new"TextLabel"et.BackgroundTransparency=1
et.AnchorPoint=Vector2.new(1,0)et.Position=UDim2.new(1,-10,0,0)
et.Size=UDim2.new(0,74,1,0)et.Font=Enum.Font.Gotham
et.TextSize=10 et.TextXAlignment=1 et.Text=ep.tab et.Parent=eq
af:_tag(et,"TextColor3","Dim")
eq.MouseButton1Click:Connect(function()
if ep.go then af:_sfx"Click"pcall(ep.go)
else eg:Notify{Title="Unavailable",Content=ep.label,Duration=1.5}end
end)
d8(ek,eq,{{Title="Unpin",Callback=function()
aa.Unpin(ep.tab,ep.label)
end}})
end
end
table.insert(aa._favRefresh,refresh)
refresh()
return ee{Title=eb.Title or"Favorites",Frame=em,_handle={Refresh=refresh}}
end end function a.af():typeof(__modImpl())local aa=a.cache.af if not aa then aa={c=__modImpl()}a.cache.af=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local dY=
ab.T local d2=
ab.tween local d8=
ac.guid
local d9=ac.spawnCb
local ea=ac.corner
local eb=ac.hairline local ee=
ac.pad local eg=
ac.lighting local eh=
ac.ripple
local ej=ac.spotlight
local ek=ac.attachTip
local el=ac.attachCtx local em=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local en=ae.cloneref_check(game:GetService"Players")

return function(eo,ep)
local eq=eo.row local er=
eo.titleBlock
local es=eo.reg local et=
eo.tab local eu=
eo.Window
local ev=eo.Th local ew=
eo.opts or{}local ex=
eo.page
local ey=eo.pgui
ep=ep or{}
local ez=math.clamp(ep.Height or 230,140,320)
local eA=eq(ez)
ej(eA,0.06)
if ep.Tooltip then ek(eA,ep.Tooltip)end
if ep.ContextMenu then el(ey,eA,ep.ContextMenu)end
local eB=Instance.new"TextLabel"eB.BackgroundTransparency=1
eB.Position=UDim2.new(0,12,0,6)eB.Size=UDim2.new(1,-60,0,16)
eB.Font=Enum.Font.GothamMedium eB.TextSize=12 eB.TextXAlignment=0
eB.TextTruncate=Enum.TextTruncate.AtEnd
eB.Text=ep.Title or"Preview"eB.Parent=eA
af:_tag(eB,"TextColor3","Text")
local eC=Instance.new"Frame"eC.AnchorPoint=Vector2.new(1,0)
eC.Position=UDim2.new(1,-12,0,10)eC.Size=UDim2.fromOffset(8,8)
eC.BorderSizePixel=0 ea(eC,99)eC.Parent=eA
af:_tag(eC,"BackgroundColor3","Success")
local eD=Instance.new"ViewportFrame"eD.BackgroundColor3=ev.Bg
eD.BorderSizePixel=0 eD.Position=UDim2.new(0,10,0,28)
eD.Size=UDim2.new(1,-20,1,-36)ea(eD,8)eD.Parent=eA
af:_tag(eD,"BackgroundColor3","Bg")
eb(eD,true)
pcall(function()
eD.LightColor=Color3.fromRGB(235,235,240)
eD.LightDirection=Vector3.new(-0.4,-1,-0.7)
end)
local eE=Instance.new"WorldModel"eE.Parent=eD
local eF=Instance.new"Camera"eF.Parent=eD
eF.CFrame=CFrame.lookAt(Vector3.new(0,4,10),Vector3.new(0,2,0))
eD.CurrentCamera=eF
local eG=Instance.new"Part"eG.Name="_lamp"
eG.Size=Vector3.new(1,1,1)eG.Transparency=1 eG.Anchored=true
eG.CanCollide=false eG.CanQuery=false eG.CanTouch=false
eG.Position=Vector3.new(4,6,6)eG.Parent=eE
local eH=Instance.new"PointLight"eH.Brightness=1.6 eH.Range=40
eH.Color=Color3.fromRGB(255,244,230)eH.Parent=eG
local eI=Instance.new"Part"eI.Name="_lamp2"
eI.Size=Vector3.new(1,1,1)eI.Transparency=1 eI.Anchored=true
eI.CanCollide=false eI.CanQuery=false eI.CanTouch=false
eI.Position=Vector3.new(-5,3,-6)eI.Parent=eE
local eJ=Instance.new"PointLight"eJ.Brightness=1 eJ.Range=40
eJ.Color=Color3.fromRGB(140,170,255)eJ.Parent=eI
local eK=Instance.new"TextLabel"eK.BackgroundTransparency=1
eK.Size=UDim2.fromScale(1,1)eK.Font=Enum.Font.Gotham
eK.TextSize=12 eK.Text="Summoning avatar..."eK.Parent=eD
af:_tag(eK,"TextColor3","Dim")
local eL
pcall(function()eL=en.LocalPlayer end)
local eM=ep.Character or ep.Preset or(ep.UserId and"Player")or"Noob"
local eN=tonumber(ep.UserId)or(eL and eL.UserId)or 1
if tonumber(eM)then eN,eM=tonumber(eM),"Player"end
local eO
pcall(function()
eO=(ep.Rig=="R6")and Enum.HumanoidRigType.R6 or Enum.HumanoidRigType.R15
end)
local eP=ep.Zoom or 7.5
local eQ=ep.Spin~=false
local eR,eS,eT=0.6,Vector3.new(0,2,0),1.2
local eU={rig=nil,humanoid=nil,desc=nil,tracks={}}
local eV={}
local function aimAt(eW)
eS=eW+Vector3.new(0,1,0)
eT=1.4
eF.CFrame=CFrame.new(eS+Vector3.new(2.4,eT,eP),eS)
eR=math.atan2(2.4,eP)
end
local function applyDesc(eW)
if not eW then return false end
local eX=eU.humanoid
if not eX or not eX.Parent then return false end
local eY=pcall(function()eX:ApplyDescription(eW)end)
if eY then eU.desc=eW end
return eY
end
local function noobDescription()
local eW=Instance.new"HumanoidDescription"
pcall(function()
eW.HeadColor=Color3.fromRGB(245,205,30)
eW.TorsoColor=Color3.fromRGB(13,105,172)
eW.LeftArmColor=Color3.fromRGB(245,205,30)
eW.RightArmColor=Color3.fromRGB(245,205,30)
eW.LeftLegColor=Color3.fromRGB(164,189,71)
eW.RightLegColor=Color3.fromRGB(164,189,71)
eW.Face=48474313
eW.Head,eW.Torso=0,0
eW.LeftArm,eW.RightArm=0,0
eW.LeftLeg,eW.RightLeg=0,0
eW.Shirt,eW.Pants,eW.GraphicTShirt=0,0,0
end)
return eW
end
local function loadModel()
local eW,eX
if eM=="Noob"then
eW=noobDescription()
local eY
pcall(function()eY=Enum.HumanoidRigType.R6 end)
local eZ,e_=pcall(function()
if eY then
return en:CreateHumanoidModelFromDescription(eW,eY)
end
return en:CreateHumanoidModelFromDescription(eW)
end)
if not eZ then
eZ,e_=pcall(function()
return en:CreateHumanoidModelFromDescription(eW)
end)
end
if eZ and e_ then eX=e_ end
else
local eY,eZ=pcall(function()
return en:GetHumanoidDescriptionFromUserIdAsync(eN)
end)
if eY and eZ then
local e_,e0=pcall(function()
if eO then
return en:CreateHumanoidModelFromDescription(eZ,eO)
end
return en:CreateHumanoidModelFromDescription(eZ)
end)
if not e_ then
e_,e0=pcall(function()
return en:CreateHumanoidModelFromDescription(eZ)
end)
end
if e_ and e0 then eX,eW=e0,eZ end
end
if not eX and eL then
local e_=eL.Character
if e_ then
local e0,e1=pcall(function()return e_:Clone()end)
if e0 and e1 then
for e2,e3 in ipairs(e1:GetDescendants())do
pcall(function()
if e3:IsA"Script"or e3:IsA"LocalScript"or e3:IsA"ModuleScript"then
e3:Destroy()
elseif e3:IsA"BasePart"then
e3.Anchored=true e3.CanCollide=false
e3.CanQuery=false e3.CanTouch=false
end
end)
end
eX=e1
if not eW then
pcall(function()eW=en:GetHumanoidDescriptionFromUserIdAsync(eN)end)
end
end
end
end
end
if not eX then
pcall(function()eK.Text="Avatar failed to build."end)
pcall(function()eC.BackgroundColor3=ev.Danger end)
return
end
for eY,eZ in ipairs(eX:GetDescendants())do
pcall(function()
if eZ:IsA"BasePart"then
eZ.Anchored=true eZ.CanCollide=false
eZ.CanQuery=false eZ.CanTouch=false
end
end)
end
eX.Parent=eE
eU.rig=eX
eU.humanoid=eX:FindFirstChildOfClass"Humanoid"
if eW then eU.desc=eW end
local eY=eS
pcall(function()
local eZ=eX:FindFirstChild"HumanoidRootPart"
if eZ then eY=eZ.Position end
end)
aimAt(eY)
pcall(function()eK:Destroy()end)
end
local eW={"Head","Torso","LeftArm","RightArm","LeftLeg","RightLeg"}
function eV.SetColors(eX,eY)
if type(eY)~="table"then return end
local eZ=eU.desc
if not eZ then return end
if eY.All then
for e_,e0 in ipairs(eW)do
pcall(function()eZ[e0 .."Color"]=eY.All end)
end
else
for e_,e0 in ipairs(eW)do
if eY[e0]then pcall(function()eZ[e0 .."Color"]=eY[e0]end)end
end
end
applyDesc(eZ)
if ep.Flag then af.Flags[ep.Flag]=eY end
d9(ep.Callback,eY)d9(ep.OnChanged,eY)
end
function eV.SetOutfit(eX,eY)
if type(eY)~="table"then return end
local eZ=eU.desc
if not eZ then return end
for e_,e0 in pairs(eY)do pcall(function()eZ[e_]=e0 end)end
applyDesc(eZ)
end
function eV.ApplyDescription(eX,eY)applyDesc(eY)end
function eV.GetDescription(eX)return eU.desc end
function eV.SetZoom(eX,eY)
eP=math.clamp(tonumber(eY)or eP,3,20)
pcall(function()
eF.CFrame=CFrame.new(eS+Vector3.new(math.sin(eR)*eP,eT,math.cos(eR)*eP),eS)
end)
end
function eV.SetSpin(eX,eY)eQ=eY and true or false end
function eV.SetSource(eX,eY)
if eY=="Player"or eY=="Noob"then eM=eY eV:Refresh()end
end
function eV.PlayAnimation(eX,eY)
if not eY then return end
task.spawn(function()
pcall(function()
for eZ,e_ in ipairs(eU.tracks)do pcall(function()e_:Stop()e_:Destroy()end)end
eU.tracks={}
local eZ=eU.humanoid
local e_=eU.rig
if not eZ or not eZ.Parent or not e_ then return end
e_.Parent=workspace
local e0=eZ:FindFirstChildOfClass"Animator"
if not e0 then
e0=Instance.new"Animator"e0.Parent=eZ
end
local e1=Instance.new"Animation"
e1.AnimationId="rbxassetid://"..tostring(eY)
local e2=e0:LoadAnimation(e1)
table.insert(eU.tracks,e2)
e_.Parent=eE
e2:Play()
end)
end)
end
function eV.StopAnimations(eX)
pcall(function()
for eY,eZ in ipairs(eU.tracks)do pcall(function()eZ:Stop()eZ:Destroy()end)end
eU.tracks={}
end)
end
function eV.Refresh(eX)
pcall(function()
if eU.rig then eU.rig:Destroy()end
eU.rig,eU.humanoid,eU.tracks=nil,nil,{}
end)
task.spawn(loadModel)
end
task.spawn(loadModel)
task.spawn(function()
while eD.Parent do
task.wait(0.03)
pcall(function()
if eQ and eU.rig and eU.rig.Parent and eF then
eR=eR+0.03*(ep.SpinSpeed or 0.6)
eF.CFrame=CFrame.new(
eS+Vector3.new(math.sin(eR)*eP,eT,math.cos(eR)*eP),eS)
end
end)
end
end)
local eX={Title=ep.Title,Frame=eA,Flag=ep.Flag,_handle=eV,
_set=function(eX,eY)
if type(eX)=="table"then eV:SetColors(eX)end
end}
return es(eX)
end end function a.ag():typeof(__modImpl())local aa=a.cache.ag if not aa then aa={c=__modImpl()}a.cache.ag=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local d9=
ab.T local ea=
ab.tween local eb=
ac.guid
local ej=ac.spawnCb
local ek=ac.corner
local el=ac.hairline local em=
ac.pad local en=
ac.lighting
local eo=ac.ripple local ep=
ac.spotlight local eq=
ac.attachTip
local es=ac.applyLock local ev=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(ex,ey)
local ez=ex.row
local eA=ex.titleBlock
local eB=ex.reg local eC=
ex.tab local eD=
ex.Window
local eE=ex.Th local eF=
ex.opts or{}local eG=
ex.page
ey=ey or{}
local eH=ey.Locked==true
local eI=ey.Buttons or{}
local eJ=ey.Image and ey.Image~=""
local eK=ez(ey.Description and 64 or 46)
if#eI>0 then
eK.Size=UDim2.new(1,-4,0,eK.Size.Y.Offset+34)
end
eA(eK,ey.Title or"Paragraph",ey.Description,eJ and 160 or 24)
if eJ then
local eL=Instance.new"ImageLabel"
eL.BackgroundTransparency=1
eL.AnchorPoint=Vector2.new(1,0)eL.Position=UDim2.new(1,-12,0,8)
eL.Size=UDim2.fromOffset(ey.ImageSize or 48,ey.ImageSize or 48)
eL.Image=ey.Image eL.ScaleType=Enum.ScaleType.Crop
eL.Parent=eK
ek(eL,8)
end
for eL,eM in ipairs(eI)do
local eN=Instance.new"TextButton"eN.Text=""
eN.Position=UDim2.new(0,12+(eL-1)*118,1,-30)
eN.Size=UDim2.new(0,110,0,24)eN.BackgroundColor3=eE.Surface2
eN.BorderSizePixel=0 ek(eN,6)eN.AutoButtonColor=false eN.Parent=eK
el(eN,true)
af:_tag(eN,"BackgroundColor3","Surface2")
local eO=Instance.new"TextLabel"eO.BackgroundTransparency=1
eO.Size=UDim2.fromScale(1,1)eO.Font=Enum.Font.GothamBold
eO.TextSize=11 eO.TextTruncate=Enum.TextTruncate.AtEnd
eO.Text=tostring(eM.Title or eM.Text or"Open")eO.Parent=eN
af:_tag(eO,"TextColor3","Text")
eo(eN)
eN.MouseButton1Click:Connect(function()
if eH then return end
af:_sfx"Click"ej(eM.Callback)
end)
end
es(eK,eH)
local eL={}
function eL.SetLocked(eM,eN)
eH=eN and true or false
es(eK,eH)
end
function eL.GetLocked(eM)return eH end
return eB{Title=ey.Title,Frame=eK,_handle=eL}
end end function a.ah():typeof(__modImpl())local aa=a.cache.ah if not aa then aa={c=__modImpl()}a.cache.ah=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local ej=
ab.T local ek=
ab.tween local el=
ac.guid
local eo=ac.spawnCb
local es=ac.corner
local ev=ac.hairline local ex=
ac.pad local ey=
ac.lighting
local ez=ac.ripple
local eA=ac.spotlight
local eB=ac.attachTip
local eE=ac.applyLock
local eG=ac.starRow
local eH=ac.feedbackRow
local eI=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local eJ=ae.cloneref_check(game:GetService"Players")

return function(eK,eL)
local eM=eK.row
local eN=eK.titleBlock
local eO=eK.reg local eP=
eK.tab local eQ=
eK.Window
local eR=eK.Th local eS=
eK.opts or{}local eT=
eK.page
eL=eL or{}
local eU=eL.Locked==true
local eV=eL.Description and eL.Description~=""
local eW=(eL.Image and eL.Image~="")or eL.UserId~=nil
local eX=eL.ButtonText~=nil and eL.ButtonText~=""
local eY=type(eL.Rating)=="table"
local eZ=eV and 56 or 44
local e_=(eX and 42 or 0)+(eY and 96 or 0)
local e0=eM(eZ+e_)
eN(e0,eL.Title or"Card",eL.Description,90)
eA(e0,0.08)
if eL.Tooltip then eB(e0,eL.Tooltip)end
local e1=14
if eW then
local e2=Instance.new"Frame"
e2.BackgroundTransparency=1
e2.AnchorPoint=Vector2.new(0,0.5)
e2.Position=UDim2.new(0,10,0,eZ/2)
e2.Size=UDim2.fromOffset(34,34)
e2.BorderSizePixel=0 e2.ClipsDescendants=true
e2.Parent=e0
es(e2,8)
local e3=Instance.new"ImageLabel"
e3.BackgroundTransparency=1
e3.ScaleType=Enum.ScaleType.Crop
e3.Size=UDim2.fromScale(1,1)
e3.Parent=e2
es(e3,8)
if eL.UserId then
task.spawn(function()
local e4,e5=pcall(eJ.GetUserThumbnailAsync,eJ,
eL.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
if e4 and e5 and e3.Parent then e3.Image=e5 end
end)
else
e3.Image=eL.Image
end
e1=54
end
for e2,e3 in ipairs(e0:GetChildren())do
if e3:IsA"TextLabel"and e3.Position.X.Offset==14 then
e3.Position=UDim2.new(0,e1,e3.Position.Y.Scale,e3.Position.Y.Offset)
end
end
if eL.Callback then
local e2=eI("chevron",14,eR.Dim)
e2.AnchorPoint=Vector2.new(1,0.5)e2.Position=UDim2.new(1,-14,0,eZ/2)
e2.Parent=e0
local e3=Instance.new"TextButton"e3.Text=""
e3.BackgroundTransparency=1 e3.AutoButtonColor=false
e3.Size=UDim2.new(1,0,0,eZ)e3.Parent=e0
e3.MouseButton1Click:Connect(function()
if eU then return end
af:_sfx"Click"eo(eL.Callback)
end)
end
if eX then
local e2=Instance.new"TextButton"e2.Text=""
e2.Position=UDim2.new(0,12,0,eZ+4)
e2.Size=UDim2.new(1,-24,0,30)e2.BackgroundColor3=eR.Surface2
e2.BorderSizePixel=0 es(e2,7)e2.AutoButtonColor=false e2.Parent=e0
ev(e2,true)
af:_tag(e2,"BackgroundColor3","Surface2")
local e3=Instance.new"TextLabel"e3.BackgroundTransparency=1
e3.Size=UDim2.fromScale(1,1)e3.Font=Enum.Font.GothamBold
e3.TextSize=12
e3.Text=tostring(eL.ButtonText)e3.Parent=e2
af:_tag(e3,"TextColor3","Text")
ez(e2)
e2.MouseButton1Click:Connect(function()
if eU then return end
af:_sfx"Click"eo(eL.ButtonCallback or eL.Callback)
end)
end
if eY then
local e2=eL.Rating
local e3=eZ+(eX and 42 or 0)+8
local e4=eG(e0,0,5,Color3.fromRGB(255,196,64),20,e2.Default or 0)
e4.frame.Position=UDim2.new(0,12,0,e3)
local e5=eH(e0,0,26,e2.Placeholder or"Leave a comment...")
e5.frame.Position=UDim2.new(0,12,0,e3+24)
e5.frame.Size=UDim2.new(1,-24,0,26)
e5.SendBtn.MouseButton1Click:Connect(function()
if eU then return end
local e6=e4.Get()
if e6<=0 then e4.Nudge()return end
eo(e2.Callback,e6,e5.Box.Text)
eo(eL.Callback,e6,e5.Box.Text)
e5.Box.Text=""
e4.Set(e2.Default or 0)
end)
end
eE(e0,eU)
local e2={}
function e2.SetLocked(e3,e4)
eU=e4 and true or false
eE(e0,eU)
end
function e2.GetLocked(e3)return eU end
return eO{Title=eL.Title or"Card",Frame=e0,_handle=e2}
end end function a.ai():typeof(__modImpl())local aa=a.cache.ai if not aa then aa={c=__modImpl()}a.cache.ai=aa end return aa.c end end do local function __modImpl()a.a()






local aa=a.c()
local ab=a.e()
local ac=a.f()
local ad=a.h()
local ae=a.d()
local af=a.b()
local eo=a.x()

local es=ae.Z
local ev=aa.Tween
local ey=ab.corner
local ez=ab.stroke
local eA=ab.baseCard
local eB=ac.resolveIcon
local eE=ad.FontSemi
local eG=ad.FontReg
af.cloneref_check(game:GetService"RunService")
af.cloneref_check(game:GetService"UserInputService")

local function BuildStarRow(eH,eI,eJ,eK,eL,eM,eN)
local eO=eB"Phosphor:star"
local eR=eB"Material:star"

local eT=Instance.new"Frame"
eT.Name="Stars"
eT.BackgroundTransparency=1
eT.Size=UDim2.new(1,0,0,eL)
eT.LayoutOrder=eI
eT.ZIndex=es.Content+1
eT.Parent=eH

local eU=Instance.new"UIListLayout"
eU.FillDirection=Enum.FillDirection.Horizontal
eU.HorizontalAlignment=Enum.HorizontalAlignment.Center
eU.VerticalAlignment=Enum.VerticalAlignment.Center
eU.Padding=UDim.new(0,8)
eU.SortOrder=Enum.SortOrder.LayoutOrder
eU.Parent=eT

local eV={}
local eW=math.clamp(eM or 0,0,eJ)
local eX={}

local function paint(eY)
local eZ=eY or eW
for e_,e0 in ipairs(eV)do
local e1=e_<=eZ
e0.Image=e1 and eR or eO
if eX[e_]then pcall(function()eX[e_]:Cancel()end)end
eX[e_]=ev(e0,{ImageColor3=e1 and eK or eN.Dim},0.12)
end
end

for eY=1,eJ do
local eZ=Instance.new"ImageButton"
eZ.Name="Star"..eY
eZ.BackgroundTransparency=1
eZ.AutoButtonColor=false
eZ.Image=eO
eZ.ImageColor3=eN.Dim
eZ.Size=UDim2.fromOffset(eL,eL)
eZ.LayoutOrder=eY
eZ.ZIndex=es.Content+2
eZ.Parent=eT

eZ.MouseEnter:Connect(function()paint(eY)end)
eZ.MouseLeave:Connect(function()paint()end)
eZ.MouseButton1Click:Connect(function()
eW=eY
paint()
end)

eV[eY]=eZ
end
paint()

return{
Row=eT,
Get=function()return eW end,
Set=function(eY)
eW=math.clamp(eY or 0,0,eJ)
paint()
end,
Nudge=function()
for eY,eZ in ipairs(eV)do
if eX[eZ]then pcall(function()eX[eZ]:Cancel()end)end
eX[eZ]=ev(eZ,{Rotation=8},0.06)
end
task.delay(0.06,function()
for eY,eZ in ipairs(eV)do
if eX[eZ]then pcall(function()eX[eZ]:Cancel()end)end
eX[eZ]=ev(eZ,{Rotation=0},0.12)
end
end)
end,
}
end

local function BuildFeedbackRow(eH,eI,eJ,eK,eL,eM)
local eN=Instance.new"Frame"
eN.Name="Feedback"
eN.BackgroundTransparency=1
eN.Size=UDim2.new(1,0,0,eJ)
eN.LayoutOrder=eI
eN.ZIndex=es.Content+1
eN.Parent=eH

local eO=Instance.new"Frame"
eO.Name="Pill"
eO.BackgroundColor3=Color3.new(1,1,1)
eO.BackgroundTransparency=0.95
eO.BorderSizePixel=0
eO.Size=UDim2.new(1,-(eJ+6),1,0)
eO.ZIndex=es.Content+1
eO.Parent=eN
ey(eO,9)
local eR=ez(eO,Color3.new(1,1,1),1,0.9)

local eT=Instance.new"UIPadding"
eT.PaddingLeft=UDim.new(0,10)
eT.PaddingRight=UDim.new(0,10)
eT.Parent=eO

local eU=Instance.new"TextBox"
eU.BackgroundTransparency=1
eU.ClearTextOnFocus=false
eU.FontFace=eG
eU.PlaceholderText=eK or"Give us some feedback!"
eU.PlaceholderColor3=Color3.fromRGB(120,120,122)
eU.Text=""
eU.TextColor3=eM.Text
eU.TextSize=13
eU.TextXAlignment=Enum.TextXAlignment.Left
eU.TextYAlignment=Enum.TextYAlignment.Center
eU.TextTruncate=Enum.TextTruncate.AtEnd
eU.ClipsDescendants=true
eU.Size=UDim2.fromScale(1,1)
eU.ZIndex=es.Content+2
eU.Parent=eO

eU.Focused:Connect(function()
ev(eR,{Color=eM.Accent,Transparency=0.3},0.15)
end)
eU.FocusLost:Connect(function()
ev(eR,{Color=Color3.new(1,1,1),Transparency=0.9},0.15)
end)

local eV=Instance.new"TextButton"
eV.Name="Send"
eV.Text=""
eV.AutoButtonColor=false
eV.BackgroundColor3=Color3.new(1,1,1)
eV.BackgroundTransparency=0.9
eV.BorderSizePixel=0
eV.AnchorPoint=Vector2.new(1,0)
eV.Position=UDim2.new(1,0,0,0)
eV.Size=UDim2.fromOffset(eJ,eJ)
eV.ZIndex=es.Content+1
eV.Parent=eN
ey(eV,9)

local eW=Instance.new"ImageLabel"
eW.BackgroundTransparency=1
eW.Image=eB(eL or"send")
eW.ImageColor3=eM.Text
eW.Size=UDim2.fromOffset(12,12)
eW.AnchorPoint=Vector2.new(0.5,0.5)
eW.Position=UDim2.fromScale(0.5,0.5)
eW.ZIndex=es.Content+2
eW.Parent=eV

eV.MouseEnter:Connect(function()ev(eV,{BackgroundTransparency=0.8},0.12)end)
eV.MouseLeave:Connect(function()ev(eV,{BackgroundTransparency=0.9},0.12)end)

return{Row=eN,Box=eU,SendBtn=eV}
end

return function(eH,eI)
local eJ=eH.reg local eK=
eH.tab
local eL=eH.Window
local eM=eH.Th
eI=eI or{}
local eN=math.max(1,eI.MaxStars or 5)
local eO=eI.StarColor or Color3.fromRGB(255,196,64)
local eR=eI.Title and eI.Title~=""

local eT=eA(eH.getParent(),10)
eT.AutomaticSize=Enum.AutomaticSize.Y

local eU=Instance.new"UIPadding"
eU.PaddingTop=UDim.new(0,10)
eU.PaddingBottom=UDim.new(0,10)
eU.PaddingLeft=UDim.new(0,14)
eU.PaddingRight=UDim.new(0,14)
eU.Parent=eT

local eV=Instance.new"UIListLayout"
eV.Padding=UDim.new(0,8)
eV.SortOrder=Enum.SortOrder.LayoutOrder
eV.Parent=eT

if eR then
local eW=Instance.new"TextLabel"
eW.BackgroundTransparency=1
eW.FontFace=eE
eW.Text=eI.Title
eW.TextColor3=eM.Text
eW.TextSize=14
eW.TextXAlignment=Enum.TextXAlignment.Left
eW.Size=UDim2.new(1,0,0,16)
eW.LayoutOrder=1
eW.ZIndex=es.Content+1
eW.Parent=eT
end

local eW=BuildStarRow(eT,2,eN,eO,20,eI.Default,eM)
local eX=BuildFeedbackRow(eT,3,26,eI.Placeholder,eI.ButtonIcon,eM)

local function notifyMsg(eY)
eL:Notify{Title=eY.Title,Text=eY.Text,Type=eY.Type,Duration=eY.Duration}
end

local eY=eI.ClearOnSubmit~=false
eX.SendBtn.MouseButton1Click:Connect(function()
local eZ=eW.Get()
if eZ<=0 then
eW.Nudge()
return
end
if eI.Callback then task.spawn(eI.Callback,eZ,eX.Box.Text)end
if eI.WebhookUrl then
task.spawn(function()
eo.SendFeedbackWebhook(eI.WebhookUrl,eZ,eX.Box.Text,eI.WebhookOptions,eI.CloudService,notifyMsg)
end)
end
if eY then
eX.Box.Text=""
eW.Set(eI.Default or 0)
end
end)

local eZ={
Instance=eT,
Get=function()return eW.Get(),eX.Box.Text end,
Set=function(eZ,e_,e0)
eW.Set(e_)
if e0~=nil then eX.Box.Text=e0 end
end,
Destroy=function()eT:Destroy()end,
}
eJ{Title=eI.Title or"Rating",Frame=eT,_handle=eZ}
return eZ
end end function a.aj():typeof(__modImpl())local aa=a.cache.aj if not aa then aa={c=__modImpl()}a.cache.aj=aa end return aa.c end end do local function __modImpl()a.a()a.c()







local aa=a.e()a.f()

local ab=a.h()
local ac=a.d()
local ad=a.b()

local ae=ac.Z
local af=aa.corner
local eo=aa.baseCard
ad.cloneref_check(game:GetService"RunService")
ad.cloneref_check(game:GetService"UserInputService")

local function GetUIScale()return 1 end

return function(es,ev)
local ey=es.reg
local ez=es.Th
ev=ev or{}
local eA=ev.Title or"Info"
local eB=ev.Description and ev.Description~=""
local eE=ev.Items or{}
local eG=ev.Color
local eH=ev.Columns or 2

local eI=12
local eJ=eB and 32 or 16
local eK=38
local eL=8
local eM=math.ceil(#eE/eH)
local eN=eM>0 and(eM*eK+(eM-1)*eL)or 0
local eO=eI*2+eJ+(eM>0 and(10+eN)or 0)

local eR=eo(es.getParent(),eO)

local eT=0
if eG then
local eU=Instance.new"Frame"
eU.Name="Accent"
eU.BackgroundColor3=eG
eU.BorderSizePixel=0
eU.Size=UDim2.new(0,3,1,-12)
eU.Position=UDim2.fromOffset(0,6)
eU.ZIndex=ae.Content+1
eU.Parent=eR
af(eU,1.5)
eT=6
end

local eU=Instance.new"UIPadding"
eU.PaddingTop=UDim.new(0,eI)
eU.PaddingBottom=UDim.new(0,eI)
eU.PaddingLeft=UDim.new(0,eI+eT)
eU.PaddingRight=UDim.new(0,eI)
eU.Parent=eR

local eV=Instance.new"TextLabel"
eV.BackgroundTransparency=1
eV.FontFace=ab.FontSemi
eV.Text=eA
eV.TextColor3=ez.Text
eV.TextSize=14
eV.TextXAlignment=Enum.TextXAlignment.Left
eV.TextTruncate=Enum.TextTruncate.AtEnd
eV.Position=UDim2.fromOffset(0,0)
eV.Size=UDim2.new(1,0,0,16)
eV.ZIndex=ae.Content+1
eV.Parent=eR

if eB then
local eW=Instance.new"TextLabel"
eW.BackgroundTransparency=1
eW.FontFace=ab.FontReg
eW.Text=ev.Description
eW.TextColor3=ez.Dim
eW.TextSize=12
eW.TextWrapped=true
eW.TextXAlignment=Enum.TextXAlignment.Left
eW.TextYAlignment=Enum.TextYAlignment.Top
eW.Position=UDim2.fromOffset(0,18)
eW.Size=UDim2.new(1,0,0,14)
eW.ZIndex=ae.Content+1
eW.Parent=eR
end

local eW={}

if eM>0 then
local eX=Instance.new"Frame"
eX.Name="Grid"
eX.BackgroundTransparency=1
eX.Position=UDim2.fromOffset(0,eJ+10)
eX.Size=UDim2.new(1,0,0,eN)
eX.ZIndex=ae.Content+1
eX.Parent=eR

local eY=Instance.new"UIGridLayout"
eY.CellPadding=UDim2.fromOffset(eL,eL)
eY.FillDirectionMaxCells=eH
eY.SortOrder=Enum.SortOrder.LayoutOrder
eY.Parent=eX

local function relayout()
local eZ=eX.AbsoluteSize.X/GetUIScale()
if eZ<=0 then return end
local e_=(eZ-eL*(eH-1))/eH
eY.CellSize=UDim2.fromOffset(e_,eK)
end
eX:GetPropertyChangedSignal"AbsoluteSize":Connect(relayout)
task.defer(relayout)

for eZ,e_ in ipairs(eE)do
local e0=Instance.new"Frame"
e0.Name="Chip"..eZ
e0.BackgroundColor3=Color3.new(1,1,1)
e0.BackgroundTransparency=0.95
e0.BorderSizePixel=0
e0.LayoutOrder=eZ
e0.ZIndex=ae.Content+2
e0.Parent=eX
af(e0,6)

local e1=Instance.new"UIPadding"
e1.PaddingTop=UDim.new(0,6)
e1.PaddingLeft=UDim.new(0,8)
e1.PaddingRight=UDim.new(0,8)
e1.Parent=e0

local e2=Instance.new"TextLabel"
e2.BackgroundTransparency=1
e2.FontFace=ab.FontSemi
e2.Text=tostring(e_.Label or"")
e2.TextColor3=ez.Text
e2.TextSize=12
e2.TextXAlignment=Enum.TextXAlignment.Left
e2.TextTruncate=Enum.TextTruncate.AtEnd
e2.Size=UDim2.new(1,0,0,15)
e2.ZIndex=ae.Content+3
e2.Parent=e0

local e3=Instance.new"TextLabel"
e3.Name="Value"
e3.BackgroundTransparency=1
e3.FontFace=ab.FontReg
e3.Text=tostring(e_.Value or"")
e3.TextColor3=ez.Dim
e3.TextSize=11
e3.TextXAlignment=Enum.TextXAlignment.Left
e3.TextTruncate=Enum.TextTruncate.AtEnd
e3.Position=UDim2.fromOffset(0,15)
e3.Size=UDim2.new(1,0,0,12)
e3.ZIndex=ae.Content+3
e3.Parent=e0

if e_.Label then eW[e_.Label]=e3 end
end
end

local eX={
Instance=eR,
SetValue=function(eX,eY,eZ)
local e_=eW[eY]
if e_ then e_.Text=tostring(eZ)end
end,
Destroy=function()eR:Destroy()end,
}
ey{Title=eA,Frame=eR,_handle=eX}
return eX
end end function a.ak():typeof(__modImpl())local aa=a.cache.ak if not aa then aa={c=__modImpl()}a.cache.ak=aa end return aa.c end end do local function __modImpl()a.a()a.c()a.e()a.f()a.h()a.d()











local aa=a.b()
local ab=a.ak()

aa.cloneref_check(game:GetService"RunService")
aa.cloneref_check(game:GetService"UserInputService")

return function(ac,ad)
local ae=ac.tab
ad=ad or{}
local af=ad.Service
local eo=ad.Interval or 30

local es=ab(ac,{
Title=ad.Title or"Active Users",
Description=ad.Description,
Color=ad.Color,
Columns=1,
Items={{Label="Active Now",Value="--"}},
})

if not af then
es:SetValue("Active Now","No Service configured")
return es
end

local ev=true
ae._window:Track(function()ev=false end)

task.spawn(function()
while ev and es.Instance.Parent do
af:Heartbeat()
local ey,ez=af:GetActiveCount()
if ev and es.Instance.Parent then
es:SetValue("Active Now",ey and tostring(ey)or("Error: "..tostring(ez)))
end
task.wait(eo)
end
end)

return es
end end function a.al():typeof(__modImpl())local aa=a.cache.al if not aa then aa={c=__modImpl()}a.cache.al=aa end return aa.c end end do local function __modImpl()a.a()a.c()a.e()a.f()a.h()a.d()










local aa=a.b()
local ab=a.y()
local ac=a.ak()

local ad=aa.cloneref_check(game:GetService"RunService")
aa.cloneref_check(game:GetService"UserInputService")

return function(ae,af)
local eo=ae.tab
af=af or{}

local es=ab.BumpRunCount()

local ev=ac(ae,{
Title=af.Title or"System Info",
Description=af.Description,
Color=af.Color,
Columns=af.Columns or 2,
Items={
{Label="FPS",Value="--"},
{Label="Ping",Value="-- ms"},
{Label="Executor",Value=ab.GetExecutorName()},
{Label="Executions",Value=tostring(es)},
{Label="Server Region",Value="Unknown"},
{Label="Time of Day",Value="--:--"},
},
})

ab.ensure()
local ey=true
local ez=0
local eA
pcall(function()
eA=ad.Heartbeat:Connect(function()
if not ey then return end
local eB=os.clock()
if eB-ez>=1 then
ez=eB
pcall(function()ev:SetValue("FPS",ab.GetFps())end)
end
end)
end)

eo._window:Track(function()
ey=false
if eA then pcall(function()eA:Disconnect()end)end
end)

task.spawn(function()
while ey and ev.Instance.Parent do
pcall(function()
local eB=ab.GetPingMs()or 0
ev:SetValue("Ping",math.floor(eB).." ms")

local eE=tonumber(os.date"%H")
local eG=tonumber(os.date"%M")
ev:SetValue("Time of Day",ab.FormatClock((eE or 0)*60+(eG or 0)))
end)
task.wait(1)
end
end)

task.spawn(function()
local eB=ab.GetRegion()
if eB and eB~=""and ey then
pcall(function()ev:SetValue("Server Region",eB)end)
end
end)

return ev
end end function a.am():typeof(__modImpl())local aa=a.cache.am if not aa then aa={c=__modImpl()}a.cache.am=aa end return aa.c end end do local function __modImpl()a.a()





local aa=a.c()
local ab=a.e()
local ac=a.f()
local ad=a.h()
local ae=a.d()
local af=a.b()

local eo=ae.Z
local es=aa.Tween
local ev=ab.corner
local ey=ab.stroke
local ez=ac.resolveIcon
local eA=af.cloneref_check(game:GetService"Players")
local eB=eA.LocalPlayer
af.cloneref_check(game:GetService"RunService")
af.cloneref_check(game:GetService"UserInputService")

return function(eE,eG)
local eH=eE.tab
local eI=eE.Window
local eJ=eE.Th
eG=eG or{}
local eK=eG.Service
local eL=eG.Interval or 30
local eM=math.clamp(eG.Limit or 5,1,50)
local eN=eG.Title or"Leaderboard"
local eO=eG.Description and eG.Description~=""

local eR=12
local eT=eO and 32 or 16
local eU,eV=44,6
local eW=eR+eT+12
local eX=eM*eU+(eM-1)*eV
local eY=eW+eX+eR

local eZ=Instance.new"Frame"
eZ.Name="Leaderboard"
eZ.BackgroundColor3=eJ.Surface
eZ.BackgroundTransparency=0.35
eZ.BorderSizePixel=0
eZ.ClipsDescendants=true
eZ.Size=UDim2.new(1,0,0,eY)
eZ.ZIndex=eo.Content
eZ.Parent=eE.getParent()
ev(eZ,8)
ey(eZ,Color3.new(1,1,1),1,0.92)

local e_=Instance.new"TextLabel"
e_.BackgroundTransparency=1
e_.FontFace=ad.FontSemi
e_.Text=eN
e_.TextColor3=eJ.Text
e_.TextSize=14
e_.TextXAlignment=Enum.TextXAlignment.Left
e_.TextTruncate=Enum.TextTruncate.AtEnd
e_.Position=UDim2.fromOffset(eR,eR)
e_.Size=UDim2.new(1,-eR*2-32,0,16)
e_.ZIndex=eo.Content+1
e_.Parent=eZ

if eO then
local e0=Instance.new"TextLabel"
e0.BackgroundTransparency=1
e0.FontFace=ad.FontReg
e0.Text=eG.Description
e0.TextColor3=eJ.Dim
e0.TextSize=12
e0.TextWrapped=true
e0.TextXAlignment=Enum.TextXAlignment.Left
e0.TextYAlignment=Enum.TextYAlignment.Top
e0.Position=UDim2.fromOffset(eR,eR+18)
e0.Size=UDim2.new(1,-eR*2-32,0,14)
e0.ZIndex=eo.Content+1
e0.Parent=eZ
end

local e0=eG.RevealByDefault==true

local e1=Instance.new"TextButton"
e1.Name="RevealToggle"
e1.Text=""
e1.AutoButtonColor=false
e1.BackgroundColor3=Color3.new(1,1,1)
e1.BackgroundTransparency=1
e1.BorderSizePixel=0
e1.AnchorPoint=Vector2.new(1,0)
e1.Position=UDim2.new(1,-eR,0,eR-4)
e1.Size=UDim2.fromOffset(24,24)
e1.ZIndex=eo.Content+2
e1.Parent=eZ
ev(e1,7)

local e2=Instance.new"ImageLabel"
e2.BackgroundTransparency=1
e2.Image=ez(e0 and"eye"or"eye-off")
e2.ImageColor3=eJ.Dim
e2.Size=UDim2.fromOffset(14,14)
e2.AnchorPoint=Vector2.new(0.5,0.5)
e2.Position=UDim2.fromScale(0.5,0.5)
e2.ZIndex=eo.Content+3
e2.Parent=e1

eH._window:Track(e1.MouseEnter:Connect(function()
es(e1,{BackgroundTransparency=0.9},0.12)
es(e2,{ImageColor3=eJ.Text},0.12)
end))
eH._window:Track(e1.MouseLeave:Connect(function()
es(e1,{BackgroundTransparency=1},0.12)
es(e2,{ImageColor3=eJ.Dim},0.12)
end))

local e3=Instance.new"Frame"
e3.BackgroundColor3=Color3.new(1,1,1)
e3.BackgroundTransparency=0.92
e3.BorderSizePixel=0
e3.Position=UDim2.fromOffset(0,eR+eT+8)
e3.Size=UDim2.new(1,0,0,1)
e3.ZIndex=eo.Content+1
e3.Parent=eZ

local e4=Instance.new"Frame"
e4.Name="Rows"
e4.BackgroundTransparency=1
e4.Position=UDim2.fromOffset(eR,eW)
e4.Size=UDim2.new(1,-eR*2,0,eX)
e4.ZIndex=eo.Content+1
e4.Parent=eZ

local e5=Instance.new"UIListLayout"
e5.Padding=UDim.new(0,eV)
e5.SortOrder=Enum.SortOrder.LayoutOrder
e5.Parent=e4

local e6=Instance.new"TextLabel"
e6.BackgroundTransparency=1
e6.FontFace=ad.FontReg
e6.Text="No one's run this yet"
e6.TextColor3=eJ.Dim
e6.TextSize=12
e6.Position=UDim2.fromOffset(eR,eW+10)
e6.Size=UDim2.new(1,-eR*2,0,16)
e6.Visible=false
e6.ZIndex=eo.Content+1
e6.Parent=eZ

local e7={
[1]=Color3.fromRGB(255,196,64),
[2]=Color3.fromRGB(203,209,217),
[3]=Color3.fromRGB(205,141,92),
}
local e8={[1]="crown",[2]="medal",[3]="medal"}

local function formatSeconds(e9)
e9=math.floor(e9 or 0)
local fa=math.floor(e9/3600)
local fb=math.floor((e9%3600)/60)
if fa>0 then return string.format("%dh %dm",fa,fb)end
if fb>0 then return string.format("%dm",fb)end
return string.format("%ds",e9)
end

local function fallbackLabel(e9)
local fa=(e9 or""):gsub("-",""):sub(1,4):upper()
return"Player-"..(fa~=""and fa or"????")
end

local e9={}
local function clearRows()
for fa,fb in ipairs(e9)do fb:Destroy()end
table.clear(e9)
end

local function buildRow(fa,fb)
local fc=e7[fa]

local fd=Instance.new"Frame"
fd.Name="Row"..fa
fd.Active=true
fd.BackgroundColor3=Color3.new(1,1,1)
fd.BackgroundTransparency=fb.IsYou and 0.9 or 0.96
fd.BorderSizePixel=0
fd.LayoutOrder=fa
fd.Size=UDim2.new(1,0,0,eU)
fd.ZIndex=eo.Content+2
fd.Parent=e4
ev(fd,8)
ey(fd,Color3.new(1,1,1),1,fb.IsYou and 0.88 or 0.94)

local fe=fd.BackgroundTransparency
fd.MouseEnter:Connect(function()es(fd,{BackgroundTransparency=fe-0.05},0.12)end)
fd.MouseLeave:Connect(function()es(fd,{BackgroundTransparency=fe},0.12)end)

local ff=Instance.new"UIPadding"
ff.PaddingLeft=UDim.new(0,10)
ff.PaddingRight=UDim.new(0,10)
ff.Parent=fd

local fg=Instance.new"Frame"
fg.AnchorPoint=Vector2.new(0,0.5)
fg.Position=UDim2.new(0,0,0.5,0)
fg.Size=UDim2.fromOffset(28,28)
fg.BackgroundColor3=Color3.new(1,1,1)
fg.BackgroundTransparency=0.94
fg.BorderSizePixel=0
fg.ZIndex=eo.Content+3
fg.Parent=fd
ev(fg,14)
ey(fg,Color3.new(1,1,1),1,0.9)

if fc then
local fh=Instance.new"ImageLabel"
fh.BackgroundTransparency=1
fh.Image=ez(e8[fa])
fh.ImageColor3=fc
fh.Size=UDim2.fromOffset(15,15)
fh.AnchorPoint=Vector2.new(0.5,0.5)
fh.Position=UDim2.fromScale(0.5,0.5)
fh.ZIndex=eo.Content+4
fh.Parent=fg
else
local fh=Instance.new"TextLabel"
fh.BackgroundTransparency=1
fh.FontFace=ad.FontSemi
fh.Text="#"..tostring(fa)
fh.TextColor3=eJ.Dim
fh.TextSize=11
fh.Size=UDim2.fromScale(1,1)
fh.ZIndex=eo.Content+4
fh.Parent=fg
end

local fh=Instance.new"Frame"
fh.AnchorPoint=Vector2.new(0,0.5)
fh.Position=UDim2.new(0,34,0.5,0)
fh.Size=UDim2.fromOffset(28,28)
fh.BackgroundColor3=Color3.new(1,1,1)
fh.BackgroundTransparency=0.94
fh.BorderSizePixel=0
fh.ClipsDescendants=true
fh.ZIndex=eo.Content+3
fh.Parent=fd
ev(fh,14)
ey(fh,Color3.new(1,1,1),1,0.85)

if fb.UserId and fb.UserId~=0 then
local fi=Instance.new"ImageLabel"
fi.BackgroundTransparency=1
fi.ScaleType=Enum.ScaleType.Crop
fi.Size=UDim2.fromScale(1,1)
fi.ZIndex=eo.Content+4
fi.Parent=fh
task.spawn(function()
local fj,fk=pcall(
eA.GetUserThumbnailAsync,
eA,
fb.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size48x48
)
if fj and fk and fi.Parent then
fi.Image=fk
end
end)
else
local fi=Instance.new"ImageLabel"
fi.BackgroundTransparency=1
fi.Image=ez"user"
fi.ImageColor3=eJ.Dim
fi.Size=UDim2.fromOffset(14,14)
fi.AnchorPoint=Vector2.new(0.5,0.5)
fi.Position=UDim2.fromScale(0.5,0.5)
fi.ZIndex=eo.Content+4
fi.Parent=fh
end

local fi=Instance.new"TextLabel"
fi.BackgroundTransparency=1
fi.FontFace=ad.FontSemi
fi.Text=(fb.NamePreview and fb.NamePreview~=""and fb.NamePreview or fallbackLabel(fb.Identity))
..(fb.IsYou and"  (You)"or"")
fi.TextColor3=eJ.Text
fi.TextSize=13
fi.TextXAlignment=Enum.TextXAlignment.Left
fi.TextTruncate=Enum.TextTruncate.AtEnd
fi.Position=UDim2.fromOffset(70,0)
fi.Size=UDim2.new(1,-138,1,0)
fi.ZIndex=eo.Content+3
fi.Parent=fd

local fj=Instance.new"TextLabel"
fj.BackgroundTransparency=1
fj.FontFace=ad.FontReg
fj.Text=formatSeconds(fb.Seconds)
fj.TextColor3=eJ.Dim
fj.TextSize=12
fj.TextXAlignment=Enum.TextXAlignment.Right
fj.AnchorPoint=Vector2.new(1,0)
fj.Position=UDim2.new(1,0,0,0)
fj.Size=UDim2.fromOffset(60,eU)
fj.ZIndex=eo.Content+3
fj.Parent=fd

return fd
end

local function renderRows(fa)
clearRows()
e6.Visible=#fa==0

for fb,fc in ipairs(fa)do
if fb>eM then break end
table.insert(e9,buildRow(fb,fc))
end
end

renderRows{}

local fa={Instance=eZ}

if not eK then
reg{Title=eN,Frame=eZ,_handle=fa}
return fa
end

local function maskName(fb,fc)
local fd=eB.Name or""
return fd:sub(1,fb)..fc
end

eH._window:Track(e1.MouseButton1Click:Connect(function()
e0=not e0
e2.Image=ez(e0 and"eye"or"eye-off")
eI:Notify{
Title="Leaderboard",
Text=e0
and"Your avatar and more of your name will show on the leaderboard."
or"Back to anonymous -- only 2 letters of your name will show.",
Type="info",
Duration=3,
}
end))

local fb=true
eH._window:Track(function()fb=false end)

task.spawn(function()
while fb and eZ.Parent do
local fc=e0
and{UserId=eB.UserId,NamePreview=maskName(4,"*******")}
or{UserId=0,NamePreview=maskName(2,"********")}
eK:Heartbeat(fc)local

fd=eK:GetLeaderboard(eM)
if fb and eZ.Parent and fd then
for fe,ff in ipairs(fd)do
ff.IsYou=ff.Identity==eK.Identity
end
renderRows(fd)
end
task.wait(eL)
end
end)

reg{Title=eN,Frame=eZ,_handle=fa}
return fa
end end function a.an():typeof(__modImpl())local aa=a.cache.an if not aa then aa={c=__modImpl()}a.cache.an=aa end return aa.c end end do local function __modImpl()a.a()a.c()







local aa=a.e()
local ab=a.f()
local ac=a.h()
local ad=a.d()
local ae=a.b()

local af=ad.Z
local eo=aa.corner
local es=aa.baseCard
local ev=ab.resolveIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

local ey={
Added={Color=Color3.fromRGB(120,210,140),Icon="plus"},
Fixed={Color=Color3.fromRGB(120,170,255),Icon="wrench"},
Changed={Color=Color3.fromRGB(255,190,90),Icon="refresh-cw"},
Removed={Color=Color3.fromRGB(230,120,120),Icon="minus"},
}

return function(ez,eA)
local eB=ez.reg
local eE=ez.Th
eA=eA or{}
local eG=eA.Version or"Update"
local eH=eA.Date
local eI=eA.Changes or{}

local eJ=12
local eK=18
local eL=22
local eM=2
local eN=eJ*2+eK+(#eI>0 and 8 or 0)

local eO=es(ez.getParent(),eN)
eO.AutomaticSize=Enum.AutomaticSize.Y

local eR=Instance.new"UIPadding"
eR.PaddingTop=UDim.new(0,eJ)
eR.PaddingBottom=UDim.new(0,eJ)
eR.PaddingLeft=UDim.new(0,eJ)
eR.PaddingRight=UDim.new(0,eJ)
eR.Parent=eO

local eT=Instance.new"TextLabel"
eT.BackgroundTransparency=1
eT.FontFace=ac.FontSemi
eT.Text=eG
eT.TextColor3=eE.Text
eT.TextSize=14
eT.TextXAlignment=Enum.TextXAlignment.Left
eT.TextTruncate=Enum.TextTruncate.AtEnd
eT.Size=UDim2.new(1,eH and-90 or 0,0,eK)
eT.ZIndex=af.Content+1
eT.Parent=eO

if eH then
local eU=Instance.new"TextLabel"
eU.BackgroundTransparency=1
eU.FontFace=ac.FontReg
eU.Text=eH
eU.TextColor3=eE.Dim
eU.TextSize=12
eU.TextXAlignment=Enum.TextXAlignment.Right
eU.AnchorPoint=Vector2.new(1,0)
eU.Position=UDim2.new(1,0,0,2)
eU.Size=UDim2.fromOffset(90,eK)
eU.ZIndex=af.Content+1
eU.Parent=eO
end

local eU=Instance.new"Frame"
eU.Name="Rows"
eU.BackgroundTransparency=1
eU.Position=UDim2.fromOffset(0,eK+8)
eU.Size=UDim2.new(1,0,0,0)
eU.AutomaticSize=Enum.AutomaticSize.Y
eU.ZIndex=af.Content+1
eU.Parent=eO

local eV=Instance.new"UIListLayout"
eV.FillDirection=Enum.FillDirection.Vertical
eV.SortOrder=Enum.SortOrder.LayoutOrder
eV.Padding=UDim.new(0,eM)
eV.Parent=eU

for eW,eX in ipairs(eI)do
local eY=ey[eX.Type]and eX.Type or"Changed"
local eZ=ey[eY]

local e_=Instance.new"Frame"
e_.Name="Row"..eW
e_.BackgroundTransparency=1
e_.Size=UDim2.new(1,0,0,eL)
e_.AutomaticSize=Enum.AutomaticSize.Y
e_.LayoutOrder=eW*2-1
e_.ZIndex=af.Content+1
e_.Parent=eU

local e0=Instance.new"Frame"
e0.BackgroundColor3=eZ.Color
e0.BackgroundTransparency=0.85
e0.BorderSizePixel=0
e0.AnchorPoint=Vector2.zero
e0.Position=UDim2.fromOffset(0,1)
e0.Size=UDim2.fromOffset(66,18)
e0.ZIndex=af.Content+2
e0.Parent=e_
eo(e0,5)

local e1=Instance.new"UIListLayout"
e1.FillDirection=Enum.FillDirection.Horizontal
e1.VerticalAlignment=Enum.VerticalAlignment.Center
e1.HorizontalAlignment=Enum.HorizontalAlignment.Center
e1.Padding=UDim.new(0,3)
e1.Parent=e0

local e2=Instance.new"ImageLabel"
e2.BackgroundTransparency=1
e2.Image=ev(eZ.Icon)
e2.ImageColor3=eZ.Color
e2.Size=UDim2.fromOffset(9,9)
e2.LayoutOrder=1
e2.ZIndex=af.Content+3
e2.Parent=e0

local e3=Instance.new"TextLabel"
e3.BackgroundTransparency=1
e3.FontFace=ac.FontSemi
e3.Text=string.upper(eY)
e3.TextColor3=eZ.Color
e3.TextSize=9
e3.AutomaticSize=Enum.AutomaticSize.X
e3.Size=UDim2.fromOffset(0,12)
e3.LayoutOrder=2
e3.ZIndex=af.Content+3
e3.Parent=e0

local e4=Instance.new"TextLabel"
e4.BackgroundTransparency=1
e4.FontFace=ac.FontReg
e4.Text=tostring(eX.Text or"")
e4.TextColor3=eE.Dim
e4.TextSize=12
e4.TextXAlignment=Enum.TextXAlignment.Left
e4.TextYAlignment=Enum.TextYAlignment.Top
e4.TextWrapped=true
e4.TextTruncate=Enum.TextTruncate.None
e4.AutomaticSize=Enum.AutomaticSize.Y
e4.Position=UDim2.fromOffset(76,0)
e4.Size=UDim2.new(1,-76,0,eL)
e4.ZIndex=af.Content+2
e4.Parent=e_

local function alignChangelogRow()
local e5=e4.TextBounds.Y>18
if e5 then
e0.AnchorPoint=Vector2.zero
e0.Position=UDim2.fromOffset(0,1)
e4.TextYAlignment=Enum.TextYAlignment.Top
else
e0.AnchorPoint=Vector2.new(0,0.5)
e0.Position=UDim2.new(0,0,0.5,0)
e4.TextYAlignment=Enum.TextYAlignment.Center
end
end
e4:GetPropertyChangedSignal"TextBounds":Connect(alignChangelogRow)
task.defer(alignChangelogRow)

if eW<#eI then
local e5=Instance.new"Frame"
e5.Name="Separator"..eW
e5.BackgroundColor3=Color3.new(1,1,1)
e5.BackgroundTransparency=0.93
e5.BorderSizePixel=0
e5.Size=UDim2.new(1,0,0,1)
e5.LayoutOrder=eW*2
e5.ZIndex=af.Content+1
e5.Parent=eU
end
end

local eW={Instance=eO,Destroy=function()eO:Destroy()end}
eB{Title=eG,Frame=eO,_handle=eW}
return eW
end end function a.ao():typeof(__modImpl())local aa=a.cache.ao if not aa then aa={c=__modImpl()}a.cache.ao=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local eo=
ab.T local es=
ab.tween local ev=
ac.guid
local ey=ac.spawnCb
local ez=ac.corner
local eA=ac.hairline local eB=
ac.pad local eE=
ac.lighting local eG=
ac.ripple
local eH=ac.spotlight
local eI=ac.attachTip
local eJ=ac.applyLock
local eK=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(eL,eM)
local eN=eL.row
local eO=eL.reg local eR=
eL.tab local eT=
eL.Window
local eU=eL.Th local eV=
eL.opts or{}local eW=
eL.page
eM=eM or{}
local eX=eM.Locked==true
local eY=eM.Height or 300
local eZ=math.max(1,eM.Columns or 2)
local e_=eM.Search~=false
local e0=eM.Sorts or{}
local e1=eM.DefaultSort or e0[1]
local e2=eM.CardHeight or 96
local e3=eN(eY)
eH(e3,0.08)
if eM.Tooltip then eI(e3,eM.Tooltip)end


local e4=8
if eM.Title and eM.Title~=""then
local e5=Instance.new"TextLabel"e5.BackgroundTransparency=1
e5.Position=UDim2.new(0,12,0,8)e5.Size=UDim2.new(1,-24,0,18)
e5.Font=Enum.Font.GothamMedium e5.TextSize=13
e5.TextXAlignment=Enum.TextXAlignment.Left
e5.TextTruncate=Enum.TextTruncate.AtEnd
e5.Text=eM.Title e5.Parent=e3
af:_tag(e5,"TextColor3","Text")
e4=30
if eM.Description and eM.Description~=""then
local e6=Instance.new"TextLabel"e6.BackgroundTransparency=1
e6.Position=UDim2.new(0,12,0,26)e6.Size=UDim2.new(1,-24,0,14)
e6.Font=Enum.Font.Gotham e6.TextSize=11
e6.TextXAlignment=Enum.TextXAlignment.Left
e6.TextTruncate=Enum.TextTruncate.AtEnd
e6.Text=eM.Description e6.Parent=e3
af:_tag(e6,"TextColor3","Dim")
e4=44
end
end

local e5,e6=""
if e_ then
local e7=Instance.new"Frame"
e7.Position=UDim2.new(0,12,0,e4)e7.Size=UDim2.new(1,-24,0,28)
e7.BackgroundColor3=eU.Surface2 e7.BorderSizePixel=0
ez(e7,8)e7.Parent=e3
eA(e7,true)
af:_tag(e7,"BackgroundColor3","Surface2")
local e8=eK("search",13,eU.Dim)
e8.Position=UDim2.new(0,10,0.5,-7)e8.Parent=e7
e6=Instance.new"TextBox"
e6.PlaceholderText=eM.SearchPlaceholder or"Search..."
e6.PlaceholderColor3=eU.Dim e6.Text=""
e6.Font=Enum.Font.Gotham e6.TextSize=12
e6.TextXAlignment=0
e6.Position=UDim2.new(0,30,0,0)e6.Size=UDim2.new(1,-38,1,0)
e6.BackgroundTransparency=1 e6.ClearTextOnFocus=false e6.Parent=e7
af:_tag(e6,"TextColor3","Text")
e4+=36
end
if#e0>1 then
for e7,e8 in ipairs(e0)do
local e9=Instance.new"TextButton"e9.Text=""
e9.Position=UDim2.new(0,12+(e7-1)*86,0,e4)
e9.Size=UDim2.new(0,80,0,22)e9.BackgroundColor3=eU.Surface2
e9.BackgroundTransparency=(e8==e1)and 0.4 or 1
e9.BorderSizePixel=0 ez(e9,6)e9.AutoButtonColor=false e9.Parent=e3
local fa=Instance.new"TextLabel"fa.BackgroundTransparency=1
fa.Size=UDim2.fromScale(1,1)fa.Font=Enum.Font.GothamBold
fa.TextSize=10 fa.Text=string.upper(tostring(e8))fa.Parent=e9
af:_tag(fa,"TextColor3",(e8==e1)and"Text"or"Dim")
e9.MouseButton1Click:Connect(function()
e1=e8
for fb,fc in ipairs(e3:GetChildren())do
if fc:IsA"TextButton"and fc.Size.Y.Offset==22 then
fc.BackgroundTransparency=1
end
end
e9.BackgroundTransparency=0.4
render()
end)
end
e4+=30
end
local e7=Instance.new"ScrollingFrame"
e7.Position=UDim2.new(0,8,0,e4)e7.Size=UDim2.new(1,-16,1,-e4-8)
e7.BackgroundTransparency=1 e7.BorderSizePixel=0
e7.ScrollBarThickness=3 e7.CanvasSize=UDim2.new(0,0,0,0)
e7.AutomaticCanvasSize=Enum.AutomaticSize.Y e7.Parent=e3
af:_tag(e7,"ScrollBarImageColor3","Surface2")
local e8=Instance.new"UIGridLayout"
e8.CellPadding=UDim2.fromOffset(8,8)
e8.CellSize=UDim2.new(1/eZ,-8,0,e2)
e8.SortOrder=Enum.SortOrder.LayoutOrder e8.Parent=e7

local e9=Instance.new"TextLabel"e9.BackgroundTransparency=1
e9.Position=UDim2.new(0,12,0,e4+4)e9.Size=UDim2.new(1,-24,0,24)
e9.Font=Enum.Font.Gotham e9.TextSize=12
e9.TextXAlignment=Enum.TextXAlignment.Left
e9.Text=eM.EmptyText or"Nothing here yet."e9.Parent=e3
e9.Visible=false
af:_tag(e9,"TextColor3","Dim")
local fa={}
local fb={}
local function statsLine(fc)
local fd=fc.Likes or fc.likes
local fe=fc.Downloads or fc.downloads
local ff={}
if fd~=nil then table.insert(ff,"♥ "..tostring(fd))end
if fe~=nil then table.insert(ff,"⤓ "..tostring(fe))end
local fg=fc.ShareCode or fc.shareCode or fc.sharecode
if fg~=nil and fg~=""then table.insert(ff,tostring(fg))end
return table.concat(ff,"   ")
end
local function render()
for fc,fd in ipairs(e7:GetChildren())do
if fd:IsA"TextButton"then pcall(function()fd:Destroy()end)end
end
local fc=string.lower(e5)
local fd,fe=0,0
for ff,fg in ipairs(fb)do
fe+=1
local fh=string.lower(tostring(fg.Name or fg.Title or fg.name or"")
.." "..tostring(fg.Description or fg.description or"")
.." "..table.concat(fg.Tags or fg.tags or{}," "))
if fc~=""and not string.find(fh,fc,1,true)then continue end
fd+=1
local fi=Instance.new"TextButton"fi.Text=""
fi.BackgroundColor3=eU.Surface2 fi.BorderSizePixel=0
ez(fi,8)fi.AutoButtonColor=false fi.LayoutOrder=fe fi.Parent=e7
eA(fi,true)
af:_tag(fi,"BackgroundColor3","Surface2")
local fj=Instance.new"TextLabel"fj.BackgroundTransparency=1
fj.Position=UDim2.new(0,10,0,8)fj.Size=UDim2.new(1,-20,0,16)
fj.Font=Enum.Font.GothamBold fj.TextSize=13 fj.TextXAlignment=0
fj.TextTruncate=Enum.TextTruncate.AtEnd
fj.Text=tostring(fg.Name or fg.Title or fg.name or"Config")fj.Parent=fi
af:_tag(fj,"TextColor3","Text")
local fk=Instance.new"TextLabel"fk.BackgroundTransparency=1
fk.Position=UDim2.new(0,10,0,26)fk.Size=UDim2.new(1,-20,0,30)
fk.Font=Enum.Font.Gotham fk.TextSize=11 fk.TextXAlignment=0
fk.TextYAlignment=0 fk.TextWrapped=true fk.TextTruncate=Enum.TextTruncate.AtEnd
fk.Text=tostring(fg.Description or fg.description or"")fk.Parent=fi
af:_tag(fk,"TextColor3","Dim")
local fl=statsLine(fg)
if fl~=""then
local fm=Instance.new"TextLabel"fm.BackgroundTransparency=1
fm.AnchorPoint=Vector2.new(0,1)fm.Position=UDim2.new(0,10,1,-8)
fm.Size=UDim2.new(1,-20,0,14)
fm.Font=Enum.Font.Gotham fm.TextSize=11 fm.TextXAlignment=0
fm.TextTruncate=Enum.TextTruncate.AtEnd
fm.Text=fl fm.Parent=fi
af:_tag(fm,"TextColor3","Dim")
end
fi.MouseButton1Click:Connect(function()
if eX then return end
af:_sfx"Click"ey(eM.OnSelect,fg)
end)
end
e9.Visible=fd==0
e7.Visible=fd>0
end
function fa.Refresh(fc)
if type(eM.Fetch)=="function"then
local fd,fe=pcall(eM.Fetch,{Query=e5,Sort=e1})
if fd and type(fe)=="table"then fb=fe end
elseif type(eM.Items)=="table"then
fb=eM.Items
end
render()
end
function fa.Get(fc)return fb end
function fa.SetLocked(fc,fd)
eX=fd and true or false
eJ(e3,eX)
end
function fa.GetLocked(fc)return eX end
if e6 then
e6:GetPropertyChangedSignal"Text":Connect(function()
e5=e6.Text
render()
end)
end
fa:Refresh()
eJ(e3,eX)
return eO{Title=eM.Title or"Cards",Frame=e3,_handle=fa}
end end function a.ap():typeof(__modImpl())local aa=a.cache.ap if not aa then aa={c=__modImpl()}a.cache.ap=aa end return aa.c end end do local function __modImpl()




local aa={
Section=a.B(),
Label=a.C(),
Divider=a.D(),
Progress=a.E(),
Log=a.F(),
Button=a.G(),
Toggle=a.H(),
Slider=a.I(),
Input=a.J(),
Dropdown=a.K(),
Keybind=a.L(),
Colorpicker=a.M(),
Profiles=a.N(),
Banner=a.O(),
StatsRow=a.P(),
Skeleton=a.Q(),
Status=a.R(),
Empty=a.S(),
Profile=a.T(),
Cards=a.U(),
Recent=a.V(),
RigPreview=a.W(),
Segment=a.X(),
Radio=a.Y(),
RangeSlider=a.Z(),
Sparkline=a._(),
Markdown=a.aa(),
Code=a.ab(),
Stepper=a.ac(),
Table=a.ad(),
Timeline=a.ae(),
Favorites=a.af(),
Avatar=a.ag(),
Paragraph=a.ah(),
Card=a.ai(),
Rating=a.aj(),
InfoGrid=a.ak(),
ActiveUsersGrid=a.al(),
SystemInfoGrid=a.am(),
Leaderboard=a.an(),
Changelog=a.ao(),
CardGrid=a.ap(),

AddChangelogEntry=a.ao(),
AddTextbox=a.J(),
Textbox=a.J(),
AddConsole=a.F(),
Console=a.F(),
AddViewport=a.W(),
Viewport=a.W(),
AddLine=a.D(),
}

local ab=a.e()

local function attach(ac,ad)
for ae,af in pairs(aa)do
local function method(ey,ez)
ez=ez or{}

if ez.Title==nil and ez.Text~=nil then ez.Title=ez.Text end
if ez.Description==nil and ez.Desc~=nil then ez.Description=ez.Desc end
local eA=af(ad,ez)



if ez and ez.Locked then
local eG=ad.tab
local eH=eG and eG.Elements and eG.Elements[#eG.Elements]
if eH and eH.Frame then
pcall(function()ab.applyLock(eH.Frame,true)end)
end
end
return eA
end
ac[ae]=method



if string.sub(ae,1,3)~="Add"then
ac["Add"..ae]=method
end
end
end

return{attach=attach,map=aa}end function a.aq():typeof(__modImpl())local aa=a.cache.aq if not aa then aa={c=__modImpl()}a.cache.aq=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.v()
local af=a.g()
local ey=a.h()
local ez=a.d()
local eA=aa
local eG=ab.T
local eH=ab.tween local eI=
ac.spawnCb
local eJ=ac.corner
local eK=ac.hairline
local eL=ac.pad
local eM=ac.lighting
local eN=ad.makeIcon
local eO=a.aq()

return function(eU,eW)
local eX=eU.Window
local eY=eU.opts or{}
local eZ=eU.Th
local e_=eU.pgui
local e0=eU.pages
local e1=eU.nav
local e2=eU.pill
local e3=eU.subLbl
eW=eW or{}
local e4=eW.Title or("Tab "..(#eX._tabs+1))
local e5=eW.Icon or e4

local e6=Instance.new"TextButton"
e6.Text=""
e6.Size=UDim2.new(1,0,0,34)
e6.BackgroundColor3=eZ.Surface2
e6.BackgroundTransparency=1
e6.BorderSizePixel=0
eJ(e6,8)
e6.LayoutOrder=#eX._tabs+10
e6.AutoButtonColor=false
e6.Parent=e1
e6.ZIndex=2
e6.Visible=true
local e7=#eX._tabs+1


local e8={}
local function fly1(e9,fa,fb)
local fc=e8[e9]
if fc then pcall(function()fc:Cancel()end)end
e8[e9]=eH(e9,fb or eG.Med,fa)
return e8[e9]
end
local e9=eN(e5,15,eZ.Dim)
e9.AnchorPoint=Vector2.new(0,0.5)
e9.Position=UDim2.new(0,14,0.5,0)
e9.Parent=e6
e9.Visible=true
e9.ZIndex=3
if e9:IsA"TextLabel"then e9.Size=UDim2.new(0,15,0,15)end
local fa=Instance.new"TextLabel"fa.BackgroundTransparency=1
fa.Position=UDim2.new(0,37,0,0)
fa.Size=UDim2.new(1,-49,1,0)
fa.Font=Enum.Font.GothamMedium
fa.TextSize=13
fa.TextXAlignment=0
fa.TextTruncate=Enum.TextTruncate.AtEnd
fa.Text=e4
fa.Parent=e6
fa.Visible=true
fa.TextTransparency=0
fa.ZIndex=3
ae.tag(fa,"TextColor3","Dim")
e6.MouseEnter:Connect(function()
if eX._active and eX._active.Btn==e6 then return end
fly1(e6,{BackgroundTransparency=0.55},eG.Hover)
ae.tag(fa,"TextColor3","Text")
end)
e6.MouseLeave:Connect(function()
if eX._active and eX._active.Btn==e6 then return end
fly1(e6,{BackgroundTransparency=1},eG.Hover)
ae.tag(fa,"TextColor3","Dim")
end)

local fb=Instance.new"ScrollingFrame"
fb.Visible=false
fb.Size=UDim2.fromScale(1,1)
fb.BackgroundTransparency=1
fb.BorderSizePixel=0
fb.ScrollBarThickness=3
fb.ScrollBarImageColor3=eZ.Surface2
fb.CanvasSize=UDim2.new(0,0,0,0)
fb.AutomaticCanvasSize=Enum.AutomaticSize.Y
fb.Parent=e0
ae.tag(fb,"ScrollBarImageColor3","Surface2")
local fc=Instance.new"UIListLayout"
fc.Padding=UDim.new(0,8)
fc.SortOrder=Enum.SortOrder.LayoutOrder
fc.Parent=fb
eL(fb,2,8,2,6)




local fd=fb

local fe={Title=e4,Btn=e6,Page=fb,Elements={},_label=fa,_icon=e9}
fe._pl=fc

local ff=eY.SubTitle or eY.Subtitle or"scripthub"

local function setActive(fg)
eX._active=fe
pcall(function()
e3.Text=string.upper(ff).."  /  "..string.upper(e4)
end)
for fh,fi in ipairs(eX._tabs)do
local fj=fi==fe
fi.Page.Visible=fj
local fk=fi._label
fk.TextTransparency=0
fly1(fi.Btn,{BackgroundTransparency=1},eG.Hover)
if fj then
ae.tag(fk,"TextColor3","Text")
if fi._icon and fi._icon:IsA"ImageLabel"then
fi._icon.ImageTransparency=0
fly1(fi._icon,{ImageColor3=aa.Theme.Accent},eG.Hover)
end
else
ae.tag(fk,"TextColor3","Dim")
if fi._icon and fi._icon:IsA"ImageLabel"then
fi._icon.ImageTransparency=0
fly1(fi._icon,{ImageColor3=aa.Theme.Dim},eG.Hover)
end
end
end




local function syncPill()
if not e6.Visible then
e2.Visible=false
return
end
e2.Visible=true
local fh={}
for fi,fj in ipairs(e1:GetChildren())do
if fj:IsA"GuiObject"and fj.Visible and fj.AbsoluteSize.Y>0 then
table.insert(fh,fj)
end
end
table.sort(fh,function(fi,fj)return fi.LayoutOrder<fj.LayoutOrder end)
local fi=-2
for fj,fk in ipairs(fh)do
if fk==e6 then
fly1(e2,{Position=UDim2.new(0,0,0,fi)})
return
end
fi=fi+fk.AbsoluteSize.Y+4
end
local fj=e2.Parent
if e6.Parent and fj and fj.Parent and e6.AbsoluteSize.Y>0 then
local fk,fl,fm=pcall(function()
return e6.AbsolutePosition.Y,fj.AbsolutePosition.Y
end)
if fk and fl and fm then
fly1(e2,{Position=UDim2.new(0,0,0,fl-fm-2)})
return
end
end
fly1(e2,{Position=UDim2.new(0,0,0,(e7-1)*38-2)})
end
syncPill()
task.delay(0.2,function()
if e6.Parent then syncPill()end
end)
if fg then
fb.Position=UDim2.new(0,14,0,0)
fly1(fb,{Position=UDim2.new(0,0,0,0)})
local fh=0
for fi,fj in ipairs(fb:GetChildren())do
if fj:IsA"Frame"or fj:IsA"CanvasGroup"then
fh+=1
local fk=math.min(fh*0.02,0.3)
task.delay(fk,function()
if not fj.Parent then return end
local fl=Instance.new"Frame"
fl.Name="_cascade"
fl.Size=UDim2.fromScale(1,1)
fl.BackgroundColor3=eZ.Surface2
fl.BackgroundTransparency=0.55
fl.BorderSizePixel=0
eJ(fl,10)
fl.Parent=fj
eH(fl,eG.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()fl:Destroy()end)end)
end)
end
end
end
for fh,fi in ipairs(eX._tabChangeListeners or{})do
pcall(fi,fe)
end
end
e6.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

if eW.Hidden then e6.Visible=false end
fe._hidden=eW.Hidden and true or false
fe.Hidden=fe._hidden
table.insert(eX._tabs,fe)

if string.lower(e4)=="settings"and not eX._settingsDock
and eX._dockAdd then
eX._settingsDock=true
eX._dockAdd("Settings",eW.Icon or"settings",function()
eX._activateTab(fe,true)
end,fe)
end
if#eX._tabs==1 then
setActive(false)
e2.Position=UDim2.new(0,0,0,-2)
e2.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
fa.TextTransparency=0
if e9:IsA"ImageLabel"then e9.ImageTransparency=0 end
end)
end)

local function row(fg)
local fh=Instance.new"Frame"
fh.Size=UDim2.new(1,-4,0,fg)
fh.BackgroundColor3=eZ.Surface
fh.BorderSizePixel=0
local fi=math.clamp((eY.Radius or 12)-2,4,12)
eJ(fh,fi)
eM(fh,fi)
fh.Parent=fd
eK(fh,true)
ae.tag(fh,"BackgroundColor3","Surface")
local fj=fh:FindFirstChild"_light"
if fj then fj.Visible=false end
fh.BackgroundTransparency=1
task.delay(math.min(#fe.Elements*0.025,0.3),function()
eH(fh,eG.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if fj and fj.Parent then fj.Visible=true end end)
end)
return fh
end
local function titleBlock(fg,fh,fi,fj,fk)
fj=fj or 112
local fl=Instance.new"TextLabel"
fl.BackgroundTransparency=1
if fi then
fl.Position=UDim2.new(0,14,0,9)
fl.Size=UDim2.new(1,-fj,0,17)
elseif fk then
fl.Position=UDim2.new(0,14,0,8)
fl.Size=UDim2.new(1,-fj,0,17)
else
fl.Position=UDim2.new(0,14,0,0)
fl.Size=UDim2.new(1,-fj,1,0)
end
fl.Font=Enum.Font.GothamMedium
fl.TextSize=13
fl.TextXAlignment=0
fl.TextTruncate=Enum.TextTruncate.AtEnd
fl.Text=fh
fl.Parent=fg
ae.tag(fl,"TextColor3","Text")
if fi then
local fm=Instance.new"TextLabel"
fm.BackgroundTransparency=1
fm.Position=UDim2.new(0,14,0,30)
fm.Size=UDim2.new(1,-fj,0,14)
fm.Font=Enum.Font.Gotham
fm.TextSize=11
fm.TextXAlignment=0
fm.TextTruncate=Enum.TextTruncate.AtEnd
fm.Text=fi
fm.Parent=fg
ae.tag(fm,"TextColor3","Dim")
end
end
local function reg(fg)
table.insert(fe.Elements,fg)
fg._tab=fe


if fg.Frame and fg.Frame.Parent and(aa._textScale or 1)~=1 then
pcall(function()ey.paintFonts(fg.Frame)end)
end
if not fg._go then
fg._go=function()
if eX._activateTab then eX._activateTab(fe,true)end
eX:_flash(fg.Frame)
end
end
if fg.Flag and fg._set then
aa._live[fg.Flag]=aa._live[fg.Flag]or{}
table.insert(aa._live[fg.Flag],fg._set)
if aa.Flags["_loaded_"..fg.Flag]~=nil then
local fh=aa.Flags["_loaded_"..fg.Flag]
aa.Flags["_loaded_"..fg.Flag]=nil
task.defer(function()pcall(fg._set,fh,true)end)
elseif fg.Value~=nil and aa.Flags[fg.Flag]==nil then
aa.Flags[fg.Flag]=fg.Value
end
elseif fg.Flag and fg.Value~=nil and aa.Flags[fg.Flag]==nil then
aa.Flags[fg.Flag]=fg.Value
end
return fg._handle
end

local fg={}
local fh={row=row,titleBlock=titleBlock,reg=reg,tab=fe,Window=eX,Th=eZ,opts=eY,page=fb,pgui=e_,
getParent=function()return fd end}
eO.attach(fg,fh)




fe._subtabs={}
fe.SelectedSubTab=nil
local fi



local function selBtn(fj,fk)
if fj.btn then
local fl=fj.btn:FindFirstChildOfClass"TextLabel"
if fl then ae.tag(fl,"TextColor3",fk and"Text"or"Dim")end
end
if fj.ind then fj.ind.Visible=fk end
end
local function selectSub(fj,fk)
local fl=fe._subtabs
if#fl==0 then return end
local fm
if type(fj)=="number"then
fm=math.clamp(fj,1,#fl)
else
for fn,fo in ipairs(fl)do
if fo.name==fj then fm=fn break end
end
fm=fm or 1
end
fe.SelectedSubTab=fl[fm].name
for fn,fo in ipairs(fl)do
local fp=fn==fm
fo.holder.Visible=fp
if fp then fd=fo.holder end
selBtn(fo,fp)
end
if not fk then
eA:_sfx"Swap"
ez.closeAny()
end
end
fe.SelectSubTab=function(fj,fk)selectSub(fk)end
fe.SelectSubTabByName=function(fj,fk)
for fl,fm in ipairs(fe._subtabs)do
if fm.name==fk then
selectSub(fm.name)
return{Name=fm.name}
end
end
return nil
end
fe.SubTab=function(fj,fk)
fk=fk or{}
if type(fk)=="string"then fk={Name=fk}end
local fl=fk.Name or("Sub "..(#fe._subtabs+1))
if#fe._subtabs==0 then


fb.ScrollingEnabled=false
if fc and fc.Parent then pcall(function()fc:Destroy()end)end
fe._pl=nil
for fm,fn in ipairs(fb:GetChildren())do
if fn:IsA"UIPadding"then pcall(function()fn:Destroy()end)end
end
if fc and fc.Parent then pcall(function()fc:Destroy()end)end
fe._pl=nil
fi=Instance.new"ScrollingFrame"
fi.Name="_subbar"
fi.Position=UDim2.new(0,2,0,2)fi.Size=UDim2.new(1,-4,0,36)
fi.BackgroundTransparency=1 fi.BorderSizePixel=0
fi.ScrollingDirection=Enum.ScrollingDirection.X
fi.ScrollBarThickness=0
fi.AutomaticCanvasSize=Enum.AutomaticSize.X
fi.CanvasSize=UDim2.new(0,0,0,0)
fi.Parent=fb
local fm=Instance.new"UIListLayout"
fm.FillDirection=Enum.FillDirection.Horizontal
fm.VerticalAlignment=Enum.VerticalAlignment.Center
fm.Padding=UDim.new(0,6)fm.Parent=fi
end
local fm=Instance.new"ScrollingFrame"
fm.Name="_subbody"
fm.Position=UDim2.new(0,0,0,44)fm.Size=UDim2.new(1,0,1,-44)
fm.BackgroundTransparency=1 fm.BorderSizePixel=0
fm.ScrollBarThickness=3 fm.CanvasSize=UDim2.new(0,0,0,0)
fm.AutomaticCanvasSize=Enum.AutomaticSize.Y
fm.Visible=false fm.Parent=fb
ae.tag(fm,"ScrollBarImageColor3","Surface2")
local fn=Instance.new"UIListLayout"fn.Padding=UDim.new(0,8)
fn.SortOrder=Enum.SortOrder.LayoutOrder fn.Parent=fm
eL(fm,2,8,2,6)
local fo=Instance.new"TextButton"fo.Text=""
fo.Size=UDim2.new(0,0,0,30)fo.AutomaticSize=Enum.AutomaticSize.X
fo.BackgroundColor3=eZ.Surface2 fo.BackgroundTransparency=1
fo.BorderSizePixel=0 eJ(fo,8)fo.AutoButtonColor=false fo.Parent=fi
local fp=Instance.new"UIPadding"
fp.PaddingLeft=UDim.new(0,16)fp.PaddingRight=UDim.new(0,16)
fp.Parent=fo


local fq=4
if fk.Icon and fk.Icon~=""then
local fr=eN(fk.Icon,14,eZ.Dim)
fr.AnchorPoint=Vector2.new(0,0.5)fr.Position=UDim2.new(0,0,0.5,0)
fr.Parent=fo
if fr:IsA"TextLabel"then fr.Size=UDim2.new(0,14,0,14)end
fq=20
end
local fr=Instance.new"TextLabel"fr.BackgroundTransparency=1
fr.Position=UDim2.new(0,fq,0,0)fr.Size=UDim2.new(0,0,1,0)
fr.AutomaticSize=Enum.AutomaticSize.X
fr.Font=Enum.Font.GothamMedium fr.TextSize=12 fr.TextXAlignment=0
fr.TextTruncate=Enum.TextTruncate.AtEnd fr.Text=fl fr.Parent=fo
ae.tag(fr,"TextColor3","Dim")


local fs=Instance.new"Frame"fs.Name="_sel"
fs.Size=UDim2.fromScale(1,1)fs.BackgroundColor3=eZ.Surface2
fs.BorderSizePixel=0 fs.ZIndex=0
eJ(fs,8)fs.Parent=fo
eK(fs,true)
ae.tag(fs,"BackgroundColor3","Surface2")
fs.Visible=false
local ft={name=fl,btn=fo,label=fr,holder=fm,ind=fs}
table.insert(fe._subtabs,ft)
fo.MouseButton1Click:Connect(function()
for fu,fv in ipairs(fe._subtabs)do
if fv==ft then selectSub(fu)break end
end
end)
if#fe._subtabs==1 then

for fu,fv in ipairs(fb:GetChildren())do
if fv:IsA"GuiObject"and fv~=fi and fv~=fm then
pcall(function()fv.Parent=fm end)
end
end
selectSub(1,true)

task.defer(function()
if fe.SelectedSubTab then selectSub(fe.SelectedSubTab,true)end
end)
end


fd=fm
return setmetatable({_sub=ft,_tab=fe},{
__index=function(fu,fv)
if fv=="Select"then return function()selectSub(fl)end end
local fw=fe[fv]
if type(fw)=="function"then
return function(fx,...)return fw(fe,...)end
end
return fw
end,
})
end

fe.Api=fg
fe._window=eX
fe._activate=function(fj)setActive(fj~=false)end
for fj,fk in pairs(fg)do fe[fj]=function(fl,...)return fk(fe,...)end end
return fe
end end function a.ar():typeof(__modImpl())local aa=a.cache.ar if not aa then aa={c=__modImpl()}a.cache.ar=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.v()
local ae=a.b()

local af=ab.T
local ey=ab.tween
local ez=ac.spawnCb
local eA=ac.corner
local eG=ac.hairline
local eH=ac.lighting
local eI=ac.shadow
local eJ=ae.cloneref_check(game:GetService"RunService")
local eK=ae.cloneref_check(game:GetService"Players")

local eL={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(eM,eN)
local eO=eM.Window
local eU=eM.Th
local eW=eM.main
local eX=eM.gui

eN=eN or{}
local eY,eZ=eN.Width or 175,eN.Height or 370
local e_=eN.Accent or eU.Accent
if type(e_)=="table"then
e_=Color3.new(e_[1]or 0,e_[2]or 0,e_[3]or 0)
end
local e0=tostring(eN.Mode or"Chams")
if not eL[e0]then e0="Chams"end local
e1, e2, e3=true, true, false
local e4
pcall(function()e4=eK.LocalPlayer end)
local e5=eN.Name or((e4 and e4.DisplayName)or"Noob")
local e6=(e4 and("@"..e4.Name))or""
local e7=Instance.new"Frame"
e7.Name=ae.GetStealthName()
e7.AnchorPoint=Vector2.new(0,0.5)
e7.Size=UDim2.fromOffset(eY,eZ)
e7.BackgroundColor3=eU.Surface e7.BorderSizePixel=0
eA(e7,12)e7.Parent=eX e7.Visible=false
eG(e7,true)eH(e7,12)eI(e7,0.5,40)
ad.tag(e7,"BackgroundColor3","Surface")
local e8=Instance.new"UIScale"e8.Scale=0.92 e8.Parent=e7
local function dock()
if not eW or not eW.Parent then return end
local e9=eW.Size.X.Offset
e7.Position=UDim2.new(eW.Position.X.Scale,
eW.Position.X.Offset+e9/2+12,
eW.Position.Y.Scale,eW.Position.Y.Offset)
end
eO:Track(eW:GetPropertyChangedSignal"Position":Connect(dock))
eO:Track(eW:GetPropertyChangedSignal"Size":Connect(dock))
local e9=Instance.new"TextLabel"e9.BackgroundTransparency=1
e9.Position=UDim2.new(0,14,0,0)e9.Size=UDim2.new(1,-48,0,34)
e9.Font=Enum.Font.GothamBold e9.TextSize=14 e9.TextXAlignment=0
e9.TextTruncate=Enum.TextTruncate.AtEnd e9.Text=eN.Title or"Preview"e9.Parent=e7
ad.tag(e9,"TextColor3","Text")
local fa={open=false}
local fb={}
local function fly1(fc,fd,fe)
local ff=fb[fc]
if ff then pcall(function()ff:Cancel()end)end
fb[fc]=ey(fc,fe or af.Med,fd)
return fb[fc]
end
local function setOpen(fc,fd)
fc=fc and true or false
if fc==fa.open and e7.Visible==fc then return end
fa.open=fc
if fc then
dock()
e7.Visible=true

local fe=eO._popouts
if fe then
local ff
for fg,fh in ipairs(fe)do
if fh.frame==e7 then ff=fh break end
end
if not ff then
ff={frame=e7}
table.insert(fe,ff)
end
ff.open=true
end
local ff=e7.Position.X.Offset
e7.Position=UDim2.new(e7.Position.X.Scale,ff-24,
e7.Position.Y.Scale,e7.Position.Y.Offset)
fly1(e7,{Position=UDim2.new(e7.Position.X.Scale,ff,
e7.Position.Y.Scale,e7.Position.Y.Offset)})
fly1(e8,{Scale=1},af.Spring)
else
local fe=eO._popouts
if fe then
for ff,fg in ipairs(fe)do
if fg.frame==e7 then table.remove(fe,ff)break end
end
end
fly1(e7,{Position=UDim2.new(e7.Position.X.Scale,
e7.Position.X.Offset-16,e7.Position.Y.Scale,e7.Position.Y.Offset)},af.Fast)
task.delay(0.18,function()
if not fa.open then e7.Visible=false end
end)
if fd then ez(eN.OnClose)end
end
end
local fc=Instance.new"TextButton"fc.Text=""
fc.AnchorPoint=Vector2.new(1,0)fc.Position=UDim2.new(1,-10,0,8)
fc.Size=UDim2.fromOffset(14,14)fc.BackgroundColor3=Color3.fromRGB(255,95,86)
fc.BorderSizePixel=0 fc.AutoButtonColor=false fc.Parent=e7
eA(fc,99)
fc.MouseEnter:Connect(function()
fly1(fc,{BackgroundColor3=Color3.fromRGB(215,70,62)},af.Hover)
end)
fc.MouseLeave:Connect(function()
fly1(fc,{BackgroundColor3=Color3.fromRGB(255,95,86)},af.Hover)
end)
fc.MouseButton1Click:Connect(function()setOpen(false,true)end)

local fd=Instance.new"ViewportFrame"
fd.Position=UDim2.new(0,10,0,36)fd.Size=UDim2.new(1,-20,1,-48)
fd.BackgroundColor3=eU.Bg fd.BorderSizePixel=0
fd.LightColor=Color3.fromRGB(255,255,255)
fd.LightDirection=Vector3.new(-0.5,-1,-0.6)
fd.Ambient=Color3.fromRGB(150,150,168)
eA(fd,8)fd.Parent=e7
ad.tag(fd,"BackgroundColor3","Bg")
local fe=Instance.new"Frame"fe.BackgroundTransparency=1
fe.Size=UDim2.fromScale(1,1)fe.Parent=fd
local ff={}
local function bracket(fg,fh)
local fi=Instance.new"Frame"fi.BorderSizePixel=0
fi.AnchorPoint=Vector2.new(fg,fh)fi.Position=UDim2.new(fg,0,fh,0)
fi.Size=UDim2.new(0,14,0,2)fi.Parent=fe
ad.tag(fi,"BackgroundColor3","Accent")
local fj=Instance.new"Frame"fj.BorderSizePixel=0
fj.AnchorPoint=Vector2.new(fg,fh)fj.Position=UDim2.new(fg,0,fh,0)
fj.Size=UDim2.new(0,2,0,14)fj.Parent=fe
ad.tag(fj,"BackgroundColor3","Accent")
table.insert(ff,fi)table.insert(ff,fj)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local fg=Instance.new"TextLabel"fg.BackgroundTransparency=1
fg.AnchorPoint=Vector2.new(0.5,0)fg.Position=UDim2.new(0.5,0,0,4)
fg.Size=UDim2.new(1,-16,0,15)fg.Font=Enum.Font.GothamBold
fg.TextSize=11 fg.Text=e5 fg.Parent=fe
ad.tag(fg,"TextColor3","Text")
local fh=Instance.new"TextLabel"fh.BackgroundTransparency=1
fh.AnchorPoint=Vector2.new(0.5,0)fh.Position=UDim2.new(0.5,0,0,19)
fh.Size=UDim2.new(1,-16,0,12)fh.Font=Enum.Font.Gotham
fh.TextSize=10 fh.Text=e6 fh.Parent=fe
ad.tag(fh,"TextColor3","Dim")
local fi=Instance.new"Frame"fi.BorderSizePixel=0
fi.AnchorPoint=Vector2.new(0,0.5)fi.Position=UDim2.new(0,6,0.5,0)
fi.Size=UDim2.new(0,4,1,-40)fi.BackgroundColor3=eU.Surface2
eA(fi,99)fi.Parent=fe
ad.tag(fi,"BackgroundColor3","Surface2")
local fj=Instance.new"Frame"fj.BorderSizePixel=0
fj.AnchorPoint=Vector2.new(0,1)fj.Position=UDim2.new(0,0,1,0)
fj.Size=UDim2.new(1,0,1,0)fj.BackgroundColor3=eU.Success
eA(fj,99)fj.Parent=fi
ad.tag(fj,"BackgroundColor3","Success")

local fk=Instance.new"WorldModel"fk.Parent=fd
local fl=Instance.new"Camera"fl.Parent=fd
fd.CurrentCamera=fl
fl.CFrame=CFrame.new(Vector3.new(0,3.0,9),Vector3.new(0,2.4,0))
local fm,fn,fo={},{},{}
local function part(fp,fq,fr)
local fs=Instance.new"Part"fs.Name=fp
fs.Size=fq fs.Position=fr fs.Anchored=true fs.CanCollide=false
fs.TopSurface=Enum.SurfaceType.Smooth
fs.BottomSurface=Enum.SurfaceType.Smooth
fs.Color=Color3.fromRGB(200,200,215)
fs.Material=Enum.Material.Plastic
fs.Parent=fk
table.insert(fm,fs)
if fp=="Left Arm"or fp=="Right Arm"then fn[fp]=fs end
local ft=Instance.new"SelectionBox"
ft.Adornee=fs ft.LineThickness=0.05
ft.Color3=Color3.fromRGB(255,255,255)
ft.SurfaceTransparency=1 ft.Visible=false
ft.Parent=fs
fo[fs]=ft
return fs
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local fp={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local function paint()
for fq,fr in ipairs(fm)do
if fr and fr.Parent then
if e0=="Noob"then
fr.Color=fp[fr.Name]or Color3.fromRGB(200,200,215)
fr.Material=Enum.Material.Plastic
fr.Transparency=0
elseif e0=="Ghost"then
fr.Color=e_
fr.Material=Enum.Material.ForceField
fr.Transparency=0
elseif e0=="Solid"or e0=="Box"then
fr.Color=Color3.fromRGB(200,200,215)
fr.Material=Enum.Material.Plastic
fr.Transparency=0
else
fr.Color=e_
fr.Material=Enum.Material.Plastic
fr.Transparency=0
end
local fs=fo[fr]
if fs then
fs.Visible=e3 or e0=="Outline"
fs.Color3=e_
end
end
end
for fq,fr in ipairs(ff)do
if fr then fr.Visible=e1 or e0=="Box"end
end
fg.Visible=e2 or e0=="Name"
fh.Visible=fg.Visible
fi.Visible=e1 or e0=="HP bar"
end
paint()

local fq=0
local fr={}
for fs,ft in ipairs(fm)do fr[ft]=ft.Position end
local fs={
["Left Arm"]=Vector3.new(-1,3.9,0),
["Right Arm"]=Vector3.new(1,3.9,0),
}
local ft
ft=eJ.Heartbeat:Connect(function(fu)
if not fd.Parent then pcall(function()ft:Disconnect()end)return end
if not fa.open or not e7.Visible then return end
fq+=fu
local fv=math.sin(fq*2.2)*0.045
local fw=math.sin(fq*2.2)*0.09
for fx,fy in ipairs(fm)do
if fy and fy.Parent and fr[fy]then
local fz=fs[fy.Name]
if fz then
local fA=fy.Name=="Left Arm"and 1 or-1
fy.CFrame=CFrame.new(fz)
*CFrame.Angles(fw*fA,0,0.05*fA)
*CFrame.new(fr[fy]-fz+Vector3.new(0,fv,0))
else
fy.Position=fr[fy]+Vector3.new(0,fv,0)
end
end
end
end)
eO:Track(ft)
function fa.Show(fu)setOpen(true)end
function fa.Hide(fu,fv)setOpen(false,not fv)end
function fa.Toggle(fu)setOpen(not fa.open,not fa.open)end
function fa.SetVisible(fu,fv)
if fv then fu:Show()else fu:Hide(true)end
end
function fa.IsOpen(fu)return fa.open end
function fa.SetAccent(fu,fv)
if type(fv)=="table"then
fv=Color3.new(fv[1]or 0,fv[2]or 0,fv[3]or 0)
end
if typeof(fv)=="Color3"then e_=fv paint()end
end
function fa.SetMode(fu,fv)e0=tostring(fv)if not eL[e0]then e0="Chams"end paint()end
function fa.SetBox(fu,fv)
e1=fv and true or false paint()
end
function fa.SetOutline(fu,fv)
e3=fv and true or false paint()
end
function fa.SetName(fu,fv)
e2=fv and true or false paint()
end
function fa.SetNameText(fu,fv)
local fw=tostring(fv or"")
local fx=string.find(fw,"@")
if fx then
fg.Text=string.sub(fw,1,fx-1)
fh.Text="@"..string.gsub(string.sub(fw,fx+1),"^@","")
else
fg.Text=fw
end
e5=fg.Text
end
function fa.SetHealth(fu,fv)
local fw=math.clamp(tonumber(fv)or 100,0,100)
ey(fj,af.Fill08,{Size=UDim2.new(1,0,fw/100,0)})
end

aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(fu,fv)
local fw=fu
if type(fw)=="table"then
fw=Color3.new(fw[1]or 0,fw[2]or 0,fw[3]or 0)
end
if typeof(fw)=="Color3"then e_=fw paint()end
end)
if aa.Flags.ESPColor~=nil then
local fu=aa.Flags.ESPColor
if type(fu)=="table"then
fu=Color3.new(fu[1]or 0,fu[2]or 0,fu[3]or 0)
end
if typeof(fu)=="Color3"then e_=fu paint()end
end
return fa
end end function a.as():typeof(__modImpl())local aa=a.cache.as if not aa then aa={c=__modImpl()}a.cache.as=aa end return aa.c end end do local function __modImpl()a.a()






local aa=a.b()
local ab=a.A()

local function localConfigs(ac)
local ad={}
local ae=ac._folder or"Kronos"
pcall(function()
local af,ey=aa.hasFn"listfiles",aa.hasFn"isfolder"
if af and ey and ey(ae)then
for ez,eA in ipairs(af(ae))do
local eG=string.match(eA,"([^/\\]+)%.json$")
if eG then table.insert(ad,{Name=eG,Description="On this device"})end
end
end
end)
table.sort(ad,function(af,ey)return af.Name<ey.Name end)
return ad
end

return function(ac,ad)
ad=ad or{}
local ae=ad.Service
local af=ac:Tab{Title=ad.Name or"Cloud",Icon=ad.Icon or"cloud",Hidden=ad.Hidden~=false}
if ad.OnToggle then
table.insert(ac._tabChangeListeners,function(ey)
if ey==af then task.spawn(ad.OnToggle,true)
else
for ez,eA in ipairs(ac._tabs)do
if eA==af then task.spawn(ad.OnToggle,false)break end
end
end
end)
end
function af.Open(ey)
ac._activateTab(af,true)
end

local ey,ez,eA
local eG=af:SubTab{Name="Local Configs",Icon="save"}
eG:Paragraph{Title="Local Library",
Description="Private presets on this device. Load, save and publish them."}
eG:Button{Title="Save current locally",Description="Stays on this device only",
Callback=function()
ac:Modal{
Title="Save Config Locally",Text="Stays only on this device.",
ConfirmText="Save",CancelText="Cancel",
Fields={
{Key="Name",Label="Name",Placeholder="Enter a name...",MaxLength=60},
{Key="Description",Label="Description (optional)",
Placeholder="What's different?",MaxLength=280,Type="textarea"},
},
Callback=function(eH,eI)
if not eH then return end
if not eI.Name or eI.Name:gsub("%s+","")==""then
ac:Notify{Title="Local Save",Content="Name can't be empty.",Duration=3}
return
end
ac:SaveConfig(eI.Name)
if ey then ey:Refresh()end
end,
}
end}
ey=eG:CardGrid{Title="Local Configs",Height=260,Columns=2,
Search=true,SearchPlaceholder="Search local configs...",
EmptyText="No local configs saved yet.",
Fetch=function(eH)
local eI=localConfigs(ac)
local eJ=string.lower(tostring(eH and eH.Query or""))
if eJ==""then return eI end
local eK={}
for eL,eM in ipairs(eI)do
if string.find(string.lower(eM.Name),eJ,1,true)then table.insert(eK,eM)end
end
return eK
end,
OnSelect=function(eH)
ac:Confirm{
Title="Load \""..tostring(eH.Name).."\"?",
Text="Overwrites current settings. A snapshot is kept for undo.",
ConfirmText="Load",CancelText="Cancel",
Callback=function(eI)
if not eI then return end
local eJ=ab.Snapshot()
ac:LoadConfig(eH.Name)
ac:Notify{Title="Loaded",Content=eH.Name,Duration=2}
eH._snap=eJ
end,
}
end}

local eH=af:SubTab{Name="Publish",Icon="upload"}
eH:Paragraph{Title="Publish",Description="Share the current setup to your cloud."}
eH:Button{Title="Publish current",Description="Uploads flags + meta",
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
Callback=function(eI,eJ)
if not eI then return end
task.spawn(function()
local eK,eL=ae:Publish(eJ,ab.GetFlags())
if eK then
ac:Notify{Title="Published",Content=tostring(eJ.Name),Duration=3}
else
ac:Notify{Title="Publish failed",Content=tostring(eL),Duration=3}
end
end)
end,
}
end}
ez=eH:CardGrid{Title="My Configs",Height=260,Columns=2,
EmptyText=ae and"Nothing published yet."or"Attach a cloud service.",
Fetch=function()
if not ae then return{}end
local eI,eJ=ae:ListMine()
if eJ then return{}end
return eI or{}
end,
OnSelect=function(eI)
ac:Confirm{
Title="Load \""..tostring(eI.name or eI.Name or"?").."\"?",
Text="Overwrites current settings.",
ConfirmText="Load",CancelText="Cancel",
Callback=function(eJ)
if not eJ then return end
local eK=ab.Snapshot()
if eI.data and ab.ApplyTable(ac,eI.data)then
ac:Notify{Title="Loaded",Content="From cloud.",Duration=2}
else
ab.Restore(eK)
ac:Notify{Title="Load failed",Content="Rolled back.",Duration=2}
end
end,
}
end}

local eI=af:SubTab{Name="Explore",Icon="globe"}
eI:Paragraph{Title="Public Configs",Description="Shared by the community."}
eA=eI:CardGrid{Title="Public Configs",Height=300,Columns=2,
Search=true,SearchPlaceholder="Search public configs...",
EmptyText=ae and"Nothing found."or"Attach a cloud service.",
Fetch=function(eJ)
if not ae then return{}end
local eK,eL=ae:List(eJ)
if eL then return{}end
return eK or{}
end,
OnSelect=function(eJ)
ac:Confirm{
Title="Import \""..tostring(eJ.name or eJ.Name or"?").."\"?",
Text="Overwrites current settings. Snapshot kept.",
ConfirmText="Import",CancelText="Cancel",
Callback=function(eK)
if not eK then return end
local eL=ab.Snapshot()
local eM=eJ.data
if not eM and(eJ.ShareCode or eJ.shareCode)and ae then
local eN=ae:GetByShareCode(eJ.ShareCode or eJ.shareCode)
if eN then eM=eN.Data or eN.data or eN end
end
if eM and ab.ApplyTable(ac,eM)then
ac:Notify{Title="Imported",Content="Applied.",Duration=2}
else
ab.Restore(eL)
ac:Notify{Title="Import failed",Content="Rolled back.",Duration=2}
end
end,
}
end}

local eJ={
Tab=af,
Open=function()ac._activateTab(af,true)end,
Refresh=function()
pcall(function()ey:Refresh()end)
pcall(function()ez:Refresh()end)
pcall(function()eA:Refresh()end)
end,
}
if ac._dockAdd then
ac._dockAdd("Config",ad.DockIcon or"cloud",
function()ac._activateTab(af,true)end,af)
end
return eJ
end end function a.at():typeof(__modImpl())local aa=a.cache.at if not aa then aa={c=__modImpl()}a.cache.at=aa end return aa.c end end do local function __modImpl()








local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.h()
local af=a.d()a.v()

local ey=a.b()

local ez=af.Z
local eA=ab.Tween
local eG=ac.corner
local eH=ac.stroke
local eI=ad.resolveIcon
local eJ=ey.cloneref_check(game:GetService"Players")
local eK=eJ.LocalPlayer
ey.cloneref_check(game:GetService"RunService")
local eL=ey.cloneref_check(game:GetService"TweenService")

local eM="rbxasset://fonts/families/RobotoMono.json"

local function EscapeRichText(eN)
eN=eN:gsub("&","&amp;")
eN=eN:gsub("<","&lt;")
eN=eN:gsub(">","&gt;")
return eN
end

local function MarkdownToRichText(eN)
eN=EscapeRichText(eN)

eN=eN:gsub("`([^`\n]+)`","<font family=\""..eM.."\">%1</font>")

eN=eN:gsub("%*%*(.-)%*%*","<b>%1</b>")
eN=eN:gsub("__(.-)__","<b>%1</b>")

eN=eN:gsub("%*([^%s*][^*]-)%*","<i>%1</i>")
eN=eN:gsub("_([^%s_][^_]-)_","<i>%1</i>")

return eN
end

local function SplitMessageSegments(eN)
local eO={}
local eU=1
while true do
local eW,eX,eY,eZ=eN:find("```(%w*)\n?(.-)```",eU)
if not eW then
local e_=eN:sub(eU)
if e_~=""then table.insert(eO,{kind="text",content=e_})end
break
end
if eW>eU then
local e_=eN:sub(eU,eW-1)
if e_:match"%S"then
table.insert(eO,{kind="text",content=e_})
end
end
eZ=eZ:gsub("^%s+",""):gsub("%s+$","")
table.insert(eO,{kind="code",lang=eY~=""and eY or"lua",content=eZ})
eU=eX+1
end
if#eO==0 then
table.insert(eO,{kind="text",content=eN})
end
return eO
end

local eN={
["and"]=true,["break"]=true,["do"]=true,["else"]=true,["elseif"]=true,
["end"]=true,["false"]=true,["for"]=true,["function"]=true,["if"]=true,
["in"]=true,["local"]=true,["nil"]=true,["not"]=true,["or"]=true,
["repeat"]=true,["return"]=true,["then"]=true,["true"]=true,
["until"]=true,["while"]=true,continue=true,
}

local function HighlightLua(eO)
local eU={}
local eW=#eO
local eX=1

while eX<=eW do
local eY=eO:sub(eX,eX)

if eO:sub(eX,eX+3)=="--[["then
local eZ=select(2,eO:find("%]%]",eX+4))
local e_=eZ or eW
eU[#eU+1]="<font color=\"#6A9955\">"..eO:sub(eX,e_).."</font>"
eX=e_+1
elseif eO:sub(eX,eX+1)=="--"then
local eZ=eO:find("\n",eX,true)
local e_=(eZ or(eW+1))-1
eU[#eU+1]="<font color=\"#6A9955\">"..eO:sub(eX,e_).."</font>"
eX=e_+1
elseif eY=='"'or eY=="'"then
local eZ=eY
local e_=eX+1
while e_<=eW do
local e0=eO:sub(e_,e_)
if e0=="\\"then
e_=e_+2
elseif e0==eZ or e0=="\n"then
break
else
e_=e_+1
end
end
e_=math.min(e_,eW)
eU[#eU+1]="<font color=\"#CE9178\">"..eO:sub(eX,e_).."</font>"
eX=e_+1
elseif eY:match"%a"or eY=="_"then
local eZ=eX
while eZ<=eW and eO:sub(eZ,eZ):match"[%w_]"do eZ=eZ+1 end
local e_=eO:sub(eX,eZ-1)
eU[#eU+1]=eN[e_]and("<font color=\"#C586C0\">"..e_.."</font>")or e_
eX=eZ
elseif eY:match"%d"then
local eZ=eX
while eZ<=eW and eO:sub(eZ,eZ):match"[%d%.]"do eZ=eZ+1 end
eU[#eU+1]="<font color=\"#B5CEA8\">"..eO:sub(eX,eZ-1).."</font>"
eX=eZ
else
eU[#eU+1]=eY
eX=eX+1
end
end

return table.concat(eU)
end

local eO=ey.cloneref_check(game:GetService"TextService")
local eU=1.06
local eW={}

local function MeasureText(eX,eY,eZ)
eX=tostring(eX or"")
eZ=eZ or 10000
local e_=eX.."\1"..eY.."\1"..math.floor(eZ)
local e0=eW[e_]
if e0 then return e0.X,e0.Y end

local e1,e2=pcall(function()
return eO:GetTextSize(
eX,eY,Enum.Font.GothamSemibold,
Vector2.new(eZ,100000)
)
end)
local e3,e4
if e1 and e2 then
e3=math.ceil(e2.X*eU)
e4=math.ceil(e2.Y)
else
e3=math.ceil(#eX*eY*0.55)
e4=eY+2
end
eW[e_]={X=e3,Y=e4}
return e3,e4
end

return function(eX,eY)
eY=eY or{}
local eZ=aa.Theme
eY.Tools=eY.Tools or eX:_BuildDefaultChatTools()
local e_=function(e_)return eX:Track(e_)end

local e0=eX:Tab{
Title=eY.Name or eY.Title or"Assistant",
Icon=eY.Icon or"bot",
Hidden=true,
}

local e1={}
for e2,e3 in ipairs(eY.Tools or{})do
if e3.Name then e1[e3.Name]=e3 end
end

local e2=38
local e3=38

local e4=Instance.new"Frame"
e4.Name="ChatPanel"
e4.BackgroundTransparency=1
e4.ClipsDescendants=true
e4.Size=UDim2.fromScale(1,1)
e4.ZIndex=ez.Content
e4.Parent=e0.Page

local e5=e4.ZIndex+1

local e6=Instance.new"Frame"
e6.Name="Content"
e6.BackgroundTransparency=1
e6.Size=UDim2.fromScale(1,1)
e6.ZIndex=e4.ZIndex
e6.Parent=e4

local e7=Instance.new"Frame"
e7.BackgroundTransparency=1
e7.Active=true
e7.Size=UDim2.new(1,0,0,e3)
e7.ZIndex=e5
e7.Parent=e6

local e8=Instance.new"UIPadding"
e8.PaddingLeft=UDim.new(0,14)
e8.PaddingRight=UDim.new(0,8)
e8.Parent=e7

local e9=Instance.new"Frame"
e9.BackgroundTransparency=1
e9.Size=UDim2.new(1,-84,1,0)
e9.ZIndex=e5+1
e9.Parent=e7

local fa=Instance.new"UIListLayout"
fa.FillDirection=Enum.FillDirection.Horizontal
fa.VerticalAlignment=Enum.VerticalAlignment.Center
fa.Padding=UDim.new(0,7)
fa.Parent=e9

local fb=Instance.new"ImageLabel"
fb.BackgroundTransparency=1
fb.Image=eI(eY.Icon or"bot")
fb.ImageColor3=eZ.Text
fb.Size=UDim2.fromOffset(14,14)
fb.LayoutOrder=1
fb.ZIndex=e5+2
fb.Parent=e9

local fc=Instance.new"TextLabel"
fc.BackgroundTransparency=1
fc.FontFace=ae.FontSemi
fc.Text=eY.Title or"Assistant"
fc.TextColor3=eZ.Text
fc.TextSize=14
fc.TextXAlignment=Enum.TextXAlignment.Left
fc.AutomaticSize=Enum.AutomaticSize.X
fc.Size=UDim2.fromOffset(0,16)
fc.LayoutOrder=2
fc.ZIndex=e5+2
fc.Parent=e9

local fd=Instance.new"Frame"
fd.BackgroundTransparency=1
fd.AnchorPoint=Vector2.new(1,0.5)
fd.Position=UDim2.new(1,0,0.5,0)
fd.Size=UDim2.fromOffset(100,22)
fd.ZIndex=e5+1
fd.Parent=e7

local fe=Instance.new"UIListLayout"
fe.FillDirection=Enum.FillDirection.Horizontal
fe.HorizontalAlignment=Enum.HorizontalAlignment.Right
fe.VerticalAlignment=Enum.VerticalAlignment.Center
fe.Padding=UDim.new(0,4)
fe.Parent=fd

local function headerIconButton(ff,fg)
local fh=Instance.new"TextButton"
fh.Text=""
fh.AutoButtonColor=false
fh.BackgroundColor3=Color3.new(1,1,1)
fh.BackgroundTransparency=1
fh.BorderSizePixel=0
fh.Size=UDim2.fromOffset(22,22)
fh.LayoutOrder=fg
fh.ZIndex=e5+1
fh.Parent=fd
eG(fh,6)

local fi=Instance.new"ImageLabel"
fi.BackgroundTransparency=1
fi.Image=eI(ff)
fi.ImageColor3=eZ.Dim
fi.Size=UDim2.fromOffset(13,13)
fi.AnchorPoint=Vector2.new(0.5,0.5)
fi.Position=UDim2.fromScale(0.5,0.5)
fi.ZIndex=e5+2
fi.Parent=fh

e_(fh.MouseEnter:Connect(function()
eA(fh,{BackgroundTransparency=0.9},0.12)
eA(fi,{ImageColor3=eZ.Text},0.12)
end))
e_(fh.MouseLeave:Connect(function()
eA(fh,{BackgroundTransparency=1},0.12)
eA(fi,{ImageColor3=eZ.Dim},0.12)
end))

return fh,fi
end

local ff,fg=headerIconButton("copy",1)
local fh,fi=headerIconButton("refresh-cw",2)
local fj=headerIconButton("trash-2",3)
local fk=headerIconButton("x",4)

local fl=Instance.new"Frame"
fl.BackgroundColor3=Color3.new(1,1,1)
fl.BackgroundTransparency=0.94
fl.BorderSizePixel=0
fl.Position=UDim2.fromOffset(0,e3)
fl.Size=UDim2.new(1,0,0,1)
fl.ZIndex=e5
fl.Parent=e6

local fm=Instance.new"UIPadding"
fm.PaddingLeft=UDim.new(0,14)
fm.PaddingRight=UDim.new(0,14)
fm.PaddingBottom=UDim.new(0,12)
fm.Parent=e6

local fn=Instance.new"Frame"
fn.BackgroundTransparency=1
fn.Active=true
fn.AnchorPoint=Vector2.new(0,1)
fn.Position=UDim2.new(0,0,1,0)
fn.Size=UDim2.new(1,0,0,e2)
fn.ZIndex=e5
fn.Parent=e6

local fo=Instance.new"Frame"
fo.BackgroundColor3=Color3.new(1,1,1)
fo.BackgroundTransparency=0.95
fo.BorderSizePixel=0
fo.Size=UDim2.new(1,-(e2+6),1,0)
fo.ZIndex=e5+1
fo.Parent=fn
eG(fo,9)
local fp=eH(fo,Color3.new(1,1,1),1,0.9)

local fq=Instance.new"UIPadding"
fq.PaddingLeft=UDim.new(0,10)
fq.PaddingRight=UDim.new(0,10)
fq.Parent=fo

local fr=Instance.new"TextBox"
fr.BackgroundTransparency=1
fr.ClearTextOnFocus=false
fr.FontFace=ae.FontReg
fr.PlaceholderText=eY.Placeholder or"Ask me anything..."
fr.PlaceholderColor3=Color3.fromRGB(120,120,122)
fr.Text=""
fr.TextColor3=eZ.Text
fr.TextSize=13
fr.TextXAlignment=Enum.TextXAlignment.Left
fr.TextYAlignment=Enum.TextYAlignment.Center
fr.ClipsDescendants=true
fr.Size=UDim2.fromScale(1,1)
fr.ZIndex=e5+2
fr.Parent=fo

e_(fr.Focused:Connect(function()
eA(fp,{Color=eZ.Accent,Transparency=0.3},0.15)
end))
e_(fr.FocusLost:Connect(function()
eA(fp,{Color=Color3.new(1,1,1),Transparency=0.9},0.15)
end))

local fs=Instance.new"TextButton"
fs.Name="Send"
fs.Text=""
fs.AutoButtonColor=false
fs.BackgroundColor3=Color3.new(1,1,1)
fs.BackgroundTransparency=0.9
fs.BorderSizePixel=0
fs.AnchorPoint=Vector2.new(1,0)
fs.Position=UDim2.new(1,0,0,0)
fs.Size=UDim2.fromOffset(e2,e2)
fs.ZIndex=e5+1
fs.Parent=fn
eG(fs,9)

local ft=Instance.new"ImageLabel"
ft.BackgroundTransparency=1
ft.Image=eI"send"
ft.ImageColor3=eZ.Text
ft.Size=UDim2.fromOffset(14,14)
ft.AnchorPoint=Vector2.new(0.5,0.5)
ft.Position=UDim2.fromScale(0.5,0.5)
ft.ZIndex=e5+2
ft.Parent=fs

e_(fs.MouseEnter:Connect(function()eA(fs,{BackgroundTransparency=0.8},0.12)end))
e_(fs.MouseLeave:Connect(function()eA(fs,{BackgroundTransparency=0.9},0.12)end))

local fu=Instance.new"ScrollingFrame"
fu.BackgroundTransparency=1
fu.BorderSizePixel=0
fu.Position=UDim2.fromOffset(0,e3+9)
fu.Size=UDim2.new(1,0,1,-(e3+9+e2+10))
fu.ScrollingDirection=Enum.ScrollingDirection.Y
fu.ScrollBarThickness=0
fu.ScrollBarImageTransparency=1
fu.VerticalScrollBarInset=Enum.ScrollBarInset.None
fu.HorizontalScrollBarInset=Enum.ScrollBarInset.None
fu.AutomaticCanvasSize=Enum.AutomaticSize.Y
fu.CanvasSize=UDim2.new(0,0,0,0)
fu.ZIndex=e5
fu.Parent=e6

local fv=Instance.new"UIPadding"
fv.PaddingRight=UDim.new(0,18)
fv.Parent=fu

local fw=Instance.new"UIListLayout"
fw.Padding=UDim.new(0,8)
fw.SortOrder=Enum.SortOrder.LayoutOrder
fw.Parent=fu

local fx=Instance.new"Frame"
fx.Name="ContentScrollThumb"
fx.BackgroundColor3=eZ.Dim
fx.BackgroundTransparency=0.35
fx.BorderSizePixel=0
fx.AnchorPoint=Vector2.new(1,0)
fx.Size=UDim2.new(0,3,0,40)
fx.Visible=false
fx.ZIndex=(fu.ZIndex or 0)+6
fx.Parent=e4
eG(fx,2)

local fy=4
local function paintThumb()
if not e4.Visible then
fx.Visible=false
return
end
local fz=fu.AbsoluteWindowSize.Y
local fA=fu.AbsoluteCanvasSize.Y
local fB=fA-fz
if fB<=8 or fz<=0 then
fx.Visible=false
return
end
local fC=fz-fy*2
if fC<=0 then
fx.Visible=false
return
end
local fD,fE=e4.AbsolutePosition,e4.AbsoluteSize
if fE.X<=0 or fE.Y<=0 then
fx.Visible=false
return
end
local fF=math.max(30,fC*(fz/fA))
local fG=fC-fF
local fH=math.clamp(fu.CanvasPosition.Y/fB,0,1)
local fI=(fu.AbsolutePosition.Y-fD.Y)+fy+fG*fH
local fJ=(fu.AbsolutePosition.X+fu.AbsoluteSize.X)-fD.X
fx.Visible=true
fx.Size=UDim2.new(0,3,0,fF)
fx.Position=UDim2.new(fJ/fE.X,0,fI/fE.Y,0)
end
e_(fu:GetPropertyChangedSignal"CanvasPosition":Connect(paintThumb))
e_(fu:GetPropertyChangedSignal"AbsoluteCanvasSize":Connect(paintThumb))
e_(fu:GetPropertyChangedSignal"AbsoluteWindowSize":Connect(paintThumb))
e_(e4:GetPropertyChangedSignal"Visible":Connect(paintThumb))
e_(e4:GetPropertyChangedSignal"AbsoluteSize":Connect(paintThumb))

local fz=0
local fA={}

local fB=true
e_(fu:GetPropertyChangedSignal"AbsoluteCanvasSize":Connect(function()
if fB then
fu.CanvasPosition=Vector2.new(0,fu.AbsoluteCanvasSize.Y)
end
end))
e_(fu:GetPropertyChangedSignal"CanvasPosition":Connect(function()
local fC=fu.CanvasPosition.Y
>=fu.AbsoluteCanvasSize.Y-fu.AbsoluteWindowSize.Y-20
fB=fC
end))

local function scrollToBottom()
fB=true
task.defer(function()
if fu and fu.Parent then
fu.CanvasPosition=Vector2.new(0,fu.AbsoluteCanvasSize.Y)
end
end)
end

local fC=26

local function codeHeaderButton(fD,fE,fF)
local fG=Instance.new"TextButton"
fG.Text=""
fG.AutoButtonColor=false
fG.BackgroundColor3=Color3.new(1,1,1)
fG.BackgroundTransparency=1
fG.BorderSizePixel=0
fG.AnchorPoint=Vector2.new(1,0.5)
fG.Position=UDim2.new(1,-fF,0.5,0)
fG.Size=UDim2.fromOffset(20,20)
fG.ZIndex=e5+5
fG.Parent=fD
eG(fG,5)

local fH=Instance.new"ImageLabel"
fH.BackgroundTransparency=1
fH.Image=eI(fE)
fH.ImageColor3=eZ.Dim
fH.Size=UDim2.fromOffset(12,12)
fH.AnchorPoint=Vector2.new(0.5,0.5)
fH.Position=UDim2.fromScale(0.5,0.5)
fH.ZIndex=e5+6
fH.Parent=fG

e_(fG.MouseEnter:Connect(function()
eA(fG,{BackgroundTransparency=0.85},0.12)
eA(fH,{ImageColor3=eZ.Text},0.12)
end))
e_(fG.MouseLeave:Connect(function()
eA(fG,{BackgroundTransparency=1},0.12)
eA(fH,{ImageColor3=eZ.Dim},0.12)
end))

return fG,fH
end

local function addBubble(fD,fE)
local fF=fE=="user"
fz=fz+1

fD=fD:gsub("^%s+",""):gsub("%s+$",""):gsub("\n\n\n+","\n\n")

local fG=Instance.new"Frame"
fG.Name="MessageRow"
fG.BackgroundTransparency=1
fG.AutomaticSize=Enum.AutomaticSize.Y
fG.Size=UDim2.new(1,0,0,0)
fG.LayoutOrder=fz
fG.ZIndex=e5+1
fG.Parent=fu

local fH=Instance.new"UIScale"
fH.Scale=0.92
fH.Parent=fG

local fI=Instance.new"UIListLayout"
fI.FillDirection=Enum.FillDirection.Horizontal
fI.HorizontalAlignment=fF and Enum.HorizontalAlignment.Right or Enum.HorizontalAlignment.Left
fI.VerticalAlignment=Enum.VerticalAlignment.Top
fI.Padding=UDim.new(0,8)
fI.Parent=fG

local fJ=fF and 0.85 or 0.82
local fK=Instance.new"Frame"
fK.Name="Avatar"
fK.BackgroundColor3=fF and Color3.new(1,1,1)or eZ.Accent
fK.BackgroundTransparency=1
fK.BorderSizePixel=0
fK.Size=UDim2.fromOffset(fC,fC)
fK.LayoutOrder=fF and 2 or 1
fK.ZIndex=e5+2
fK.Parent=fG
eG(fK,fC/2)

local fL
if fF then
local fM=Instance.new"ImageLabel"
fM.BackgroundTransparency=1
fM.ImageTransparency=1
fM.ScaleType=Enum.ScaleType.Crop
fM.Size=UDim2.fromScale(1,1)
fM.ZIndex=e5+3
fM.Parent=fK
eG(fM,fC/2)
fL=fM
task.spawn(function()
local fN,fO=pcall(
eJ.GetUserThumbnailAsync,
eJ,
eK.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size100x100
)
if fN and fO and fM.Parent then
fM.Image=fO
end
end)
else
local fM=Instance.new"ImageLabel"
fM.BackgroundTransparency=1
fM.ImageTransparency=1
fM.Image=eI"bot"
fM.ImageColor3=eZ.Accent
fM.Size=UDim2.fromOffset(14,14)
fM.AnchorPoint=Vector2.new(0.5,0.5)
fM.Position=UDim2.fromScale(0.5,0.5)
fM.ZIndex=e5+3
fM.Parent=fK
fL=fM
end

local fM=SplitMessageSegments(fD)
local fN=false
for fO,fP in ipairs(fM)do
if fP.kind=="code"then fN=true end
end

local fO,fP=10,8
local fQ=fN and 380 or 260
local fR
if fN then
fR=fQ
else
local fS=MeasureText(fM[1].content,13,10000)
fR=math.min(fS,fQ-fO*2)+fO*2
end
if fu.AbsoluteSize.X>0 then
fR=math.min(fR,math.max(200,fu.AbsoluteSize.X-20))
end

local fS=fF and 0.72 or 0.9
local fT=Instance.new"Frame"
fT.Name="Bubble"
fT.BackgroundColor3=fF and eZ.Accent or Color3.new(1,1,1)
fT.BackgroundTransparency=1
fT.BorderSizePixel=0
fT.AutomaticSize=Enum.AutomaticSize.Y
fT.Size=UDim2.fromOffset(fR,0)
fT.LayoutOrder=fF and 1 or 2
fT.ZIndex=e5+2
fT.Parent=fG
eG(fT,12)
local fU=fF and 0.8 or 0.9
local fV=eH(fT,Color3.new(1,1,1),1,1)

local fW=Instance.new"UIPadding"
fW.PaddingTop=UDim.new(0,fP)
fW.PaddingBottom=UDim.new(0,fP)
fW.PaddingLeft=UDim.new(0,fO)
fW.PaddingRight=UDim.new(0,fO)
fW.Parent=fT

local fX=Instance.new"UIListLayout"
fX.FillDirection=Enum.FillDirection.Vertical
fX.Padding=UDim.new(0,8)
fX.SortOrder=Enum.SortOrder.LayoutOrder
fX.Parent=fT

eA(fK,{BackgroundTransparency=fJ},0.16)
eA(fL,{ImageTransparency=0},0.16)
eA(fT,{BackgroundTransparency=fS},0.16)
eA(fV,{Transparency=fU},0.16)
eA(fH,{Scale=1},0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)

local fY=0.08
local fZ=0

for f_,f0 in ipairs(fM)do
if f0.kind=="code"then
local f1=Instance.new"Frame"
f1.Name="CodeBlock"
f1.BackgroundColor3=eZ.Bg
f1.BackgroundTransparency=0.1
f1.BorderSizePixel=0
f1.ClipsDescendants=true
f1.AutomaticSize=Enum.AutomaticSize.Y
f1.Size=UDim2.new(1,0,0,0)
f1.LayoutOrder=f_
f1.ZIndex=e5+3
f1.Parent=fT
eG(f1,8)
eH(f1,Color3.new(1,1,1),1,0.92)

local f2=Instance.new"UIListLayout"
f2.FillDirection=Enum.FillDirection.Vertical
f2.SortOrder=Enum.SortOrder.LayoutOrder
f2.Parent=f1

local f3=Instance.new"Frame"
f3.BackgroundTransparency=1
f3.Size=UDim2.new(1,0,0,24)
f3.LayoutOrder=1
f3.ZIndex=e5+4
f3.Parent=f1

local f4=Instance.new"TextLabel"
f4.BackgroundTransparency=1
f4.FontFace=ae.FontReg
f4.Text=f0.lang
f4.TextColor3=eZ.Dim
f4.TextSize=11
f4.TextXAlignment=Enum.TextXAlignment.Left
f4.Position=UDim2.fromOffset(10,0)
f4.Size=UDim2.new(1,-70,1,0)
f4.ZIndex=e5+5
f4.Parent=f3

local f5,f6=codeHeaderButton(f3,"copy",8)
e_(f5.MouseButton1Click:Connect(function()
local f7=ey.hasFn"setclipboard"
if not f7 then return end
pcall(f7,f0.content)
eA(f6,{ImageColor3=Color3.fromRGB(120,220,140)},0.1)
task.delay(0.4,function()
if f6.Parent then
eA(f6,{ImageColor3=eZ.Dim},0.15)
end
end)
end))

if eY.OnRunCode then local
f7=codeHeaderButton(f3,"play",32)
e_(f7.MouseButton1Click:Connect(function()
eX:Confirm{
Title="Run this code?",
Text="This runs exactly what's shown above, right now, in this game.",
ConfirmText="Run",
CancelText="Cancel",
Danger=true,
Callback=function(f8)
if not f8 then return end
local f9,ga=pcall(eY.OnRunCode,f0.content,f0.lang)
eX:Notify{
Title=f9 and"Ran"or"Run failed",
Text=f9 and"Code executed."or tostring(ga),
Type=f9 and"success"or"error",
Duration=3,
}
end,
}
end))
end

local f7=Instance.new"Frame"
f7.BackgroundColor3=Color3.new(1,1,1)
f7.BackgroundTransparency=0.92
f7.BorderSizePixel=0
f7.Size=UDim2.new(1,0,0,1)
f7.LayoutOrder=2
f7.ZIndex=e5+4
f7.Parent=f1

local f8=Instance.new"Frame"
f8.BackgroundTransparency=1
f8.AutomaticSize=Enum.AutomaticSize.Y
f8.Size=UDim2.new(1,0,0,0)
f8.LayoutOrder=3
f8.ZIndex=e5+4
f8.Parent=f1

local f9=Instance.new"UIPadding"
f9.PaddingTop=UDim.new(0,8)
f9.PaddingBottom=UDim.new(0,8)
f9.PaddingLeft=UDim.new(0,10)
f9.PaddingRight=UDim.new(0,10)
f9.Parent=f8

local ga=Instance.new"TextLabel"
ga.BackgroundTransparency=1
ga.FontFace=Font.new(eM,Enum.FontWeight.Regular,Enum.FontStyle.Normal)
ga.RichText=true
ga.Text=HighlightLua(EscapeRichText(f0.content))
ga.TextColor3=eZ.Text
ga.TextSize=12
ga.TextWrapped=true
ga.TextXAlignment=Enum.TextXAlignment.Left
ga.TextYAlignment=Enum.TextYAlignment.Top
ga.LineHeight=1.3
ga.AutomaticSize=Enum.AutomaticSize.Y
ga.Size=UDim2.new(1,0,0,16)
ga.ZIndex=e5+5
ga.Parent=f8
else
local f1=Instance.new"TextLabel"
f1.Name="Prose"
f1.BackgroundTransparency=1
f1.FontFace=ae.FontReg
f1.RichText=true
f1.Text=MarkdownToRichText(f0.content)
f1.TextColor3=eZ.Text
f1.TextTransparency=1
f1.TextSize=13
f1.TextWrapped=true
f1.TextXAlignment=Enum.TextXAlignment.Left
f1.TextYAlignment=Enum.TextYAlignment.Top
f1.LineHeight=1.3
f1.AutomaticSize=Enum.AutomaticSize.Y
f1.Size=UDim2.new(1,0,0,16)
f1.LayoutOrder=f_
f1.ZIndex=e5+3

f1.MaxVisibleGraphemes=0
f1.Parent=fT

eA(f1,{TextTransparency=0},0.16)

local f2=utf8.len(f0.content)or#f0.content
local f3=math.clamp(f2*0.014,0.12,1.6)
fZ=math.max(fZ,f3)
task.delay(fY,function()
if f1 and f1.Parent then
if aa.ReducedMotion then
f1.MaxVisibleGraphemes=f2
else
ab.tween(f1,
TweenInfo.new(f3,Enum.EasingStyle.Linear),
{MaxVisibleGraphemes=f2})
end
end
end)
end
end

scrollToBottom()
table.insert(fA,(fF and"You"or"Assistant")..": "..fD)

return fY+fZ
end

local fD

local function addToolLine(fE)
fz=fz+1
local fF=Instance.new"Frame"
fF.Name="ToolCall"
fF.BackgroundTransparency=1
fF.AutomaticSize=Enum.AutomaticSize.Y
fF.Size=UDim2.new(1,0,0,18)
fF.LayoutOrder=fz
fF.ZIndex=e5+1
fF.Parent=fu

local fG=Instance.new"UIListLayout"
fG.FillDirection=Enum.FillDirection.Horizontal
fG.VerticalAlignment=Enum.VerticalAlignment.Center
fG.Padding=UDim.new(0,6)
fG.Parent=fF

local fH=Instance.new"ImageLabel"
fH.BackgroundTransparency=1
fH.Image=eI"wrench"
fH.ImageColor3=eZ.Accent
fH.Size=UDim2.fromOffset(11,11)
fH.LayoutOrder=1
fH.ZIndex=e5+2
fH.Parent=fF

local fI=Instance.new"TextLabel"
fI.BackgroundTransparency=1
fI.FontFace=ae.FontReg
fI.Text="Called tool: "..tostring(fE)
fI.TextColor3=eZ.Dim
fI.TextSize=11
fI.AutomaticSize=Enum.AutomaticSize.XY
fI.Size=UDim2.fromOffset(0,14)
fI.LayoutOrder=2
fI.ZIndex=e5+2
fI.Parent=fF

scrollToBottom()
table.insert(fA,"[Called tool: "..tostring(fE).."]")
if fD then fD()end
end

local fE,fF,fG=false

local function destroyTypingRow()
if fG then
for fH,fI in ipairs(fG)do pcall(function()fI:Cancel()end)end
fG=nil
end
if fF then
pcall(function()fF:Destroy()end)
fF=nil
end
end

local function buildTypingRow()
fz=fz+1

local fH=Instance.new"Frame"
fH.Name="TypingRow"
fH.BackgroundTransparency=1
fH.AutomaticSize=Enum.AutomaticSize.Y
fH.Size=UDim2.new(1,0,0,0)
fH.LayoutOrder=fz
fH.ZIndex=e5+1
fH.Parent=fu

local fI=Instance.new"UIListLayout"
fI.FillDirection=Enum.FillDirection.Horizontal
fI.VerticalAlignment=Enum.VerticalAlignment.Top
fI.Padding=UDim.new(0,8)
fI.Parent=fH

local fJ=Instance.new"Frame"
fJ.BackgroundColor3=eZ.Accent
fJ.BackgroundTransparency=1
fJ.BorderSizePixel=0
fJ.Size=UDim2.fromOffset(fC,fC)
fJ.LayoutOrder=1
fJ.ZIndex=e5+2
fJ.Parent=fH
eG(fJ,fC/2)

local fK=Instance.new"ImageLabel"
fK.BackgroundTransparency=1
fK.ImageTransparency=1
fK.Image=eI"bot"
fK.ImageColor3=eZ.Accent
fK.Size=UDim2.fromOffset(14,14)
fK.AnchorPoint=Vector2.new(0.5,0.5)
fK.Position=UDim2.fromScale(0.5,0.5)
fK.ZIndex=e5+3
fK.Parent=fJ

local fL=Instance.new"Frame"
fL.BackgroundColor3=Color3.new(1,1,1)
fL.BackgroundTransparency=1
fL.BorderSizePixel=0
fL.Size=UDim2.fromOffset(38,fC)
fL.LayoutOrder=2
fL.ZIndex=e5+2
fL.Parent=fH
eG(fL,12)
local fM=eH(fL,Color3.new(1,1,1),1,1)

local fN={}
for fO=1,3 do
local fP=10+(fO-1)*9
local fQ=Instance.new"Frame"
fQ.BackgroundColor3=eZ.Dim
fQ.BackgroundTransparency=1
fQ.BorderSizePixel=0
fQ.AnchorPoint=Vector2.new(0.5,0.5)
fQ.Position=UDim2.new(0,fP,0.5,0)
fQ.Size=UDim2.fromOffset(4,4)
fQ.ZIndex=e5+3
fQ.Parent=fL
eG(fQ,2)
eA(fQ,{BackgroundTransparency=0},0.15)

if aa.ReducedMotion then
fN[fO]=nil
else
fN[fO]=eL:Create(
fQ,
TweenInfo.new(0.45,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true,(fO-1)*0.15),
{Position=UDim2.new(0,fP,0.5,-3)}
)
fN[fO]:Play()
end
end

eA(fJ,{BackgroundTransparency=0.82},0.15)
eA(fK,{ImageTransparency=0},0.15)
eA(fL,{BackgroundTransparency=0.9},0.15)
eA(fM,{Transparency=0.9},0.15)

fF,fG=fH,fN
scrollToBottom()
end

local function showTyping()
if fF then return end
fE=true
buildTypingRow()
end

function fD()
if not fF then return end
destroyTypingRow()
buildTypingRow()
end

local function hideTyping()
if not fE then return end
fE=false
destroyTypingRow()
end

local function addMessage(fH,fI)
fI=tostring(fI or"")
if fI==""then return end
hideTyping()
if fH=="tool"then
addToolLine(fI)
return nil
end
return addBubble(fI,fH)
end

local function handleToolCall(fH,fI)
local fJ=e1[fH]
addToolLine(fH)
if not fJ or not fJ.Handler then
addMessage("assistant","Unknown tool: "..tostring(fH))
return nil
end
local fK,fL=pcall(fJ.Handler,fI)
if not fK then
addMessage("assistant","Tool error: "..tostring(fL))
return nil
end
return fL
end

local fH=false
local fI




local fJ={}

local function setSending(fK)
fH=fK
ft.Image=eI(fK and"square"or"send")
end

local function trySend(fK)
local fL=fK or fr.Text
if fH or fL==""then return end
setSending(true)
if not fK then fr.Text=""end
fI=fL
local fM=addMessage("user",fL)
if eY.OnSend then
local fN=false

task.spawn(function()

if fM and fM>0 then task.wait(fM)end
local fO,fP=pcall(eY.OnSend,fJ,fL)
if not fO then
addMessage("assistant","Error: "..tostring(fP))
end
fN=true
setSending(false)
end)

task.delay(eY.SendTimeout or 30,function()
if not fN and fH then
hideTyping()
addMessage("assistant","Still working... (press stop to cancel)")
end
end)
else
setSending(false)
end
end

local function tryRegenerate()
if fH or not fI then return end
if eY.OnRegenerate then
task.spawn(eY.OnRegenerate,fJ,fI)
else
trySend(fI)
end
end

local fK

local function openChat()
if eX._active==e0 then return end
if eX._active and not eX._active.Hidden then
fK=eX._active
end
eX._activateTab(e0,true)
end

local function closeChat()
if eX._active~=e0 then return end
if fK and not fK.Hidden then
eX._activateTab(fK,true)
elseif eX._tabs[1]and eX._tabs[1]~=e0 then
eX._activateTab(eX._tabs[1],true)
end
end

table.insert(eX._tabChangeListeners,function(fL)
if eY.OnToggle then task.spawn(eY.OnToggle,fL==e0)end
end)

local function clearChat()
hideTyping()
for fL,fM in ipairs(fu:GetChildren())do
if fM.Name=="MessageRow"or fM.Name=="ToolCall"then
fM:Destroy()
end
end
table.clear(fA)
if eY.OnClear then task.spawn(eY.OnClear)end
end

e_(fs.MouseButton1Click:Connect(function()
if fH then
if eY.OnStop then task.spawn(eY.OnStop,fJ)end
else
trySend()
end
end))
e_(fr.FocusLost:Connect(function(fL)
if fL then trySend()end
end))
e_(fk.MouseButton1Click:Connect(closeChat))

e_(ff.MouseButton1Click:Connect(function()
local fL=ey.hasFn"setclipboard"
if not fL or#fA==0 then return end
pcall(fL,table.concat(fA,"\n\n"))
eA(fg,{ImageColor3=Color3.fromRGB(120,220,140)},0.1)
task.delay(0.4,function()
if fg.Parent then
eA(fg,{ImageColor3=eZ.Dim},0.15)
end
end)
end))
e_(fh.MouseButton1Click:Connect(function()
if fH or not fI then return end
eA(fi,{Rotation=fi.Rotation+180},0.25)
tryRegenerate()
end))
e_(fj.MouseButton1Click:Connect(function()
clearChat()
fI=nil
end))

fJ={
Instance=e4,
Tab=e0,
Open=openChat,
Close=closeChat,
Toggle=function()
if eX._active==e0 then closeChat()else openChat()end
end,
IsOpen=function()return eX._active==e0 end,
AddMessage=function(fL,fM,fN)addMessage(fM,fN)end,
LogToolCall=function(fL,fM)addToolLine(fM)end,
HandleToolCall=function(fL,fM,fN)return handleToolCall(fM,fN)end,
ShowTyping=function()showTyping()end,
HideTyping=function()hideTyping()end,
IsSending=function()return fH end,
Clear=function()clearChat()end,
Destroy=function()e4:Destroy()end,
}

if eX._dockAdd then
eX._dockAdd("AI",eY.Icon or"bot",
function()eX._activateTab(e0,true)end,e0)
end

return fJ
end end function a.au():typeof(__modImpl())local aa=a.cache.au if not aa then aa={c=__modImpl()}a.cache.au=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.h()
local af=a.d()a.v()

local ey=a.b()
local ez=a.x()

local eA=af.Z
local eG=ab.Tween
local eH=ac.corner
local eI=ac.stroke
local eJ=ad.resolveIcon
local eK=ey.cloneref_check(game:GetService"Players")
local eL=eK.LocalPlayer
local eM=ey.cloneref_check(game:GetService"TextService")
ey.cloneref_check(game:GetService"RunService")

local eN=1.06
local eO={}

local function MeasureText(eU,eW,eX)
eU=tostring(eU or"")
eX=eX or 10000
local eY=eU.."\1"..eW.."\1"..math.floor(eX)
local eZ=eO[eY]
if eZ then return eZ.X,eZ.Y end

local e_,e0=pcall(function()
return eM:GetTextSize(
eU,eW,Enum.Font.GothamSemibold,
Vector2.new(eX,100000)
)
end)
local e1,e2
if e_ and e0 then
e1=math.ceil(e0.X*eN)
e2=math.ceil(e0.Y)
else
e1=math.ceil(#eU*eW*0.55)
e2=eW+2
end
eO[eY]={X=e1,Y=e2}
return e1,e2
end

return function(eU,eW)
eW=eW or{}
local eX=aa.Theme
local eY=eW.Service
local eZ=function(eZ)return eU:Track(eZ)end

local e_=eU:Tab{
Title=eW.Name or eW.Title or"Chat",
Icon=eW.Icon or"messages-square",
Hidden=eW.Hidden~=false,
}
local e0=e_.Page

table.insert(eU._tabChangeListeners,function(e1)
if eW.OnToggle then task.spawn(eW.OnToggle,e1==e_)end
end)

local e1,e2=38,38

local e3=Instance.new"Frame"
e3.Name="GlobalChatPanel"
e3.BackgroundTransparency=1
e3.ClipsDescendants=true
e3.Size=UDim2.fromScale(1,1)
e3.ZIndex=eA.Content
e3.Parent=e0

local e4=e3.ZIndex+1

local e5=Instance.new"Frame"
e5.Name="Content"
e5.BackgroundTransparency=1
e5.Size=UDim2.fromScale(1,1)
e5.ZIndex=e3.ZIndex
e5.Parent=e3

local e6=Instance.new"Frame"
e6.BackgroundTransparency=1
e6.Active=true
e6.Size=UDim2.new(1,0,0,e2)
e6.ZIndex=e4
e6.Parent=e5

local e7=Instance.new"UIPadding"
e7.PaddingLeft=UDim.new(0,14)
e7.PaddingRight=UDim.new(0,8)
e7.Parent=e6

local e8=Instance.new"Frame"
e8.BackgroundTransparency=1
e8.Size=UDim2.new(1,-136,1,0)
e8.ZIndex=e4+1
e8.Parent=e6

local e9=Instance.new"UIListLayout"
e9.FillDirection=Enum.FillDirection.Horizontal
e9.VerticalAlignment=Enum.VerticalAlignment.Center
e9.Padding=UDim.new(0,7)
e9.Parent=e8

local fa=Instance.new"ImageLabel"
fa.BackgroundTransparency=1
fa.Image=eJ(eW.Icon or"messages-square")
fa.ImageColor3=eX.Text
fa.Size=UDim2.fromOffset(14,14)
fa.LayoutOrder=1
fa.ZIndex=e4+2
fa.Parent=e8

local fb=Instance.new"TextLabel"
fb.BackgroundTransparency=1
fb.FontFace=ae.FontSemi
fb.Text=eW.Title or"Chat"
fb.TextColor3=eX.Text
fb.TextSize=14
fb.TextXAlignment=Enum.TextXAlignment.Left
fb.AutomaticSize=Enum.AutomaticSize.X
fb.Size=UDim2.fromOffset(0,16)
fb.LayoutOrder=2
fb.ZIndex=e4+2
fb.Parent=e8

local fc=Instance.new"Frame"
fc.BackgroundTransparency=1
fc.AnchorPoint=Vector2.new(1,0.5)
fc.Position=UDim2.new(1,0,0.5,0)
fc.Size=UDim2.fromOffset(126,22)
fc.ZIndex=e4+1
fc.Parent=e6

local fd=Instance.new"UIListLayout"
fd.FillDirection=Enum.FillDirection.Horizontal
fd.HorizontalAlignment=Enum.HorizontalAlignment.Right
fd.VerticalAlignment=Enum.VerticalAlignment.Center
fd.Padding=UDim.new(0,4)
fd.Parent=fc

local function headerIconButton(fe,ff)
local fg=Instance.new"TextButton"
fg.Text=""
fg.AutoButtonColor=false
fg.BackgroundColor3=Color3.new(1,1,1)
fg.BackgroundTransparency=1
fg.BorderSizePixel=0
fg.Size=UDim2.fromOffset(22,22)
fg.LayoutOrder=ff
fg.ZIndex=e4+1
fg.Parent=fc
eH(fg,6)

local fh=Instance.new"ImageLabel"
fh.BackgroundTransparency=1
fh.Image=eJ(fe)
fh.ImageColor3=eX.Dim
fh.Size=UDim2.fromOffset(13,13)
fh.AnchorPoint=Vector2.new(0.5,0.5)
fh.Position=UDim2.fromScale(0.5,0.5)
fh.ZIndex=e4+2
fh.Parent=fg

eZ(fg.MouseEnter:Connect(function()
eG(fg,{BackgroundTransparency=0.9},0.12)
eG(fh,{ImageColor3=eX.Text},0.12)
end))
eZ(fg.MouseLeave:Connect(function()
eG(fg,{BackgroundTransparency=1},0.12)
eG(fh,{ImageColor3=eX.Dim},0.12)
end))

return fg,fh
end

local fe=eW.AnonymousByDefault~=false
local ff=true
local fg=false
local fh=eW.PollInterval or 2.5

local fi=eW.DiscordWebhookUrl or""
local fj=eW.WebhookTitle or eW.Title or"Global Chat"
local fk=eW.WebhookColor or 0x7C5CFF
local fl=eW.RelayOwn~=false
local fm=eW.RelayOthers==true

local function relayToDiscord(fn,fo,fp)
if fi==""then return end
if fp and not fl then return end
if not fp and not fm then return end
ez.SendChatToDiscord(fi,fn,fo,{
Title=fj,
Color=fk,
Footer=fp and"Sent from in-game"or"Global chat relay",
})
end

local function discordNameFor(fn,fo)
if fo then return"Anonymous"end
local fp,fq=pcall(function()return eK:GetNameFromUserIdAsync(fn)end)
if fp and fq then
return eL.DisplayName.." (@"..fq..")"
end
return eL.DisplayName or"Someone"
end

local fn,fo=headerIconButton("copy",1)
local fp,fq=headerIconButton(fe and"eye-off"or"eye",2)local
fr=headerIconButton("trash-2",3)local
fs=headerIconButton("settings",4)local
ft=headerIconButton("x",5)

local fu=Instance.new"Frame"
fu.BackgroundColor3=Color3.new(1,1,1)
fu.BackgroundTransparency=0.94
fu.BorderSizePixel=0
fu.Position=UDim2.fromOffset(0,e2)
fu.Size=UDim2.new(1,0,0,1)
fu.ZIndex=e4
fu.Parent=e5

local fv=Instance.new"UIPadding"
fv.PaddingLeft=UDim.new(0,14)
fv.PaddingRight=UDim.new(0,14)
fv.PaddingBottom=UDim.new(0,12)
fv.Parent=e5

local fw=Instance.new"Frame"
fw.BackgroundTransparency=1
fw.Active=true
fw.AnchorPoint=Vector2.new(0,1)
fw.Position=UDim2.new(0,0,1,0)
fw.Size=UDim2.new(1,0,0,e1)
fw.ZIndex=e4
fw.Parent=e5

local fx=Instance.new"Frame"
fx.BackgroundColor3=Color3.new(1,1,1)
fx.BackgroundTransparency=0.95
fx.BorderSizePixel=0
fx.Size=UDim2.new(1,-(e1+6),1,0)
fx.ZIndex=e4+1
fx.Parent=fw
eH(fx,9)
local fy=eI(fx,Color3.new(1,1,1),1,0.9)

local fz=Instance.new"UIPadding"
fz.PaddingLeft=UDim.new(0,10)
fz.PaddingRight=UDim.new(0,10)
fz.Parent=fx

local fA=Instance.new"TextBox"
fA.BackgroundTransparency=1
fA.ClearTextOnFocus=false
fA.FontFace=ae.FontReg
fA.PlaceholderText=eW.Placeholder or"Message everyone using this script..."
fA.PlaceholderColor3=Color3.fromRGB(120,120,122)
fA.Text=""
fA.TextColor3=eX.Text
fA.TextSize=13
fA.TextXAlignment=Enum.TextXAlignment.Left
fA.TextYAlignment=Enum.TextYAlignment.Center
fA.ClipsDescendants=true
fA.Size=UDim2.fromScale(1,1)
fA.ZIndex=e4+2
fA.Parent=fx

eZ(fA.Focused:Connect(function()
eG(fy,{Color=eX.Accent,Transparency=0.3},0.15)
end))
eZ(fA.FocusLost:Connect(function()
eG(fy,{Color=Color3.new(1,1,1),Transparency=0.9},0.15)
end))

local fB=Instance.new"TextButton"
fB.Text=""
fB.AutoButtonColor=false
fB.BackgroundColor3=Color3.new(1,1,1)
fB.BackgroundTransparency=0.9
fB.BorderSizePixel=0
fB.AnchorPoint=Vector2.new(1,0)
fB.Position=UDim2.new(1,0,0,0)
fB.Size=UDim2.fromOffset(e1,e1)
fB.ZIndex=e4+1
fB.Parent=fw
eH(fB,9)

local fC=Instance.new"ImageLabel"
fC.BackgroundTransparency=1
fC.Image=eJ"send"
fC.ImageColor3=eX.Text
fC.Size=UDim2.fromOffset(14,14)
fC.AnchorPoint=Vector2.new(0.5,0.5)
fC.Position=UDim2.fromScale(0.5,0.5)
fC.ZIndex=e4+2
fC.Parent=fB

eZ(fB.MouseEnter:Connect(function()eG(fB,{BackgroundTransparency=0.8},0.12)end))
eZ(fB.MouseLeave:Connect(function()eG(fB,{BackgroundTransparency=0.9},0.12)end))

local fD=Instance.new"ScrollingFrame"
fD.BackgroundTransparency=1
fD.BorderSizePixel=0
fD.Position=UDim2.fromOffset(0,e2+9)
fD.Size=UDim2.new(1,0,1,-(e2+9+e1+10))
fD.ScrollingDirection=Enum.ScrollingDirection.Y
fD.ScrollBarThickness=0
fD.ScrollBarImageTransparency=1
fD.VerticalScrollBarInset=Enum.ScrollBarInset.None
fD.HorizontalScrollBarInset=Enum.ScrollBarInset.None
fD.AutomaticCanvasSize=Enum.AutomaticSize.Y
fD.CanvasSize=UDim2.new(0,0,0,0)
fD.ZIndex=e4
fD.Parent=e5

local fE=Instance.new"UIPadding"
fE.PaddingRight=UDim.new(0,18)
fE.Parent=fD

local fF=Instance.new"UIListLayout"
fF.Padding=UDim.new(0,8)
fF.SortOrder=Enum.SortOrder.LayoutOrder
fF.Parent=fD


local fG=Instance.new"Frame"
fG.Name="ContentScrollThumb"
fG.BackgroundColor3=eX.Dim
fG.BackgroundTransparency=0.35
fG.BorderSizePixel=0
fG.AnchorPoint=Vector2.new(1,0)
fG.Size=UDim2.new(0,3,0,40)
fG.Visible=false
fG.ZIndex=(fD.ZIndex or 0)+6
fG.Parent=e3
eH(fG,2)

local fH=4
local function paintThumb()
if not e3.Visible then
fG.Visible=false
return
end
local fI=fD.AbsoluteWindowSize.Y
local fJ=fD.AbsoluteCanvasSize.Y
local fK=fJ-fI
if fK<=8 or fI<=0 then
fG.Visible=false
return
end
local fL=fI-fH*2
if fL<=0 then
fG.Visible=false
return
end
local fM,fN=e3.AbsolutePosition,e3.AbsoluteSize
if fN.X<=0 or fN.Y<=0 then
fG.Visible=false
return
end
local fO=math.max(30,fL*(fI/fJ))
local fP=fL-fO
local fQ=math.clamp(fD.CanvasPosition.Y/fK,0,1)
local fR=(fD.AbsolutePosition.Y-fM.Y)+fH+fP*fQ
local fS=(fD.AbsolutePosition.X+fD.AbsoluteSize.X)-fM.X
fG.Visible=true
fG.Size=UDim2.new(0,3,0,fO)
fG.Position=UDim2.new(fS/fN.X,0,fR/fN.Y,0)
end
eZ(fD:GetPropertyChangedSignal"CanvasPosition":Connect(paintThumb))
eZ(fD:GetPropertyChangedSignal"AbsoluteCanvasSize":Connect(paintThumb))
eZ(fD:GetPropertyChangedSignal"AbsoluteWindowSize":Connect(paintThumb))
eZ(e3:GetPropertyChangedSignal"Visible":Connect(paintThumb))
eZ(e3:GetPropertyChangedSignal"AbsoluteSize":Connect(paintThumb))

local fI=0
local fJ={}
local fK={}
local fL=true
eZ(fD:GetPropertyChangedSignal"AbsoluteCanvasSize":Connect(function()
if fL then
fD.CanvasPosition=Vector2.new(0,fD.AbsoluteCanvasSize.Y)
end
end))
eZ(fD:GetPropertyChangedSignal"CanvasPosition":Connect(function()
local fM=fD.CanvasPosition.Y
>=fD.AbsoluteCanvasSize.Y-fD.AbsoluteWindowSize.Y-20
fL=fM
end))

local function scrollToBottom()
fL=true
task.defer(function()
if fD and fD.Parent then
fD.CanvasPosition=Vector2.new(0,fD.AbsoluteCanvasSize.Y)
end
end)
end

local fM=26

local function addBubble(fN,fO)
fI=fI+1
local fP=tostring(fN.Text or""):gsub("^%s+",""):gsub("%s+$","")
if fP==""then return end

local fQ=Instance.new"Frame"
fQ.Name="ChatRow"
fQ.BackgroundTransparency=1
fQ.AutomaticSize=Enum.AutomaticSize.Y
fQ.Size=UDim2.new(1,0,0,0)
fQ.LayoutOrder=fI
fQ.ZIndex=e4+1
fQ.Parent=fD

local fR=Instance.new"UIScale"
fR.Scale=0.92
fR.Parent=fQ

local fS=Instance.new"UIListLayout"
fS.FillDirection=Enum.FillDirection.Horizontal
fS.HorizontalAlignment=fO and Enum.HorizontalAlignment.Right or Enum.HorizontalAlignment.Left
fS.VerticalAlignment=Enum.VerticalAlignment.Top
fS.Padding=UDim.new(0,8)
fS.Parent=fQ

local fT=not fN.UserId or fN.UserId==0

local fU=Instance.new"Frame"
fU.Name="Avatar"

fU.BackgroundColor3=fT and Color3.fromRGB(196,143,105)or eX.Accent
fU.BackgroundTransparency=1
fU.BorderSizePixel=0
fU.Size=UDim2.fromOffset(fM,fM)
fU.LayoutOrder=fO and 2 or 1
fU.ZIndex=e4+2
fU.Parent=fQ
eH(fU,fM/2)

if fT then
local fV=Instance.new"ImageLabel"
fV.BackgroundTransparency=1
fV.ImageTransparency=1
fV.Image=eJ"user-round"
fV.ImageColor3=Color3.fromRGB(90,61,40)
fV.Size=UDim2.fromOffset(15,15)
fV.AnchorPoint=Vector2.new(0.5,0.5)
fV.Position=UDim2.fromScale(0.5,0.5)
fV.ZIndex=e4+3
fV.Parent=fU
eG(fV,{ImageTransparency=0},0.16)
else
local fV=Instance.new"ImageLabel"
fV.BackgroundTransparency=1
fV.ImageTransparency=1
fV.ScaleType=Enum.ScaleType.Crop
fV.Size=UDim2.fromScale(1,1)
fV.ZIndex=e4+3
fV.Parent=fU
eH(fV,fM/2)
eG(fV,{ImageTransparency=0},0.16)
task.spawn(function()
local fW,fX=pcall(
eK.GetUserThumbnailAsync,
eK,
fN.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size100x100
)
if fW and fX and fV.Parent then
fV.Image=fX
end
end)
end

local fV,fW=10,8
local fX=240

local fY=64
local fZ=MeasureText(fP,13,10000)
local f_=math.min(fZ,fX-fV*2)+fV*2
f_=math.max(f_,fY)
if fD.AbsoluteSize.X>0 then
f_=math.min(f_,math.max(160,fD.AbsoluteSize.X-20))
end

local f0=Instance.new"Frame"
f0.Name="Bubble"
f0.BackgroundColor3=fO and eX.Accent or Color3.new(1,1,1)
f0.BackgroundTransparency=1
f0.BorderSizePixel=0
f0.ClipsDescendants=true
f0.AutomaticSize=Enum.AutomaticSize.Y
f0.Size=UDim2.fromOffset(f_,0)
f0.LayoutOrder=fO and 1 or 2
f0.ZIndex=e4+2
f0.Parent=fQ
eH(f0,12)
local f1=eI(f0,Color3.new(1,1,1),1,1)

local f2=Instance.new"UIPadding"
f2.PaddingTop=UDim.new(0,fW)
f2.PaddingBottom=UDim.new(0,fW)
f2.PaddingLeft=UDim.new(0,fV)
f2.PaddingRight=UDim.new(0,fV)
f2.Parent=f0

local f3=Instance.new"UIListLayout"
f3.SortOrder=Enum.SortOrder.LayoutOrder
f3.Parent=f0

local f4=Instance.new"TextLabel"
f4.BackgroundTransparency=1
f4.FontFace=ae.FontReg
f4.Text=fP
f4.TextColor3=eX.Text
f4.TextTransparency=1
f4.TextSize=13
f4.TextWrapped=true
f4.TextXAlignment=Enum.TextXAlignment.Left
f4.TextYAlignment=Enum.TextYAlignment.Top
f4.LineHeight=1.3
f4.AutomaticSize=Enum.AutomaticSize.Y
f4.Size=UDim2.new(1,0,0,16)
f4.LayoutOrder=1
f4.ZIndex=e4+3
f4.Parent=f0

if fN.CreatedAt then
local f5=Instance.new"TextLabel"
f5.BackgroundTransparency=1
f5.FontFace=ae.FontReg
f5.Text=os.date("%H:%M",math.floor(fN.CreatedAt/1000))
f5.TextColor3=fO and Color3.new(1,1,1)or eX.Dim
f5.TextTransparency=fO and 0.5 or 0.4
f5.TextSize=10
f5.TextXAlignment=Enum.TextXAlignment.Left
f5.AutomaticSize=Enum.AutomaticSize.Y
f5.Size=UDim2.new(1,0,0,12)
f5.LayoutOrder=2
f5.ZIndex=e4+3

f5.Visible=ff
f5.Parent=f0
table.insert(fK,f5)
end

if not fO and fN.Id and eY then
local f5=Instance.new"TextButton"
f5.Text=""
f5.AutoButtonColor=false
f5.BackgroundColor3=Color3.new(1,1,1)
f5.BackgroundTransparency=1
f5.BorderSizePixel=0
f5.Size=UDim2.fromOffset(20,20)
f5.LayoutOrder=3
f5.ZIndex=e4+2
f5.Parent=fQ
eH(f5,6)

local f6=Instance.new"ImageLabel"
f6.BackgroundTransparency=1
f6.ImageTransparency=1
f6.Image=eJ"flag"
f6.ImageColor3=eX.Dim
f6.Size=UDim2.fromOffset(11,11)
f6.AnchorPoint=Vector2.new(0.5,0.5)
f6.Position=UDim2.fromScale(0.5,0.5)
f6.ZIndex=e4+3
f6.Parent=f5

eZ(fQ.MouseEnter:Connect(function()
eG(f6,{ImageTransparency=0.3},0.12)
end))
eZ(fQ.MouseLeave:Connect(function()
eG(f6,{ImageTransparency=1},0.12)
end))
eZ(f5.MouseEnter:Connect(function()
eG(f5,{BackgroundTransparency=0.88},0.1)
eG(f6,{ImageColor3=eX.Danger,ImageTransparency=0},0.1)
end))
eZ(f5.MouseLeave:Connect(function()
eG(f5,{BackgroundTransparency=1},0.1)
eG(f6,{ImageColor3=eX.Dim},0.1)
end))
eZ(f5.MouseButton1Click:Connect(function()
eU:Confirm{
Title="Report this message?",
Text="Hides it for everyone once enough people report it.",
ConfirmText="Report",
CancelText="Cancel",
Danger=true,
Callback=function(f7)
if not f7 then return end
local f8,f9=eY:ReportChatMessage(fN.Id)
eU:Notify{
Title=f8 and"Reported"or"Could not report",
Text=f8 and"Thanks -- our filters will take it from here."or tostring(f9),
Type=f8 and"success"or"error",
Duration=3,
}
end,
}
end))
end

local f5=fO and 0.85 or 0.82
local f6=fO and 0.72 or 0.9
local f7=fO and 0.8 or 0.9
eG(fU,{BackgroundTransparency=f5},0.16)
eG(f0,{BackgroundTransparency=f6},0.16)
eG(f1,{Transparency=f7},0.16)
eG(f4,{TextTransparency=0},0.16)
eG(fR,{Scale=1},0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)

scrollToBottom()
table.insert(fJ,(fO and"You"or"Someone")..": "..fP)
end

eZ(fn.MouseButton1Click:Connect(function()
local fN=ey.hasFn"setclipboard"
if not fN or#fJ==0 then return end
pcall(fN,table.concat(fJ,"\n"))
eG(fo,{ImageColor3=Color3.fromRGB(120,220,140)},0.1)
task.delay(0.4,function()
if fo.Parent then
eG(fo,{ImageColor3=eX.Dim},0.15)
end
end)
end))

local fN={[0]=true}
local fO=0

local function trySend()
local fP=fA.Text:gsub("^%s+",""):gsub("%s+$","")
if fP==""or not eY then return end
fA.Text=""
local fQ=fe and 0 or eL.UserId
local fR=fe
task.spawn(function()
local fS,fT=eY:SendChatMessage(fQ,fP)
if not fS then
eU:Notify{Title="Chat",Text=tostring(fT),Type="error",Duration=3}
return
end
fN[fS.Id]=true
if fS.Id>fO then fO=fS.Id end
addBubble({UserId=fQ,Text=fP,CreatedAt=os.time()*1000},true)
relayToDiscord(discordNameFor(fQ,fR),fP,true)
end)
end

eZ(fB.MouseButton1Click:Connect(trySend))
eZ(fA.FocusLost:Connect(function(fP)
if fP then trySend()end
end))
eZ(fp.MouseButton1Click:Connect(function()
fe=not fe
fq.Image=eJ(fe and"eye-off"or"eye")
eU:Notify{
Title="Chat",
Text=fe
and"Anonymous mode on -- new messages won't reveal your avatar."
or"Anonymous mode off -- new messages show your avatar.",
Type="info",
Duration=3,
}
end))
eZ(fr.MouseButton1Click:Connect(function()

for fP,fQ in ipairs(fD:GetChildren())do
if fQ.Name=="ChatRow"then fQ:Destroy()end
end
table.clear(fJ)
table.clear(fK)
end))
eZ(ft.MouseButton1Click:Connect(function()
if eU._active==e_ then
if eU._tabs[1]and eU._tabs[1]~=e_ then
eU._activateTab(eU._tabs[1],true)
end
end
end))

local fP
local function closeSettingsPopup()
if fP then
fP:Destroy()
fP=nil
end
end

local function openSettingsPopup()
if fP then closeSettingsPopup();return end

local fQ=Instance.new"Frame"
fQ.Name="ChatSettingsPopup"
fQ.BackgroundColor3=eX.Surface
fQ.BackgroundTransparency=0.05
fQ.BorderSizePixel=0
fQ.AnchorPoint=Vector2.new(1,0)
fQ.Position=UDim2.new(1,0,0,e2+4)
fQ.Size=UDim2.new(0,190,0,0)
fQ.AutomaticSize=Enum.AutomaticSize.Y
fQ.ClipsDescendants=true
fQ.ZIndex=e4+10
fQ.Parent=e3
eH(fQ,10)
eI(fQ,Color3.new(1,1,1),1,0.88)

local fR=Instance.new"UIPadding"
fR.PaddingTop=UDim.new(0,10)
fR.PaddingBottom=UDim.new(0,10)
fR.PaddingLeft=UDim.new(0,12)
fR.PaddingRight=UDim.new(0,12)
fR.Parent=fQ

local fS=Instance.new"UIListLayout"
fS.Padding=UDim.new(0,8)
fS.SortOrder=Enum.SortOrder.LayoutOrder
fS.Parent=fQ

local function toggleRow(fT,fU,fV,fW)
local fX=Instance.new"Frame"
fX.BackgroundTransparency=1
fX.Size=UDim2.new(1,0,0,20)
fX.LayoutOrder=fT
fX.ZIndex=e4+11
fX.Parent=fQ

local fY=Instance.new"TextLabel"
fY.BackgroundTransparency=1
fY.FontFace=ae.FontReg
fY.Text=fU
fY.TextColor3=eX.Text
fY.TextSize=12
fY.TextXAlignment=Enum.TextXAlignment.Left
fY.Size=UDim2.new(1,-30,1,0)
fY.ZIndex=e4+12
fY.Parent=fX

local fZ=Instance.new"TextButton"
fZ.Text=""
fZ.AutoButtonColor=false
fZ.BackgroundColor3=Color3.new(1,1,1)
fZ.BackgroundTransparency=fV()and 0.7 or 0.92
fZ.BorderSizePixel=0
fZ.AnchorPoint=Vector2.new(1,0.5)
fZ.Position=UDim2.new(1,0,0.5,0)
fZ.Size=UDim2.fromOffset(20,20)
fZ.ZIndex=e4+12
fZ.Parent=fX
eH(fZ,6)

local f_=Instance.new"ImageLabel"
f_.BackgroundTransparency=1
f_.Image=eJ"check"
f_.ImageColor3=eX.Accent
f_.ImageTransparency=fV()and 0 or 1
f_.Size=UDim2.fromOffset(11,11)
f_.AnchorPoint=Vector2.new(0.5,0.5)
f_.Position=UDim2.fromScale(0.5,0.5)
f_.ZIndex=e4+13
f_.Parent=fZ

eZ(fZ.MouseButton1Click:Connect(function()
local f0=fW()
eG(fZ,{BackgroundTransparency=f0 and 0.7 or 0.92},0.12)
eG(f_,{ImageTransparency=f0 and 0 or 1},0.12)
end))
end

toggleRow(1,"Show timestamps",function()return ff end,function()
ff=not ff
for fT,fU in ipairs(fK)do
if fU.Parent then fU.Visible=ff end
end
return ff
end)
toggleRow(2,"Sound on new message",function()return fg end,function()
fg=not fg
return fg
end)
toggleRow(3,"Fast updates (1s)",function()return fh<=1 end,function()
fh=(fh<=1)and(eW.PollInterval or 2.5)or 1
return fh<=1
end)

fP=fQ
end

eZ(fs.MouseButton1Click:Connect(function()
if fP then closeSettingsPopup()else openSettingsPopup()end
end))

local fQ=Instance.new"Sound"
fQ.SoundId="rbxasset://sounds/electronicpingshort.wav"
fQ.Volume=0.5
fQ.Parent=e3

if eY then
task.spawn(function()
local fR=eY:PollChatMessages(0)
if fR then
local fS=eW.HistoryLimit or 3
local fT=math.max(1,#fR-fS+1)
for fU=fT,#fR do
local fV=fR[fU]
if not fN[fV.Id]then
fN[fV.Id]=true
addBubble(fV,fV.UserId==eL.UserId)
end
if fV.Id>fO then fO=fV.Id end
end
end
while e3 and e3.Parent do
task.wait(fh)
local fS=eY:PollChatMessages(fO)
if fS then
for fT,fU in ipairs(fS)do
if not fN[fU.Id]then
fN[fU.Id]=true
local fV=fU.UserId==eL.UserId
addBubble(fU,fV)

if fm and not fV then
local fW=(fU.UserId and fU.UserId~=0)
and tostring(fU.UserId)
or"Someone"
relayToDiscord(fW,tostring(fU.Text or""),false)
end

if fg and not fV and fQ.Parent then
fQ:Play()
end
end
if fU.Id>fO then fO=fU.Id end
end
end
end
end)
end

local fR
local function openPanel()
if eU._active==e_ then return end
if eU._active and not eU._active.Hidden then
fR=eU._active
end
eU._activateTab(e_,true)
end
local function closePanel()
if eU._active~=e_ then return end
if fR and not fR.Hidden then
eU._activateTab(fR,true)
elseif eU._tabs[1]and eU._tabs[1]~=e_ then
eU._activateTab(eU._tabs[1],true)
end
end

if eU._dockAdd then
eU._dockAdd("Chat",eW.Icon or"chat",
function()eU._activateTab(e_,true)end,e_)
end

return{
Instance=e3,
Tab=e_,
Open=openPanel,
Close=closePanel,
Toggle=function()
if eU._active==e_ then closePanel()else openPanel()end
end,
IsOpen=function()return eU._active==e_ end,
SetDiscordWebhook=function(fS,fT)fi=fT or""end,
GetDiscordWebhook=function()return fi end,
Destroy=function()e3:Destroy()end,
}
end end function a.av():typeof(__modImpl())local aa=a.cache.av if not aa then aa={c=__modImpl()}a.cache.av=aa end return aa.c end end do local function __modImpl()





local aa=a.a()

aa._kLogos=aa._kLogos or{}

local ab="Kronos"
local ac={
"####........########",
"####.......########.",
"####......########..",
"####.....########...",
"####....########....",
"####...########.....",
"####..########......",
"##############......",
"####..########......",
"####...########.....",
"####....########....",
"####.....########...",
"####......########..",
"####.......########.",
"####........########",
}

local function kBitmapFrame(ad)
local ae={}
for af=1,#ac do
local ey=ac[af]
local ez={}
for eA=1,#ey do
if ey:sub(eA,eA)=="#"then
local eG=((eA+af+ad)%#ab)+1
ez[#ez+1]=ab:sub(eG,eG)
else
ez[#ez+1]=" "
end
end
ae[#ae+1]=table.concat(ez)
end
return table.concat(ae,"\n")
end

local ad=false
local function kTick()
if ad then return end ad=true
task.spawn(function()
local ae=0
while true do
task.wait(0.1)
local af=aa._gui==nil or aa._gui.Enabled~=false
if af and not aa.ReducedMotion and not aa._perfLow and#aa._kLogos>0 then
ae=ae+1
for ey=#aa._kLogos,1,-1 do
local ez=aa._kLogos[ey]
if not ez.root or not ez.root.Parent then
table.remove(aa._kLogos,ey)
else
pcall(function()
ez.l1.Text=kBitmapFrame(math.floor(ae*0.6)+ez.seed)
ez.l2.Text=kBitmapFrame(math.floor(ae*0.85)+ez.seed)
ez.l3.Text=kBitmapFrame(ae+ez.seed)
if ez.grad then ez.grad.Rotation=45+math.sin(ae*0.08)*20 end
end)
end
end
end
end
end)
end


local function buildK(ae,af,ey,ez)
ae=math.max(16,tonumber(ae)or 32)
ey=ey or{}
local eA=Instance.new"Frame"eA.Name="_kLogo"
eA.AnchorPoint=Vector2.new(0.5,0.5)eA.Position=UDim2.new(0.5,0,0.5,0)
eA.Size=UDim2.fromOffset(ae,ae)eA.BackgroundTransparency=1
eA.BorderSizePixel=0 eA.Parent=af
local eG=math.max(1,math.round(ae*0.01))
local eH=math.max(0,math.floor(ae*0.005))
local eI={
{c=Color3.fromRGB(0,0,0),t=0.6,ox=eG,oy=eG},
{c=Color3.fromRGB(40,0,0),t=0.3,ox=eH,oy=eH},
{c=Color3.fromRGB(255,255,255),t=0,ox=0,oy=0},
}
local eJ={root=eA,seed=ez or math.random(0,6)}
for eK,eL in ipairs(eI)do
local eM=Instance.new"TextLabel"
eM.Name="_k"..eK
eM.AnchorPoint=Vector2.new(0.5,0.5)
eM.Position=UDim2.new(0.5,0,0.5,0)+UDim2.fromOffset(eL.ox,eL.oy)
eM.Size=UDim2.fromScale(1,1)
eM.BackgroundTransparency=1
eM.Font=Enum.Font.Code
eM.TextScaled=true
eM.TextXAlignment=Enum.TextXAlignment.Center
eM.TextYAlignment=Enum.TextYAlignment.Center
eM.TextColor3=eL.c
eM.TextTransparency=eL.t
eM.Text=kBitmapFrame(eJ.seed)
eM.ZIndex=eK
eM.Parent=eA
eJ["l"..eK]=eM
end
local eK=Instance.new"UIGradient"
eK.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(60,0,0)),
ColorSequenceKeypoint.new(0.2,Color3.fromRGB(255,30,30)),
ColorSequenceKeypoint.new(0.4,Color3.fromRGB(120,0,0)),
ColorSequenceKeypoint.new(0.6,Color3.fromRGB(255,60,60)),
ColorSequenceKeypoint.new(0.8,Color3.fromRGB(80,0,0)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(200,0,0)),
}
eK.Rotation=45
eK.Parent=eJ.l3
eJ.grad=eK
table.insert(aa._kLogos,eJ)
kTick()
return eJ
end

return{buildK=buildK,kTick=kTick}end function a.aw():typeof(__modImpl())local aa=a.cache.aw if not aa then aa={c=__modImpl()}a.cache.aw=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.b()
local ae=a.f()a.v()a.g()


local af=a.h()
local ey=a.A()
local ez=a.ar()
local eA=a.as()
local eG=a.at()
local eH=a.au()
local eI=a.av()
local eJ=a.d()
local eK=a.aw()

local eL=aa
local eM=ab.T
local eN=ab.tween
local eO=ac.spawnCb
local eU=ac.corner
local eW=ac.hairline
local eX=ac.pad
local eY=ac.lighting
local eZ=ac.topLight
local e_=ac.shadow
local e0=ac.makeDraggable
local e1=ae.makeIcon
local e2=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(e3)
local e4=e3:FindFirstChild"Notification"
if e4 then return e4 end
e4=Instance.new"Frame"
e4.Name="Notification"
e4.AnchorPoint=Vector2.new(1,1)
e4.Position=UDim2.new(1,-18,1,-18)
e4.Size=UDim2.new(0,300,1,-36)
e4.BackgroundTransparency=1
e4.Parent=e3
local e5=Instance.new"UIListLayout"
e5.VerticalAlignment=Enum.VerticalAlignment.Bottom
e5.Padding=UDim.new(0,10)
e5.SortOrder=Enum.SortOrder.LayoutOrder
e5.Parent=e4
return e4
end

local function bumpRecent(e3,e4,e5)
if not e4 or e4==""then return end
for e6,e7 in ipairs(aa._recent)do
if e7.label==e4 and e7.tab==e3 then table.remove(aa._recent,e6)break end
end
table.insert(aa._recent,1,{tab=e3,label=e4,go=e5})
while#aa._recent>8 do table.remove(aa._recent)end
for e6,e7 in ipairs(aa._recentRefresh)do pcall(e7)end
end
aa._bumpRecent=function(e3,e4,e5,e6)
return bumpRecent(e4,e5,e6)
end







local e3={}
local function flyTo(e4,e5,e6,e7)
local e8=e3[e4]
if e8 then pcall(function()e8:Cancel()end)end
e3[e4]=nil
local e9=eN(e4,e6 or eM.Med,e5)
if not e9 then
pcall(function()
for fa,fb in pairs(e5)do e4[fa]=fb end
end)
if e7 then e7()end
return nil
end
e3[e4]=e9
if e7 then
e9.Completed:Connect(function(fa)
if e3[e4]==e9 then
e3[e4]=nil
if fa==Enum.PlaybackState.Completed then e7()end
end
end)
end
return e9
end

return function(e4,e5)
e5=e5 or{}
local e6=e5.Title or"Kronos"
local e7=e5.SubTitle or e5.Subtitle or"scripthub"
local e8=e5.ToggleKey or Enum.KeyCode.RightControl
local e9=e5.Acrylic
if e9==nil then e9=true end
if e5.Theme then e4:SetTheme(e5.Theme)end
local fa=e4.Theme
e4:SetAcrylic(e9,e5.Blur or 16)

local fb=ad.GetRoot()
if e4._gui then pcall(function()e4._gui:Destroy()end)end

local fc=Instance.new"ScreenGui"
fc.Name=ad.GetStealthName()fc.ResetOnSpawn=false fc.IgnoreGuiInset=true fc.DisplayOrder=999
fc.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fc)
fc.Parent=fb
e4._gui=fc



local fd=Instance.new"ScreenGui"
fd.Name=ad.GetStealthName()fd.ResetOnSpawn=false fd.IgnoreGuiInset=true fd.DisplayOrder=1000
fd.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fd)
fd.Parent=fb

local fe=Instance.new"Frame"
fe.Name="Dim"fe.Size=UDim2.fromScale(1,1)
fe.BackgroundColor3=Color3.fromRGB(3,4,7)fe.BackgroundTransparency=1
fe.BorderSizePixel=0 fe.Parent=fc


local ff=e5.Background==true
fe.Visible=ff
local function dimTo(fg,fh)
if not ff then
if fg>=1 then fe.Visible=false end
return
end
fe.Visible=true
flyTo(fe,{BackgroundTransparency=fg},fh)
end
dimTo(0.5,eM.Slow)


if e5.Ambient~=false then
local fg=Instance.new"Frame"fg.Name="_ambient"
fg.AnchorPoint=Vector2.new(0.5,0.5)fg.Position=UDim2.new(0.5,0,0.5,0)
fg.Size=UDim2.new(1.4,0,1.4,0)fg.BackgroundColor3=Color3.fromRGB(255,255,255)
fg.BackgroundTransparency=0 fg.BorderSizePixel=0 fg.Parent=fe
local fh=Instance.new"UIGradient"fh.Rotation=25
fh.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,fa.Accent),
ColorSequenceKeypoint.new(1,fa.Accent2 or fa.Accent)}
fh.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
fh.Parent=fg
table.insert(eL._gradients,fh)
task.spawn(function()
while fc.Parent do
eN(fh,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.05)
if not fc.Parent then break end
eN(fh,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.05)
end
end)
end

local fg=Instance.new"CanvasGroup"
fg.Name="Main"fg.AnchorPoint=Vector2.new(0.5,0.5)
fg.Position=UDim2.new(0.5,0,0.5,0)fg.Size=UDim2.fromOffset(620,440)
fg.BackgroundColor3=fa.Surface
fg.BackgroundTransparency=(e9 and not e4._transparent)and 0.08 or 0
fg.GroupTransparency=1 fg.BorderSizePixel=0 fg.Parent=fc
eU(fg,e5.Radius or 12)eW(fg,true)eZ(fg)e_(fg,0.5,48)



local fh,fi=1,1
local fj=Instance.new"UIScale"fj.Scale=0.94 fj.Parent=fg
local function baseScale()return fh*fi end





local function brandInto(fk,fl)
if e5.Logo and e5.Logo~=""then
local fm=Instance.new"ImageLabel"fm.BackgroundTransparency=1
fm.AnchorPoint=Vector2.new(0.5,0.5)fm.Position=UDim2.new(0.5,0,0.5,0)
fm.Size=UDim2.new(1,-8,1,-8)fm.Image=e5.Logo
fm.ScaleType=Enum.ScaleType.Fit fm.Parent=fk
eU(fm,8)
if fl then fl.Visible=false end
return fm
end
return nil
end


local function kronosFace(fk,fl,fm,fn)
local fo=fm or 26
local fp=Instance.new"Frame"fp.Name="_disc"
fp.AnchorPoint=Vector2.new(0.5,0.5)fp.Position=UDim2.new(0.5,0,0.5,0)
fp.Size=UDim2.fromOffset(fo,fo)fp.BackgroundColor3=Color3.fromRGB(0,0,0)
fp.BorderSizePixel=0 fp.Parent=fk
local fq=Instance.new"UICorner"fq.CornerRadius=UDim.new(0.5,0)fq.Parent=fp
local fr=Instance.new"UIStroke"fr.Thickness=2
fr.Color=Color3.fromRGB(255,255,255)fr.Transparency=0.12 fr.Parent=fp
pcall(function()
local fs=Instance.new"UIShadow"fs.Color=Color3.fromRGB(255,255,255)
fs.Transparency=0.82 fs.BlurSize=10 fs.Parent=fp
end)
if fl then
fl.AnchorPoint=Vector2.new(0.5,0.5)fl.Position=UDim2.new(0.5,0,0.5,0)
fl.Size=UDim2.fromOffset(fo,fo)fl.TextSize=fn or 16
fl.ZIndex=2
end
return fp
end


local fk=e5.Intro
if fk==nil then fk=true end
local fl={}
if type(fk)=="table"then fl=fk fk=true end
local function playEntrance()
eL:_sfx"Open"
eN(fg,eM.Slow,{GroupTransparency=0})
eN(fj,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})
end
if fk then
local fm=Instance.new"TextButton"fm.Text=""fm.AutoButtonColor=false
fm.Size=UDim2.fromScale(1,1)fm.BackgroundColor3=Color3.fromRGB(4,5,8)
fm.BackgroundTransparency=0 fm.ZIndex=300 fm.Parent=fc
local fn=Instance.new"Frame"fn.AnchorPoint=Vector2.new(0.5,0.5)
fn.Position=UDim2.new(0.5,0,0.5,-30)fn.Size=UDim2.fromOffset(64,64)
fn.BackgroundColor3=fa.Surface2 fn.BorderSizePixel=0
eU(fn,18)fn.Parent=fm
eW(fn,true)
eL:_tag(fn,"BackgroundColor3","Surface2")
local fo=Instance.new"TextLabel"fo.Size=UDim2.fromScale(1,1)
fo.BackgroundTransparency=1 fo.Font=Enum.Font.GothamBlack
fo.TextSize=30 eL:_tag(fo,"TextColor3","Text")fo.Text=fl.Letter or"K"fo.Parent=fn
local fp=Instance.new"Frame"fp.Size=UDim2.fromOffset(12,12)
fp.Position=UDim2.new(1,-8,0,-5)fp.BorderSizePixel=0
eL:_tag(fp,"BackgroundColor3","Accent")
eU(fp,99)fp.Parent=fn
brandInto(fn,fo)
if not e5.Logo or e5.Logo==""then kronosFace(fn,fo,48,28)end

fn.Visible=false
local fq=eK.buildK(210,fm,fa,0)
fq.root.Position=UDim2.new(0.5,0,0.5,-70)
task.spawn(function()
local fr=0
while fq.root.Parent do
task.wait(0.05)
if not eL.ReducedMotion then
fr=fr+0.08
local fs=1+math.sin(fr*0.5)*0.01
pcall(function()
fq.root.Size=UDim2.fromOffset(210*fs,210*fs)
end)
end
end
end)
local fr=Instance.new"TextLabel"fr.BackgroundTransparency=1
fr.AnchorPoint=Vector2.new(0.5,0)fr.Position=UDim2.new(0.5,0,0.5,48)
fr.Size=UDim2.new(0,300,0,22)fr.Font=Enum.Font.GothamBold
fr.TextSize=15 eL:_tag(fr,"TextColor3","Text")
fr.Text=fl.Word or"K R O N O S"fr.Parent=fm
local fs
if fl.Sub then
fs=Instance.new"TextLabel"fs.BackgroundTransparency=1
fs.AnchorPoint=Vector2.new(0.5,0)fs.Position=UDim2.new(0.5,0,0.5,66)
fs.Size=UDim2.new(0,300,0,14)fs.Font=Enum.Font.Gotham
fs.TextSize=11 eL:_tag(fs,"TextColor3","Dim")
fs.Text=fl.Sub fs.Parent=fm
end
local ft=Instance.new"Frame"ft.AnchorPoint=Vector2.new(0.5,0)
ft.Position=UDim2.new(0.5,0,0.5,fs and 84 or 76)ft.Size=UDim2.new(0,180,0,2)
ft.BackgroundColor3=fa.Surface2 ft.BorderSizePixel=0
eU(ft,99)ft.Parent=fm
eL:_tag(ft,"BackgroundColor3","Surface2")
local fu=Instance.new"Frame"fu.Size=UDim2.new(0,0,1,0)
fu.BorderSizePixel=0 eU(fu,99)fu.Parent=ft
eL:agrad(fu,0)
local fv=Instance.new"UIScale"fv.Scale=0.8 fv.Parent=fn
eN(fv,eM.Spring,{Scale=1})
eN(fu,TweenInfo.new(fl.Time or 2.8,Enum.EasingStyle.Linear),
{Size=UDim2.new(1,0,1,0)})
local fw=false
fm.MouseButton1Click:Connect(function()
if fw then return end fw=true
pcall(function()fm:Destroy()end)playEntrance()
end)
task.delay((fl.Time or 2.8)+0.25,function()
if fw then return end fw=true
eN(fm,eM.Med,{BackgroundTransparency=1})
for fx,fy in ipairs(fm:GetDescendants())do
pcall(function()
if fy:IsA"TextLabel"then eN(fy,eM.Fast,{TextTransparency=1})end
end)
end
task.delay(0.25,function()pcall(function()fm:Destroy()end)end)
playEntrance()
end)
else
playEntrance()
end


local fm=Instance.new"Frame"
fm.Size=UDim2.new(1,-24,0,2)fm.Position=UDim2.new(0,12,0,0)
fm.BackgroundTransparency=1 fm.Parent=fg
local fn=Instance.new"Frame"fn.Size=UDim2.new(0,0,1,0)
eU(fn,99)fn.Parent=fm
eL:agrad(fn,0)
eN(fn,TweenInfo.new(0.9,Enum.EasingStyle.Linear),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()fm:Destroy()end)end)


local fo=Instance.new"Frame"
fo.Name="Header"fo.Size=UDim2.new(1,0,0,62)
fo.BackgroundTransparency=1 fo.Parent=fg
eX(fo,14,6,14,14)


local fp=Instance.new"Frame"fp.Name="Mark"
fp.Size=UDim2.fromOffset(36,36)fp.BackgroundColor3=fa.Surface2
fp.BorderSizePixel=0 eU(fp,10)fp.Parent=fo
eW(fp,true)
local fq=Instance.new"TextLabel"fq.Size=UDim2.fromScale(1,1)
fq.BackgroundTransparency=1 fq.Font=Enum.Font.GothamBlack
fq.TextSize=18 e4:_tag(fq,"TextColor3","Text")fq.Text="K"fq.Parent=fp
local fr=Instance.new"Frame"fr.Size=UDim2.fromOffset(8,8)
fr.Position=UDim2.new(1,-5,0,-3)fr.BorderSizePixel=0
e4:_tag(fr,"BackgroundColor3","Accent")
eU(fr,99)fr.Parent=fp
brandInto(fp,fq)
if not e5.Logo or e5.Logo==""then kronosFace(fp,fq,26,15)end

local fs=Instance.new"TextLabel"fs.BackgroundTransparency=1
fs.Position=UDim2.new(0,48,0,0)fs.Size=UDim2.new(0,230,0,20)
fs.Font=Enum.Font.GothamBold fs.TextSize=15 fs.TextXAlignment=0
e4:_tag(fs,"TextColor3","Text")fs.Text=e6 fs.Parent=fo
local ft=Instance.new"TextLabel"ft.BackgroundTransparency=1
ft.Position=UDim2.new(0,48,0,21)ft.Size=UDim2.new(0,230,0,15)
ft.Font=Enum.Font.Gotham ft.TextSize=11 fs.TextXAlignment=0
ft.TextXAlignment=0 e4:_tag(ft,"TextColor3","Dim")
ft.Text=string.upper(e7).."  |  V"..e4.Version ft.Parent=fo


local fu=Instance.new"Frame"
fu.AnchorPoint=Vector2.new(1,0)fu.Position=UDim2.new(1,-64,0,4)
fu.Size=UDim2.new(0,170,0,32)fu.BackgroundColor3=fa.Bg
fu.BorderSizePixel=0 eU(fu,8)fu.Parent=fo
eW(fu,true)
local fv=e1("search",14,fa.Dim)
fv.Position=UDim2.new(0,9,0.5,-7)fv.Parent=fu
local fw=Instance.new"TextBox"fw.PlaceholderText="Search"
fw.PlaceholderColor3=fa.Dim fw.Text=""fw.Font=Enum.Font.GothamBold
fw.TextSize=12 e4:_tag(fw,"TextColor3","Text")
fw.Position=UDim2.new(0,28,0,0)fw.Size=UDim2.new(1,-80,1,0)
fw.BackgroundTransparency=1 fw.ClearTextOnFocus=false fw.Parent=fu
local fx=Instance.new"TextLabel"fx.BackgroundTransparency=1
fx.AnchorPoint=Vector2.new(1,0.5)fx.Position=UDim2.new(1,-8,0.5,0)
fx.Size=UDim2.new(0,44,0,18)fx.Font=Enum.Font.Code fx.TextSize=11
e4:_tag(fx,"TextColor3","Text")fx.Text="Ctrl K"fx.Parent=fu
e4:_tag(fu,"BackgroundColor3","Bg")


local fy=Instance.new"TextButton"fy.Text=""
fy.AnchorPoint=Vector2.new(1,0)fy.Position=UDim2.new(1,-256,0,4)
fy.Size=UDim2.fromOffset(32,32)fy.BackgroundColor3=fa.Bg
fy.BorderSizePixel=0 eU(fy,8)fy.Parent=fo
eW(fy,true)
e4:_tag(fy,"BackgroundColor3","Bg")
local fz=e1("keyboard",15,fa.Dim)
fz.AnchorPoint=Vector2.new(0.5,0.5)fz.Position=UDim2.new(0.5,0,0.5,0)
fz.Parent=fy
fy.MouseButton1Click:Connect(function()end)

local fA=Instance.new"TextButton"fA.Text=""
fA.AnchorPoint=Vector2.new(1,0)fA.Position=UDim2.new(1,-296,0,4)
fA.Size=UDim2.fromOffset(32,32)fA.BackgroundColor3=fa.Bg
fA.BorderSizePixel=0 eU(fA,8)fA.Parent=fo
eW(fA,true)
e4:_tag(fA,"BackgroundColor3","Bg")
local fB=e1("menu",15,fa.Dim)
fB.AnchorPoint=Vector2.new(0.5,0.5)fB.Position=UDim2.new(0.5,0,0.5,0)
fB.Parent=fA
fA.MouseButton1Click:Connect(function()end)


local fC=Instance.new"Frame"fC.BackgroundTransparency=1
fC.AnchorPoint=Vector2.new(1,0)fC.Position=UDim2.new(1,0,0,4)
fC.Size=UDim2.new(0,56,0,32)fC.Parent=fo
local fD=Instance.new"UIListLayout"fD.FillDirection=Enum.FillDirection.Horizontal
fD.VerticalAlignment=Enum.VerticalAlignment.Center
fD.HorizontalAlignment=Enum.HorizontalAlignment.Center
fD.Padding=UDim.new(0,7)fD.Parent=fC
local function dot(fE,fF)
local fG=Instance.new"TextButton"fG.Text=""
fG.Size=UDim2.fromOffset(12,12)fG.BackgroundColor3=fE
fG.BorderSizePixel=0 eU(fG,99)fG.AutoButtonColor=false fG.Parent=fC
fG.MouseEnter:Connect(function()eN(fG,eM.Hover,{BackgroundTransparency=0.25})end)
fG.MouseLeave:Connect(function()eN(fG,eM.Hover,{BackgroundTransparency=0})end)
return fG
end
local fE=dot(Color3.fromRGB(39,201,63))
local fF=dot(Color3.fromRGB(255,189,46))
local fG=dot(Color3.fromRGB(255,95,86))
fG.MouseButton1Click:Connect(function()end)
fF.MouseButton1Click:Connect(function()end)
fE.MouseButton1Click:Connect(function()end)


local fH=Instance.new"TextButton"fH.Text=""
fH.AnchorPoint=Vector2.new(1,0)fH.Position=UDim2.new(1,-336,0,4)
fH.Size=UDim2.fromOffset(32,32)fH.BackgroundColor3=fa.Bg
fH.BorderSizePixel=0 eU(fH,8)fH.Parent=fo
eW(fH,true)
e4:_tag(fH,"BackgroundColor3","Bg")
local fI=e1("bellring",14,fa.Dim)
fI.AnchorPoint=Vector2.new(0.5,0.5)fI.Position=UDim2.new(0.5,0,0.5,0)
fI.Parent=fH
local fJ=Instance.new"Frame"fJ.Size=UDim2.fromOffset(8,8)
fJ.Position=UDim2.new(1,-7,0,3)fJ.BorderSizePixel=0
fJ.BackgroundColor3=Color3.fromRGB(248,113,113)
eU(fJ,99)fJ.Parent=fH fJ.Visible=false
fH.MouseButton1Click:Connect(function()end)

e0(fo,fg)


local fK=Instance.new"Frame"fK.Name="Body"
fK.Position=UDim2.new(0,0,0,62)fK.Size=UDim2.new(1,0,1,-62)
fK.BackgroundTransparency=1 fK.Parent=fg
local fL=Instance.new"UIPadding"fL.PaddingLeft=UDim.new(0,12)
fL.PaddingRight=UDim.new(0,12)fL.PaddingBottom=UDim.new(0,12)fL.Parent=fK

local fM=Instance.new"Frame"fM.Name="Sidebar"
fM.Size=UDim2.new(0,164,1,0)fM.BackgroundColor3=fa.Bg
fM.BackgroundTransparency=(e9 and not e4._transparent)and 0.15 or 0
fM.BorderSizePixel=0 eU(fM,10)fM.Parent=fK
eW(fM,true)
e4:_tag(fM,"BackgroundColor3","Bg")
eY(fM,10)
eX(fM,8,8,8,8)

local fN=Instance.new"Frame"fN.Name="Nav"
fN.Size=UDim2.new(1,0,1,0)fN.BackgroundTransparency=1 fN.Parent=fM
local fO=Instance.new"UIListLayout"fO.Padding=UDim.new(0,4)
fO.SortOrder=Enum.SortOrder.LayoutOrder fO.Parent=fN




local fP=Instance.new"Frame"fP.Name="_pill"
fP.Size=UDim2.new(1,0,0,38)fP.Position=UDim2.new(0,0,0,-2)
fP.BackgroundColor3=fa.Surface2 fP.BorderSizePixel=0
fP.ZIndex=0
eU(fP,8)fP.Parent=fM
eW(fP,true)
e4:_tag(fP,"BackgroundColor3","Surface2")

local fQ=Instance.new"Frame"fQ.Name="Pages"
fQ.Position=UDim2.new(0,176,0,0)fQ.Size=UDim2.new(1,-176,1,0)
fQ.BackgroundTransparency=1 fQ.ClipsDescendants=true fQ.Parent=fK

local fR={
_gui=fc,_main=fg,_side=fM,_nav=fN,_pages=fQ,_pill=fP,
_tabs={},_active=nil,_toggleKey=e8,_visible=true,_keybinds={},
_conns={},_acrylicPref=e9,_popouts={},
_tabChangeListeners={},
}

function fR.Track(fS,fT)table.insert(fS._conns,fT)return fT end
local fS
local fT
local fU,fV
fR._cfgTitle=e6
fR._body=fK

fR._folder="Kronos/"..tostring(e6)
pcall(function()
if makefolder and isfolder and not isfolder"Kronos"then makefolder"Kronos"end
if makefolder and isfolder and not isfolder(fR._folder)then makefolder(fR._folder)end
end)




fR._dock=nil
fR._dockBtns={}
local fW=false
local function dockRefresh(fX)
for fY,fZ in ipairs(fR._dockBtns)do
if fZ.tab then pcall(function()fZ.api.SetActive(fX==fZ.tab)end)end
end
end
local function ensureDock()
if fR._dock and fR._dock.Parent then return fR._dock end
local fX=Instance.new"Frame"
fX.Name=ad.GetStealthName()
fX.AnchorPoint=Vector2.new(0,1)
fX.Position=UDim2.new(0,8,1,-8)
fX.Size=UDim2.new(1,-16,0,32)
fX.BackgroundTransparency=1 fX.BorderSizePixel=0
fX.ClipsDescendants=true fX.Parent=fM
local fY=Instance.new"UIListLayout"
fY.FillDirection=Enum.FillDirection.Horizontal
fY.VerticalAlignment=Enum.VerticalAlignment.Center
fY.Padding=UDim.new(0,6)fY.Parent=fX
local fZ=Instance.new"UIPadding"
fZ.PaddingBottom=UDim.new(0,40)fZ.Parent=fN
fR._dock=fX
fR._dockList=fY

fR._dockOpen=true
fR._dockMemory=true
local f_=Instance.new"TextButton"f_.Text=""
f_.Size=UDim2.fromOffset(28,28)f_.BackgroundColor3=fa.Surface2
f_.BackgroundTransparency=0.5 f_.LayoutOrder=0
f_.BorderSizePixel=0 eU(f_,8)f_.AutoButtonColor=false f_.Parent=fX
eW(f_,true)
eL:_tag(f_,"BackgroundColor3","Surface2")
local f0=ae.makeIcon("chevron-up",14,fa.Dim)
f0.AnchorPoint=Vector2.new(0.5,0.5)f0.Position=UDim2.new(0.5,0,0.5,0)
f0.Parent=f_
fR._dockArrow=f_
fR._dockArrowIcon=f0
f_.MouseButton1Click:Connect(function()
eL:_sfx"Click"
fR._dockSetOpen(not fR._dockOpen,true)
fR._dockMemory=fR._dockOpen
end)
return fX
end

local function layoutDock(fX)
local fY=fR._dock
if not fY or not fY.Parent then return end
local fZ=fR._sbMode==1
local f_=fR._dockList
if f_ then
f_.FillDirection=fZ and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
end
local f0=0
for f1,f2 in ipairs(fR._dockBtns)do
if f2.btn and f2.btn.Parent and f2.btn.Visible then f0+=1 end
end
local f1=fR._dockOpen and(f0+1)or 1
local f2
if fZ then
f2=UDim2.new(0,44,0,f1*28+(f1-1)*6)
else
f2=UDim2.new(0,f1*28+(f1-1)*6,0,32)
end
if fX then eN(fY,eM.Med,{Size=f2})
else pcall(function()fY.Size=f2 end)end
end
function fR._dockSetOpen(fX,fY)
fR._dockOpen=fX and true or false
local fZ=fR._dockArrowIcon
if fZ and fZ:IsA"ImageLabel"then
pcall(function()
fZ.Image=ae.resolveIcon(fX and"chevron-up"or"chevron-down")
end)
end
local f_=0
for f0,f1 in ipairs(fR._dockBtns)do
if f1.btn and f1.btn.Parent then
f_+=1
local f2=fR._dockOpen
if f2 then
f1.btn.Visible=true
pcall(function()
f1.btn.BackgroundTransparency=0.5
if f1.ic then f1.ic.ImageTransparency=0 end
end)
if fY then local
f3, f4=f1.btn, f1.ic
task.delay(f_*0.03,function()
if f3.Parent then eN(f3,eM.Fast,{BackgroundTransparency=0.5})end
end)
end
else
local f3=f1.btn
if fY then
eN(f3,eM.Fast,{BackgroundTransparency=1})
task.delay(0.16,function()
if f3.Parent then f3.Visible=false end
end)
else
f3.Visible=false
end
end
end
end
layoutDock(fY)
end
local function dockAdd(fX,fY,fZ,f_)
for f0,f1 in ipairs(fR._dockBtns)do
if f1.name==fX then
f1.cb=fZ or f1.cb
f1.tab=f_ or f1.tab
return f1.api
end
end
local f0=ensureDock()
local f1=Instance.new"TextButton"f1.Text=""
f1.Size=UDim2.fromOffset(28,28)f1.BackgroundColor3=fa.Surface2
f1.BackgroundTransparency=0.5
f1.LayoutOrder=#fR._dockBtns+1
f1.BorderSizePixel=0 eU(f1,8)f1.AutoButtonColor=false f1.Parent=f0
eW(f1,true)
eL:_tag(f1,"BackgroundColor3","Surface2")
local f2=ae.makeIcon(fY or"box",15,fa.Dim)
f2.AnchorPoint=Vector2.new(0.5,0.5)f2.Position=UDim2.new(0.5,0,0.5,0)
f2.Parent=f1
local f3=false
local f4={}


local function refreshBtn(f5)
local f6=0.5
if f3 then f6=0.15
elseif f5 then f6=0.3 end
flyTo(f1,{BackgroundTransparency=f6},eM.Hover)
if f2:IsA"ImageLabel"then
flyTo(f2,{ImageColor3=f3 and fa.Text or fa.Dim},eM.Hover)
end
end
function f4.SetActive(f5)
f3=f5 and true or false
refreshBtn(false)
end
f1.MouseEnter:Connect(function()
if f3 then return end
refreshBtn(true)
end)
f1.MouseLeave:Connect(function()
if f3 then return end
refreshBtn(false)
end)
f1.MouseButton1Click:Connect(function()
eL:_sfx"Click"eO(fZ)
end)
table.insert(fR._dockBtns,{name=fX,tab=f_,cb=fZ,api=f4,btn=f1,ic=f2})
layoutDock(false)
if f_ and not fW then
fW=true
table.insert(fR._tabChangeListeners,function(f5)
dockRefresh(f5)
end)
end
return f4
end
fR._dockAdd=dockAdd
function fR.AddDockButton(fX,fY)
fY=fY or{}
return dockAdd(fY.Name or"Dock",fY.Icon or"box",fY.Callback,fY.Tab)
end

function fR.AddTab(fX,fY)
local fZ=type(fY)=="table"and fY or{Name=fY}
return fX:Tab{Title=fZ.Name or fZ.Title or"Tab",Icon=fZ.Icon,Hidden=fZ.Hidden}
end
function fR.AddTabLine(fX)
local fY=Instance.new"Frame"
fY.Name="TabLine"
fY.BackgroundTransparency=1
fY.Size=UDim2.new(1,0,0,9)
fY.ZIndex=2
fY.Parent=fX._nav
local fZ=Instance.new"Frame"
fZ.AnchorPoint=Vector2.new(0,0.5)
fZ.Position=UDim2.new(0,4,0.5,0)
fZ.Size=UDim2.new(1,-8,0,1)
fZ.BackgroundColor3=Color3.new(1,1,1)
fZ.BackgroundTransparency=0.92
fZ.BorderSizePixel=0
fZ.ZIndex=2
fZ.Parent=fY
return fY
end
function fR.AddPanelTab(fX,fY)
fY=fY or{}
local fZ=fX
local f_=fX:AddTab{
Name=fY.Name or fY.Title,
Icon=fY.Icon,
Hidden=fY.Hidden~=false,
}
if fY.OnToggle then
table.insert(fX._tabChangeListeners,function(f0)
task.spawn(fY.OnToggle,f0==f_)
end)
end
local f0
local function openPanel()
if fZ._active==f_ then return end
if fZ._active and not fZ._active.Hidden then
f0=fZ._active
end
fZ._activateTab(f_,true)
end
local function closePanel()
if fZ._active~=f_ then return end
if f0 and not f0.Hidden then
fZ._activateTab(f0,true)
elseif fZ._tabs[1]and fZ._tabs[1]~=f_ then
fZ._activateTab(fZ._tabs[1],true)
end
end
local f1={
Instance=f_.Page,
Tab=f_,
Open=openPanel,
Close=closePanel,
Toggle=function()
if fZ._active==f_ then closePanel()else openPanel()end
end,
IsOpen=function()return fZ._active==f_ end,
}
for f2,f3 in pairs{
AddToggle="AddToggle",AddSlider="AddSlider",
AddDropdown="AddDropdown",AddTextbox="AddTextbox",
AddButton="AddButton",AddKeybind="AddKeybind",
AddColorPicker="AddColorpicker",AddParagraph="AddParagraph",
AddSection="AddSection",AddSpacing="AddEmpty",AddHeader="AddSection",
}do
if f_[f3]then
f1[f2]=function(f4,...)return f_[f3](f_,...)end
end
end
return f1
end

function fR._activateTab(fX,fY)
if fX and fX._activate then pcall(fX._activate,fY~=false)end
end

function fR._flash(fX,fY)
if not fY or not fY.Parent then return end
local fZ=Instance.new"Frame"fZ.Name="_flash"
fZ.Size=UDim2.fromScale(1,1)fZ.BackgroundColor3=fa.Accent
fZ.BackgroundTransparency=0.75 fZ.BorderSizePixel=0
eU(fZ,10)fZ.Parent=fY
eN(fZ,TweenInfo.new(0.18,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()fZ:Destroy()end)end)
end

fR:Track(e2.InputBegan:Connect(function(fX,fY)
if fY then return end
if fX.KeyCode==fR._toggleKey then fR:Toggle()end
if fX.KeyCode==Enum.KeyCode.K and e2:IsKeyDown(Enum.KeyCode.LeftControl)then
fR:TogglePalette()
end
if fX.KeyCode==Enum.KeyCode.P and e2:IsKeyDown(Enum.KeyCode.LeftControl)then
fR:TogglePalette()
end
if fX.KeyCode==Enum.KeyCode.Tab and e2:IsKeyDown(Enum.KeyCode.LeftControl)then
local fZ=table.find(fR._tabs,fR._active)or 0
local f_=fR._tabs[(fZ%#fR._tabs)+1]
if f_ then eL:_sfx"Swap"fR._activateTab(f_,true)end
end
end))

fw:GetPropertyChangedSignal"Text":Connect(function()
local fX=string.lower(fw.Text)
for fY,fZ in ipairs(fR._tabs)do
local f_=fX==""or string.find(string.lower(fZ.Title),fX,1,true)~=nil
for f0,f1 in ipairs(fZ.Elements)do
local f2
if fX==""then
f2=true
elseif f_ then
f2=true
else




local f3=string.lower(tostring(f1.Title or"").." "..tostring(f1.Flag or""))
local f4=f1._handle
local f5
if type(f4)=="table"then
f5=f4.Get
elseif f4~=nil then
local f6,f7=pcall(function()return f4.Get end)
if f6 then f5=f7 end
end
if type(f5)=="function"then
local f6,f7=pcall(f5,f4)
if f6 then
if type(f7)=="string"or type(f7)=="number"then
f3=f3 .." "..string.lower(tostring(f7))
elseif type(f7)=="table"then
for f8,f9 in ipairs(f7)do f3=f3 .." "..string.lower(tostring(f9))end
end
end
end
f2=string.find(f3,fX,1,true)~=nil
end
f1._searchVisible=(fX=="")and nil or f2
if f1.Frame then f1.Frame.Visible=f2 end
end
fZ.Btn.Visible=(f_ or fX=="")and not fZ._hidden
if fX~=""and not fZ._hidden then

for f0,f1 in ipairs(fZ.Elements)do
if f1.Frame and f1.Frame.Visible then fZ.Btn.Visible=true break end
end
else

for f0,f1 in ipairs(fZ.Elements)do
if f1._refreshSection then pcall(f1._refreshSection)end
end
end
end
end)


fw.Focused:Connect(function()eN(fu,eM.Hover,{Size=UDim2.new(0,190,0,32)})end)
fw.FocusLost:Connect(function()eN(fu,eM.Hover,{Size=UDim2.new(0,170,0,32)})end)

function fR.SetVisible(fX,fY)
fX._visible=fY

local function pillTarget()
local fZ,f_=fc.AbsoluteSize.X,fc.AbsoluteSize.Y
if fZ<1 then fZ,f_=1200,800 end
local f0,f1=fS.AbsolutePosition,fS.AbsoluteSize
return UDim2.new(0,f0.X+f1.X/2-fZ/2,0,f0.Y+f1.Y/2-f_/2)
end
if fY then
fc.Enabled=true
fX._mini=false
if fU then fU.Visible=false end
if fS then fS.Visible=false end
fg.Position=pillTarget()
fj.Scale=baseScale()*0.55
fg.GroupTransparency=1
fe.BackgroundTransparency=1
if fX._acrylicPref then eL:SetAcrylic(true,e5.Blur or 16)end
eL:_sfx"Open"

flyTo(fg,{Position=fX._lastPos or UDim2.new(0.5,0,0.5,0),GroupTransparency=0},
TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
eN(fj,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})

dimTo(0.5,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
else
fX._mini=false
fX._lastPos=fg.Position
if fU then fU.Visible=false end
eL:SetAcrylic(false)
for fZ,f_ in pairs(eL.Sound._cache)do pcall(function()f_:Stop()end)end
flyTo(fg,{Position=pillTarget(),GroupTransparency=1},
TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
function()
if fX._visible then return end
fc.Enabled=false
if fS then
fS.Visible=true
fT.Scale=0.5
eN(fT,eM.Spring,{Scale=1})
end
end)
flyTo(fj,{Scale=baseScale()*0.55},eM.Fast)

dimTo(1,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In))
end
end
function fR.Toggle(fX)fX:SetVisible(not fX._visible)end


function fR.SetToggleKey(fX,fY)
if type(fY)=="string"then fY=Enum.KeyCode[fY]end
if typeof(fY)=="EnumItem"then
if fX._toggleKey==fY then return end
fX._toggleKey=fY
fX:Notify{Title="Hide key",Content="Now bound to "..fY.Name,Duration=1.5}
end
end
function fR.GetToggleKey(fX)return fX._toggleKey end


function fR.OnClose(fX,fY)
if type(fY)=="function"then fX._onCloseCb=fY end
end

function fR.SetMini(fX,fY)
fY=fY and true or false
if fY==fX._mini then return end
fX._mini=fY
if fY then
fX._visible=false
fX._lastPos=fg.Position
fS.Visible=false
eL:SetAcrylic(false)
for fZ,f_ in pairs(eL.Sound._cache)do pcall(function()f_:Stop()end)end
eN(fg,eM.Fast,{GroupTransparency=1})
eN(fj,eM.Fast,{Scale=baseScale()*0.7})
dimTo(1,eM.Fast)
task.delay(0.2,function()
if not fX._mini then return end
fc.Enabled=false
fU.Visible=true
fV.Scale=0.5
eN(fV,eM.Spring,{Scale=1})
end)
else
fU.Visible=false
fX:SetVisible(true)
end
end



fR._sbMode=0
fR._focus=false
function fR._applyLayout(fX)
local fY=fX._focus and 2 or fX._sbMode
local fZ=fY==1
fM.Visible=fY~=2
if fY==0 then
flyTo(fM,{Size=UDim2.new(0,164,1,0)})
fQ.Position=UDim2.new(0,176,0,0)
fQ.Size=UDim2.new(1,-176,1,0)
elseif fY==1 then
flyTo(fM,{Size=UDim2.new(0,58,1,0)})
fQ.Position=UDim2.new(0,70,0,0)
fQ.Size=UDim2.new(1,-70,1,0)
else
fQ.Position=UDim2.new(0,0,0,0)
fQ.Size=UDim2.new(1,0,1,0)
end
for f_,f0 in ipairs(fX._tabs)do
if f0._label then f0._label.Visible=not fZ end
if f0._icon and f0._icon:IsA"GuiObject"then
f0._icon.Position=fZ and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end


if fX._dockSetOpen then
if fZ then
fX._dockMemory=fX._dockOpen
fX._dockSetOpen(false,true)
else
fX._dockSetOpen(fX._dockMemory~=false,true)
end
end
end
function fR.CycleSidebar(fX)
fX._sbMode=(fX._sbMode+1)%3
fX:_applyLayout()
fX:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[fX._sbMode+1],Duration=1.5}
end
function fR.SetFocus(fX,fY)
fX._focus=fY and true or false
fX:_applyLayout()
end
local function fitCard()
local fX=Vector2.new(1200,800)
pcall(function()fX=workspace.CurrentCamera.ViewportSize end)
local fY=math.clamp(math.min(fX.X/700,fX.Y/520),0.6,1)
fh=fY
fj.Scale=baseScale()
if fX.X<760 or e2.TouchEnabled then
if fR._sbMode==0 and not fR._userToggledSide then
fR._sbMode=2 fR:_applyLayout()
end
end
end
fA.MouseButton1Click:Connect(function()
eL:_sfx"Click"
fR._userToggledSide=true
fR:CycleSidebar()
end)
fy.MouseButton1Click:Connect(function()
eL:_sfx"Click"fR:ToggleKeybindList()
end)


local fX=e5.ConfirmClose
if fX==nil then fX=true end
local function requestClose()
eL:_sfx"Click"
if fX==false then fR:Destroy()return end
local fY=(type(fX)=="table")and fX or{}
fR:Dialog{
Title=fY.Title or"Close Kronos?",
Content=fY.Content or"The hub will close permanently and all features will be disabled.",
Buttons={
{Title=fY.Cancel or"Cancel"},
{Title=fY.Confirm or"Close",Callback=function()fR:Destroy()end},
},
}
end
fG.MouseButton1Click:Connect(function()requestClose()end)
fF.MouseButton1Click:Connect(function()
eL:_sfx"Click"fR:SetMini(not fR._mini)
end)
fR._zoomed=false
fE.MouseButton1Click:Connect(function()
eL:_sfx"Click"
fR._zoomed=not fR._zoomed
eN(fg,eM.Med,{Size=fR._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
fH.MouseButton1Click:Connect(function()
eL:_sfx"Click"fR:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
fR:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

fS=Instance.new"TextButton"fS.Name=ad.GetStealthName()
fS.Text=""
fS.AnchorPoint=Vector2.new(0,0.5)fS.Position=UDim2.new(0,12,0.5,0)
fS.Size=UDim2.fromOffset(42,42)
fS.BackgroundColor3=fa.Surface2 fS.BorderSizePixel=0
e4:_tag(fS,"BackgroundColor3","Surface2")
eU(fS,13)fS.Parent=fc fS.Visible=false
eW(fS,true)
e_(fS,0.6,20)

local fY=Instance.new"TextLabel"fY.Size=UDim2.fromScale(1,1)
fY.BackgroundTransparency=1 fY.Font=Enum.Font.GothamBlack
fY.TextSize=20 fY.Text="K"fY.Parent=fS
e4:_tag(fY,"TextColor3","Text")
local fZ=Instance.new"Frame"fZ.Size=UDim2.fromOffset(9,9)
fZ.Position=UDim2.new(1,-6,0,-3)fZ.BorderSizePixel=0
e4:_tag(fZ,"BackgroundColor3","Accent")
eU(fZ,99)fZ.Parent=fS
brandInto(fS,fY)
if not e5.Logo or e5.Logo==""then kronosFace(fS,fY,32,17)end
fT=Instance.new"UIScale"fT.Parent=fS
e0(fS,fS)
fS.MouseButton1Click:Connect(function()fR:SetVisible(true)end)


fU=Instance.new"TextButton"fU.Name=ad.GetStealthName()
fU.Text=""
fU.AnchorPoint=Vector2.new(0,0)fU.Position=UDim2.new(0,12,0,12)
fU.Size=UDim2.fromOffset(44,44)
fU.BackgroundColor3=fa.Surface2 fU.BorderSizePixel=0
e4:_tag(fU,"BackgroundColor3","Surface2")
eU(fU,13)fU.Parent=fb fU.Visible=false
eW(fU,true)
e_(fU,0.6,20)
local f_=Instance.new"TextLabel"f_.Size=UDim2.fromScale(1,1)
f_.BackgroundTransparency=1 f_.Font=Enum.Font.GothamBlack
f_.TextSize=20 f_.Text="K"f_.Parent=fU
e4:_tag(f_,"TextColor3","Text")
local f0=Instance.new"Frame"f0.Size=UDim2.fromOffset(9,9)
f0.Position=UDim2.new(1,-6,0,-3)f0.BorderSizePixel=0
e4:_tag(f0,"BackgroundColor3","Accent")
eU(f0,99)f0.Parent=fU
brandInto(fU,f_)
if not e5.Logo or e5.Logo==""then kronosFace(fU,f_,34,17)end
fV=Instance.new"UIScale"fV.Parent=fU
e0(fU,fU)
fU.MouseButton1Click:Connect(function()fR:SetMini(false)end)


local f1=Instance.new"TextButton"f1.Text=""
f1.AnchorPoint=Vector2.new(1,1)f1.Position=UDim2.new(1,0,1,0)
f1.Size=UDim2.fromOffset(28,28)f1.BackgroundTransparency=1
f1.Parent=fg f1.ZIndex=50
f1.ClipsDescendants=true


local f2=0
f1.MouseButton1Click:Connect(function()
local f3=os.clock()
if f3-f2<0.35 then
eL:_sfx"Click"
fR._zoomed=not fR._zoomed
eN(fg,eM.Med,{Size=fR._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
f2=f3
end)
local f3,f4,f5=false
f1.InputBegan:Connect(function(f6)
if f6.UserInputType==Enum.UserInputType.MouseButton1 or f6.UserInputType==Enum.UserInputType.Touch then
f3,f4,f5=true,f6.Position,fg.Size
f6.Changed:Connect(function()
if f6.UserInputState==Enum.UserInputState.End then
f3=false

task.delay(0.15,function()
if not f3 then fR:_applyTextScale()end
end)
end
end)
end
end)
fR:Track(e2.InputChanged:Connect(function(f6)
if not f3 then return end
if f6.UserInputType~=Enum.UserInputType.MouseMovement
and f6.UserInputType~=Enum.UserInputType.Touch then return end
local f7=f6.Position-f4
fg.Size=UDim2.fromOffset(
math.clamp(f5.X.Offset+f7.X,520,920),
math.clamp(f5.Y.Offset+f7.Y,380,660))
end))

function fR.Notify(f6,f7)
f7=f7 or{}
eL:_sfx"Notify"
eJ.closeAny()
table.insert(eL._inbox,1,{Title=f7.Title or"Kronos",
Content=f7.Content or f7.Text or"",At=os.date"%H:%M"})
while#eL._inbox>30 do table.remove(eL._inbox)end
pcall(function()fJ.Visible=true end)
local f8=ensureNotifyHost(fd)
local f9=Instance.new"CanvasGroup"f9.Size=UDim2.new(1,0,0,62)
f9.BackgroundColor3=fa.Surface2 f9.BorderSizePixel=0 f9.GroupTransparency=1
eU(f9,10)f9.Parent=f8
eW(f9,true)
e_(f9,0.65,24)
eL:_tag(f9,"BackgroundColor3","Surface2")
f9.Position=UDim2.new(0,40,0,0)
eN(f9,eM.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local ga=Instance.new"TextLabel"ga.BackgroundTransparency=1
ga.Position=UDim2.new(0,12,0,8)ga.Size=UDim2.new(1,-24,0,17)
ga.Font=Enum.Font.GothamBold ga.TextSize=13 ga.TextXAlignment=0
eL:_tag(ga,"TextColor3","Text")ga.Text=f7.Title or"Kronos"ga.Parent=f9
local gb=Instance.new"TextLabel"gb.BackgroundTransparency=1
gb.Position=UDim2.new(0,12,0,27)gb.Size=UDim2.new(1,-24,0,16)
gb.Font=Enum.Font.Gotham gb.TextSize=12 gb.TextXAlignment=0
eL:_tag(gb,"TextColor3","Dim")
gb.TextTruncate=Enum.TextTruncate.AtEnd gb.Text=f7.Content or f7.Text or""gb.Parent=f9
local gc=Instance.new"Frame"gc.AnchorPoint=Vector2.new(0,1)
gc.Position=UDim2.new(0,10,1,-6)gc.Size=UDim2.new(1,-20,0,2)
gc.BorderSizePixel=0 eL:agrad(gc,0)
eU(gc,99)gc.Parent=f9
local gd=f7.Duration or 4
eN(gc,TweenInfo.new(gd,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(gd+0.1,function()
eN(f9,eM.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()f9:Destroy()end)end)
end)
end




local function fadeModal(f6,f7,f8)
eN(f6,eM.Fast,{GroupTransparency=1})
pcall(function()
for f9,ga in ipairs(f6:GetDescendants())do
if ga:IsA"UIStroke"then eN(ga,eM.Fast,{Transparency=1})end
end
end)
eN(f7,eM.Fast,{BackgroundTransparency=1})
task.delay(f8 or 0.18,function()pcall(function()f7:Destroy()end)end)
end


function fR.Dialog(f6,f7)
f7=f7 or{}
eL:_sfx"Open"
local f8=Instance.new"TextButton"f8.Text=""f8.AutoButtonColor=false
f8.Size=UDim2.fromScale(1,1)f8.BackgroundColor3=Color3.fromRGB(0,0,0)
f8.BackgroundTransparency=1 f8.Parent=fc
eN(f8,eM.Med,{BackgroundTransparency=0.55})
local f9=Instance.new"CanvasGroup"f9.AnchorPoint=Vector2.new(0.5,0.5)



f9.Position=UDim2.new(0.5,fg.Position.X.Offset,0.5,fg.Position.Y.Offset)
f9.Size=UDim2.fromOffset(320,170)
f9.BackgroundColor3=fa.Surface f9.BorderSizePixel=0 f9.GroupTransparency=1
eU(f9,12)f9.Parent=f8
eW(f9,true)
eY(f9,12)
e_(f9,0.5,40)
eL:_tag(f9,"BackgroundColor3","Surface")
local ga=Instance.new"UIScale"ga.Scale=0.94 ga.Parent=f9
eN(f9,eM.Med,{GroupTransparency=0})
eN(ga,eM.Spring,{Scale=1})
local gb=false
local function close()
if gb then return end gb=true
eJ.close(close)
fadeModal(f9,f8)
end
eJ.open(close)
f8.MouseButton1Click:Connect(function()close()end)
local gc=Instance.new"TextLabel"gc.BackgroundTransparency=1
gc.Position=UDim2.new(0,16,0,14)gc.Size=UDim2.new(1,-32,0,20)
gc.Font=Enum.Font.GothamBold gc.TextSize=15 gc.TextXAlignment=0
eL:_tag(gc,"TextColor3","Text")gc.Text=f7.Title or"Confirm"gc.Parent=f9
local gd=Instance.new"TextLabel"gd.BackgroundTransparency=1
gd.Position=UDim2.new(0,16,0,38)gd.Size=UDim2.new(1,-32,0,60)
gd.Font=Enum.Font.Gotham gd.TextSize=12 gc.TextXAlignment=0
gd.TextXAlignment=0 gd.TextYAlignment=0 gd.TextWrapped=true
eL:_tag(gd,"TextColor3","Dim")gd.Text=f7.Content or""gd.Parent=f9
local ge=Instance.new"Frame"ge.BackgroundTransparency=1
ge.AnchorPoint=Vector2.new(0,1)ge.Position=UDim2.new(0,0,1,-12)
ge.Size=UDim2.new(1,0,0,34)ge.Parent=f9
local gf=Instance.new"UIListLayout"gf.FillDirection=Enum.FillDirection.Horizontal
gf.HorizontalAlignment=Enum.HorizontalAlignment.Right gf.Padding=UDim.new(0,8)gf.Parent=ge
eX(ge,0,0,12,12)
for gg,gh in ipairs(f7.Buttons or{{Title="OK"}})do
local gi=Instance.new"TextButton"gi.Text=""
gi.Size=UDim2.new(0,96,0,30)gi.BackgroundColor3=fa.Surface2
gi.BorderSizePixel=0 eU(gi,7)gi.AutoButtonColor=false gi.Parent=ge
eW(gi,true)
eL:_tag(gi,"BackgroundColor3","Surface2")
local gj=Instance.new"TextLabel"gj.BackgroundTransparency=1 gj.Size=UDim2.fromScale(1,1)
gj.Font=Enum.Font.GothamBold gj.TextSize=12
eL:_tag(gj,"TextColor3","Text")gj.Text=gh.Title gj.Parent=gi
local gk=Instance.new"UIScale"gk.Parent=gi
gi.MouseButton1Down:Connect(function()eN(gk,eM.Hover,{Scale=0.95})end)
gi.MouseButton1Up:Connect(function()eN(gk,eM.Spring,{Scale=1})end)
gi.MouseButton1Click:Connect(function()
close()eO(gh.Callback)
end)
end
return{Close=close}
end



function fR.Confirm(f6,f7)
f7=f7 or{}
local f8=f7.Danger==true
local f9=Instance.new"TextButton"f9.Text=""f9.AutoButtonColor=false
f9.Size=UDim2.fromScale(1,1)f9.BackgroundColor3=Color3.fromRGB(0,0,0)
f9.BackgroundTransparency=1 f9.Parent=fc
eN(f9,eM.Med,{BackgroundTransparency=0.55})
local ga=Instance.new"CanvasGroup"ga.AnchorPoint=Vector2.new(0.5,0.5)
ga.Position=UDim2.new(0.5,fg.Position.X.Offset,0.5,fg.Position.Y.Offset)
ga.Size=UDim2.fromOffset(320,150)
ga.BackgroundColor3=fa.Surface ga.BorderSizePixel=0 ga.GroupTransparency=1
eU(ga,12)ga.Parent=f9
eW(ga,true)
eY(ga,12)
e_(ga,0.5,40)
eL:_tag(ga,"BackgroundColor3","Surface")
local gb=Instance.new"UIScale"gb.Scale=0.94 gb.Parent=ga
eN(ga,eM.Med,{GroupTransparency=0})
eN(gb,eM.Spring,{Scale=1})
local gc=false
local function close(gd)
if gc then return end gc=true
eJ.close(close)
fadeModal(ga,f9)
eO(f7.Callback,gd and true or false)
end
eJ.open(close)
f9.MouseButton1Click:Connect(function()close(false)end)
fR:Track(e2.InputBegan:Connect(function(gd,ge)
if gc or ge then return end
if gd.KeyCode==Enum.KeyCode.Return or gd.KeyCode==Enum.KeyCode.KeypadEnter then
close(true)
elseif gd.KeyCode==Enum.KeyCode.Escape then
close(false)
end
end))
local gd=Instance.new"TextLabel"gd.BackgroundTransparency=1
gd.Position=UDim2.new(0,16,0,14)gd.Size=UDim2.new(1,-32,0,22)
gd.Font=Enum.Font.GothamBold gd.TextSize=15 gd.TextXAlignment=0
eL:_tag(gd,"TextColor3",f8 and"Danger"or"Text")
gd.Text=f7.Title or"Confirm"gd.Parent=ga
local ge=Instance.new"TextLabel"ge.BackgroundTransparency=1
ge.Position=UDim2.new(0,16,0,40)ge.Size=UDim2.new(1,-32,0,52)
ge.Font=Enum.Font.Gotham ge.TextSize=12
ge.TextXAlignment=0 ge.TextYAlignment=0 ge.TextWrapped=true
eL:_tag(ge,"TextColor3","Dim")ge.Text=f7.Text or""ge.Parent=ga
local gf=Instance.new"Frame"gf.BackgroundTransparency=1
gf.AnchorPoint=Vector2.new(0,1)gf.Position=UDim2.new(0,0,1,-12)
gf.Size=UDim2.new(1,0,0,34)gf.Parent=ga
local gg=Instance.new"UIListLayout"gg.FillDirection=Enum.FillDirection.Horizontal
gg.HorizontalAlignment=Enum.HorizontalAlignment.Right gg.Padding=UDim.new(0,8)gg.Parent=gf
eX(gf,0,0,12,12)
local function mkBtn(gh,gi,gj)
local gk=Instance.new"TextButton"gk.Text=""
gk.Size=UDim2.new(0,110,0,30)gk.BackgroundColor3=fa.Surface2
gk.BorderSizePixel=0 eU(gk,7)gk.AutoButtonColor=false gk.Parent=gf
eW(gk,true)
eL:_tag(gk,"BackgroundColor3","Surface2")
local gl=Instance.new"TextLabel"gl.BackgroundTransparency=1 gl.Size=UDim2.fromScale(1,1)
gl.Font=Enum.Font.GothamBold gl.TextSize=12
eL:_tag(gl,"TextColor3",gi and"Accent"or"Text")
gl.Text=gh gl.Parent=gk
gk.MouseButton1Click:Connect(function()gj()end)
return gk
end
mkBtn(f7.CancelText or"Cancel",false,function()close(false)end)
mkBtn(f7.ConfirmText or"Confirm",true,function()close(true)end)
return{Close=function()close(false)end}
end



function fR.Modal(f6,f7)
f7=f7 or{}
local f8=f7.Fields or{}
local f9=f7.Danger==true
local ga=Instance.new"TextButton"ga.Text=""ga.AutoButtonColor=false
ga.Size=UDim2.fromScale(1,1)ga.BackgroundColor3=Color3.fromRGB(0,0,0)
ga.BackgroundTransparency=1 ga.Parent=fc
eN(ga,eM.Med,{BackgroundTransparency=0.55})
local gb=Instance.new"CanvasGroup"gb.AnchorPoint=Vector2.new(0.5,0.5)
gb.Position=UDim2.new(0.5,fg.Position.X.Offset,0.5,fg.Position.Y.Offset)
gb.Size=UDim2.fromOffset(340,0)gb.AutomaticSize=Enum.AutomaticSize.Y
gb.BackgroundColor3=fa.Surface gb.BorderSizePixel=0 gb.GroupTransparency=1
eU(gb,12)gb.Parent=ga
eW(gb,true)
eY(gb,12)
e_(gb,0.5,40)
eL:_tag(gb,"BackgroundColor3","Surface")
local gc=Instance.new"UIScale"gc.Scale=0.94 gc.Parent=gb
eN(gb,eM.Med,{GroupTransparency=0})
eN(gc,eM.Spring,{Scale=1})
local gd=false
local ge={}
local function values()
local gf={}
for gg,gh in pairs(ge)do
gf[gg]=gh.Text
end
return gf
end
local function close(gf)
if gd then return end gd=true
eJ.close(close)
fadeModal(gb,ga)
if gf then eO(f7.Callback,true,values())else eO(f7.Callback,false,values())end
end
eJ.open(close)
ga.MouseButton1Click:Connect(function()close(false)end)
local gf=Instance.new"TextLabel"gf.BackgroundTransparency=1
gf.Position=UDim2.new(0,16,0,14)gf.Size=UDim2.new(1,-32,0,22)
gf.Font=Enum.Font.GothamBold gf.TextSize=15 gf.TextXAlignment=0
eL:_tag(gf,"TextColor3",f9 and"Danger"or"Text")
gf.Text=f7.Title or"Modal"gf.Parent=gb
local gg=42
if f7.Text and f7.Text~=""then
local gh=Instance.new"TextLabel"gh.BackgroundTransparency=1
gh.Position=UDim2.new(0,16,0,gg)gh.Size=UDim2.new(1,-32,0,30)
gh.Font=Enum.Font.Gotham gh.TextSize=12
gh.TextXAlignment=0 gh.TextYAlignment=0 gh.TextWrapped=true
eL:_tag(gh,"TextColor3","Dim")gh.Text=f7.Text gh.Parent=gb
gg+=36
end
for gh,gi in ipairs(f8)do
local gj=gi.Type=="textarea"
local gk=gj and 56 or 30
if gi.Label and gi.Label~=""then
local gl=Instance.new"TextLabel"gl.BackgroundTransparency=1
gl.Position=UDim2.new(0,16,0,gg)gl.Size=UDim2.new(1,-32,0,14)
gl.Font=Enum.Font.GothamBold gl.TextSize=11 gl.TextXAlignment=0
eL:_tag(gl,"TextColor3","Dim")gl.Text=string.upper(tostring(gi.Label))gl.Parent=gb
gg+=16
end
local gl=Instance.new"TextBox"
gl.PlaceholderText=gi.Placeholder or""gl.PlaceholderColor3=fa.Dim
gl.Text=gi.Default or""
gl.Font=Enum.Font.Gotham gl.TextSize=13
gl.TextXAlignment=0 gl.TextYAlignment=gj and 0 or 1
gl.TextWrapped=gj gl.MultiLine=gj
gl.ClearTextOnFocus=false
gl.Position=UDim2.new(0,16,0,gg)gl.Size=UDim2.new(1,-32,0,gk)
gl.BackgroundColor3=fa.Surface2 gl.BorderSizePixel=0
eU(gl,7)gl.Parent=gb
eX(gl,4,4,10,10)
eW(gl,true)
eL:_tag(gl,"BackgroundColor3","Surface2")
eL:_tag(gl,"TextColor3","Text")
if tonumber(gi.MaxLength)then
local gm=tonumber(gi.MaxLength)
gl:GetPropertyChangedSignal"Text":Connect(function()
if string.len(gl.Text)>gm then gl.Text=string.sub(gl.Text,1,gm)end
end)
end
ge[gi.Key]=gl
gg+=gk+10
end
local gh=Instance.new"Frame"gh.BackgroundTransparency=1
gh.Position=UDim2.new(0,0,0,gg)gh.Size=UDim2.new(1,0,0,46)
gh.Parent=gb
local gi=Instance.new"UIListLayout"gi.FillDirection=Enum.FillDirection.Horizontal
gi.HorizontalAlignment=Enum.HorizontalAlignment.Right gi.Padding=UDim.new(0,8)gi.Parent=gh
eX(gh,0,12,12,12)
local function mkBtn2(gj,gk,gl)
local gm=Instance.new"TextButton"gm.Text=""
gm.Size=UDim2.new(0,110,0,30)gm.BackgroundColor3=fa.Surface2
gm.BorderSizePixel=0 eU(gm,7)gm.AutoButtonColor=false gm.Parent=gh
eW(gm,true)
eL:_tag(gm,"BackgroundColor3","Surface2")
local gn=Instance.new"TextLabel"gn.BackgroundTransparency=1 gn.Size=UDim2.fromScale(1,1)
gn.Font=Enum.Font.GothamBold gn.TextSize=12
eL:_tag(gn,"TextColor3",gk and"Accent"or"Text")
gn.Text=gj gn.Parent=gm
gm.MouseButton1Click:Connect(function()gl()end)
return gm
end
mkBtn2(f7.CancelText or"Cancel",false,function()close(false)end)
mkBtn2(f7.ConfirmText or"Confirm",true,function()close(true)end)
return{Close=function()close(false)end}
end




function fR.KeySystem(f6,f7)
f7=f7 or{}
local f8,f9=false,f7.FileName or("kronos_key_"..tostring(e6))

local ga=(f6._folder or"Kronos").."/"..f9 ..".txt"

if f7.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(ga)then
local gb=readfile(ga)
if gb and f6:_checkKey(f7,gb)then f8=true end
end
end)
end
local gb=Instance.new"TextButton"gb.Text=""gb.AutoButtonColor=false
gb.Size=UDim2.fromScale(1,1)gb.BackgroundColor3=Color3.fromRGB(0,0,0)
gb.BackgroundTransparency=1 gb.ZIndex=200 gb.Parent=fc
eN(gb,eM.Med,{BackgroundTransparency=0.6})
local gc=Instance.new"CanvasGroup"gc.AnchorPoint=Vector2.new(0.5,0.5)
gc.Position=UDim2.new(0.5,0,0.5,0)gc.Size=UDim2.fromOffset(300,210)
gc.BackgroundColor3=fa.Surface gc.BorderSizePixel=0 gc.GroupTransparency=1
eU(gc,12)gc.Parent=gb
eW(gc,true)
eY(gc,12)
e_(gc,0.5,40)
eL:_tag(gc,"BackgroundColor3","Surface")
local gd=Instance.new"UIScale"gd.Scale=0.94 gd.Parent=gc
eN(gc,eM.Med,{GroupTransparency=0})
eN(gd,eM.Spring,{Scale=1})
local ge=Instance.new"TextLabel"ge.BackgroundTransparency=1
ge.Position=UDim2.new(0,16,0,14)ge.Size=UDim2.new(1,-32,0,20)
ge.Font=Enum.Font.GothamBold ge.TextSize=15 ge.TextXAlignment=0
eL:_tag(ge,"TextColor3","Text")ge.Text=f7.Title or"Enter Key"ge.Parent=gc
local gf=Instance.new"TextLabel"gf.BackgroundTransparency=1
gf.Position=UDim2.new(0,16,0,36)gf.Size=UDim2.new(1,-32,0,15)
gf.Font=Enum.Font.Gotham gf.TextSize=11 ge.TextXAlignment=0 gf.TextXAlignment=0
eL:_tag(gf,"TextColor3","Dim")gf.Text=string.upper(f7.Subtitle or"key required")gf.Parent=gc
local gg=Instance.new"TextBox"gg.PlaceholderText="Paste key..."
gg.PlaceholderColor3=fa.Dim gg.Text=""
gg.Font=Enum.Font.Code gg.TextSize=12
gg.Position=UDim2.new(0,16,0,60)gg.Size=UDim2.new(1,-32,0,32)
gg.BackgroundColor3=fa.Surface2 gg.BorderSizePixel=0
eU(gg,8)gg.Parent=gc
eX(gg,4,4,10,10)
eW(gg,true)
eL:_tag(gg,"BackgroundColor3","Surface2")
eL:_tag(gg,"TextColor3","Text")
local gh=Instance.new"TextLabel"gh.BackgroundTransparency=1
gh.Position=UDim2.new(0,16,0,96)gh.Size=UDim2.new(1,-32,0,15)
gh.Font=Enum.Font.Gotham gh.TextSize=11 gh.TextXAlignment=0 gh.Text=""
eL:_tag(gh,"TextColor3","Danger")gh.Parent=gc
local gi=Instance.new"TextButton"gi.Text=""
gi.Position=UDim2.new(0,16,0,118)gi.Size=UDim2.new(1,-32,0,32)
gi.BorderSizePixel=0 eU(gi,8)gi.AutoButtonColor=false gi.Parent=gc
eL:agrad(gi,15)
local gj=Instance.new"TextLabel"gj.BackgroundTransparency=1 gj.Size=UDim2.fromScale(1,1)
gj.Font=Enum.Font.GothamBold gj.TextSize=13 gj.Text="UNLOCK"
eL:oa(gj)gj.Parent=gi
local gk=Instance.new"UIScale"gk.Parent=gi
local gl
if f7.GetKeyLink then
gl=Instance.new"TextButton"gl.Text=""
gl.Position=UDim2.new(0,16,0,156)gl.Size=UDim2.new(1,-32,0,26)
gl.BackgroundTransparency=1 gl.Parent=gc
local gm=Instance.new"TextLabel"gm.BackgroundTransparency=1 gm.Size=UDim2.fromScale(1,1)
gm.Font=Enum.Font.Gotham gm.TextSize=11 gm.Text="Copy key link"
eL:_tag(gm,"TextColor3","Dim")gm.Parent=gl
gl.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(f7.GetKeyLink)end end)
gm.Text="Link copied"
task.delay(2,function()pcall(function()gm.Text="Copy key link"end)end)
end)
end
local gm
local function shake()local gn=
gc.Position.X.Offset
for go=1,3 do
if gm then pcall(function()gm:Cancel()end)end
gm=eN(gc,TweenInfo.new(0.05,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
if gm then pcall(function()gm:Cancel()end)end
gm=eN(gc,TweenInfo.new(0.05,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
if gm then pcall(function()gm:Cancel()end)end
gm=eN(gc,eM.Fast,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
f8=true
if f7.SaveKey~=false then
pcall(function()
if makefolder and isfolder and not isfolder(f6._folder or"Kronos")then
makefolder(f6._folder or"Kronos")
end
if writefile then writefile(ga,gg.Text)end
end)
end
fadeModal(gc,gb,0.2)
f6:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
eO(f7.OnSuccess)
end
local function check()
local gn=gg.Text
if f6:_checkKey(f7,gn)then unlock()
else gh.Text="Invalid key."task.spawn(shake)end
end
gi.MouseButton1Down:Connect(function()eN(gk,eM.Hover,{Scale=0.96})end)
gi.MouseButton1Up:Connect(function()eN(gk,eM.Spring,{Scale=1})end)
gi.MouseButton1Click:Connect(check)
gg.FocusLost:Connect(function(gn)if gn then check()end end)
if f8 then pcall(function()gb:Destroy()end)eO(f7.OnSuccess)end
return{Passed=function()return f8 end}
end

function eL._checkKey(f6,f7,f8)
if f7.Validate and type(f7.Validate)=="function"then
local f9,ga=pcall(f7.Validate,f8)
if f9 and ga then return true end
end
if f7.Key and f8==f7.Key then return true end
if f7.Keys and table.find(f7.Keys,f8)then return true end
if not f7.Key and not f7.Keys and not f7.Validate then return true end
return false
end


function fR.TogglePalette(f6,f7)
local f8=f6._palette
if not f8 then
local f9=Instance.new"TextButton"f9.Text=""f9.AutoButtonColor=false
f9.Size=UDim2.fromScale(1,1)f9.BackgroundColor3=Color3.fromRGB(0,0,0)
f9.BackgroundTransparency=1 f9.Visible=false f9.ZIndex=eJ.Z.Popup f9.Parent=fd
local ga=Instance.new"Frame"ga.AnchorPoint=Vector2.new(0.5,0)
ga.Position=UDim2.new(0.5,0,0,90)ga.Size=UDim2.fromOffset(380,300)
ga.BackgroundColor3=fa.Bg ga.BorderSizePixel=0
eU(ga,12)ga.Parent=f9
eW(ga,true)
e_(ga,0.5,40)
eL:_tag(ga,"BackgroundColor3","Bg")
local gb=Instance.new"TextBox"gb.PlaceholderText="Type a command..."
gb.PlaceholderColor3=fa.Dim gb.Text=""
gb.Font=Enum.Font.Gotham gb.TextSize=14
gb.Position=UDim2.new(0,14,0,12)gb.Size=UDim2.new(1,-28,0,32)
gb.BackgroundTransparency=1 gb.ClearTextOnFocus=false gb.Parent=ga
eL:_tag(gb,"TextColor3","Text")
local gc=Instance.new"Frame"gc.BorderSizePixel=0
gc.Position=UDim2.new(0,12,0,50)gc.Size=UDim2.new(1,-24,0,1)
gc.BackgroundColor3=Color3.fromRGB(255,255,255)
gc.BackgroundTransparency=0.93 gc.Parent=ga
local gd=Instance.new"ScrollingFrame"
gd.Position=UDim2.new(0,8,0,56)gd.Size=UDim2.new(1,-16,1,-64)
gd.BackgroundTransparency=1 gd.BorderSizePixel=0
gd.ScrollBarThickness=2 gd.CanvasSize=UDim2.new(0,0,0,0)
gd.AutomaticCanvasSize=Enum.AutomaticSize.Y gd.Parent=ga
eL:_tag(gd,"ScrollBarImageColor3","Surface2")
local ge=Instance.new"UIListLayout"ge.Padding=UDim.new(0,2)
ge.SortOrder=Enum.SortOrder.LayoutOrder ge.Parent=gd
f8={ov=f9,card=ga,box=gb,list=gd,open=false,sel=1,rows={}}
f6._palette=f8
local function fuzzy(gf,gg)
gf,gg=string.lower(gf),string.lower(gg)
if gf==""then return 0 end
local gh,gi,gj=1,0,0
for gk=1,#gg do
if string.sub(gg,gk,gk)==string.sub(gf,gh,gh)then
gi+=(gj==gk-1)and 2 or 1
gj,gh=gk,gh+1
if gh>#gf then return gi-gk*0.01 end
end
end
return nil
end
local function run(gf)
if not gf then return end
f8.ov.Visible,f8.open=false,false
eJ.close(f8._closeLayer)
eN(f8.ov,eM.Fast,{BackgroundTransparency=1})
if gf.go then pcall(gf.go)end
end
f8._run=run
local function render()
for gf,gg in ipairs(f8.rows)do pcall(function()gg.frame:Destroy()end)end
f8.rows={}
local gf=gb.Text
local gg={}
for gh,gi in ipairs(f6._tabs)do
local gj=fuzzy(gf,gi.Title)
if gj then table.insert(gg,{label=gi.Title,hint="tab",score=gj+100,
go=function()f6._activateTab(gi,true)end})end
for gk,gl in ipairs(gi.Elements)do
if gl.Title and gl.Frame then
local gm=fuzzy(gf,gi.Title.." "..gl.Title)
if gm then table.insert(gg,{label=gl.Title,hint=gi.Title,score=gm,
go=gl._go})end
end
end
end
table.sort(gg,function(gh,gi)return gh.score>gi.score end)
f8.sel=math.clamp(f8.sel,1,math.max(1,math.min(12,#gg)))
if#gg==0 then
local gh=Instance.new"TextLabel"gh.BackgroundTransparency=1
gh.Size=UDim2.new(1,0,0,30)gh.Font=Enum.Font.Gotham
gh.TextSize=12 gh.Text="No results"gh.Parent=gd
eL:_tag(gh,"TextColor3","Dim")
f8.rows={{frame=gh}}
return
end
for gh=1,math.min(12,#gg)do
local gi=gg[gh]
local gj=Instance.new"TextButton"gj.Text=""
gj.Size=UDim2.new(1,-4,0,32)gj.BorderSizePixel=0
gj.BackgroundColor3=fa.Surface2
gj.BackgroundTransparency=(gh==f8.sel)and 0.35 or 1
eU(gj,7)gj.Parent=gd
eL:_tag(gj,"BackgroundColor3","Surface2")
local gk=Instance.new"TextLabel"gk.BackgroundTransparency=1
gk.Position=UDim2.new(0,10,0,0)gk.Size=UDim2.new(1,-90,1,0)
gk.Font=Enum.Font.Gotham gk.TextSize=13 gk.TextXAlignment=0
gk.TextTruncate=Enum.TextTruncate.AtEnd gk.Text=gi.label gk.Parent=gj
eL:_tag(gk,"TextColor3","Text")
local gl=Instance.new"TextLabel"gl.BackgroundTransparency=1
gl.AnchorPoint=Vector2.new(1,0)gl.Position=UDim2.new(1,-10,0,0)
gl.Size=UDim2.new(0,70,1,0)gl.Font=Enum.Font.Gotham
gl.TextSize=10 gl.TextXAlignment=1 gk.TextTruncate=Enum.TextTruncate.AtEnd
gl.Text=gi.hint gl.Parent=gj
eL:_tag(gl,"TextColor3","Dim")
local gm=gh
gj.MouseButton1Click:Connect(function()run(gi)end)
gj.MouseEnter:Connect(function()
f8.sel=gm render()
end)
table.insert(f8.rows,{frame=gj,item=gi})
end
end
f8._render=render
gb:GetPropertyChangedSignal"Text":Connect(function()f8.sel=1 render()end)
f9.MouseButton1Click:Connect(function()
if f8.open then f6:TogglePalette(false)end
end)
f6:Track(e2.InputBegan:Connect(function(gf,gg)
if not f8.open then return end
if gf.KeyCode==Enum.KeyCode.Escape then f6:TogglePalette(false)
elseif gf.KeyCode==Enum.KeyCode.Return or gf.KeyCode==Enum.KeyCode.KeypadEnter then
local gh=f8.rows[f8.sel]
run(gh and gh.item)
elseif gf.KeyCode==Enum.KeyCode.Up then
f8.sel=math.max(1,f8.sel-1)render()
elseif gf.KeyCode==Enum.KeyCode.Down then
f8.sel=math.min(#f8.rows,f8.sel+1)render()
end
end))
f8._closeLayer=function()
if f8.open then f6:TogglePalette(false)end
end
end
local f9=(f7~=nil)and f7 or(not f8.open)
f8.open=f9
f8.ov.Visible=f9
if f9 then
eJ.open(f8._closeLayer)
eL:_sfx"Open"
flyTo(f8.ov,{BackgroundTransparency=0.45})
f8.card.Position=UDim2.new(0.5,0,0,78)
flyTo(f8.card,{Position=UDim2.new(0.5,0,0,90)})
f8.box.Text,f8.sel="",1
f8._render()
task.defer(function()pcall(function()f8.box:CaptureFocus()end)end)
else
eJ.close(f8._closeLayer)
flyTo(f8.ov,{BackgroundTransparency=1},eM.Fast,function()
if not f8.open then f8.ov.Visible=false end
end)
end
end

function fR.SetTheme(f6,f7)eL:SetTheme(f7)end

function eL.SetAccent(f6,f7)
if typeof(f7)~="Color3"then return end
f6.Themes[f6.ThemeName].Accent=f7
f6:SetTheme(f6.ThemeName)
end


eL.FontPacks={
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
eL.FontPack="Gotham+"
eL._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function eL._resolveFont(f6,f7)
local f8,f9=pcall(function()return Enum.Font[f7]end)
if f8 and f9 then return f9 end
return nil
end
function eL._paintFonts(f6,f7)
local f8=f6.FontPacks[f6.FontPack]
if not f8 then return end
for f9,ga in ipairs(f7:GetDescendants())do
if ga:IsA"TextLabel"or ga:IsA"TextButton"or ga:IsA"TextBox"then
local gb=ga:GetAttribute"KronosFontRole"
if not gb then
gb=f6._roleFromDefault[ga.Font]or"Body"
ga:SetAttribute("KronosFontRole",gb)
ga:SetAttribute("KronosBaseSize",ga.TextSize)
end
local gc=ga:GetAttribute"KronosBaseSize"or ga.TextSize
local gd=(f8.Bump and f8.Bump[gb])or 0
local ge=f8[gb]and f6:_resolveFont(f8[gb])or nil
pcall(function()
if ge then ga.Font=ge end
ga.TextSize=math.clamp(gc+gd,8,30)
end)
end
end
end
function eL.SetFontPack(f6,f7)
if not f6.FontPacks[f7]then return end
f6.FontPack=f7
if f6._gui then f6:_paintFonts(f6._gui)end
end
function eL.RefreshFonts(f6)
if f6._gui then f6:_paintFonts(f6._gui)end
end
function fR.SetAccent(f6,f7)eL:SetAccent(f7)end
function fR.SetScale(f6,f7)
fi=math.clamp(tonumber(f7)or 1,0.7,1.25)
fj.Scale=baseScale()
fR:_applyTextScale()
end

function fR._applyTextScale(f6)
local f7=440
pcall(function()f7=fg.AbsoluteSize.Y end)
if f7<10 then f7=440 end
aa._textScale=fi*math.clamp(f7/440,0.85,1.3)
if fc and fc.Parent then af.paintFonts(fc)end
end
function fR.SetCompact(f6,f7)
f7=f7 and true or false
if f7 then

if not f6._preCompactSize then
pcall(function()f6._preCompactSize=fg.Size end)
end
eN(fg,eM.Med,{Size=UDim2.fromOffset(560,400)})
else
local f8=f6._preCompactSize
or(f6._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))
f6._preCompactSize=nil
eN(fg,eM.Med,{Size=f8})
end
for f8,f9 in ipairs(f6._tabs)do
if f9._pl then f9._pl.Padding=f7 and UDim.new(0,4)or UDim.new(0,8)end
end
end
function fR.ToggleAcrylic(f6,f7)
eL:ToggleAcrylic(f7)
fg.BackgroundTransparency=(f7 and not eL._transparent)and 0.08 or 0
fM.BackgroundTransparency=(f7 and not eL._transparent)and 0.15 or 0
end
function fR.ToggleTransparency(f6,f7)
eL._transparent=f7 and true or false
local f8=(eL._acrylicOn and not f7)and 0.08 or(f7 and 0.25 or 0)
fg.BackgroundTransparency=f8
fM.BackgroundTransparency=f7 and 0.4 or((eL._acrylicOn and not f7)and 0.15 or 0)
end


function fR.SetBackdrop(f6,f7)
f7=f7 and true or false
ff=f7
f6._backdrop=f7
if f7 then
if f6._visible and not f6._mini then
fe.Visible=true
eN(fe,eM.Med,{BackgroundTransparency=0.5})
end
else
eN(fe,eM.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
if not ff then fe.Visible=false end
end)
end
end




local f6=Instance.new"TextButton"
f6.Name=ad.GetStealthName()
f6.Text=""f6.AutoButtonColor=false
f6.Size=UDim2.fromScale(1,1)
f6.BackgroundColor3=Color3.fromRGB(0,0,0)
f6.BackgroundTransparency=1 f6.BorderSizePixel=0
f6.Visible=false f6.Parent=fK
eU(f6,10)
local function slideCloseAll()
if fR._inboxPanel and fR._inboxPanel.open then fR:ToggleInbox(false)end
if fR._kbPanel and fR._kbPanel.open then fR:ToggleKeybindList(false)end
end
f6.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(f7)
if f7 then
eJ.open(slideCloseAll)
f6.Visible=true
eN(f6,eM.Med,{BackgroundTransparency=0.5})
else
eJ.close(slideCloseAll)
eN(f6,eM.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local f8=fR._inboxPanel and fR._inboxPanel.open
local f9=fR._kbPanel and fR._kbPanel.open
if not f8 and not f9 then f6.Visible=false end
end)
end
end


function fR.ToggleInbox(f7,f8)
local f9=f7._inboxPanel
if not f9 then
local ga=Instance.new"Frame"ga.AnchorPoint=Vector2.new(1,0)
ga.Position=UDim2.new(1,12,0,0)ga.Size=UDim2.new(0,230,1,0)
ga.BackgroundColor3=fa.Bg ga.BorderSizePixel=0
eU(ga,10)ga.Parent=fK ga.Visible=false
eW(ga,true)
eL:_tag(ga,"BackgroundColor3","Bg")
local gb=Instance.new"TextLabel"gb.BackgroundTransparency=1
gb.Position=UDim2.new(0,12,0,10)gb.Size=UDim2.new(1,-70,0,18)
gb.Font=Enum.Font.GothamBold gb.TextSize=11 gb.TextXAlignment=0
gb.Text="INBOX"gb.Parent=ga
eL:_tag(gb,"TextColor3","Dim")
local gc=Instance.new"TextButton"gc.Text=""
gc.AnchorPoint=Vector2.new(1,0)gc.Position=UDim2.new(1,-10,0,10)
gc.Size=UDim2.new(0,52,0,18)gc.BackgroundColor3=fa.Surface2
gc.BorderSizePixel=0 eU(gc,6)gc.AutoButtonColor=false gc.Parent=ga
eW(gc,true)
eL:_tag(gc,"BackgroundColor3","Surface2")
local gd=Instance.new"TextLabel"gd.BackgroundTransparency=1
gd.Size=UDim2.fromScale(1,1)gd.Font=Enum.Font.GothamBold
gd.TextSize=10 gd.Text="CLEAR"gd.Parent=gc
eL:_tag(gd,"TextColor3","Dim")
local ge=Instance.new"ScrollingFrame"
ge.Position=UDim2.new(0,8,0,34)ge.Size=UDim2.new(1,-16,1,-42)
ge.BackgroundTransparency=1 ge.BorderSizePixel=0
ge.ScrollBarThickness=2 ge.CanvasSize=UDim2.new(0,0,0,0)
ge.AutomaticCanvasSize=Enum.AutomaticSize.Y ge.Parent=ga
eL:_tag(ge,"ScrollBarImageColor3","Surface2")
local gf=Instance.new"UIListLayout"gf.Padding=UDim.new(0,4)
gf.SortOrder=Enum.SortOrder.LayoutOrder gf.Parent=ge
f9={panel=ga,list=ge,open=false}
f7._inboxPanel=f9
local function refresh()
for gg,gh in ipairs(ge:GetChildren())do


if gh:IsA"Frame"or gh:IsA"TextLabel"then pcall(function()gh:Destroy()end)end
end
if#eL._inbox==0 then
local gg=Instance.new"TextLabel"gg.BackgroundTransparency=1
gg.Size=UDim2.new(1,0,0,24)gg.Font=Enum.Font.Gotham
gg.TextSize=11 gg.Text="All caught up."gg.Parent=ge
eL:_tag(gg,"TextColor3","Dim")
return
end
for gg,gh in ipairs(eL._inbox)do
local gi=Instance.new"Frame"
gi.Size=UDim2.new(1,-2,0,44)gi.BackgroundColor3=fa.Surface2
gi.BackgroundTransparency=0.35 gi.BorderSizePixel=0
eU(gi,7)gi.Parent=ge
eL:_tag(gi,"BackgroundColor3","Surface2")
local gj=Instance.new"TextLabel"gj.BackgroundTransparency=1
gj.Position=UDim2.new(0,8,0,4)gj.Size=UDim2.new(1,-52,0,15)
gj.Font=Enum.Font.GothamBold gj.TextSize=11 gj.TextXAlignment=0
gj.TextTruncate=Enum.TextTruncate.AtEnd gj.Text=gh.Title gj.Parent=gi
eL:_tag(gj,"TextColor3","Text")
local gk=Instance.new"TextLabel"gk.BackgroundTransparency=1
gk.Position=UDim2.new(0,8,0,20)gk.Size=UDim2.new(1,-52,0,18)
gk.Font=Enum.Font.Gotham gk.TextSize=11 gk.TextXAlignment=0
gk.TextTruncate=Enum.TextTruncate.AtEnd gk.Text=gh.Content gk.Parent=gi
eL:_tag(gk,"TextColor3","Dim")
local gl=Instance.new"TextLabel"gl.BackgroundTransparency=1
gl.AnchorPoint=Vector2.new(1,0)gl.Position=UDim2.new(1,-8,0,4)
gl.Size=UDim2.new(0,40,0,14)gl.Font=Enum.Font.Code
gl.TextSize=10 gl.TextXAlignment=1 gl.Text=gh.At gl.Parent=gi
eL:_tag(gl,"TextColor3","Dim")
end
end
f9.refresh=refresh
gc.MouseButton1Click:Connect(function()
eL._inbox={}
refresh()
pcall(function()fJ.Visible=false end)
end)
end
local ga=(f8~=nil)and f8 or(not f9.open)
f9.open=ga
if ga then
if f7._kbPanel and f7._kbPanel.open then f7:ToggleKeybindList(false)end
slideShadeSet(true)
f9.refresh()
f9.panel.Visible=true
pcall(function()fJ.Visible=false end)
flyTo(f9.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(f9.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not f9.open then f9.panel.Visible=false end
end)
slideShadeSet(f7._kbPanel~=nil and f7._kbPanel.open==true)
end
end


function fR.ToggleKeybindList(f7,f8)
local f9=f7._kbPanel
if not f9 then
local ga=Instance.new"Frame"ga.AnchorPoint=Vector2.new(1,0)
ga.Position=UDim2.new(1,12,0,0)ga.Size=UDim2.new(0,210,1,0)
ga.BackgroundColor3=fa.Bg ga.BorderSizePixel=0
eU(ga,10)ga.Parent=fK ga.Visible=false
eW(ga,true)
eL:_tag(ga,"BackgroundColor3","Bg")
local gb=Instance.new"TextLabel"gb.BackgroundTransparency=1
gb.Position=UDim2.new(0,12,0,10)gb.Size=UDim2.new(1,-24,0,18)
gb.Font=Enum.Font.GothamBold gb.TextSize=11 gb.TextXAlignment=0
gb.Text="KEYBINDS"gb.Parent=ga
eL:_tag(gb,"TextColor3","Dim")
local gc=Instance.new"ScrollingFrame"
gc.Position=UDim2.new(0,8,0,34)gc.Size=UDim2.new(1,-16,1,-42)
gc.BackgroundTransparency=1 gc.BorderSizePixel=0
gc.ScrollBarThickness=2 gc.CanvasSize=UDim2.new(0,0,0,0)
gc.AutomaticCanvasSize=Enum.AutomaticSize.Y gc.Parent=ga
eL:_tag(gc,"ScrollBarImageColor3","Surface2")
local gd=Instance.new"UIListLayout"gd.Padding=UDim.new(0,4)
gd.SortOrder=Enum.SortOrder.LayoutOrder gd.Parent=gc
f9={panel=ga,list=gc,open=false}
f7._kbPanel=f9
local function refresh()
for ge,gf in ipairs(gc:GetChildren())do
if gf:IsA"TextButton"then pcall(function()gf:Destroy()end)end
end
if#f7._keybinds==0 then
local ge=Instance.new"TextLabel"ge.BackgroundTransparency=1
ge.Size=UDim2.new(1,0,0,24)ge.Font=Enum.Font.Gotham
ge.TextSize=11 ge.Text="No keybinds yet"ge.Parent=gc
eL:_tag(ge,"TextColor3","Dim")
return
end
for ge,gf in ipairs(f7._keybinds)do
local gg=Instance.new"TextButton"gg.Text=""
gg.Size=UDim2.new(1,-2,0,30)gg.BackgroundColor3=fa.Surface2
gg.BackgroundTransparency=0.35 gg.BorderSizePixel=0
eU(gg,7)gg.Parent=gc
eL:_tag(gg,"BackgroundColor3","Surface2")
local gh=Instance.new"TextLabel"gh.BackgroundTransparency=1
gh.Position=UDim2.new(0,8,0,0)gh.Size=UDim2.new(1,-70,1,0)
gh.Font=Enum.Font.Gotham gh.TextSize=11 gh.TextXAlignment=0
gh.TextTruncate=Enum.TextTruncate.AtEnd gh.Text=gf.Title gh.Parent=gg
eL:_tag(gh,"TextColor3","Text")
local gi=Instance.new"TextLabel"gi.BackgroundTransparency=1
gi.AnchorPoint=Vector2.new(1,0)gi.Position=UDim2.new(1,-8,0,0)
gi.Size=UDim2.new(0,56,1,0)gi.Font=Enum.Font.Code
gi.TextSize=10 gi.TextXAlignment=1 gi.Text=gf.GetName()gi.Parent=gg
eL:_tag(gi,"TextColor3","Dim")
gg.MouseButton1Click:Connect(function()
eL:_sfx"Click"gf.Rebind()
task.delay(0.2,function()pcall(function()gi.Text=gf.GetName()end)end)
end)
end
end
f9.refresh=refresh
f7._kbPanelRefresh=refresh
end
local ga=(f8~=nil)and f8 or(not f9.open)
f9.open=ga
if ga then
if f7._inboxPanel and f7._inboxPanel.open then f7:ToggleInbox(false)end
slideShadeSet(true)
f9.refresh()
f9.panel.Visible=true
flyTo(f9.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(f9.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not f9.open then f9.panel.Visible=false end
end)
slideShadeSet(f7._inboxPanel~=nil and f7._inboxPanel.open==true)
end
end


function fR.Onboarding(f7,f8)
f8=f8 or{}
local f9=f8.Steps or f8.Pages or{{Title="Welcome",Content="This is Kronos."}}
local ga=1
local gb=Instance.new"TextButton"gb.Text=""gb.AutoButtonColor=false
gb.Size=UDim2.fromScale(1,1)gb.BackgroundColor3=Color3.fromRGB(0,0,0)
gb.BackgroundTransparency=1 gb.ZIndex=180 gb.Parent=fc
eN(gb,eM.Med,{BackgroundTransparency=0.6})
local gc=Instance.new"CanvasGroup"gc.AnchorPoint=Vector2.new(0.5,0.5)
gc.Position=UDim2.new(0.5,0,0.5,0)gc.Size=UDim2.fromOffset(340,220)
gc.BackgroundColor3=fa.Surface gc.BorderSizePixel=0 gc.GroupTransparency=1
eU(gc,12)gc.Parent=gb
eW(gc,true)
eY(gc,12)
e_(gc,0.5,40)
eL:_tag(gc,"BackgroundColor3","Surface")
local gd=Instance.new"UIScale"gd.Scale=0.94 gd.Parent=gc
eN(gc,eM.Med,{GroupTransparency=0})
eN(gd,eM.Spring,{Scale=1})
local ge=Instance.new"TextLabel"ge.BackgroundTransparency=1
ge.Position=UDim2.new(0,20,0,18)ge.Size=UDim2.new(1,-40,0,24)
ge.Font=Enum.Font.GothamBold ge.TextSize=17 ge.TextXAlignment=0 ge.Parent=gc
eL:_tag(ge,"TextColor3","Text")
local gf=Instance.new"TextLabel"gf.BackgroundTransparency=1
gf.Position=UDim2.new(0,20,0,48)gf.Size=UDim2.new(1,-40,0,90)
gf.Font=Enum.Font.Gotham gf.TextSize=13 ge.TextXAlignment=0
gf.TextXAlignment=0 gf.TextYAlignment=0 gf.TextWrapped=true gf.Parent=gc
eL:_tag(gf,"TextColor3","Dim")
local gg=Instance.new"Frame"gg.BackgroundTransparency=1
gg.AnchorPoint=Vector2.new(0,1)gg.Position=UDim2.new(0,20,1,-52)
gg.Size=UDim2.new(0,120,0,10)gg.Parent=gc
local gh=Instance.new"UIListLayout"gh.FillDirection=Enum.FillDirection.Horizontal
gh.Padding=UDim.new(0,6)gh.Parent=gg
local gi={}
for gj=1,#f9 do
local gk=Instance.new"Frame"gk.Size=UDim2.fromOffset(8,8)
gk.BorderSizePixel=0 eU(gk,99)gk.Parent=gg
eL:_tag(gk,"BackgroundColor3","Surface2")
gi[gj]=gk
end
local gj,gk,gl
local function paint()
ge.Text,gf.Text=f9[ga].Title or"",f9[ga].Content or""
for gm,gn in ipairs(gi)do
if gm==ga then eL:_tag(gn,"BackgroundColor3","Accent")
else eL:_tag(gn,"BackgroundColor3","Surface2")end
end
gj.Visible=ga>1
gl.Text=(ga==#f9)and"FINISH"or"NEXT"
ge.Position=UDim2.new(0,26,0,18)
eN(ge,eM.Fast,{Position=UDim2.new(0,20,0,18)})
end
local gm=Instance.new"Frame"gm.BackgroundTransparency=1
gm.AnchorPoint=Vector2.new(0,1)gm.Position=UDim2.new(0,0,1,-12)
gm.Size=UDim2.new(1,0,0,34)gm.Parent=gc
local gn=Instance.new"UIListLayout"gn.FillDirection=Enum.FillDirection.Horizontal
gn.HorizontalAlignment=Enum.HorizontalAlignment.Right gn.Padding=UDim.new(0,8)gn.Parent=gm
eX(gm,0,0,12,12)
gj=Instance.new"TextButton"gj.Text=""
gj.Size=UDim2.new(0,80,0,30)gj.BackgroundTransparency=1 gj.Parent=gm
local go=Instance.new"TextLabel"go.BackgroundTransparency=1
go.Size=UDim2.fromScale(1,1)go.Font=Enum.Font.GothamBold
go.TextSize=12 go.Text="BACK"go.Parent=gj
eL:_tag(go,"TextColor3","Dim")
local gp=Instance.new"TextButton"gp.Text=""
gp.Size=UDim2.new(0,80,0,30)gp.BackgroundTransparency=1 gp.Parent=gm
local gq=Instance.new"TextLabel"gq.BackgroundTransparency=1
gq.Size=UDim2.fromScale(1,1)gq.Font=Enum.Font.Gotham
gq.TextSize=12 gq.Text="Skip"gq.Parent=gp
eL:_tag(gq,"TextColor3","Dim")
gk=Instance.new"TextButton"gk.Text=""
gk.Size=UDim2.new(0,96,0,30)gk.BorderSizePixel=0
eU(gk,7)gk.AutoButtonColor=false gk.Parent=gm
eL:agrad(gk,15)
gl=Instance.new"TextLabel"gl.BackgroundTransparency=1
gl.Size=UDim2.fromScale(1,1)gl.Font=Enum.Font.GothamBold
gl.TextSize=12
gl.Text="NEXT"gl.Parent=gk
eL:oa(gl)
local function close()
fadeModal(gc,gb)
eO(f8.OnFinish)
end
gj.MouseButton1Click:Connect(function()
eL:_sfx"Click"ga=math.max(1,ga-1)paint()
end)
gp.MouseButton1Click:Connect(function()close()end)
gk.MouseButton1Click:Connect(function()
eL:_sfx"Click"
if ga>=#f9 then close()else ga+=1 paint()end
end)
paint()
end



function fR.Tab(f7,f8)
return ez({
Window=fR,opts=e5,Th=fa,pgui=fd,
pages=fQ,nav=fN,pill=fP,subLbl=ft,
},f8)
end


function fR.EspPreview(f7,f8)
return eA({Window=fR,Th=fa,main=fg,gui=fc},f8)
end

function fR.AddCloudPanel(f7,f8)
return eG(f7,f8)
end

function fR.AddChatPanel(f7,f8)
return eH(f7,f8)
end

function fR.AddGlobalChatPanel(f7,f8)
return eI(f7,f8)
end

function fR.SelectTab(f7,f8)
if type(f8)=="number"then
local f9=f7._tabs[f8]
if f9 then f7._activateTab(f9,true)end
return f9
end
for f9,ga in ipairs(f7._tabs)do
if ga.Title==f8 then
f7._activateTab(ga,true)
return ga
end
end
return nil
end
function fR.FindElement(f7,f8)
f8=tostring(f8 or""):lower()
if f8==""then return nil end
local f9,ga=0
for gb,gc in ipairs(f7._tabs)do
for gd,ge in ipairs(gc.Elements or{})do
local gf=tostring(ge.Title or"")
if gf~=""then
local gg=gf:lower()
if gg==f8 then return{title=ge.Title,instance=ge.Frame,tabObj=gc,kind=ge.Kind,flag=ge.Flag,_go=ge._go},math.huge end
if gg:find(f8,1,true)then
local gh=#f8/#gg
if gh>f9 then
f9=gh
ga={title=ge.Title,instance=ge.Frame,tabObj=gc,kind=ge.Kind,flag=ge.Flag,_go=ge._go}
end
end
end
end
end
if f9<=0 then return nil end
return ga,f9
end
function fR.DescribeElement(f7,f8)
if not f8 then return nil end
local f9={
name=tostring(f8.title or""),
type=f8.kind,
tab=f8.tabObj and f8.tabObj.Title or nil,
description=f8.description,
}
if f8.flag~=nil and f8.flag~=""then
f9.flag=f8.flag
local ga=eL.Flags[f8.flag]
if ga~=nil then
local gb=type(ga)
f9.currentValue=(gb=="string"or gb=="number"or gb=="boolean")and ga or tostring(ga)
end
end
return f9
end
function fR._JumpToSearchable(f7,f8)
if not f8 then return end
if f8._go then pcall(f8._go)return end
local f9,ga=f8.tabObj,f8.instance
if not f9 or not ga then return end
f7._activateTab(f9,true)
task.delay(0.6,function()
if ga.Parent then f7:_flash(ga)end
end)
end
function fR.JumpToElement(f7,f8)
f8=tostring(f8 or"")
if f8==""then return false,"No element name given"end
local f9=f7:FindElement(f8)
if not f9 then
return false,"No element found matching '"..f8 .."'"
end
f7:_JumpToSearchable(f9)
return true,f9.title
end
function fR._BuildDefaultSystemPrompt(f7)
local f8={}
for f9,ga in ipairs(f7._tabs)do
if not ga.Hidden then table.insert(f8,ga.Title)end
end

return"You are a helpful assistant embedded in a Roblox UI panel built with KronosUI. Your tools "
.."only affect THIS PANEL -- they inspect/adjust the panel's own toggles/sliders/etc, switch "
.."between its top-level tabs ("..table.concat(f8,", ")..[[), switch to a specific sub-tab within one of those, and jump to/highlight a specific UI element on the panel by its visible label. Only use select_tab, select_subtab, or find_and_highlight_element when the user is asking to be taken somewhere IN THIS PANEL, or to interact with a control that's actually on it. If the user asks you to write a script, explain something, or anything else that isn't about navigating this panel, just answer directly in chat -- do not call a tool just because the message happens to mention a word that sounds like a setting. When you write a Luau script for the user, put it in a normal ```lua fenced block -- the panel automatically adds a Run button to it that the user can click themselves, so you don't need to explain how to run it or tell them you can't execute code; you're just not the one who decides to run it -- they click Run after reading it. Keep answers short and to the point. None of your tools execute anything outside this panel, and you have no way to trigger the Run button yourself.]]












end
function fR._BuildDefaultChatTools(f7)
local f8=f7

return{
{
Name="list_ui_elements",
Description="Lists every UI element that has a Flag, with its kind and current value.",
Parameters={type="object"},
Handler=function()
return eL:ListUIElements()
end,
},
{
Name="set_ui_element_value",
Description="Sets a UI element's value by its flag name. Use list_ui_elements first to find valid flags.",
Parameters={
type="object",
properties={
flag={type="string",description="The Flag of the UI element to change."},
value={description="The new value: true/false for a Toggle, a number for a Slider, a string for a Textbox/Dropdown."},
},
required={"flag","value"},
},
Handler=function(f9)
local ga,gb=eL:SetUIElementValue(f9.flag,f9.value)
if not ga then error(gb,0)end
return{success=true,flag=f9.flag,value=f9.value}
end,
},
{
Name="select_tab",
Description="Switches the panel to one of its top-level sidebar tabs.",
Parameters={
type="object",
properties={
tab={type="string",description="The tab's name."},
},
required={"tab"},
},
Handler=function(f9)
local ga=f8:SelectTab(f9.tab)
if not ga then error("No tab named '"..tostring(f9.tab).."'",0)end
return"Switched to "..ga.Title
end,
},
{
Name="select_subtab",
Description=[[Switches to a sub-tab nested under one of the top-level tabs. Selects the parent tab first automatically -- no need to call select_tab beforehand.]]
,
Parameters={
type="object",
properties={
tab={type="string",description="The top-level tab that contains the sub-tab."},
subtab={type="string",description="The sub-tab's name."},
},
required={"tab","subtab"},
},
Handler=function(f9)
local ga=f8:SelectTab(f9.tab)
if not ga then error("No tab named '"..tostring(f9.tab).."'",0)end
local gb=ga:SelectSubTabByName(f9.subtab)
if not gb then
error("No sub-tab named '"..tostring(f9.subtab).."' under "..ga.Title,0)
end
return"Switched to "..ga.Title.." > "..gb.Name
end,
},
{
Name="find_and_highlight_element",
Description=[[Find and highlight the real Kronos UI element that best matches what the user is asking for. Interpret the request semantically -- the user's wording may differ substantially from the element's actual label. Use this when the user asks where a feature, button, setting, or control is, or asks how to enable, disable, change, or access something in the UI. Do not require exact label matching. The actual UI registry is the source of truth -- never invent an element or location. Returns the closest relevant real element, or reports not-found. Do not use this tool for questions already answered by the conversation history or runtime context (for example, asking for stats or values already shown) -- answer those directly.]]







,
Parameters={
type="object",
properties={
query={type="string",description="A natural-language description of the element or setting the user means. Exact label not required."},
},
required={"query"},
},
Handler=function(f9)
local ga,gb=f8:FindElement(f9.query)
if not ga then
return{success=false,found=false,error="No matching UI element found for '"..tostring(f9.query).."'"}
end
f8:_JumpToSearchable(ga)
local gc=f8:DescribeElement(ga)or{name=tostring(f9.query)}
gc.success=true
gc.found=true
gc.query=tostring(f9.query)
if gb==math.huge then gb=999 end
if type(gb)=="number"then
gc.score=math.floor(gb*10+0.5)/10
end
return gc
end,
},
}
end

function fR.SaveConfig(f7,f8)
ey.Save(f7,f8)
end
function fR.LoadConfig(f7,f8)
ey.Load(f7,f8)
end


fR._focusIdx=1
local f7




local function focusables()
local f8=fR._active
if not f8 then return{}end
local f9={}
for ga,gb in ipairs(f8.Elements)do
if gb.Frame and gb.Frame.Visible and gb.Frame.Parent then
local gc,gd=pcall(function()return gb.Frame.AbsoluteSize.Y>4 end)
if gc and gd then table.insert(f9,gb)end
end
end
return f9
end
function fR.FocusMove(f8,f9)
if not f8._visible then return end
if f8._palette and f8._palette.open then return end
local ga=focusables()
if#ga==0 then return end
f8._focusIdx=((f8._focusIdx-1+f9)%#ga)+1
local gb=ga[f8._focusIdx]
if not gb or not gb.Frame then return end
if not f7 then
f7=Instance.new"UIStroke"f7.Thickness=1.5
f7.Transparency=0.15
eL:_tag(f7,"Color","Accent")
end
pcall(function()
f7.Parent=gb.Frame
local gc=f8._active and f8._active.Page
if gc then
local gd=gb.Frame.AbsolutePosition.Y
local ge=gc.AbsolutePosition.Y
gc.CanvasPosition=Vector2.new(0,math.max(0,gc.CanvasPosition.Y+(gd-ge)-120))
end
end)
eL:_sfx"Hover"
end
function fR.FocusActivate(f8)
if not f8._visible then return end
local f9=focusables()
local ga=f9[f8._focusIdx]
if not ga then return end
f8:_flash(ga.Frame)
if ga._go then pcall(ga._go)end
end


fR._clean=fR._clean or{on=false,idle=6,last=os.clock(),faded=false,edge=nil}
function fR.SetCleanScreen(f8,f9,ga)
f9=f9 and true or false
f8._clean.on=f9
if ga then f8._clean.idle=math.clamp(tonumber(ga)or 6,2,60)end
f8._clean.last=os.clock()
if not f9 and f8._clean.faded then f8:_cleanRestore()end
if f9 then f8:_cleanTouch()end
end
function fR._cleanTouch(f8)f8._clean.last=os.clock()end
function fR._cleanFade(f8)
if f8._clean.faded or not f8._visible or f8._mini then return end
f8._clean.faded=true
eN(fg,eM.Med,{GroupTransparency=0.88})
dimTo(1,eM.Med)
if not f8._clean.edge then
local f9=Instance.new"TextButton"
f9.Name=ad.GetStealthName()
f9.Text=""f9.AnchorPoint=Vector2.new(0,0.5)f9.Position=UDim2.new(0,0,0.5,0)
f9.Size=UDim2.fromOffset(6,120)f9.BackgroundColor3=fa.Accent
f9.BackgroundTransparency=0.35 f9.BorderSizePixel=0 f9.ZIndex=200
eU(f9,99)f9.Parent=fc
eL:_tag(f9,"BackgroundColor3","Accent")
f9.MouseEnter:Connect(function()f8:_cleanRestore()end)
f9.InputBegan:Connect(function(ga)
if ga.UserInputType==Enum.UserInputType.Touch then f8:_cleanRestore()end
end)
f8._clean.edge=f9
else
f8._clean.edge.Visible=true
end
end
function fR._cleanRestore(f8)
if not f8._clean.faded then f8._clean.last=os.clock()return end
f8._clean.faded=false
f8._clean.last=os.clock()
if not f8._visible or f8._mini then return end
eN(fg,eM.Med,{GroupTransparency=0})
dimTo(0.5,eM.Med)
if f8._clean.edge then f8._clean.edge.Visible=false end
eL:_sfx"Hover"
end
fR:Track(e2.InputChanged:Connect(function(f8)
if f8.UserInputType~=Enum.UserInputType.MouseMovement
and f8.UserInputType~=Enum.UserInputType.Touch then return end
if fR._clean.on and fR._clean.faded then
local f9=f8.Position
local ga,gb=pcall(function()
local ga,gb=fg.AbsolutePosition,fg.AbsoluteSize
return f9.X>=ga.X-30 and f9.X<=ga.X+gb.X+30
and f9.Y>=ga.Y-30 and f9.Y<=ga.Y+gb.Y+30
end)
if f9.X<=24 then fR:_cleanRestore()return end
if ga and gb then fR:_cleanRestore()return end
end
fR:_cleanTouch()
end))
fR:Track(e2.InputBegan:Connect(function(f8)
if f8.UserInputType==Enum.UserInputType.MouseButton1
or f8.UserInputType==Enum.UserInputType.Touch then
if fR._clean.on and fR._clean.faded then fR:_cleanRestore()else fR:_cleanTouch()end
end
end))
task.spawn(function()
while fc.Parent do
task.wait(0.5)
pcall(function()
if fR._clean.on and not fR._clean.faded and fR._visible and not fR._mini then
if os.clock()-fR._clean.last>fR._clean.idle then
fR:_cleanFade()
end
end
end)
end
end)


function fR.SetPerformance(f8,f9)
f9=f9 and true or false
eL._perfLow=f9
if f9 then eL:SetAcrylic(false)end
pcall(function()
for ga,gb in ipairs(fg:GetDescendants())do
if gb.Name=="_light"or gb.Name=="_toplight"then gb.Visible=not f9 end
if gb:IsA"UIShadow"then gb.Enabled=not f9 end
end
end)
if not f9 and f8._acrylicPref then eL:SetAcrylic(true,e5.Blur or 16)end
end


function fR.ExportString(f8)
return ey.Export(f8)
end
function fR.ImportString(f8,f9)
return ey.Import(f8,f9)
end
function fR.AutoSave(f8,f9,ga,gb)
ey.AutoSave(f8,f9,ga,gb)
end

function fR.SetBadge(f8,f9,ga)
if not f9 or not(f9.Btn or f9.Button)then return end
local gb=f9.Btn or f9.Button
local gc=gb:FindFirstChild"_badge"
if not ga or ga==""or ga==0 then
if gc then pcall(function()gc:Destroy()end)end
return
end
if not gc then
gc=Instance.new"Frame"gc.Name="_badge"
gc.AnchorPoint=Vector2.new(1,0.5)gc.Position=UDim2.new(1,-8,0.5,0)
gc.Size=UDim2.new(0,20,0,16)gc.BackgroundColor3=Color3.fromRGB(248,113,113)
gc.BorderSizePixel=0 eU(gc,99)gc.Parent=gb gc.ZIndex=4
local gd=Instance.new"TextLabel"gd.Name="_l"gd.BackgroundTransparency=1
gd.Size=UDim2.fromScale(1,1)gd.Font=Enum.Font.GothamBold
gd.TextSize=10 gd.TextColor3=Color3.fromRGB(255,255,255)gd.Parent=gc
end
pcall(function()
local gd=gc:FindFirstChild"_l"
gd.Text=tostring(ga)
gc.Size=UDim2.new(0,math.clamp(10+string.len(tostring(ga))*7,20,64),0,16)
end)
end

function fR.Debug(f8)
local f9={}
local function log(ga)table.insert(f9,tostring(ga))end
log("version="..tostring(eL.Version).." visible="..tostring(f8._visible))
local ga=(eL._gui and eL._gui.Parent)and 1 or 0
log("hubs="..tostring(ga))
local function box(gb,gc)
local gd,ge=pcall(function()
return gc.." class="..gb.ClassName
.." clip="..tostring(gb.ClipsDescendants)
.." pos="..tostring(gb.AbsolutePosition)
.." size="..tostring(gb.AbsoluteSize)
end)
log(gd and ge or(gc.." ERR"))
end
box(f8._main,"main")
box(f8._body,"body")
box(f8._pages,"pages")
for gb,gc in ipairs(f8._tabs)do
local gd=gc.Page
local ge,gf=pcall(function()
return"page["..gc.Title.."] vis="..tostring(gd.Visible)
.." clip="..tostring(gd.ClipsDescendants)
.." vp="..tostring(gd.AbsoluteSize)
.." canvas="..tostring(gd.AbsoluteCanvasSize)
.." canvPos="..tostring(gd.CanvasPosition)
.." scroll="..tostring(gd.ScrollingEnabled)
end)
log(ge and gf or("page["..tostring(gc.Title).."] ERR"))
pcall(function()
local gg,gh=gd.AbsolutePosition.Y,gd.AbsoluteSize.Y
local gi,gj=0,0
for gk,gl in ipairs(gc.Elements)do
if gl.Frame and gl.Frame.Visible then
gj=gj+1
local gm,gn=gl.Frame.AbsolutePosition.Y,gl.Frame.AbsoluteSize.Y
if gm+gn<gg or gm>gg+gh then gi=gi+1 end
end
end
log("  rows="..gj.." outsideViewport="..gi)
end)
end
log"done"
return table.concat(f9,"\n")
end

function fR.Destroy(f8)
if f8._destroyed then return end
f8._destroyed=true
local f9=f8._onCloseCb
f8._onCloseCb=nil
if type(f9)=="function"then task.spawn(function()pcall(f9)end)end
for ga,gb in ipairs(f8._conns)do pcall(function()gb:Disconnect()end)end
f8._conns={}
for ga,gb in ipairs(aa._Windows)do
if gb==f8 then table.remove(aa._Windows,ga)break end
end
for ga,gb in pairs(eL.Sound._cache)do pcall(function()gb:Stop()gb:Destroy()end)end
eL.Sound._cache={}
eL:SetAcrylic(false)
if eL._gui==fc then eL._gui=nil end
pcall(function()fU:Destroy()end)
pcall(function()fc:Destroy()end)
pcall(function()fd:Destroy()end)
end

ad.registerUnload(function()
pcall(function()fR:Destroy()end)
end)
af.paintFonts(fc)
aa._lastWindow=fR
table.insert(aa._Windows,fR)
return fR
end end function a.ax():typeof(__modImpl())local aa=a.cache.ax if not aa then aa={c=__modImpl()}a.cache.ax=aa end return aa.c end end end






local aa=a.a()
local ab=a.b()a.c()a.e()


local ac=a.f()
local ad=a.g()
local ae=a.h()
local af=a.v()
local ey=a.w()
local ez=a.x()
local eA=a.z()
local eG=a.ax()

ab.claimUnload()

local eH=aa
eH.Build="r16"

eH.PreloadIcons=function(eI,eJ)
return ac.PreloadIcons(eJ)
end


eH.LoadIconSource=function(eI,eJ)
return ac.LoadIconSource(eJ)
end
eH.Themes=af.Themes
eH.Icons=ac.Icons
eH.IconAlias=ac.IconAlias

eH._tag=function(eI,eJ,eK,eL)
return af.tag(eJ,eK,eL)
end
eH.agrad=function(eI,eJ,eK)
return af.agrad(eJ,eK)
end
eH.oa=function(eI,eJ)
return af.oa(eJ)
end
eH.SetTheme=function(eI,eJ)
return af.SetTheme(eJ)
end
eH.SetAccent=function(eI,eJ)
return af.SetAccent(eJ)
end
eH.SetAcrylic=function(eI,eJ,eK)
return ey.SetAcrylic(eJ,eK)
end
eH.ToggleAcrylic=function(eI,eJ)
return ey.ToggleAcrylic(eJ)
end
eH._sfx=function(eI,eJ)
return ad.sfx(eJ)
end
eH.SetFontPack=function(eI,eJ)
return ae.SetFontPack(eJ)
end
eH.RefreshFonts=function(eI)
return ae.RefreshFonts()
end
eH._paintFonts=function(eI,eJ)
return ae.paintFonts(eJ)
end
eH.SetMotion=function(eI,eJ)
aa.ReducedMotion=not(eJ and true or false)
end
eH.SetSharp=function(eI,eJ)
return af.SetSharp(eJ)
end
eH.Debug=function(eI)
local eJ=aa._lastWindow
if eJ and eJ.Debug then
local eK,eL=pcall(function()return eJ:Debug()end)
if eK and eL then print(eL)return eL end
end
return nil
end
eH.CloudService=function(eI,eJ)
return ez.create(eJ)
end
eH.CreateAIAssistant=function(eI,eJ)
return eA.create(eJ)
end

eH.CreateWindow=eG




return eH
