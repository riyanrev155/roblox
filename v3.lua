-- =========================================
-- Rev666 GUI Minimalis Profesional (Final Fixed Version)
-- =========================================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Hapus GUI lama kalau ada
local old = playerGui:FindFirstChild("Rev666UI")
if old then old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Rev666UI"
ScreenGui.Parent = playerGui
ScreenGui.ResetOnSpawn = false

-- ===============================
-- Draggable Function (optimized)
-- ===============================
local function MakeDraggable(frame, parent)
    parent = parent or frame
    local dragging, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = parent.Position
            input.Changed:Once(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement 
        or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            parent.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ===============================
-- Config
-- ===============================
local CorrectPassword = "riyan666"
local ExpiredDate = os.time({year=2025, month=9, day=17})

-- ===============================
-- Error Popup
-- ===============================
local function ShowError(parent, msg)
    local Err = Instance.new("TextLabel")
    Err.Size = UDim2.new(1,0,0,25)
    Err.Position = UDim2.new(0,0,1,-25)
    Err.BackgroundColor3 = Color3.fromRGB(200,50,50)
    Err.Text = msg
    Err.TextColor3 = Color3.new(1,1,1)
    Err.TextSize = 14
    Err.Font = Enum.Font.SourceSansBold
    Err.Parent = parent
    task.delay(2, function() Err:Destroy() end)
end

-- ===============================
-- Welcome Popup
-- ===============================
local function ShowWelcome(msg)
    local Popup = Instance.new("TextLabel")
    Popup.Size = UDim2.new(0,220,0,40)
    Popup.Position = UDim2.new(0.5,-110,0.5,-120)
    Popup.BackgroundColor3 = Color3.fromRGB(50,150,50)
    Popup.Text = msg
    Popup.TextColor3 = Color3.new(1,1,1)
    Popup.TextSize = 16
    Popup.Font = Enum.Font.SourceSansBold
    Popup.BackgroundTransparency = 1
    Popup.TextTransparency = 1
    Popup.Parent = ScreenGui
    MakeDraggable(Popup)

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9118820907"
    sound.Volume = 1
    sound.Parent = ScreenGui
    sound:Play()

    for i=0,1,0.05 do
        Popup.TextTransparency = 1-i
        task.wait(0.02)
    end
    task.wait(2)
    for i=0,1,0.05 do
        Popup.TextTransparency = i
        task.wait(0.02)
    end
    Popup:Destroy()
    sound:Destroy()
end

-- ===============================
-- Login Frame
-- ===============================
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0,300,0,160)
LoginFrame.Position = UDim2.new(0.5,0,0.5,0)
LoginFrame.AnchorPoint = Vector2.new(0.5,0.5)
LoginFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
LoginFrame.BorderSizePixel = 0
LoginFrame.Active = true
LoginFrame.Parent = ScreenGui
MakeDraggable(LoginFrame,LoginFrame)

local cornerLogin = Instance.new("UICorner")
cornerLogin.CornerRadius = UDim.new(0,12)
cornerLogin.Parent = LoginFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,35)
Title.BackgroundColor3 = Color3.fromRGB(25,25,25)
Title.Text = "Rev666 Login"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = LoginFrame

local PasswordBox = Instance.new("TextBox")
PasswordBox.Size = UDim2.new(1,-40,0,40)
PasswordBox.Position = UDim2.new(0,20,0,50)
PasswordBox.PlaceholderText = "Masukkan Password..."
PasswordBox.TextSize = 16
PasswordBox.TextColor3 = Color3.new(1,1,1)
PasswordBox.BackgroundColor3 = Color3.fromRGB(55,55,55)
PasswordBox.Parent = LoginFrame

local LoginBtn = Instance.new("TextButton")
LoginBtn.Size = UDim2.new(0.5,-25,0,35)
LoginBtn.Position = UDim2.new(0,20,0,100)
LoginBtn.BackgroundColor3 = Color3.fromRGB(50,150,255)
LoginBtn.Text = "Login"
LoginBtn.TextColor3 = Color3.new(1,1,1)
LoginBtn.Font = Enum.Font.SourceSansBold
LoginBtn.TextSize = 16
LoginBtn.Parent = LoginFrame

