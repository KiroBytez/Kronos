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
end
local B=A and tonumber(A.StatusCode)
if B==nil or(B>=200 and B<300)then
say("Feedback Sent","Thanks for rating the UI!","success",3)
return
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
return
end
say("Failed to Send",C or("Request failed (HTTP "..tostring(B)..")."),"error",3)
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
g(aq,f.Med,{Size=UDim2.new(av,0,1,0)})
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
local aB=ac.setDisabled local aC=
ad.makeIcon
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
local aN=Instance.new"UIScale"aN.Parent=aL
ax(aK)
aK.MouseButton1Down:Connect(function()an(aN,am.Hover,{Scale=0.93})end)
aK.MouseButton1Up:Connect(function()an(aN,am.Spring,{Scale=1})end)
aK.MouseEnter:Connect(function()af:_tag(aM,"TextColor3","Text")end)
aK.MouseLeave:Connect(function()af:_tag(aM,"TextColor3",b.Danger and"Danger"or"Dim")end)
local aO=false
local function fireBtn()
if aO then return end
if _._activateTab then _._activateTab(Q,true)end
_:_flash(aJ)af:_sfx"Click"ar(b.Callback)ar(b.OnChanged)
end



local aP,aQ,aR,aS
local aT={}
local function ringBuild()
if aP and aP.Parent then return end
aP=Instance.new"Frame"aP.Name="_ring"
aP.AnchorPoint=Vector2.new(0.5,0.5)aP.Position=UDim2.new(0.5,0,0.5,0)
aP.Size=UDim2.fromOffset(20,20)aP.BackgroundTransparency=1
aP.Visible=false aP.Parent=aL
aQ={}
for aU=0,11 do
local aV=(aU/12)*math.pi*2-math.pi/2
local aW=Instance.new"Frame"aW.BorderSizePixel=0
aW.Size=UDim2.fromOffset(3,3)
aW.Position=UDim2.new(0.5,math.cos(aV)*8-1.5,0.5,math.sin(aV)*8-1.5)
aW.BackgroundColor3=aF.Accent
aW.BackgroundTransparency=0.85
as(aW,99)aW.Parent=aP
af:_tag(aW,"BackgroundColor3","Accent")
table.insert(aQ,aW)
end
aR=Instance.new"TextLabel"aR.BackgroundTransparency=1
aR.Size=UDim2.fromScale(1,1)aR.Font=Enum.Font.Code
aR.TextSize=8 aR.Text=""aR.Parent=aP
af:_tag(aR,"TextColor3","Text")
end
local function ringPaint(aU)
if not aQ then return end
if aU==nil then
for aV,aW in ipairs(aQ)do pcall(function()aW.BackgroundTransparency=0.15 end)end
if aR then aR.Text=""end
else
local aV=math.floor(math.clamp(tonumber(aU)or 0,0,1)*12+0.5)
for aW,aX in ipairs(aQ)do
pcall(function()aX.BackgroundTransparency=(aW<=aV)and 0.1 or 0.88 end)
end
if aR then pcall(function()
aR.Text=tostring(math.floor(math.clamp(tonumber(aU)or 0,0,1)*100+0.5))
end)end
end
end
local function busyStart(aU)
if aO then return end aO=true
ringBuild()
aM.Visible=false
if aP then aP.Visible=true end
ringPaint(aU and 0 or nil)
if not aU then
local aV=0
aS=aD.RenderStepped:Connect(function()
if not aO then return end
aV=(aV+4)%360
pcall(function()aP.Rotation=aV end)
end)
end
end
local function busyDone()
if not aO then return end aO=false
if aS then pcall(function()aS:Disconnect()end)aS=nil end
if aP then
aP.Visible=false
pcall(function()aP.Rotation=0 end)
end
aM.Visible=true
end
function aT.set(aU)
if not aO then busyStart(true)end
ringPaint(tonumber(aU)or 0)
end
function aT.done()busyDone()end
if b.Flag and(b.Spin or b.Progress)then aa._busy[b.Flag]=aT end
local function fireBusy()
_:_flash(aJ)af:_sfx"Click"
local aU=b.Progress and true or false
busyStart(aU)
task.spawn(function()
local aV=false
local function set(aW)if not aV then ringPaint(tonumber(aW)or 0)end end
local function done()aV=true busyDone()end
pcall(b.Callback,set,done)
if not aV then busyDone()end
end)
end
local aU=function()
if aO then return end
if(b.Spin or b.Progress)and type(b.Callback)=="function"then
af:_bumpRecent(Q.Title,b.Title or"Button",fireBtn)fireBusy()
else
af:_bumpRecent(Q.Title,b.Title or"Button",fireBtn)fireBtn()
end
end
if b.HoldTime and tonumber(b.HoldTime)then
local aV,aW=tonumber(b.HoldTime),false
local aX=Instance.new"Frame"aX.BorderSizePixel=0
aX.Size=UDim2.new(0,0,1,0)as(aX,7)aX.Parent=aL
aX.BackgroundTransparency=0.6
af:_tag(aX,"BackgroundColor3","Accent")
aK.InputBegan:Connect(function(aY)
if aY.UserInputType~=Enum.UserInputType.MouseButton1 and aY.UserInputType~=Enum.UserInputType.Touch then return end
aW=true
an(aX,TweenInfo.new(aV,Enum.EasingStyle.Linear),{Size=UDim2.new(1,0,1,0)})
task.delay(aV,function()
if aW then
aW=false
aU()
aX.Size=UDim2.new(0,0,1,0)
end
end)
end)
aK.InputEnded:Connect(function(aY)
if aY.UserInputType==Enum.UserInputType.MouseButton1 or aY.UserInputType==Enum.UserInputType.Touch then
aW=false
an(aX,am.Fast,{Size=UDim2.new(0,0,1,0)})
end
end)
else
aK.MouseButton1Click:Connect(function()
aU()
end)
end
if b.Disabled then task.defer(function()pcall(aB,aJ,true)end)end
local aV={Title=b.Title,Frame=aJ,_handle=aK,Tooltip=b.Tooltip}
aV._go=function()
af:_bumpRecent(Q.Title,b.Title or"Button",fireBtn)aU()
end
return g(aV)
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
local ax=ac.hairline local ay=
ac.pad local az=
ac.lighting local aA=
ac.ripple local aB=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local aC=ae.cloneref_check(game:GetService"UserInputService")

return function(aD,aE)
local aF=aD.row
local aH=aD.titleBlock
local aI=aD.reg
local aJ=aD.tab
local aK=aD.Window
local aL=aD.Th local aM=
aD.opts or{}
aE=aE or{}
local aN=aE.Value~=nil and aE.Value or(aE.Default or false)
local aO=aF(aE.Description and 54 or 40)
aH(aO,aE.Title or"Toggle",aE.Description,70)
local aP,aQ,aR=40,22,16
local aS=Instance.new"TextButton"aS.Text=""
aS.AnchorPoint=Vector2.new(1,0.5)aS.Position=UDim2.new(1,-12,0.5,0)
aS.Size=UDim2.fromOffset(aP,aQ)aS.BorderSizePixel=0
aS.BackgroundColor3=aL.Surface2 aS.AutoButtonColor=false aS.Parent=aO
at(aS,99)
ax(aS,true)
af:_tag(aS,"BackgroundColor3","Surface2")

local aT=Instance.new"Frame"aT.BorderSizePixel=0
aT.Size=UDim2.new(1,0,1,0)aT.BackgroundTransparency=1
at(aT,99)aT.Parent=aS
af:agrad(aT,0)
local aU=Instance.new"Frame"aU.Size=UDim2.fromOffset(aR,aR)
aU.AnchorPoint=Vector2.new(0,0.5)aU.BorderSizePixel=0
aU.BackgroundColor3=Color3.fromRGB(255,255,255)
at(aU,99)aU.Parent=aS
local aV=Instance.new"UIScale"aV.Parent=aU
local aW=ar()



local function onKnob()
local aX=af.Theme.Accent
local aY=0.299*aX.R+0.587*aX.G+0.114*aX.B
if aY>0.6 then
return af.Theme.OnAccent or Color3.fromRGB(15,17,22)
end
return Color3.fromRGB(255,255,255)
end
local function paint(aX)
an(aT,aX and am.Med or TweenInfo.new(0),
{BackgroundTransparency=aN and 0 or 1})
local aY=aX and am.Spring or TweenInfo.new(0)
an(aU,aY,{Position=aN and UDim2.new(1,-aR-3,0.5,0)
or UDim2.new(0,3,0.5,0)})
an(aU,aX and am.Med or TweenInfo.new(0),
{BackgroundColor3=aN and onKnob()or Color3.fromRGB(255,255,255)})
end
aU.Position=aN and UDim2.new(1,-aR-3,0.5,0)or UDim2.new(0,3,0.5,0)
aU.BackgroundColor3=aN and onKnob()or Color3.fromRGB(255,255,255)
paint(false)
local aX={}
function aX.Set(aY,b,e)
aN=b and true or false paint(true)
if aE.Flag then af.Flags[aE.Flag]=aN end
if not e then af:_sfx(aN and"On"or"Off")as(aE.Callback,aN)as(aE.OnChanged,aN)end
end
function aX.Get(aY)return aN end

local aY,b,e=0,false
aJ._window:Track(aS.InputBegan:Connect(function(f)
if f.UserInputType~=Enum.UserInputType.MouseButton1 and f.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=aW then return end
af.CurrentInput=aW
e,aY,b=f.Position,aU.Position.X.Offset,false
an(aV,am.Hover,{Scale=1.25})
end))
aJ._window:Track(aC.InputChanged:Connect(function(f)
if af.CurrentInput~=aW or not e then return end
if f.UserInputType~=Enum.UserInputType.MouseMovement and f.UserInputType~=Enum.UserInputType.Touch then return end
local g=f.Position.X-e.X
if math.abs(g)>8 then b=true end
if b then
local Q=math.clamp(aY+g,3,aP-aR-3)
aU.Position=UDim2.new(0,Q,0.5,0)
end
end))
local function fireTg()
if aK._activateTab then aK._activateTab(aJ,true)end
aK:_flash(aO)aX:Set(not aX:Get())
end
aJ._window:Track(aC.InputEnded:Connect(function(f)
if af.CurrentInput~=aW then return end
if f.UserInputType~=Enum.UserInputType.MouseButton1 and f.UserInputType~=Enum.UserInputType.Touch then return end
af.CurrentInput,e=nil,nil
an(aV,am.Hover,{Scale=1})
if not b then aX:Set(not aN)
else
local g=aU.Position.X.Offset+aR/2
aX:Set(g>aP/2)
end
af:_bumpRecent(aJ.Title,aE.Title or"Toggle",fireTg)
end))
local f={Title=aE.Title,Frame=aO,Value=aN,Flag=aE.Flag,_handle=aX,
_set=function(f,g)aX:Set(f and true or false,g)end}
f._go=function()
af:_bumpRecent(aJ.Title,aE.Title or"Toggle",fireTg)fireTg()
end
return aI(f)
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
local ax=ac.hairline local aB=
ac.pad local aC=
ac.lighting local aD=
ac.ripple local aE=
ad.makeIcon
local aF=ae.cloneref_check(game:GetService"RunService")
local aH=ae.cloneref_check(game:GetService"UserInputService")

return function(aI,aJ)
local aK=aI.row
local aL=aI.titleBlock
local aM=aI.reg
local aN=aI.tab local aO=
aI.Window
local aP=aI.Th local aQ=
aI.opts or{}
aJ=aJ or{}
local aR=aJ.Min or(aJ.Range and aJ.Range[1])or 0
local aS=aJ.Max or(aJ.Range and aJ.Range[2])or 100
local aT=aJ.Step or aJ.Increment or 1
local aU=aJ.Rounding or(aT%1~=0 and 2 or 0)
local aV=aJ.Value~=nil and aJ.Value or(aJ.Default or aR)
local function fmt(aW)return aU>0 and string.format("%."..aU.."f",aW)or tostring(math.round(aW))end
local aW=aK(aJ.Description and 66 or 56)


local function scrollLock(aX)
local aY=aW:FindFirstAncestorOfClass"ScrollingFrame"
if aY then pcall(function()aY.ScrollingEnabled=not aX end)end
end
aL(aW,aJ.Title or"Slider",aJ.Description,90,true)
local aX=Instance.new"TextBox"aX.Text=fmt(aV)
aX.Font=Enum.Font.GothamBold aX.TextSize=11
aX.AnchorPoint=Vector2.new(1,0)aX.Position=UDim2.new(1,-12,0,6)
aX.Size=UDim2.new(0,60,0,22)aX.BackgroundColor3=aP.Surface2
aX.BorderSizePixel=0 at(aX,6)
af:_tag(aX,"BackgroundColor3","Surface2")
af:_tag(aX,"TextColor3","Text")
ax(aX,true)
aX.ClearTextOnFocus=false aX.Parent=aW
local aY=Instance.new"TextButton"aY.Text=""aY.AutoButtonColor=false
aY.Position=UDim2.new(0,12,0,aJ.Description and 48 or 36)aY.Size=UDim2.new(1,-24,0,6)
aY.BackgroundColor3=aP.Surface2 aY.BorderSizePixel=0
at(aY,99)aY.Parent=aW
af:_tag(aY,"BackgroundColor3","Surface2")
local b=Instance.new"Frame"b.BorderSizePixel=0
b.Size=UDim2.new(0,0,1,0)at(b,99)b.Parent=aY
af:agrad(b,0)
local e=Instance.new"Frame"e.AnchorPoint=Vector2.new(0.5,0.5)
e.Size=UDim2.fromOffset(12,12)e.BackgroundColor3=Color3.fromRGB(255,255,255)
e.BorderSizePixel=0 at(e,99)e.Parent=aY
local f=Instance.new"UIStroke"f.Thickness=1.5
f.Color=aP.Accent f.Transparency=0.35 f.Parent=e
af:_tag(f,"Color","Accent")


local g=ar()
local Q,_,aZ,a_=false,false
local function alpha(a0)return math.clamp((a0-aR)/math.max(1e-6,aS-aR),0,1)end
local function render(a0)
local a1=alpha(aV)
if a0 then
an(b,am.Fill08,{Size=UDim2.new(a1,0,1,0)})
else

b.Size=UDim2.new(a1,0,1,0)
end
e.Position=UDim2.new(a1,0,0.5,0)
if aX:IsFocused()==false then aX.Text=fmt(aV)end
end
local a0={}
function a0.Set(a1,a2,a3)
a2=math.clamp(tonumber(a2)or aV,aR,aS)
a2=math.round(a2/aT)*aT
if aU>0 then a2=tonumber(string.format("%."..aU.."f",a2))end
aV=a2 render(not Q)
if aJ.Flag then af.Flags[aJ.Flag]=aV end
if not a3 then as(aJ.Callback,aV)as(aJ.OnChanged,aV)end
end
function a0.Get(a1)return aV end
function a0.SetMax(a1,a2)aS=a2 a0:Set(aV,true)end
function a0.SetMin(a1,a2)aR=a2 a0:Set(aV,true)end
render(false)
aX.FocusLost:Connect(function()
local a1=tonumber(aX.Text)
if a1 then a0:Set(a1)else aX.Text=fmt(aV)end
end)
aY.InputBegan:Connect(function(a1)
if aJ.Locked then return end
if a1.UserInputType~=Enum.UserInputType.MouseButton1 and a1.UserInputType~=Enum.UserInputType.Touch then return end
if af.CurrentInput and af.CurrentInput~=g then return end
af.CurrentInput,Q,_=g,true,a1.UserInputType==Enum.UserInputType.Touch
scrollLock(true)
an(e,am.Hover,{Size=UDim2.fromOffset(16,16)})
local function fromX(a2)
local a3=math.clamp((a2-aY.AbsolutePosition.X)/math.max(1,aY.AbsoluteSize.X),0,1)
a0:Set(aR+a3*(aS-aR))
end
fromX(_ and a1.Position.X or aH:GetMouseLocation().X)
if aZ then aZ:Disconnect()end
aZ=aF.RenderStepped:Connect(function()
if not Q then return end
if aN._window and aN._window._visible==false then return end
fromX(aH:GetMouseLocation().X)
end)
if a_ then a_:Disconnect()end
a_=aH.InputEnded:Connect(function(a2)
if(a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch)and Q then
Q=false
if aZ then aZ:Disconnect()aZ=nil end
if a_ then a_:Disconnect()a_=nil end
af.CurrentInput=nil
scrollLock(false)
an(e,am.Hover,{Size=UDim2.fromOffset(12,12)})
as(aJ.OnRelease,aV)
end
end)
end)
local a1={Title=aJ.Title,Frame=aW,Value=aV,Flag=aJ.Flag,_handle=a0,
_set=function(a1,a2)a0:Set(a1,a2)end}
return aM(a1)
end end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local am=ab.T
local an=ab.tween local ar=
ac.guid
local as=ac.spawnCb
local at=ac.corner
local ax=ac.hairline
local aE=ac.pad local aF=
ac.lighting local aH=
ac.ripple local aI=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(aJ,aK)
local aL=aJ.row
local aM=aJ.titleBlock
local aN=aJ.reg local aP=
aJ.tab local aQ=
aJ.Window
local aR=aJ.Th local aS=
aJ.opts or{}
aK=aK or{}
local aT=aK.Locked==true
local aU=aL(aK.Description and 50 or 40)
aM(aU,aK.Title or"Input",nil,200)
local aV=Instance.new"TextBox"
aV.PlaceholderText=aK.Placeholder or"Type..."aV.PlaceholderColor3=aR.Dim
aV.Text=aK.Value or aK.Default or""
aV.Font=Enum.Font.Gotham aV.TextSize=12
aV.AnchorPoint=Vector2.new(1,0.5)aV.Position=UDim2.new(1,-12,0.5,0)
aV.Size=UDim2.new(0,170,0,28)aV.BackgroundColor3=aR.Surface2
aV.BorderSizePixel=0 at(aV,7)aV.ClearTextOnFocus=false aV.Parent=aU
aE(aV,4,4,8,8)
ax(aV,true)
af:_tag(aV,"BackgroundColor3","Surface2")
af:_tag(aV,"TextColor3","Text")
aV.Focused:Connect(function()
an(aV,am.Hover,{})
end)
aV.FocusLost:Connect(function(aW)
if aT then return end
if aK.Flag then af.Flags[aK.Flag]=aV.Text end
as(aK.Callback,aV.Text)as(aK.OnChanged,aV.Text)
end)
local aW={}
function aW.Set(aX,aY)
aV.Text=tostring(aY or"")
end
function aW.Get(aX)return aV.Text end
function aW.SetLocked(aX,aY)
aT=aY and true or false
if aT then pcall(function()aV:ReleaseFocus()end)end
ac.applyLock(aU,aT)
end
function aW.GetLocked(aX)return aT end
return aN{Title=aK.Title,Frame=aU,_handle=aW}
end end function a.J():typeof(__modImpl())local aa=a.cache.J if not aa then aa={c=__modImpl()}a.cache.J=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.v()a.g()

local af=a.b()
local am=a.d()

local an=aa
local as=ab.T
local at=ab.tween local ax=
ac.guid
local aE=ac.spawnCb
local aI=ac.corner
local aJ=ac.hairline local aK=
ac.pad local aL=
ac.lighting local aM=
ac.ripple
local aN=ad.makeIcon
local aR=af.cloneref_check(game:GetService"RunService")
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
aW.opts or{}local b=
aW.page
local e=aW.pgui
aX=aX or{}
local f=aX.Values or aX.Options or{}
local g=aX.Multi or aX.MultipleOptions or false
local Q=aX.Value or aX.Default or aX.CurrentOption
if not g and type(Q)=="table"then Q=Q[1]end
if g and type(Q)~="table"then Q=Q and{Q}or{}end
local _=aY(aX.Description and 50 or 40)_.ClipsDescendants=false
aZ(_,aX.Title or"Dropdown",nil,200)
local a4=Instance.new"TextButton"a4.Text=""
a4.AnchorPoint=Vector2.new(1,0.5)a4.Position=UDim2.new(1,-12,0.5,0)
a4.Size=UDim2.new(0,170,0,28)a4.BackgroundColor3=a2.Surface2
a4.BorderSizePixel=0 aI(a4,7)a4.AutoButtonColor=false a4.Parent=_
aJ(a4,true)
an:_tag(a4,"BackgroundColor3","Surface2")
local a5=Instance.new"TextLabel"a5.BackgroundTransparency=1
a5.Position=UDim2.new(0,8,0,0)a5.Size=UDim2.new(1,-28,1,0)
a5.Font=Enum.Font.Gotham a5.TextSize=12 a5.TextXAlignment=0
a5.TextTruncate=Enum.TextTruncate.AtEnd a5.Parent=a4
a5.ZIndex=2
an:_tag(a5,"TextColor3","Text")
local a6=aN("chevron",13,a2.Dim)
a6.AnchorPoint=Vector2.new(1,0.5)a6.Position=UDim2.new(1,-8,0.5,0)
a6.Parent=a4
local function curText()
if g then return(#Q==0 and"None"or table.concat(Q,", "))end
return tostring(Q or"Select...")
end
a5.Text=curText()
local a7,a8,a9,ba,bb,bc,bd=false
local be={}
function be.Set(bf,bg,bh)
Q=bg
if not g and type(Q)=="table"then Q=Q[1]end
a5.Text=curText()
if aX.Flag then an.Flags[aX.Flag]=Q end
if not bh then aE(aX.Callback,Q)aE(aX.OnChanged,Q)end
end
function be.Get(bf)return Q end
local function closeList()
if not a7 then return end
a7=false
am.close(closeList)
at(a6,as.Fast,{Rotation=0})
if bc then pcall(function()bc:Disconnect()end)bc=nil end
if bd then pcall(function()bd:Disconnect()end)bd=nil end
if a8 then pcall(function()a8:Destroy()end)a8=nil end
if a9 then pcall(function()a9:Destroy()end)a9=nil end
ba,bb=nil,nil
end
function be.Refresh(bf,bg)
f=bg or{}
closeList()
end
local function renderItems(bf)
if not ba then return end
for bg,bh in ipairs(ba:GetChildren())do
if bh:IsA"TextButton"then pcall(function()bh:Destroy()end)end
end
local bg={}
for bh,bi in ipairs(f)do
local bj=tostring(bi)
if(bf or"")==""or string.find(string.lower(bj),string.lower(bf),1,true)then
table.insert(bg,bj)
end
end
local bh=4
for bi,bj in ipairs(bg)do
local bk=Instance.new"TextButton"bk.Text=""
bk.Size=UDim2.new(1,-8,0,26)bk.Position=UDim2.new(0,4,0,bh)
bk.BackgroundColor3=a2.Surface2 bk.BackgroundTransparency=1
bk.BorderSizePixel=0 aI(bk,6)bk.Parent=ba
bk.ZIndex=am.Z.Popup+1
local bl=Instance.new"TextLabel"bl.BackgroundTransparency=1
bl.Position=UDim2.new(0,8,0,0)bl.Size=UDim2.new(1,-36,1,0)
bl.Font=Enum.Font.Gotham bl.TextSize=12 bl.TextXAlignment=0
bl.TextTruncate=Enum.TextTruncate.AtEnd bl.Text=bj bl.Parent=bk
bl.ZIndex=am.Z.Popup+2
local bm=g and table.find(Q,bj)or Q==bj
if bm then

an:_tag(bl,"TextColor3","Accent")
an:_tag(bk,"BackgroundColor3","Surface2")
bk.BackgroundTransparency=0.4
local bn=aN("check",12,a2.Accent)
bn.AnchorPoint=Vector2.new(1,0.5)bn.Position=UDim2.new(1,-8,0.5,0)
bn.Parent=bk
if bn:IsA"GuiObject"then bn.ZIndex=am.Z.Popup+2 end
else
an:_tag(bl,"TextColor3","Text")
end
bk.MouseEnter:Connect(function()bk.BackgroundTransparency=0.4 an:_tag(bk,"BackgroundColor3","Surface2")end)
bk.MouseLeave:Connect(function()if not(g and table.find(Q,bj)or Q==bj)then bk.BackgroundTransparency=1 end end)
bk.MouseButton1Click:Connect(function()
an:_sfx"Click"
if g then
local bn=table.find(Q,bj)
if bn then table.remove(Q,bn)else table.insert(Q,bj)end
be:Set(Q)
if bb then renderItems(bb.Text)else renderItems""end
else
be:Set(bj)
closeList()
end
end)
bh+=aT
end

ba.CanvasSize=UDim2.new(0,0,0,math.max(bh+4,1))
local bi=math.clamp(bh+4+36,72,aV+36)
a9.Size=UDim2.new(0,aS,0,bi)
return bi
end
local function placeList(bf)
if not a9 or not _.Parent then return end
local bg,bh=_.AbsolutePosition,_.AbsoluteSize
local bi=Vector2.new(1200,800)
pcall(function()bi=workspace.CurrentCamera.ViewportSize end)
local bj=bf or a9.Size.Y.Offset
if bj<1 then bj=120 end
local bk=bg.X+bh.X-aS-12
local bl=bg.Y+aU
if bl+bj>bi.Y-10 then
bl=math.max(10,bg.Y-bj-6)
end
a9.Position=UDim2.fromOffset(bk,bl)
end
local function openList()
if a7 then return end
a7=true
am.open(closeList)
at(a6,as.Fast,{Rotation=180})
a8=am.backdrop(e,closeList)
a9=Instance.new"Frame"
a9.Size=UDim2.new(0,aS,0,0)a9.BackgroundColor3=a2.Bg
a9.BorderSizePixel=0 aI(a9,8)a9.Parent=e
a9.ZIndex=am.Z.Popup a9.ClipsDescendants=true
aJ(a9,true)
an:_tag(a9,"BackgroundColor3","Bg")
bb=Instance.new"TextBox"bb.PlaceholderText="Filter..."
bb.PlaceholderColor3=a2.Dim bb.Text=""
bb.Font=Enum.Font.Gotham bb.TextSize=11
bb.Size=UDim2.new(1,-8,0,24)bb.Position=UDim2.new(0,4,0,4)
bb.BackgroundColor3=a2.Surface2 bb.BorderSizePixel=0
aI(bb,6)bb.Parent=a9
bb.ZIndex=am.Z.Popup+1
an:_tag(bb,"BackgroundColor3","Surface2")
an:_tag(bb,"TextColor3","Text")
ba=Instance.new"ScrollingFrame"
ba.BackgroundTransparency=1 ba.BorderSizePixel=0
ba.Position=UDim2.new(0,0,0,32)ba.Size=UDim2.new(1,0,1,-32)
ba.ScrollingDirection=Enum.ScrollingDirection.Y
ba.ScrollBarThickness=3 ba.CanvasSize=UDim2.new(0,0,0,0)
ba.ZIndex=am.Z.Popup ba.Parent=a9
ae.tag(ba,"ScrollBarImageColor3","Surface2")
renderItems""
local bf=a9.Size.Y.Offset
a9.Size=UDim2.new(0,aS,0,0)
placeList(bf)
at(a9,as.Med,{Size=UDim2.new(0,aS,0,bf)})
bc=bb:GetPropertyChangedSignal"Text":Connect(function()
if a7 then renderItems(bb.Text)end
end)
bd=aR.RenderStepped:Connect(function()
if not a7 then return end
if not _:IsDescendantOf(game)then closeList()return end
if a1._visible==false then closeList()return end
if a0.Page and a0.Page.Visible==false then closeList()return end
placeList()
end)
end
a4.MouseButton1Click:Connect(function()
an:_sfx"Click"
if a7 then closeList()else openList()end
end)
local bf={Title=aX.Title,Frame=_,Value=Q,Flag=aX.Flag,_handle=be,
_set=function(bf,bg)be:Set(bf,bg)end}
return a_(bf)
end end function a.K():typeof(__modImpl())local aa=a.cache.K if not aa then aa={c=__modImpl()}a.cache.K=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local am=
ab.T local an=
ab.tween local as=
ac.guid
local at=ac.spawnCb
local aE=ac.corner
local aI=ac.hairline local aJ=
ac.pad local aM=
ac.lighting local aN=
ac.ripple local aR=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local aS=ae.cloneref_check(game:GetService"UserInputService")

return function(aT,aU)
local aV=aT.row
local aW=aT.titleBlock
local aX=aT.reg
local aY=aT.tab local aZ=
aT.Window
local a_=aT.Th local a0=
aT.opts or{}
aU=aU or{}
local a1=aU.Mode or"Toggle"
local a2=aU.Value or aU.Default or Enum.KeyCode.F
if type(a2)=="string"then a2=Enum.KeyCode[a2]or Enum.KeyCode.F end
local a4=aV(aU.Description and 54 or 40)
aW(a4,aU.Title or"Keybind",aU.Description,130)
local a5=Instance.new"TextButton"a5.Font=Enum.Font.GothamBold a5.TextSize=11
a5.AnchorPoint=Vector2.new(1,0.5)a5.Position=UDim2.new(1,-12,0.5,0)
a5.Size=UDim2.new(0,92,0,28)a5.BackgroundColor3=a_.Surface2
a5.BorderSizePixel=0 aE(a5,7)a5.Text=a2.Name a5.Parent=a4
aI(a5,true)
af:_tag(a5,"BackgroundColor3","Surface2")
af:_tag(a5,"TextColor3","Text")
local a6,a7=false,false
local a8=aU.Locked==true
local function startRebind()
if a8 then return end
a6=true a5.Text="..."
end
a5.MouseButton1Click:Connect(startRebind)
aY._window:Track(aS.InputBegan:Connect(function(a9,b)
if a8 then return end
if a6 and a9.UserInputType==Enum.UserInputType.Keyboard then
a6=false a2=a9.KeyCode a5.Text=a2.Name
if aU.Flag then af.Flags[aU.Flag]=a2.Name end
at(aU.ChangedCallback,a2)at(aU.OnChanged,a2)
elseif not a6 and not b and a9.KeyCode==a2 then
if a1=="Hold"then a7=true end
at(aU.Callback,a2)
end
end))
aY._window:Track(aS.InputEnded:Connect(function(a9)
if a9.KeyCode==a2 then a7=false end
end))
local a9={
Set=function(a9,b)
if type(b)=="string"then b=Enum.KeyCode[b]or a2 end
a2,a5.Text=b,b.Name
end,
Get=function()return a2 end,
GetState=function()return a1=="Hold"and a7 or nil end,
Rebind=startRebind,
SetLocked=function(a9,b)
a8=b and true or false
a6=false
if not a8 then a5.Text=a2.Name end
ac.applyLock(a4,a8)
end,
GetLocked=function()return a8 end,
}

if aY._window and aY._window._keybinds then
table.insert(aY._window._keybinds,{
Title=aU.Title or"Keybind",
GetName=function()return a6 and"..."or a2.Name end,
Rebind=startRebind,
})
if aY._window._kbPanelRefresh then
task.defer(function()pcall(aY._window._kbPanelRefresh)end)
end
end
return aX{Title=aU.Title,Frame=a4,_handle=a9}
end end function a.L():typeof(__modImpl())local aa=a.cache.L if not aa then aa={c=__modImpl()}a.cache.L=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()
local af=a.d()

local at=aa
local aE=ab.T
local aI=ab.tween local aR=
ac.guid
local aS=ac.spawnCb
local aT=ac.corner
local aU=ac.hairline
local aV=ac.pad local aW=
ac.lighting local aX=
ac.ripple local aY=
ad.makeIcon
local a_=ae.cloneref_check(game:GetService"RunService")
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
local bm,bn,e=bl:ToHSV()
local f=bb.Transparency or 0
local g=bl
local Q=bc(bb.Description and 54 or 40)Q.ClipsDescendants=false
bd(Q,bb.Title or"Color",bb.Description,90)
local _=Instance.new"TextButton"_.Text=""
_.AnchorPoint=Vector2.new(1,0.5)_.Position=UDim2.new(1,-12,0.5,0)
_.Size=UDim2.fromOffset(56,26)_.BackgroundColor3=g
_.BorderSizePixel=0 aT(_,8)_.AutoButtonColor=false _.Parent=Q
aU(_,true)
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
return Color3.fromHSV(bm,bn,e)
end
local function colorsClose(bQ,bR)
if bQ==nil or bR==nil then return false end
return math.abs(bQ.R-bR.R)<0.001
and math.abs(bQ.G-bR.G)<0.001
and math.abs(bQ.B-bR.B)<0.001
end
local function syncFields()
if bw then
bw.Position=UDim2.new(bn,0,1-e,0)
bw.BackgroundColor3=currentColor()
end
if bx then
bx.Position=UDim2.new(0.5,0,bm,0)
bx.BackgroundColor3=Color3.fromHSV(bm,1,1)
end
if bt then bt.BackgroundColor3=Color3.fromHSV(bm,1,1)end
if bv then
bv.BackgroundColor3=currentColor()
if by then
by.Position=UDim2.new(0.5,0,1-f,0)
by.BackgroundColor3=currentColor()
by.BackgroundTransparency=f
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
bE.Text=tostring(math.floor((1-f)*100+0.5)).."%"
end
if bz then
bz.BackgroundColor3=bQ
bz.BackgroundTransparency=f
end
end
local function push(bQ)
g=currentColor()
aI(_,aE.Hover,{BackgroundColor3=g})
if bb.Flag then at.Flags[bb.Flag]={g.R,g.G,g.B}end
if not bQ then aS(bb.Callback,g,f)aS(bb.OnChanged,g,f)end
end
local function applyColor(bQ)
g=currentColor()
aI(_,aE.Hover,{BackgroundColor3=g})
if bb.Flag then at.Flags[bb.Flag]={g.R,g.G,g.B}end
syncFields()
if bQ then
local bR=currentColor()
if not colorsClose(bR,bO)then
bO=bR
aS(bb.Callback,bR,f)aS(bb.OnChanged,bR,f)
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
f=math.clamp(bS,0,1)
end
bm,bn,e=bR:ToHSV()
push(bT)
syncFields()
end
end
function bo.Get(bQ)return g,f end
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
aI(bQ,aE.Fast,{Size=UDim2.new(0,bQ.Size.X.Offset,0,0)})
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
bn=math.clamp((bQ.X-bR.X)/bS.X,0,1)
e=1-math.clamp((bQ.Y-bR.Y)/bS.Y,0,1)
applyColor(true)
end
local function updateHue(bQ)
if not bu or bu.AbsoluteSize.Y<=0 then return end
local bR,bS=bu.AbsolutePosition,bu.AbsoluteSize
bm=math.clamp((bQ.Y-bR.Y)/bS.Y,0,1)
applyColor(true)
end
local function updateAlpha(bQ)
if not bv or bv.AbsoluteSize.Y<=0 then return end
local bR,bS=bv.AbsolutePosition,bv.AbsoluteSize
f=1-math.clamp((bQ.Y-bR.Y)/bS.Y,0,1)
applyColor(true)
end
local function requestClose()
if bJ or bK or bL then return end
if os.clock()-bM<0.2 then return end
closePopup()
end



local function placePopup(bQ,bR)
if not bq then return end
local bS=Vector2.new(1200,800)
pcall(function()bS=workspace.CurrentCamera.ViewportSize end)
local bT=12
local bU=bg._main
if bU and bU.Parent and bU.AbsoluteSize.X>0 then
local bV,bW=bU.AbsolutePosition,bU.AbsoluteSize



local bX=bq.AbsoluteSize.Y
if bX<1 then bX=bR end
local bY=math.clamp(bV.Y+(bW.Y-bX)/2,10,math.max(10,bS.Y-bX-10))
local bZ=bV.X+bW.X+bT
if bZ+bQ>bS.X-10 then
bZ=bV.X-bQ-bT
if bZ<10 then
bZ=math.clamp(bV.X+bW.X/2-bQ/2,10,math.max(10,bS.X-bQ-10))
end
end



local b_=bg._popouts
if b_ then
for b0,b1 in ipairs(b_)do
local b2=b1.frame
if b2 and b2.Visible and b2.Parent then
local b3,b4=b2.AbsolutePosition,b2.AbsoluteSize
if b4.X>0 and bZ<b3.X+b4.X+bT and bZ+bQ>b3.X
and bY<b3.Y+b4.Y and bY+bX>b3.Y then
bZ=b3.X+b4.X+bT
bY=math.clamp(b3.Y,10,math.max(10,bS.Y-bX-10))
end
end
end
if bZ+bQ>bS.X-10 then
bZ=math.max(10,bS.X-bQ-10)
end
end
bq.Position=UDim2.fromOffset(bZ,bY)
return
end

if not Q.Parent then return end
local bV,bW=Q.AbsolutePosition,Q.AbsoluteSize
local bX=bV.X+bW.X-bQ-12
if bX<10 then bX=math.max(10,bV.X-bQ-8)end
local bY=bV.Y+46
if bY+bR>bS.Y-10 then bY=math.max(10,bV.Y-bR-6)end
bq.Position=UDim2.fromOffset(bX,bY)
end
local function openPopup()
if bp then return end
bp=true
bF,bG,bH=bm,bn,e
bI=f
bO=currentColor()
af.open(closePopup)
at:_sfx"Click"

local bQ=12
local bR=bQ+a4+a7
local bS=bR+a6+a7
local bT=bS+a6+a7
local bU=bT+a8+bQ
local bV=a9+a5+a7
local bW=bV+b+a7+22
local bX=bW+32+bQ
br=af.backdrop(bk,requestClose)
bq=Instance.new"Frame"
bq.Name=ae.GetStealthName()
bq.BackgroundColor3=bh.Bg
bq.BackgroundTransparency=1
bq.BorderSizePixel=0
bq.ClipsDescendants=true
bq.ZIndex=af.Z.Popup
bq.Size=UDim2.new(0,bU,0,0)
bq.Parent=bk
aT(bq,10)
aU(bq,true)
at:_tag(bq,"BackgroundColor3","Bg")
placePopup(bU,bX)
local bY=Instance.new"TextLabel"bY.BackgroundTransparency=1
bY.Position=UDim2.new(0,bQ,0,6)bY.Size=UDim2.new(1,-bQ*2,0,22)
bY.Font=Enum.Font.GothamBold bY.TextSize=14 bY.TextXAlignment=0
bY.TextTruncate=Enum.TextTruncate.AtEnd bY.Text=bb.Title or"Color"
bY.Parent=bq
bY.ZIndex=af.Z.Popup+1
at:_tag(bY,"TextColor3","Text")

bt=Instance.new"ImageLabel"
bt.Position=UDim2.new(0,bQ,0,a9)
bt.Size=UDim2.fromOffset(a4,a5)
bt.BackgroundColor3=Color3.fromHSV(bm,1,1)
bt.BackgroundTransparency=0
bt.Image=a1
bt.ScaleType=Enum.ScaleType.Stretch
bt.BorderSizePixel=0
bt.ClipsDescendants=true
bt.ZIndex=af.Z.Popup+1
bt.Parent=bq
aT(bt,8)
aU(bt,true)
bw=Instance.new"Frame"
bw.AnchorPoint=Vector2.new(0.5,0.5)
bw.Position=UDim2.new(bn,0,1-e,0)
bw.Size=UDim2.fromOffset(14,14)
bw.BackgroundColor3=currentColor()
bw.BorderSizePixel=0
bw.ZIndex=af.Z.Popup+3
bw.Parent=bt
aT(bw,99)
local bZ=Instance.new"UIStroke"bZ.Thickness=2
bZ.Color=Color3.fromRGB(255,255,255)bZ.Transparency=0.1
bZ.Parent=bw

bu=Instance.new"Frame"
bu.Position=UDim2.new(0,bR,0,a9)
bu.Size=UDim2.fromOffset(a6,a5+14)
bu.BackgroundColor3=Color3.fromRGB(255,255,255)
bu.BorderSizePixel=0
bu.ClipsDescendants=true
bu.ZIndex=af.Z.Popup+1
bu.Parent=bq
aT(bu,3)
local b_=Instance.new"UIGradient"b_.Rotation=90
b_.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),
ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1)),
}
b_.Parent=bu
bx=Instance.new"Frame"
bx.AnchorPoint=Vector2.new(0.5,0.5)
bx.Position=UDim2.new(0.5,0,bm,0)
bx.Size=UDim2.fromOffset(14,14)
bx.BackgroundColor3=Color3.fromHSV(bm,1,1)
bx.BorderSizePixel=0
bx.ZIndex=af.Z.Popup+3
bx.Parent=bu
aT(bx,99)
local b0=Instance.new"UIStroke"b0.Thickness=2
b0.Color=Color3.fromRGB(255,255,255)b0.Transparency=0.1
b0.Parent=bx

bv=Instance.new"Frame"
bv.Position=UDim2.new(0,bS,0,a9)
bv.Size=UDim2.fromOffset(a6,a5+14)
bv.BackgroundColor3=currentColor()
bv.BorderSizePixel=0
bv.ClipsDescendants=true
bv.ZIndex=af.Z.Popup+1
bv.Parent=bq
aT(bv,3)
aU(bv,true)
local b1=Instance.new"ImageLabel"
b1.Image=a2
b1.ImageTransparency=0.45
b1.ScaleType=Enum.ScaleType.Tile
b1.TileSize=UDim2.fromOffset(40,40)
b1.BackgroundTransparency=1
b1.Size=UDim2.fromScale(1,1)
b1.ZIndex=af.Z.Popup+1
b1.Parent=bv
aT(b1,3)
local b2=Instance.new"Frame"
b2.Size=UDim2.fromScale(1,1)
b2.BackgroundColor3=Color3.fromRGB(255,255,255)
b2.BorderSizePixel=0
b2.ZIndex=af.Z.Popup+2
b2.Parent=bv
aT(b2,3)
local b3=Instance.new"UIGradient"b3.Rotation=90
b3.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
b3.Parent=b2
by=Instance.new"Frame"
by.AnchorPoint=Vector2.new(0.5,0.5)
by.Position=UDim2.new(0.5,0,1-f,0)
by.Size=UDim2.fromOffset(14,14)
by.BackgroundColor3=currentColor()
by.BackgroundTransparency=f
by.BorderSizePixel=0
by.ZIndex=af.Z.Popup+3
by.Parent=bv
aT(by,99)

local b4=(a4-a7)/2
local function checkerSw(b5)
local b6=Instance.new"ImageLabel"
b6.Image=a2
b6.ImageTransparency=0.45
b6.ScaleType=Enum.ScaleType.Tile
b6.TileSize=UDim2.fromOffset(40,40)
b6.BackgroundTransparency=1
b6.Position=UDim2.new(0,b5,0,bV)
b6.Size=UDim2.fromOffset(b4,b)
b6.ZIndex=af.Z.Popup+1
b6.Parent=bq
aT(b6,8)
aU(b6,true)
return b6
end
local b5=checkerSw(bQ)
bz=Instance.new"Frame"
bz.BackgroundColor3=currentColor()
bz.BackgroundTransparency=f
bz.Size=UDim2.fromScale(1,1)
bz.ZIndex=af.Z.Popup+2
bz.Parent=b5
aT(bz,8)
local b6=checkerSw(bQ+b4+a7)
local b7=Instance.new"Frame"
b7.BackgroundColor3=Color3.fromHSV(bF or bm,bG or bn,bH or e)
b7.BackgroundTransparency=(bI==nil)and f or bI
b7.Size=UDim2.fromScale(1,1)
b7.ZIndex=af.Z.Popup+2
b7.Parent=b6
aT(b7,8)

local b8=bT
local function makeInput(b9,ca,cb)
local cc=Instance.new"Frame"
cc.BackgroundTransparency=1
cc.Position=UDim2.new(0,b8,0,cb)
cc.Size=UDim2.new(0,a8,0,36)
cc.ZIndex=af.Z.Popup+1
cc.Parent=bq
local cd=Instance.new"TextLabel"
cd.BackgroundTransparency=1
cd.Font=Enum.Font.Gotham cd.TextSize=11
cd.TextXAlignment=0 cd.Text=b9
cd.Size=UDim2.new(1,0,0,12)
cd.ZIndex=af.Z.Popup+2
cd.Parent=cc
at:_tag(cd,"TextColor3","Dim")
local ce=Instance.new"Frame"
ce.Position=UDim2.new(0,0,0,12)
ce.Size=UDim2.new(1,0,0,24)
ce.BackgroundColor3=bh.Surface2
ce.BackgroundTransparency=0
ce.BorderSizePixel=0
ce.ZIndex=af.Z.Popup+2
ce.Parent=cc
aT(ce,7)
aU(ce,true)
at:_tag(ce,"BackgroundColor3","Surface2")
local cf=Instance.new"TextBox"
cf.ClearTextOnFocus=false
cf.Font=Enum.Font.Code cf.TextSize=13
cf.TextXAlignment=1 cf.TextYAlignment=1
cf.Text=ca
cf.BackgroundTransparency=1
cf.Size=UDim2.fromScale(1,1)
cf.ZIndex=af.Z.Popup+3
cf.Parent=ce
at:_tag(cf,"TextColor3","Text")
aV(cf,0,0,0,8)
return cc,cf
end
local b9=currentColor()
local ca=math.floor(b9.R*255+0.5)
local cb=math.floor(b9.G*255+0.5)
local cc=math.floor(b9.B*255+0.5)
local cd=a9
local ce=4 local
cf, cg=makeInput("Hex","#"..b9:ToHex():upper(),cd)
bA=cg
cd+=36+ce local
ch, ci=makeInput("Red",tostring(ca),cd)
bB=ci
cd+=36+ce local
cj, ck=makeInput("Green",tostring(cb),cd)
bC=ck
cd+=36+ce local
cl, cm=makeInput("Blue",tostring(cc),cd)
bD=cm
cd+=36+ce local
cn, co=makeInput("Alpha",tostring(math.floor((1-f)*100+0.5)).."%",cd)
bE=co


local cp=bU-bQ*2
local cq=(cp-6)/2
local cr=32
local function makeBtn(cs,ct,cu,cv)
local cw=Instance.new"TextButton"
cw.Position=UDim2.new(0,ct,0,bW)
cw.Size=UDim2.fromOffset(cu,cr)
cw.Text=""
cw.AutoButtonColor=false
cw.BorderSizePixel=0
cw.ZIndex=af.Z.Popup+2
cw.BackgroundColor3=bh.Surface2
aU(cw,true)
at:_tag(cw,"BackgroundColor3","Surface2")
cw.Parent=bq
aT(cw,9)
local cx=Instance.new"TextLabel"
cx.BackgroundTransparency=1 cx.Size=UDim2.fromScale(1,1)
cx.Font=Enum.Font.GothamBold cx.TextSize=12
cx.Text=string.upper(cs)cx.Parent=cw
cx.ZIndex=af.Z.Popup+3
if cv then at:_tag(cx,"TextColor3","Accent")
else at:_tag(cx,"TextColor3","Text")end
return cw,cx
end
local cs=makeBtn("Cancel",bQ,cq,false)
local ct=makeBtn("Apply",bQ+cq+6,cq,true)
cs.MouseButton1Click:Connect(function()
bm,bn,e=bF,bG,bH
f=bI
applyColor(true)
closePopup()
end)
ct.MouseButton1Click:Connect(function()
at:_sfx"Click"
closePopup()
end)

bt.InputBegan:Connect(function(cu)
if cu.UserInputType==Enum.UserInputType.MouseButton1
or cu.UserInputType==Enum.UserInputType.Touch then
if bJ or bK or bL then return end
bJ=true
bN=cu
updateSV(cu.Position)
end
end)
bu.InputBegan:Connect(function(cu)
if cu.UserInputType==Enum.UserInputType.MouseButton1
or cu.UserInputType==Enum.UserInputType.Touch then
if bJ or bK or bL then return end
bK=true
bN=cu
updateHue(cu.Position)
end
end)
bv.InputBegan:Connect(function(cu)
if cu.UserInputType==Enum.UserInputType.MouseButton1
or cu.UserInputType==Enum.UserInputType.Touch then
if bJ or bK or bL then return end
bL=true
bN=cu
updateAlpha(cu.Position)
end
end)
table.insert(bP,a0.InputChanged:Connect(function(cu)
if not bq then return end
if cu~=bN
and not(bN and bN.UserInputType==Enum.UserInputType.MouseButton1
and cu.UserInputType==Enum.UserInputType.MouseMovement)then
return
end
if bJ then updateSV(cu.Position)end
if bK then updateHue(cu.Position)end
if bL then updateAlpha(cu.Position)end
end))
table.insert(bP,a0.InputEnded:Connect(function(cu)
if cu==bN
or(bN and bN.UserInputType==Enum.UserInputType.MouseButton1
and cu.UserInputType==Enum.UserInputType.MouseButton1)then
if bJ or bK or bL then
bM=os.clock()
end
bJ,bK,bL=false,false,false
bN=nil
end
end))
bA:GetPropertyChangedSignal"Text":Connect(function()
if not bq then return end
local cu=bA.Text:gsub("[^%x]","")
cu=cu:sub(1,6)
if cu~=bA.Text then bA.Text=cu end
end)
bA.FocusLost:Connect(function()
if not bq then return end
local cu=bA.Text:gsub("#","")
if#cu==3 then
cu=cu:sub(1,1):rep(2)..cu:sub(2,2):rep(2)..cu:sub(3,3):rep(2)
end
if#cu==6 then
local cv,cw=pcall(Color3.fromHex,cu)
if cv and cw then
bm,bn,e=cw:ToHSV()
applyColor(true)
return
end
end
syncFields()
end)
local function filterDigits(cu)
cu:GetPropertyChangedSignal"Text":Connect(function()
if not bq then return end
local cv=cu.Text:gsub("%D",""):sub(1,3)
if cv~=cu.Text then cu.Text=cv end
end)
end
filterDigits(bB)filterDigits(bC)filterDigits(bD)
local function onRGBCommit()
if not bq then return end
local cu=math.clamp(tonumber(bB.Text)or 0,0,255)
local cv=math.clamp(tonumber(bC.Text)or 0,0,255)
local cw=math.clamp(tonumber(bD.Text)or 0,0,255)
bm,bn,e=Color3.toHSV(Color3.fromRGB(cu,cv,cw))
applyColor(true)
end
bB.FocusLost:Connect(onRGBCommit)
bC.FocusLost:Connect(onRGBCommit)
bD.FocusLost:Connect(onRGBCommit)
bE.FocusLost:Connect(function()
if not bq then return end
local cu=bE.Text:gsub("%%","")
local cv=math.clamp(tonumber(cu)or 0,0,100)
f=1-cv/100
applyColor(true)
end)
syncFields()
aI(bq,TweenInfo.new(0.44,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Size=UDim2.new(0,bU,0,bX),BackgroundTransparency=0})
bs=a_.RenderStepped:Connect(function()
if not bp then return end
if not Q:IsDescendantOf(game)then closePopup()return end
if bg._visible==false then closePopup()return end
if bf.Page and bf.Page.Visible==false then closePopup()return end
placePopup(bU,bX)
end)
end
_.MouseButton1Click:Connect(function()
if bp then closePopup()else openPopup()end
end)
local bQ={Title=bb.Title,Frame=Q,Value=g,Flag=bb.Flag,_handle=bo,
_set=function(bQ,bR)bo:Set(bQ,bR)end}
return be(bQ)
end end function a.M():typeof(__modImpl())local aa=a.cache.M if not aa then aa={c=__modImpl()}a.cache.M=aa end return aa.c end end do local function __modImpl()



local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local at=
ab.T local aE=
ab.tween local aI=
ac.guid local aS=
ac.spawnCb
local aT=ac.corner
local aU=ac.hairline
local aV=ac.pad local aY=
ac.lighting local a_=
ac.ripple
local a0=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a1,a2)
local a4=a1.row local a5=
a1.titleBlock
local a6=a1.reg
local a7=a1.tab local a8=
a1.Window
local a9=a1.Th local b=
a1.opts or{}
a2=a2 or{}
local ba=a7._window
local bb=a4(196)
local bc=Instance.new"TextLabel"bc.BackgroundTransparency=1
bc.Position=UDim2.new(0,12,0,6)bc.Size=UDim2.new(1,-24,0,17)
bc.Font=Enum.Font.GothamMedium bc.TextSize=13 bc.TextXAlignment=0
bc.Text=a2.Title or"Profiles"bc.Parent=bb
af:_tag(bc,"TextColor3","Text")
local bd=Instance.new"TextBox"bd.PlaceholderText="Profile name..."
bd.PlaceholderColor3=a9.Dim bd.Text="default"
bd.Font=Enum.Font.Gotham bd.TextSize=12
bd.Position=UDim2.new(0,12,0,28)bd.Size=UDim2.new(1,-94,0,28)
bd.BackgroundColor3=a9.Surface2 bd.BorderSizePixel=0
aT(bd,7)bd.Parent=bb
aV(bd,4,4,8,8)
aU(bd,true)
af:_tag(bd,"BackgroundColor3","Surface2")
af:_tag(bd,"TextColor3","Text")
local be=Instance.new"TextButton"be.Text=""
be.AnchorPoint=Vector2.new(1,0)be.Position=UDim2.new(1,-12,0,28)
be.Size=UDim2.new(0,70,0,28)be.BorderSizePixel=0
aT(be,7)be.AutoButtonColor=false be.Parent=bb
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
bm.Size=UDim2.new(1,-2,0,28)bm.BackgroundColor3=a9.Surface2
bm.BackgroundTransparency=0.35 bm.BorderSizePixel=0
aT(bm,7)bm.Parent=bg
af:_tag(bm,"BackgroundColor3","Surface2")
local bn=Instance.new"TextLabel"bn.BackgroundTransparency=1
bn.Position=UDim2.new(0,8,0,0)bn.Size=UDim2.new(1,-44,1,0)
bn.Font=Enum.Font.Gotham bn.TextSize=12 bn.TextXAlignment=0
bn.TextTruncate=Enum.TextTruncate.AtEnd bn.Text=bl bn.Parent=bm
af:_tag(bn,"TextColor3","Text")
local bo=Instance.new"TextButton"bo.Text=""
bo.AnchorPoint=Vector2.new(1,0.5)bo.Position=UDim2.new(1,-6,0.5,0)
bo.Size=UDim2.fromOffset(22,22)bo.BackgroundTransparency=1 bo.Parent=bm
local bp=a0("x",11,a9.Dim)
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
return a6{Title=a2.Title or"Profiles",Frame=bb,_handle={Refresh=refresh}}
end end function a.N():typeof(__modImpl())local aa=a.cache.N if not aa then aa={c=__modImpl()}a.cache.N=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local aT=ab.T
local aU=ab.tween local aV=
ac.guid
local a_=ac.spawnCb
local a0=ac.corner
local a1=ac.hairline local a2=
ac.pad
local a4=ac.lighting
local a6=ac.ripple
local a7=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(a9,b)local ba=
a9.row local bb=
a9.titleBlock
local bc=a9.reg
local bd=a9.tab local be=
a9.Window
local bf=a9.Th local bg=
a9.opts or{}
b=b or{}
local bh=Instance.new"Frame"bh.Size=UDim2.new(1,-4,0,96)
bh.BackgroundColor3=bf.Surface2 bh.BorderSizePixel=0
a0(bh,10)bh.Parent=a9.getParent()
a1(bh,true)
af:_tag(bh,"BackgroundColor3","Surface2")
a4(bh,10)

local bj=Instance.new"Frame"bj.BorderSizePixel=0
bj.Position=UDim2.new(0,0,0,18)bj.Size=UDim2.new(0,3,1,-36)
a0(bj,99)bj.Parent=bh
af:_tag(bj,"BackgroundColor3","Accent")
local bk=a7(b.Icon or"bellring",18,bf.Accent)
bk.AnchorPoint=Vector2.new(0,0.5)bk.Position=UDim2.new(0,14,0,48)
bk.Parent=bh
if bk:IsA"TextLabel"then bk.Size=UDim2.new(0,18,0,18)end

local bl=b.Button and-142 or-54
local bm=Instance.new"TextLabel"bm.BackgroundTransparency=1
bm.Position=UDim2.new(0,42,0,16)bm.Size=UDim2.new(1,bl,0,18)
bm.Font=Enum.Font.GothamBold bm.TextSize=14 bm.TextXAlignment=0
bm.TextTruncate=Enum.TextTruncate.AtEnd bm.Text=b.Title or"News"bm.Parent=bh
af:_tag(bm,"TextColor3","Text")
local bn=Instance.new"TextLabel"bn.BackgroundTransparency=1
bn.Position=UDim2.new(0,42,0,38)bn.Size=UDim2.new(1,bl,0,42)
bn.Font=Enum.Font.Gotham bn.TextSize=12 bm.TextXAlignment=0
bn.TextXAlignment=0 bn.TextYAlignment=0 bn.TextWrapped=true
bn.TextTruncate=Enum.TextTruncate.AtEnd bn.Text=b.Content or""bn.Parent=bh
af:_tag(bn,"TextColor3","Dim")
if b.Button then
local bo=Instance.new"TextButton"bo.Text=""
bo.AnchorPoint=Vector2.new(1,0.5)bo.Position=UDim2.new(1,-12,0,48)
bo.Size=UDim2.new(0,76,0,30)bo.BorderSizePixel=0
a0(bo,7)bo.AutoButtonColor=false bo.Parent=bh
af:agrad(bo,15)
local bp=Instance.new"TextLabel"bp.BackgroundTransparency=1
bp.Size=UDim2.fromScale(1,1)bp.Font=Enum.Font.GothamBold
bp.TextSize=11
bp.Text=string.upper(b.Button)bp.Parent=bo
af:oa(bp)
a6(bo)
bo.MouseButton1Click:Connect(function()
af:_sfx"Click"a_(b.Callback)
end)
end
bh.BackgroundTransparency=1
task.delay(#bd.Elements*0.025,function()
aU(bh,aT.Med,{BackgroundTransparency=0})
end)
return bc{Title=b.Title,Frame=bh,_handle=bh}
end end function a.O():typeof(__modImpl())local aa=a.cache.O if not aa then aa={c=__modImpl()}a.cache.O=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local aT=
ab.T local aU=
ab.tween local a_=
ac.guid local a0=
ac.spawnCb
local a1=ac.corner
local a2=ac.hairline local a4=
ac.pad
local a6=ac.lighting local a7=
ac.ripple local a9=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(b,bc)local bd=
b.row local bf=
b.titleBlock
local bg=b.reg local bh=
b.tab local bj=
b.Window
local bk=b.Th local bl=
b.opts or{}
bc=bc or{}
local bm=bc.Stats or bc.Items or{}
local bn=math.max(1,#bm)
local bo=Instance.new"Frame"bo.BackgroundTransparency=1
bo.Size=UDim2.new(1,-4,0,64)bo.Parent=b.getParent()
local bp=Instance.new"UIListLayout"bp.FillDirection=Enum.FillDirection.Horizontal
bp.Padding=UDim.new(0,8)bp.SortOrder=Enum.SortOrder.LayoutOrder bp.Parent=bo
local bq={}
for br,bs in ipairs(bm)do
local bt=Instance.new"Frame"
bt.Size=UDim2.new(1/bn,-8,1,0)
bt.BackgroundColor3=bk.Surface bt.BorderSizePixel=0
a1(bt,10)bt.LayoutOrder=br bt.Parent=bo
a2(bt,true)
af:_tag(bt,"BackgroundColor3","Surface")
a6(bt,10)
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
end end function a.P():typeof(__modImpl())local aa=a.cache.P if not aa then aa={c=__modImpl()}a.cache.P=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local a1=
ab.T local a2=
ab.tween local a6=
ac.guid local a9=
ac.spawnCb
local b=ac.corner local bc=
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
bz.BackgroundColor3=bu.Surface2 b(bz,6)bz.Parent=bx
af:_tag(bz,"BackgroundColor3","Surface2")
local bA=Instance.new"Frame"bA.Name="_sheen"bA.BorderSizePixel=0
bA.Size=UDim2.new(0.35,0,1,0)bA.BackgroundColor3=Color3.fromRGB(255,255,255)
bA.BackgroundTransparency=0.88 b(bA,6)bA.Parent=bz
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
end end function a.Q():typeof(__modImpl())local aa=a.cache.Q if not aa then aa={c=__modImpl()}a.cache.Q=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local b=
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
end end function a.R():typeof(__modImpl())local aa=a.cache.R if not aa then aa={c=__modImpl()}a.cache.R=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


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
end end function a.S():typeof(__modImpl())local aa=a.cache.S if not aa then aa={c=__modImpl()}a.cache.S=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


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
end end function a.T():typeof(__modImpl())local aa=a.cache.T if not aa then aa={c=__modImpl()}a.cache.T=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


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
local ca=b2.Cards or{}
local cb=math.clamp(b2.Columns or 2,1,3)
local cc=Instance.new"Frame"cc.BackgroundTransparency=1
cc.Size=UDim2.new(1,-4,0,0)cc.AutomaticSize=Enum.AutomaticSize.Y
cc.Parent=b1.getParent()
local cd=Instance.new"UIListLayout"cd.Padding=UDim.new(0,8)
cd.SortOrder=Enum.SortOrder.LayoutOrder cd.Parent=cc




local ce,cg=0
for ci,ck in ipairs(ca)do
if(ci-1)%cb==0 then
cg=Instance.new"Frame"cg.BackgroundTransparency=1
cg.Size=UDim2.new(1,0,0,68)cg.AutomaticSize=Enum.AutomaticSize.Y
cg.Parent=cc
local cm=Instance.new"UIListLayout"cm.FillDirection=Enum.FillDirection.Horizontal
cm.Padding=UDim.new(0,8)cm.SortOrder=Enum.SortOrder.LayoutOrder cm.Parent=cg
ce+=1
end
local cm=false
local cn=Instance.new"Frame"
cn.Size=UDim2.new(1/cb,-8+8/cb,0,68)
cn.BackgroundColor3=b8.Surface cn.BorderSizePixel=0
bS(cn,10)cn.LayoutOrder=ci cn.Parent=cg
bU(cn,true)
af:_tag(cn,"BackgroundColor3","Surface")
bW(cn,10)


local co=Instance.new"TextButton"co.Text=""
co.Size=UDim2.fromScale(1,1)co.BackgroundTransparency=1 co.Parent=cn
local cp=b_(ck.Icon or"box",16,b8.Dim)
cp.Position=UDim2.new(0,10,0,10)cp.Parent=cn
if cp:IsA"TextLabel"then cp.Size=UDim2.new(0,16,0,16)end
local cq=Instance.new"TextLabel"cq.BackgroundTransparency=1
cq.Position=UDim2.new(0,34,0,8)cq.Size=UDim2.new(1,-42,0,18)
cq.Font=Enum.Font.GothamBold cq.TextSize=13 cq.TextXAlignment=0
cq.TextTruncate=Enum.TextTruncate.AtEnd cq.Text=ck.Title or"Script"cq.Parent=cn
af:_tag(cq,"TextColor3","Text")
local cr=Instance.new"TextLabel"cr.BackgroundTransparency=1
cr.Position=UDim2.new(0,10,0,30)cr.Size=UDim2.new(1,-20,0,28)
cr.Font=Enum.Font.Gotham cr.TextSize=11
cr.TextXAlignment=0 cr.TextYAlignment=0
cr.TextWrapped=true cr.TextTruncate=Enum.TextTruncate.AtEnd
cr.Text=ck.Desc or""cr.Visible=false cr.Parent=cn
af:_tag(cr,"TextColor3","Dim")
local cs=Instance.new"TextButton"cs.Text=""
cs.AnchorPoint=Vector2.new(0,1)cs.Position=UDim2.new(0,10,1,-10)
cs.Size=UDim2.new(1,-20,0,28)cs.BorderSizePixel=0
bS(cs,7)cs.AutoButtonColor=false cs.Visible=false cs.Parent=cn
af:agrad(cs,15)
local ct=Instance.new"TextLabel"ct.BackgroundTransparency=1
ct.Size=UDim2.fromScale(1,1)ct.Font=Enum.Font.GothamBold
ct.TextSize=11
ct.Text="LAUNCH"ct.Parent=cs
af:oa(ct)
co.MouseButton1Click:Connect(function()
cm=not cm
af:_sfx"Click"
bI(cn,bH.Med,{Size=UDim2.new(1/cb,-8+8/cb,0,cm and 118 or 68)})
cr.Visible,cs.Visible=cm,cm
end)
cs.MouseButton1Click:Connect(function()
af:_sfx"Click"bQ(ck.Callback)
end)
end
return b5{Title=b2.Title or"Scripts",Frame=cc,_handle=cc}
end end function a.U():typeof(__modImpl())local aa=a.cache.U if not aa then aa={c=__modImpl()}a.cache.U=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


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
b5.row local ca=
b5.titleBlock
local cb=b5.reg local cc=
b5.tab local cd=
b5.Window
local ce=b5.Th local cg=
b5.opts or{}
b8=b8 or{}
local ci=b8.Limit or 5
local ck=Instance.new"Frame"ck.BackgroundTransparency=1
ck.Size=UDim2.new(1,-4,0,0)ck.AutomaticSize=Enum.AutomaticSize.Y
ck.Parent=b5.getParent()
local cm=Instance.new"UIListLayout"cm.Padding=UDim.new(0,4)
cm.SortOrder=Enum.SortOrder.LayoutOrder cm.Parent=ck
local function refresh()
for cn,co in ipairs(ck:GetChildren())do
if co:IsA"TextButton"then pcall(function()co:Destroy()end)end
end
local cn=af._recent or{}
if#cn==0 then
local co=Instance.new"TextLabel"co.BackgroundTransparency=1
co.Size=UDim2.new(1,0,0,24)co.Font=Enum.Font.Gotham
co.TextSize=11 co.Text="Use any control and it lands here."co.Parent=ck
af:_tag(co,"TextColor3","Dim")
return
end
for co=1,math.min(ci,#cn)do
local cp=cn[co]
local cq=Instance.new"TextButton"cq.Text=""
cq.Size=UDim2.new(1,0,0,30)cq.BackgroundColor3=ce.Surface
cq.BackgroundTransparency=0.35 cq.BorderSizePixel=0
bU(cq,7)cq.Parent=ck
af:_tag(cq,"BackgroundColor3","Surface")
local cr=Instance.new"TextLabel"cr.BackgroundTransparency=1
cr.Position=UDim2.new(0,10,0,0)cr.Size=UDim2.new(1,-90,1,0)
cr.Font=Enum.Font.Gotham cr.TextSize=12 cr.TextXAlignment=0
cr.TextTruncate=Enum.TextTruncate.AtEnd cr.Text=cp.label cr.Parent=cq
af:_tag(cr,"TextColor3","Text")
local cs=Instance.new"TextLabel"cs.BackgroundTransparency=1
cs.AnchorPoint=Vector2.new(1,0)cs.Position=UDim2.new(1,-10,0,0)
cs.Size=UDim2.new(0,74,1,0)cs.Font=Enum.Font.Gotham
cs.TextSize=10 cs.TextXAlignment=1 cs.Text=cp.tab cs.Parent=cq
af:_tag(cs,"TextColor3","Dim")
cq.MouseButton1Click:Connect(function()
if cp.go then af:_sfx"Click"pcall(cp.go)end
end)
end
end
af._recentRefresh=af._recentRefresh or{}
table.insert(af._recentRefresh,refresh)
refresh()
return cb{Title=b8.Title or"Recent",Frame=ck,_handle={Refresh=refresh}}
end end function a.V():typeof(__modImpl())local aa=a.cache.V if not aa then aa={c=__modImpl()}a.cache.V=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local b5=
ac.guid local b8=
ac.spawnCb
local cb=ac.corner local ce=
ac.hairline local cg=
ac.pad local ci=
ac.lighting local ck=
ac.ripple local cm=
ad.makeIcon
local cn=ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local co=ae.cloneref_check(game:GetService"Players")

local cp={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(cq,cr)
local cs=cq.row local ct=
cq.titleBlock
local cu=cq.reg
local cv=cq.tab local cw=
cq.Window
local cx=cq.Th local e=
cq.opts or{}local f=
cq.page
cr=cr or{}
local g=cr.Accent or cr.Color or cx.Accent
if type(g)=="table"then
g=Color3.new(g[1]or 0,g[2]or 0,g[3]or 0)
end
local Q=tostring(cr.Mode or"Chams")
if not cp[Q]then Q="Chams"end
local _,cy,cz,cA=true,true,false,100
local cB
pcall(function()cB=co.LocalPlayer end)
local cC=cr.Name or((cB and cB.DisplayName)or"Noob")
local cD=(cB and("@"..cB.Name))or""
local cE=cs(170)
local cF=Instance.new"TextLabel"cF.BackgroundTransparency=1
cF.Position=UDim2.new(0,12,0,6)cF.Size=UDim2.new(1,-24,0,16)
cF.Font=Enum.Font.GothamMedium cF.TextSize=12 cF.TextXAlignment=0
cF.TextTruncate=Enum.TextTruncate.AtEnd cF.Text=cr.Title or"Rig Preview"cF.Parent=cE
af:_tag(cF,"TextColor3","Text")
local cG=Instance.new"ViewportFrame"
cG.Position=UDim2.new(0,10,0,26)cG.Size=UDim2.new(1,-20,1,-34)
cG.BackgroundColor3=cx.Bg cG.BorderSizePixel=0
cG.LightColor=Color3.fromRGB(255,255,255)
cG.LightDirection=Vector3.new(-0.5,-1,-0.6)
cG.Ambient=Color3.fromRGB(150,150,168)
cb(cG,8)cG.Parent=cE
af:_tag(cG,"BackgroundColor3","Bg")
local cH=Instance.new"Frame"cH.BackgroundTransparency=1
cH.Size=UDim2.fromScale(1,1)cH.Parent=cG
local cI={}
local function bracket(cJ,cK)
local cL=Instance.new"Frame"cL.BorderSizePixel=0
cL.AnchorPoint=Vector2.new(cJ,cK)cL.Position=UDim2.new(cJ,0,cK,0)
cL.Size=UDim2.new(0,12,0,2)cL.Parent=cH
af:_tag(cL,"BackgroundColor3","Accent")
local cM=Instance.new"Frame"cM.BorderSizePixel=0
cM.AnchorPoint=Vector2.new(cJ,cK)cM.Position=UDim2.new(cJ,0,cK,0)
cM.Size=UDim2.new(0,2,0,12)cM.Parent=cH
af:_tag(cM,"BackgroundColor3","Accent")
table.insert(cI,cL)table.insert(cI,cM)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local cJ=Instance.new"TextLabel"cJ.BackgroundTransparency=1
cJ.AnchorPoint=Vector2.new(0.5,0)cJ.Position=UDim2.new(0.5,0,0,4)
cJ.Size=UDim2.new(1,-16,0,14)cJ.Font=Enum.Font.GothamBold
cJ.TextSize=11 cJ.Text=cC cJ.Parent=cH
af:_tag(cJ,"TextColor3","Text")
local cK=Instance.new"TextLabel"cK.BackgroundTransparency=1
cK.AnchorPoint=Vector2.new(0.5,0)cK.Position=UDim2.new(0.5,0,0,18)
cK.Size=UDim2.new(1,-16,0,11)cK.Font=Enum.Font.Gotham
cK.TextSize=10 cK.Text=cD cK.Parent=cH
af:_tag(cK,"TextColor3","Dim")
local cL=Instance.new"Frame"cL.BorderSizePixel=0
cL.AnchorPoint=Vector2.new(0,0.5)cL.Position=UDim2.new(0,6,0.5,0)
cL.Size=UDim2.new(0,4,1,-30)cL.BackgroundColor3=cx.Surface2
cb(cL,99)cL.Parent=cH
af:_tag(cL,"BackgroundColor3","Surface2")
local cM=Instance.new"Frame"cM.BorderSizePixel=0
cM.AnchorPoint=Vector2.new(0,1)cM.Position=UDim2.new(0,0,1,0)
cM.Size=UDim2.new(1,0,1,0)cM.BackgroundColor3=cx.Success
cb(cM,99)cM.Parent=cL
af:_tag(cM,"BackgroundColor3","Success")
local cN=Instance.new"WorldModel"cN.Parent=cG
local cO=Instance.new"Camera"cO.Parent=cG
cG.CurrentCamera=cO

cO.CFrame=CFrame.new(Vector3.new(0,2.9,7),Vector3.new(0,2.3,0))
local cP,cQ={},{}
local function part(cR,cS,cT)
local cU=Instance.new"Part"cU.Name=cR
cU.Size=cS cU.Position=cT cU.Anchored=true cU.CanCollide=false
cU.TopSurface=Enum.SurfaceType.Smooth
cU.BottomSurface=Enum.SurfaceType.Smooth
cU.Color=Color3.fromRGB(200,200,215)
cU.Material=Enum.Material.Plastic
cU.Parent=cN
table.insert(cP,cU)
local cV=Instance.new"SelectionBox"
cV.Adornee=cU cV.LineThickness=0.05
cV.Color3=Color3.fromRGB(255,255,255)
cV.SurfaceTransparency=1 cV.Visible=false
cV.Parent=cU
cQ[cU]=cV
return cU
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local cR={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local cS={}
local function paint()
for cT,cU in ipairs(cP)do
if cU and cU.Parent then
if Q=="Noob"then
cU.Color=cR[cU.Name]or Color3.fromRGB(200,200,215)
cU.Material=Enum.Material.Plastic
cU.Transparency=0
elseif Q=="Ghost"then
cU.Color=g
cU.Material=Enum.Material.ForceField
cU.Transparency=0
elseif Q=="Solid"or Q=="Box"then
cU.Color=Color3.fromRGB(200,200,215)
cU.Material=Enum.Material.Plastic
cU.Transparency=0
else
cU.Color=g
cU.Material=Enum.Material.Plastic
cU.Transparency=0
end
local cV=cQ[cU]
if cV then
cV.Visible=cz or Q=="Outline"
cV.Color3=g
end
end
end
for cT,cU in ipairs(cI)do
if cU then cU.Visible=_ or Q=="Box"end
end
cJ.Visible=cy or Q=="Name"
cK.Visible=cJ.Visible
cL.Visible=_ or Q=="HP bar"
end
function cS.SetAccent(cT,cU)
if type(cU)=="table"then
cU=Color3.new(cU[1]or 0,cU[2]or 0,cU[3]or 0)
end
if typeof(cU)=="Color3"then g=cU paint()end
end
function cS.SetMode(cT,cU)Q=tostring(cU)if not cp[Q]then Q="Chams"end paint()end
function cS.SetBox(cT,cU)_=cU and true or false paint()end
function cS.SetOutline(cT,cU)cz=cU and true or false paint()end
function cS.SetName(cT,cU)cy=cU and true or false paint()end
function cS.SetHealth(cT,cU)
cA=math.clamp(tonumber(cU)or 100,0,100)
b2(cM,bU.Fast,{Size=UDim2.new(1,0,cA/100,0)})
end
function cS.Get(cT)return g end
paint()
local cT=0
local cU={}
for cV,cW in ipairs(cP)do cU[cW]=cW.Position end
local cV
cV=cn.RenderStepped:Connect(function(cW)
if not cG.Parent then pcall(function()cV:Disconnect()end)return end
if not cE:IsDescendantOf(game)then return end
cT+=cW
local cX=math.sin(cT*2.2)*0.045
for cY,cZ in ipairs(cP)do
if cZ and cZ.Parent and cU[cZ]then
cZ.Position=cU[cZ]+Vector3.new(0,cX,0)
end
end
end)
cv._window:Track(cV)
aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(cW,cX)
local cY=cW
if type(cY)=="table"then
cY=Color3.new(cY[1]or 0,cY[2]or 0,cY[3]or 0)
end
if typeof(cY)=="Color3"then g=cY paint()end
end)
if aa.Flags.ESPColor~=nil then
local cW=aa.Flags.ESPColor
if type(cW)=="table"then
cW=Color3.new(cW[1]or 0,cW[2]or 0,cW[3]or 0)
end
if typeof(cW)=="Color3"then g=cW paint()end
end
return cu{Title=cr.Title or"Rig Preview",Frame=cE,_handle=cS}
end end function a.W():typeof(__modImpl())local aa=a.cache.W if not aa then aa={c=__modImpl()}a.cache.W=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local cb=
ac.guid
local cm=ac.spawnCb
local cn=ac.corner
local co=ac.hairline local cp=
ac.pad local cq=
ac.lighting local cr=
ac.ripple
local cs=ac.spotlight
local cu=ac.attachTip local cv=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cx,cy)
local cz=cx.row
local cA=cx.titleBlock
local cB=cx.reg local cC=
cx.tab local cD=
cx.Window
local cE=cx.Th local cF=
cx.opts or{}local cG=
cx.page
cy=cy or{}
local cH=cy.Values or cy.Options or{"A","B"}
local cI=cy.Value or cy.Default or cH[1]
local cJ=cz(56)
cA(cJ,cy.Title or"Mode",cy.Description,90,true)
cs(cJ,0.1)
if cy.Tooltip then cu(cJ,cy.Tooltip)end
local cK=Instance.new"Frame"cK.BackgroundTransparency=1
cK.Position=UDim2.new(0,12,0,30)cK.Size=UDim2.new(1,-24,0,20)
cK.Parent=cJ
local cL=Instance.new"UIListLayout"cL.FillDirection=Enum.FillDirection.Horizontal
cL.Padding=UDim.new(0,4)cL.Parent=cK
local cM,cN={},{}
local function paint()
for cO,cP in pairs(cN)do
local cQ=cO==cI
b2(cP,bU.Hover,{BackgroundTransparency=cQ and 0 or 0.65})
local cR=cP:FindFirstChildOfClass"TextLabel"
if cR then af:_tag(cR,"TextColor3",cQ and"Text"or"Dim")end
end
end
function cM.Set(cO,cP,cQ)
cI=cP paint()
if cy.Flag then af.Flags[cy.Flag]=cI end
if not cQ then cm(cy.Callback,cI)cm(cy.OnChanged,cI)end
end
function cM.Get(cO)return cI end
for cO,cP in ipairs(cH)do
local cQ=Instance.new"TextButton"cQ.Text=""
cQ.Size=UDim2.new(1/#cH,-4,0,20)cQ.BackgroundColor3=cE.Surface2
cQ.BorderSizePixel=0 cn(cQ,6)cQ.AutoButtonColor=false cQ.Parent=cK
co(cQ,true)
af:_tag(cQ,"BackgroundColor3","Surface2")
local cR=Instance.new"TextLabel"cR.BackgroundTransparency=1
cR.Size=UDim2.fromScale(1,1)cR.Font=Enum.Font.GothamBold
cR.TextSize=11 cR.Text=tostring(cP)cR.Parent=cQ
af:_tag(cR,"TextColor3","Dim")
cN[cP]=cQ
cQ.MouseButton1Click:Connect(function()
af:_sfx"Click"cM:Set(cP)
end)
end
paint()
local cO={Title=cy.Title,Frame=cJ,Value=cI,Flag=cy.Flag,_handle=cM,
_set=function(cO,cP)cM:Set(cO,cP)end}
return cB(cO)
end end function a.X():typeof(__modImpl())local aa=a.cache.X if not aa then aa={c=__modImpl()}a.cache.X=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local cm=
ac.guid
local cn=ac.spawnCb
local co=ac.corner
local cs=ac.hairline local cu=
ac.pad local cv=
ac.lighting local cx=
ac.ripple local cy=
ac.spotlight
local cz=ac.attachTip local cA=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cB,cE)local cG=
cB.row local cH=
cB.titleBlock
local cI=cB.reg local cJ=
cB.tab local cK=
cB.Window
local cL=cB.Th local cM=
cB.opts or{}local cN=
cB.page
cE=cE or{}
local cO=cE.Values or cE.Options or{"A","B"}
local cP=cE.Value or cE.Default or cO[1]
local cQ=Instance.new"Frame"cQ.BackgroundTransparency=1
cQ.Size=UDim2.new(1,-4,0,#cO*28+26)cQ.Parent=cB.getParent()
local cR=Instance.new"TextLabel"cR.BackgroundTransparency=1
cR.Position=UDim2.new(0,2,0,0)cR.Size=UDim2.new(1,0,0,18)
cR.Font=Enum.Font.GothamMedium cR.TextSize=13 cR.TextXAlignment=0
cR.Text=cE.Title or"Choice"cR.Parent=cQ
af:_tag(cR,"TextColor3","Text")
if cE.Tooltip then cz(cQ,cE.Tooltip)end
local cS,cT={},{}
local function paint()
for cU,cV in pairs(cT)do
local cW=cV:FindFirstChild("_dot",true)
local cX=cU==cP
if cW then af:_tag(cW,"BackgroundColor3",cX and"Accent"or"Surface2")end
b2(cV,bU.Hover,{BackgroundTransparency=cX and 0.35 or 0.75})
end
end
function cS.Set(cU,cV,cW)
cP=cV paint()
if cE.Flag then af.Flags[cE.Flag]=cP end
if not cW then cn(cE.Callback,cP)cn(cE.OnChanged,cP)end
end
function cS.Get(cU)return cP end
for cU,cV in ipairs(cO)do
local cW=Instance.new"TextButton"cW.Text=""
cW.Position=UDim2.new(0,0,0,22+(cU-1)*28)
cW.Size=UDim2.new(1,0,0,24)cW.BackgroundColor3=cL.Surface2
cW.BackgroundTransparency=0.75 cW.BorderSizePixel=0 co(cW,7)cW.Parent=cQ
af:_tag(cW,"BackgroundColor3","Surface2")
local cX=Instance.new"Frame"cX.Name="_dot"
cX.Position=UDim2.new(0,10,0.5,-7)cX.Size=UDim2.fromOffset(14,14)
cX.BorderSizePixel=0 co(cX,99)cX.Parent=cW
cs(cX,true)
local cY=Instance.new"TextLabel"cY.BackgroundTransparency=1
cY.Position=UDim2.new(0,32,0,0)cY.Size=UDim2.new(1,-40,1,0)
cY.Font=Enum.Font.Gotham cY.TextSize=12 cY.TextXAlignment=0
cY.Text=tostring(cV)cY.Parent=cW
af:_tag(cY,"TextColor3","Text")
cT[cV]=cW
cW.MouseButton1Click:Connect(function()af:_sfx"Click"cS:Set(cV)end)
end
paint()
local cU={Title=cE.Title,Frame=cQ,Value=cP,Flag=cE.Flag,_handle=cS,
_set=function(cU,cV)cS:Set(cU,cV)end}
return cI(cU)
end end function a.Y():typeof(__modImpl())local aa=a.cache.Y if not aa then aa={c=__modImpl()}a.cache.Y=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa
local bU=ab.T
local b2=ab.tween local cn=
ac.guid
local co=ac.spawnCb
local cs=ac.corner local cz=
ac.hairline local cA=
ac.pad local cB=
ac.lighting local cE=
ac.ripple
local cI=ac.spotlight
local cL=ac.attachTip local cN=
ad.makeIcon
local cO=ae.cloneref_check(game:GetService"RunService")
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
local cZ=cR.Min or 0 local f=cR.Max or 100 local g=cR.Step or 1
local Q=(cR.Value and cR.Value[1])or cR.Lo or cZ
local _=(cR.Value and cR.Value[2])or cR.Hi or f
local c_=cS(56)
local function scrollLock(c0)
local c1=c_:FindFirstAncestorOfClass"ScrollingFrame"
if c1 then pcall(function()c1.ScrollingEnabled=not c0 end)end
end
cT(c_,cR.Title or"Range",cR.Description,90,true)
cI(c_,0.1)
if cR.Tooltip then cL(c_,cR.Tooltip)end
local c0=Instance.new"TextLabel"c0.BackgroundTransparency=1
c0.AnchorPoint=Vector2.new(1,0)c0.Position=UDim2.new(1,-12,0,6)
c0.Size=UDim2.new(0,90,0,18)c0.Font=Enum.Font.Code
c0.TextSize=11 c0.TextXAlignment=1 c0.Parent=c_
af:_tag(c0,"TextColor3","Dim")
local c1=Instance.new"TextButton"c1.Text=""c1.AutoButtonColor=false
c1.Position=UDim2.new(0,12,0,36)c1.Size=UDim2.new(1,-24,0,6)
c1.BackgroundColor3=cX.Surface2 c1.BorderSizePixel=0 cs(c1,99)c1.Parent=c_
af:_tag(c1,"BackgroundColor3","Surface2")
local c2=Instance.new"Frame"c2.BorderSizePixel=0 cs(c2,99)c2.Parent=c1
af:agrad(c2,0)
local c3=Instance.new"Frame"c3.AnchorPoint=Vector2.new(0.5,0.5)
c3.Size=UDim2.fromOffset(13,13)c3.BackgroundColor3=Color3.fromRGB(255,255,255)
c3.BorderSizePixel=0 cs(c3,99)c3.Parent=c1
local c4=Instance.new"Frame"c4.AnchorPoint=Vector2.new(0.5,0.5)
c4.Size=UDim2.fromOffset(13,13)c4.BackgroundColor3=Color3.fromRGB(255,255,255)
c4.BorderSizePixel=0 cs(c4,99)c4.Parent=c1
local c5={}
local function snap(c6)c6=math.clamp(c6,cZ,f)return math.round(c6/g)*g end
local function render(c6)
Q,_=math.min(Q,_),math.max(Q,_)
local c7=(Q-cZ)/math.max(1e-6,f-cZ)
local c8=(_-cZ)/math.max(1e-6,f-cZ)
local c9=c6 and bU.Fill08 or TweenInfo.new(0)
b2(c2,c9,{Position=UDim2.new(c7,0,0,0),Size=UDim2.new(c8-c7,0,1,0)})
c3.Position=UDim2.new(c7,0,0.5,0)
c4.Position=UDim2.new(c8,0,0.5,0)
c0.Text=tostring(Q).." - "..tostring(_)
end
function c5.Set(c6,c7,c8)
if type(c7)=="table"then Q,_=snap(c7[1]or Q),snap(c7[2]or _)end
render(true)
if cR.Flag then af.Flags[cR.Flag]={Q,_}end
if not c8 then co(cR.Callback,{Q,_})end
end
function c5.Get(c6)return{Q,_}end
render(false)
local c6
c1.InputBegan:Connect(function(c7)
if c7.UserInputType~=Enum.UserInputType.MouseButton1 and c7.UserInputType~=Enum.UserInputType.Touch then return end
local c8=c7.Position.X
local c9=c3.AbsolutePosition.X local da=c4.AbsolutePosition.X
c6=(math.abs(c8-c9)<math.abs(c8-da))and 1 or 2
scrollLock(true)
local db;db=cO.RenderStepped:Connect(function()
if not c6 then db:Disconnect()return end
local dc=cP:GetMouseLocation().X
local dd=math.clamp((dc-c1.AbsolutePosition.X)/math.max(1,c1.AbsoluteSize.X),0,1)
local de=snap(cZ+dd*(f-cZ))
if c6==1 then Q=math.min(de,_)else _=math.max(de,Q)end
render(false)
end)
local dc;dc=cP.InputEnded:Connect(function(dd)
if dd.UserInputType==Enum.UserInputType.MouseButton1 or dd.UserInputType==Enum.UserInputType.Touch then
c6=nil scrollLock(false)
if db then db:Disconnect()end if dc then dc:Disconnect()end
if cR.Flag then af.Flags[cR.Flag]={Q,_}end
co(cR.Callback,{Q,_})co(cR.OnRelease,{Q,_})
end
end)
end)
local c7={Title=cR.Title,Frame=c_,Value={Q,_},Flag=cR.Flag,_handle=c5,
_set=function(c7,c8)c5:Set(c7,c8)end}
return cU(c7)
end end function a.Z():typeof(__modImpl())local aa=a.cache.Z if not aa then aa={c=__modImpl()}a.cache.Z=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local bU=
ab.T local b2=
ab.tween local co=
ac.guid local cs=
ac.spawnCb
local cI=ac.corner local cL=
ac.hairline local cN=
ac.pad local cO=
ac.lighting local cP=
ac.ripple
local cQ=ac.spotlight
local cR=ac.attachTip local cS=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(cT,cU)
local cX=cT.row
local cY=cT.titleBlock
local cZ=cT.reg local c_=
cT.tab local c0=
cT.Window
local c1=cT.Th local c2=
cT.opts or{}local c3=
cT.page
cU=cU or{}
local c4=math.clamp(cU.Points or 60,10,200)
local c5={}
for c6,c7 in ipairs(cU.Values or{})do table.insert(c5,c7)end
local c6=cX(74)
cY(c6,cU.Title or"Graph",cU.Description,70,true)
cQ(c6,0.08)
if cU.Tooltip then cR(c6,cU.Tooltip)end
local c7=Instance.new"TextLabel"c7.BackgroundTransparency=1
c7.AnchorPoint=Vector2.new(1,0)c7.Position=UDim2.new(1,-12,0,6)
c7.Size=UDim2.new(0,60,0,18)c7.Font=Enum.Font.GothamBold
c7.TextSize=12 c7.TextXAlignment=1 c7.Parent=c6
af:_tag(c7,"TextColor3","Text")
local c8=Instance.new"Frame"c8.BorderSizePixel=0
c8.Position=UDim2.new(0,12,0,28)c8.Size=UDim2.new(1,-24,0,36)
c8.BackgroundColor3=c1.Bg cI(c8,6)c8.ClipsDescendants=true c8.Parent=c6
af:_tag(c8,"BackgroundColor3","Bg")
local c9=Instance.new"Frame"c9.BorderSizePixel=0 c9.Parent=c8
af:agrad(c9,0)
cI(c9,99)
local da={}
local db={}
local function draw()
for dc,dd in ipairs(da)do pcall(function()dd:Destroy()end)end
da={}
if#c5==0 then c7.Text="--"return end
local dc,dd=math.huge,-math.huge
for de,f in ipairs(c5)do dc=math.min(dc,f)dd=math.max(dd,f)end
if dd-dc<1e-6 then dd=dc+1 end
c7.Text=tostring(math.round(c5[#c5]*10)/10)
local de=c8.AbsoluteSize.X if de<10 then de=200 end local f=
#c5
for g,Q in ipairs(c5)do
local _=(Q-dc)/(dd-dc)
local df=Instance.new"Frame"df.BorderSizePixel=0
df.AnchorPoint=Vector2.new(0.5,1)df.Size=UDim2.fromOffset(3,3)
df.Position=UDim2.new((g-1)/math.max(1,c4-1),0,1-_*0.85-0.07,0)
df.BackgroundColor3=c1.Accent cI(df,99)df.Parent=c8
af:_tag(df,"BackgroundColor3","Accent")
table.insert(da,df)
end
c9.Position=UDim2.new(0,0,1,-2)c9.Size=UDim2.new(1,0,0,2)
end
function db.Push(dc,dd)
table.insert(c5,tonumber(dd)or 0)
while#c5>c4 do table.remove(c5,1)end
draw()
end
function db.Set(dc,dd)
c5={}
if type(dd)=="table"then for de,df in ipairs(dd)do table.insert(c5,tonumber(df)or 0)end end
draw()
end
function db.Get(dc)return c5 end
db.Frame=c6
task.defer(draw)
return cZ{Title=cU.Title,Frame=c6,_handle=db}
end end function a._():typeof(__modImpl())local aa=a.cache._ if not aa then aa={c=__modImpl()}a.cache._=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local cI=
ab.T local cQ=
ab.tween local cR=
ac.guid local cS=
ac.spawnCb local cT=
ac.corner local cU=
ac.hairline local cX=
ac.pad local cY=
ac.lighting local cZ=
ac.ripple local c1=
ac.spotlight local c3=
ac.attachTip
local c4=ac.mdToRich local c5=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(c6,c7)local c8=
c6.row local c9=
c6.titleBlock
local da=c6.reg local db=
c6.tab local dc=
c6.Window local dd=
c6.Th local de=
c6.opts or{}local df=
c6.page
if type(c7)=="string"then c7={Text=c7}end c7=c7 or{}
local f=Instance.new"TextLabel"f.BackgroundTransparency=1
f.Size=UDim2.new(1,-4,0,0)f.AutomaticSize=Enum.AutomaticSize.Y
f.Font=Enum.Font.Gotham f.TextSize=c7.Size or 12
f.TextXAlignment=0 f.TextYAlignment=0 f.TextWrapped=true
f.RichText=true f.Text=c4(c7.Text or"")f.Parent=c6.getParent()
af:_tag(f,"TextColor3","Text")
return da{Title=c7.Title or"Text",Frame=f,_handle=f}
end end function a.aa():typeof(__modImpl())local aa=a.cache.aa if not aa then aa={c=__modImpl()}a.cache.aa=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local c4=
ab.T local c5=
ab.tween local c6=
ac.guid local c7=
ac.spawnCb
local da=ac.corner
local df=ac.hairline local f=
ac.pad local g=
ac.lighting local Q=
ac.ripple local _=
ac.spotlight local dg=
ac.attachTip local dh=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(di,dj)
local dk=di.row local dl=
di.titleBlock
local dm=di.reg local dn=
di.tab local dp=
di.Window
local dq=di.Th local dr=
di.opts or{}local ds=
di.page
dj=dj or{}
local dt=dk(math.clamp(38+14*#(string.split(dj.Text or"print('hi')","\n")),52,160))
local du=Instance.new"TextLabel"du.BackgroundTransparency=1
du.Position=UDim2.new(0,12,0,6)du.Size=UDim2.new(1,-90,1,-12)
du.Font=Enum.Font.Code du.TextSize=12 du.TextXAlignment=0 du.TextYAlignment=0
du.TextWrapped=true du.TextTruncate=Enum.TextTruncate.AtEnd
du.Text=dj.Text or""du.Parent=dt
af:_tag(du,"TextColor3","Text")
local dv=Instance.new"TextButton"dv.Text=""
dv.AnchorPoint=Vector2.new(1,0)dv.Position=UDim2.new(1,-10,0,8)
dv.Size=UDim2.new(0,56,0,24)dv.BackgroundColor3=dq.Surface2
dv.BorderSizePixel=0 da(dv,6)dv.AutoButtonColor=false dv.Parent=dt
df(dv,true)
af:_tag(dv,"BackgroundColor3","Surface2")
local dw=Instance.new"TextLabel"dw.BackgroundTransparency=1
dw.Size=UDim2.fromScale(1,1)dw.Font=Enum.Font.GothamBold
dw.TextSize=10 dw.Text="COPY"dw.Parent=dv
af:_tag(dw,"TextColor3","Dim")
dv.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(du.Text)end end)
dw.Text="COPIED"
task.delay(1.2,function()pcall(function()dw.Text="COPY"end)end)
end)
return dm{Title=dj.Title or"Code",Frame=dt,_handle=du}
end end function a.ab():typeof(__modImpl())local aa=a.cache.ab if not aa then aa={c=__modImpl()}a.cache.ab=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local da=
ab.T local df=
ab.tween local dh=
ac.guid
local di=ac.spawnCb
local dj=ac.corner
local dk=ac.hairline local dm=
ac.pad local dq=
ac.lighting local ds=
ac.ripple
local dt=ac.spotlight
local du=ac.attachTip
local dv=ac.setDisabled
local dw=ac.attachCtx local dx=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
local dy=ae.cloneref_check(game:GetService"UserInputService")

return function(dz,dA)
local dB=dz.row
local dC=dz.titleBlock
local dD=dz.reg local dE=
dz.tab local dF=
dz.Window
local dG=dz.Th local dH=
dz.opts or{}local dI=
dz.page
local dJ=dz.pgui
dA=dA or{}
local dK=dA.Min or 0 local dL=dA.Max or 100 local dM=dA.Step or 1
local dN=dA.Value or dA.Default or dK
local dO=dB(40)
dC(dO,dA.Title or"Count",dA.Description,130)
dt(dO,0.08)
if dA.Tooltip then du(dO,dA.Tooltip)end
if dA.ContextMenu then dw(dJ,dO,dA.ContextMenu)end
local dP=Instance.new"TextButton"dP.Text=""
dP.AnchorPoint=Vector2.new(1,0.5)dP.Position=UDim2.new(1,-92,0.5,0)
dP.Size=UDim2.fromOffset(28,28)dP.BackgroundColor3=dG.Surface2
dP.BorderSizePixel=0 dj(dP,7)dP.AutoButtonColor=false dP.Parent=dO
dk(dP,true)
af:_tag(dP,"BackgroundColor3","Surface2")
local dQ=Instance.new"TextLabel"dQ.BackgroundTransparency=1 dQ.Size=UDim2.fromScale(1,1)
dQ.Font=Enum.Font.GothamBold dQ.TextSize=14 dQ.Text="-"dQ.Parent=dP
af:_tag(dQ,"TextColor3","Text")
local dR=Instance.new"TextLabel"dR.BackgroundTransparency=1
dR.AnchorPoint=Vector2.new(1,0.5)dR.Position=UDim2.new(1,-60,0.5,0)
dR.Size=UDim2.new(0,28,0,20)dR.Font=Enum.Font.GothamBold
dR.TextSize=13 dR.TextXAlignment=Enum.TextXAlignment.Center
dR.TextYAlignment=Enum.TextYAlignment.Center
dR.Text=tostring(dN)dR.Parent=dO
af:_tag(dR,"TextColor3","Text")
local dS=Instance.new"TextButton"dS.Text=""
dS.AnchorPoint=Vector2.new(1,0.5)dS.Position=UDim2.new(1,-28,0.5,0)
dS.Size=UDim2.fromOffset(28,28)dS.BackgroundColor3=dG.Surface2
dS.BorderSizePixel=0 dj(dS,7)dS.AutoButtonColor=false dS.Parent=dO
dk(dS,true)
af:_tag(dS,"BackgroundColor3","Surface2")
local dT=Instance.new"TextLabel"dT.BackgroundTransparency=1 dT.Size=UDim2.fromScale(1,1)
dT.Font=Enum.Font.GothamBold dT.TextSize=14 dT.Text="+"dT.Parent=dS
af:_tag(dT,"TextColor3","Text")
local dU={}
local function render()dR.Text=tostring(dN)end
function dU.Set(dV,dW,dX)
dN=math.clamp(tonumber(dW)or dN,dK,dL)
render()
if dA.Flag then af.Flags[dA.Flag]=dN end
if not dX then di(dA.Callback,dN)di(dA.OnChanged,dN)end
end
function dU.Get(dV)return dN end
local function hold(dV,dW)
dV.InputBegan:Connect(function(dX)
if dX.UserInputType~=Enum.UserInputType.MouseButton1 and dX.UserInputType~=Enum.UserInputType.Touch then return end
dU:Set(dN+dW*dM)
local dY=os.clock()
task.spawn(function()
while dy:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
if os.clock()-dY<0.35 then task.wait(0.05)
else dU:Set(dN+dW*dM)task.wait(0.08)end
end
end)
end)
end
hold(dP,-1)hold(dS,1)
if dA.Disabled then task.defer(function()pcall(dv,dO,true)end)end
local dV={Title=dA.Title,Frame=dO,Value=dN,Flag=dA.Flag,_handle=dU,
_set=function(dV,dW)dU:Set(dV,dW)end,Tooltip=dA.Tooltip}
return dD(dV)
end end function a.ac():typeof(__modImpl())local aa=a.cache.ac if not aa then aa={c=__modImpl()}a.cache.ac=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local di=
ab.T local dj=
ab.tween local dk=
ac.guid
local dt=ac.spawnCb
local du=ac.corner local dv=
ac.hairline local dw=
ac.pad local dx=
ac.lighting local dy=
ac.ripple local dz=
ac.spotlight local dA=
ac.attachTip local dB=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dC,dD)local dG=
dC.row local dI=
dC.titleBlock
local dJ=dC.reg local dK=
dC.tab local dL=
dC.Window
local dM=dC.Th local dN=
dC.opts or{}local dO=
dC.page
dD=dD or{}
local dP=dD.Columns or{"Key","Value"}
local dQ=dD.Rows or{}
local dR=Instance.new"Frame"dR.BackgroundTransparency=1
dR.Size=UDim2.new(1,-4,0,30+math.min(6,math.max(1,#dQ))*24+8)
dR.AutomaticSize=Enum.AutomaticSize.Y dR.Parent=dC.getParent()
local dS=Instance.new"Frame"dS.Size=UDim2.new(1,0,0,22)
dS.BackgroundTransparency=1 dS.Parent=dR
local dT,dU=1,true
local dV={}
local dW
local function draw()
if dW then pcall(function()dW:Destroy()end)end
dW=Instance.new"Frame"dW.BackgroundTransparency=1
dW.Position=UDim2.new(0,0,0,26)dW.Size=UDim2.new(1,0,0,#dQ*24)
dW.Parent=dR
local dX=Instance.new"UIListLayout"dX.Padding=UDim.new(0,2)dX.Parent=dW
local dY={}
for dZ,d_ in ipairs(dQ)do table.insert(dY,{i=dZ,r=d_})end
table.sort(dY,function(dZ,d_)
local d0,d1=tostring(dZ.r[dT]or""),tostring(d_.r[dT]or"")
if dU then return d0<d1 else return d0>d1 end
end)
for dZ,d_ in ipairs(dY)do
local d0=Instance.new"TextButton"d0.Text=""
d0.Size=UDim2.new(1,0,0,22)d0.BackgroundColor3=dM.Surface
d0.BackgroundTransparency=0.4 d0.BorderSizePixel=0 du(d0,6)d0.Parent=dW
af:_tag(d0,"BackgroundColor3","Surface")
for d1=1,#dP do
local d2=Instance.new"TextLabel"d2.BackgroundTransparency=1
d2.Position=UDim2.new((d1-1)/#dP,8,0,0)
d2.Size=UDim2.new(1/#dP,-16,1,0)
d2.Font=Enum.Font.Gotham d2.TextSize=11 d2.TextXAlignment=0
d2.TextTruncate=Enum.TextTruncate.AtEnd
d2.Text=tostring(d_.r[d1]or"")d2.Parent=d0
af:_tag(d2,"TextColor3",d1==1 and"Text"or"Dim")
end
d0.MouseButton1Click:Connect(function()
af:_sfx"Click"dt(dD.OnSelect,d_.r,d_.i)
end)
end
end
for dX,dY in ipairs(dP)do
local dZ=Instance.new"TextButton"dZ.Text=""
dZ.Position=UDim2.new((dX-1)/#dP,0,0,0)
dZ.Size=UDim2.new(1/#dP,0,1,0)dZ.BackgroundTransparency=1 dZ.Parent=dS
local d_=Instance.new"TextLabel"d_.BackgroundTransparency=1
d_.Position=UDim2.new(0,8,0,0)d_.Size=UDim2.new(1,-16,1,0)
d_.Font=Enum.Font.GothamBold d_.TextSize=10 d_.TextXAlignment=0
d_.Text=string.upper(tostring(dY))..((dT==dX)and(dU and" ^"or" v")or"")d_.Parent=dZ
af:_tag(d_,"TextColor3","Dim")
local d0=dX
dZ.MouseButton1Click:Connect(function()
if dT==d0 then dU=not dU else dT,dU=d0,true end
draw()
for d1,d2 in ipairs(dS:GetChildren())do
if d2:IsA"TextButton"then
local d3=d2:FindFirstChildOfClass"TextLabel"
if d3 then d3.Text=string.upper(tostring(dP[d1]))..((dT==d1)and(dU and" ^"or" v")or"")end
end
end
end)
end
function dV.SetRows(dX,dY)dQ=dY or{}draw()end
function dV.GetRows(dX)return dQ end
draw()
return dJ{Title=dD.Title or"Table",Frame=dR,_handle=dV}
end end function a.ad():typeof(__modImpl())local aa=a.cache.ad if not aa then aa={c=__modImpl()}a.cache.ad=aa end return aa.c end end do local function __modImpl()




local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local dt=
ab.T local du=
ab.tween local dB=
ac.guid local dC=
ac.spawnCb
local dD=ac.corner local dJ=
ac.hairline local dM=
ac.pad local dO=
ac.lighting local dP=
ac.ripple local dQ=
ac.spotlight local dR=
ac.attachTip local dS=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(dT,dU)local dV=
dT.row local dW=
dT.titleBlock
local dX=dT.reg local dY=
dT.tab local dZ=
dT.Window local d_=
dT.Th local d0=
dT.opts or{}local d1=
dT.page
dU=dU or{}
local d2={}
for d3,d4 in ipairs(dU.Items or{})do table.insert(d2,d4)end
local d3=Instance.new"Frame"d3.BackgroundTransparency=1
d3.Size=UDim2.new(1,-4,0,0)d3.AutomaticSize=Enum.AutomaticSize.Y d3.Parent=dT.getParent()
local d4=Instance.new"UIListLayout"d4.Padding=UDim.new(0,2)d4.Parent=d3
local d5={}
local function draw()
for d6,d7 in ipairs(d3:GetChildren())do
if d7:IsA"Frame"then pcall(function()d7:Destroy()end)end
end
if#d2==0 then
local d6=Instance.new"TextLabel"d6.BackgroundTransparency=1
d6.Size=UDim2.new(1,0,0,22)d6.Font=Enum.Font.Gotham
d6.TextSize=11 d6.TextXAlignment=0 d6.Text="No activity yet."d6.Parent=d3
af:_tag(d6,"TextColor3","Dim")
return
end
local d6={info="Accent",ok="Success",warn="Warn",err="Danger"}
for d7,d8 in ipairs(d2)do
local d9=Instance.new"Frame"d9.BackgroundTransparency=1
d9.Size=UDim2.new(1,0,0,30)d9.Parent=d3
local ea=Instance.new"Frame"ea.Position=UDim2.new(0,4,0,8)
ea.Size=UDim2.fromOffset(8,8)ea.BorderSizePixel=0 dD(ea,99)ea.Parent=d9
af:_tag(ea,"BackgroundColor3",d6[d8.Kind or"info"]or"Accent")
local eb=Instance.new"TextLabel"eb.BackgroundTransparency=1
eb.Position=UDim2.new(0,20,0,2)eb.Size=UDim2.new(1,-70,0,16)
eb.Font=Enum.Font.Gotham eb.TextSize=12 eb.TextXAlignment=0
eb.TextTruncate=Enum.TextTruncate.AtEnd eb.Text=tostring(d8.Title or"")eb.Parent=d9
af:_tag(eb,"TextColor3","Text")
local ec=Instance.new"TextLabel"ec.BackgroundTransparency=1
ec.Position=UDim2.new(0,20,0,17)ec.Size=UDim2.new(1,-70,0,12)
ec.Font=Enum.Font.Gotham ec.TextSize=10 ec.TextXAlignment=0
ec.TextTruncate=Enum.TextTruncate.AtEnd
ec.Text=tostring(d8.Sub or"")ec.Parent=d9
af:_tag(ec,"TextColor3","Dim")
local ed=Instance.new"TextLabel"ed.BackgroundTransparency=1
ed.AnchorPoint=Vector2.new(1,0)ed.Position=UDim2.new(1,0,0,6)
ed.Size=UDim2.new(0,60,0,14)ed.Font=Enum.Font.Code
ed.TextSize=10 ed.TextXAlignment=1 ed.Text=tostring(d8.At or"")ed.Parent=d9
af:_tag(ed,"TextColor3","Dim")
end
end
function d5.Add(d6,d7)table.insert(d2,1,d7 or{})while#d2>20 do table.remove(d2)end draw()end
function d5.Clear(d6)d2={}draw()end
d5.Frame=d3
draw()
return dX{Title=dU.Title or"Timeline",Frame=d3,_handle=d5}
end end function a.ae():typeof(__modImpl())local aa=a.cache.ae if not aa then aa={c=__modImpl()}a.cache.ae=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local dD=
ab.T local dS=
ab.tween local dT=
ac.guid local dU=
ac.spawnCb
local dX=ac.corner
local d1=ac.hairline local d2=
ac.pad local d3=
ac.lighting local d4=
ac.ripple local d5=
ac.spotlight local d6=
ac.attachTip
local d7=ac.attachCtx local d8=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")


aa._favs=aa._favs or{}
aa._favRefresh=aa._favRefresh or{}
local function refreshAll()
for d9,ea in ipairs(aa._favRefresh)do pcall(ea)end
end
if not aa.Pin then
function aa.Pin(d9,ea,eb)
if not ea or ea==""then return end
for ec,ed in ipairs(aa._favs)do
if ed.label==ea and ed.tab==d9 then return end
end
table.insert(aa._favs,1,{tab=d9,label=ea,go=eb})
while#aa._favs>24 do table.remove(aa._favs)end
refreshAll()
end
function aa.Unpin(d9,ea)
for eb,ec in ipairs(aa._favs)do
if(not d9 or ec.tab==d9)and(not ea or ec.label==ea)then
table.remove(aa._favs,eb)
end
end
refreshAll()
end
function aa.IsPinned(d9,ea)
for eb,ec in ipairs(aa._favs)do
if ec.label==ea and(not d9 or ec.tab==d9)then return true end
end
return false
end
end

return function(d9,ea)local eb=
d9.row local ec=
d9.titleBlock
local ed=d9.reg local ee=
d9.tab
local ef=d9.Window
local eg=d9.Th local eh=
d9.opts or{}local ei=
d9.page
local ej=d9.pgui
ea=ea or{}
local ek=ea.Limit or 6
local el=Instance.new"Frame"el.BackgroundTransparency=1
el.Size=UDim2.new(1,-4,0,0)el.AutomaticSize=Enum.AutomaticSize.Y
el.Parent=d9.getParent()
local em=Instance.new"UIListLayout"em.Padding=UDim.new(0,4)
em.SortOrder=Enum.SortOrder.LayoutOrder em.Parent=el
local function refresh()
for en,eo in ipairs(el:GetChildren())do
if eo:IsA"TextButton"or eo:IsA"TextLabel"then pcall(function()eo:Destroy()end)end
end
if#aa._favs==0 then
local en=Instance.new"TextLabel"en.BackgroundTransparency=1
en.Size=UDim2.new(1,0,0,24)en.Font=Enum.Font.Gotham
en.TextSize=11 en.TextXAlignment=0 en.Text="Pin controls here with Kronos:Pin()."en.Parent=el
af:_tag(en,"TextColor3","Dim")
return
end
for en=1,math.min(ek,#aa._favs)do
local eo=aa._favs[en]
local ep=Instance.new"TextButton"ep.Text=""
ep.Size=UDim2.new(1,0,0,30)ep.BackgroundColor3=eg.Surface
ep.BackgroundTransparency=0.35 ep.BorderSizePixel=0
dX(ep,7)ep.Parent=el
d1(ep,true)
af:_tag(ep,"BackgroundColor3","Surface")
local eq=Instance.new"TextLabel"eq.BackgroundTransparency=1
eq.Position=UDim2.new(0,8,0,0)eq.Size=UDim2.new(0,18,1,0)
eq.Font=Enum.Font.GothamBold eq.TextSize=12 eq.Text="*"eq.Parent=ep
af:_tag(eq,"TextColor3","Accent")
local er=Instance.new"TextLabel"er.BackgroundTransparency=1
er.Position=UDim2.new(0,26,0,0)er.Size=UDim2.new(1,-106,1,0)
er.Font=Enum.Font.Gotham er.TextSize=12 er.TextXAlignment=0
er.TextTruncate=Enum.TextTruncate.AtEnd er.Text=eo.label er.Parent=ep
af:_tag(er,"TextColor3","Text")
local es=Instance.new"TextLabel"es.BackgroundTransparency=1
es.AnchorPoint=Vector2.new(1,0)es.Position=UDim2.new(1,-10,0,0)
es.Size=UDim2.new(0,74,1,0)es.Font=Enum.Font.Gotham
es.TextSize=10 es.TextXAlignment=1 es.Text=eo.tab es.Parent=ep
af:_tag(es,"TextColor3","Dim")
ep.MouseButton1Click:Connect(function()
if eo.go then af:_sfx"Click"pcall(eo.go)
else ef:Notify{Title="Unavailable",Content=eo.label,Duration=1.5}end
end)
d7(ej,ep,{{Title="Unpin",Callback=function()
aa.Unpin(eo.tab,eo.label)
end}})
end
end
table.insert(aa._favRefresh,refresh)
refresh()
return ed{Title=ea.Title or"Favorites",Frame=el,_handle={Refresh=refresh}}
end end function a.af():typeof(__modImpl())local aa=a.cache.af if not aa then aa={c=__modImpl()}a.cache.af=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local dX=
ab.T local d1=
ab.tween local d7=
ac.guid
local d8=ac.spawnCb
local d9=ac.corner
local ea=ac.hairline local ed=
ac.pad local ef=
ac.lighting local eg=
ac.ripple
local ei=ac.spotlight
local ej=ac.attachTip
local ek=ac.attachCtx local el=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local em=ae.cloneref_check(game:GetService"Players")

return function(en,eo)
local ep=en.row local eq=
en.titleBlock
local er=en.reg local es=
en.tab local et=
en.Window
local eu=en.Th local ev=
en.opts or{}local ew=
en.page
local ex=en.pgui
eo=eo or{}
local ey=math.clamp(eo.Height or 230,140,320)
local ez=ep(ey)
ei(ez,0.06)
if eo.Tooltip then ej(ez,eo.Tooltip)end
if eo.ContextMenu then ek(ex,ez,eo.ContextMenu)end
local eA=Instance.new"TextLabel"eA.BackgroundTransparency=1
eA.Position=UDim2.new(0,12,0,6)eA.Size=UDim2.new(1,-60,0,16)
eA.Font=Enum.Font.GothamMedium eA.TextSize=12 eA.TextXAlignment=0
eA.TextTruncate=Enum.TextTruncate.AtEnd
eA.Text=eo.Title or"Preview"eA.Parent=ez
af:_tag(eA,"TextColor3","Text")
local eB=Instance.new"Frame"eB.AnchorPoint=Vector2.new(1,0)
eB.Position=UDim2.new(1,-12,0,10)eB.Size=UDim2.fromOffset(8,8)
eB.BorderSizePixel=0 d9(eB,99)eB.Parent=ez
af:_tag(eB,"BackgroundColor3","Success")
local eC=Instance.new"ViewportFrame"eC.BackgroundColor3=eu.Bg
eC.BorderSizePixel=0 eC.Position=UDim2.new(0,10,0,28)
eC.Size=UDim2.new(1,-20,1,-36)d9(eC,8)eC.Parent=ez
af:_tag(eC,"BackgroundColor3","Bg")
ea(eC,true)
pcall(function()
eC.LightColor=Color3.fromRGB(235,235,240)
eC.LightDirection=Vector3.new(-0.4,-1,-0.7)
end)
local eD=Instance.new"WorldModel"eD.Parent=eC
local eE=Instance.new"Camera"eE.Parent=eC
eE.CFrame=CFrame.lookAt(Vector3.new(0,4,10),Vector3.new(0,2,0))
eC.CurrentCamera=eE
local eF=Instance.new"Part"eF.Name="_lamp"
eF.Size=Vector3.new(1,1,1)eF.Transparency=1 eF.Anchored=true
eF.CanCollide=false eF.CanQuery=false eF.CanTouch=false
eF.Position=Vector3.new(4,6,6)eF.Parent=eD
local eG=Instance.new"PointLight"eG.Brightness=1.6 eG.Range=40
eG.Color=Color3.fromRGB(255,244,230)eG.Parent=eF
local eH=Instance.new"Part"eH.Name="_lamp2"
eH.Size=Vector3.new(1,1,1)eH.Transparency=1 eH.Anchored=true
eH.CanCollide=false eH.CanQuery=false eH.CanTouch=false
eH.Position=Vector3.new(-5,3,-6)eH.Parent=eD
local eI=Instance.new"PointLight"eI.Brightness=1 eI.Range=40
eI.Color=Color3.fromRGB(140,170,255)eI.Parent=eH
local eJ=Instance.new"TextLabel"eJ.BackgroundTransparency=1
eJ.Size=UDim2.fromScale(1,1)eJ.Font=Enum.Font.Gotham
eJ.TextSize=12 eJ.Text="Summoning avatar..."eJ.Parent=eC
af:_tag(eJ,"TextColor3","Dim")
local eK
pcall(function()eK=em.LocalPlayer end)
local eL=eo.Character or eo.Preset or(eo.UserId and"Player")or"Noob"
local eM=tonumber(eo.UserId)or(eK and eK.UserId)or 1
if tonumber(eL)then eM,eL=tonumber(eL),"Player"end
local eN
pcall(function()
eN=(eo.Rig=="R6")and Enum.HumanoidRigType.R6 or Enum.HumanoidRigType.R15
end)
local eO=eo.Zoom or 7.5
local eP=eo.Spin~=false
local eQ,eR,eS=0.6,Vector3.new(0,2,0),1.2
local eT={rig=nil,humanoid=nil,desc=nil,tracks={}}
local eU={}
local function aimAt(eV)
eR=eV+Vector3.new(0,1,0)
eS=1.4
eE.CFrame=CFrame.new(eR+Vector3.new(2.4,eS,eO),eR)
eQ=math.atan2(2.4,eO)
end
local function applyDesc(eV)
if not eV then return false end
local eW=eT.humanoid
if not eW or not eW.Parent then return false end
local eX=pcall(function()eW:ApplyDescription(eV)end)
if eX then eT.desc=eV end
return eX
end
local function noobDescription()
local eV=Instance.new"HumanoidDescription"
pcall(function()
eV.HeadColor=Color3.fromRGB(245,205,30)
eV.TorsoColor=Color3.fromRGB(13,105,172)
eV.LeftArmColor=Color3.fromRGB(245,205,30)
eV.RightArmColor=Color3.fromRGB(245,205,30)
eV.LeftLegColor=Color3.fromRGB(164,189,71)
eV.RightLegColor=Color3.fromRGB(164,189,71)
eV.Face=48474313
eV.Head,eV.Torso=0,0
eV.LeftArm,eV.RightArm=0,0
eV.LeftLeg,eV.RightLeg=0,0
eV.Shirt,eV.Pants,eV.GraphicTShirt=0,0,0
end)
return eV
end
local function loadModel()
local eV,eW
if eL=="Noob"then
eV=noobDescription()
local eX
pcall(function()eX=Enum.HumanoidRigType.R6 end)
local eY,eZ=pcall(function()
if eX then
return em:CreateHumanoidModelFromDescription(eV,eX)
end
return em:CreateHumanoidModelFromDescription(eV)
end)
if not eY then
eY,eZ=pcall(function()
return em:CreateHumanoidModelFromDescription(eV)
end)
end
if eY and eZ then eW=eZ end
else
local eX,eY=pcall(function()
return em:GetHumanoidDescriptionFromUserIdAsync(eM)
end)
if eX and eY then
local eZ,e_=pcall(function()
if eN then
return em:CreateHumanoidModelFromDescription(eY,eN)
end
return em:CreateHumanoidModelFromDescription(eY)
end)
if not eZ then
eZ,e_=pcall(function()
return em:CreateHumanoidModelFromDescription(eY)
end)
end
if eZ and e_ then eW,eV=e_,eY end
end
if not eW and eK then
local eZ=eK.Character
if eZ then
local e_,e0=pcall(function()return eZ:Clone()end)
if e_ and e0 then
for e1,e2 in ipairs(e0:GetDescendants())do
pcall(function()
if e2:IsA"Script"or e2:IsA"LocalScript"or e2:IsA"ModuleScript"then
e2:Destroy()
elseif e2:IsA"BasePart"then
e2.Anchored=true e2.CanCollide=false
e2.CanQuery=false e2.CanTouch=false
end
end)
end
eW=e0
if not eV then
pcall(function()eV=em:GetHumanoidDescriptionFromUserIdAsync(eM)end)
end
end
end
end
end
if not eW then
pcall(function()eJ.Text="Avatar failed to build."end)
pcall(function()eB.BackgroundColor3=eu.Danger end)
return
end
for eX,eY in ipairs(eW:GetDescendants())do
pcall(function()
if eY:IsA"BasePart"then
eY.Anchored=true eY.CanCollide=false
eY.CanQuery=false eY.CanTouch=false
end
end)
end
eW.Parent=eD
eT.rig=eW
eT.humanoid=eW:FindFirstChildOfClass"Humanoid"
if eV then eT.desc=eV end
local eX=eR
pcall(function()
local eY=eW:FindFirstChild"HumanoidRootPart"
if eY then eX=eY.Position end
end)
aimAt(eX)
pcall(function()eJ:Destroy()end)
end
local eV={"Head","Torso","LeftArm","RightArm","LeftLeg","RightLeg"}
function eU.SetColors(eW,eX)
if type(eX)~="table"then return end
local eY=eT.desc
if not eY then return end
if eX.All then
for eZ,e_ in ipairs(eV)do
pcall(function()eY[e_.."Color"]=eX.All end)
end
else
for eZ,e_ in ipairs(eV)do
if eX[e_]then pcall(function()eY[e_.."Color"]=eX[e_]end)end
end
end
applyDesc(eY)
if eo.Flag then af.Flags[eo.Flag]=eX end
d8(eo.Callback,eX)d8(eo.OnChanged,eX)
end
function eU.SetOutfit(eW,eX)
if type(eX)~="table"then return end
local eY=eT.desc
if not eY then return end
for eZ,e_ in pairs(eX)do pcall(function()eY[eZ]=e_ end)end
applyDesc(eY)
end
function eU.ApplyDescription(eW,eX)applyDesc(eX)end
function eU.GetDescription(eW)return eT.desc end
function eU.SetZoom(eW,eX)
eO=math.clamp(tonumber(eX)or eO,3,20)
pcall(function()
eE.CFrame=CFrame.new(eR+Vector3.new(math.sin(eQ)*eO,eS,math.cos(eQ)*eO),eR)
end)
end
function eU.SetSpin(eW,eX)eP=eX and true or false end
function eU.SetSource(eW,eX)
if eX=="Player"or eX=="Noob"then eL=eX eU:Refresh()end
end
function eU.PlayAnimation(eW,eX)
if not eX then return end
task.spawn(function()
pcall(function()
for eY,eZ in ipairs(eT.tracks)do pcall(function()eZ:Stop()eZ:Destroy()end)end
eT.tracks={}
local eY=eT.humanoid
local eZ=eT.rig
if not eY or not eY.Parent or not eZ then return end
eZ.Parent=workspace
local e_=eY:FindFirstChildOfClass"Animator"
if not e_ then
e_=Instance.new"Animator"e_.Parent=eY
end
local e0=Instance.new"Animation"
e0.AnimationId="rbxassetid://"..tostring(eX)
local e1=e_:LoadAnimation(e0)
table.insert(eT.tracks,e1)
eZ.Parent=eD
e1:Play()
end)
end)
end
function eU.StopAnimations(eW)
pcall(function()
for eX,eY in ipairs(eT.tracks)do pcall(function()eY:Stop()eY:Destroy()end)end
eT.tracks={}
end)
end
function eU.Refresh(eW)
pcall(function()
if eT.rig then eT.rig:Destroy()end
eT.rig,eT.humanoid,eT.tracks=nil,nil,{}
end)
task.spawn(loadModel)
end
task.spawn(loadModel)
task.spawn(function()
while eC.Parent do
task.wait(0.03)
pcall(function()
if eP and eT.rig and eT.rig.Parent and eE then
eQ=eQ+0.03*(eo.SpinSpeed or 0.6)
eE.CFrame=CFrame.new(
eR+Vector3.new(math.sin(eQ)*eO,eS,math.cos(eQ)*eO),eR)
end
end)
end
end)
local eW={Title=eo.Title,Frame=ez,Flag=eo.Flag,_handle=eU,
_set=function(eW,eX)
if type(eW)=="table"then eU:SetColors(eW)end
end}
return er(eW)
end end function a.ag():typeof(__modImpl())local aa=a.cache.ag if not aa then aa={c=__modImpl()}a.cache.ag=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local d8=
ab.T local d9=
ab.tween local ea=
ac.guid
local ei=ac.spawnCb
local ej=ac.corner
local ek=ac.hairline local el=
ac.pad local em=
ac.lighting
local en=ac.ripple local eo=
ac.spotlight local ep=
ac.attachTip
local er=ac.applyLock local eu=
ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(ew,ex)
local ey=ew.row
local ez=ew.titleBlock
local eA=ew.reg local eB=
ew.tab local eC=
ew.Window
local eD=ew.Th local eE=
ew.opts or{}local eF=
ew.page
ex=ex or{}
local eG=ex.Locked==true
local eH=ex.Buttons or{}
local eI=ex.Image and ex.Image~=""
local eJ=ey(ex.Description and 64 or 46)
if#eH>0 then
eJ.Size=UDim2.new(1,-4,0,eJ.Size.Y.Offset+34)
end
ez(eJ,ex.Title or"Paragraph",ex.Description,eI and 160 or 24)
if eI then
local eK=Instance.new"ImageLabel"
eK.BackgroundTransparency=1
eK.AnchorPoint=Vector2.new(1,0)eK.Position=UDim2.new(1,-12,0,8)
eK.Size=UDim2.fromOffset(ex.ImageSize or 48,ex.ImageSize or 48)
eK.Image=ex.Image eK.ScaleType=Enum.ScaleType.Crop
eK.Parent=eJ
ej(eK,8)
end
for eK,eL in ipairs(eH)do
local eM=Instance.new"TextButton"eM.Text=""
eM.Position=UDim2.new(0,12+(eK-1)*118,1,-30)
eM.Size=UDim2.new(0,110,0,24)eM.BackgroundColor3=eD.Surface2
eM.BorderSizePixel=0 ej(eM,6)eM.AutoButtonColor=false eM.Parent=eJ
ek(eM,true)
af:_tag(eM,"BackgroundColor3","Surface2")
local eN=Instance.new"TextLabel"eN.BackgroundTransparency=1
eN.Size=UDim2.fromScale(1,1)eN.Font=Enum.Font.GothamBold
eN.TextSize=11 eN.TextTruncate=Enum.TextTruncate.AtEnd
eN.Text=tostring(eL.Title or eL.Text or"Open")eN.Parent=eM
af:_tag(eN,"TextColor3","Text")
en(eM)
eM.MouseButton1Click:Connect(function()
if eG then return end
af:_sfx"Click"ei(eL.Callback)
end)
end
er(eJ,eG)
local eK={}
function eK.SetLocked(eL,eM)
eG=eM and true or false
er(eJ,eG)
end
function eK.GetLocked(eL)return eG end
return eA{Title=ex.Title,Frame=eJ,_handle=eK}
end end function a.ah():typeof(__modImpl())local aa=a.cache.ah if not aa then aa={c=__modImpl()}a.cache.ah=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local ei=
ab.T local ej=
ab.tween local ek=
ac.guid
local en=ac.spawnCb
local er=ac.corner
local eu=ac.hairline local ew=
ac.pad local ex=
ac.lighting
local ey=ac.ripple
local ez=ac.spotlight
local eA=ac.attachTip
local eD=ac.applyLock
local eF=ac.starRow
local eG=ac.feedbackRow
local eH=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")
local eI=ae.cloneref_check(game:GetService"Players")

return function(eJ,eK)
local eL=eJ.row
local eM=eJ.titleBlock
local eN=eJ.reg local eO=
eJ.tab local eP=
eJ.Window
local eQ=eJ.Th local eR=
eJ.opts or{}local eS=
eJ.page
eK=eK or{}
local eT=eK.Locked==true
local eU=eK.Description and eK.Description~=""
local eV=(eK.Image and eK.Image~="")or eK.UserId~=nil
local eW=eK.ButtonText~=nil and eK.ButtonText~=""
local eX=type(eK.Rating)=="table"
local eY=eU and 56 or 44
local eZ=(eW and 42 or 0)+(eX and 96 or 0)
local e_=eL(eY+eZ)
eM(e_,eK.Title or"Card",eK.Description,90)
ez(e_,0.08)
if eK.Tooltip then eA(e_,eK.Tooltip)end
local e0=14
if eV then
local e1=Instance.new"Frame"
e1.BackgroundTransparency=1
e1.AnchorPoint=Vector2.new(0,0.5)
e1.Position=UDim2.new(0,10,0,eY/2)
e1.Size=UDim2.fromOffset(34,34)
e1.BorderSizePixel=0 e1.ClipsDescendants=true
e1.Parent=e_
er(e1,8)
local e2=Instance.new"ImageLabel"
e2.BackgroundTransparency=1
e2.ScaleType=Enum.ScaleType.Crop
e2.Size=UDim2.fromScale(1,1)
e2.Parent=e1
er(e2,8)
if eK.UserId then
task.spawn(function()
local e3,e4=pcall(eI.GetUserThumbnailAsync,eI,
eK.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
if e3 and e4 and e2.Parent then e2.Image=e4 end
end)
else
e2.Image=eK.Image
end
e0=54
end
for e1,e2 in ipairs(e_:GetChildren())do
if e2:IsA"TextLabel"and e2.Position.X.Offset==14 then
e2.Position=UDim2.new(0,e0,e2.Position.Y.Scale,e2.Position.Y.Offset)
end
end
if eK.Callback then
local e1=eH("chevron",14,eQ.Dim)
e1.AnchorPoint=Vector2.new(1,0.5)e1.Position=UDim2.new(1,-14,0,eY/2)
e1.Parent=e_
local e2=Instance.new"TextButton"e2.Text=""
e2.BackgroundTransparency=1 e2.AutoButtonColor=false
e2.Size=UDim2.new(1,0,0,eY)e2.Parent=e_
e2.MouseButton1Click:Connect(function()
if eT then return end
af:_sfx"Click"en(eK.Callback)
end)
end
if eW then
local e1=Instance.new"TextButton"e1.Text=""
e1.Position=UDim2.new(0,12,0,eY+4)
e1.Size=UDim2.new(1,-24,0,30)e1.BackgroundColor3=eQ.Surface2
e1.BorderSizePixel=0 er(e1,7)e1.AutoButtonColor=false e1.Parent=e_
eu(e1,true)
af:_tag(e1,"BackgroundColor3","Surface2")
local e2=Instance.new"TextLabel"e2.BackgroundTransparency=1
e2.Size=UDim2.fromScale(1,1)e2.Font=Enum.Font.GothamBold
e2.TextSize=12
e2.Text=tostring(eK.ButtonText)e2.Parent=e1
af:_tag(e2,"TextColor3","Text")
ey(e1)
e1.MouseButton1Click:Connect(function()
if eT then return end
af:_sfx"Click"en(eK.ButtonCallback or eK.Callback)
end)
end
if eX then
local e1=eK.Rating
local e2=eY+(eW and 42 or 0)+8
local e3=eF(e_,0,5,Color3.fromRGB(255,196,64),20,e1.Default or 0)
e3.frame.Position=UDim2.new(0,12,0,e2)
local e4=eG(e_,0,26,e1.Placeholder or"Leave a comment...")
e4.frame.Position=UDim2.new(0,12,0,e2+24)
e4.frame.Size=UDim2.new(1,-24,0,26)
e4.SendBtn.MouseButton1Click:Connect(function()
if eT then return end
local e5=e3.Get()
if e5<=0 then e3.Nudge()return end
en(e1.Callback,e5,e4.Box.Text)
en(eK.Callback,e5,e4.Box.Text)
e4.Box.Text=""
e3.Set(e1.Default or 0)
end)
end
eD(e_,eT)
local e1={}
function e1.SetLocked(e2,e3)
eT=e3 and true or false
eD(e_,eT)
end
function e1.GetLocked(e2)return eT end
return eN{Title=eK.Title or"Card",Frame=e_,_handle=e1}
end end function a.ai():typeof(__modImpl())local aa=a.cache.ai if not aa then aa={c=__modImpl()}a.cache.ai=aa end return aa.c end end do local function __modImpl()a.a()






local aa=a.c()
local ab=a.e()
local ac=a.f()
local ad=a.h()
local ae=a.d()
local af=a.b()
local en=a.x()

local er=ae.Z
local eu=aa.Tween
local ex=ab.corner
local ey=ab.stroke
local ez=ab.baseCard
local eA=ac.resolveIcon
local eD=ad.FontSemi
local eF=ad.FontReg
af.cloneref_check(game:GetService"RunService")
af.cloneref_check(game:GetService"UserInputService")

local function BuildStarRow(eG,eH,eI,eJ,eK,eL,eM)
local eN=eA"Phosphor:star"
local eQ=eA"Material:star"

local eS=Instance.new"Frame"
eS.Name="Stars"
eS.BackgroundTransparency=1
eS.Size=UDim2.new(1,0,0,eK)
eS.LayoutOrder=eH
eS.ZIndex=er.Content+1
eS.Parent=eG

local eT=Instance.new"UIListLayout"
eT.FillDirection=Enum.FillDirection.Horizontal
eT.HorizontalAlignment=Enum.HorizontalAlignment.Center
eT.VerticalAlignment=Enum.VerticalAlignment.Center
eT.Padding=UDim.new(0,8)
eT.SortOrder=Enum.SortOrder.LayoutOrder
eT.Parent=eS

local eU={}
local eV=math.clamp(eL or 0,0,eI)

local function paint(eW)
local eX=eW or eV
for eY,eZ in ipairs(eU)do
local e_=eY<=eX
eZ.Image=e_ and eQ or eN
eu(eZ,{ImageColor3=e_ and eJ or eM.Dim},0.12)
end
end

for eW=1,eI do
local eX=Instance.new"ImageButton"
eX.Name="Star"..eW
eX.BackgroundTransparency=1
eX.AutoButtonColor=false
eX.Image=eN
eX.ImageColor3=eM.Dim
eX.Size=UDim2.fromOffset(eK,eK)
eX.LayoutOrder=eW
eX.ZIndex=er.Content+2
eX.Parent=eS

eX.MouseEnter:Connect(function()paint(eW)end)
eX.MouseLeave:Connect(function()paint()end)
eX.MouseButton1Click:Connect(function()
eV=eW
paint()
end)

eU[eW]=eX
end
paint()

return{
Row=eS,
Get=function()return eV end,
Set=function(eW)
eV=math.clamp(eW or 0,0,eI)
paint()
end,
Nudge=function()
for eW,eX in ipairs(eU)do eu(eX,{Rotation=8},0.06)end
task.delay(0.06,function()
for eW,eX in ipairs(eU)do eu(eX,{Rotation=0},0.12)end
end)
end,
}
end

local function BuildFeedbackRow(eG,eH,eI,eJ,eK,eL)
local eM=Instance.new"Frame"
eM.Name="Feedback"
eM.BackgroundTransparency=1
eM.Size=UDim2.new(1,0,0,eI)
eM.LayoutOrder=eH
eM.ZIndex=er.Content+1
eM.Parent=eG

local eN=Instance.new"Frame"
eN.Name="Pill"
eN.BackgroundColor3=Color3.new(1,1,1)
eN.BackgroundTransparency=0.95
eN.BorderSizePixel=0
eN.Size=UDim2.new(1,-(eI+6),1,0)
eN.ZIndex=er.Content+1
eN.Parent=eM
ex(eN,9)
local eQ=ey(eN,Color3.new(1,1,1),1,0.9)

local eS=Instance.new"UIPadding"
eS.PaddingLeft=UDim.new(0,10)
eS.PaddingRight=UDim.new(0,10)
eS.Parent=eN

local eT=Instance.new"TextBox"
eT.BackgroundTransparency=1
eT.ClearTextOnFocus=false
eT.FontFace=eF
eT.PlaceholderText=eJ or"Give us some feedback!"
eT.PlaceholderColor3=Color3.fromRGB(120,120,122)
eT.Text=""
eT.TextColor3=eL.Text
eT.TextSize=13
eT.TextXAlignment=Enum.TextXAlignment.Left
eT.TextYAlignment=Enum.TextYAlignment.Center
eT.TextTruncate=Enum.TextTruncate.AtEnd
eT.ClipsDescendants=true
eT.Size=UDim2.fromScale(1,1)
eT.ZIndex=er.Content+2
eT.Parent=eN

eT.Focused:Connect(function()
eu(eQ,{Color=eL.Accent,Transparency=0.3},0.15)
end)
eT.FocusLost:Connect(function()
eu(eQ,{Color=Color3.new(1,1,1),Transparency=0.9},0.15)
end)

local eU=Instance.new"TextButton"
eU.Name="Send"
eU.Text=""
eU.AutoButtonColor=false
eU.BackgroundColor3=Color3.new(1,1,1)
eU.BackgroundTransparency=0.9
eU.BorderSizePixel=0
eU.AnchorPoint=Vector2.new(1,0)
eU.Position=UDim2.new(1,0,0,0)
eU.Size=UDim2.fromOffset(eI,eI)
eU.ZIndex=er.Content+1
eU.Parent=eM
ex(eU,9)

local eV=Instance.new"ImageLabel"
eV.BackgroundTransparency=1
eV.Image=eA(eK or"send")
eV.ImageColor3=eL.Text
eV.Size=UDim2.fromOffset(12,12)
eV.AnchorPoint=Vector2.new(0.5,0.5)
eV.Position=UDim2.fromScale(0.5,0.5)
eV.ZIndex=er.Content+2
eV.Parent=eU

eU.MouseEnter:Connect(function()eu(eU,{BackgroundTransparency=0.8},0.12)end)
eU.MouseLeave:Connect(function()eu(eU,{BackgroundTransparency=0.9},0.12)end)

return{Row=eM,Box=eT,SendBtn=eU}
end

return function(eG,eH)
local eI=eG.reg local eJ=
eG.tab
local eK=eG.Window
local eL=eG.Th
eH=eH or{}
local eM=math.max(1,eH.MaxStars or 5)
local eN=eH.StarColor or Color3.fromRGB(255,196,64)
local eQ=eH.Title and eH.Title~=""

local eS=ez(eG.getParent(),10)
eS.AutomaticSize=Enum.AutomaticSize.Y

local eT=Instance.new"UIPadding"
eT.PaddingTop=UDim.new(0,10)
eT.PaddingBottom=UDim.new(0,10)
eT.PaddingLeft=UDim.new(0,14)
eT.PaddingRight=UDim.new(0,14)
eT.Parent=eS

local eU=Instance.new"UIListLayout"
eU.Padding=UDim.new(0,8)
eU.SortOrder=Enum.SortOrder.LayoutOrder
eU.Parent=eS

if eQ then
local eV=Instance.new"TextLabel"
eV.BackgroundTransparency=1
eV.FontFace=eD
eV.Text=eH.Title
eV.TextColor3=eL.Text
eV.TextSize=14
eV.TextXAlignment=Enum.TextXAlignment.Left
eV.Size=UDim2.new(1,0,0,16)
eV.LayoutOrder=1
eV.ZIndex=er.Content+1
eV.Parent=eS
end

local eV=BuildStarRow(eS,2,eM,eN,20,eH.Default,eL)
local eW=BuildFeedbackRow(eS,3,26,eH.Placeholder,eH.ButtonIcon,eL)

local function notifyMsg(eX)
eK:Notify{Title=eX.Title,Text=eX.Text,Type=eX.Type,Duration=eX.Duration}
end

local eX=eH.ClearOnSubmit~=false
eW.SendBtn.MouseButton1Click:Connect(function()
local eY=eV.Get()
if eY<=0 then
eV.Nudge()
return
end
if eH.Callback then task.spawn(eH.Callback,eY,eW.Box.Text)end
if eH.WebhookUrl then
task.spawn(function()
en.SendFeedbackWebhook(eH.WebhookUrl,eY,eW.Box.Text,eH.WebhookOptions,eH.CloudService,notifyMsg)
end)
end
if eX then
eW.Box.Text=""
eV.Set(eH.Default or 0)
end
end)

local eY={
Instance=eS,
Get=function()return eV.Get(),eW.Box.Text end,
Set=function(eY,eZ,e_)
eV.Set(eZ)
if e_~=nil then eW.Box.Text=e_ end
end,
Destroy=function()eS:Destroy()end,
}
eI{Title=eH.Title or"Rating",Frame=eS,_handle=eY}
return eY
end end function a.aj():typeof(__modImpl())local aa=a.cache.aj if not aa then aa={c=__modImpl()}a.cache.aj=aa end return aa.c end end do local function __modImpl()a.a()a.c()







local aa=a.e()a.f()

local ab=a.h()
local ac=a.d()
local ad=a.b()

local ae=ac.Z
local af=aa.corner
local en=aa.baseCard
ad.cloneref_check(game:GetService"RunService")
ad.cloneref_check(game:GetService"UserInputService")

local function GetUIScale()return 1 end

return function(er,eu)
local ex=er.reg
local ey=er.Th
eu=eu or{}
local ez=eu.Title or"Info"
local eA=eu.Description and eu.Description~=""
local eD=eu.Items or{}
local eF=eu.Color
local eG=eu.Columns or 2

local eH=12
local eI=eA and 32 or 16
local eJ=38
local eK=8
local eL=math.ceil(#eD/eG)
local eM=eL>0 and(eL*eJ+(eL-1)*eK)or 0
local eN=eH*2+eI+(eL>0 and(10+eM)or 0)

local eQ=en(er.getParent(),eN)

local eS=0
if eF then
local eT=Instance.new"Frame"
eT.Name="Accent"
eT.BackgroundColor3=eF
eT.BorderSizePixel=0
eT.Size=UDim2.new(0,3,1,-12)
eT.Position=UDim2.fromOffset(0,6)
eT.ZIndex=ae.Content+1
eT.Parent=eQ
af(eT,1.5)
eS=6
end

local eT=Instance.new"UIPadding"
eT.PaddingTop=UDim.new(0,eH)
eT.PaddingBottom=UDim.new(0,eH)
eT.PaddingLeft=UDim.new(0,eH+eS)
eT.PaddingRight=UDim.new(0,eH)
eT.Parent=eQ

local eU=Instance.new"TextLabel"
eU.BackgroundTransparency=1
eU.FontFace=ab.FontSemi
eU.Text=ez
eU.TextColor3=ey.Text
eU.TextSize=14
eU.TextXAlignment=Enum.TextXAlignment.Left
eU.TextTruncate=Enum.TextTruncate.AtEnd
eU.Position=UDim2.fromOffset(0,0)
eU.Size=UDim2.new(1,0,0,16)
eU.ZIndex=ae.Content+1
eU.Parent=eQ

if eA then
local eV=Instance.new"TextLabel"
eV.BackgroundTransparency=1
eV.FontFace=ab.FontReg
eV.Text=eu.Description
eV.TextColor3=ey.Dim
eV.TextSize=12
eV.TextWrapped=true
eV.TextXAlignment=Enum.TextXAlignment.Left
eV.TextYAlignment=Enum.TextYAlignment.Top
eV.Position=UDim2.fromOffset(0,18)
eV.Size=UDim2.new(1,0,0,14)
eV.ZIndex=ae.Content+1
eV.Parent=eQ
end

local eV={}

if eL>0 then
local eW=Instance.new"Frame"
eW.Name="Grid"
eW.BackgroundTransparency=1
eW.Position=UDim2.fromOffset(0,eI+10)
eW.Size=UDim2.new(1,0,0,eM)
eW.ZIndex=ae.Content+1
eW.Parent=eQ

local eX=Instance.new"UIGridLayout"
eX.CellPadding=UDim2.fromOffset(eK,eK)
eX.FillDirectionMaxCells=eG
eX.SortOrder=Enum.SortOrder.LayoutOrder
eX.Parent=eW

local function relayout()
local eY=eW.AbsoluteSize.X/GetUIScale()
if eY<=0 then return end
local eZ=(eY-eK*(eG-1))/eG
eX.CellSize=UDim2.fromOffset(eZ,eJ)
end
eW:GetPropertyChangedSignal"AbsoluteSize":Connect(relayout)
task.defer(relayout)

for eY,eZ in ipairs(eD)do
local e_=Instance.new"Frame"
e_.Name="Chip"..eY
e_.BackgroundColor3=Color3.new(1,1,1)
e_.BackgroundTransparency=0.95
e_.BorderSizePixel=0
e_.LayoutOrder=eY
e_.ZIndex=ae.Content+2
e_.Parent=eW
af(e_,6)

local e0=Instance.new"UIPadding"
e0.PaddingTop=UDim.new(0,6)
e0.PaddingLeft=UDim.new(0,8)
e0.PaddingRight=UDim.new(0,8)
e0.Parent=e_

local e1=Instance.new"TextLabel"
e1.BackgroundTransparency=1
e1.FontFace=ab.FontSemi
e1.Text=tostring(eZ.Label or"")
e1.TextColor3=ey.Text
e1.TextSize=12
e1.TextXAlignment=Enum.TextXAlignment.Left
e1.TextTruncate=Enum.TextTruncate.AtEnd
e1.Size=UDim2.new(1,0,0,15)
e1.ZIndex=ae.Content+3
e1.Parent=e_

local e2=Instance.new"TextLabel"
e2.Name="Value"
e2.BackgroundTransparency=1
e2.FontFace=ab.FontReg
e2.Text=tostring(eZ.Value or"")
e2.TextColor3=ey.Dim
e2.TextSize=11
e2.TextXAlignment=Enum.TextXAlignment.Left
e2.TextTruncate=Enum.TextTruncate.AtEnd
e2.Position=UDim2.fromOffset(0,15)
e2.Size=UDim2.new(1,0,0,12)
e2.ZIndex=ae.Content+3
e2.Parent=e_

if eZ.Label then eV[eZ.Label]=e2 end
end
end

local eW={
Instance=eQ,
SetValue=function(eW,eX,eY)
local eZ=eV[eX]
if eZ then eZ.Text=tostring(eY)end
end,
Destroy=function()eQ:Destroy()end,
}
ex{Title=ez,Frame=eQ,_handle=eW}
return eW
end end function a.ak():typeof(__modImpl())local aa=a.cache.ak if not aa then aa={c=__modImpl()}a.cache.ak=aa end return aa.c end end do local function __modImpl()a.a()a.c()a.e()a.f()a.h()a.d()











local aa=a.b()
local ab=a.ak()

aa.cloneref_check(game:GetService"RunService")
aa.cloneref_check(game:GetService"UserInputService")

return function(ac,ad)
local ae=ac.tab
ad=ad or{}
local af=ad.Service
local en=ad.Interval or 30

local er=ab(ac,{
Title=ad.Title or"Active Users",
Description=ad.Description,
Color=ad.Color,
Columns=1,
Items={{Label="Active Now",Value="--"}},
})

if not af then
er:SetValue("Active Now","No Service configured")
return er
end

local eu=true
ae._window:Track(function()eu=false end)

task.spawn(function()
while eu and er.Instance.Parent do
af:Heartbeat()
local ex,ey=af:GetActiveCount()
if eu and er.Instance.Parent then
er:SetValue("Active Now",ex and tostring(ex)or("Error: "..tostring(ey)))
end
task.wait(en)
end
end)

return er
end end function a.al():typeof(__modImpl())local aa=a.cache.al if not aa then aa={c=__modImpl()}a.cache.al=aa end return aa.c end end do local function __modImpl()a.a()a.c()a.e()a.f()a.h()a.d()










local aa=a.b()
local ab=a.y()
local ac=a.ak()

local ad=aa.cloneref_check(game:GetService"RunService")
aa.cloneref_check(game:GetService"UserInputService")

return function(ae,af)
local en=ae.tab
af=af or{}

local er=ab.BumpRunCount()

local eu=ac(ae,{
Title=af.Title or"System Info",
Description=af.Description,
Color=af.Color,
Columns=af.Columns or 2,
Items={
{Label="FPS",Value="--"},
{Label="Ping",Value="-- ms"},
{Label="Executor",Value=ab.GetExecutorName()},
{Label="Executions",Value=tostring(er)},
{Label="Server Region",Value="Unknown"},
{Label="Time of Day",Value="--:--"},
},
})

ab.ensure()
local ex=true
local ey=0
local ez
pcall(function()
ez=ad.Heartbeat:Connect(function()
if not ex then return end
local eA=os.clock()
if eA-ey>=1 then
ey=eA
pcall(function()eu:SetValue("FPS",ab.GetFps())end)
end
end)
end)

en._window:Track(function()
ex=false
if ez then pcall(function()ez:Disconnect()end)end
end)

task.spawn(function()
while ex and eu.Instance.Parent do
pcall(function()
local eA=ab.GetPingMs()or 0
eu:SetValue("Ping",math.floor(eA).." ms")

local eD=tonumber(os.date"%H")
local eF=tonumber(os.date"%M")
eu:SetValue("Time of Day",ab.FormatClock((eD or 0)*60+(eF or 0)))
end)
task.wait(1)
end
end)

task.spawn(function()
local eA=ab.GetRegion()
if eA and eA~=""and ex then
pcall(function()eu:SetValue("Server Region",eA)end)
end
end)

return eu
end end function a.am():typeof(__modImpl())local aa=a.cache.am if not aa then aa={c=__modImpl()}a.cache.am=aa end return aa.c end end do local function __modImpl()a.a()





local aa=a.c()
local ab=a.e()
local ac=a.f()
local ad=a.h()
local ae=a.d()
local af=a.b()

local en=ae.Z
local er=aa.Tween
local eu=ab.corner
local ex=ab.stroke
local ey=ac.resolveIcon
local ez=af.cloneref_check(game:GetService"Players")
local eA=ez.LocalPlayer
af.cloneref_check(game:GetService"RunService")
af.cloneref_check(game:GetService"UserInputService")

return function(eD,eF)
local eG=eD.tab
local eH=eD.Window
local eI=eD.Th
eF=eF or{}
local eJ=eF.Service
local eK=eF.Interval or 30
local eL=math.clamp(eF.Limit or 5,1,50)
local eM=eF.Title or"Leaderboard"
local eN=eF.Description and eF.Description~=""

local eQ=12
local eS=eN and 32 or 16
local eT,eU=44,6
local eV=eQ+eS+12
local eW=eL*eT+(eL-1)*eU
local eX=eV+eW+eQ

local eY=Instance.new"Frame"
eY.Name="Leaderboard"
eY.BackgroundColor3=eI.Surface
eY.BackgroundTransparency=0.35
eY.BorderSizePixel=0
eY.ClipsDescendants=true
eY.Size=UDim2.new(1,0,0,eX)
eY.ZIndex=en.Content
eY.Parent=eD.getParent()
eu(eY,8)
ex(eY,Color3.new(1,1,1),1,0.92)

local eZ=Instance.new"TextLabel"
eZ.BackgroundTransparency=1
eZ.FontFace=ad.FontSemi
eZ.Text=eM
eZ.TextColor3=eI.Text
eZ.TextSize=14
eZ.TextXAlignment=Enum.TextXAlignment.Left
eZ.TextTruncate=Enum.TextTruncate.AtEnd
eZ.Position=UDim2.fromOffset(eQ,eQ)
eZ.Size=UDim2.new(1,-eQ*2-32,0,16)
eZ.ZIndex=en.Content+1
eZ.Parent=eY

if eN then
local e_=Instance.new"TextLabel"
e_.BackgroundTransparency=1
e_.FontFace=ad.FontReg
e_.Text=eF.Description
e_.TextColor3=eI.Dim
e_.TextSize=12
e_.TextWrapped=true
e_.TextXAlignment=Enum.TextXAlignment.Left
e_.TextYAlignment=Enum.TextYAlignment.Top
e_.Position=UDim2.fromOffset(eQ,eQ+18)
e_.Size=UDim2.new(1,-eQ*2-32,0,14)
e_.ZIndex=en.Content+1
e_.Parent=eY
end

local e_=eF.RevealByDefault==true

local e0=Instance.new"TextButton"
e0.Name="RevealToggle"
e0.Text=""
e0.AutoButtonColor=false
e0.BackgroundColor3=Color3.new(1,1,1)
e0.BackgroundTransparency=1
e0.BorderSizePixel=0
e0.AnchorPoint=Vector2.new(1,0)
e0.Position=UDim2.new(1,-eQ,0,eQ-4)
e0.Size=UDim2.fromOffset(24,24)
e0.ZIndex=en.Content+2
e0.Parent=eY
eu(e0,7)

local e1=Instance.new"ImageLabel"
e1.BackgroundTransparency=1
e1.Image=ey(e_ and"eye"or"eye-off")
e1.ImageColor3=eI.Dim
e1.Size=UDim2.fromOffset(14,14)
e1.AnchorPoint=Vector2.new(0.5,0.5)
e1.Position=UDim2.fromScale(0.5,0.5)
e1.ZIndex=en.Content+3
e1.Parent=e0

eG._window:Track(e0.MouseEnter:Connect(function()
er(e0,{BackgroundTransparency=0.9},0.12)
er(e1,{ImageColor3=eI.Text},0.12)
end))
eG._window:Track(e0.MouseLeave:Connect(function()
er(e0,{BackgroundTransparency=1},0.12)
er(e1,{ImageColor3=eI.Dim},0.12)
end))

local e2=Instance.new"Frame"
e2.BackgroundColor3=Color3.new(1,1,1)
e2.BackgroundTransparency=0.92
e2.BorderSizePixel=0
e2.Position=UDim2.fromOffset(0,eQ+eS+8)
e2.Size=UDim2.new(1,0,0,1)
e2.ZIndex=en.Content+1
e2.Parent=eY

local e3=Instance.new"Frame"
e3.Name="Rows"
e3.BackgroundTransparency=1
e3.Position=UDim2.fromOffset(eQ,eV)
e3.Size=UDim2.new(1,-eQ*2,0,eW)
e3.ZIndex=en.Content+1
e3.Parent=eY

local e4=Instance.new"UIListLayout"
e4.Padding=UDim.new(0,eU)
e4.SortOrder=Enum.SortOrder.LayoutOrder
e4.Parent=e3

local e5=Instance.new"TextLabel"
e5.BackgroundTransparency=1
e5.FontFace=ad.FontReg
e5.Text="No one's run this yet"
e5.TextColor3=eI.Dim
e5.TextSize=12
e5.Position=UDim2.fromOffset(eQ,eV+10)
e5.Size=UDim2.new(1,-eQ*2,0,16)
e5.Visible=false
e5.ZIndex=en.Content+1
e5.Parent=eY

local e6={
[1]=Color3.fromRGB(255,196,64),
[2]=Color3.fromRGB(203,209,217),
[3]=Color3.fromRGB(205,141,92),
}
local e7={[1]="crown",[2]="medal",[3]="medal"}

local function formatSeconds(e8)
e8=math.floor(e8 or 0)
local e9=math.floor(e8/3600)
local fa=math.floor((e8%3600)/60)
if e9>0 then return string.format("%dh %dm",e9,fa)end
if fa>0 then return string.format("%dm",fa)end
return string.format("%ds",e8)
end

local function fallbackLabel(e8)
local e9=(e8 or""):gsub("-",""):sub(1,4):upper()
return"Player-"..(e9~=""and e9 or"????")
end

local e8={}
local function clearRows()
for e9,fa in ipairs(e8)do fa:Destroy()end
table.clear(e8)
end

local function buildRow(e9,fa)
local fb=e6[e9]

local fc=Instance.new"Frame"
fc.Name="Row"..e9
fc.Active=true
fc.BackgroundColor3=Color3.new(1,1,1)
fc.BackgroundTransparency=fa.IsYou and 0.9 or 0.96
fc.BorderSizePixel=0
fc.LayoutOrder=e9
fc.Size=UDim2.new(1,0,0,eT)
fc.ZIndex=en.Content+2
fc.Parent=e3
eu(fc,8)
ex(fc,Color3.new(1,1,1),1,fa.IsYou and 0.88 or 0.94)

local fd=fc.BackgroundTransparency
fc.MouseEnter:Connect(function()er(fc,{BackgroundTransparency=fd-0.05},0.12)end)
fc.MouseLeave:Connect(function()er(fc,{BackgroundTransparency=fd},0.12)end)

local fe=Instance.new"UIPadding"
fe.PaddingLeft=UDim.new(0,10)
fe.PaddingRight=UDim.new(0,10)
fe.Parent=fc

local ff=Instance.new"Frame"
ff.AnchorPoint=Vector2.new(0,0.5)
ff.Position=UDim2.new(0,0,0.5,0)
ff.Size=UDim2.fromOffset(28,28)
ff.BackgroundColor3=Color3.new(1,1,1)
ff.BackgroundTransparency=0.94
ff.BorderSizePixel=0
ff.ZIndex=en.Content+3
ff.Parent=fc
eu(ff,14)
ex(ff,Color3.new(1,1,1),1,0.9)

if fb then
local fg=Instance.new"ImageLabel"
fg.BackgroundTransparency=1
fg.Image=ey(e7[e9])
fg.ImageColor3=fb
fg.Size=UDim2.fromOffset(15,15)
fg.AnchorPoint=Vector2.new(0.5,0.5)
fg.Position=UDim2.fromScale(0.5,0.5)
fg.ZIndex=en.Content+4
fg.Parent=ff
else
local fg=Instance.new"TextLabel"
fg.BackgroundTransparency=1
fg.FontFace=ad.FontSemi
fg.Text="#"..tostring(e9)
fg.TextColor3=eI.Dim
fg.TextSize=11
fg.Size=UDim2.fromScale(1,1)
fg.ZIndex=en.Content+4
fg.Parent=ff
end

local fg=Instance.new"Frame"
fg.AnchorPoint=Vector2.new(0,0.5)
fg.Position=UDim2.new(0,34,0.5,0)
fg.Size=UDim2.fromOffset(28,28)
fg.BackgroundColor3=Color3.new(1,1,1)
fg.BackgroundTransparency=0.94
fg.BorderSizePixel=0
fg.ClipsDescendants=true
fg.ZIndex=en.Content+3
fg.Parent=fc
eu(fg,14)
ex(fg,Color3.new(1,1,1),1,0.85)

if fa.UserId and fa.UserId~=0 then
local fh=Instance.new"ImageLabel"
fh.BackgroundTransparency=1
fh.ScaleType=Enum.ScaleType.Crop
fh.Size=UDim2.fromScale(1,1)
fh.ZIndex=en.Content+4
fh.Parent=fg
task.spawn(function()
local fi,fj=pcall(
ez.GetUserThumbnailAsync,
ez,
fa.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size48x48
)
if fi and fj and fh.Parent then
fh.Image=fj
end
end)
else
local fh=Instance.new"ImageLabel"
fh.BackgroundTransparency=1
fh.Image=ey"user"
fh.ImageColor3=eI.Dim
fh.Size=UDim2.fromOffset(14,14)
fh.AnchorPoint=Vector2.new(0.5,0.5)
fh.Position=UDim2.fromScale(0.5,0.5)
fh.ZIndex=en.Content+4
fh.Parent=fg
end

local fh=Instance.new"TextLabel"
fh.BackgroundTransparency=1
fh.FontFace=ad.FontSemi
fh.Text=(fa.NamePreview and fa.NamePreview~=""and fa.NamePreview or fallbackLabel(fa.Identity))
..(fa.IsYou and"  (You)"or"")
fh.TextColor3=eI.Text
fh.TextSize=13
fh.TextXAlignment=Enum.TextXAlignment.Left
fh.TextTruncate=Enum.TextTruncate.AtEnd
fh.Position=UDim2.fromOffset(70,0)
fh.Size=UDim2.new(1,-138,1,0)
fh.ZIndex=en.Content+3
fh.Parent=fc

local fi=Instance.new"TextLabel"
fi.BackgroundTransparency=1
fi.FontFace=ad.FontReg
fi.Text=formatSeconds(fa.Seconds)
fi.TextColor3=eI.Dim
fi.TextSize=12
fi.TextXAlignment=Enum.TextXAlignment.Right
fi.AnchorPoint=Vector2.new(1,0)
fi.Position=UDim2.new(1,0,0,0)
fi.Size=UDim2.fromOffset(60,eT)
fi.ZIndex=en.Content+3
fi.Parent=fc

return fc
end

local function renderRows(e9)
clearRows()
e5.Visible=#e9==0

for fa,fb in ipairs(e9)do
if fa>eL then break end
table.insert(e8,buildRow(fa,fb))
end
end

renderRows{}

local e9={Instance=eY}

if not eJ then
reg{Title=eM,Frame=eY,_handle=e9}
return e9
end

local function maskName(fa,fb)
local fc=eA.Name or""
return fc:sub(1,fa)..fb
end

eG._window:Track(e0.MouseButton1Click:Connect(function()
e_=not e_
e1.Image=ey(e_ and"eye"or"eye-off")
eH:Notify{
Title="Leaderboard",
Text=e_
and"Your avatar and more of your name will show on the leaderboard."
or"Back to anonymous -- only 2 letters of your name will show.",
Type="info",
Duration=3,
}
end))

local fa=true
eG._window:Track(function()fa=false end)

task.spawn(function()
while fa and eY.Parent do
local fb=e_
and{UserId=eA.UserId,NamePreview=maskName(4,"*******")}
or{UserId=0,NamePreview=maskName(2,"********")}
eJ:Heartbeat(fb)local

fc=eJ:GetLeaderboard(eL)
if fa and eY.Parent and fc then
for fd,fe in ipairs(fc)do
fe.IsYou=fe.Identity==eJ.Identity
end
renderRows(fc)
end
task.wait(eK)
end
end)

reg{Title=eM,Frame=eY,_handle=e9}
return e9
end end function a.an():typeof(__modImpl())local aa=a.cache.an if not aa then aa={c=__modImpl()}a.cache.an=aa end return aa.c end end do local function __modImpl()a.a()a.c()







local aa=a.e()
local ab=a.f()
local ac=a.h()
local ad=a.d()
local ae=a.b()

local af=ad.Z
local en=aa.corner
local er=aa.baseCard
local eu=ab.resolveIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

local ex={
Added={Color=Color3.fromRGB(120,210,140),Icon="plus"},
Fixed={Color=Color3.fromRGB(120,170,255),Icon="wrench"},
Changed={Color=Color3.fromRGB(255,190,90),Icon="refresh-cw"},
Removed={Color=Color3.fromRGB(230,120,120),Icon="minus"},
}

return function(ey,ez)
local eA=ey.reg
local eD=ey.Th
ez=ez or{}
local eF=ez.Version or"Update"
local eG=ez.Date
local eH=ez.Changes or{}

local eI=12
local eJ=18
local eK=22
local eL=2
local eM=eI*2+eJ+(#eH>0 and 8 or 0)

local eN=er(ey.getParent(),eM)
eN.AutomaticSize=Enum.AutomaticSize.Y

local eQ=Instance.new"UIPadding"
eQ.PaddingTop=UDim.new(0,eI)
eQ.PaddingBottom=UDim.new(0,eI)
eQ.PaddingLeft=UDim.new(0,eI)
eQ.PaddingRight=UDim.new(0,eI)
eQ.Parent=eN

local eS=Instance.new"TextLabel"
eS.BackgroundTransparency=1
eS.FontFace=ac.FontSemi
eS.Text=eF
eS.TextColor3=eD.Text
eS.TextSize=14
eS.TextXAlignment=Enum.TextXAlignment.Left
eS.TextTruncate=Enum.TextTruncate.AtEnd
eS.Size=UDim2.new(1,eG and-90 or 0,0,eJ)
eS.ZIndex=af.Content+1
eS.Parent=eN

if eG then
local eT=Instance.new"TextLabel"
eT.BackgroundTransparency=1
eT.FontFace=ac.FontReg
eT.Text=eG
eT.TextColor3=eD.Dim
eT.TextSize=12
eT.TextXAlignment=Enum.TextXAlignment.Right
eT.AnchorPoint=Vector2.new(1,0)
eT.Position=UDim2.new(1,0,0,2)
eT.Size=UDim2.fromOffset(90,eJ)
eT.ZIndex=af.Content+1
eT.Parent=eN
end

local eT=Instance.new"Frame"
eT.Name="Rows"
eT.BackgroundTransparency=1
eT.Position=UDim2.fromOffset(0,eJ+8)
eT.Size=UDim2.new(1,0,0,0)
eT.AutomaticSize=Enum.AutomaticSize.Y
eT.ZIndex=af.Content+1
eT.Parent=eN

local eU=Instance.new"UIListLayout"
eU.FillDirection=Enum.FillDirection.Vertical
eU.SortOrder=Enum.SortOrder.LayoutOrder
eU.Padding=UDim.new(0,eL)
eU.Parent=eT

for eV,eW in ipairs(eH)do
local eX=ex[eW.Type]and eW.Type or"Changed"
local eY=ex[eX]

local eZ=Instance.new"Frame"
eZ.Name="Row"..eV
eZ.BackgroundTransparency=1
eZ.Size=UDim2.new(1,0,0,eK)
eZ.AutomaticSize=Enum.AutomaticSize.Y
eZ.LayoutOrder=eV*2-1
eZ.ZIndex=af.Content+1
eZ.Parent=eT

local e_=Instance.new"Frame"
e_.BackgroundColor3=eY.Color
e_.BackgroundTransparency=0.85
e_.BorderSizePixel=0
e_.AnchorPoint=Vector2.zero
e_.Position=UDim2.fromOffset(0,1)
e_.Size=UDim2.fromOffset(66,18)
e_.ZIndex=af.Content+2
e_.Parent=eZ
en(e_,5)

local e0=Instance.new"UIListLayout"
e0.FillDirection=Enum.FillDirection.Horizontal
e0.VerticalAlignment=Enum.VerticalAlignment.Center
e0.HorizontalAlignment=Enum.HorizontalAlignment.Center
e0.Padding=UDim.new(0,3)
e0.Parent=e_

local e1=Instance.new"ImageLabel"
e1.BackgroundTransparency=1
e1.Image=eu(eY.Icon)
e1.ImageColor3=eY.Color
e1.Size=UDim2.fromOffset(9,9)
e1.LayoutOrder=1
e1.ZIndex=af.Content+3
e1.Parent=e_

local e2=Instance.new"TextLabel"
e2.BackgroundTransparency=1
e2.FontFace=ac.FontSemi
e2.Text=string.upper(eX)
e2.TextColor3=eY.Color
e2.TextSize=9
e2.AutomaticSize=Enum.AutomaticSize.X
e2.Size=UDim2.fromOffset(0,12)
e2.LayoutOrder=2
e2.ZIndex=af.Content+3
e2.Parent=e_

local e3=Instance.new"TextLabel"
e3.BackgroundTransparency=1
e3.FontFace=ac.FontReg
e3.Text=tostring(eW.Text or"")
e3.TextColor3=eD.Dim
e3.TextSize=12
e3.TextXAlignment=Enum.TextXAlignment.Left
e3.TextYAlignment=Enum.TextYAlignment.Top
e3.TextWrapped=true
e3.TextTruncate=Enum.TextTruncate.None
e3.AutomaticSize=Enum.AutomaticSize.Y
e3.Position=UDim2.fromOffset(76,0)
e3.Size=UDim2.new(1,-76,0,eK)
e3.ZIndex=af.Content+2
e3.Parent=eZ

local function alignChangelogRow()
local e4=e3.TextBounds.Y>18
if e4 then
e_.AnchorPoint=Vector2.zero
e_.Position=UDim2.fromOffset(0,1)
e3.TextYAlignment=Enum.TextYAlignment.Top
else
e_.AnchorPoint=Vector2.new(0,0.5)
e_.Position=UDim2.new(0,0,0.5,0)
e3.TextYAlignment=Enum.TextYAlignment.Center
end
end
e3:GetPropertyChangedSignal"TextBounds":Connect(alignChangelogRow)
task.defer(alignChangelogRow)

if eV<#eH then
local e4=Instance.new"Frame"
e4.Name="Separator"..eV
e4.BackgroundColor3=Color3.new(1,1,1)
e4.BackgroundTransparency=0.93
e4.BorderSizePixel=0
e4.Size=UDim2.new(1,0,0,1)
e4.LayoutOrder=eV*2
e4.ZIndex=af.Content+1
e4.Parent=eT
end
end

local eV={Instance=eN,Destroy=function()eN:Destroy()end}
eA{Title=eF,Frame=eN,_handle=eV}
return eV
end end function a.ao():typeof(__modImpl())local aa=a.cache.ao if not aa then aa={c=__modImpl()}a.cache.ao=aa end return aa.c end end do local function __modImpl()







local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()a.v()a.g()


local ae=a.b()

local af=aa local en=
ab.T local er=
ab.tween local eu=
ac.guid
local ex=ac.spawnCb
local ey=ac.corner
local ez=ac.hairline local eA=
ac.pad local eD=
ac.lighting local eF=
ac.ripple
local eG=ac.spotlight
local eH=ac.attachTip
local eI=ac.applyLock
local eJ=ad.makeIcon
ae.cloneref_check(game:GetService"RunService")
ae.cloneref_check(game:GetService"UserInputService")

return function(eK,eL)
local eM=eK.row
local eN=eK.reg local eQ=
eK.tab local eS=
eK.Window
local eT=eK.Th local eU=
eK.opts or{}local eV=
eK.page
eL=eL or{}
local eW=eL.Locked==true
local eX=eL.Height or 300
local eY=math.max(1,eL.Columns or 2)
local eZ=eL.Search~=false
local e_=eL.Sorts or{}
local e0=eL.DefaultSort or e_[1]
local e1=eL.CardHeight or 96
local e2=eM(eX)
eG(e2,0.08)
if eL.Tooltip then eH(e2,eL.Tooltip)end


local e3=8
if eL.Title and eL.Title~=""then
local e4=Instance.new"TextLabel"e4.BackgroundTransparency=1
e4.Position=UDim2.new(0,12,0,8)e4.Size=UDim2.new(1,-24,0,18)
e4.Font=Enum.Font.GothamMedium e4.TextSize=13
e4.TextXAlignment=Enum.TextXAlignment.Left
e4.TextTruncate=Enum.TextTruncate.AtEnd
e4.Text=eL.Title e4.Parent=e2
af:_tag(e4,"TextColor3","Text")
e3=30
if eL.Description and eL.Description~=""then
local e5=Instance.new"TextLabel"e5.BackgroundTransparency=1
e5.Position=UDim2.new(0,12,0,26)e5.Size=UDim2.new(1,-24,0,14)
e5.Font=Enum.Font.Gotham e5.TextSize=11
e5.TextXAlignment=Enum.TextXAlignment.Left
e5.TextTruncate=Enum.TextTruncate.AtEnd
e5.Text=eL.Description e5.Parent=e2
af:_tag(e5,"TextColor3","Dim")
e3=44
end
end

local e4,e5=""
if eZ then
local e6=Instance.new"Frame"
e6.Position=UDim2.new(0,12,0,e3)e6.Size=UDim2.new(1,-24,0,28)
e6.BackgroundColor3=eT.Surface2 e6.BorderSizePixel=0
ey(e6,8)e6.Parent=e2
ez(e6,true)
af:_tag(e6,"BackgroundColor3","Surface2")
local e7=eJ("search",13,eT.Dim)
e7.Position=UDim2.new(0,10,0.5,-7)e7.Parent=e6
e5=Instance.new"TextBox"
e5.PlaceholderText=eL.SearchPlaceholder or"Search..."
e5.PlaceholderColor3=eT.Dim e5.Text=""
e5.Font=Enum.Font.Gotham e5.TextSize=12
e5.TextXAlignment=0
e5.Position=UDim2.new(0,30,0,0)e5.Size=UDim2.new(1,-38,1,0)
e5.BackgroundTransparency=1 e5.ClearTextOnFocus=false e5.Parent=e6
af:_tag(e5,"TextColor3","Text")
e3+=36
end
if#e_>1 then
for e6,e7 in ipairs(e_)do
local e8=Instance.new"TextButton"e8.Text=""
e8.Position=UDim2.new(0,12+(e6-1)*86,0,e3)
e8.Size=UDim2.new(0,80,0,22)e8.BackgroundColor3=eT.Surface2
e8.BackgroundTransparency=(e7==e0)and 0.4 or 1
e8.BorderSizePixel=0 ey(e8,6)e8.AutoButtonColor=false e8.Parent=e2
local e9=Instance.new"TextLabel"e9.BackgroundTransparency=1
e9.Size=UDim2.fromScale(1,1)e9.Font=Enum.Font.GothamBold
e9.TextSize=10 e9.Text=string.upper(tostring(e7))e9.Parent=e8
af:_tag(e9,"TextColor3",(e7==e0)and"Text"or"Dim")
e8.MouseButton1Click:Connect(function()
e0=e7
for fa,fb in ipairs(e2:GetChildren())do
if fb:IsA"TextButton"and fb.Size.Y.Offset==22 then
fb.BackgroundTransparency=1
end
end
e8.BackgroundTransparency=0.4
render()
end)
end
e3+=30
end
local e6=Instance.new"ScrollingFrame"
e6.Position=UDim2.new(0,8,0,e3)e6.Size=UDim2.new(1,-16,1,-e3-8)
e6.BackgroundTransparency=1 e6.BorderSizePixel=0
e6.ScrollBarThickness=3 e6.CanvasSize=UDim2.new(0,0,0,0)
e6.AutomaticCanvasSize=Enum.AutomaticSize.Y e6.Parent=e2
af:_tag(e6,"ScrollBarImageColor3","Surface2")
local e7=Instance.new"UIGridLayout"
e7.CellPadding=UDim2.fromOffset(8,8)
e7.CellSize=UDim2.new(1/eY,-8,0,e1)
e7.SortOrder=Enum.SortOrder.LayoutOrder e7.Parent=e6

local e8=Instance.new"TextLabel"e8.BackgroundTransparency=1
e8.Position=UDim2.new(0,12,0,e3+4)e8.Size=UDim2.new(1,-24,0,24)
e8.Font=Enum.Font.Gotham e8.TextSize=12
e8.TextXAlignment=Enum.TextXAlignment.Left
e8.Text=eL.EmptyText or"Nothing here yet."e8.Parent=e2
e8.Visible=false
af:_tag(e8,"TextColor3","Dim")
local e9={}
local fa={}
local function statsLine(fb)
local fc=fb.Likes or fb.likes
local fd=fb.Downloads or fb.downloads
local fe={}
if fc~=nil then table.insert(fe,"♥ "..tostring(fc))end
if fd~=nil then table.insert(fe,"⤓ "..tostring(fd))end
local ff=fb.ShareCode or fb.shareCode or fb.sharecode
if ff~=nil and ff~=""then table.insert(fe,tostring(ff))end
return table.concat(fe,"   ")
end
local function render()
for fb,fc in ipairs(e6:GetChildren())do
if fc:IsA"TextButton"then pcall(function()fc:Destroy()end)end
end
local fb=string.lower(e4)
local fc,fd=0,0
for fe,ff in ipairs(fa)do
fd+=1
local fg=string.lower(tostring(ff.Name or ff.Title or ff.name or"")
.." "..tostring(ff.Description or ff.description or"")
.." "..table.concat(ff.Tags or ff.tags or{}," "))
if fb~=""and not string.find(fg,fb,1,true)then continue end
fc+=1
local fh=Instance.new"TextButton"fh.Text=""
fh.BackgroundColor3=eT.Surface2 fh.BorderSizePixel=0
ey(fh,8)fh.AutoButtonColor=false fh.LayoutOrder=fd fh.Parent=e6
ez(fh,true)
af:_tag(fh,"BackgroundColor3","Surface2")
local fi=Instance.new"TextLabel"fi.BackgroundTransparency=1
fi.Position=UDim2.new(0,10,0,8)fi.Size=UDim2.new(1,-20,0,16)
fi.Font=Enum.Font.GothamBold fi.TextSize=13 fi.TextXAlignment=0
fi.TextTruncate=Enum.TextTruncate.AtEnd
fi.Text=tostring(ff.Name or ff.Title or ff.name or"Config")fi.Parent=fh
af:_tag(fi,"TextColor3","Text")
local fj=Instance.new"TextLabel"fj.BackgroundTransparency=1
fj.Position=UDim2.new(0,10,0,26)fj.Size=UDim2.new(1,-20,0,30)
fj.Font=Enum.Font.Gotham fj.TextSize=11 fj.TextXAlignment=0
fj.TextYAlignment=0 fj.TextWrapped=true fj.TextTruncate=Enum.TextTruncate.AtEnd
fj.Text=tostring(ff.Description or ff.description or"")fj.Parent=fh
af:_tag(fj,"TextColor3","Dim")
local fk=statsLine(ff)
if fk~=""then
local fl=Instance.new"TextLabel"fl.BackgroundTransparency=1
fl.AnchorPoint=Vector2.new(0,1)fl.Position=UDim2.new(0,10,1,-8)
fl.Size=UDim2.new(1,-20,0,14)
fl.Font=Enum.Font.Gotham fl.TextSize=11 fl.TextXAlignment=0
fl.TextTruncate=Enum.TextTruncate.AtEnd
fl.Text=fk fl.Parent=fh
af:_tag(fl,"TextColor3","Dim")
end
fh.MouseButton1Click:Connect(function()
if eW then return end
af:_sfx"Click"ex(eL.OnSelect,ff)
end)
end
e8.Visible=fc==0
e6.Visible=fc>0
end
function e9.Refresh(fb)
if type(eL.Fetch)=="function"then
local fc,fd=pcall(eL.Fetch,{Query=e4,Sort=e0})
if fc and type(fd)=="table"then fa=fd end
elseif type(eL.Items)=="table"then
fa=eL.Items
end
render()
end
function e9.Get(fb)return fa end
function e9.SetLocked(fb,fc)
eW=fc and true or false
eI(e2,eW)
end
function e9.GetLocked(fb)return eW end
if e5 then
e5:GetPropertyChangedSignal"Text":Connect(function()
e4=e5.Text
render()
end)
end
e9:Refresh()
eI(e2,eW)
return eN{Title=eL.Title or"Cards",Frame=e2,_handle=e9}
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
local function method(ex,ey)
ey=ey or{}

if ey.Title==nil and ey.Text~=nil then ey.Title=ey.Text end
if ey.Description==nil and ey.Desc~=nil then ey.Description=ey.Desc end
local ez=af(ad,ey)



if ey and ey.Locked then
local eF=ad.tab
local eG=eF and eF.Elements and eF.Elements[#eF.Elements]
if eG and eG.Frame then
pcall(function()ab.applyLock(eG.Frame,true)end)
end
end
return ez
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
local ex=a.h()
local ey=a.d()
local ez=aa
local eF=ab.T
local eG=ab.tween local eH=
ac.spawnCb
local eI=ac.corner
local eJ=ac.hairline
local eK=ac.pad
local eL=ac.lighting
local eM=ad.makeIcon
local eN=a.aq()

return function(eT,eV)
local eW=eT.Window
local eX=eT.opts or{}
local eY=eT.Th
local eZ=eT.pgui
local e_=eT.pages
local e0=eT.nav
local e1=eT.pill
local e2=eT.subLbl
eV=eV or{}
local e3=eV.Title or("Tab "..(#eW._tabs+1))
local e4=eV.Icon or e3

local e5=Instance.new"TextButton"
e5.Text=""
e5.Size=UDim2.new(1,0,0,34)
e5.BackgroundColor3=eY.Surface2
e5.BackgroundTransparency=1
e5.BorderSizePixel=0
eI(e5,8)
e5.LayoutOrder=#eW._tabs+10
e5.AutoButtonColor=false
e5.Parent=e0
e5.ZIndex=2
e5.Visible=true
local e6=#eW._tabs+1
local e7=eM(e4,15,eY.Dim)
e7.AnchorPoint=Vector2.new(0,0.5)
e7.Position=UDim2.new(0,14,0.5,0)
e7.Parent=e5
e7.Visible=true
e7.ZIndex=3
if e7:IsA"TextLabel"then e7.Size=UDim2.new(0,15,0,15)end
local e8=Instance.new"TextLabel"e8.BackgroundTransparency=1
e8.Position=UDim2.new(0,37,0,0)
e8.Size=UDim2.new(1,-49,1,0)
e8.Font=Enum.Font.GothamMedium
e8.TextSize=13
e8.TextXAlignment=0
e8.TextTruncate=Enum.TextTruncate.AtEnd
e8.Text=e3
e8.Parent=e5
e8.Visible=true
e8.TextTransparency=0
e8.ZIndex=3
ae.tag(e8,"TextColor3","Dim")
e5.MouseEnter:Connect(function()
if eW._active and eW._active.Btn==e5 then return end
eG(e5,eF.Hover,{BackgroundTransparency=0.55})
ae.tag(e8,"TextColor3","Text")
end)
e5.MouseLeave:Connect(function()
if eW._active and eW._active.Btn==e5 then return end
eG(e5,eF.Hover,{BackgroundTransparency=1})
ae.tag(e8,"TextColor3","Dim")
end)

local e9=Instance.new"ScrollingFrame"
e9.Visible=false
e9.Size=UDim2.fromScale(1,1)
e9.BackgroundTransparency=1
e9.BorderSizePixel=0
e9.ScrollBarThickness=3
e9.ScrollBarImageColor3=eY.Surface2
e9.CanvasSize=UDim2.new(0,0,0,0)
e9.AutomaticCanvasSize=Enum.AutomaticSize.Y
e9.Parent=e_
ae.tag(e9,"ScrollBarImageColor3","Surface2")
local fa=Instance.new"UIListLayout"
fa.Padding=UDim.new(0,8)
fa.SortOrder=Enum.SortOrder.LayoutOrder
fa.Parent=e9
eK(e9,2,8,2,6)




local fb=e9

local fc={Title=e3,Btn=e5,Page=e9,Elements={},_label=e8,_icon=e7}
fc._pl=fa

local fd=eX.SubTitle or eX.Subtitle or"scripthub"

local function setActive(fe)
eW._active=fc
pcall(function()
e2.Text=string.upper(fd).."  /  "..string.upper(e3)
end)
for ff,fg in ipairs(eW._tabs)do
local fh=fg==fc
fg.Page.Visible=fh
local fi=fg._label
fi.TextTransparency=0
eG(fg.Btn,eF.Hover,{BackgroundTransparency=1})
if fh then
ae.tag(fi,"TextColor3","Text")
if fg._icon and fg._icon:IsA"ImageLabel"then
fg._icon.ImageTransparency=0
eG(fg._icon,eF.Hover,{ImageColor3=aa.Theme.Accent})
end
else
ae.tag(fi,"TextColor3","Dim")
if fg._icon and fg._icon:IsA"ImageLabel"then
fg._icon.ImageTransparency=0
eG(fg._icon,eF.Hover,{ImageColor3=aa.Theme.Dim})
end
end
end




local function syncPill()
if not e5.Visible then
e1.Visible=false
return
end
e1.Visible=true
local ff={}
for fg,fh in ipairs(e0:GetChildren())do
if fh:IsA"GuiObject"and fh.Visible and fh.AbsoluteSize.Y>0 then
table.insert(ff,fh)
end
end
table.sort(ff,function(fg,fh)return fg.LayoutOrder<fh.LayoutOrder end)
local fg=-2
for fh,fi in ipairs(ff)do
if fi==e5 then
eG(e1,eF.Med,{Position=UDim2.new(0,0,0,fg)})
return
end
fg=fg+fi.AbsoluteSize.Y+4
end
local fh=e1.Parent
if e5.Parent and fh and fh.Parent and e5.AbsoluteSize.Y>0 then
local fi,fj,fk=pcall(function()
return e5.AbsolutePosition.Y,fh.AbsolutePosition.Y
end)
if fi and fj and fk then
eG(e1,eF.Med,{Position=UDim2.new(0,0,0,fj-fk-2)})
return
end
end
eG(e1,eF.Med,{Position=UDim2.new(0,0,0,(e6-1)*38-2)})
end
syncPill()
task.delay(0.2,function()
if e5.Parent then syncPill()end
end)
if fe then
e9.Position=UDim2.new(0,14,0,0)
eG(e9,eF.Med,{Position=UDim2.new(0,0,0,0)})
local ff=0
for fg,fh in ipairs(e9:GetChildren())do
if fh:IsA"Frame"or fh:IsA"CanvasGroup"then
ff+=1
local fi=math.min(ff*0.02,0.3)
task.delay(fi,function()
if not fh.Parent then return end
local fj=Instance.new"Frame"
fj.Name="_cascade"
fj.Size=UDim2.fromScale(1,1)
fj.BackgroundColor3=eY.Surface2
fj.BackgroundTransparency=0.55
fj.BorderSizePixel=0
eI(fj,10)
fj.Parent=fh
eG(fj,eF.Fast,{BackgroundTransparency=1})
task.delay(0.2,function()pcall(function()fj:Destroy()end)end)
end)
end
end
end
for ff,fg in ipairs(eW._tabChangeListeners or{})do
pcall(fg,fc)
end
end
e5.MouseButton1Click:Connect(function()af.sfx"Swap"setActive(true)end)

if eV.Hidden then e5.Visible=false end
fc._hidden=eV.Hidden and true or false
fc.Hidden=fc._hidden
table.insert(eW._tabs,fc)

if string.lower(e3)=="settings"and not eW._settingsDock
and eW._dockAdd then
eW._settingsDock=true
eW._dockAdd("Settings",eV.Icon or"settings",function()
eW._activateTab(fc,true)
end,fc)
end
if#eW._tabs==1 then
setActive(false)
e1.Position=UDim2.new(0,0,0,-2)
e1.Size=UDim2.new(1,0,0,38)
end
task.delay(1,function()
pcall(function()
e8.TextTransparency=0
if e7:IsA"ImageLabel"then e7.ImageTransparency=0 end
end)
end)

local function row(fe)
local ff=Instance.new"Frame"
ff.Size=UDim2.new(1,-4,0,fe)
ff.BackgroundColor3=eY.Surface
ff.BorderSizePixel=0
local fg=math.clamp((eX.Radius or 12)-2,4,12)
eI(ff,fg)
eL(ff,fg)
ff.Parent=fb
eJ(ff,true)
ae.tag(ff,"BackgroundColor3","Surface")
local fh=ff:FindFirstChild"_light"
if fh then fh.Visible=false end
ff.BackgroundTransparency=1
task.delay(#fc.Elements*0.025,function()
eG(ff,eF.Med,{BackgroundTransparency=0})
task.delay(0.25,function()if fh and fh.Parent then fh.Visible=true end end)
end)
return ff
end
local function titleBlock(fe,ff,fg,fh,fi)
fh=fh or 112
local fj=Instance.new"TextLabel"
fj.BackgroundTransparency=1
if fg then
fj.Position=UDim2.new(0,14,0,9)
fj.Size=UDim2.new(1,-fh,0,17)
elseif fi then
fj.Position=UDim2.new(0,14,0,8)
fj.Size=UDim2.new(1,-fh,0,17)
else
fj.Position=UDim2.new(0,14,0,0)
fj.Size=UDim2.new(1,-fh,1,0)
end
fj.Font=Enum.Font.GothamMedium
fj.TextSize=13
fj.TextXAlignment=0
fj.TextTruncate=Enum.TextTruncate.AtEnd
fj.Text=ff
fj.Parent=fe
ae.tag(fj,"TextColor3","Text")
if fg then
local fk=Instance.new"TextLabel"
fk.BackgroundTransparency=1
fk.Position=UDim2.new(0,14,0,30)
fk.Size=UDim2.new(1,-fh,0,14)
fk.Font=Enum.Font.Gotham
fk.TextSize=11
fk.TextXAlignment=0
fk.TextTruncate=Enum.TextTruncate.AtEnd
fk.Text=fg
fk.Parent=fe
ae.tag(fk,"TextColor3","Dim")
end
end
local function reg(fe)
table.insert(fc.Elements,fe)
fe._tab=fc


if fe.Frame and fe.Frame.Parent and(aa._textScale or 1)~=1 then
pcall(function()ex.paintFonts(fe.Frame)end)
end
if not fe._go then
fe._go=function()
if eW._activateTab then eW._activateTab(fc,true)end
eW:_flash(fe.Frame)
end
end
if fe.Flag and fe._set then
aa._live[fe.Flag]=aa._live[fe.Flag]or{}
table.insert(aa._live[fe.Flag],fe._set)
if aa.Flags["_loaded_"..fe.Flag]~=nil then
local ff=aa.Flags["_loaded_"..fe.Flag]
aa.Flags["_loaded_"..fe.Flag]=nil
task.defer(function()pcall(fe._set,ff,true)end)
elseif fe.Value~=nil and aa.Flags[fe.Flag]==nil then
aa.Flags[fe.Flag]=fe.Value
end
elseif fe.Flag and fe.Value~=nil and aa.Flags[fe.Flag]==nil then
aa.Flags[fe.Flag]=fe.Value
end
return fe._handle
end

local fe={}
local ff={row=row,titleBlock=titleBlock,reg=reg,tab=fc,Window=eW,Th=eY,opts=eX,page=e9,pgui=eZ,
getParent=function()return fb end}
eN.attach(fe,ff)




fc._subtabs={}
fc.SelectedSubTab=nil
local fg



local function selBtn(fh,fi)
if fh.btn then
local fj=fh.btn:FindFirstChildOfClass"TextLabel"
if fj then ae.tag(fj,"TextColor3",fi and"Text"or"Dim")end
end
if fh.ind then fh.ind.Visible=fi end
end
local function selectSub(fh,fi)
local fj=fc._subtabs
if#fj==0 then return end
local fk
if type(fh)=="number"then
fk=math.clamp(fh,1,#fj)
else
for fl,fm in ipairs(fj)do
if fm.name==fh then fk=fl break end
end
fk=fk or 1
end
fc.SelectedSubTab=fj[fk].name
for fl,fm in ipairs(fj)do
local fn=fl==fk
fm.holder.Visible=fn
if fn then fb=fm.holder end
selBtn(fm,fn)
end
if not fi then
ez:_sfx"Swap"
ey.closeAny()
end
end
fc.SelectSubTab=function(fh,fi)selectSub(fi)end
fc.SelectSubTabByName=function(fh,fi)
for fj,fk in ipairs(fc._subtabs)do
if fk.name==fi then
selectSub(fk.name)
return{Name=fk.name}
end
end
return nil
end
fc.SubTab=function(fh,fi)
fi=fi or{}
if type(fi)=="string"then fi={Name=fi}end
local fj=fi.Name or("Sub "..(#fc._subtabs+1))
if#fc._subtabs==0 then


e9.ScrollingEnabled=false
if fa and fa.Parent then pcall(function()fa:Destroy()end)end
fc._pl=nil
for fk,fl in ipairs(e9:GetChildren())do
if fl:IsA"UIPadding"then pcall(function()fl:Destroy()end)end
end
if fa and fa.Parent then pcall(function()fa:Destroy()end)end
fc._pl=nil
fg=Instance.new"ScrollingFrame"
fg.Name="_subbar"
fg.Position=UDim2.new(0,2,0,2)fg.Size=UDim2.new(1,-4,0,36)
fg.BackgroundTransparency=1 fg.BorderSizePixel=0
fg.ScrollingDirection=Enum.ScrollingDirection.X
fg.ScrollBarThickness=0
fg.AutomaticCanvasSize=Enum.AutomaticSize.X
fg.CanvasSize=UDim2.new(0,0,0,0)
fg.Parent=e9
local fk=Instance.new"UIListLayout"
fk.FillDirection=Enum.FillDirection.Horizontal
fk.VerticalAlignment=Enum.VerticalAlignment.Center
fk.Padding=UDim.new(0,6)fk.Parent=fg
end
local fk=Instance.new"ScrollingFrame"
fk.Name="_subbody"
fk.Position=UDim2.new(0,0,0,44)fk.Size=UDim2.new(1,0,1,-44)
fk.BackgroundTransparency=1 fk.BorderSizePixel=0
fk.ScrollBarThickness=3 fk.CanvasSize=UDim2.new(0,0,0,0)
fk.AutomaticCanvasSize=Enum.AutomaticSize.Y
fk.Visible=false fk.Parent=e9
ae.tag(fk,"ScrollBarImageColor3","Surface2")
local fl=Instance.new"UIListLayout"fl.Padding=UDim.new(0,8)
fl.SortOrder=Enum.SortOrder.LayoutOrder fl.Parent=fk
eK(fk,2,8,2,6)
local fm=Instance.new"TextButton"fm.Text=""
fm.Size=UDim2.new(0,0,0,30)fm.AutomaticSize=Enum.AutomaticSize.X
fm.BackgroundColor3=eY.Surface2 fm.BackgroundTransparency=1
fm.BorderSizePixel=0 eI(fm,8)fm.AutoButtonColor=false fm.Parent=fg
local fn=Instance.new"UIPadding"
fn.PaddingLeft=UDim.new(0,16)fn.PaddingRight=UDim.new(0,16)
fn.Parent=fm


local fo=4
if fi.Icon and fi.Icon~=""then
local fp=eM(fi.Icon,14,eY.Dim)
fp.AnchorPoint=Vector2.new(0,0.5)fp.Position=UDim2.new(0,0,0.5,0)
fp.Parent=fm
if fp:IsA"TextLabel"then fp.Size=UDim2.new(0,14,0,14)end
fo=20
end
local fp=Instance.new"TextLabel"fp.BackgroundTransparency=1
fp.Position=UDim2.new(0,fo,0,0)fp.Size=UDim2.new(0,0,1,0)
fp.AutomaticSize=Enum.AutomaticSize.X
fp.Font=Enum.Font.GothamMedium fp.TextSize=12 fp.TextXAlignment=0
fp.TextTruncate=Enum.TextTruncate.AtEnd fp.Text=fj fp.Parent=fm
ae.tag(fp,"TextColor3","Dim")


local fq=Instance.new"Frame"fq.Name="_sel"
fq.Size=UDim2.fromScale(1,1)fq.BackgroundColor3=eY.Surface2
fq.BorderSizePixel=0 fq.ZIndex=0
eI(fq,8)fq.Parent=fm
eJ(fq,true)
ae.tag(fq,"BackgroundColor3","Surface2")
fq.Visible=false
local fr={name=fj,btn=fm,label=fp,holder=fk,ind=fq}
table.insert(fc._subtabs,fr)
fm.MouseButton1Click:Connect(function()
for fs,ft in ipairs(fc._subtabs)do
if ft==fr then selectSub(fs)break end
end
end)
if#fc._subtabs==1 then

for fs,ft in ipairs(e9:GetChildren())do
if ft:IsA"GuiObject"and ft~=fg and ft~=fk then
pcall(function()ft.Parent=fk end)
end
end
selectSub(1,true)

task.defer(function()
if fc.SelectedSubTab then selectSub(fc.SelectedSubTab,true)end
end)
end


fb=fk
return setmetatable({_sub=fr,_tab=fc},{
__index=function(fs,ft)
if ft=="Select"then return function()selectSub(fj)end end
local fu=fc[ft]
if type(fu)=="function"then
return function(fv,...)return fu(fc,...)end
end
return fu
end,
})
end

fc.Api=fe
fc._window=eW
fc._activate=function(fh)setActive(fh~=false)end
for fh,fi in pairs(fe)do fc[fh]=function(fj,...)return fi(fc,...)end end
return fc
end end function a.ar():typeof(__modImpl())local aa=a.cache.ar if not aa then aa={c=__modImpl()}a.cache.ar=aa end return aa.c end end do local function __modImpl()






local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.v()
local ae=a.b()

local af=ab.T
local ex=ab.tween
local ey=ac.spawnCb
local ez=ac.corner
local eF=ac.hairline
local eG=ac.lighting
local eH=ac.shadow
local eI=ae.cloneref_check(game:GetService"RunService")
local eJ=ae.cloneref_check(game:GetService"Players")

local eK={Noob=true,Chams=true,Solid=true,Ghost=true,
Box=true,Outline=true,["HP bar"]=true,Name=true}

return function(eL,eM)
local eN=eL.Window
local eT=eL.Th
local eV=eL.main
local eW=eL.gui

eM=eM or{}
local eX,eY=eM.Width or 175,eM.Height or 370
local eZ=eM.Accent or eT.Accent
if type(eZ)=="table"then
eZ=Color3.new(eZ[1]or 0,eZ[2]or 0,eZ[3]or 0)
end
local e_=tostring(eM.Mode or"Chams")
if not eK[e_]then e_="Chams"end
local e0,e1,e2,e3=true,true,false,100
local e4
pcall(function()e4=eJ.LocalPlayer end)
local e5=eM.Name or((e4 and e4.DisplayName)or"Noob")
local e6=(e4 and("@"..e4.Name))or""
local e7=Instance.new"Frame"
e7.Name=ae.GetStealthName()
e7.AnchorPoint=Vector2.new(0,0.5)
e7.Size=UDim2.fromOffset(eX,eY)
e7.BackgroundColor3=eT.Surface e7.BorderSizePixel=0
ez(e7,12)e7.Parent=eW e7.Visible=false
eF(e7,true)eG(e7,12)eH(e7,0.5,40)
ad.tag(e7,"BackgroundColor3","Surface")
local e8=Instance.new"UIScale"e8.Scale=0.92 e8.Parent=e7
local function dock()
if not eV or not eV.Parent then return end
local e9=eV.Size.X.Offset
e7.Position=UDim2.new(eV.Position.X.Scale,
eV.Position.X.Offset+e9/2+12,
eV.Position.Y.Scale,eV.Position.Y.Offset)
end
eN:Track(eV:GetPropertyChangedSignal"Position":Connect(dock))
eN:Track(eV:GetPropertyChangedSignal"Size":Connect(dock))
local e9=Instance.new"TextLabel"e9.BackgroundTransparency=1
e9.Position=UDim2.new(0,14,0,0)e9.Size=UDim2.new(1,-48,0,34)
e9.Font=Enum.Font.GothamBold e9.TextSize=14 e9.TextXAlignment=0
e9.TextTruncate=Enum.TextTruncate.AtEnd e9.Text=eM.Title or"Preview"e9.Parent=e7
ad.tag(e9,"TextColor3","Text")
local fa={open=false}
local function setOpen(fb,fc)
fb=fb and true or false
if fb==fa.open and e7.Visible==fb then return end
fa.open=fb
if fb then
dock()
e7.Visible=true

local fd=eN._popouts
if fd then
local fe
for ff,fg in ipairs(fd)do
if fg.frame==e7 then fe=fg break end
end
if not fe then
fe={frame=e7}
table.insert(fd,fe)
end
fe.open=true
end
local fe=e7.Position.X.Offset
e7.Position=UDim2.new(e7.Position.X.Scale,fe-24,
e7.Position.Y.Scale,e7.Position.Y.Offset)
ex(e7,af.Med,{Position=UDim2.new(e7.Position.X.Scale,fe,
e7.Position.Y.Scale,e7.Position.Y.Offset)})
ex(e8,af.Spring,{Scale=1})
else
local fd=eN._popouts
if fd then
for fe,ff in ipairs(fd)do
if ff.frame==e7 then table.remove(fd,fe)break end
end
end
ex(e7,af.Fast,{Position=UDim2.new(e7.Position.X.Scale,
e7.Position.X.Offset-16,e7.Position.Y.Scale,e7.Position.Y.Offset)})
task.delay(0.18,function()
if not fa.open then e7.Visible=false end
end)
if fc then ey(eM.OnClose)end
end
end
local fb=Instance.new"TextButton"fb.Text=""
fb.AnchorPoint=Vector2.new(1,0)fb.Position=UDim2.new(1,-10,0,8)
fb.Size=UDim2.fromOffset(14,14)fb.BackgroundColor3=Color3.fromRGB(255,95,86)
fb.BorderSizePixel=0 fb.AutoButtonColor=false fb.Parent=e7
ez(fb,99)
fb.MouseEnter:Connect(function()
ex(fb,af.Hover,{BackgroundColor3=Color3.fromRGB(215,70,62)})
end)
fb.MouseLeave:Connect(function()
ex(fb,af.Hover,{BackgroundColor3=Color3.fromRGB(255,95,86)})
end)
fb.MouseButton1Click:Connect(function()setOpen(false,true)end)

local fc=Instance.new"ViewportFrame"
fc.Position=UDim2.new(0,10,0,36)fc.Size=UDim2.new(1,-20,1,-48)
fc.BackgroundColor3=eT.Bg fc.BorderSizePixel=0
fc.LightColor=Color3.fromRGB(255,255,255)
fc.LightDirection=Vector3.new(-0.5,-1,-0.6)
fc.Ambient=Color3.fromRGB(150,150,168)
ez(fc,8)fc.Parent=e7
ad.tag(fc,"BackgroundColor3","Bg")
local fd=Instance.new"Frame"fd.BackgroundTransparency=1
fd.Size=UDim2.fromScale(1,1)fd.Parent=fc
local fe={}
local function bracket(ff,fg)
local fh=Instance.new"Frame"fh.BorderSizePixel=0
fh.AnchorPoint=Vector2.new(ff,fg)fh.Position=UDim2.new(ff,0,fg,0)
fh.Size=UDim2.new(0,14,0,2)fh.Parent=fd
ad.tag(fh,"BackgroundColor3","Accent")
local fi=Instance.new"Frame"fi.BorderSizePixel=0
fi.AnchorPoint=Vector2.new(ff,fg)fi.Position=UDim2.new(ff,0,fg,0)
fi.Size=UDim2.new(0,2,0,14)fi.Parent=fd
ad.tag(fi,"BackgroundColor3","Accent")
table.insert(fe,fh)table.insert(fe,fi)
end
bracket(0,0)bracket(1,0)bracket(0,1)bracket(1,1)
local ff=Instance.new"TextLabel"ff.BackgroundTransparency=1
ff.AnchorPoint=Vector2.new(0.5,0)ff.Position=UDim2.new(0.5,0,0,4)
ff.Size=UDim2.new(1,-16,0,15)ff.Font=Enum.Font.GothamBold
ff.TextSize=11 ff.Text=e5 ff.Parent=fd
ad.tag(ff,"TextColor3","Text")
local fg=Instance.new"TextLabel"fg.BackgroundTransparency=1
fg.AnchorPoint=Vector2.new(0.5,0)fg.Position=UDim2.new(0.5,0,0,19)
fg.Size=UDim2.new(1,-16,0,12)fg.Font=Enum.Font.Gotham
fg.TextSize=10 fg.Text=e6 fg.Parent=fd
ad.tag(fg,"TextColor3","Dim")
local fh=Instance.new"Frame"fh.BorderSizePixel=0
fh.AnchorPoint=Vector2.new(0,0.5)fh.Position=UDim2.new(0,6,0.5,0)
fh.Size=UDim2.new(0,4,1,-40)fh.BackgroundColor3=eT.Surface2
ez(fh,99)fh.Parent=fd
ad.tag(fh,"BackgroundColor3","Surface2")
local fi=Instance.new"Frame"fi.BorderSizePixel=0
fi.AnchorPoint=Vector2.new(0,1)fi.Position=UDim2.new(0,0,1,0)
fi.Size=UDim2.new(1,0,1,0)fi.BackgroundColor3=eT.Success
ez(fi,99)fi.Parent=fh
ad.tag(fi,"BackgroundColor3","Success")

local fj=Instance.new"WorldModel"fj.Parent=fc
local fk=Instance.new"Camera"fk.Parent=fc
fc.CurrentCamera=fk
fk.CFrame=CFrame.new(Vector3.new(0,3.0,9),Vector3.new(0,2.4,0))
local fl,fm,fn={},{},{}
local function part(fo,fp,fq)
local fr=Instance.new"Part"fr.Name=fo
fr.Size=fp fr.Position=fq fr.Anchored=true fr.CanCollide=false
fr.TopSurface=Enum.SurfaceType.Smooth
fr.BottomSurface=Enum.SurfaceType.Smooth
fr.Color=Color3.fromRGB(200,200,215)
fr.Material=Enum.Material.Plastic
fr.Parent=fj
table.insert(fl,fr)
if fo=="Left Arm"or fo=="Right Arm"then fm[fo]=fr end
local fs=Instance.new"SelectionBox"
fs.Adornee=fr fs.LineThickness=0.05
fs.Color3=Color3.fromRGB(255,255,255)
fs.SurfaceTransparency=1 fs.Visible=false
fs.Parent=fr
fn[fr]=fs
return fr
end
part("Head",Vector3.new(1.1,0.7,1.1),Vector3.new(0,4.35,0))
part("Torso",Vector3.new(2,2,1),Vector3.new(0,3,0))
part("Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,3,0))
part("Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,3,0))
part("Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,1,0))
part("Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,1,0))
local fo={
Head=Color3.fromRGB(245,205,48),
Torso=Color3.fromRGB(13,105,172),
["Left Arm"]=Color3.fromRGB(245,205,48),
["Right Arm"]=Color3.fromRGB(245,205,48),
["Left Leg"]=Color3.fromRGB(164,189,71),
["Right Leg"]=Color3.fromRGB(164,189,71),
}
local function paint()
for fp,fq in ipairs(fl)do
if fq and fq.Parent then
if e_=="Noob"then
fq.Color=fo[fq.Name]or Color3.fromRGB(200,200,215)
fq.Material=Enum.Material.Plastic
fq.Transparency=0
elseif e_=="Ghost"then
fq.Color=eZ
fq.Material=Enum.Material.ForceField
fq.Transparency=0
elseif e_=="Solid"or e_=="Box"then
fq.Color=Color3.fromRGB(200,200,215)
fq.Material=Enum.Material.Plastic
fq.Transparency=0
else
fq.Color=eZ
fq.Material=Enum.Material.Plastic
fq.Transparency=0
end
local fr=fn[fq]
if fr then
fr.Visible=e2 or e_=="Outline"
fr.Color3=eZ
end
end
end
for fp,fq in ipairs(fe)do
if fq then fq.Visible=e0 or e_=="Box"end
end
ff.Visible=e1 or e_=="Name"
fg.Visible=ff.Visible
fh.Visible=e0 or e_=="HP bar"
end
paint()

local fp=0
local fq={}
for fr,fs in ipairs(fl)do fq[fs]=fs.Position end
local fr={
["Left Arm"]=Vector3.new(-1,3.9,0),
["Right Arm"]=Vector3.new(1,3.9,0),
}
local fs
fs=eI.RenderStepped:Connect(function(ft)
if not fc.Parent then pcall(function()fs:Disconnect()end)return end
if not fa.open then return end
fp+=ft
local fu=math.sin(fp*2.2)*0.045
local fv=math.sin(fp*2.2)*0.09
for fw,fx in ipairs(fl)do
if fx and fx.Parent and fq[fx]then
local fy=fr[fx.Name]
if fy then
local fz=fx.Name=="Left Arm"and 1 or-1
fx.CFrame=CFrame.new(fy)
*CFrame.Angles(fv*fz,0,0.05*fz)
*CFrame.new(fq[fx]-fy+Vector3.new(0,fu,0))
else
fx.Position=fq[fx]+Vector3.new(0,fu,0)
end
end
end
end)
eN:Track(fs)
function fa.Show(ft)setOpen(true)end
function fa.Hide(ft,fu)setOpen(false,not fu)end
function fa.Toggle(ft)setOpen(not fa.open,not fa.open)end
function fa.SetVisible(ft,fu)
if fu then ft:Show()else ft:Hide(true)end
end
function fa.IsOpen(ft)return fa.open end
function fa.SetAccent(ft,fu)
if type(fu)=="table"then
fu=Color3.new(fu[1]or 0,fu[2]or 0,fu[3]or 0)
end
if typeof(fu)=="Color3"then eZ=fu paint()end
end
function fa.SetMode(ft,fu)e_=tostring(fu)if not eK[e_]then e_="Chams"end paint()end
function fa.SetBox(ft,fu)
e0=fu and true or false paint()
end
function fa.SetOutline(ft,fu)
e2=fu and true or false paint()
end
function fa.SetName(ft,fu)
e1=fu and true or false paint()
end
function fa.SetNameText(ft,fu)
local fv=tostring(fu or"")
local fw=string.find(fv,"@")
if fw then
ff.Text=string.sub(fv,1,fw-1)
fg.Text="@"..string.gsub(string.sub(fv,fw+1),"^@","")
else
ff.Text=fv
end
e5=ff.Text
end
function fa.SetHealth(ft,fu)
e3=math.clamp(tonumber(fu)or 100,0,100)
ex(fi,af.Fast,{Size=UDim2.new(1,0,e3/100,0)})
end

aa._live.ESPColor=aa._live.ESPColor or{}
table.insert(aa._live.ESPColor,function(ft,fu)
local fv=ft
if type(fv)=="table"then
fv=Color3.new(fv[1]or 0,fv[2]or 0,fv[3]or 0)
end
if typeof(fv)=="Color3"then eZ=fv paint()end
end)
if aa.Flags.ESPColor~=nil then
local ft=aa.Flags.ESPColor
if type(ft)=="table"then
ft=Color3.new(ft[1]or 0,ft[2]or 0,ft[3]or 0)
end
if typeof(ft)=="Color3"then eZ=ft paint()end
end
return fa
end end function a.as():typeof(__modImpl())local aa=a.cache.as if not aa then aa={c=__modImpl()}a.cache.as=aa end return aa.c end end do local function __modImpl()a.a()






local aa=a.b()
local ab=a.A()

local function localConfigs(ac)
local ad={}
local ae=ac._folder or"Kronos"
pcall(function()
local af,ex=aa.hasFn"listfiles",aa.hasFn"isfolder"
if af and ex and ex(ae)then
for ey,ez in ipairs(af(ae))do
local eF=string.match(ez,"([^/\\]+)%.json$")
if eF then table.insert(ad,{Name=eF,Description="On this device"})end
end
end
end)
table.sort(ad,function(af,ex)return af.Name<ex.Name end)
return ad
end

return function(ac,ad)
ad=ad or{}
local ae=ad.Service
local af=ac:Tab{Title=ad.Name or"Cloud",Icon=ad.Icon or"cloud",Hidden=ad.Hidden~=false}
if ad.OnToggle then
table.insert(ac._tabChangeListeners,function(ex)
if ex==af then task.spawn(ad.OnToggle,true)
else
for ey,ez in ipairs(ac._tabs)do
if ez==af then task.spawn(ad.OnToggle,false)break end
end
end
end)
end
function af.Open(ex)
ac._activateTab(af,true)
end

local ex,ey,ez
local eF=af:SubTab{Name="Local Configs",Icon="save"}
eF:Paragraph{Title="Local Library",
Description="Private presets on this device. Load, save and publish them."}
eF:Button{Title="Save current locally",Description="Stays on this device only",
Callback=function()
ac:Modal{
Title="Save Config Locally",Text="Stays only on this device.",
ConfirmText="Save",CancelText="Cancel",
Fields={
{Key="Name",Label="Name",Placeholder="Enter a name...",MaxLength=60},
{Key="Description",Label="Description (optional)",
Placeholder="What's different?",MaxLength=280,Type="textarea"},
},
Callback=function(eG,eH)
if not eG then return end
if not eH.Name or eH.Name:gsub("%s+","")==""then
ac:Notify{Title="Local Save",Content="Name can't be empty.",Duration=3}
return
end
ac:SaveConfig(eH.Name)
if ex then ex:Refresh()end
end,
}
end}
ex=eF:CardGrid{Title="Local Configs",Height=260,Columns=2,
Search=true,SearchPlaceholder="Search local configs...",
EmptyText="No local configs saved yet.",
Fetch=function(eG)
local eH=localConfigs(ac)
local eI=string.lower(tostring(eG and eG.Query or""))
if eI==""then return eH end
local eJ={}
for eK,eL in ipairs(eH)do
if string.find(string.lower(eL.Name),eI,1,true)then table.insert(eJ,eL)end
end
return eJ
end,
OnSelect=function(eG)
ac:Confirm{
Title="Load \""..tostring(eG.Name).."\"?",
Text="Overwrites current settings. A snapshot is kept for undo.",
ConfirmText="Load",CancelText="Cancel",
Callback=function(eH)
if not eH then return end
local eI=ab.Snapshot()
ac:LoadConfig(eG.Name)
ac:Notify{Title="Loaded",Content=eG.Name,Duration=2}
eG._snap=eI
end,
}
end}

local eG=af:SubTab{Name="Publish",Icon="upload"}
eG:Paragraph{Title="Publish",Description="Share the current setup to your cloud."}
eG:Button{Title="Publish current",Description="Uploads flags + meta",
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
Callback=function(eH,eI)
if not eH then return end
task.spawn(function()
local eJ,eK=ae:Publish(eI,ab.GetFlags())
if eJ then
ac:Notify{Title="Published",Content=tostring(eI.Name),Duration=3}
else
ac:Notify{Title="Publish failed",Content=tostring(eK),Duration=3}
end
end)
end,
}
end}
ey=eG:CardGrid{Title="My Configs",Height=260,Columns=2,
EmptyText=ae and"Nothing published yet."or"Attach a cloud service.",
Fetch=function()
if not ae then return{}end
local eH,eI=ae:ListMine()
if eI then return{}end
return eH or{}
end,
OnSelect=function(eH)
ac:Confirm{
Title="Load \""..tostring(eH.name or eH.Name or"?").."\"?",
Text="Overwrites current settings.",
ConfirmText="Load",CancelText="Cancel",
Callback=function(eI)
if not eI then return end
local eJ=ab.Snapshot()
if eH.data and ab.ApplyTable(ac,eH.data)then
ac:Notify{Title="Loaded",Content="From cloud.",Duration=2}
else
ab.Restore(eJ)
ac:Notify{Title="Load failed",Content="Rolled back.",Duration=2}
end
end,
}
end}

local eH=af:SubTab{Name="Explore",Icon="globe"}
eH:Paragraph{Title="Public Configs",Description="Shared by the community."}
ez=eH:CardGrid{Title="Public Configs",Height=300,Columns=2,
Search=true,SearchPlaceholder="Search public configs...",
EmptyText=ae and"Nothing found."or"Attach a cloud service.",
Fetch=function(eI)
if not ae then return{}end
local eJ,eK=ae:List(eI)
if eK then return{}end
return eJ or{}
end,
OnSelect=function(eI)
ac:Confirm{
Title="Import \""..tostring(eI.name or eI.Name or"?").."\"?",
Text="Overwrites current settings. Snapshot kept.",
ConfirmText="Import",CancelText="Cancel",
Callback=function(eJ)
if not eJ then return end
local eK=ab.Snapshot()
local eL=eI.data
if not eL and(eI.ShareCode or eI.shareCode)and ae then
local eM=ae:GetByShareCode(eI.ShareCode or eI.shareCode)
if eM then eL=eM.Data or eM.data or eM end
end
if eL and ab.ApplyTable(ac,eL)then
ac:Notify{Title="Imported",Content="Applied.",Duration=2}
else
ab.Restore(eK)
ac:Notify{Title="Import failed",Content="Rolled back.",Duration=2}
end
end,
}
end}

local eI={
Tab=af,
Open=function()ac._activateTab(af,true)end,
Refresh=function()
pcall(function()ex:Refresh()end)
pcall(function()ey:Refresh()end)
pcall(function()ez:Refresh()end)
end,
}
if ac._dockAdd then
ac._dockAdd("Config",ad.DockIcon or"cloud",
function()ac._activateTab(af,true)end,af)
end
return eI
end end function a.at():typeof(__modImpl())local aa=a.cache.at if not aa then aa={c=__modImpl()}a.cache.at=aa end return aa.c end end do local function __modImpl()








local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.f()
local ae=a.h()
local af=a.d()a.v()

local ex=a.b()

local ey=af.Z
local ez=ab.Tween
local eF=ac.corner
local eG=ac.stroke
local eH=ad.resolveIcon
local eI=ex.cloneref_check(game:GetService"Players")
local eJ=eI.LocalPlayer
local eK=ex.cloneref_check(game:GetService"RunService")
local eL=ex.cloneref_check(game:GetService"TweenService")

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
local eT={}
local eV=1
while true do
local eW,eX,eY,eZ=eN:find("```(%w*)\n?(.-)```",eV)
if not eW then
local e_=eN:sub(eV)
if e_~=""then table.insert(eT,{kind="text",content=e_})end
break
end
if eW>eV then
local e_=eN:sub(eV,eW-1)
if e_:match"%S"then
table.insert(eT,{kind="text",content=e_})
end
end
eZ=eZ:gsub("^%s+",""):gsub("%s+$","")
table.insert(eT,{kind="code",lang=eY~=""and eY or"lua",content=eZ})
eV=eX+1
end
if#eT==0 then
table.insert(eT,{kind="text",content=eN})
end
return eT
end

local eN={
["and"]=true,["break"]=true,["do"]=true,["else"]=true,["elseif"]=true,
["end"]=true,["false"]=true,["for"]=true,["function"]=true,["if"]=true,
["in"]=true,["local"]=true,["nil"]=true,["not"]=true,["or"]=true,
["repeat"]=true,["return"]=true,["then"]=true,["true"]=true,
["until"]=true,["while"]=true,continue=true,
}

local function HighlightLua(eT)
local eV={}
local eW=#eT
local eX=1

while eX<=eW do
local eY=eT:sub(eX,eX)

if eT:sub(eX,eX+3)=="--[["then
local eZ=select(2,eT:find("%]%]",eX+4))
local e_=eZ or eW
eV[#eV+1]="<font color=\"#6A9955\">"..eT:sub(eX,e_).."</font>"
eX=e_+1
elseif eT:sub(eX,eX+1)=="--"then
local eZ=eT:find("\n",eX,true)
local e_=(eZ or(eW+1))-1
eV[#eV+1]="<font color=\"#6A9955\">"..eT:sub(eX,e_).."</font>"
eX=e_+1
elseif eY=='"'or eY=="'"then
local eZ=eY
local e_=eX+1
while e_<=eW do
local e0=eT:sub(e_,e_)
if e0=="\\"then
e_=e_+2
elseif e0==eZ or e0=="\n"then
break
else
e_=e_+1
end
end
e_=math.min(e_,eW)
eV[#eV+1]="<font color=\"#CE9178\">"..eT:sub(eX,e_).."</font>"
eX=e_+1
elseif eY:match"%a"or eY=="_"then
local eZ=eX
while eZ<=eW and eT:sub(eZ,eZ):match"[%w_]"do eZ=eZ+1 end
local e_=eT:sub(eX,eZ-1)
eV[#eV+1]=eN[e_]and("<font color=\"#C586C0\">"..e_.."</font>")or e_
eX=eZ
elseif eY:match"%d"then
local eZ=eX
while eZ<=eW and eT:sub(eZ,eZ):match"[%d%.]"do eZ=eZ+1 end
eV[#eV+1]="<font color=\"#B5CEA8\">"..eT:sub(eX,eZ-1).."</font>"
eX=eZ
else
eV[#eV+1]=eY
eX=eX+1
end
end

return table.concat(eV)
end

local eT=ex.cloneref_check(game:GetService"TextService")
local eV=1.06
local eW={}

local function MeasureText(eX,eY,eZ)
eX=tostring(eX or"")
eZ=eZ or 10000
local e_=eX.."\1"..eY.."\1"..math.floor(eZ)
local e0=eW[e_]
if e0 then return e0.X,e0.Y end

local e1,e2=pcall(function()
return eT:GetTextSize(
eX,eY,Enum.Font.GothamSemibold,
Vector2.new(eZ,100000)
)
end)
local e3,e4
if e1 and e2 then
e3=math.ceil(e2.X*eV)
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
e4.ZIndex=ey.Content
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
fb.Image=eH(eY.Icon or"bot")
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
eF(fh,6)

local fi=Instance.new"ImageLabel"
fi.BackgroundTransparency=1
fi.Image=eH(ff)
fi.ImageColor3=eZ.Dim
fi.Size=UDim2.fromOffset(13,13)
fi.AnchorPoint=Vector2.new(0.5,0.5)
fi.Position=UDim2.fromScale(0.5,0.5)
fi.ZIndex=e5+2
fi.Parent=fh

e_(fh.MouseEnter:Connect(function()
ez(fh,{BackgroundTransparency=0.9},0.12)
ez(fi,{ImageColor3=eZ.Text},0.12)
end))
e_(fh.MouseLeave:Connect(function()
ez(fh,{BackgroundTransparency=1},0.12)
ez(fi,{ImageColor3=eZ.Dim},0.12)
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
eF(fo,9)
local fp=eG(fo,Color3.new(1,1,1),1,0.9)

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
ez(fp,{Color=eZ.Accent,Transparency=0.3},0.15)
end))
e_(fr.FocusLost:Connect(function()
ez(fp,{Color=Color3.new(1,1,1),Transparency=0.9},0.15)
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
eF(fs,9)

local ft=Instance.new"ImageLabel"
ft.BackgroundTransparency=1
ft.Image=eH"send"
ft.ImageColor3=eZ.Text
ft.Size=UDim2.fromOffset(14,14)
ft.AnchorPoint=Vector2.new(0.5,0.5)
ft.Position=UDim2.fromScale(0.5,0.5)
ft.ZIndex=e5+2
ft.Parent=fs

e_(fs.MouseEnter:Connect(function()ez(fs,{BackgroundTransparency=0.8},0.12)end))
e_(fs.MouseLeave:Connect(function()ez(fs,{BackgroundTransparency=0.9},0.12)end))

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
eF(fx,2)

local fy=4
e_(eK.Heartbeat:Connect(function()
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
end))

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
eF(fG,5)

local fH=Instance.new"ImageLabel"
fH.BackgroundTransparency=1
fH.Image=eH(fE)
fH.ImageColor3=eZ.Dim
fH.Size=UDim2.fromOffset(12,12)
fH.AnchorPoint=Vector2.new(0.5,0.5)
fH.Position=UDim2.fromScale(0.5,0.5)
fH.ZIndex=e5+6
fH.Parent=fG

e_(fG.MouseEnter:Connect(function()
ez(fG,{BackgroundTransparency=0.85},0.12)
ez(fH,{ImageColor3=eZ.Text},0.12)
end))
e_(fG.MouseLeave:Connect(function()
ez(fG,{BackgroundTransparency=1},0.12)
ez(fH,{ImageColor3=eZ.Dim},0.12)
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
eF(fK,fC/2)

local fL
if fF then
local fM=Instance.new"ImageLabel"
fM.BackgroundTransparency=1
fM.ImageTransparency=1
fM.ScaleType=Enum.ScaleType.Crop
fM.Size=UDim2.fromScale(1,1)
fM.ZIndex=e5+3
fM.Parent=fK
eF(fM,fC/2)
fL=fM
task.spawn(function()
local fN,fO=pcall(
eI.GetUserThumbnailAsync,
eI,
eJ.UserId,
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
fM.Image=eH"bot"
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
eF(fT,12)
local fU=fF and 0.8 or 0.9
local fV=eG(fT,Color3.new(1,1,1),1,1)

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

ez(fK,{BackgroundTransparency=fJ},0.16)
ez(fL,{ImageTransparency=0},0.16)
ez(fT,{BackgroundTransparency=fS},0.16)
ez(fV,{Transparency=fU},0.16)
ez(fH,{Scale=1},0.22,Enum.EasingStyle.Back,Enum.EasingDirection.Out)

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
eF(f1,8)
eG(f1,Color3.new(1,1,1),1,0.92)

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
local f7=ex.hasFn"setclipboard"
if not f7 then return end
pcall(f7,f0.content)
ez(f6,{ImageColor3=Color3.fromRGB(120,220,140)},0.1)
task.delay(0.4,function()
if f6.Parent then
ez(f6,{ImageColor3=eZ.Dim},0.15)
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

ez(f1,{TextTransparency=0},0.16)

local f2=utf8.len(f0.content)or#f0.content
local f3=math.clamp(f2*0.014,0.12,1.6)
fZ=math.max(fZ,f3)
task.delay(fY,function()
if f1 and f1.Parent then
eL:Create(
f1,
TweenInfo.new(f3,Enum.EasingStyle.Linear),
{MaxVisibleGraphemes=f2}
):Play()
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
fH.Image=eH"wrench"
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
eF(fJ,fC/2)

local fK=Instance.new"ImageLabel"
fK.BackgroundTransparency=1
fK.ImageTransparency=1
fK.Image=eH"bot"
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
eF(fL,12)
local fM=eG(fL,Color3.new(1,1,1),1,1)

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
eF(fQ,2)
ez(fQ,{BackgroundTransparency=0},0.15)

fN[fO]=eL:Create(
fQ,
TweenInfo.new(0.45,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true,(fO-1)*0.15),
{Position=UDim2.new(0,fP,0.5,-3)}
)
fN[fO]:Play()
end

ez(fJ,{BackgroundTransparency=0.82},0.15)
ez(fK,{ImageTransparency=0},0.15)
ez(fL,{BackgroundTransparency=0.9},0.15)
ez(fM,{Transparency=0.9},0.15)

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
ft.Image=eH(fK and"square"or"send")
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
local fL=ex.hasFn"setclipboard"
if not fL or#fA==0 then return end
pcall(fL,table.concat(fA,"\n\n"))
ez(fg,{ImageColor3=Color3.fromRGB(120,220,140)},0.1)
task.delay(0.4,function()
if fg.Parent then
ez(fg,{ImageColor3=eZ.Dim},0.15)
end
end)
end))
e_(fh.MouseButton1Click:Connect(function()
if fH or not fI then return end
ez(fi,{Rotation=fi.Rotation+180},0.25)
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

local ex=a.b()
local ey=a.x()

local ez=af.Z
local eF=ab.Tween
local eG=ac.corner
local eH=ac.stroke
local eI=ad.resolveIcon
local eJ=ex.cloneref_check(game:GetService"Players")
local eK=eJ.LocalPlayer
local eL=ex.cloneref_check(game:GetService"TextService")
local eM=ex.cloneref_check(game:GetService"RunService")

local eN=1.06
local eT={}

local function MeasureText(eV,eW,eX)
eV=tostring(eV or"")
eX=eX or 10000
local eY=eV.."\1"..eW.."\1"..math.floor(eX)
local eZ=eT[eY]
if eZ then return eZ.X,eZ.Y end

local e_,e0=pcall(function()
return eL:GetTextSize(
eV,eW,Enum.Font.GothamSemibold,
Vector2.new(eX,100000)
)
end)
local e1,e2
if e_ and e0 then
e1=math.ceil(e0.X*eN)
e2=math.ceil(e0.Y)
else
e1=math.ceil(#eV*eW*0.55)
e2=eW+2
end
eT[eY]={X=e1,Y=e2}
return e1,e2
end

return function(eV,eW)
eW=eW or{}
local eX=aa.Theme
local eY=eW.Service
local eZ=function(eZ)return eV:Track(eZ)end

local e_=eV:Tab{
Title=eW.Name or eW.Title or"Chat",
Icon=eW.Icon or"messages-square",
Hidden=eW.Hidden~=false,
}
local e0=e_.Page

table.insert(eV._tabChangeListeners,function(e1)
if eW.OnToggle then task.spawn(eW.OnToggle,e1==e_)end
end)

local e1,e2=38,38

local e3=Instance.new"Frame"
e3.Name="GlobalChatPanel"
e3.BackgroundTransparency=1
e3.ClipsDescendants=true
e3.Size=UDim2.fromScale(1,1)
e3.ZIndex=ez.Content
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
fa.Image=eI(eW.Icon or"messages-square")
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
eG(fg,6)

local fh=Instance.new"ImageLabel"
fh.BackgroundTransparency=1
fh.Image=eI(fe)
fh.ImageColor3=eX.Dim
fh.Size=UDim2.fromOffset(13,13)
fh.AnchorPoint=Vector2.new(0.5,0.5)
fh.Position=UDim2.fromScale(0.5,0.5)
fh.ZIndex=e4+2
fh.Parent=fg

eZ(fg.MouseEnter:Connect(function()
eF(fg,{BackgroundTransparency=0.9},0.12)
eF(fh,{ImageColor3=eX.Text},0.12)
end))
eZ(fg.MouseLeave:Connect(function()
eF(fg,{BackgroundTransparency=1},0.12)
eF(fh,{ImageColor3=eX.Dim},0.12)
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
ey.SendChatToDiscord(fi,fn,fo,{
Title=fj,
Color=fk,
Footer=fp and"Sent from in-game"or"Global chat relay",
})
end

local function discordNameFor(fn,fo)
if fo then return"Anonymous"end
local fp,fq=pcall(function()return eJ:GetNameFromUserIdAsync(fn)end)
if fp and fq then
return eK.DisplayName.." (@"..fq..")"
end
return eK.DisplayName or"Someone"
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
eG(fx,9)
local fy=eH(fx,Color3.new(1,1,1),1,0.9)

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
eF(fy,{Color=eX.Accent,Transparency=0.3},0.15)
end))
eZ(fA.FocusLost:Connect(function()
eF(fy,{Color=Color3.new(1,1,1),Transparency=0.9},0.15)
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
eG(fB,9)

local fC=Instance.new"ImageLabel"
fC.BackgroundTransparency=1
fC.Image=eI"send"
fC.ImageColor3=eX.Text
fC.Size=UDim2.fromOffset(14,14)
fC.AnchorPoint=Vector2.new(0.5,0.5)
fC.Position=UDim2.fromScale(0.5,0.5)
fC.ZIndex=e4+2
fC.Parent=fB

eZ(fB.MouseEnter:Connect(function()eF(fB,{BackgroundTransparency=0.8},0.12)end))
eZ(fB.MouseLeave:Connect(function()eF(fB,{BackgroundTransparency=0.9},0.12)end))

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
eG(fG,2)

local fH=4
eZ(eM.Heartbeat:Connect(function()
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
end))

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
eG(fU,fM/2)

if fT then
local fV=Instance.new"ImageLabel"
fV.BackgroundTransparency=1
fV.ImageTransparency=1
fV.Image=eI"user-round"
fV.ImageColor3=Color3.fromRGB(90,61,40)
fV.Size=UDim2.fromOffset(15,15)
fV.AnchorPoint=Vector2.new(0.5,0.5)
fV.Position=UDim2.fromScale(0.5,0.5)
fV.ZIndex=e4+3
fV.Parent=fU
eF(fV,{ImageTransparency=0},0.16)
else
local fV=Instance.new"ImageLabel"
fV.BackgroundTransparency=1
fV.ImageTransparency=1
fV.ScaleType=Enum.ScaleType.Crop
fV.Size=UDim2.fromScale(1,1)
fV.ZIndex=e4+3
fV.Parent=fU
eG(fV,fM/2)
eF(fV,{ImageTransparency=0},0.16)
task.spawn(function()
local fW,fX=pcall(
eJ.GetUserThumbnailAsync,
eJ,
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
eG(f0,12)
local f1=eH(f0,Color3.new(1,1,1),1,1)

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
eG(f5,6)

local f6=Instance.new"ImageLabel"
f6.BackgroundTransparency=1
f6.ImageTransparency=1
f6.Image=eI"flag"
f6.ImageColor3=eX.Dim
f6.Size=UDim2.fromOffset(11,11)
f6.AnchorPoint=Vector2.new(0.5,0.5)
f6.Position=UDim2.fromScale(0.5,0.5)
f6.ZIndex=e4+3
f6.Parent=f5

eZ(fQ.MouseEnter:Connect(function()
eF(f6,{ImageTransparency=0.3},0.12)
end))
eZ(fQ.MouseLeave:Connect(function()
eF(f6,{ImageTransparency=1},0.12)
end))
eZ(f5.MouseEnter:Connect(function()
eF(f5,{BackgroundTransparency=0.88},0.1)
eF(f6,{ImageColor3=eX.Danger,ImageTransparency=0},0.1)
end))
eZ(f5.MouseLeave:Connect(function()
eF(f5,{BackgroundTransparency=1},0.1)
eF(f6,{ImageColor3=eX.Dim},0.1)
end))
eZ(f5.MouseButton1Click:Connect(function()
eV:Confirm{
Title="Report this message?",
Text="Hides it for everyone once enough people report it.",
ConfirmText="Report",
CancelText="Cancel",
Danger=true,
Callback=function(f7)
if not f7 then return end
local f8,f9=eY:ReportChatMessage(fN.Id)
eV:Notify{
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
eF(fU,{BackgroundTransparency=f5},0.16)
eF(f0,{BackgroundTransparency=f6},0.16)
eF(f1,{Transparency=f7},0.16)
eF(f4,{TextTransparency=0},0.16)
eF(fR,{Scale=1},0.22,Enum.EasingStyle.Back,Enum.EasingDirection.Out)

scrollToBottom()
table.insert(fJ,(fO and"You"or"Someone")..": "..fP)
end

eZ(fn.MouseButton1Click:Connect(function()
local fN=ex.hasFn"setclipboard"
if not fN or#fJ==0 then return end
pcall(fN,table.concat(fJ,"\n"))
eF(fo,{ImageColor3=Color3.fromRGB(120,220,140)},0.1)
task.delay(0.4,function()
if fo.Parent then
eF(fo,{ImageColor3=eX.Dim},0.15)
end
end)
end))

local fN={[0]=true}
local fO=0

local function trySend()
local fP=fA.Text:gsub("^%s+",""):gsub("%s+$","")
if fP==""or not eY then return end
fA.Text=""
local fQ=fe and 0 or eK.UserId
local fR=fe
task.spawn(function()
local fS,fT=eY:SendChatMessage(fQ,fP)
if not fS then
eV:Notify{Title="Chat",Text=tostring(fT),Type="error",Duration=3}
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
fq.Image=eI(fe and"eye-off"or"eye")
eV:Notify{
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
if eV._active==e_ then
if eV._tabs[1]and eV._tabs[1]~=e_ then
eV._activateTab(eV._tabs[1],true)
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
eG(fQ,10)
eH(fQ,Color3.new(1,1,1),1,0.88)

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
eG(fZ,6)

local f_=Instance.new"ImageLabel"
f_.BackgroundTransparency=1
f_.Image=eI"check"
f_.ImageColor3=eX.Accent
f_.ImageTransparency=fV()and 0 or 1
f_.Size=UDim2.fromOffset(11,11)
f_.AnchorPoint=Vector2.new(0.5,0.5)
f_.Position=UDim2.fromScale(0.5,0.5)
f_.ZIndex=e4+13
f_.Parent=fZ

eZ(fZ.MouseButton1Click:Connect(function()
local f0=fW()
eF(fZ,{BackgroundTransparency=f0 and 0.7 or 0.92},0.12)
eF(f_,{ImageTransparency=f0 and 0 or 1},0.12)
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
addBubble(fV,fV.UserId==eK.UserId)
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
local fV=fU.UserId==eK.UserId
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
if eV._active==e_ then return end
if eV._active and not eV._active.Hidden then
fR=eV._active
end
eV._activateTab(e_,true)
end
local function closePanel()
if eV._active~=e_ then return end
if fR and not fR.Hidden then
eV._activateTab(fR,true)
elseif eV._tabs[1]and eV._tabs[1]~=e_ then
eV._activateTab(eV._tabs[1],true)
end
end

if eV._dockAdd then
eV._dockAdd("Chat",eW.Icon or"chat",
function()eV._activateTab(e_,true)end,e_)
end

return{
Instance=e3,
Tab=e_,
Open=openPanel,
Close=closePanel,
Toggle=function()
if eV._active==e_ then closePanel()else openPanel()end
end,
IsOpen=function()return eV._active==e_ end,
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
local ex=ac[af]
local ey={}
for ez=1,#ex do
if ex:sub(ez,ez)=="#"then
local eF=((ez+af+ad)%#ab)+1
ey[#ey+1]=ab:sub(eF,eF)
else
ey[#ey+1]=" "
end
end
ae[#ae+1]=table.concat(ey)
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
for ex=#aa._kLogos,1,-1 do
local ey=aa._kLogos[ex]
if not ey.root or not ey.root.Parent then
table.remove(aa._kLogos,ex)
else
pcall(function()
ey.l1.Text=kBitmapFrame(math.floor(ae*0.6)+ey.seed)
ey.l2.Text=kBitmapFrame(math.floor(ae*0.85)+ey.seed)
ey.l3.Text=kBitmapFrame(ae+ey.seed)
if ey.grad then ey.grad.Rotation=45+math.sin(ae*0.08)*20 end
end)
end
end
end
end
end)
end


local function buildK(ae,af,ex,ey)
ae=math.max(16,tonumber(ae)or 32)
ex=ex or{}
local ez=Instance.new"Frame"ez.Name="_kLogo"
ez.AnchorPoint=Vector2.new(0.5,0.5)ez.Position=UDim2.new(0.5,0,0.5,0)
ez.Size=UDim2.fromOffset(ae,ae)ez.BackgroundTransparency=1
ez.BorderSizePixel=0 ez.Parent=af
local eF=math.max(1,math.round(ae*0.01))
local eG=math.max(0,math.floor(ae*0.005))
local eH={
{c=Color3.fromRGB(0,0,0),t=0.6,ox=eF,oy=eF},
{c=Color3.fromRGB(40,0,0),t=0.3,ox=eG,oy=eG},
{c=Color3.fromRGB(255,255,255),t=0,ox=0,oy=0},
}
local eI={root=ez,seed=ey or math.random(0,6)}
for eJ,eK in ipairs(eH)do
local eL=Instance.new"TextLabel"
eL.Name="_k"..eJ
eL.AnchorPoint=Vector2.new(0.5,0.5)
eL.Position=UDim2.new(0.5,0,0.5,0)+UDim2.fromOffset(eK.ox,eK.oy)
eL.Size=UDim2.fromScale(1,1)
eL.BackgroundTransparency=1
eL.Font=Enum.Font.Code
eL.TextScaled=true
eL.TextXAlignment=Enum.TextXAlignment.Center
eL.TextYAlignment=Enum.TextYAlignment.Center
eL.TextColor3=eK.c
eL.TextTransparency=eK.t
eL.Text=kBitmapFrame(eI.seed)
eL.ZIndex=eJ
eL.Parent=ez
eI["l"..eJ]=eL
end
local eJ=Instance.new"UIGradient"
eJ.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(60,0,0)),
ColorSequenceKeypoint.new(0.2,Color3.fromRGB(255,30,30)),
ColorSequenceKeypoint.new(0.4,Color3.fromRGB(120,0,0)),
ColorSequenceKeypoint.new(0.6,Color3.fromRGB(255,60,60)),
ColorSequenceKeypoint.new(0.8,Color3.fromRGB(80,0,0)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(200,0,0)),
}
eJ.Rotation=45
eJ.Parent=eI.l3
eI.grad=eJ
table.insert(aa._kLogos,eI)
kTick()
return eI
end

return{buildK=buildK,kTick=kTick}end function a.aw():typeof(__modImpl())local aa=a.cache.aw if not aa then aa={c=__modImpl()}a.cache.aw=aa end return aa.c end end do local function __modImpl()





local aa=a.a()
local ab=a.c()
local ac=a.e()
local ad=a.b()
local ae=a.f()a.v()a.g()


local af=a.h()
local ex=a.A()
local ey=a.ar()
local ez=a.as()
local eF=a.at()
local eG=a.au()
local eH=a.av()
local eI=a.d()
local eJ=a.aw()

local eK=aa
local eL=ab.T
local eM=ab.tween
local eN=ac.spawnCb
local eT=ac.corner
local eV=ac.hairline
local eW=ac.pad
local eX=ac.lighting
local eY=ac.topLight
local eZ=ac.shadow
local e_=ac.makeDraggable
local e0=ae.makeIcon
local e1=ad.cloneref_check(game:GetService"UserInputService")
ad.cloneref_check(game:GetService"RunService")

local function ensureNotifyHost(e2)
local e3=e2:FindFirstChild"Notification"
if e3 then return e3 end
e3=Instance.new"Frame"
e3.Name="Notification"
e3.AnchorPoint=Vector2.new(1,1)
e3.Position=UDim2.new(1,-18,1,-18)
e3.Size=UDim2.new(0,300,1,-36)
e3.BackgroundTransparency=1
e3.Parent=e2
local e4=Instance.new"UIListLayout"
e4.VerticalAlignment=Enum.VerticalAlignment.Bottom
e4.Padding=UDim.new(0,10)
e4.SortOrder=Enum.SortOrder.LayoutOrder
e4.Parent=e3
return e3
end

local function bumpRecent(e2,e3,e4)
if not e3 or e3==""then return end
for e5,e6 in ipairs(aa._recent)do
if e6.label==e3 and e6.tab==e2 then table.remove(aa._recent,e5)break end
end
table.insert(aa._recent,1,{tab=e2,label=e3,go=e4})
while#aa._recent>8 do table.remove(aa._recent)end
for e5,e6 in ipairs(aa._recentRefresh)do pcall(e6)end
end
aa._bumpRecent=function(e2,e3,e4,e5)
return bumpRecent(e3,e4,e5)
end







local e2={}
local function flyTo(e3,e4,e5,e6)
local e7=e2[e3]
if e7 then pcall(function()e7:Cancel()end)end
e2[e3]=nil
local e8=eM(e3,e5 or eL.Med,e4)
if not e8 then
pcall(function()
for e9,fa in pairs(e4)do e3[e9]=fa end
end)
if e6 then e6()end
return nil
end
e2[e3]=e8
if e6 then
e8.Completed:Connect(function(e9)
if e2[e3]==e8 then
e2[e3]=nil
if e9==Enum.PlaybackState.Completed then e6()end
end
end)
end
return e8
end

return function(e3,e4)
e4=e4 or{}
local e5=e4.Title or"Kronos"
local e6=e4.SubTitle or e4.Subtitle or"scripthub"
local e7=e4.ToggleKey or Enum.KeyCode.RightControl
local e8=e4.Acrylic
if e8==nil then e8=true end
if e4.Theme then e3:SetTheme(e4.Theme)end
local e9=e3.Theme
e3:SetAcrylic(e8,e4.Blur or 16)

local fa=ad.GetRoot()
if e3._gui then pcall(function()e3._gui:Destroy()end)end

local fb=Instance.new"ScreenGui"
fb.Name=ad.GetStealthName()fb.ResetOnSpawn=false fb.IgnoreGuiInset=true fb.DisplayOrder=999
fb.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fb)
fb.Parent=fa
e3._gui=fb



local fc=Instance.new"ScreenGui"
fc.Name=ad.GetStealthName()fc.ResetOnSpawn=false fc.IgnoreGuiInset=true fc.DisplayOrder=1000
fc.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ad.protectGui(fc)
fc.Parent=fa

local fd=Instance.new"Frame"
fd.Name="Dim"fd.Size=UDim2.fromScale(1,1)
fd.BackgroundColor3=Color3.fromRGB(3,4,7)fd.BackgroundTransparency=1
fd.BorderSizePixel=0 fd.Parent=fb


local fe=e4.Background==true
fd.Visible=fe
local function dimTo(ff,fg)
if not fe then
if ff>=1 then fd.Visible=false end
return
end
fd.Visible=true
eM(fd,fg,{BackgroundTransparency=ff})
end
dimTo(0.5,eL.Slow)


if e4.Ambient~=false then
local ff=Instance.new"Frame"ff.Name="_ambient"
ff.AnchorPoint=Vector2.new(0.5,0.5)ff.Position=UDim2.new(0.5,0,0.5,0)
ff.Size=UDim2.new(1.4,0,1.4,0)ff.BackgroundColor3=Color3.fromRGB(255,255,255)
ff.BackgroundTransparency=0 ff.BorderSizePixel=0 ff.Parent=fd
local fg=Instance.new"UIGradient"fg.Rotation=25
fg.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,e9.Accent),
ColorSequenceKeypoint.new(1,e9.Accent2 or e9.Accent)}
fg.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.82),NumberSequenceKeypoint.new(1,1)}
fg.Parent=ff
table.insert(eK._gradients,fg)
task.spawn(function()
while fb.Parent do
eM(fg,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=205})
task.wait(14.2)
if not fb.Parent then break end
eM(fg,TweenInfo.new(14,Enum.EasingStyle.Linear),{Rotation=25})
task.wait(14.2)
end
end)
end

local ff=Instance.new"CanvasGroup"
ff.Name="Main"ff.AnchorPoint=Vector2.new(0.5,0.5)
ff.Position=UDim2.new(0.5,0,0.5,0)ff.Size=UDim2.fromOffset(620,440)
ff.BackgroundColor3=e9.Surface
ff.BackgroundTransparency=(e8 and not e3._transparent)and 0.08 or 0
ff.GroupTransparency=1 ff.BorderSizePixel=0 ff.Parent=fb
eT(ff,e4.Radius or 12)eV(ff,true)eY(ff)eZ(ff,0.5,48)



local fg,fh=1,1
local fi=Instance.new"UIScale"fi.Scale=0.94 fi.Parent=ff
local function baseScale()return fg*fh end





local function brandInto(fj,fk)
if e4.Logo and e4.Logo~=""then
local fl=Instance.new"ImageLabel"fl.BackgroundTransparency=1
fl.AnchorPoint=Vector2.new(0.5,0.5)fl.Position=UDim2.new(0.5,0,0.5,0)
fl.Size=UDim2.new(1,-8,1,-8)fl.Image=e4.Logo
fl.ScaleType=Enum.ScaleType.Fit fl.Parent=fj
eT(fl,8)
if fk then fk.Visible=false end
return fl
end
return nil
end


local function kronosFace(fj,fk,fl,fm)
local fn=fl or 26
local fo=Instance.new"Frame"fo.Name="_disc"
fo.AnchorPoint=Vector2.new(0.5,0.5)fo.Position=UDim2.new(0.5,0,0.5,0)
fo.Size=UDim2.fromOffset(fn,fn)fo.BackgroundColor3=Color3.fromRGB(0,0,0)
fo.BorderSizePixel=0 fo.Parent=fj
local fp=Instance.new"UICorner"fp.CornerRadius=UDim.new(0.5,0)fp.Parent=fo
local fq=Instance.new"UIStroke"fq.Thickness=2
fq.Color=Color3.fromRGB(255,255,255)fq.Transparency=0.12 fq.Parent=fo
pcall(function()
local fr=Instance.new"UIShadow"fr.Color=Color3.fromRGB(255,255,255)
fr.Transparency=0.82 fr.BlurSize=10 fr.Parent=fo
end)
if fk then
fk.AnchorPoint=Vector2.new(0.5,0.5)fk.Position=UDim2.new(0.5,0,0.5,0)
fk.Size=UDim2.fromOffset(fn,fn)fk.TextSize=fm or 16
fk.ZIndex=2
end
return fo
end


local fj=e4.Intro
if fj==nil then fj=true end
local fk={}
if type(fj)=="table"then fk=fj fj=true end
local function playEntrance()
eK:_sfx"Open"
eM(ff,eL.Slow,{GroupTransparency=0})
eM(fi,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})
end
if fj then
local fl=Instance.new"TextButton"fl.Text=""fl.AutoButtonColor=false
fl.Size=UDim2.fromScale(1,1)fl.BackgroundColor3=Color3.fromRGB(4,5,8)
fl.BackgroundTransparency=0 fl.ZIndex=300 fl.Parent=fb
local fm=Instance.new"Frame"fm.AnchorPoint=Vector2.new(0.5,0.5)
fm.Position=UDim2.new(0.5,0,0.5,-30)fm.Size=UDim2.fromOffset(64,64)
fm.BackgroundColor3=e9.Surface2 fm.BorderSizePixel=0
eT(fm,18)fm.Parent=fl
eV(fm,true)
eK:_tag(fm,"BackgroundColor3","Surface2")
local fn=Instance.new"TextLabel"fn.Size=UDim2.fromScale(1,1)
fn.BackgroundTransparency=1 fn.Font=Enum.Font.GothamBlack
fn.TextSize=30 eK:_tag(fn,"TextColor3","Text")fn.Text=fk.Letter or"K"fn.Parent=fm
local fo=Instance.new"Frame"fo.Size=UDim2.fromOffset(12,12)
fo.Position=UDim2.new(1,-8,0,-5)fo.BorderSizePixel=0
eK:_tag(fo,"BackgroundColor3","Accent")
eT(fo,99)fo.Parent=fm
brandInto(fm,fn)
if not e4.Logo or e4.Logo==""then kronosFace(fm,fn,48,28)end

fm.Visible=false
local fp=eJ.buildK(210,fl,e9,0)
fp.root.Position=UDim2.new(0.5,0,0.5,-70)
task.spawn(function()
local fq=0
while fp.root.Parent do
task.wait(0.05)
if not eK.ReducedMotion then
fq=fq+0.08
local fr=1+math.sin(fq*0.5)*0.01
pcall(function()
fp.root.Size=UDim2.fromOffset(210*fr,210*fr)
end)
end
end
end)
local fq=Instance.new"TextLabel"fq.BackgroundTransparency=1
fq.AnchorPoint=Vector2.new(0.5,0)fq.Position=UDim2.new(0.5,0,0.5,48)
fq.Size=UDim2.new(0,300,0,22)fq.Font=Enum.Font.GothamBold
fq.TextSize=15 eK:_tag(fq,"TextColor3","Text")
fq.Text=fk.Word or"K R O N O S"fq.Parent=fl
local fr
if fk.Sub then
fr=Instance.new"TextLabel"fr.BackgroundTransparency=1
fr.AnchorPoint=Vector2.new(0.5,0)fr.Position=UDim2.new(0.5,0,0.5,66)
fr.Size=UDim2.new(0,300,0,14)fr.Font=Enum.Font.Gotham
fr.TextSize=11 eK:_tag(fr,"TextColor3","Dim")
fr.Text=fk.Sub fr.Parent=fl
end
local fs=Instance.new"Frame"fs.AnchorPoint=Vector2.new(0.5,0)
fs.Position=UDim2.new(0.5,0,0.5,fr and 84 or 76)fs.Size=UDim2.new(0,180,0,2)
fs.BackgroundColor3=e9.Surface2 fs.BorderSizePixel=0
eT(fs,99)fs.Parent=fl
eK:_tag(fs,"BackgroundColor3","Surface2")
local ft=Instance.new"Frame"ft.Size=UDim2.new(0,0,1,0)
ft.BorderSizePixel=0 eT(ft,99)ft.Parent=fs
eK:agrad(ft,0)
local fu=Instance.new"UIScale"fu.Scale=0.8 fu.Parent=fm
eM(fu,eL.Spring,{Scale=1})
eM(ft,TweenInfo.new(fk.Time or 2.8,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Size=UDim2.new(1,0,1,0)})
local fv=false
fl.MouseButton1Click:Connect(function()
if fv then return end fv=true
pcall(function()fl:Destroy()end)playEntrance()
end)
task.delay((fk.Time or 2.8)+0.25,function()
if fv then return end fv=true
eM(fl,eL.Med,{BackgroundTransparency=1})
for fw,fx in ipairs(fl:GetDescendants())do
pcall(function()
if fx:IsA"TextLabel"then eM(fx,eL.Fast,{TextTransparency=1})end
end)
end
task.delay(0.25,function()pcall(function()fl:Destroy()end)end)
playEntrance()
end)
else
playEntrance()
end


local fl=Instance.new"Frame"
fl.Size=UDim2.new(1,-24,0,2)fl.Position=UDim2.new(0,12,0,0)
fl.BackgroundTransparency=1 fl.Parent=ff
local fm=Instance.new"Frame"fm.Size=UDim2.new(0,0,1,0)
eT(fm,99)fm.Parent=fl
eK:agrad(fm,0)
eM(fm,TweenInfo.new(0.9,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)})
task.delay(0.95,function()pcall(function()fl:Destroy()end)end)


local fn=Instance.new"Frame"
fn.Name="Header"fn.Size=UDim2.new(1,0,0,62)
fn.BackgroundTransparency=1 fn.Parent=ff
eW(fn,14,6,14,14)


local fo=Instance.new"Frame"fo.Name="Mark"
fo.Size=UDim2.fromOffset(36,36)fo.BackgroundColor3=e9.Surface2
fo.BorderSizePixel=0 eT(fo,10)fo.Parent=fn
eV(fo,true)
local fp=Instance.new"TextLabel"fp.Size=UDim2.fromScale(1,1)
fp.BackgroundTransparency=1 fp.Font=Enum.Font.GothamBlack
fp.TextSize=18 e3:_tag(fp,"TextColor3","Text")fp.Text="K"fp.Parent=fo
local fq=Instance.new"Frame"fq.Size=UDim2.fromOffset(8,8)
fq.Position=UDim2.new(1,-5,0,-3)fq.BorderSizePixel=0
e3:_tag(fq,"BackgroundColor3","Accent")
eT(fq,99)fq.Parent=fo
brandInto(fo,fp)
if not e4.Logo or e4.Logo==""then kronosFace(fo,fp,26,15)end

local fr=Instance.new"TextLabel"fr.BackgroundTransparency=1
fr.Position=UDim2.new(0,48,0,0)fr.Size=UDim2.new(0,230,0,20)
fr.Font=Enum.Font.GothamBold fr.TextSize=15 fr.TextXAlignment=0
e3:_tag(fr,"TextColor3","Text")fr.Text=e5 fr.Parent=fn
local fs=Instance.new"TextLabel"fs.BackgroundTransparency=1
fs.Position=UDim2.new(0,48,0,21)fs.Size=UDim2.new(0,230,0,15)
fs.Font=Enum.Font.Gotham fs.TextSize=11 fr.TextXAlignment=0
fs.TextXAlignment=0 e3:_tag(fs,"TextColor3","Dim")
fs.Text=string.upper(e6).."  |  V"..e3.Version fs.Parent=fn


local ft=Instance.new"Frame"
ft.AnchorPoint=Vector2.new(1,0)ft.Position=UDim2.new(1,-64,0,4)
ft.Size=UDim2.new(0,170,0,32)ft.BackgroundColor3=e9.Bg
ft.BorderSizePixel=0 eT(ft,8)ft.Parent=fn
eV(ft,true)
local fu=e0("search",14,e9.Dim)
fu.Position=UDim2.new(0,9,0.5,-7)fu.Parent=ft
local fv=Instance.new"TextBox"fv.PlaceholderText="Search"
fv.PlaceholderColor3=e9.Dim fv.Text=""fv.Font=Enum.Font.GothamBold
fv.TextSize=12 e3:_tag(fv,"TextColor3","Text")
fv.Position=UDim2.new(0,28,0,0)fv.Size=UDim2.new(1,-80,1,0)
fv.BackgroundTransparency=1 fv.ClearTextOnFocus=false fv.Parent=ft
local fw=Instance.new"TextLabel"fw.BackgroundTransparency=1
fw.AnchorPoint=Vector2.new(1,0.5)fw.Position=UDim2.new(1,-8,0.5,0)
fw.Size=UDim2.new(0,44,0,18)fw.Font=Enum.Font.Code fw.TextSize=11
e3:_tag(fw,"TextColor3","Text")fw.Text="Ctrl K"fw.Parent=ft
e3:_tag(ft,"BackgroundColor3","Bg")


local fx=Instance.new"TextButton"fx.Text=""
fx.AnchorPoint=Vector2.new(1,0)fx.Position=UDim2.new(1,-256,0,4)
fx.Size=UDim2.fromOffset(32,32)fx.BackgroundColor3=e9.Bg
fx.BorderSizePixel=0 eT(fx,8)fx.Parent=fn
eV(fx,true)
e3:_tag(fx,"BackgroundColor3","Bg")
local fy=e0("keyboard",15,e9.Dim)
fy.AnchorPoint=Vector2.new(0.5,0.5)fy.Position=UDim2.new(0.5,0,0.5,0)
fy.Parent=fx
fx.MouseButton1Click:Connect(function()end)

local fz=Instance.new"TextButton"fz.Text=""
fz.AnchorPoint=Vector2.new(1,0)fz.Position=UDim2.new(1,-296,0,4)
fz.Size=UDim2.fromOffset(32,32)fz.BackgroundColor3=e9.Bg
fz.BorderSizePixel=0 eT(fz,8)fz.Parent=fn
eV(fz,true)
e3:_tag(fz,"BackgroundColor3","Bg")
local fA=e0("menu",15,e9.Dim)
fA.AnchorPoint=Vector2.new(0.5,0.5)fA.Position=UDim2.new(0.5,0,0.5,0)
fA.Parent=fz
fz.MouseButton1Click:Connect(function()end)


local fB=Instance.new"Frame"fB.BackgroundTransparency=1
fB.AnchorPoint=Vector2.new(1,0)fB.Position=UDim2.new(1,0,0,4)
fB.Size=UDim2.new(0,56,0,32)fB.Parent=fn
local fC=Instance.new"UIListLayout"fC.FillDirection=Enum.FillDirection.Horizontal
fC.VerticalAlignment=Enum.VerticalAlignment.Center
fC.HorizontalAlignment=Enum.HorizontalAlignment.Center
fC.Padding=UDim.new(0,7)fC.Parent=fB
local function dot(fD,fE)
local fF=Instance.new"TextButton"fF.Text=""
fF.Size=UDim2.fromOffset(12,12)fF.BackgroundColor3=fD
fF.BorderSizePixel=0 eT(fF,99)fF.AutoButtonColor=false fF.Parent=fB
fF.MouseEnter:Connect(function()eM(fF,eL.Hover,{BackgroundTransparency=0.25})end)
fF.MouseLeave:Connect(function()eM(fF,eL.Hover,{BackgroundTransparency=0})end)
return fF
end
local fD=dot(Color3.fromRGB(39,201,63))
local fE=dot(Color3.fromRGB(255,189,46))
local fF=dot(Color3.fromRGB(255,95,86))
fF.MouseButton1Click:Connect(function()end)
fE.MouseButton1Click:Connect(function()end)
fD.MouseButton1Click:Connect(function()end)


local fG=Instance.new"TextButton"fG.Text=""
fG.AnchorPoint=Vector2.new(1,0)fG.Position=UDim2.new(1,-336,0,4)
fG.Size=UDim2.fromOffset(32,32)fG.BackgroundColor3=e9.Bg
fG.BorderSizePixel=0 eT(fG,8)fG.Parent=fn
eV(fG,true)
e3:_tag(fG,"BackgroundColor3","Bg")
local fH=e0("bellring",14,e9.Dim)
fH.AnchorPoint=Vector2.new(0.5,0.5)fH.Position=UDim2.new(0.5,0,0.5,0)
fH.Parent=fG
local fI=Instance.new"Frame"fI.Size=UDim2.fromOffset(8,8)
fI.Position=UDim2.new(1,-7,0,3)fI.BorderSizePixel=0
fI.BackgroundColor3=Color3.fromRGB(248,113,113)
eT(fI,99)fI.Parent=fG fI.Visible=false
fG.MouseButton1Click:Connect(function()end)

e_(fn,ff)


local fJ=Instance.new"Frame"fJ.Name="Body"
fJ.Position=UDim2.new(0,0,0,62)fJ.Size=UDim2.new(1,0,1,-62)
fJ.BackgroundTransparency=1 fJ.Parent=ff
local fK=Instance.new"UIPadding"fK.PaddingLeft=UDim.new(0,12)
fK.PaddingRight=UDim.new(0,12)fK.PaddingBottom=UDim.new(0,12)fK.Parent=fJ

local fL=Instance.new"Frame"fL.Name="Sidebar"
fL.Size=UDim2.new(0,164,1,0)fL.BackgroundColor3=e9.Bg
fL.BackgroundTransparency=(e8 and not e3._transparent)and 0.15 or 0
fL.BorderSizePixel=0 eT(fL,10)fL.Parent=fJ
eV(fL,true)
e3:_tag(fL,"BackgroundColor3","Bg")
eX(fL,10)
eW(fL,8,8,8,8)

local fM=Instance.new"Frame"fM.Name="Nav"
fM.Size=UDim2.new(1,0,1,0)fM.BackgroundTransparency=1 fM.Parent=fL
local fN=Instance.new"UIListLayout"fN.Padding=UDim.new(0,4)
fN.SortOrder=Enum.SortOrder.LayoutOrder fN.Parent=fM




local fO=Instance.new"Frame"fO.Name="_pill"
fO.Size=UDim2.new(1,0,0,38)fO.Position=UDim2.new(0,0,0,-2)
fO.BackgroundColor3=e9.Surface2 fO.BorderSizePixel=0
fO.ZIndex=0
eT(fO,8)fO.Parent=fL
eV(fO,true)
e3:_tag(fO,"BackgroundColor3","Surface2")

local fP=Instance.new"Frame"fP.Name="Pages"
fP.Position=UDim2.new(0,176,0,0)fP.Size=UDim2.new(1,-176,1,0)
fP.BackgroundTransparency=1 fP.ClipsDescendants=true fP.Parent=fJ

local fQ={
_gui=fb,_main=ff,_side=fL,_nav=fM,_pages=fP,_pill=fO,
_tabs={},_active=nil,_toggleKey=e7,_visible=true,_keybinds={},
_conns={},_acrylicPref=e8,_popouts={},
_tabChangeListeners={},
}

function fQ.Track(fR,fS)table.insert(fR._conns,fS)return fS end
local fR
local fS
local fT,fU
fQ._cfgTitle=e5
fQ._body=fJ

fQ._folder="Kronos/"..tostring(e5)
pcall(function()
if makefolder and isfolder and not isfolder"Kronos"then makefolder"Kronos"end
if makefolder and isfolder and not isfolder(fQ._folder)then makefolder(fQ._folder)end
end)




fQ._dock=nil
fQ._dockBtns={}
local fV=false
local function dockRefresh(fW)
for fX,fY in ipairs(fQ._dockBtns)do
if fY.tab then pcall(function()fY.api.SetActive(fW==fY.tab)end)end
end
end
local function ensureDock()
if fQ._dock and fQ._dock.Parent then return fQ._dock end
local fW=Instance.new"Frame"
fW.Name=ad.GetStealthName()
fW.AnchorPoint=Vector2.new(0,1)
fW.Position=UDim2.new(0,8,1,-8)
fW.Size=UDim2.new(1,-16,0,32)
fW.BackgroundTransparency=1 fW.BorderSizePixel=0
fW.ClipsDescendants=true fW.Parent=fL
local fX=Instance.new"UIListLayout"
fX.FillDirection=Enum.FillDirection.Horizontal
fX.VerticalAlignment=Enum.VerticalAlignment.Center
fX.Padding=UDim.new(0,6)fX.Parent=fW
local fY=Instance.new"UIPadding"
fY.PaddingBottom=UDim.new(0,40)fY.Parent=fM
fQ._dock=fW
fQ._dockList=fX

fQ._dockOpen=true
fQ._dockMemory=true
local fZ=Instance.new"TextButton"fZ.Text=""
fZ.Size=UDim2.fromOffset(28,28)fZ.BackgroundColor3=e9.Surface2
fZ.BackgroundTransparency=0.5 fZ.LayoutOrder=0
fZ.BorderSizePixel=0 eT(fZ,8)fZ.AutoButtonColor=false fZ.Parent=fW
eV(fZ,true)
eK:_tag(fZ,"BackgroundColor3","Surface2")
local f_=ae.makeIcon("chevron-up",14,e9.Dim)
f_.AnchorPoint=Vector2.new(0.5,0.5)f_.Position=UDim2.new(0.5,0,0.5,0)
f_.Parent=fZ
fQ._dockArrow=fZ
fQ._dockArrowIcon=f_
fZ.MouseButton1Click:Connect(function()
eK:_sfx"Click"
fQ._dockSetOpen(not fQ._dockOpen,true)
fQ._dockMemory=fQ._dockOpen
end)
return fW
end

local function layoutDock(fW)
local fX=fQ._dock
if not fX or not fX.Parent then return end
local fY=fQ._sbMode==1
local fZ=fQ._dockList
if fZ then
fZ.FillDirection=fY and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
end
local f_=0
for f0,f1 in ipairs(fQ._dockBtns)do
if f1.btn and f1.btn.Parent and f1.btn.Visible then f_+=1 end
end
local f0=fQ._dockOpen and(f_+1)or 1
local f1
if fY then
f1=UDim2.new(0,44,0,f0*28+(f0-1)*6)
else
f1=UDim2.new(0,f0*28+(f0-1)*6,0,32)
end
if fW then eM(fX,eL.Med,{Size=f1})
else pcall(function()fX.Size=f1 end)end
end
function fQ._dockSetOpen(fW,fX)
fQ._dockOpen=fW and true or false
local fY=fQ._dockArrowIcon
if fY and fY:IsA"ImageLabel"then
pcall(function()
fY.Image=ae.resolveIcon(fW and"chevron-up"or"chevron-down")
end)
end
local fZ=0
for f_,f0 in ipairs(fQ._dockBtns)do
if f0.btn and f0.btn.Parent then
fZ+=1
local f1=fQ._dockOpen
if f1 then
f0.btn.Visible=true
pcall(function()
f0.btn.BackgroundTransparency=0.5
if f0.ic then f0.ic.ImageTransparency=0 end
end)
if fX then local
f2, f3=f0.btn, f0.ic
task.delay(fZ*0.03,function()
if f2.Parent then eM(f2,eL.Fast,{BackgroundTransparency=0.5})end
end)
end
else
local f2=f0.btn
if fX then
eM(f2,eL.Fast,{BackgroundTransparency=1})
task.delay(0.16,function()
if f2.Parent then f2.Visible=false end
end)
else
f2.Visible=false
end
end
end
end
layoutDock(fX)
end
local function dockAdd(fW,fX,fY,fZ)
for f_,f0 in ipairs(fQ._dockBtns)do
if f0.name==fW then
f0.cb=fY or f0.cb
f0.tab=fZ or f0.tab
return f0.api
end
end
local f_=ensureDock()
local f0=Instance.new"TextButton"f0.Text=""
f0.Size=UDim2.fromOffset(28,28)f0.BackgroundColor3=e9.Surface2
f0.BackgroundTransparency=0.5
f0.LayoutOrder=#fQ._dockBtns+1
f0.BorderSizePixel=0 eT(f0,8)f0.AutoButtonColor=false f0.Parent=f_
eV(f0,true)
eK:_tag(f0,"BackgroundColor3","Surface2")
local f1=ae.makeIcon(fX or"box",15,e9.Dim)
f1.AnchorPoint=Vector2.new(0.5,0.5)f1.Position=UDim2.new(0.5,0,0.5,0)
f1.Parent=f0
local f2=false
local f3={}
function f3.SetActive(f4)
f2=f4 and true or false
eM(f0,eL.Hover,{BackgroundTransparency=f2 and 0.15 or 0.5})
if f1:IsA"ImageLabel"then
eM(f1,eL.Hover,{ImageColor3=f2 and e9.Text or e9.Dim})
end
end
f0.MouseEnter:Connect(function()
if f2 then return end
eM(f0,eL.Hover,{BackgroundTransparency=0.3})
end)
f0.MouseLeave:Connect(function()
if f2 then return end
eM(f0,eL.Hover,{BackgroundTransparency=0.5})
end)
f0.MouseButton1Click:Connect(function()
eK:_sfx"Click"eN(fY)
end)
table.insert(fQ._dockBtns,{name=fW,tab=fZ,cb=fY,api=f3,btn=f0,ic=f1})
layoutDock(false)
if fZ and not fV then
fV=true
table.insert(fQ._tabChangeListeners,function(f4)
dockRefresh(f4)
end)
end
return f3
end
fQ._dockAdd=dockAdd
function fQ.AddDockButton(fW,fX)
fX=fX or{}
return dockAdd(fX.Name or"Dock",fX.Icon or"box",fX.Callback,fX.Tab)
end

function fQ.AddTab(fW,fX)
local fY=type(fX)=="table"and fX or{Name=fX}
return fW:Tab{Title=fY.Name or fY.Title or"Tab",Icon=fY.Icon,Hidden=fY.Hidden}
end
function fQ.AddTabLine(fW)
local fX=Instance.new"Frame"
fX.Name="TabLine"
fX.BackgroundTransparency=1
fX.Size=UDim2.new(1,0,0,9)
fX.ZIndex=2
fX.Parent=fW._nav
local fY=Instance.new"Frame"
fY.AnchorPoint=Vector2.new(0,0.5)
fY.Position=UDim2.new(0,4,0.5,0)
fY.Size=UDim2.new(1,-8,0,1)
fY.BackgroundColor3=Color3.new(1,1,1)
fY.BackgroundTransparency=0.92
fY.BorderSizePixel=0
fY.ZIndex=2
fY.Parent=fX
return fX
end
function fQ.AddPanelTab(fW,fX)
fX=fX or{}
local fY=fW
local fZ=fW:AddTab{
Name=fX.Name or fX.Title,
Icon=fX.Icon,
Hidden=fX.Hidden~=false,
}
if fX.OnToggle then
table.insert(fW._tabChangeListeners,function(f_)
task.spawn(fX.OnToggle,f_==fZ)
end)
end
local f_
local function openPanel()
if fY._active==fZ then return end
if fY._active and not fY._active.Hidden then
f_=fY._active
end
fY._activateTab(fZ,true)
end
local function closePanel()
if fY._active~=fZ then return end
if f_ and not f_.Hidden then
fY._activateTab(f_,true)
elseif fY._tabs[1]and fY._tabs[1]~=fZ then
fY._activateTab(fY._tabs[1],true)
end
end
local f0={
Instance=fZ.Page,
Tab=fZ,
Open=openPanel,
Close=closePanel,
Toggle=function()
if fY._active==fZ then closePanel()else openPanel()end
end,
IsOpen=function()return fY._active==fZ end,
}
for f1,f2 in pairs{
AddToggle="AddToggle",AddSlider="AddSlider",
AddDropdown="AddDropdown",AddTextbox="AddTextbox",
AddButton="AddButton",AddKeybind="AddKeybind",
AddColorPicker="AddColorpicker",AddParagraph="AddParagraph",
AddSection="AddSection",AddSpacing="AddEmpty",AddHeader="AddSection",
}do
if fZ[f2]then
f0[f1]=function(f3,...)return fZ[f2](fZ,...)end
end
end
return f0
end

function fQ._activateTab(fW,fX)
if fW and fW._activate then pcall(fW._activate,fX~=false)end
end

function fQ._flash(fW,fX)
if not fX or not fX.Parent then return end
local fY=Instance.new"Frame"fY.Name="_flash"
fY.Size=UDim2.fromScale(1,1)fY.BackgroundColor3=e9.Accent
fY.BackgroundTransparency=0.75 fY.BorderSizePixel=0
eT(fY,10)fY.Parent=fX
eM(fY,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),
{BackgroundTransparency=1})
task.delay(0.65,function()pcall(function()fY:Destroy()end)end)
end

fQ:Track(e1.InputBegan:Connect(function(fW,fX)
if fX then return end
if fW.KeyCode==fQ._toggleKey then fQ:Toggle()end
if fW.KeyCode==Enum.KeyCode.K and e1:IsKeyDown(Enum.KeyCode.LeftControl)then
fQ:TogglePalette()
end
if fW.KeyCode==Enum.KeyCode.P and e1:IsKeyDown(Enum.KeyCode.LeftControl)then
fQ:TogglePalette()
end
if fW.KeyCode==Enum.KeyCode.Tab and e1:IsKeyDown(Enum.KeyCode.LeftControl)then
local fY=table.find(fQ._tabs,fQ._active)or 0
local fZ=fQ._tabs[(fY%#fQ._tabs)+1]
if fZ then eK:_sfx"Swap"fQ._activateTab(fZ,true)end
end
end))

fv:GetPropertyChangedSignal"Text":Connect(function()
local fW=string.lower(fv.Text)
for fX,fY in ipairs(fQ._tabs)do
local fZ=fW==""or string.find(string.lower(fY.Title),fW,1,true)~=nil
for f_,f0 in ipairs(fY.Elements)do
local f1
if fW==""then
f1=true
elseif fZ then
f1=true
else




local f2=string.lower(tostring(f0.Title or"").." "..tostring(f0.Flag or""))
local f3=f0._handle
local f4
if type(f3)=="table"then
f4=f3.Get
elseif f3~=nil then
local f5,f6=pcall(function()return f3.Get end)
if f5 then f4=f6 end
end
if type(f4)=="function"then
local f5,f6=pcall(f4,f3)
if f5 then
if type(f6)=="string"or type(f6)=="number"then
f2=f2 .." "..string.lower(tostring(f6))
elseif type(f6)=="table"then
for f7,f8 in ipairs(f6)do f2=f2 .." "..string.lower(tostring(f8))end
end
end
end
f1=string.find(f2,fW,1,true)~=nil
end
f0._searchVisible=(fW=="")and nil or f1
if f0.Frame then f0.Frame.Visible=f1 end
end
fY.Btn.Visible=(fZ or fW=="")and not fY._hidden
if fW~=""and not fY._hidden then

for f_,f0 in ipairs(fY.Elements)do
if f0.Frame and f0.Frame.Visible then fY.Btn.Visible=true break end
end
else

for f_,f0 in ipairs(fY.Elements)do
if f0._refreshSection then pcall(f0._refreshSection)end
end
end
end
end)


fv.Focused:Connect(function()eM(ft,eL.Hover,{Size=UDim2.new(0,190,0,32)})end)
fv.FocusLost:Connect(function()eM(ft,eL.Hover,{Size=UDim2.new(0,170,0,32)})end)

function fQ.SetVisible(fW,fX)
fW._visible=fX

local function pillTarget()
local fY,fZ=fb.AbsoluteSize.X,fb.AbsoluteSize.Y
if fY<1 then fY,fZ=1200,800 end
local f_,f0=fR.AbsolutePosition,fR.AbsoluteSize
return UDim2.new(0,f_.X+f0.X/2-fY/2,0,f_.Y+f0.Y/2-fZ/2)
end
if fX then
fb.Enabled=true
fW._mini=false
if fT then fT.Visible=false end
if fR then fR.Visible=false end
ff.Position=pillTarget()
fi.Scale=baseScale()*0.55
ff.GroupTransparency=1
fd.BackgroundTransparency=1
if fW._acrylicPref then eK:SetAcrylic(true,e4.Blur or 16)end
eK:_sfx"Open"

eM(ff,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{Position=fW._lastPos or UDim2.new(0.5,0,0.5,0),GroupTransparency=0})
eM(fi,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=baseScale()})

dimTo(0.5,TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))
else
fW._mini=false
fW._lastPos=ff.Position
if fT then fT.Visible=false end
eK:SetAcrylic(false)
for fY,fZ in pairs(eK.Sound._cache)do pcall(function()fZ:Stop()end)end
eM(ff,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
{Position=pillTarget(),GroupTransparency=1})
eM(fi,eL.Fast,{Scale=baseScale()*0.55})

dimTo(1,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In))
task.delay(0.36,function()
if fW._visible then return end
fb.Enabled=false
if fR then
fR.Visible=true
fS.Scale=0.5
eM(fS,eL.Spring,{Scale=1})
end
end)
end
end
function fQ.Toggle(fW)fW:SetVisible(not fW._visible)end


function fQ.SetToggleKey(fW,fX)
if type(fX)=="string"then fX=Enum.KeyCode[fX]end
if typeof(fX)=="EnumItem"then
if fW._toggleKey==fX then return end
fW._toggleKey=fX
fW:Notify{Title="Hide key",Content="Now bound to "..fX.Name,Duration=1.5}
end
end
function fQ.GetToggleKey(fW)return fW._toggleKey end


function fQ.OnClose(fW,fX)
if type(fX)=="function"then fW._onCloseCb=fX end
end

function fQ.SetMini(fW,fX)
fX=fX and true or false
if fX==fW._mini then return end
fW._mini=fX
if fX then
fW._visible=false
fW._lastPos=ff.Position
fR.Visible=false
eK:SetAcrylic(false)
for fY,fZ in pairs(eK.Sound._cache)do pcall(function()fZ:Stop()end)end
eM(ff,eL.Fast,{GroupTransparency=1})
eM(fi,eL.Fast,{Scale=baseScale()*0.7})
dimTo(1,eL.Fast)
task.delay(0.2,function()
if not fW._mini then return end
fb.Enabled=false
fT.Visible=true
fU.Scale=0.5
eM(fU,eL.Spring,{Scale=1})
end)
else
fT.Visible=false
fW:SetVisible(true)
end
end



fQ._sbMode=0
fQ._focus=false
function fQ._applyLayout(fW)
local fX=fW._focus and 2 or fW._sbMode
local fY=fX==1
fL.Visible=fX~=2
if fX==0 then
eM(fL,eL.Fast,{Size=UDim2.new(0,164,1,0)})
fP.Position=UDim2.new(0,176,0,0)
fP.Size=UDim2.new(1,-176,1,0)
elseif fX==1 then
eM(fL,eL.Fast,{Size=UDim2.new(0,58,1,0)})
fP.Position=UDim2.new(0,70,0,0)
fP.Size=UDim2.new(1,-70,1,0)
else
fP.Position=UDim2.new(0,0,0,0)
fP.Size=UDim2.new(1,0,1,0)
end
for fZ,f_ in ipairs(fW._tabs)do
if f_._label then f_._label.Visible=not fY end
if f_._icon and f_._icon:IsA"GuiObject"then
f_._icon.Position=fY and UDim2.new(0,13,0.5,0)or UDim2.new(0,14,0.5,0)
end
end


if fW._dockSetOpen then
if fY then
fW._dockMemory=fW._dockOpen
fW._dockSetOpen(false,true)
else
fW._dockSetOpen(fW._dockMemory~=false,true)
end
end
end
function fQ.CycleSidebar(fW)
fW._sbMode=(fW._sbMode+1)%3
fW:_applyLayout()
fW:Notify{Title="Sidebar",Content=({"Full","Icons only","Hidden"})[fW._sbMode+1],Duration=1.5}
end
function fQ.SetFocus(fW,fX)
fW._focus=fX and true or false
fW:_applyLayout()
end
local function fitCard()
local fW=Vector2.new(1200,800)
pcall(function()fW=workspace.CurrentCamera.ViewportSize end)
local fX=math.clamp(math.min(fW.X/700,fW.Y/520),0.6,1)
fg=fX
fi.Scale=baseScale()
if fW.X<760 or e1.TouchEnabled then
if fQ._sbMode==0 and not fQ._userToggledSide then
fQ._sbMode=2 fQ:_applyLayout()
end
end
end
fz.MouseButton1Click:Connect(function()
eK:_sfx"Click"
fQ._userToggledSide=true
fQ:CycleSidebar()
end)
fx.MouseButton1Click:Connect(function()
eK:_sfx"Click"fQ:ToggleKeybindList()
end)


local fW=e4.ConfirmClose
if fW==nil then fW=true end
local function requestClose()
eK:_sfx"Click"
if fW==false then fQ:Destroy()return end
local fX=(type(fW)=="table")and fW or{}
fQ:Dialog{
Title=fX.Title or"Close Kronos?",
Content=fX.Content or"The hub will close permanently and all features will be disabled.",
Buttons={
{Title=fX.Cancel or"Cancel"},
{Title=fX.Confirm or"Close",Callback=function()fQ:Destroy()end},
},
}
end
fF.MouseButton1Click:Connect(function()requestClose()end)
fE.MouseButton1Click:Connect(function()
eK:_sfx"Click"fQ:SetMini(not fQ._mini)
end)
fQ._zoomed=false
fD.MouseButton1Click:Connect(function()
eK:_sfx"Click"
fQ._zoomed=not fQ._zoomed
eM(ff,eL.Med,{Size=fQ._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end)
fG.MouseButton1Click:Connect(function()
eK:_sfx"Click"fQ:ToggleInbox()
end)
pcall(function()
if workspace.CurrentCamera then
fQ:Track(workspace.CurrentCamera:GetPropertyChangedSignal"ViewportSize":Connect(fitCard))
end
end)
task.defer(fitCard)

fR=Instance.new"TextButton"fR.Name=ad.GetStealthName()
fR.Text=""
fR.AnchorPoint=Vector2.new(0,0.5)fR.Position=UDim2.new(0,12,0.5,0)
fR.Size=UDim2.fromOffset(42,42)
fR.BackgroundColor3=e9.Surface2 fR.BorderSizePixel=0
e3:_tag(fR,"BackgroundColor3","Surface2")
eT(fR,13)fR.Parent=fb fR.Visible=false
eV(fR,true)
eZ(fR,0.6,20)

local fX=Instance.new"TextLabel"fX.Size=UDim2.fromScale(1,1)
fX.BackgroundTransparency=1 fX.Font=Enum.Font.GothamBlack
fX.TextSize=20 fX.Text="K"fX.Parent=fR
e3:_tag(fX,"TextColor3","Text")
local fY=Instance.new"Frame"fY.Size=UDim2.fromOffset(9,9)
fY.Position=UDim2.new(1,-6,0,-3)fY.BorderSizePixel=0
e3:_tag(fY,"BackgroundColor3","Accent")
eT(fY,99)fY.Parent=fR
brandInto(fR,fX)
if not e4.Logo or e4.Logo==""then kronosFace(fR,fX,32,17)end
fS=Instance.new"UIScale"fS.Parent=fR
e_(fR,fR)
fR.MouseButton1Click:Connect(function()fQ:SetVisible(true)end)


fT=Instance.new"TextButton"fT.Name=ad.GetStealthName()
fT.Text=""
fT.AnchorPoint=Vector2.new(0,0)fT.Position=UDim2.new(0,12,0,12)
fT.Size=UDim2.fromOffset(44,44)
fT.BackgroundColor3=e9.Surface2 fT.BorderSizePixel=0
e3:_tag(fT,"BackgroundColor3","Surface2")
eT(fT,13)fT.Parent=fa fT.Visible=false
eV(fT,true)
eZ(fT,0.6,20)
local fZ=Instance.new"TextLabel"fZ.Size=UDim2.fromScale(1,1)
fZ.BackgroundTransparency=1 fZ.Font=Enum.Font.GothamBlack
fZ.TextSize=20 fZ.Text="K"fZ.Parent=fT
e3:_tag(fZ,"TextColor3","Text")
local f_=Instance.new"Frame"f_.Size=UDim2.fromOffset(9,9)
f_.Position=UDim2.new(1,-6,0,-3)f_.BorderSizePixel=0
e3:_tag(f_,"BackgroundColor3","Accent")
eT(f_,99)f_.Parent=fT
brandInto(fT,fZ)
if not e4.Logo or e4.Logo==""then kronosFace(fT,fZ,34,17)end
fU=Instance.new"UIScale"fU.Parent=fT
e_(fT,fT)
fT.MouseButton1Click:Connect(function()fQ:SetMini(false)end)


local f0=Instance.new"TextButton"f0.Text=""
f0.AnchorPoint=Vector2.new(1,1)f0.Position=UDim2.new(1,0,1,0)
f0.Size=UDim2.fromOffset(28,28)f0.BackgroundTransparency=1
f0.Parent=ff f0.ZIndex=50
f0.ClipsDescendants=true


local f1=0
f0.MouseButton1Click:Connect(function()
local f2=os.clock()
if f2-f1<0.35 then
eK:_sfx"Click"
fQ._zoomed=not fQ._zoomed
eM(ff,eL.Med,{Size=fQ._zoomed and UDim2.fromOffset(760,520)
or UDim2.fromOffset(620,440)})
end
f1=f2
end)
local f2,f3,f4=false
f0.InputBegan:Connect(function(f5)
if f5.UserInputType==Enum.UserInputType.MouseButton1 or f5.UserInputType==Enum.UserInputType.Touch then
f2,f3,f4=true,f5.Position,ff.Size
f5.Changed:Connect(function()
if f5.UserInputState==Enum.UserInputState.End then
f2=false

task.delay(0.15,function()
if not f2 then fQ:_applyTextScale()end
end)
end
end)
end
end)
fQ:Track(e1.InputChanged:Connect(function(f5)
if not f2 then return end
if f5.UserInputType~=Enum.UserInputType.MouseMovement
and f5.UserInputType~=Enum.UserInputType.Touch then return end
local f6=f5.Position-f3
ff.Size=UDim2.fromOffset(
math.clamp(f4.X.Offset+f6.X,520,920),
math.clamp(f4.Y.Offset+f6.Y,380,660))
end))

function fQ.Notify(f5,f6)
f6=f6 or{}
eK:_sfx"Notify"
eI.closeAny()
table.insert(eK._inbox,1,{Title=f6.Title or"Kronos",
Content=f6.Content or f6.Text or"",At=os.date"%H:%M"})
while#eK._inbox>30 do table.remove(eK._inbox)end
pcall(function()fI.Visible=true end)
local f7=ensureNotifyHost(fc)
local f8=Instance.new"CanvasGroup"f8.Size=UDim2.new(1,0,0,62)
f8.BackgroundColor3=e9.Surface2 f8.BorderSizePixel=0 f8.GroupTransparency=1
eT(f8,10)f8.Parent=f7
eV(f8,true)
eZ(f8,0.65,24)
eK:_tag(f8,"BackgroundColor3","Surface2")
f8.Position=UDim2.new(0,40,0,0)
eM(f8,eL.Med,{GroupTransparency=0,Position=UDim2.new(0,0,0,0)})
local f9=Instance.new"TextLabel"f9.BackgroundTransparency=1
f9.Position=UDim2.new(0,12,0,8)f9.Size=UDim2.new(1,-24,0,17)
f9.Font=Enum.Font.GothamBold f9.TextSize=13 f9.TextXAlignment=0
eK:_tag(f9,"TextColor3","Text")f9.Text=f6.Title or"Kronos"f9.Parent=f8
local ga=Instance.new"TextLabel"ga.BackgroundTransparency=1
ga.Position=UDim2.new(0,12,0,27)ga.Size=UDim2.new(1,-24,0,16)
ga.Font=Enum.Font.Gotham ga.TextSize=12 ga.TextXAlignment=0
eK:_tag(ga,"TextColor3","Dim")
ga.TextTruncate=Enum.TextTruncate.AtEnd ga.Text=f6.Content or f6.Text or""ga.Parent=f8
local gb=Instance.new"Frame"gb.AnchorPoint=Vector2.new(0,1)
gb.Position=UDim2.new(0,10,1,-6)gb.Size=UDim2.new(1,-20,0,2)
gb.BorderSizePixel=0 eK:agrad(gb,0)
eT(gb,99)gb.Parent=f8
local gc=f6.Duration or 4
eM(gb,TweenInfo.new(gc,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)})
task.delay(gc+0.1,function()
eM(f8,eL.Fast,{GroupTransparency=1})
task.delay(0.2,function()pcall(function()f8:Destroy()end)end)
end)
end




local function fadeModal(f5,f6,f7)
eM(f5,eL.Fast,{GroupTransparency=1})
pcall(function()
for f8,f9 in ipairs(f5:GetDescendants())do
if f9:IsA"UIStroke"then eM(f9,eL.Fast,{Transparency=1})end
end
end)
eM(f6,eL.Fast,{BackgroundTransparency=1})
task.delay(f7 or 0.18,function()pcall(function()f6:Destroy()end)end)
end


function fQ.Dialog(f5,f6)
f6=f6 or{}
eK:_sfx"Open"
local f7=Instance.new"TextButton"f7.Text=""f7.AutoButtonColor=false
f7.Size=UDim2.fromScale(1,1)f7.BackgroundColor3=Color3.fromRGB(0,0,0)
f7.BackgroundTransparency=1 f7.Parent=fb
eM(f7,eL.Med,{BackgroundTransparency=0.55})
local f8=Instance.new"CanvasGroup"f8.AnchorPoint=Vector2.new(0.5,0.5)



f8.Position=UDim2.new(0.5,ff.Position.X.Offset,0.5,ff.Position.Y.Offset)
f8.Size=UDim2.fromOffset(320,170)
f8.BackgroundColor3=e9.Surface f8.BorderSizePixel=0 f8.GroupTransparency=1
eT(f8,12)f8.Parent=f7
eV(f8,true)
eX(f8,12)
eZ(f8,0.5,40)
eK:_tag(f8,"BackgroundColor3","Surface")
local f9=Instance.new"UIScale"f9.Scale=0.94 f9.Parent=f8
eM(f8,eL.Med,{GroupTransparency=0})
eM(f9,eL.Spring,{Scale=1})
local ga=false
local function close()
if ga then return end ga=true
eI.close(close)
fadeModal(f8,f7)
end
eI.open(close)
f7.MouseButton1Click:Connect(function()close()end)
local gb=Instance.new"TextLabel"gb.BackgroundTransparency=1
gb.Position=UDim2.new(0,16,0,14)gb.Size=UDim2.new(1,-32,0,20)
gb.Font=Enum.Font.GothamBold gb.TextSize=15 gb.TextXAlignment=0
eK:_tag(gb,"TextColor3","Text")gb.Text=f6.Title or"Confirm"gb.Parent=f8
local gc=Instance.new"TextLabel"gc.BackgroundTransparency=1
gc.Position=UDim2.new(0,16,0,38)gc.Size=UDim2.new(1,-32,0,60)
gc.Font=Enum.Font.Gotham gc.TextSize=12 gb.TextXAlignment=0
gc.TextXAlignment=0 gc.TextYAlignment=0 gc.TextWrapped=true
eK:_tag(gc,"TextColor3","Dim")gc.Text=f6.Content or""gc.Parent=f8
local gd=Instance.new"Frame"gd.BackgroundTransparency=1
gd.AnchorPoint=Vector2.new(0,1)gd.Position=UDim2.new(0,0,1,-12)
gd.Size=UDim2.new(1,0,0,34)gd.Parent=f8
local ge=Instance.new"UIListLayout"ge.FillDirection=Enum.FillDirection.Horizontal
ge.HorizontalAlignment=Enum.HorizontalAlignment.Right ge.Padding=UDim.new(0,8)ge.Parent=gd
eW(gd,0,0,12,12)
for gf,gg in ipairs(f6.Buttons or{{Title="OK"}})do
local gh=Instance.new"TextButton"gh.Text=""
gh.Size=UDim2.new(0,96,0,30)gh.BackgroundColor3=e9.Surface2
gh.BorderSizePixel=0 eT(gh,7)gh.AutoButtonColor=false gh.Parent=gd
eV(gh,true)
eK:_tag(gh,"BackgroundColor3","Surface2")
local gi=Instance.new"TextLabel"gi.BackgroundTransparency=1 gi.Size=UDim2.fromScale(1,1)
gi.Font=Enum.Font.GothamBold gi.TextSize=12
eK:_tag(gi,"TextColor3","Text")gi.Text=gg.Title gi.Parent=gh
local gj=Instance.new"UIScale"gj.Parent=gh
gh.MouseButton1Down:Connect(function()eM(gj,eL.Hover,{Scale=0.95})end)
gh.MouseButton1Up:Connect(function()eM(gj,eL.Spring,{Scale=1})end)
gh.MouseButton1Click:Connect(function()
close()eN(gg.Callback)
end)
end
return{Close=close}
end



function fQ.Confirm(f5,f6)
f6=f6 or{}
local f7=f6.Danger==true
local f8=Instance.new"TextButton"f8.Text=""f8.AutoButtonColor=false
f8.Size=UDim2.fromScale(1,1)f8.BackgroundColor3=Color3.fromRGB(0,0,0)
f8.BackgroundTransparency=1 f8.Parent=fb
eM(f8,eL.Med,{BackgroundTransparency=0.55})
local f9=Instance.new"CanvasGroup"f9.AnchorPoint=Vector2.new(0.5,0.5)
f9.Position=UDim2.new(0.5,ff.Position.X.Offset,0.5,ff.Position.Y.Offset)
f9.Size=UDim2.fromOffset(320,150)
f9.BackgroundColor3=e9.Surface f9.BorderSizePixel=0 f9.GroupTransparency=1
eT(f9,12)f9.Parent=f8
eV(f9,true)
eX(f9,12)
eZ(f9,0.5,40)
eK:_tag(f9,"BackgroundColor3","Surface")
local ga=Instance.new"UIScale"ga.Scale=0.94 ga.Parent=f9
eM(f9,eL.Med,{GroupTransparency=0})
eM(ga,eL.Spring,{Scale=1})
local gb=false
local function close(gc)
if gb then return end gb=true
eI.close(close)
fadeModal(f9,f8)
eN(f6.Callback,gc and true or false)
end
eI.open(close)
f8.MouseButton1Click:Connect(function()close(false)end)
fQ:Track(e1.InputBegan:Connect(function(gc,gd)
if gb or gd then return end
if gc.KeyCode==Enum.KeyCode.Return or gc.KeyCode==Enum.KeyCode.KeypadEnter then
close(true)
elseif gc.KeyCode==Enum.KeyCode.Escape then
close(false)
end
end))
local gc=Instance.new"TextLabel"gc.BackgroundTransparency=1
gc.Position=UDim2.new(0,16,0,14)gc.Size=UDim2.new(1,-32,0,22)
gc.Font=Enum.Font.GothamBold gc.TextSize=15 gc.TextXAlignment=0
eK:_tag(gc,"TextColor3",f7 and"Danger"or"Text")
gc.Text=f6.Title or"Confirm"gc.Parent=f9
local gd=Instance.new"TextLabel"gd.BackgroundTransparency=1
gd.Position=UDim2.new(0,16,0,40)gd.Size=UDim2.new(1,-32,0,52)
gd.Font=Enum.Font.Gotham gd.TextSize=12
gd.TextXAlignment=0 gd.TextYAlignment=0 gd.TextWrapped=true
eK:_tag(gd,"TextColor3","Dim")gd.Text=f6.Text or""gd.Parent=f9
local ge=Instance.new"Frame"ge.BackgroundTransparency=1
ge.AnchorPoint=Vector2.new(0,1)ge.Position=UDim2.new(0,0,1,-12)
ge.Size=UDim2.new(1,0,0,34)ge.Parent=f9
local gf=Instance.new"UIListLayout"gf.FillDirection=Enum.FillDirection.Horizontal
gf.HorizontalAlignment=Enum.HorizontalAlignment.Right gf.Padding=UDim.new(0,8)gf.Parent=ge
eW(ge,0,0,12,12)
local function mkBtn(gg,gh,gi)
local gj=Instance.new"TextButton"gj.Text=""
gj.Size=UDim2.new(0,110,0,30)gj.BackgroundColor3=e9.Surface2
gj.BorderSizePixel=0 eT(gj,7)gj.AutoButtonColor=false gj.Parent=ge
eV(gj,true)
eK:_tag(gj,"BackgroundColor3","Surface2")
local gk=Instance.new"TextLabel"gk.BackgroundTransparency=1 gk.Size=UDim2.fromScale(1,1)
gk.Font=Enum.Font.GothamBold gk.TextSize=12
eK:_tag(gk,"TextColor3",gh and"Accent"or"Text")
gk.Text=gg gk.Parent=gj
gj.MouseButton1Click:Connect(function()gi()end)
return gj
end
mkBtn(f6.CancelText or"Cancel",false,function()close(false)end)
mkBtn(f6.ConfirmText or"Confirm",true,function()close(true)end)
return{Close=function()close(false)end}
end



function fQ.Modal(f5,f6)
f6=f6 or{}
local f7=f6.Fields or{}
local f8=f6.Danger==true
local f9=Instance.new"TextButton"f9.Text=""f9.AutoButtonColor=false
f9.Size=UDim2.fromScale(1,1)f9.BackgroundColor3=Color3.fromRGB(0,0,0)
f9.BackgroundTransparency=1 f9.Parent=fb
eM(f9,eL.Med,{BackgroundTransparency=0.55})
local ga=Instance.new"CanvasGroup"ga.AnchorPoint=Vector2.new(0.5,0.5)
ga.Position=UDim2.new(0.5,ff.Position.X.Offset,0.5,ff.Position.Y.Offset)
ga.Size=UDim2.fromOffset(340,0)ga.AutomaticSize=Enum.AutomaticSize.Y
ga.BackgroundColor3=e9.Surface ga.BorderSizePixel=0 ga.GroupTransparency=1
eT(ga,12)ga.Parent=f9
eV(ga,true)
eX(ga,12)
eZ(ga,0.5,40)
eK:_tag(ga,"BackgroundColor3","Surface")
local gb=Instance.new"UIScale"gb.Scale=0.94 gb.Parent=ga
eM(ga,eL.Med,{GroupTransparency=0})
eM(gb,eL.Spring,{Scale=1})
local gc=false
local gd={}
local function values()
local ge={}
for gf,gg in pairs(gd)do
ge[gf]=gg.Text
end
return ge
end
local function close(ge)
if gc then return end gc=true
eI.close(close)
fadeModal(ga,f9)
if ge then eN(f6.Callback,true,values())else eN(f6.Callback,false,values())end
end
eI.open(close)
f9.MouseButton1Click:Connect(function()close(false)end)
local ge=Instance.new"TextLabel"ge.BackgroundTransparency=1
ge.Position=UDim2.new(0,16,0,14)ge.Size=UDim2.new(1,-32,0,22)
ge.Font=Enum.Font.GothamBold ge.TextSize=15 ge.TextXAlignment=0
eK:_tag(ge,"TextColor3",f8 and"Danger"or"Text")
ge.Text=f6.Title or"Modal"ge.Parent=ga
local gf=42
if f6.Text and f6.Text~=""then
local gg=Instance.new"TextLabel"gg.BackgroundTransparency=1
gg.Position=UDim2.new(0,16,0,gf)gg.Size=UDim2.new(1,-32,0,30)
gg.Font=Enum.Font.Gotham gg.TextSize=12
gg.TextXAlignment=0 gg.TextYAlignment=0 gg.TextWrapped=true
eK:_tag(gg,"TextColor3","Dim")gg.Text=f6.Text gg.Parent=ga
gf+=36
end
for gg,gh in ipairs(f7)do
local gi=gh.Type=="textarea"
local gj=gi and 56 or 30
if gh.Label and gh.Label~=""then
local gk=Instance.new"TextLabel"gk.BackgroundTransparency=1
gk.Position=UDim2.new(0,16,0,gf)gk.Size=UDim2.new(1,-32,0,14)
gk.Font=Enum.Font.GothamBold gk.TextSize=11 gk.TextXAlignment=0
eK:_tag(gk,"TextColor3","Dim")gk.Text=string.upper(tostring(gh.Label))gk.Parent=ga
gf+=16
end
local gk=Instance.new"TextBox"
gk.PlaceholderText=gh.Placeholder or""gk.PlaceholderColor3=e9.Dim
gk.Text=gh.Default or""
gk.Font=Enum.Font.Gotham gk.TextSize=13
gk.TextXAlignment=0 gk.TextYAlignment=gi and 0 or 1
gk.TextWrapped=gi gk.MultiLine=gi
gk.ClearTextOnFocus=false
gk.Position=UDim2.new(0,16,0,gf)gk.Size=UDim2.new(1,-32,0,gj)
gk.BackgroundColor3=e9.Surface2 gk.BorderSizePixel=0
eT(gk,7)gk.Parent=ga
eW(gk,4,4,10,10)
eV(gk,true)
eK:_tag(gk,"BackgroundColor3","Surface2")
eK:_tag(gk,"TextColor3","Text")
if tonumber(gh.MaxLength)then
local gl=tonumber(gh.MaxLength)
gk:GetPropertyChangedSignal"Text":Connect(function()
if string.len(gk.Text)>gl then gk.Text=string.sub(gk.Text,1,gl)end
end)
end
gd[gh.Key]=gk
gf+=gj+10
end
local gg=Instance.new"Frame"gg.BackgroundTransparency=1
gg.Position=UDim2.new(0,0,0,gf)gg.Size=UDim2.new(1,0,0,46)
gg.Parent=ga
local gh=Instance.new"UIListLayout"gh.FillDirection=Enum.FillDirection.Horizontal
gh.HorizontalAlignment=Enum.HorizontalAlignment.Right gh.Padding=UDim.new(0,8)gh.Parent=gg
eW(gg,0,12,12,12)
local function mkBtn2(gi,gj,gk)
local gl=Instance.new"TextButton"gl.Text=""
gl.Size=UDim2.new(0,110,0,30)gl.BackgroundColor3=e9.Surface2
gl.BorderSizePixel=0 eT(gl,7)gl.AutoButtonColor=false gl.Parent=gg
eV(gl,true)
eK:_tag(gl,"BackgroundColor3","Surface2")
local gm=Instance.new"TextLabel"gm.BackgroundTransparency=1 gm.Size=UDim2.fromScale(1,1)
gm.Font=Enum.Font.GothamBold gm.TextSize=12
eK:_tag(gm,"TextColor3",gj and"Accent"or"Text")
gm.Text=gi gm.Parent=gl
gl.MouseButton1Click:Connect(function()gk()end)
return gl
end
mkBtn2(f6.CancelText or"Cancel",false,function()close(false)end)
mkBtn2(f6.ConfirmText or"Confirm",true,function()close(true)end)
return{Close=function()close(false)end}
end




function fQ.KeySystem(f5,f6)
f6=f6 or{}
local f7,f8=false,f6.FileName or("kronos_key_"..tostring(e5))

local f9=(f5._folder or"Kronos").."/"..f8 ..".txt"

if f6.SaveKey~=false then
pcall(function()
if readfile and isfile and isfile(f9)then
local ga=readfile(f9)
if ga and f5:_checkKey(f6,ga)then f7=true end
end
end)
end
local ga=Instance.new"TextButton"ga.Text=""ga.AutoButtonColor=false
ga.Size=UDim2.fromScale(1,1)ga.BackgroundColor3=Color3.fromRGB(0,0,0)
ga.BackgroundTransparency=1 ga.ZIndex=200 ga.Parent=fb
eM(ga,eL.Med,{BackgroundTransparency=0.6})
local gb=Instance.new"CanvasGroup"gb.AnchorPoint=Vector2.new(0.5,0.5)
gb.Position=UDim2.new(0.5,0,0.5,0)gb.Size=UDim2.fromOffset(300,210)
gb.BackgroundColor3=e9.Surface gb.BorderSizePixel=0 gb.GroupTransparency=1
eT(gb,12)gb.Parent=ga
eV(gb,true)
eX(gb,12)
eZ(gb,0.5,40)
eK:_tag(gb,"BackgroundColor3","Surface")
local gc=Instance.new"UIScale"gc.Scale=0.94 gc.Parent=gb
eM(gb,eL.Med,{GroupTransparency=0})
eM(gc,eL.Spring,{Scale=1})
local gd=Instance.new"TextLabel"gd.BackgroundTransparency=1
gd.Position=UDim2.new(0,16,0,14)gd.Size=UDim2.new(1,-32,0,20)
gd.Font=Enum.Font.GothamBold gd.TextSize=15 gd.TextXAlignment=0
eK:_tag(gd,"TextColor3","Text")gd.Text=f6.Title or"Enter Key"gd.Parent=gb
local ge=Instance.new"TextLabel"ge.BackgroundTransparency=1
ge.Position=UDim2.new(0,16,0,36)ge.Size=UDim2.new(1,-32,0,15)
ge.Font=Enum.Font.Gotham ge.TextSize=11 gd.TextXAlignment=0 ge.TextXAlignment=0
eK:_tag(ge,"TextColor3","Dim")ge.Text=string.upper(f6.Subtitle or"key required")ge.Parent=gb
local gf=Instance.new"TextBox"gf.PlaceholderText="Paste key..."
gf.PlaceholderColor3=e9.Dim gf.Text=""
gf.Font=Enum.Font.Code gf.TextSize=12
gf.Position=UDim2.new(0,16,0,60)gf.Size=UDim2.new(1,-32,0,32)
gf.BackgroundColor3=e9.Surface2 gf.BorderSizePixel=0
eT(gf,8)gf.Parent=gb
eW(gf,4,4,10,10)
eV(gf,true)
eK:_tag(gf,"BackgroundColor3","Surface2")
eK:_tag(gf,"TextColor3","Text")
local gg=Instance.new"TextLabel"gg.BackgroundTransparency=1
gg.Position=UDim2.new(0,16,0,96)gg.Size=UDim2.new(1,-32,0,15)
gg.Font=Enum.Font.Gotham gg.TextSize=11 gg.TextXAlignment=0 gg.Text=""
eK:_tag(gg,"TextColor3","Danger")gg.Parent=gb
local gh=Instance.new"TextButton"gh.Text=""
gh.Position=UDim2.new(0,16,0,118)gh.Size=UDim2.new(1,-32,0,32)
gh.BorderSizePixel=0 eT(gh,8)gh.AutoButtonColor=false gh.Parent=gb
eK:agrad(gh,15)
local gi=Instance.new"TextLabel"gi.BackgroundTransparency=1 gi.Size=UDim2.fromScale(1,1)
gi.Font=Enum.Font.GothamBold gi.TextSize=13 gi.Text="UNLOCK"
eK:oa(gi)gi.Parent=gh
local gj=Instance.new"UIScale"gj.Parent=gh
local gk
if f6.GetKeyLink then
gk=Instance.new"TextButton"gk.Text=""
gk.Position=UDim2.new(0,16,0,156)gk.Size=UDim2.new(1,-32,0,26)
gk.BackgroundTransparency=1 gk.Parent=gb
local gl=Instance.new"TextLabel"gl.BackgroundTransparency=1 gl.Size=UDim2.fromScale(1,1)
gl.Font=Enum.Font.Gotham gl.TextSize=11 gl.Text="Copy key link"
eK:_tag(gl,"TextColor3","Dim")gl.Parent=gk
gk.MouseButton1Click:Connect(function()
pcall(function()if setclipboard then setclipboard(f6.GetKeyLink)end end)
gl.Text="Link copied"
task.delay(2,function()pcall(function()gl.Text="Copy key link"end)end)
end)
end
local function shake()local gl=
gb.Position.X.Offset
for gm=1,3 do
eM(gb,TweenInfo.new(0.05),{Position=UDim2.new(0.5,8,0.5,0)})
task.wait(0.05)
eM(gb,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-8,0.5,0)})
task.wait(0.05)
end
eM(gb,eL.Med,{Position=UDim2.new(0.5,0,0.5,0)})
end
local function unlock()
f7=true
if f6.SaveKey~=false then
pcall(function()
if makefolder and isfolder and not isfolder(f5._folder or"Kronos")then
makefolder(f5._folder or"Kronos")
end
if writefile then writefile(f9,gf.Text)end
end)
end
fadeModal(gb,ga,0.2)
f5:Notify{Title="Welcome",Content="Key accepted.",Duration=2}
eN(f6.OnSuccess)
end
local function check()
local gl=gf.Text
if f5:_checkKey(f6,gl)then unlock()
else gg.Text="Invalid key."task.spawn(shake)end
end
gh.MouseButton1Down:Connect(function()eM(gj,eL.Hover,{Scale=0.96})end)
gh.MouseButton1Up:Connect(function()eM(gj,eL.Spring,{Scale=1})end)
gh.MouseButton1Click:Connect(check)
gf.FocusLost:Connect(function(gl)if gl then check()end end)
if f7 then pcall(function()ga:Destroy()end)eN(f6.OnSuccess)end
return{Passed=function()return f7 end}
end

function eK._checkKey(f5,f6,f7)
if f6.Validate and type(f6.Validate)=="function"then
local f8,f9=pcall(f6.Validate,f7)
if f8 and f9 then return true end
end
if f6.Key and f7==f6.Key then return true end
if f6.Keys and table.find(f6.Keys,f7)then return true end
if not f6.Key and not f6.Keys and not f6.Validate then return true end
return false
end


function fQ.TogglePalette(f5,f6)
local f7=f5._palette
if not f7 then
local f8=Instance.new"TextButton"f8.Text=""f8.AutoButtonColor=false
f8.Size=UDim2.fromScale(1,1)f8.BackgroundColor3=Color3.fromRGB(0,0,0)
f8.BackgroundTransparency=1 f8.Visible=false f8.ZIndex=eI.Z.Popup f8.Parent=fc
local f9=Instance.new"Frame"f9.AnchorPoint=Vector2.new(0.5,0)
f9.Position=UDim2.new(0.5,0,0,90)f9.Size=UDim2.fromOffset(380,300)
f9.BackgroundColor3=e9.Bg f9.BorderSizePixel=0
eT(f9,12)f9.Parent=f8
eV(f9,true)
eZ(f9,0.5,40)
eK:_tag(f9,"BackgroundColor3","Bg")
local ga=Instance.new"TextBox"ga.PlaceholderText="Type a command..."
ga.PlaceholderColor3=e9.Dim ga.Text=""
ga.Font=Enum.Font.Gotham ga.TextSize=14
ga.Position=UDim2.new(0,14,0,12)ga.Size=UDim2.new(1,-28,0,32)
ga.BackgroundTransparency=1 ga.ClearTextOnFocus=false ga.Parent=f9
eK:_tag(ga,"TextColor3","Text")
local gb=Instance.new"Frame"gb.BorderSizePixel=0
gb.Position=UDim2.new(0,12,0,50)gb.Size=UDim2.new(1,-24,0,1)
gb.BackgroundColor3=Color3.fromRGB(255,255,255)
gb.BackgroundTransparency=0.93 gb.Parent=f9
local gc=Instance.new"ScrollingFrame"
gc.Position=UDim2.new(0,8,0,56)gc.Size=UDim2.new(1,-16,1,-64)
gc.BackgroundTransparency=1 gc.BorderSizePixel=0
gc.ScrollBarThickness=2 gc.CanvasSize=UDim2.new(0,0,0,0)
gc.AutomaticCanvasSize=Enum.AutomaticSize.Y gc.Parent=f9
eK:_tag(gc,"ScrollBarImageColor3","Surface2")
local gd=Instance.new"UIListLayout"gd.Padding=UDim.new(0,2)
gd.SortOrder=Enum.SortOrder.LayoutOrder gd.Parent=gc
f7={ov=f8,card=f9,box=ga,list=gc,open=false,sel=1,rows={}}
f5._palette=f7
local function fuzzy(ge,gf)
ge,gf=string.lower(ge),string.lower(gf)
if ge==""then return 0 end
local gg,gh,gi=1,0,0
for gj=1,#gf do
if string.sub(gf,gj,gj)==string.sub(ge,gg,gg)then
gh+=(gi==gj-1)and 2 or 1
gi,gg=gj,gg+1
if gg>#ge then return gh-gj*0.01 end
end
end
return nil
end
local function run(ge)
if not ge then return end
f7.ov.Visible,f7.open=false,false
eI.close(f7._closeLayer)
eM(f7.ov,eL.Fast,{BackgroundTransparency=1})
if ge.go then pcall(ge.go)end
end
f7._run=run
local function render()
for ge,gf in ipairs(f7.rows)do pcall(function()gf.frame:Destroy()end)end
f7.rows={}
local ge=ga.Text
local gf={}
for gg,gh in ipairs(f5._tabs)do
local gi=fuzzy(ge,gh.Title)
if gi then table.insert(gf,{label=gh.Title,hint="tab",score=gi+100,
go=function()f5._activateTab(gh,true)end})end
for gj,gk in ipairs(gh.Elements)do
if gk.Title and gk.Frame then
local gl=fuzzy(ge,gh.Title.." "..gk.Title)
if gl then table.insert(gf,{label=gk.Title,hint=gh.Title,score=gl,
go=gk._go})end
end
end
end
table.sort(gf,function(gg,gh)return gg.score>gh.score end)
f7.sel=math.clamp(f7.sel,1,math.max(1,math.min(12,#gf)))
if#gf==0 then
local gg=Instance.new"TextLabel"gg.BackgroundTransparency=1
gg.Size=UDim2.new(1,0,0,30)gg.Font=Enum.Font.Gotham
gg.TextSize=12 gg.Text="No results"gg.Parent=gc
eK:_tag(gg,"TextColor3","Dim")
f7.rows={{frame=gg}}
return
end
for gg=1,math.min(12,#gf)do
local gh=gf[gg]
local gi=Instance.new"TextButton"gi.Text=""
gi.Size=UDim2.new(1,-4,0,32)gi.BorderSizePixel=0
gi.BackgroundColor3=e9.Surface2
gi.BackgroundTransparency=(gg==f7.sel)and 0.35 or 1
eT(gi,7)gi.Parent=gc
eK:_tag(gi,"BackgroundColor3","Surface2")
local gj=Instance.new"TextLabel"gj.BackgroundTransparency=1
gj.Position=UDim2.new(0,10,0,0)gj.Size=UDim2.new(1,-90,1,0)
gj.Font=Enum.Font.Gotham gj.TextSize=13 gj.TextXAlignment=0
gj.TextTruncate=Enum.TextTruncate.AtEnd gj.Text=gh.label gj.Parent=gi
eK:_tag(gj,"TextColor3","Text")
local gk=Instance.new"TextLabel"gk.BackgroundTransparency=1
gk.AnchorPoint=Vector2.new(1,0)gk.Position=UDim2.new(1,-10,0,0)
gk.Size=UDim2.new(0,70,1,0)gk.Font=Enum.Font.Gotham
gk.TextSize=10 gk.TextXAlignment=1 gj.TextTruncate=Enum.TextTruncate.AtEnd
gk.Text=gh.hint gk.Parent=gi
eK:_tag(gk,"TextColor3","Dim")
local gl=gg
gi.MouseButton1Click:Connect(function()run(gh)end)
gi.MouseEnter:Connect(function()
f7.sel=gl render()
end)
table.insert(f7.rows,{frame=gi,item=gh})
end
end
f7._render=render
ga:GetPropertyChangedSignal"Text":Connect(function()f7.sel=1 render()end)
f8.MouseButton1Click:Connect(function()
if f7.open then f5:TogglePalette(false)end
end)
f5:Track(e1.InputBegan:Connect(function(ge,gf)
if not f7.open then return end
if ge.KeyCode==Enum.KeyCode.Escape then f5:TogglePalette(false)
elseif ge.KeyCode==Enum.KeyCode.Return or ge.KeyCode==Enum.KeyCode.KeypadEnter then
local gg=f7.rows[f7.sel]
run(gg and gg.item)
elseif ge.KeyCode==Enum.KeyCode.Up then
f7.sel=math.max(1,f7.sel-1)render()
elseif ge.KeyCode==Enum.KeyCode.Down then
f7.sel=math.min(#f7.rows,f7.sel+1)render()
end
end))
f7._closeLayer=function()
if f7.open then f5:TogglePalette(false)end
end
end
local f8=(f6~=nil)and f6 or(not f7.open)
f7.open=f8
f7.ov.Visible=f8
if f8 then
eI.open(f7._closeLayer)
eK:_sfx"Open"
flyTo(f7.ov,{BackgroundTransparency=0.45})
f7.card.Position=UDim2.new(0.5,0,0,78)
flyTo(f7.card,{Position=UDim2.new(0.5,0,0,90)})
f7.box.Text,f7.sel="",1
f7._render()
task.defer(function()pcall(function()f7.box:CaptureFocus()end)end)
else
eI.close(f7._closeLayer)
flyTo(f7.ov,{BackgroundTransparency=1},eL.Fast,function()
if not f7.open then f7.ov.Visible=false end
end)
end
end

function fQ.SetTheme(f5,f6)eK:SetTheme(f6)end

function eK.SetAccent(f5,f6)
if typeof(f6)~="Color3"then return end
f5.Themes[f5.ThemeName].Accent=f6
f5:SetTheme(f5.ThemeName)
end


eK.FontPacks={
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
eK.FontPack="Gotham+"
eK._roleFromDefault={
[Enum.Font.GothamBlack]="Black",[Enum.Font.GothamBold]="Bold",
[Enum.Font.GothamMedium]="Title",[Enum.Font.Gotham]="Body",
[Enum.Font.Code]="Mono",
}

function eK._resolveFont(f5,f6)
local f7,f8=pcall(function()return Enum.Font[f6]end)
if f7 and f8 then return f8 end
return nil
end
function eK._paintFonts(f5,f6)
local f7=f5.FontPacks[f5.FontPack]
if not f7 then return end
for f8,f9 in ipairs(f6:GetDescendants())do
if f9:IsA"TextLabel"or f9:IsA"TextButton"or f9:IsA"TextBox"then
local ga=f9:GetAttribute"KronosFontRole"
if not ga then
ga=f5._roleFromDefault[f9.Font]or"Body"
f9:SetAttribute("KronosFontRole",ga)
f9:SetAttribute("KronosBaseSize",f9.TextSize)
end
local gb=f9:GetAttribute"KronosBaseSize"or f9.TextSize
local gc=(f7.Bump and f7.Bump[ga])or 0
local gd=f7[ga]and f5:_resolveFont(f7[ga])or nil
pcall(function()
if gd then f9.Font=gd end
f9.TextSize=math.clamp(gb+gc,8,30)
end)
end
end
end
function eK.SetFontPack(f5,f6)
if not f5.FontPacks[f6]then return end
f5.FontPack=f6
if f5._gui then f5:_paintFonts(f5._gui)end
end
function eK.RefreshFonts(f5)
if f5._gui then f5:_paintFonts(f5._gui)end
end
function fQ.SetAccent(f5,f6)eK:SetAccent(f6)end
function fQ.SetScale(f5,f6)
fh=math.clamp(tonumber(f6)or 1,0.7,1.25)
fi.Scale=baseScale()
fQ:_applyTextScale()
end

function fQ._applyTextScale(f5)
local f6=440
pcall(function()f6=ff.AbsoluteSize.Y end)
if f6<10 then f6=440 end
aa._textScale=fh*math.clamp(f6/440,0.85,1.3)
if fb and fb.Parent then af.paintFonts(fb)end
end
function fQ.SetCompact(f5,f6)
f6=f6 and true or false
if f6 then

if not f5._preCompactSize then
pcall(function()f5._preCompactSize=ff.Size end)
end
eM(ff,eL.Med,{Size=UDim2.fromOffset(560,400)})
else
local f7=f5._preCompactSize
or(f5._zoomed and UDim2.fromOffset(760,520)or UDim2.fromOffset(620,440))
f5._preCompactSize=nil
eM(ff,eL.Med,{Size=f7})
end
for f7,f8 in ipairs(f5._tabs)do
if f8._pl then f8._pl.Padding=f6 and UDim.new(0,4)or UDim.new(0,8)end
end
end
function fQ.ToggleAcrylic(f5,f6)
eK:ToggleAcrylic(f6)
ff.BackgroundTransparency=(f6 and not eK._transparent)and 0.08 or 0
fL.BackgroundTransparency=(f6 and not eK._transparent)and 0.15 or 0
end
function fQ.ToggleTransparency(f5,f6)
eK._transparent=f6 and true or false
local f7=(eK._acrylicOn and not f6)and 0.08 or(f6 and 0.25 or 0)
ff.BackgroundTransparency=f7
fL.BackgroundTransparency=f6 and 0.4 or((eK._acrylicOn and not f6)and 0.15 or 0)
end


function fQ.SetBackdrop(f5,f6)
f6=f6 and true or false
fe=f6
f5._backdrop=f6
if f6 then
if f5._visible and not f5._mini then
fd.Visible=true
eM(fd,eL.Med,{BackgroundTransparency=0.5})
end
else
eM(fd,eL.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
if not fe then fd.Visible=false end
end)
end
end




local f5=Instance.new"TextButton"
f5.Name=ad.GetStealthName()
f5.Text=""f5.AutoButtonColor=false
f5.Size=UDim2.fromScale(1,1)
f5.BackgroundColor3=Color3.fromRGB(0,0,0)
f5.BackgroundTransparency=1 f5.BorderSizePixel=0
f5.Visible=false f5.Parent=fJ
eT(f5,10)
local function slideCloseAll()
if fQ._inboxPanel and fQ._inboxPanel.open then fQ:ToggleInbox(false)end
if fQ._kbPanel and fQ._kbPanel.open then fQ:ToggleKeybindList(false)end
end
f5.MouseButton1Click:Connect(function()slideCloseAll()end)
local function slideShadeSet(f6)
if f6 then
eI.open(slideCloseAll)
f5.Visible=true
eM(f5,eL.Med,{BackgroundTransparency=0.5})
else
eI.close(slideCloseAll)
eM(f5,eL.Fast,{BackgroundTransparency=1})
task.delay(0.18,function()
local f7=fQ._inboxPanel and fQ._inboxPanel.open
local f8=fQ._kbPanel and fQ._kbPanel.open
if not f7 and not f8 then f5.Visible=false end
end)
end
end


function fQ.ToggleInbox(f6,f7)
local f8=f6._inboxPanel
if not f8 then
local f9=Instance.new"Frame"f9.AnchorPoint=Vector2.new(1,0)
f9.Position=UDim2.new(1,12,0,0)f9.Size=UDim2.new(0,230,1,0)
f9.BackgroundColor3=e9.Bg f9.BorderSizePixel=0
eT(f9,10)f9.Parent=fJ f9.Visible=false
eV(f9,true)
eK:_tag(f9,"BackgroundColor3","Bg")
local ga=Instance.new"TextLabel"ga.BackgroundTransparency=1
ga.Position=UDim2.new(0,12,0,10)ga.Size=UDim2.new(1,-70,0,18)
ga.Font=Enum.Font.GothamBold ga.TextSize=11 ga.TextXAlignment=0
ga.Text="INBOX"ga.Parent=f9
eK:_tag(ga,"TextColor3","Dim")
local gb=Instance.new"TextButton"gb.Text=""
gb.AnchorPoint=Vector2.new(1,0)gb.Position=UDim2.new(1,-10,0,10)
gb.Size=UDim2.new(0,52,0,18)gb.BackgroundColor3=e9.Surface2
gb.BorderSizePixel=0 eT(gb,6)gb.AutoButtonColor=false gb.Parent=f9
eV(gb,true)
eK:_tag(gb,"BackgroundColor3","Surface2")
local gc=Instance.new"TextLabel"gc.BackgroundTransparency=1
gc.Size=UDim2.fromScale(1,1)gc.Font=Enum.Font.GothamBold
gc.TextSize=10 gc.Text="CLEAR"gc.Parent=gb
eK:_tag(gc,"TextColor3","Dim")
local gd=Instance.new"ScrollingFrame"
gd.Position=UDim2.new(0,8,0,34)gd.Size=UDim2.new(1,-16,1,-42)
gd.BackgroundTransparency=1 gd.BorderSizePixel=0
gd.ScrollBarThickness=2 gd.CanvasSize=UDim2.new(0,0,0,0)
gd.AutomaticCanvasSize=Enum.AutomaticSize.Y gd.Parent=f9
eK:_tag(gd,"ScrollBarImageColor3","Surface2")
local ge=Instance.new"UIListLayout"ge.Padding=UDim.new(0,4)
ge.SortOrder=Enum.SortOrder.LayoutOrder ge.Parent=gd
f8={panel=f9,list=gd,open=false}
f6._inboxPanel=f8
local function refresh()
for gf,gg in ipairs(gd:GetChildren())do


if gg:IsA"Frame"or gg:IsA"TextLabel"then pcall(function()gg:Destroy()end)end
end
if#eK._inbox==0 then
local gf=Instance.new"TextLabel"gf.BackgroundTransparency=1
gf.Size=UDim2.new(1,0,0,24)gf.Font=Enum.Font.Gotham
gf.TextSize=11 gf.Text="All caught up."gf.Parent=gd
eK:_tag(gf,"TextColor3","Dim")
return
end
for gf,gg in ipairs(eK._inbox)do
local gh=Instance.new"Frame"
gh.Size=UDim2.new(1,-2,0,44)gh.BackgroundColor3=e9.Surface2
gh.BackgroundTransparency=0.35 gh.BorderSizePixel=0
eT(gh,7)gh.Parent=gd
eK:_tag(gh,"BackgroundColor3","Surface2")
local gi=Instance.new"TextLabel"gi.BackgroundTransparency=1
gi.Position=UDim2.new(0,8,0,4)gi.Size=UDim2.new(1,-52,0,15)
gi.Font=Enum.Font.GothamBold gi.TextSize=11 gi.TextXAlignment=0
gi.TextTruncate=Enum.TextTruncate.AtEnd gi.Text=gg.Title gi.Parent=gh
eK:_tag(gi,"TextColor3","Text")
local gj=Instance.new"TextLabel"gj.BackgroundTransparency=1
gj.Position=UDim2.new(0,8,0,20)gj.Size=UDim2.new(1,-52,0,18)
gj.Font=Enum.Font.Gotham gj.TextSize=11 gj.TextXAlignment=0
gj.TextTruncate=Enum.TextTruncate.AtEnd gj.Text=gg.Content gj.Parent=gh
eK:_tag(gj,"TextColor3","Dim")
local gk=Instance.new"TextLabel"gk.BackgroundTransparency=1
gk.AnchorPoint=Vector2.new(1,0)gk.Position=UDim2.new(1,-8,0,4)
gk.Size=UDim2.new(0,40,0,14)gk.Font=Enum.Font.Code
gk.TextSize=10 gk.TextXAlignment=1 gk.Text=gg.At gk.Parent=gh
eK:_tag(gk,"TextColor3","Dim")
end
end
f8.refresh=refresh
gb.MouseButton1Click:Connect(function()
eK._inbox={}
refresh()
pcall(function()fI.Visible=false end)
end)
end
local f9=(f7~=nil)and f7 or(not f8.open)
f8.open=f9
if f9 then
if f6._kbPanel and f6._kbPanel.open then f6:ToggleKeybindList(false)end
slideShadeSet(true)
f8.refresh()
f8.panel.Visible=true
pcall(function()fI.Visible=false end)
flyTo(f8.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(f8.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not f8.open then f8.panel.Visible=false end
end)
slideShadeSet(f6._kbPanel~=nil and f6._kbPanel.open==true)
end
end


function fQ.ToggleKeybindList(f6,f7)
local f8=f6._kbPanel
if not f8 then
local f9=Instance.new"Frame"f9.AnchorPoint=Vector2.new(1,0)
f9.Position=UDim2.new(1,12,0,0)f9.Size=UDim2.new(0,210,1,0)
f9.BackgroundColor3=e9.Bg f9.BorderSizePixel=0
eT(f9,10)f9.Parent=fJ f9.Visible=false
eV(f9,true)
eK:_tag(f9,"BackgroundColor3","Bg")
local ga=Instance.new"TextLabel"ga.BackgroundTransparency=1
ga.Position=UDim2.new(0,12,0,10)ga.Size=UDim2.new(1,-24,0,18)
ga.Font=Enum.Font.GothamBold ga.TextSize=11 ga.TextXAlignment=0
ga.Text="KEYBINDS"ga.Parent=f9
eK:_tag(ga,"TextColor3","Dim")
local gb=Instance.new"ScrollingFrame"
gb.Position=UDim2.new(0,8,0,34)gb.Size=UDim2.new(1,-16,1,-42)
gb.BackgroundTransparency=1 gb.BorderSizePixel=0
gb.ScrollBarThickness=2 gb.CanvasSize=UDim2.new(0,0,0,0)
gb.AutomaticCanvasSize=Enum.AutomaticSize.Y gb.Parent=f9
eK:_tag(gb,"ScrollBarImageColor3","Surface2")
local gc=Instance.new"UIListLayout"gc.Padding=UDim.new(0,4)
gc.SortOrder=Enum.SortOrder.LayoutOrder gc.Parent=gb
f8={panel=f9,list=gb,open=false}
f6._kbPanel=f8
local function refresh()
for gd,ge in ipairs(gb:GetChildren())do
if ge:IsA"TextButton"then pcall(function()ge:Destroy()end)end
end
if#f6._keybinds==0 then
local gd=Instance.new"TextLabel"gd.BackgroundTransparency=1
gd.Size=UDim2.new(1,0,0,24)gd.Font=Enum.Font.Gotham
gd.TextSize=11 gd.Text="No keybinds yet"gd.Parent=gb
eK:_tag(gd,"TextColor3","Dim")
return
end
for gd,ge in ipairs(f6._keybinds)do
local gf=Instance.new"TextButton"gf.Text=""
gf.Size=UDim2.new(1,-2,0,30)gf.BackgroundColor3=e9.Surface2
gf.BackgroundTransparency=0.35 gf.BorderSizePixel=0
eT(gf,7)gf.Parent=gb
eK:_tag(gf,"BackgroundColor3","Surface2")
local gg=Instance.new"TextLabel"gg.BackgroundTransparency=1
gg.Position=UDim2.new(0,8,0,0)gg.Size=UDim2.new(1,-70,1,0)
gg.Font=Enum.Font.Gotham gg.TextSize=11 gg.TextXAlignment=0
gg.TextTruncate=Enum.TextTruncate.AtEnd gg.Text=ge.Title gg.Parent=gf
eK:_tag(gg,"TextColor3","Text")
local gh=Instance.new"TextLabel"gh.BackgroundTransparency=1
gh.AnchorPoint=Vector2.new(1,0)gh.Position=UDim2.new(1,-8,0,0)
gh.Size=UDim2.new(0,56,1,0)gh.Font=Enum.Font.Code
gh.TextSize=10 gh.TextXAlignment=1 gh.Text=ge.GetName()gh.Parent=gf
eK:_tag(gh,"TextColor3","Dim")
gf.MouseButton1Click:Connect(function()
eK:_sfx"Click"ge.Rebind()
task.delay(0.2,function()pcall(function()gh.Text=ge.GetName()end)end)
end)
end
end
f8.refresh=refresh
f6._kbPanelRefresh=refresh
end
local f9=(f7~=nil)and f7 or(not f8.open)
f8.open=f9
if f9 then
if f6._inboxPanel and f6._inboxPanel.open then f6:ToggleInbox(false)end
slideShadeSet(true)
f8.refresh()
f8.panel.Visible=true
flyTo(f8.panel,{Position=UDim2.new(1,0,0,0)})
else
flyTo(f8.panel,{Position=UDim2.new(1,12,0,0)},nil,function()
if not f8.open then f8.panel.Visible=false end
end)
slideShadeSet(f6._inboxPanel~=nil and f6._inboxPanel.open==true)
end
end


function fQ.Onboarding(f6,f7)
f7=f7 or{}
local f8=f7.Steps or f7.Pages or{{Title="Welcome",Content="This is Kronos."}}
local f9=1
local ga=Instance.new"TextButton"ga.Text=""ga.AutoButtonColor=false
ga.Size=UDim2.fromScale(1,1)ga.BackgroundColor3=Color3.fromRGB(0,0,0)
ga.BackgroundTransparency=1 ga.ZIndex=180 ga.Parent=fb
eM(ga,eL.Med,{BackgroundTransparency=0.6})
local gb=Instance.new"CanvasGroup"gb.AnchorPoint=Vector2.new(0.5,0.5)
gb.Position=UDim2.new(0.5,0,0.5,0)gb.Size=UDim2.fromOffset(340,220)
gb.BackgroundColor3=e9.Surface gb.BorderSizePixel=0 gb.GroupTransparency=1
eT(gb,12)gb.Parent=ga
eV(gb,true)
eX(gb,12)
eZ(gb,0.5,40)
eK:_tag(gb,"BackgroundColor3","Surface")
local gc=Instance.new"UIScale"gc.Scale=0.94 gc.Parent=gb
eM(gb,eL.Med,{GroupTransparency=0})
eM(gc,eL.Spring,{Scale=1})
local gd=Instance.new"TextLabel"gd.BackgroundTransparency=1
gd.Position=UDim2.new(0,20,0,18)gd.Size=UDim2.new(1,-40,0,24)
gd.Font=Enum.Font.GothamBold gd.TextSize=17 gd.TextXAlignment=0 gd.Parent=gb
eK:_tag(gd,"TextColor3","Text")
local ge=Instance.new"TextLabel"ge.BackgroundTransparency=1
ge.Position=UDim2.new(0,20,0,48)ge.Size=UDim2.new(1,-40,0,90)
ge.Font=Enum.Font.Gotham ge.TextSize=13 gd.TextXAlignment=0
ge.TextXAlignment=0 ge.TextYAlignment=0 ge.TextWrapped=true ge.Parent=gb
eK:_tag(ge,"TextColor3","Dim")
local gf=Instance.new"Frame"gf.BackgroundTransparency=1
gf.AnchorPoint=Vector2.new(0,1)gf.Position=UDim2.new(0,20,1,-52)
gf.Size=UDim2.new(0,120,0,10)gf.Parent=gb
local gg=Instance.new"UIListLayout"gg.FillDirection=Enum.FillDirection.Horizontal
gg.Padding=UDim.new(0,6)gg.Parent=gf
local gh={}
for gi=1,#f8 do
local gj=Instance.new"Frame"gj.Size=UDim2.fromOffset(8,8)
gj.BorderSizePixel=0 eT(gj,99)gj.Parent=gf
eK:_tag(gj,"BackgroundColor3","Surface2")
gh[gi]=gj
end
local gi,gj,gk
local function paint()
gd.Text,ge.Text=f8[f9].Title or"",f8[f9].Content or""
for gl,gm in ipairs(gh)do
if gl==f9 then eK:_tag(gm,"BackgroundColor3","Accent")
else eK:_tag(gm,"BackgroundColor3","Surface2")end
end
gi.Visible=f9>1
gk.Text=(f9==#f8)and"FINISH"or"NEXT"
gd.Position=UDim2.new(0,26,0,18)
eM(gd,eL.Fast,{Position=UDim2.new(0,20,0,18)})
end
local gl=Instance.new"Frame"gl.BackgroundTransparency=1
gl.AnchorPoint=Vector2.new(0,1)gl.Position=UDim2.new(0,0,1,-12)
gl.Size=UDim2.new(1,0,0,34)gl.Parent=gb
local gm=Instance.new"UIListLayout"gm.FillDirection=Enum.FillDirection.Horizontal
gm.HorizontalAlignment=Enum.HorizontalAlignment.Right gm.Padding=UDim.new(0,8)gm.Parent=gl
eW(gl,0,0,12,12)
gi=Instance.new"TextButton"gi.Text=""
gi.Size=UDim2.new(0,80,0,30)gi.BackgroundTransparency=1 gi.Parent=gl
local gn=Instance.new"TextLabel"gn.BackgroundTransparency=1
gn.Size=UDim2.fromScale(1,1)gn.Font=Enum.Font.GothamBold
gn.TextSize=12 gn.Text="BACK"gn.Parent=gi
eK:_tag(gn,"TextColor3","Dim")
local go=Instance.new"TextButton"go.Text=""
go.Size=UDim2.new(0,80,0,30)go.BackgroundTransparency=1 go.Parent=gl
local gp=Instance.new"TextLabel"gp.BackgroundTransparency=1
gp.Size=UDim2.fromScale(1,1)gp.Font=Enum.Font.Gotham
gp.TextSize=12 gp.Text="Skip"gp.Parent=go
eK:_tag(gp,"TextColor3","Dim")
gj=Instance.new"TextButton"gj.Text=""
gj.Size=UDim2.new(0,96,0,30)gj.BorderSizePixel=0
eT(gj,7)gj.AutoButtonColor=false gj.Parent=gl
eK:agrad(gj,15)
gk=Instance.new"TextLabel"gk.BackgroundTransparency=1
gk.Size=UDim2.fromScale(1,1)gk.Font=Enum.Font.GothamBold
gk.TextSize=12
gk.Text="NEXT"gk.Parent=gj
eK:oa(gk)
local function close()
fadeModal(gb,ga)
eN(f7.OnFinish)
end
gi.MouseButton1Click:Connect(function()
eK:_sfx"Click"f9=math.max(1,f9-1)paint()
end)
go.MouseButton1Click:Connect(function()close()end)
gj.MouseButton1Click:Connect(function()
eK:_sfx"Click"
if f9>=#f8 then close()else f9+=1 paint()end
end)
paint()
end



function fQ.Tab(f6,f7)
return ey({
Window=fQ,opts=e4,Th=e9,pgui=fc,
pages=fP,nav=fM,pill=fO,subLbl=fs,
},f7)
end


function fQ.EspPreview(f6,f7)
return ez({Window=fQ,Th=e9,main=ff,gui=fb},f7)
end

function fQ.AddCloudPanel(f6,f7)
return eF(f6,f7)
end

function fQ.AddChatPanel(f6,f7)
return eG(f6,f7)
end

function fQ.AddGlobalChatPanel(f6,f7)
return eH(f6,f7)
end

function fQ.SelectTab(f6,f7)
if type(f7)=="number"then
local f8=f6._tabs[f7]
if f8 then f6._activateTab(f8,true)end
return f8
end
for f8,f9 in ipairs(f6._tabs)do
if f9.Title==f7 then
f6._activateTab(f9,true)
return f9
end
end
return nil
end
function fQ.FindElement(f6,f7)
f7=tostring(f7 or""):lower()
if f7==""then return nil end
local f8,f9=0
for ga,gb in ipairs(f6._tabs)do
for gc,gd in ipairs(gb.Elements or{})do
local ge=tostring(gd.Title or"")
if ge~=""then
local gf=ge:lower()
if gf==f7 then return{title=gd.Title,instance=gd.Frame,tabObj=gb,kind=gd.Kind,flag=gd.Flag,_go=gd._go},math.huge end
if gf:find(f7,1,true)then
local gg=#f7/#gf
if gg>f8 then
f8=gg
f9={title=gd.Title,instance=gd.Frame,tabObj=gb,kind=gd.Kind,flag=gd.Flag,_go=gd._go}
end
end
end
end
end
if f8<=0 then return nil end
return f9,f8
end
function fQ.DescribeElement(f6,f7)
if not f7 then return nil end
local f8={
name=tostring(f7.title or""),
type=f7.kind,
tab=f7.tabObj and f7.tabObj.Title or nil,
description=f7.description,
}
if f7.flag~=nil and f7.flag~=""then
f8.flag=f7.flag
local f9=eK.Flags[f7.flag]
if f9~=nil then
local ga=type(f9)
f8.currentValue=(ga=="string"or ga=="number"or ga=="boolean")and f9 or tostring(f9)
end
end
return f8
end
function fQ._JumpToSearchable(f6,f7)
if not f7 then return end
if f7._go then pcall(f7._go)return end
local f8,f9=f7.tabObj,f7.instance
if not f8 or not f9 then return end
f6._activateTab(f8,true)
task.delay(0.6,function()
if f9.Parent then f6:_flash(f9)end
end)
end
function fQ.JumpToElement(f6,f7)
f7=tostring(f7 or"")
if f7==""then return false,"No element name given"end
local f8=f6:FindElement(f7)
if not f8 then
return false,"No element found matching '"..f7 .."'"
end
f6:_JumpToSearchable(f8)
return true,f8.title
end
function fQ._BuildDefaultSystemPrompt(f6)
local f7={}
for f8,f9 in ipairs(f6._tabs)do
if not f9.Hidden then table.insert(f7,f9.Title)end
end

return"You are a helpful assistant embedded in a Roblox UI panel built with KronosUI. Your tools "
.."only affect THIS PANEL -- they inspect/adjust the panel's own toggles/sliders/etc, switch "
.."between its top-level tabs ("..table.concat(f7,", ")..[[), switch to a specific sub-tab within one of those, and jump to/highlight a specific UI element on the panel by its visible label. Only use select_tab, select_subtab, or find_and_highlight_element when the user is asking to be taken somewhere IN THIS PANEL, or to interact with a control that's actually on it. If the user asks you to write a script, explain something, or anything else that isn't about navigating this panel, just answer directly in chat -- do not call a tool just because the message happens to mention a word that sounds like a setting. When you write a Luau script for the user, put it in a normal ```lua fenced block -- the panel automatically adds a Run button to it that the user can click themselves, so you don't need to explain how to run it or tell them you can't execute code; you're just not the one who decides to run it -- they click Run after reading it. Keep answers short and to the point. None of your tools execute anything outside this panel, and you have no way to trigger the Run button yourself.]]












end
function fQ._BuildDefaultChatTools(f6)
local f7=f6

return{
{
Name="list_ui_elements",
Description="Lists every UI element that has a Flag, with its kind and current value.",
Parameters={type="object"},
Handler=function()
return eK:ListUIElements()
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
Handler=function(f8)
local f9,ga=eK:SetUIElementValue(f8.flag,f8.value)
if not f9 then error(ga,0)end
return{success=true,flag=f8.flag,value=f8.value}
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
Handler=function(f8)
local f9=f7:SelectTab(f8.tab)
if not f9 then error("No tab named '"..tostring(f8.tab).."'",0)end
return"Switched to "..f9.Title
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
Handler=function(f8)
local f9=f7:SelectTab(f8.tab)
if not f9 then error("No tab named '"..tostring(f8.tab).."'",0)end
local ga=f9:SelectSubTabByName(f8.subtab)
if not ga then
error("No sub-tab named '"..tostring(f8.subtab).."' under "..f9.Title,0)
end
return"Switched to "..f9.Title.." > "..ga.Name
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
Handler=function(f8)
local f9,ga=f7:FindElement(f8.query)
if not f9 then
return{success=false,found=false,error="No matching UI element found for '"..tostring(f8.query).."'"}
end
f7:_JumpToSearchable(f9)
local gb=f7:DescribeElement(f9)or{name=tostring(f8.query)}
gb.success=true
gb.found=true
gb.query=tostring(f8.query)
if ga==math.huge then ga=999 end
if type(ga)=="number"then
gb.score=math.floor(ga*10+0.5)/10
end
return gb
end,
},
}
end

function fQ.SaveConfig(f6,f7)
ex.Save(f6,f7)
end
function fQ.LoadConfig(f6,f7)
ex.Load(f6,f7)
end


fQ._focusIdx=1
local f6




local function focusables()
local f7=fQ._active
if not f7 then return{}end
local f8={}
for f9,ga in ipairs(f7.Elements)do
if ga.Frame and ga.Frame.Visible and ga.Frame.Parent then
local gb,gc=pcall(function()return ga.Frame.AbsoluteSize.Y>4 end)
if gb and gc then table.insert(f8,ga)end
end
end
return f8
end
function fQ.FocusMove(f7,f8)
if not f7._visible then return end
if f7._palette and f7._palette.open then return end
local f9=focusables()
if#f9==0 then return end
f7._focusIdx=((f7._focusIdx-1+f8)%#f9)+1
local ga=f9[f7._focusIdx]
if not ga or not ga.Frame then return end
if not f6 then
f6=Instance.new"UIStroke"f6.Thickness=1.5
f6.Transparency=0.15
eK:_tag(f6,"Color","Accent")
end
pcall(function()
f6.Parent=ga.Frame
local gb=f7._active and f7._active.Page
if gb then
local gc=ga.Frame.AbsolutePosition.Y
local gd=gb.AbsolutePosition.Y
gb.CanvasPosition=Vector2.new(0,math.max(0,gb.CanvasPosition.Y+(gc-gd)-120))
end
end)
eK:_sfx"Hover"
end
function fQ.FocusActivate(f7)
if not f7._visible then return end
local f8=focusables()
local f9=f8[f7._focusIdx]
if not f9 then return end
f7:_flash(f9.Frame)
if f9._go then pcall(f9._go)end
end


fQ._clean=fQ._clean or{on=false,idle=6,last=os.clock(),faded=false,edge=nil}
function fQ.SetCleanScreen(f7,f8,f9)
f8=f8 and true or false
f7._clean.on=f8
if f9 then f7._clean.idle=math.clamp(tonumber(f9)or 6,2,60)end
f7._clean.last=os.clock()
if not f8 and f7._clean.faded then f7:_cleanRestore()end
if f8 then f7:_cleanTouch()end
end
function fQ._cleanTouch(f7)f7._clean.last=os.clock()end
function fQ._cleanFade(f7)
if f7._clean.faded or not f7._visible or f7._mini then return end
f7._clean.faded=true
eM(ff,eL.Med,{GroupTransparency=0.88})
dimTo(1,eL.Med)
if not f7._clean.edge then
local f8=Instance.new"TextButton"
f8.Name=ad.GetStealthName()
f8.Text=""f8.AnchorPoint=Vector2.new(0,0.5)f8.Position=UDim2.new(0,0,0.5,0)
f8.Size=UDim2.fromOffset(6,120)f8.BackgroundColor3=e9.Accent
f8.BackgroundTransparency=0.35 f8.BorderSizePixel=0 f8.ZIndex=200
eT(f8,99)f8.Parent=fb
eK:_tag(f8,"BackgroundColor3","Accent")
f8.MouseEnter:Connect(function()f7:_cleanRestore()end)
f8.InputBegan:Connect(function(f9)
if f9.UserInputType==Enum.UserInputType.Touch then f7:_cleanRestore()end
end)
f7._clean.edge=f8
else
f7._clean.edge.Visible=true
end
end
function fQ._cleanRestore(f7)
if not f7._clean.faded then f7._clean.last=os.clock()return end
f7._clean.faded=false
f7._clean.last=os.clock()
if not f7._visible or f7._mini then return end
eM(ff,eL.Med,{GroupTransparency=0})
dimTo(0.5,eL.Med)
if f7._clean.edge then f7._clean.edge.Visible=false end
eK:_sfx"Hover"
end
fQ:Track(e1.InputChanged:Connect(function(f7)
if f7.UserInputType~=Enum.UserInputType.MouseMovement
and f7.UserInputType~=Enum.UserInputType.Touch then return end
if fQ._clean.on and fQ._clean.faded then
local f8=f7.Position
local f9,ga=pcall(function()
local f9,ga=ff.AbsolutePosition,ff.AbsoluteSize
return f8.X>=f9.X-30 and f8.X<=f9.X+ga.X+30
and f8.Y>=f9.Y-30 and f8.Y<=f9.Y+ga.Y+30
end)
if f8.X<=24 then fQ:_cleanRestore()return end
if f9 and ga then fQ:_cleanRestore()return end
end
fQ:_cleanTouch()
end))
fQ:Track(e1.InputBegan:Connect(function(f7)
if f7.UserInputType==Enum.UserInputType.MouseButton1
or f7.UserInputType==Enum.UserInputType.Touch then
if fQ._clean.on and fQ._clean.faded then fQ:_cleanRestore()else fQ:_cleanTouch()end
end
end))
task.spawn(function()
while fb.Parent do
task.wait(0.5)
pcall(function()
if fQ._clean.on and not fQ._clean.faded and fQ._visible and not fQ._mini then
if os.clock()-fQ._clean.last>fQ._clean.idle then
fQ:_cleanFade()
end
end
end)
end
end)


function fQ.SetPerformance(f7,f8)
f8=f8 and true or false
eK._perfLow=f8
if f8 then eK:SetAcrylic(false)end
pcall(function()
for f9,ga in ipairs(ff:GetDescendants())do
if ga.Name=="_light"or ga.Name=="_toplight"then ga.Visible=not f8 end
if ga:IsA"UIShadow"then ga.Enabled=not f8 end
end
end)
if not f8 and f7._acrylicPref then eK:SetAcrylic(true,e4.Blur or 16)end
end


function fQ.ExportString(f7)
return ex.Export(f7)
end
function fQ.ImportString(f7,f8)
return ex.Import(f7,f8)
end
function fQ.AutoSave(f7,f8,f9,ga)
ex.AutoSave(f7,f8,f9,ga)
end

function fQ.SetBadge(f7,f8,f9)
if not f8 or not(f8.Btn or f8.Button)then return end
local ga=f8.Btn or f8.Button
local gb=ga:FindFirstChild"_badge"
if not f9 or f9==""or f9==0 then
if gb then pcall(function()gb:Destroy()end)end
return
end
if not gb then
gb=Instance.new"Frame"gb.Name="_badge"
gb.AnchorPoint=Vector2.new(1,0.5)gb.Position=UDim2.new(1,-8,0.5,0)
gb.Size=UDim2.new(0,20,0,16)gb.BackgroundColor3=Color3.fromRGB(248,113,113)
gb.BorderSizePixel=0 eT(gb,99)gb.Parent=ga gb.ZIndex=4
local gc=Instance.new"TextLabel"gc.Name="_l"gc.BackgroundTransparency=1
gc.Size=UDim2.fromScale(1,1)gc.Font=Enum.Font.GothamBold
gc.TextSize=10 gc.TextColor3=Color3.fromRGB(255,255,255)gc.Parent=gb
end
pcall(function()
local gc=gb:FindFirstChild"_l"
gc.Text=tostring(f9)
gb.Size=UDim2.new(0,math.clamp(10+string.len(tostring(f9))*7,20,64),0,16)
end)
end

function fQ.Debug(f7)
local f8={}
local function log(f9)table.insert(f8,tostring(f9))end
log("version="..tostring(eK.Version).." visible="..tostring(f7._visible))
local f9=(eK._gui and eK._gui.Parent)and 1 or 0
log("hubs="..tostring(f9))
local function box(ga,gb)
local gc,gd=pcall(function()
return gb.." class="..ga.ClassName
.." clip="..tostring(ga.ClipsDescendants)
.." pos="..tostring(ga.AbsolutePosition)
.." size="..tostring(ga.AbsoluteSize)
end)
log(gc and gd or(gb.." ERR"))
end
box(f7._main,"main")
box(f7._body,"body")
box(f7._pages,"pages")
for ga,gb in ipairs(f7._tabs)do
local gc=gb.Page
local gd,ge=pcall(function()
return"page["..gb.Title.."] vis="..tostring(gc.Visible)
.." clip="..tostring(gc.ClipsDescendants)
.." vp="..tostring(gc.AbsoluteSize)
.." canvas="..tostring(gc.AbsoluteCanvasSize)
.." canvPos="..tostring(gc.CanvasPosition)
.." scroll="..tostring(gc.ScrollingEnabled)
end)
log(gd and ge or("page["..tostring(gb.Title).."] ERR"))
pcall(function()
local gf,gg=gc.AbsolutePosition.Y,gc.AbsoluteSize.Y
local gh,gi=0,0
for gj,gk in ipairs(gb.Elements)do
if gk.Frame and gk.Frame.Visible then
gi=gi+1
local gl,gm=gk.Frame.AbsolutePosition.Y,gk.Frame.AbsoluteSize.Y
if gl+gm<gf or gl>gf+gg then gh=gh+1 end
end
end
log("  rows="..gi.." outsideViewport="..gh)
end)
end
log"done"
return table.concat(f8,"\n")
end

function fQ.Destroy(f7)
if f7._destroyed then return end
f7._destroyed=true
local f8=f7._onCloseCb
f7._onCloseCb=nil
if type(f8)=="function"then task.spawn(function()pcall(f8)end)end
for f9,ga in ipairs(f7._conns)do pcall(function()ga:Disconnect()end)end
f7._conns={}
for f9,ga in ipairs(aa._Windows)do
if ga==f7 then table.remove(aa._Windows,f9)break end
end
for f9,ga in pairs(eK.Sound._cache)do pcall(function()ga:Stop()ga:Destroy()end)end
eK.Sound._cache={}
eK:SetAcrylic(false)
if eK._gui==fb then eK._gui=nil end
pcall(function()fT:Destroy()end)
pcall(function()fb:Destroy()end)
pcall(function()fc:Destroy()end)
end

ad.registerUnload(function()
pcall(function()fQ:Destroy()end)
end)
af.paintFonts(fb)
aa._lastWindow=fQ
table.insert(aa._Windows,fQ)
return fQ
end end function a.ax():typeof(__modImpl())local aa=a.cache.ax if not aa then aa={c=__modImpl()}a.cache.ax=aa end return aa.c end end end





local aa=a.a()
local ab=a.b()a.c()a.e()


local ac=a.f()
local ad=a.g()
local ae=a.h()
local af=a.v()
local ex=a.w()
local ey=a.x()
local ez=a.z()
local eF=a.ax()

ab.claimUnload()

local eG=aa
eG.Build="r15"

eG.PreloadIcons=function(eH,eI)
return ac.PreloadIcons(eI)
end


eG.LoadIconSource=function(eH,eI)
return ac.LoadIconSource(eI)
end
eG.Themes=af.Themes
eG.Icons=ac.Icons
eG.IconAlias=ac.IconAlias

eG._tag=function(eH,eI,eJ,eK)
return af.tag(eI,eJ,eK)
end
eG.agrad=function(eH,eI,eJ)
return af.agrad(eI,eJ)
end
eG.oa=function(eH,eI)
return af.oa(eI)
end
eG.SetTheme=function(eH,eI)
return af.SetTheme(eI)
end
eG.SetAccent=function(eH,eI)
return af.SetAccent(eI)
end
eG.SetAcrylic=function(eH,eI,eJ)
return ex.SetAcrylic(eI,eJ)
end
eG.ToggleAcrylic=function(eH,eI)
return ex.ToggleAcrylic(eI)
end
eG._sfx=function(eH,eI)
return ad.sfx(eI)
end
eG.SetFontPack=function(eH,eI)
return ae.SetFontPack(eI)
end
eG.RefreshFonts=function(eH)
return ae.RefreshFonts()
end
eG._paintFonts=function(eH,eI)
return ae.paintFonts(eI)
end
eG.SetMotion=function(eH,eI)
aa.ReducedMotion=not(eI and true or false)
end
eG.SetSharp=function(eH,eI)
return af.SetSharp(eI)
end
eG.Debug=function(eH)
local eI=aa._lastWindow
if eI and eI.Debug then
local eJ,eK=pcall(function()return eI:Debug()end)
if eJ and eK then print(eK)return eK end
end
return nil
end
eG.CloudService=function(eH,eI)
return ey.create(eI)
end
eG.CreateAIAssistant=function(eH,eI)
return ez.create(eI)
end

eG.CreateWindow=eF




return eG
