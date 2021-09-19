-- Gui to Lua
-- Version: 3.2

-- Instances:

local library = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local players = game:GetService("Players")
local player = players.LocalPlayer
local coreGui = game:GetService("CoreGui")
local ms = player:GetMouse()

local Utility = {}

function Utility:TweenObject(obj, properties, duration, ...)
    tween:Create(obj, tweeninfo(duration, ...), properties):Play()
end


function library:DraggingEnabled(frame, parent)
    parent = parent or frame

    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function library:NewWindow(title)
    title = title or "Window"
    local windows = {}

    --Sample
    local Sample = Instance.new("ImageLabel")

    Sample.Name = "Sample"
    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sample.BackgroundTransparency = 1.000
    Sample.Position = UDim2.new(0.0128205121, 0, 0.327840537, 0)
    Sample.Size = UDim2.new(0, 50, 0, 50)
    Sample.Image = "rbxassetid://4560909609"
    Sample.ImageTransparency = 0.600

    local CFAHubV3 = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local MainHeader = Instance.new("Frame")
    local HubTitle = Instance.new("TextLabel")
    local CloseButton = Instance.new("ImageButton")
    local MinButton = Instance.new("ImageButton")

    library:DraggingEnabled(MainHeader, MainFrame)

    CFAHubV3.Name = "CFAHubV3"
    CFAHubV3.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    CFAHubV3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = CFAHubV3
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.Position = UDim2.new(0.0450261757, 0, 0.0796963945, 0)
    MainFrame.Size = UDim2.new(0, 681, 0, 396)
    MainFrame.ClipsDescendants = true

    MainHeader.Name = "MainHeader"
    MainHeader.Parent = MainFrame
    MainHeader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainHeader.BorderSizePixel = 0
    MainHeader.Size = UDim2.new(0, 681, 0, 23)
    MainHeader.ZIndex = 4
    
    HubTitle.Name = "HubTitle"
    HubTitle.Parent = MainHeader
    HubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HubTitle.BackgroundTransparency = 1.000
    HubTitle.Position = UDim2.new(0.0117474301, 0, 0, 0)
    HubTitle.Size = UDim2.new(0, 606, 0, 23)
    HubTitle.Font = Enum.Font.SourceSansSemibold
    HubTitle.LineHeight = 1.130
    HubTitle.Text = title
    HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    HubTitle.TextScaled = true
    HubTitle.TextSize = 14.000
    HubTitle.TextWrapped = true
    HubTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainHeader
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundTransparency = 1.000
    CloseButton.Position = UDim2.new(0.953010261, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 23, 0, 23)
    CloseButton.Image = "rbxassetid://7409394566"
    CloseButton.MouseButton1Click:Connect(function()
        CFAHubV3:Destroy()
    end)

    local minimized = false
    
    MinButton.Name = "MinButton"
    MinButton.Parent = MainHeader
    MinButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinButton.BackgroundTransparency = 1.000
    MinButton.Position = UDim2.new(0.910425842, 0, 0, 0)
    MinButton.Size = UDim2.new(0, 23, 0, 23)
    MinButton.Image = "http://www.roblox.com/asset/?id=6035067836"
    MinButton.MouseButton1Click:Connect(function()
        if minimized == false then
            MainFrame:TweenSize(UDim2.new(0, 681, 0, 20),Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
        else
            MainFrame:TweenSize(UDim2.new(0, 681, 0, 396), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
        end
        minimized = not minimized
    end)

    local MainSide = Instance.new("Frame")
    local TabScroll = Instance.new("ScrollingFrame")
    local TabListLayout = Instance.new("UIListLayout")

    MainSide.Name = "MainSide"
    MainSide.Parent = MainFrame
    MainSide.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainSide.BorderSizePixel = 0
    MainSide.Position = UDim2.new(0, 0, 0.0580808073, 0)
    MainSide.Size = UDim2.new(0, 167, 0, 373)
    
    TabScroll.Name = "TabScroll"
    TabScroll.Parent = MainSide
    TabScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TabScroll.BorderSizePixel = 0
    TabScroll.Position = UDim2.new(0, 0, 0.0107238609, 0)
    TabScroll.Size = UDim2.new(0, 166, 0, 364)
    TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabScroll.ScrollBarThickness = 0
    
    TabListLayout.Name = "UIListLayout"
    TabListLayout.Parent = TabScroll
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 4)

    TabScroll.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)

    local MainPageContainer = Instance.new("Folder")
    MainPageContainer.Name = "MainPageContainer"
    MainPageContainer.Parent = MainFrame

    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Parent = MainPageContainer
    MainPage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainPage.BorderSizePixel = 0
    MainPage.ClipsDescendants = true
    MainPage.Position = UDim2.new(0.245227605, 0, 0.0580808073, 0)
    MainPage.Size = UDim2.new(0, 514, 0, 373)

    local Pages = Instance.new("Folder")
    Pages.Name = "Pages"
    Pages.Parent = MainPage

    function windows:Notification(headTitle, NotifyText, ButtonTitle)
        headTitle = headTitle or "Notification"
        NotifyText = NotifyText or "Info Text"
        ButtonTitle = ButtonTitle or "Okay"

        local NotifyBackground = Instance.new("Frame")
        local NotifyFrame = Instance.new("Frame")
        local NotifyFrameCorner = Instance.new("UICorner")
        local NotifyHeader = Instance.new("TextLabel")
        local NotifyInfo = Instance.new("TextLabel")
        local NotifyBtn = Instance.new("TextButton")
        local NotifyBtnCorner = Instance.new("UICorner")

        NotifyBackground.Name = "NotifyBackground"
        NotifyBackground.Parent = MainFrame
        NotifyBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        NotifyBackground.BackgroundTransparency = 0.500
        NotifyBackground.Size = UDim2.new(0, 681, 0, 396)
        
        NotifyFrame.Name = "NotifyFrame"
        NotifyFrame.Parent = NotifyBackground
        NotifyFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        NotifyFrame.Position = UDim2.new(0.255506605, 0, 0.285353541, 0)
        NotifyFrame.Size = UDim2.new(0,0,0,0)
        NotifyFrame.ClipsDescendants = true
        
        NotifyFrameCorner.Name = "NotifyFrameCorner"
        NotifyFrameCorner.Parent = NotifyFrame

        NotifyFrame:TweenSize(UDim2.new(0, 330, 0, 169), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
		
		game.TweenService:Create(
			NotifyFrame,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()
        
        NotifyHeader.Name = "NotifyHeader"
        NotifyHeader.Parent = NotifyFrame
        NotifyHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotifyHeader.BackgroundTransparency = 1.000
        NotifyHeader.Position = UDim2.new(0, 0, 0.0625, 0)
        NotifyHeader.Size = UDim2.new(0, 330, 0, 36)
        NotifyHeader.Font = Enum.Font.SourceSansBold
        NotifyHeader.LineHeight = 1.120
        NotifyHeader.Text = headTitle
        NotifyHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotifyHeader.TextScaled = true
        NotifyHeader.TextSize = 14.000
        NotifyHeader.TextWrapped = true
        
        NotifyInfo.Name = "NotifyInfo"
        NotifyInfo.Parent = NotifyFrame
        NotifyInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotifyInfo.BackgroundTransparency = 1.000
        NotifyInfo.Position = UDim2.new(0, 0, 0.275517762, 0)
        NotifyInfo.Size = UDim2.new(0, 330, 0, 72)
        NotifyInfo.Font = Enum.Font.SourceSansSemibold
        NotifyInfo.LineHeight = 1.120
        NotifyInfo.Text = NotifyText
        NotifyInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotifyInfo.TextSize = 25.000
        NotifyInfo.TextWrapped = true
        
        NotifyBtn.Name = "NotifyBtn"
        NotifyBtn.Parent = NotifyFrame
        NotifyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        NotifyBtn.Position = UDim2.new(0.0469697006, 0, 0.764538825, 0)
        NotifyBtn.Size = UDim2.new(0, 300, 0, 34)
        NotifyBtn.Font = Enum.Font.SourceSansSemibold
        NotifyBtn.LineHeight = 1.120
        NotifyBtn.Text = ButtonTitle
        NotifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotifyBtn.TextScaled = true
        NotifyBtn.TextSize = 14.000
        NotifyBtn.TextWrapped = true
        NotifyBtn.MouseButton1Click:Connect(function()
            game.TweenService:Create(
                NotifyBackground,
                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                {Visible = false}
            ):Play()
            NotifyFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
			game.TweenService:Create(
				NotifyFrame,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			wait(.2)
			NotifyBackground:Destroy()
        end)
        
        NotifyBtnCorner.Name = "NotifyBtnCorner"
        NotifyBtnCorner.Parent = NotifyBtn

    end

    local first = true

    function windows:NewTab(title, url)
        title = title or "Tab"
        url = url or "http://www.roblox.com/asset/?id=6031075938"
        local TabElements = {}

        local tabBtn = Instance.new("TextButton")
        local TabBtnCorner = Instance.new("UICorner")
        local TabBtnIcon = Instance.new("ImageLabel")
        local TabBtnTitle = Instance.new("TextLabel")

        tabBtn.Name = "tabBtn"
        tabBtn.Parent = TabScroll
        tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        tabBtn.BackgroundTransparency = 1.000
        tabBtn.Size = UDim2.new(0, 146, 0, 35)
        tabBtn.AutoButtonColor = false
        tabBtn.Font = Enum.Font.SourceSansSemibold
        tabBtn.LineHeight = 1.130
        tabBtn.Text = ""
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.TextScaled = true
        tabBtn.TextSize = 14.000
        tabBtn.TextWrapped = true
        
        TabBtnCorner.Name = "TabBtnCorner"
        TabBtnCorner.Parent = tabBtn
        
        TabBtnIcon.Name = "TabBtnIcon"
        TabBtnIcon.Parent = tabBtn
        TabBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabBtnIcon.BackgroundTransparency = 1.000
        TabBtnIcon.Position = UDim2.new(0.0273972601, 0, 0.128571436, 0)
        TabBtnIcon.Size = UDim2.new(0, 25, 0, 25)
        TabBtnIcon.Image = url
        
        TabBtnTitle.Name = "TabBtnTitle"
        TabBtnTitle.Parent = tabBtn
        TabBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabBtnTitle.BackgroundTransparency = 1.000
        TabBtnTitle.Position = UDim2.new(0.239726022, 0, 0.0285714287, 0)
        TabBtnTitle.Size = UDim2.new(0, 107, 0, 32)
        TabBtnTitle.Font = Enum.Font.SourceSansSemibold
        TabBtnTitle.LineHeight = 1.070
        TabBtnTitle.Text = title
        TabBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtnTitle.TextScaled = true
        TabBtnTitle.TextSize = 14.000
        TabBtnTitle.TextWrapped = true
        TabBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

        TabScroll.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)

        -- Section
        local PageHeader = Instance.new("Frame")
        local SectionText = Instance.new("TextLabel")
        local GlowPage = Instance.new("Frame")
        
        local PageContainer = Instance.new("Frame")
        
        PageContainer.Name = "PageContainer"
        PageContainer.Parent = Pages
        PageContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageContainer.BackgroundTransparency = 1.000
        PageContainer.Size = UDim2.new(1, 0, 1, 0)

        if first then
            first = false
            PageContainer.Visible = true
            tabBtn.BackgroundTransparency = 0
        else
            PageContainer.Visible = false
            tabBtn.BackgroundTransparency = 1
        end

        tabBtn.MouseButton1Click:Connect(function()
            TabScroll.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)
            for i, v in next, Pages:GetChildren() do
                v.Visible = false
            end
            PageContainer.Visible = true
            for i, v in next, TabScroll:GetChildren() do
                if v:IsA("TextButton") then
                    Utility:TweenObject(v, {BackgroundTransparency = 1}, 0.2)
                end
            end
            Utility:TweenObject(tabBtn, {BackgroundTransparency = 0}, 0.2)
        end)
        
        PageHeader.Name = "PageHeader"
        PageHeader.Parent = PageContainer
        PageHeader.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        PageHeader.BorderSizePixel = 0
        PageHeader.Size = UDim2.new(0, 514, 0, 36)
        
        SectionText.Name = "SectionText"
        SectionText.Parent = PageHeader
        SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SectionText.BackgroundTransparency = 1.000
        SectionText.Position = UDim2.new(0.0175097268, 0, 0, 0)
        SectionText.Size = UDim2.new(0, 496, 0, 36)
        SectionText.Font = Enum.Font.SourceSansSemibold
        SectionText.LineHeight = 1.130
        SectionText.Text = title
        SectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionText.TextScaled = true
        SectionText.TextSize = 14.000
        SectionText.TextWrapped = true
        SectionText.TextXAlignment = Enum.TextXAlignment.Left
        
        GlowPage.Name = "GlowPage"
        GlowPage.Parent = PageHeader
        GlowPage.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
        GlowPage.BackgroundTransparency = 0.300
        GlowPage.BorderSizePixel = 0
        GlowPage.Position = UDim2.new(0, 0, 1, 0)
        GlowPage.Size = UDim2.new(1, 0, 0, 3)

        local ElementsContainer = Instance.new("Folder")

        ElementsContainer.Name = "ElementsContainer"
        ElementsContainer.Parent = PageContainer
        
        -- Page Inners
        local PageInners = Instance.new("ScrollingFrame")
        local PageInnersListLayout = Instance.new("UIListLayout")

        PageInners.Name = "PageInners"
        PageInners.Parent = PageContainer
        PageInners.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageInners.BackgroundTransparency = 1.000
        PageInners.BorderSizePixel = 0
        PageInners.Position = UDim2.new(0, 3, 0, 42)
        PageInners.Size = UDim2.new(0, 508, 0, 325)
        PageInners.CanvasSize = UDim2.new(0, 0, 0, 0)
        PageInners.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
        PageInners.ScrollBarThickness = 6
        
        PageInnersListLayout.Name = "UIListLayout"
        PageInnersListLayout.Parent = PageInners
        PageInnersListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageInnersListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageInnersListLayout.Padding = UDim.new(0, 4)

        function TabElements:CreateDropdown(dropTitle, dropInfo, list, callback)
            dropTitle = dropTitle or "Dropdown"
            dropInfo = dropInfo or "Info"
            list = list or {}
            callback = callback or function() end
            local DropFunctions = {}

            local Dropdown = Instance.new("Frame")
            local DropListLayout = Instance.new("UIListLayout")
            local DropButton = Instance.new("TextButton")
            local DropCorner = Instance.new("UICorner")
            local DropIcon = Instance.new("ImageLabel")
            local DropTittle = Instance.new("TextLabel")
            local DropdownIcon = Instance.new("ImageLabel")
            local DropInfoBtn = Instance.new("ImageButton")
            local optionList = Instance.new("Frame")
            local OptionScroll = Instance.new("ScrollingFrame")
            local OptionListLayout = Instance.new("UIListLayout")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = PageInners
            Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dropdown.BackgroundTransparency = 1.000
            Dropdown.ClipsDescendants = true
            Dropdown.Size = UDim2.new(1, 0, 0, 35)
            
            DropListLayout.Name = "DropListLayout"
            DropListLayout.Parent = Dropdown
            DropListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            DropListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            DropListLayout.Padding = UDim.new(0, 0)
            
            DropButton.Name = "DropButton"
            DropButton.Parent = Dropdown
            DropButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            DropButton.ClipsDescendants = true
            DropButton.Size = UDim2.new(0, 475, 0, 35)
            DropButton.AutoButtonColor = false
            DropButton.Font = Enum.Font.SourceSans
            DropButton.Text = ""
            DropButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropButton.TextScaled = true
            DropButton.TextSize = 14.000
            DropButton.TextWrapped = true
            
            DropCorner.Name = "DropCorner"
            DropCorner.Parent = DropButton
            
            DropIcon.Name = "DropIcon"
            DropIcon.Parent = DropButton
            DropIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropIcon.BackgroundTransparency = 1.000
            DropIcon.Position = UDim2.new(0.0124784186, 0, 0.157666653, 0)
            DropIcon.Size = UDim2.new(0, 21, 0, 21)
            DropIcon.Image = "rbxassetid://3926305904"
            DropIcon.ImageRectOffset = Vector2.new(284, 684)
            DropIcon.ImageRectSize = Vector2.new(36, 36)
            
            DropTittle.Name = "DropTitle"
            DropTittle.Parent = DropButton
            DropTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropTittle.BackgroundTransparency = 1.000
            DropTittle.Position = UDim2.new(0.0752659366, 0, 0.0303030312, 0)
            DropTittle.Size = UDim2.new(0, 145, 0, 30)
            DropTittle.Font = Enum.Font.SourceSansSemibold
            DropTittle.LineHeight = 1.120
            DropTittle.Text = dropTitle
            DropTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropTittle.TextScaled = true
            DropTittle.TextSize = 14.000
            DropTittle.TextWrapped = true
            DropTittle.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownIcon.Name = "DropdownIcon"
            DropdownIcon.Parent = DropButton
            DropdownIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownIcon.BackgroundTransparency = 1.000
            DropdownIcon.Position = UDim2.new(0.869842112, 0, 0.0285712108, 0)
            DropdownIcon.Size = UDim2.new(0, 33, 0, 34)
            DropdownIcon.Image = "rbxassetid://6034818372"
            
            DropInfoBtn.Name = "DropInfoBtn"
            DropInfoBtn.Parent = DropButton
            DropInfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropInfoBtn.BackgroundTransparency = 1.000
            DropInfoBtn.Position = UDim2.new(0.940999985, 0, 0.143000007, 0)
            DropInfoBtn.Size = UDim2.new(0, 24, 0, 24)
            DropInfoBtn.Image = "rbxassetid://3926305904"
            DropInfoBtn.ImageRectOffset = Vector2.new(764, 764)
            DropInfoBtn.ImageRectSize = Vector2.new(36, 36)
            
            optionList.Name = "optionList"
            optionList.Parent = Dropdown
            optionList.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
            optionList.BorderColor3 = Color3.fromRGB(20, 20, 20)
            optionList.BorderSizePixel = 2
            optionList.Selectable = true
            optionList.Size = UDim2.new(0, 465, 0, 112)
            
            OptionScroll.Name = "OptionScroll"
            OptionScroll.Parent = optionList
            OptionScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            OptionScroll.BackgroundTransparency = 1.000
            OptionScroll.BorderSizePixel = 0
            OptionScroll.Position = UDim2.new(-0.000687925261, 0, 0.0383065045, 0)
            OptionScroll.Size = UDim2.new(0, 465, 0, 102)
            OptionScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            OptionScroll.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
            OptionScroll.ScrollBarThickness = 4
            
            OptionListLayout.Name = "UIListLayout"
            OptionListLayout.Parent = OptionScroll
            OptionListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            OptionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            OptionListLayout.Padding = UDim.new(0, 4)

            OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)

            local ElementsInfo = Instance.new("Frame")
            local infoText = Instance.new("TextLabel")
            local infoClose = Instance.new("ImageButton")
        
            ElementsInfo.Name = "ElementsInfo"
            ElementsInfo.Parent = ElementsContainer
            ElementsInfo.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ElementsInfo.BackgroundTransparency = 0.010
            ElementsInfo.BorderSizePixel = 0
            ElementsInfo.Position = UDim2.new(0, 0, 1, 0)
            ElementsInfo.Size = UDim2.new(0, 514, 0, 40)
            
            infoText.Name = "infoText"
            infoText.Parent = ElementsInfo
            infoText.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            infoText.BackgroundTransparency = 1.000
            infoText.Position = UDim2.new(0.00972762611, 0, 0.17962952, 0)
            infoText.Size = UDim2.new(0, 504, 0, 25)
            infoText.Font = Enum.Font.SourceSansSemibold
            infoText.LineHeight = 1.120
            infoText.Text = dropInfo
            infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
            infoText.TextScaled = true
            infoText.TextSize = 14.000
            infoText.TextWrapped = true
            infoText.TextXAlignment = Enum.TextXAlignment.Left
            
            infoClose.Name = "infoClose"
            infoClose.Parent = infoText
            infoClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            infoClose.BackgroundTransparency = 1.000
            infoClose.Position = UDim2.new(0.946428537, 0, 0.0399999991, 0)
            infoClose.Size = UDim2.new(0, 24, 0, 24)
            infoClose.Image = "rbxassetid://7409394566"

            local isDropping = false
            local isTween = false

            DropButton.MouseButton1Click:Connect(function()
                if isDropping then
                    isDropping = false

                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 35), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                    wait(0.01)

                    PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)
                    OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)
                    local c = Sample:Clone()
                    c.Parent = DropButton
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if DropButton.AbsoluteSize.X >= DropButton.AbsoluteSize.Y then
                        size = (DropButton.AbsoluteSize.X * 1.5)
                    else
                        size = (DropButton.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy() 
                    
                else
                    isDropping = true
                    
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, (DropListLayout.AbsoluteContentSize.Y + 2)), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                    wait(0.01)

                    PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)
                    OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)
                    local c = Sample:Clone()
                    c.Parent = DropButton
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if DropButton.AbsoluteSize.X >= DropButton.AbsoluteSize.Y then
                        size = (DropButton.AbsoluteSize.X * 1.5)
                    else
                        size = (DropButton.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy() 
                    
                end
            end)

            DropInfoBtn.MouseButton1Click:Connect(function()
                if isTween then
                    isTween = false
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                else
                    isTween = true
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 0.890080452, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                end
            end)

            infoClose.MouseButton1Click:Connect(function()
                isTween = false
                ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
            end)

            for i, v in next, list do
                local OptionSelect = Instance.new("TextButton")
                local OptionCorner = Instance.new("UICorner")
                local TextLabel = Instance.new("TextLabel")
                local ImageLabel = Instance.new("ImageLabel")

                OptionSelect.Name = "OptionSelect"
                OptionSelect.Parent = OptionScroll
                OptionSelect.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                OptionSelect.ClipsDescendants = true
                OptionSelect.Position = UDim2.new(0.016160097, 0, 0.0676277876, 0)
                OptionSelect.Size = UDim2.new(0, 454, 0, 35)
                OptionSelect.AutoButtonColor = false
                OptionSelect.Font = Enum.Font.SourceSansSemibold
                OptionSelect.LineHeight = 1.140
                OptionSelect.Text = ""
                OptionSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
                OptionSelect.TextSize = 28.000
                OptionSelect.TextWrapped = true
                OptionSelect.TextXAlignment = Enum.TextXAlignment.Left
                
                OptionCorner.Name = "OptionCorner"
                OptionCorner.Parent = OptionSelect
                
                TextLabel.Parent = OptionSelect
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Position = UDim2.new(0.0837004408, 0, 0, 0)
                TextLabel.Size = UDim2.new(0, 414, 0, 35)
                TextLabel.Font = Enum.Font.SourceSansBold
                TextLabel.LineHeight = 1.190
                TextLabel.Text = v
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextScaled = true
                TextLabel.TextSize = 14.000
                TextLabel.TextWrapped = true
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                ImageLabel.Parent = OptionSelect
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.Position = UDim2.new(0, 4, 0.0857142881, 0)
                ImageLabel.Size = UDim2.new(0, 28, 0, 28)
                ImageLabel.Image = "rbxassetid://3926307971"
                ImageLabel.ImageRectOffset = Vector2.new(204, 284)
                ImageLabel.ImageRectSize = Vector2.new(36, 36)

                OptionSelect.MouseButton1Click:Connect(function()
                    isDropping = false
                    callback(v)
                    DropTittle.Text = v

                    PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)
                    OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)

                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 35), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                    wait(0.01)
                    local c = Sample:Clone()
                    c.Parent = OptionSelect
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if OptionSelect.AbsoluteSize.X >= OptionSelect.AbsoluteSize.Y then
                        size = (OptionSelect.AbsoluteSize.X * 1.5)
                    else
                        size = (OptionSelect.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy() 
                    
                end)

                OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)
            end

            function DropFunctions:Refresh(newList)
                newList = newList or {}
                for i,v in next, OptionScroll:GetChildren() do
                    if v.Name == "OptionSelect" then
                        v:Destroy()
                    end
                end

                for i, v in next, newList do
                    local OptionSelect = Instance.new("TextButton")
                    local OptionCorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local ImageLabel = Instance.new("ImageLabel")
                    
                    OptionSelect.Name = "OptionSelect"
                    OptionSelect.Parent = OptionScroll
                    OptionSelect.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    OptionSelect.ClipsDescendants = true
                    OptionSelect.Position = UDim2.new(0.016160097, 0, 0.0676277876, 0)
                    OptionSelect.Size = UDim2.new(0, 454, 0, 35)
                    OptionSelect.AutoButtonColor = false
                    OptionSelect.Font = Enum.Font.SourceSansSemibold
                    OptionSelect.LineHeight = 1.140
                    OptionSelect.Text = ""
                    OptionSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
                    OptionSelect.TextSize = 28.000
                    OptionSelect.TextWrapped = true
                    OptionSelect.TextXAlignment = Enum.TextXAlignment.Left
                    
                    OptionCorner.Name = "OptionCorner"
                    OptionCorner.Parent = OptionSelect
                    
                    TextLabel.Parent = OptionSelect
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0.0837004408, 0, 0, 0)
                    TextLabel.Size = UDim2.new(0, 414, 0, 35)
                    TextLabel.Font = Enum.Font.SourceSansBold
                    TextLabel.LineHeight = 1.190
                    TextLabel.Text = v
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextScaled = true
                    TextLabel.TextSize = 14.000
                    TextLabel.TextWrapped = true
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    
                    ImageLabel.Parent = OptionSelect
                    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageLabel.BackgroundTransparency = 1.000
                    ImageLabel.Position = UDim2.new(0, 4, 0.0857142881, 0)
                    ImageLabel.Size = UDim2.new(0, 28, 0, 28)
                    ImageLabel.Image = "rbxassetid://3926307971"
                    ImageLabel.ImageRectOffset = Vector2.new(204, 284)
                    ImageLabel.ImageRectSize = Vector2.new(36, 36)
    
                    OptionSelect.MouseButton1Click:Connect(function()
                        isDropping = false
                        callback(v)
                        DropTittle.Text = v                        

                        Dropdown:TweenSize(UDim2.new(1, 0, 0, 35), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                        wait(0.01)

                        PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)
                        OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)
                        local c = Sample:Clone()
                        c.Parent = OptionSelect
                        local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                        c.Position = UDim2.new(0, x, 0, y)
                        local len, size = 0.35, nil
                        if OptionSelect.AbsoluteSize.X >= OptionSelect.AbsoluteSize.Y then
                            size = (OptionSelect.AbsoluteSize.X * 1.5)
                        else
                            size = (OptionSelect.AbsoluteSize.Y * 1.5)
                        end
                        c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                        for i = 1, 10 do
                            c.ImageTransparency = c.ImageTransparency + 0.05
                            wait(len / 12)
                        end
                        c:Destroy() 

                    end)

                end
            end

            function DropFunctions:Clear()
                for i,v in next, OptionScroll:GetChildren() do
                    if v.Name == "OptionSelect" then
                        v:Destroy()
                    end
                end
                wait(0.01)
                PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)
                OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)
            end

            PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)
            OptionScroll.CanvasSize = UDim2.new(0, 0, 0, OptionListLayout.AbsoluteContentSize.Y)

            return DropFunctions
        end -- Done

        function TabElements:CreateButton(btnTitle, btnInfo, callback)
            btnTitle = btnTitle or "Button"
            btnInfo = btnInfo or "Info"
            callback = callback or function() end

            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")
            local ButtonIcon = Instance.new("ImageLabel")
            local ButtonTittle = Instance.new("TextLabel")
            local ButtonInfoBtn = Instance.new("ImageButton")

            Button.Name = "Button"
            Button.Parent = PageInners
            Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Button.ClipsDescendants = true
            Button.Size = UDim2.new(0, 475, 0, 35)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.SourceSans
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextScaled = true
            Button.TextSize = 14.000
            Button.TextWrapped = true
            
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button
            
            ButtonIcon.Name = "ButtonIcon"
            ButtonIcon.Parent = Button
            ButtonIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonIcon.BackgroundTransparency = 1.000
            ButtonIcon.Position = UDim2.new(0.0418435, 0, 0.4909091, 0)
            ButtonIcon.Size = UDim2.new(0, 21, 0, 21)
            ButtonIcon.Image = "rbxassetid://3926305904"
            ButtonIcon.ImageRectOffset = Vector2.new(84, 204)
            ButtonIcon.ImageRectSize = Vector2.new(36, 36)
            
            ButtonTittle.Name = "ButtonTittle"
            ButtonTittle.Parent = Button
            ButtonTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTittle.BackgroundTransparency = 1.000
            ButtonTittle.Position = UDim2.new(0.075265944, 0, 0.0303030312, 0)
            ButtonTittle.Size = UDim2.new(0, 145, 0, 30)
            ButtonTittle.Font = Enum.Font.SourceSansSemibold
            ButtonTittle.LineHeight = 1.120
            ButtonTittle.Text = btnTitle
            ButtonTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTittle.TextScaled = true
            ButtonTittle.TextSize = 14.000
            ButtonTittle.TextWrapped = true
            ButtonTittle.TextXAlignment = Enum.TextXAlignment.Left
            
            ButtonInfoBtn.Name = "ButtonInfoBtn"
            ButtonInfoBtn.Parent = Button
            ButtonInfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonInfoBtn.BackgroundTransparency = 1.000
            ButtonInfoBtn.Position = UDim2.new(0.940999985, 0, 0.143000007, 0)
            ButtonInfoBtn.Size = UDim2.new(0, 24, 0, 24)
            ButtonInfoBtn.Image = "rbxassetid://3926305904"
            ButtonInfoBtn.ImageRectOffset = Vector2.new(764, 764)
            ButtonInfoBtn.ImageRectSize = Vector2.new(36, 36)

            local ElementsInfo = Instance.new("Frame")
            local infoText = Instance.new("TextLabel")
            local infoClose = Instance.new("ImageButton")
        
            ElementsInfo.Name = "ElementsInfo"
            ElementsInfo.Parent = ElementsContainer
            ElementsInfo.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ElementsInfo.BackgroundTransparency = 0.010
            ElementsInfo.BorderSizePixel = 0
            ElementsInfo.Position = UDim2.new(0, 0, 1, 0)
            ElementsInfo.Size = UDim2.new(0, 514, 0, 40)
            
            infoText.Name = "infoText"
            infoText.Parent = ElementsInfo
            infoText.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            infoText.BackgroundTransparency = 1.000
            infoText.Position = UDim2.new(0.00972762611, 0, 0.17962952, 0)
            infoText.Size = UDim2.new(0, 504, 0, 25)
            infoText.Font = Enum.Font.SourceSansSemibold
            infoText.LineHeight = 1.120
            infoText.Text = btnInfo
            infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
            infoText.TextScaled = true
            infoText.TextSize = 14.000
            infoText.TextWrapped = true
            infoText.TextXAlignment = Enum.TextXAlignment.Left
            
            infoClose.Name = "infoClose"
            infoClose.Parent = infoText
            infoClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            infoClose.BackgroundTransparency = 1.000
            infoClose.Position = UDim2.new(0.946428537, 0, 0.0399999991, 0)
            infoClose.Size = UDim2.new(0, 24, 0, 24)
            infoClose.Image = "rbxassetid://7409394566"

            local isTween = false

            Button.MouseButton1Click:Connect(function()
                pcall(callback)
                local c = Sample:Clone()
                c.Parent = Button
                local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                c.Position = UDim2.new(0, x, 0, y)
                local len, size = 0.35, nil
                if Button.AbsoluteSize.X >= Button.AbsoluteSize.Y then
                    size = (Button.AbsoluteSize.X * 1.5)
                else
                    size = (Button.AbsoluteSize.Y * 1.5)
                end
                c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                for i = 1, 10 do
                    c.ImageTransparency = c.ImageTransparency + 0.05
                    wait(len / 12)
                end
                c:Destroy()
            end)

            ButtonInfoBtn.MouseButton1Click:Connect(function()
                if isTween then
                    isTween = false
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                else
                    isTween = true
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 0.890080452, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                end
            end)

            infoClose.MouseButton1Click:Connect(function()
                isTween = false
                ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
            end)

            PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)

        end -- Done
        
        function TabElements:CreateToggle(togTitle, togInfo, callback)
            togTitle = togTitle or "Toggle"
            togInfo = togInfo or "Info"
            callback = callback or function() end

            local Toggle = Instance.new("TextButton")
            local ToggleCorner = Instance.new("UICorner")
            local ToggleEnabled = Instance.new("ImageLabel")
            local ToggleTittle = Instance.new("TextLabel")
            local ToggleDisabled = Instance.new("ImageLabel")
            local ToggleInfoBtn = Instance.new("ImageButton")

            Toggle.Name = "Toggle"
            Toggle.Parent = PageInners
            Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Toggle.ClipsDescendants = true
            Toggle.Size = UDim2.new(0, 475, 0, 35)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.SourceSans
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.TextScaled = true
            Toggle.TextSize = 14.000
            Toggle.TextWrapped = true
            
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.Parent = Toggle
            
            ToggleEnabled.Name = "ToggleEnabled"
            ToggleEnabled.Parent = Toggle
            ToggleEnabled.AnchorPoint = Vector2.new(0.5, 0.5)
            ToggleEnabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleEnabled.BackgroundTransparency = 1.000
            ToggleEnabled.Position = UDim2.new(0.0418435, 0, 0.4909091, 0)
            ToggleEnabled.Size = UDim2.new(0, 21, 0, 21)
            ToggleEnabled.Visible = false
            ToggleEnabled.Image = "rbxassetid://3926309567"
            ToggleEnabled.ImageRectOffset = Vector2.new(784, 420)
            ToggleEnabled.ImageRectSize = Vector2.new(48, 48)
            
            ToggleTittle.Name = "ToggleTittle"
            ToggleTittle.Parent = Toggle
            ToggleTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTittle.BackgroundTransparency = 1.000
            ToggleTittle.Position = UDim2.new(0.075265944, 0, 0.0303030312, 0)
            ToggleTittle.Size = UDim2.new(0, 145, 0, 30)
            ToggleTittle.Font = Enum.Font.SourceSansSemibold
            ToggleTittle.LineHeight = 1.120
            ToggleTittle.Text = "Toggle"
            ToggleTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTittle.TextScaled = true
            ToggleTittle.TextSize = 14.000
            ToggleTittle.TextWrapped = true
            ToggleTittle.TextXAlignment = Enum.TextXAlignment.Left
            
            ToggleDisabled.Name = "ToggleDisabled"
            ToggleDisabled.Parent = Toggle
            ToggleDisabled.AnchorPoint = Vector2.new(0.5, 0.5)
            ToggleDisabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDisabled.BackgroundTransparency = 1.000
            ToggleDisabled.Position = UDim2.new(0.0418435, 0, 0.4909091, 0)
            ToggleDisabled.Size = UDim2.new(0, 21, 0, 21)
            ToggleDisabled.Image = "rbxassetid://3926309567"
            ToggleDisabled.ImageRectOffset = Vector2.new(628, 420)
            ToggleDisabled.ImageRectSize = Vector2.new(48, 48)
            
            ToggleInfoBtn.Name = "ToggleInfoBtn"
            ToggleInfoBtn.Parent = Toggle
            ToggleInfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleInfoBtn.BackgroundTransparency = 1.000
            ToggleInfoBtn.Position = UDim2.new(0.940999985, 0, 0.143000007, 0)
            ToggleInfoBtn.Size = UDim2.new(0, 24, 0, 24)
            ToggleInfoBtn.Image = "rbxassetid://3926305904"
            ToggleInfoBtn.ImageRectOffset = Vector2.new(764, 764)
            ToggleInfoBtn.ImageRectSize = Vector2.new(36, 36)

            local ElementsInfo = Instance.new("Frame")
            local infoText = Instance.new("TextLabel")
            local infoClose = Instance.new("ImageButton")
        
            ElementsInfo.Name = "ElementsInfo"
            ElementsInfo.Parent = ElementsContainer
            ElementsInfo.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ElementsInfo.BackgroundTransparency = 0.010
            ElementsInfo.BorderSizePixel = 0
            ElementsInfo.Position = UDim2.new(0, 0, 1, 0)
            ElementsInfo.Size = UDim2.new(0, 514, 0, 40)
            
            infoText.Name = "infoText"
            infoText.Parent = ElementsInfo
            infoText.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            infoText.BackgroundTransparency = 1.000
            infoText.Position = UDim2.new(0.00972762611, 0, 0.17962952, 0)
            infoText.Size = UDim2.new(0, 504, 0, 25)
            infoText.Font = Enum.Font.SourceSansSemibold
            infoText.LineHeight = 1.120
            infoText.Text = togInfo
            infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
            infoText.TextScaled = true
            infoText.TextSize = 14.000
            infoText.TextWrapped = true
            infoText.TextXAlignment = Enum.TextXAlignment.Left
            
            infoClose.Name = "infoClose"
            infoClose.Parent = infoText
            infoClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            infoClose.BackgroundTransparency = 1.000
            infoClose.Position = UDim2.new(0.946428537, 0, 0.0399999991, 0)
            infoClose.Size = UDim2.new(0, 24, 0, 24)
            infoClose.Image = "rbxassetid://7409394566"

            local isTween = false
            local toggled = false
            local img = ToggleEnabled

            Toggle.MouseButton1Click:Connect(function()
                if toggled == false then
                    game.TweenService:Create(img, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
                        ImageTransparency = 0
                    }):Play()
                    local c = Sample:Clone()
                    c.Parent = Toggle
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if Toggle.AbsoluteSize.X >= Toggle.AbsoluteSize.Y then
                        size = (Toggle.AbsoluteSize.X * 1.5)
                    else
                        size = (Toggle.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy()
                else
                    game.TweenService:Create(img, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
                        ImageTransparency = 0
                    }):Play()
                    local c = Sample:Clone()
                    c.Parent = Toggle
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if Toggle.AbsoluteSize.X >= Toggle.AbsoluteSize.Y then
                        size = (Toggle.AbsoluteSize.X * 1.5)
                    else
                        size = (Toggle.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy()
                end
                toggled = not toggled
                pcall(callback, toggled)
            end)

            ToggleInfoBtn.MouseButton1Click:Connect(function()
                if isTween then
                    isTween = false
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                else
                    isTween = true
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 0.890080452, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                end
            end)

            infoClose.MouseButton1Click:Connect(function()
                isTween = false
                ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
            end)

            PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)

        end -- Done

        function TabElements:CreateKeybind(keyTitle, keyInfo, key, callback)
            keyTitle = keyTitle or "Keybind"
            keyInfo = keyInfo or "Info"
            callback = callback or function() end

            local keyName = key.Name

            local Keybind = Instance.new("TextButton")
            local kBindCorner = Instance.new("UICorner")
            local kBindIcon = Instance.new("ImageLabel")
            local kBindTitle = Instance.new("TextLabel")
            local kBindKey = Instance.new("TextLabel")
            local kBindInfoBtn = Instance.new("ImageButton")

            Keybind.Name = "Keybind"
            Keybind.Parent = PageInners
            Keybind.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Keybind.ClipsDescendants = true
            Keybind.Position = UDim2.new(0.0846456662, 0, -0.0107238609, 0)
            Keybind.Size = UDim2.new(0, 475, 0, 35)
            Keybind.AutoButtonColor = false
            Keybind.Font = Enum.Font.SourceSans
            Keybind.Text = ""
            Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
            Keybind.TextScaled = true
            Keybind.TextSize = 14.000
            Keybind.TextWrapped = true
            
            kBindCorner.Name = "kBindCorner"
            kBindCorner.Parent = Keybind
            
            kBindIcon.Name = "kBindIcon"
            kBindIcon.Parent = Keybind
            kBindIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            kBindIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            kBindIcon.BackgroundTransparency = 1.000
            kBindIcon.Position = UDim2.new(0.0418435, 0, 0.4909091, 0)
            kBindIcon.Size = UDim2.new(0, 21, 0, 21)
            kBindIcon.Image = "rbxassetid://3926305904"
            kBindIcon.ImageRectOffset = Vector2.new(724, 444)
            kBindIcon.ImageRectSize = Vector2.new(36, 36)
            
            kBindTitle.Name = "kBindTitle"
            kBindTitle.Parent = Keybind
            kBindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            kBindTitle.BackgroundTransparency = 1.000
            kBindTitle.Position = UDim2.new(0.075265944, 0, 0.0303030312, 0)
            kBindTitle.Size = UDim2.new(0, 145, 0, 30)
            kBindTitle.Font = Enum.Font.SourceSansSemibold
            kBindTitle.LineHeight = 1.120
            kBindTitle.Text = keyTitle
            kBindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            kBindTitle.TextScaled = true
            kBindTitle.TextSize = 14.000
            kBindTitle.TextWrapped = true
            kBindTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            kBindKey.Name = "kBindKey"
            kBindKey.Parent = Keybind
            kBindKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            kBindKey.BackgroundTransparency = 1.000
            kBindKey.Position = UDim2.new(0.633684218, 0, 0.0588744581, 0)
            kBindKey.Size = UDim2.new(0, 145, 0, 30)
            kBindKey.Font = Enum.Font.SourceSansSemibold
            kBindKey.LineHeight = 1.120
            kBindKey.Text = keyName
            kBindKey.TextColor3 = Color3.fromRGB(255, 255, 255)
            kBindKey.TextSize = 23.000
            kBindKey.TextWrapped = true
            kBindKey.TextXAlignment = Enum.TextXAlignment.Right
            
            kBindInfoBtn.Name = "kBindInfoBtn"
            kBindInfoBtn.Parent = Keybind
            kBindInfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            kBindInfoBtn.BackgroundTransparency = 1.000
            kBindInfoBtn.Position = UDim2.new(0.940999985, 0, 0.143000007, 0)
            kBindInfoBtn.Size = UDim2.new(0, 24, 0, 24)
            kBindInfoBtn.Image = "rbxassetid://3926305904"
            kBindInfoBtn.ImageRectOffset = Vector2.new(764, 764)
            kBindInfoBtn.ImageRectSize = Vector2.new(36, 36)

            local ElementsInfo = Instance.new("Frame")
            local infoText = Instance.new("TextLabel")
            local infoClose = Instance.new("ImageButton")
        
            ElementsInfo.Name = "ElementsInfo"
            ElementsInfo.Parent = ElementsContainer
            ElementsInfo.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ElementsInfo.BackgroundTransparency = 0.010
            ElementsInfo.BorderSizePixel = 0
            ElementsInfo.Position = UDim2.new(0, 0, 1, 0)
            ElementsInfo.Size = UDim2.new(0, 514, 0, 40)
            
            infoText.Name = "infoText"
            infoText.Parent = ElementsInfo
            infoText.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            infoText.BackgroundTransparency = 1.000
            infoText.Position = UDim2.new(0.00972762611, 0, 0.17962952, 0)
            infoText.Size = UDim2.new(0, 504, 0, 25)
            infoText.Font = Enum.Font.SourceSansSemibold
            infoText.LineHeight = 1.120
            infoText.Text = keyInfo
            infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
            infoText.TextScaled = true
            infoText.TextSize = 14.000
            infoText.TextWrapped = true
            infoText.TextXAlignment = Enum.TextXAlignment.Left
            
            infoClose.Name = "infoClose"
            infoClose.Parent = infoText
            infoClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            infoClose.BackgroundTransparency = 1.000
            infoClose.Position = UDim2.new(0.946428537, 0, 0.0399999991, 0)
            infoClose.Size = UDim2.new(0, 24, 0, 24)
            infoClose.Image = "rbxassetid://7409394566"

            local isTween = false

            Keybind.MouseButton1Click:Connect(function()
                kBindKey.Text = "..."
                local a, b = input.InputBegan:wait()
                if a.KeyCode.Name ~= "Unknown" then
                    kBindKey.Text = a.KeyCode.Name
                    keyName = a.KeyCode.Name;
                end

                local c = Sample:Clone()
                c.Parent = Keybind
                local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                c.Position = UDim2.new(0, x, 0, y)
                local len, size = 0.35, nil
                if Keybind.AbsoluteSize.X >= Keybind.AbsoluteSize.Y then
                    size = (Keybind.AbsoluteSize.X * 1.5)
                else
                    size = (Keybind.AbsoluteSize.Y * 1.5)
                end
                c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                for i = 1, 10 do
                    c.ImageTransparency = c.ImageTransparency + 0.05
                    wait(len / 12)
                end
                c:Destroy()
            end)

            kBindInfoBtn.MouseButton1Click:Connect(function()
                if isTween then
                    isTween = false
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                else
                    isTween = true
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 0.890080452, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                end
            end)

            infoClose.MouseButton1Click:Connect(function()
                isTween = false
                ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
            end)

            game:GetService("UserInputService").InputBegan:connect(function(input, ok) 
                if not ok then 
                    if input.KeyCode.Name == keyName then 
                        callback()
                    end
                end
            end)

            PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)

        end -- Done
        
        function TabElements:CreateTextbox(boxTitle, boxInfo, callback)
            boxTitle = boxTitle or "Textbox"
            boxInfo = boxInfo or "Info"
            callback = callback or function() end

            local Textbox = Instance.new("TextButton")
            local TextboxCorner = Instance.new("UICorner")
            local TextboxIcon = Instance.new("ImageLabel")
            local TextboxTittle = Instance.new("TextLabel")
            local Box = Instance.new("TextBox")
            local BoxCorner = Instance.new("UICorner")
            local TextboxInfoBtn = Instance.new("ImageButton")

            Textbox.Name = "Textbox"
            Textbox.Parent = PageInners
            Textbox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Textbox.ClipsDescendants = true
            Textbox.Size = UDim2.new(0, 475, 0, 35)
            Textbox.AutoButtonColor = false
            Textbox.Font = Enum.Font.SourceSans
            Textbox.Text = ""
            Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.TextScaled = true
            Textbox.TextSize = 14.000
            Textbox.TextWrapped = true
            
            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox
            
            TextboxIcon.Name = "TextboxIcon"
            TextboxIcon.Parent = Textbox
            TextboxIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            TextboxIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxIcon.BackgroundTransparency = 1.000
            TextboxIcon.Position = UDim2.new(0.0418435, 0, 0.4909091, 0)
            TextboxIcon.Size = UDim2.new(0, 21, 0, 21)
            TextboxIcon.Image = "rbxassetid://3926305904"
            TextboxIcon.ImageRectOffset = Vector2.new(284, 644)
            TextboxIcon.ImageRectSize = Vector2.new(36, 36)
            
            TextboxTittle.Name = "TextboxTittle"
            TextboxTittle.Parent = Textbox
            TextboxTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTittle.BackgroundTransparency = 1.000
            TextboxTittle.Position = UDim2.new(0.075265944, 0, 0.0303030312, 0)
            TextboxTittle.Size = UDim2.new(0, 145, 0, 30)
            TextboxTittle.Font = Enum.Font.SourceSansSemibold
            TextboxTittle.LineHeight = 1.120
            TextboxTittle.Text = "Textbox"
            TextboxTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTittle.TextScaled = true
            TextboxTittle.TextSize = 14.000
            TextboxTittle.TextWrapped = true
            TextboxTittle.TextXAlignment = Enum.TextXAlignment.Left
            
            Box.Name = "Box"
            Box.Parent = Textbox
            Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Box.Position = UDim2.new(0.449708968, 0, 0.299839556, 0)
            Box.Size = UDim2.new(0, 233, 0, 14)
            Box.Font = Enum.Font.SourceSans
            Box.LineHeight = 1.120
            Box.PlaceholderText = "Type here!"
            Box.Text = ""
            Box.TextColor3 = Color3.fromRGB(0, 0, 0)
            Box.TextSize = 14.000
            
            BoxCorner.Name = "BoxCorner"
            BoxCorner.Parent = Box
            
            TextboxInfoBtn.Name = "TextboxInfoBtn"
            TextboxInfoBtn.Parent = Textbox
            TextboxInfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxInfoBtn.BackgroundTransparency = 1.000
            TextboxInfoBtn.Position = UDim2.new(0.940999985, 0, 0.143000007, 0)
            TextboxInfoBtn.Size = UDim2.new(0, 24, 0, 24)
            TextboxInfoBtn.Image = "rbxassetid://3926305904"
            TextboxInfoBtn.ImageRectOffset = Vector2.new(764, 764)
            TextboxInfoBtn.ImageRectSize = Vector2.new(36, 36)

            local ElementsInfo = Instance.new("Frame")
            local infoText = Instance.new("TextLabel")
            local infoClose = Instance.new("ImageButton")
        
            ElementsInfo.Name = "ElementsInfo"
            ElementsInfo.Parent = ElementsContainer
            ElementsInfo.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ElementsInfo.BackgroundTransparency = 0.010
            ElementsInfo.BorderSizePixel = 0
            ElementsInfo.Position = UDim2.new(0, 0, 1, 0)
            ElementsInfo.Size = UDim2.new(0, 514, 0, 40)
            
            infoText.Name = "infoText"
            infoText.Parent = ElementsInfo
            infoText.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            infoText.BackgroundTransparency = 1.000
            infoText.Position = UDim2.new(0.00972762611, 0, 0.17962952, 0)
            infoText.Size = UDim2.new(0, 504, 0, 25)
            infoText.Font = Enum.Font.SourceSansSemibold
            infoText.LineHeight = 1.120
            infoText.Text = boxInfo
            infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
            infoText.TextScaled = true
            infoText.TextSize = 14.000
            infoText.TextWrapped = true
            infoText.TextXAlignment = Enum.TextXAlignment.Left
            
            infoClose.Name = "infoClose"
            infoClose.Parent = infoText
            infoClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            infoClose.BackgroundTransparency = 1.000
            infoClose.Position = UDim2.new(0.946428537, 0, 0.0399999991, 0)
            infoClose.Size = UDim2.new(0, 24, 0, 24)
            infoClose.Image = "rbxassetid://7409394566"

            local isTween = false

            Box.FocusLost:Connect(function(enterPressed)
                if not enterPressed then
                    return
                else
                    callback(Box.Text)
                    wait(0.1)
                    Box.Text = ""
                end
            end)

            TextboxInfoBtn.MouseButton1Click:Connect(function()
                if isTween then
                    isTween = false
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                else
                    isTween = true
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 0.890080452, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                end
            end)

            infoClose.MouseButton1Click:Connect(function()
                isTween = false
                ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
            end)

            PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)

        end -- Done

        function TabElements:CreateSlider(sliderTitle, sliderInfo, max, min, callback)
            sliderTitle = sliderTitle or "Slider"
            sliderInfo = sliderInfo or "Info"
            max = max or 100
            min = min or 1
            callback = callback or function() end
            
            local Slider = Instance.new("TextButton")
            local SliderCorner = Instance.new("UICorner")
            local SliderIcon = Instance.new("ImageLabel")
            local SliderTittle = Instance.new("TextLabel")
            local SliderVal = Instance.new("TextLabel")
            local SliderBtn = Instance.new("TextButton")
            local SliderBtnCorner = Instance.new("UICorner")
            local SliderDrag = Instance.new("Frame")
            local BarCorner = Instance.new("UICorner")
            local SliderInfoBtn = Instance.new("ImageButton")
            
            Slider.Name = "Slider"
            Slider.Parent = PageInners
            Slider.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Slider.ClipsDescendants = true
            Slider.Size = UDim2.new(0, 475, 0, 35)
            Slider.AutoButtonColor = false
            Slider.Font = Enum.Font.SourceSans
            Slider.Text = ""
            Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            Slider.TextScaled = true
            Slider.TextSize = 14.000
            Slider.TextWrapped = true
            
            SliderCorner.Name = "SliderCorner"
            SliderCorner.Parent = Slider
            
            SliderIcon.Name = "SliderIcon"
            SliderIcon.Parent = Slider
            SliderIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderIcon.BackgroundTransparency = 1.000
            SliderIcon.Position = UDim2.new(0.0418435, 0, 0.4909091, 0)
            SliderIcon.Size = UDim2.new(0, 21, 0, 21)
            SliderIcon.Image = "rbxassetid://3926307971"
            SliderIcon.ImageRectOffset = Vector2.new(404, 164)
            SliderIcon.ImageRectSize = Vector2.new(36, 36)
            
            SliderTittle.Name = "SliderTittle"
            SliderTittle.Parent = Slider
            SliderTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTittle.BackgroundTransparency = 1.000
            SliderTittle.Position = UDim2.new(0.0752659366, 0, 0.0303030312, 0)
            SliderTittle.Size = UDim2.new(0, 119, 0, 30)
            SliderTittle.Font = Enum.Font.SourceSansSemibold
            SliderTittle.LineHeight = 1.120
            SliderTittle.Text = sliderTitle
            SliderTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTittle.TextScaled = true
            SliderTittle.TextSize = 14.000
            SliderTittle.TextWrapped = true
            SliderTittle.TextXAlignment = Enum.TextXAlignment.Left
            
            SliderVal.Name = "SliderVal"
            SliderVal.Parent = Slider
            SliderVal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderVal.BackgroundTransparency = 1.000
            SliderVal.Position = UDim2.new(0.41534391, 0, 0.0303030312, 0)
            SliderVal.Size = UDim2.new(0, 27, 0, 30)
            SliderVal.Font = Enum.Font.SourceSansSemibold
            SliderVal.LineHeight = 1.120
            SliderVal.Text = min
            SliderVal.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderVal.TextScaled = true
            SliderVal.TextSize = 14.000
            SliderVal.TextWrapped = true
            
            SliderBtn.Name = "SliderBtn"
            SliderBtn.Parent = Slider
            SliderBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderBtn.Position = UDim2.new(0.472186029, 0, 0.335064709, 0)
            SliderBtn.Size = UDim2.new(0, 221, 0, 8)
            SliderBtn.Font = Enum.Font.SourceSans
            SliderBtn.Text = ""
            SliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderBtn.TextSize = 14.000
            
            SliderBtnCorner.Name = "SliderBtnCorner"
            SliderBtnCorner.Parent = SliderBtn
            
            SliderDrag.Name = "SliderDrag"
            SliderDrag.Parent = SliderBtn
            SliderDrag.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
            SliderDrag.Size = UDim2.new(0, 0, 0, 8)
            
            BarCorner.Name = "BarCorner"
            BarCorner.Parent = SliderDrag
            
            SliderInfoBtn.Name = "SliderInfoBtn"
            SliderInfoBtn.Parent = Slider
            SliderInfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderInfoBtn.BackgroundTransparency = 1.000
            SliderInfoBtn.Position = UDim2.new(0.940999985, 0, 0.143000007, 0)
            SliderInfoBtn.Size = UDim2.new(0, 24, 0, 24)
            SliderInfoBtn.Image = "rbxassetid://3926305904"
            SliderInfoBtn.ImageRectOffset = Vector2.new(764, 764)
            SliderInfoBtn.ImageRectSize = Vector2.new(36, 36)

            local ElementsInfo = Instance.new("Frame")
            local infoText = Instance.new("TextLabel")
            local infoClose = Instance.new("ImageButton")
        
            ElementsInfo.Name = "ElementsInfo"
            ElementsInfo.Parent = ElementsContainer
            ElementsInfo.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ElementsInfo.BackgroundTransparency = 0.010
            ElementsInfo.BorderSizePixel = 0
            ElementsInfo.Position = UDim2.new(0, 0, 1, 0)
            ElementsInfo.Size = UDim2.new(0, 514, 0, 40)
            
            infoText.Name = "infoText"
            infoText.Parent = ElementsInfo
            infoText.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            infoText.BackgroundTransparency = 1.000
            infoText.Position = UDim2.new(0.00972762611, 0, 0.17962952, 0)
            infoText.Size = UDim2.new(0, 504, 0, 25)
            infoText.Font = Enum.Font.SourceSansSemibold
            infoText.LineHeight = 1.120
            infoText.Text = sliderInfo
            infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
            infoText.TextScaled = true
            infoText.TextSize = 14.000
            infoText.TextWrapped = true
            infoText.TextXAlignment = Enum.TextXAlignment.Left
            
            infoClose.Name = "infoClose"
            infoClose.Parent = infoText
            infoClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            infoClose.BackgroundTransparency = 1.000
            infoClose.Position = UDim2.new(0.946428537, 0, 0.0399999991, 0)
            infoClose.Size = UDim2.new(0, 24, 0, 24)
            infoClose.Image = "rbxassetid://7409394566"

            local isTween = false

            local Value
            local moveconnection
            local releaseconnection

            local maxvalue = max
            local minvalue = min

            SliderBtn.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 221) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    SliderDrag.Size = UDim2.new(0, math.clamp(ms.X - SliderDrag.AbsolutePosition.X, 0, 221), 0, 8)
                    moveconnection = ms.Move:Connect(function()
                        SliderVal.Text = Value
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 221) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                    pcall(function()
                    callback(Value)
                end)
                SliderDrag.Size = UDim2.new(0, math.clamp(ms.X - SliderDrag.AbsolutePosition.X, 0, 221), 0, 8)
                end)
                releaseconnection = input.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 221) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue))
                    pcall(function()
                        callback(Value)
                    end)
                    SliderDrag.Size = UDim2.new(0, math.clamp(ms.X - SliderDrag.AbsolutePosition.X, 0, 221), 0, 8)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)

            SliderInfoBtn.MouseButton1Click:Connect(function()
                if isTween then
                    isTween = false
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                else
                    isTween = true
                    ElementsInfo:TweenPosition(UDim2.new(0, 0, 0.890080452, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
                end
            end)

            infoClose.MouseButton1Click:Connect(function()
                isTween = false
                ElementsInfo:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.1)
            end)

            PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)

        end -- Done

        function TabElements:CreateLabel(labelTitle)
            labelTitle = labelTitle or "Label"

            local Label = Instance.new("TextLabel")
            local labelCorner = Instance.new("UICorner")
            
            Label.Name = "Label"
            Label.Parent = PageInners
            Label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Label.Size = UDim2.new(0, 475, 0, 35)
            Label.Font = Enum.Font.SourceSansSemibold
            Label.LineHeight = 1.120
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.Text = " "..labelTitle
            Label.TextScaled = true
            Label.TextSize = 14.000
            Label.TextWrapped = true
            Label.TextXAlignment = Enum.TextXAlignment.Left

            labelCorner.Name = "labelCorner"
            labelCorner.Parent = Label

            PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)

        end -- Done

        function TabElements:CreateColorpicker(colorPickerTitle, preset, callback)
            colorPickerTitle = colorPickerTitle or "Color Picker"
            callback = callback or function() end

            local ColorH, ColorS, ColorV = 1, 1, 1
            local ColorInput = nil
            local HueInput = nil

            local Colorpicker = Instance.new("Frame")
            local Color = Instance.new("ImageLabel")
            local ColorCorner = Instance.new("UICorner")
            local ColorSelection = Instance.new("ImageLabel")
            local Hue = Instance.new("ImageLabel")
            local HueCorner = Instance.new("UICorner")
            local HueGradient = Instance.new("UIGradient")
            local HueSelection = Instance.new("ImageLabel")
            local ColorpickerInfoBtn = Instance.new("ImageButton")
            local ColorpickerIcon = Instance.new("ImageLabel")
            local ColorpickerTittle = Instance.new("TextLabel")
            local ColorpickerCorner = Instance.new("UICorner")
            local PresetColor = Instance.new("Frame")
            local PresetColorCorner = Instance.new("UICorner")
            
            Colorpicker.Name = "Colorpicker"
            Colorpicker.Parent = PageInners
            Colorpicker.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Colorpicker.Position = UDim2.new(0.0324803144, 0, 0.190769225, 0)
            Colorpicker.Size = UDim2.new(0, 475, 0, 206)
            
            Color.Name = "Color"
            Color.Parent = Colorpicker
            Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            Color.Position = UDim2.new(0.0434210524, 0, 0.174757287, 0)
            Color.Size = UDim2.new(0, 331, 0, 161)
            Color.Image = "rbxassetid://4155801252"
            
            ColorCorner.Name = "ColorCorner"
            ColorCorner.Parent = Color
            
            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = Color
            ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelection.BackgroundTransparency = 1.000
            ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
            ColorSelection.Size = UDim2.new(0, 20, 0, 20)
            ColorSelection.Image = "http://www.roblox.com/asset/?id=7399450227"
            ColorSelection.ImageColor3 = Color3.fromRGB(152, 152, 152)
            
            Hue.Name = "Hue"
            Hue.Parent = Colorpicker
            Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hue.Position = UDim2.new(0.770894825, 0, 0.174757287, 0)
            Hue.Size = UDim2.new(0, 32, 0, 161)
            
            HueCorner.Name = "HueCorner"
            HueCorner.Parent = Hue
            
            HueGradient.Color = ColorSequence.new {
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
            }
            HueGradient.Rotation = 270
            HueGradient.Name = "HueGradient"
            HueGradient.Parent = Hue
            
            HueSelection.Name = "HueSelection"
            HueSelection.Parent = Hue
            HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelection.BackgroundTransparency = 1.000
            HueSelection.Position = UDim2.new(0.125, 0, -0.0621118024 - select(1, Color3.toHSV(preset)))
            HueSelection.Size = UDim2.new(0, 24, 0, 24)
            HueSelection.Image = "http://www.roblox.com/asset/?id=7399450227"
            HueSelection.ImageColor3 = Color3.fromRGB(152, 152, 152)
            
            ColorpickerInfoBtn.Name = "ColorpickerInfoBtn"
            ColorpickerInfoBtn.Parent = Colorpicker
            ColorpickerInfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerInfoBtn.BackgroundTransparency = 1.000
            ColorpickerInfoBtn.Position = UDim2.new(0.940999985, 0, 0.0167864133, 0)
            ColorpickerInfoBtn.Size = UDim2.new(0, 24, 0, 24)
            ColorpickerInfoBtn.Image = "rbxassetid://3926305904"
            ColorpickerInfoBtn.ImageRectOffset = Vector2.new(764, 764)
            ColorpickerInfoBtn.ImageRectSize = Vector2.new(36, 36)
            
            ColorpickerIcon.Name = "ColorpickerIcon"
            ColorpickerIcon.Parent = Colorpicker
            ColorpickerIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorpickerIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerIcon.BackgroundTransparency = 1.000
            ColorpickerIcon.Position = UDim2.new(0.0355277099, 0, 0.0782877505, 0)
            ColorpickerIcon.Size = UDim2.new(0, 21, 0, 21)
            ColorpickerIcon.Image = "rbxassetid://3926305904"
            ColorpickerIcon.ImageRectOffset = Vector2.new(804, 924)
            ColorpickerIcon.ImageRectSize = Vector2.new(36, 36)
            
            ColorpickerTittle.Name = "ColorpickerTittle"
            ColorpickerTittle.Parent = Colorpicker
            ColorpickerTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerTittle.BackgroundTransparency = 1.000
            ColorpickerTittle.Position = UDim2.new(0.0689501539, 0, 0.00603118725, 0)
            ColorpickerTittle.Size = UDim2.new(0, 145, 0, 30)
            ColorpickerTittle.Font = Enum.Font.SourceSansSemibold
            ColorpickerTittle.LineHeight = 1.120
            ColorpickerTittle.Text = "Color Picker"
            ColorpickerTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerTittle.TextScaled = true
            ColorpickerTittle.TextSize = 14.000
            ColorpickerTittle.TextWrapped = true
            ColorpickerTittle.TextXAlignment = Enum.TextXAlignment.Left
            
            ColorpickerCorner.Name = "ColorpickerCorner"
            ColorpickerCorner.Parent = Colorpicker
            
            PresetColor.Name = "PresetColor"
            PresetColor.Parent = Colorpicker
            PresetColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PresetColor.Position = UDim2.new(0.869473696, 0, 0.174757287, 0)
            PresetColor.Size = UDim2.new(0, 40, 0, 40)
            
            PresetColorCorner.Name = "PresetColorCorner"
            PresetColorCorner.Parent = PresetColor
            
            local function UpdateColorPicker(none)
                PresetColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

                pcall(callback, PresetColor.BackgroundColor3)
            end

            ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
			ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
			ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

            PresetColor.BackgroundColor3 = preset
            Color.BackgroundColor3 = preset
            pcall(callback, PresetColor.BackgroundColor3)

            Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								run.RenderStepped:Connect(
									function()
									local ColorX =
										(math.clamp(ms.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
									local ColorY =
										(math.clamp(ms.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

									ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
									ColorS = ColorX
									ColorV = 1 - ColorY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

                Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

                Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then


							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								run.RenderStepped:Connect(
									function()
									local HueY =
										(math.clamp(ms.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)

									HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
									ColorH = 1 - HueY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)

                PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)

        end

        PageInners.CanvasSize = UDim2.new(0, 0, 0, PageInnersListLayout.AbsoluteContentSize.Y)
        TabScroll.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)

        return TabElements
    end
    
    CFAHubV3.Parent = coreGui
    return windows
end

return library