local ExitBtn = Instance.new("TextButton")
ExitBtn.Size = UDim2.new(0.5,-25,0,35)
ExitBtn.Position = UDim2.new(0.5,5,0,100)
ExitBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
ExitBtn.Text = "Exit"
ExitBtn.TextColor3 = Color3.new(1,1,1)
ExitBtn.Font = Enum.Font.SourceSansBold
ExitBtn.TextSize = 16
ExitBtn.Parent = LoginFrame

ExitBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ===============================
-- Main UI
-- ===============================
local function LoadMainUI()
    local Humanoid
    local function UpdateHumanoid(char)
        Humanoid = char:WaitForChild("Humanoid",5)
    end
    if player.Character then UpdateHumanoid(player.Character) end
    player.CharacterAdded:Connect(UpdateHumanoid)

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0,550,0,320)
    MainFrame.Position = UDim2.new(0.5,0,0.5,0)
    MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Parent = ScreenGui
    MakeDraggable(MainFrame,MainFrame)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,12)
    corner.Parent = MainFrame

    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1,0,0,35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
    TitleBar.Parent = MainFrame
    MakeDraggable(TitleBar,MainFrame)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1,-70,1,0)
    TitleLabel.Position = UDim2.new(0,10,0,0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Rev666"
    TitleLabel.TextColor3 = Color3.new(1,1,1)
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar

    -- Close + Minimize
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0,35,0,25)
    MinimizeButton.Position = UDim2.new(1,-70,0.5,-12)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255,200,50)
    MinimizeButton.Text = "-"
    MinimizeButton.TextSize = 20
    MinimizeButton.Font = Enum.Font.SourceSansBold
    MinimizeButton.TextColor3 = Color3.new(0,0,0)
    MinimizeButton.Parent = TitleBar

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0,35,0,25)
    CloseButton.Position = UDim2.new(1,-35,0.5,-12)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200,50,50)
    CloseButton.Text = "X"
    CloseButton.TextSize = 20
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextColor3 = Color3.new(1,1,1)
    CloseButton.Parent = TitleBar

    -- Content Frame
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1,-20,1,-85)
    ContentFrame.Position = UDim2.new(0,10,0,80)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
    ContentFrame.Parent = MainFrame

    local UIPageLayout = Instance.new("UIPageLayout")
    UIPageLayout.Parent = ContentFrame
    UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.Animated = true

    local TabsFrame = Instance.new("Frame")
    TabsFrame.Size = UDim2.new(1,0,0,40)
    TabsFrame.Position = UDim2.new(0,0,0,35)
    TabsFrame.BackgroundTransparency = 1
    TabsFrame.Parent = MainFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.Padding = UDim.new(0,10)
    UIListLayout.Parent = TabsFrame

    local Tabs, Pages = {}, {}

    -- PLAYER TAB
    local PlayerPage = Instance.new("Frame")
    PlayerPage.Size = UDim2.new(1,0,1,0)
    PlayerPage.BackgroundTransparency = 1
    PlayerPage.Name = "PLAYER"
    PlayerPage.Parent = ContentFrame
    Pages["PLAYER"] = PlayerPage

    local WSLabel = Instance.new("TextLabel")
    WSLabel.Size = UDim2.new(1,0,0,30)
    WSLabel.Text = "WalkSpeed:"
    WSLabel.TextColor3 = Color3.new(1,1,1)
    WSLabel.TextSize = 16
    WSLabel.Font = Enum.Font.SourceSansBold
    WSLabel.Parent = PlayerPage

    local WSTextBox = Instance.new("TextBox")
    WSTextBox.Size = UDim2.new(0,100,0,30)
    WSTextBox.Position = UDim2.new(0,0,0,40)
    WSTextBox.Text = tostring(Humanoid and Humanoid.WalkSpeed or 16)
    WSTextBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
    WSTextBox.TextColor3 = Color3.new(1,1,1)
    WSTextBox.Parent = PlayerPage

    WSTextBox.FocusLost:Connect(function()
        local val = tonumber(WSTextBox.Text)
        if val and Humanoid then
            val = math.clamp(val,1,500)
            Humanoid.WalkSpeed = val
            WSTextBox.Text = tostring(val)
        end
    end)

    -- TELEPORT PLAYER TAB
    local TPPage = Instance.new("Frame")
    TPPage.Size = UDim2.new(1,0,1,0)
    TPPage.BackgroundTransparency = 1
    TPPage.Name = "TELEPORT PLAYER"
    TPPage.Parent = ContentFrame
    Pages["TELEPORT PLAYER"] = TPPage

    local RefreshBtn = Instance.new("TextButton")
    RefreshBtn.Size = UDim2.new(0,100,0,30)
    RefreshBtn.BackgroundColor3 = Color3.fromRGB(50,150,255)
    RefreshBtn.Text = "Refresh"
    RefreshBtn.TextColor3 = Color3.new(1,1,1)
    RefreshBtn.Font = Enum.Font.SourceSansBold
    RefreshBtn.Parent = TPPage

    local PlayerList = Instance.new("ScrollingFrame")
    PlayerList.Size = UDim2.new(1,-20,1,-50)
    PlayerList.Position = UDim2.new(0,10,0,40)
    PlayerList.BackgroundTransparency = 1
    PlayerList.ScrollBarThickness = 6
    PlayerList.CanvasSize = UDim2.new(0,0,0,0)
    PlayerList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    PlayerList.Parent = TPPage

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Parent = PlayerList
    ListLayout.Padding = UDim.new(0,5)
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local function RefreshList()
        for _,child in ipairs(PlayerList:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end
        local plist = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (plr.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
                table.insert(plist, {plr, dist})
            end
        end
        table.sort(plist, function(a,b) return a[2] < b[2] end)
        for _,data in ipairs(plist) do
            local plr, dist = data[1], data[2]
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1,0,0,30)
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            btn.Text = plr.Name.." ["..math.floor(dist).." studs]"
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 16
            btn.Parent = PlayerList
            btn.MouseButton1Click:Connect(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") 
                and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame =
                        plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,6,0)
                end
            end)
        end
    end
    RefreshBtn.MouseButton1Click:Connect(RefreshList)
    RefreshList()

    -- TAB SYSTEM
    local TabNames = {"PLAYER","TELEPORT PLAYER"}
    local ActiveTab
    local function SetActiveTab(name)
        if ActiveTab then
            Tabs[ActiveTab].BackgroundColor3 = Color3.fromRGB(55,55,55)
        end
        ActiveTab = name
        Tabs[name].BackgroundColor3 = Color3.fromRGB(50,150,255)
        UIPageLayout:JumpTo(Pages[name])
    end
    for _,name in ipairs(TabNames) do
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0.23,0,1,0)
        Button.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Button.Text = name
        Button.TextColor3 = Color3.new(1,1,1)
        Button.Font = Enum.Font.SourceSansBold
        Button.TextSize = 16
        Button.Parent = TabsFrame
        Tabs[name] = Button
        Button.MouseButton1Click:Connect(function()
            SetActiveTab(name)
        end)
    end
    SetActiveTab("PLAYER")

    -- Floating Bubble
    local FloatingBubble = Instance.new("TextButton")
    FloatingBubble.Size = UDim2.new(0,100,0,35)
    FloatingBubble.Position = UDim2.new(0.5,-50,0,80)
    FloatingBubble.BackgroundColor3 = Color3.fromRGB(50,150,255)
    FloatingBubble.Text = "Rev666"
    FloatingBubble.TextColor3 = Color3.new(1,1,1)
    FloatingBubble.Visible = false
    FloatingBubble.Parent = ScreenGui
    MakeDraggable(FloatingBubble,FloatingBubble)

    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        FloatingBubble.Visible = true
    end)
    FloatingBubble.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        FloatingBubble.Visible = false
    end)
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

-- ===============================
-- Login Button
-- ===============================
LoginBtn.MouseButton1Click:Connect(function()
    if os.time() > ExpiredDate then
        ShowError(LoginFrame,"❌ Script expired!")
        task.delay(2,function() ScreenGui:Destroy() end)
        return
    end
    if PasswordBox.Text == CorrectPassword then
        LoginFrame.Visible = false
        ShowWelcome("Welcome to the hell")
        task.wait(0.5)
        LoadMainUI()
    else
        ShowError(LoginFrame,"❌ Password salah!")
        PasswordBox.Text = "" -- reset input
    end
end)