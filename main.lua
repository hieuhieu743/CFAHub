--[[
    
Name: CFA_UI_Library_[Free]
Version: 3.5

[Update]:
- Redesigning GUI
- Rescripting
- Added new function

]]--

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

function library:NewWindow(title)
    local window = {}
    title = title or "CFA Hub Premium - Game Name"

    local CFAUiLib = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local TitleFrame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local ImageLabel = Instance.new("ImageLabel")
    local ImageButton = Instance.new("ImageButton")
    local Tabs = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")

    local function UpdateSize()
        local cS = UIListLayout.AbsoluteContentSize

        game.TweenService:Create(Tabs, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            CanvasSize = UDim2.new(0,0,0,cS.Y)
        }):Play()
    end

    Tabs.ChildAdded:Connect(UpdateSize())
    Tabs.ChildRemoved:Connect(UpdateSize())

    CFAUiLib.Name = "CFAUiLib"
    CFAUiLib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    CFAUiLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Background.Name = "Background"
    Background.Parent = CFAUiLib
    Background.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Background.BorderColor3 = Color3.fromRGB(31, 31, 31)
    Background.BorderSizePixel = 0
    Background.Position = UDim2.new(0.011299435, 0, 0.0360531397, 0)
    Background.Size = UDim2.new(0, 580, 0, 309)
    
    TitleFrame.Name = "TitleFrame"
    TitleFrame.Parent = Background
    TitleFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    TitleFrame.BorderSizePixel = 0
    TitleFrame.ClipsDescendants = true
    TitleFrame.Size = UDim2.new(1, 0, 0, 24)
    
    TextLabel.Parent = TitleFrame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.0678380653, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 318, 0, 24)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.LineHeight = 1.150
    TextLabel.Text = title
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    ImageLabel.Parent = TitleFrame
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.Position = UDim2.new(0.0160965789, 0, 0, 0)
    ImageLabel.Size = UDim2.new(0, 24, 0, 24)
    ImageLabel.Image = "http://www.roblox.com/asset/?id=7409401226"
    
    ImageButton.Parent = TitleFrame
    ImageButton.BackgroundColor3 = Color3.fromRGB(3, 3, 3)
    ImageButton.BackgroundTransparency = 1.000
    ImageButton.Position = UDim2.new(0.925999999, 0, 0, 0)
    ImageButton.Size = UDim2.new(0, 24, 0, 24)
    ImageButton.Image = "http://www.roblox.com/asset/?id=7409394566"
    ImageButton.MouseButton1Click:Connect(function()
        CFAUiLib:Destroy()
        UpdateSize()
    end)
    
    Tabs.Name = "Tabs"
    Tabs.Parent = Background
    Tabs.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0, 0, 0.0776699036, 0)
    Tabs.Size = UDim2.new(0, 131, 0, 284)
    Tabs.CanvasSize = UDim2.new(0, 0, 0, 0)
    Tabs.ScrollBarThickness = 4

    UIListLayout.Parent = Tabs
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 2)

    local Containers = Instance.new("Folder")

    Containers.Name = "Containers"
    Containers.Parent = Background

    UpdateSize()

    function window:NewTab(name)
        local tabs = {}
        name = name or "Tab"

        UpdateSize()

        local TABContainer = Instance.new("Frame")
        local Page_Button = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local ButtonSample = Instance.new("ImageLabel")

        TABContainer.Name = name.."Container"
        TABContainer.Parent = Tabs
        TABContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TABContainer.BackgroundTransparency = 1.000
        TABContainer.Position = UDim2.new(0, 0, 0.0237180144, 0)
        TABContainer.Size = UDim2.new(0, 131, 0, 41)
        
        Page_Button.Name = name.."_Button"
        Page_Button.Parent = TABContainer
        Page_Button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        Page_Button.BorderColor3 = Color3.fromRGB(31, 31, 31)
        Page_Button.BorderSizePixel = 2
        Page_Button.ClipsDescendants = true
        Page_Button.Position = UDim2.new(0.0534351133, 0, 0.144438028, 0)
        Page_Button.Size = UDim2.new(0.893129766, 0, 0.855561972, 0)
        Page_Button.AutoButtonColor = false
        Page_Button.Font = Enum.Font.SourceSansBold
        Page_Button.Text = name
        Page_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Page_Button.TextSize = 22.000
        Page_Button.TextWrapped = true
        
        UICorner.Parent = Page_Button
        
        ButtonSample.Name = "ButtonSample"
        ButtonSample.Parent = Page_Button
        ButtonSample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonSample.BackgroundTransparency = 1.000
        ButtonSample.Position = UDim2.new(0.0128205121, 0, 0.327840537, 0)
        ButtonSample.Size = UDim2.new(0, 50, 0, 50)
        ButtonSample.Image = "rbxassetid://4560909609"
        ButtonSample.ImageTransparency = 1.000

        local Container = Instance.new("Frame")

        Container.Name = name.."Container"
        Container.Parent = Containers
        Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Container.BackgroundTransparency = 1.000
        Container.Position = UDim2.new(0.225862071, 0, 0.0776699036, 0)
        Container.Size = UDim2.new(0, 449, 0, 284)

        Page_Button.MouseButton1Click:Connect(function()
            UpdateSize()
            local c = ButtonSample:Clone()
            c.ImageTransparency = 0.600
            c.Parent = Page_Button
            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
            c.Position = UDim2.new(0, x, 0, y)
            local len, size = 0.35, nil
            if Page_Button.AbsoluteSize.X >= Page_Button.AbsoluteSize.Y then
                size = (Page_Button.AbsoluteSize.X * 1.5)
            else
                size = (Page_Button.AbsoluteSize.Y * 1.5)
            end
            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
            for i = 1, 10 do
                c.ImageTransparency = c.ImageTransparency + 0.05
                wait(len / 12)
            end
            c:Destroy()

            for i, v in next, Containers:GetChildren() do
                v.Visible = false
            end
            Container.Visible = true
        end)

        function tabs:NewSection(name)
            local sections = {}
            name = name or "Section"

            local Sections = Instance.new("ScrollingFrame")
            local UIListLayout_2 = Instance.new("UIListLayout")

            local function UpdateSectionSize()
                local ab = UIListLayout_2.AbsoluteContentSize

                game.TweenService:Create(Sections, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    CanvasSize = UDim2.new(0,0,0,ab.Y)
                }):Play()
            end

            UpdateSectionSize()

            Sections.Name = "Sections"
            Sections.Parent = Container
            Sections.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sections.BackgroundTransparency = 1.000
            Sections.BorderSizePixel = 0
            Sections.Position = UDim2.new(0, 0, 0.0208519809, 0)
            Sections.Size = UDim2.new(0, 449, 0, 277)
            Sections.ScrollBarThickness = 6
            
            UIListLayout_2.Parent = Sections
            UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 4)

            local SectionFrame = Instance.new("Frame")
            local SecText = Instance.new("TextLabel")
            local SecUI = Instance.new("UICorner")

            SectionFrame.Name = "SectionFrame"
            SectionFrame.Parent = Sections
            SectionFrame.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
            SectionFrame.Position = UDim2.new(0.0244988855, 0, 0.548736453, 0)
            SectionFrame.Size = UDim2.new(0, 427, 0, 45)
            
            SecText.Name = "SecText"
            SecText.Parent = SectionFrame
            SecText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SecText.BackgroundTransparency = 1.000
            SecText.Size = UDim2.new(0, 427, 0, 45)
            SecText.Font = Enum.Font.SourceSansSemibold
            SecText.Text = name
            SecText.TextColor3 = Color3.fromRGB(255, 255, 255)
            SecText.TextScaled = true
            SecText.TextSize = 14.000
            SecText.TextWrapped = true
            SecText.TextXAlignment = Enum.TextXAlignment.Left
            
            SecUI.Name = "SecUI"
            SecUI.Parent = SectionFrame

            function sections:NewSilder(text, min, max, callback)
                UpdateSectionSize()
                
                text = text or "Silder"
                min = min or 1
                max = max or 100
                callback = callback or function() end
                local Value
                local moveconnection
                local releaseconnection

                local SilderContainer = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local Name = Instance.new("TextLabel")
                local Icon = Instance.new("ImageLabel")
                local Number = Instance.new("TextLabel")
                local Silder_Button = Instance.new("TextButton")
                local Bar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")
                
                SilderContainer.Name = "SilderContainer"
                SilderContainer.Parent = Sections
                SilderContainer.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                SilderContainer.Position = UDim2.new(-0.000422947109, 0, 1.16666663, 0)
                SilderContainer.Size = UDim2.new(0, 417, 0, 34)
                
                UICorner_2.Parent = SilderContainer
                
                Name.Name = "Name"
                Name.Parent = SilderContainer
                Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Name.BackgroundTransparency = 1.000
                Name.Position = UDim2.new(0.12230216, 0, 0, 0)
                Name.Size = UDim2.new(0, 96, 0, 34)
                Name.Font = Enum.Font.SourceSansBold
                Name.LineHeight = 1.130
                Name.Text = text
                Name.TextColor3 = Color3.fromRGB(255, 255, 255)
                Name.TextScaled = true
                Name.TextSize = 14.000
                Name.TextWrapped = true
                Name.TextXAlignment = Enum.TextXAlignment.Left
                
                Icon.Name = "Icon"
                Icon.Parent = SilderContainer
                Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Icon.BackgroundTransparency = 1.000
                Icon.Position = UDim2.new(0.0263788961, 0, -0.0294117648, 0)
                Icon.Size = UDim2.new(0, 34, 0, 34)
                Icon.Image = "http://www.roblox.com/asset/?id=7399449796"

                Number.Name = "Number"
                Number.Parent = SilderContainer
                Number.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Number.BackgroundTransparency = 1.000
                Number.Position = UDim2.new(0.352517992, 0, 0, 0)
                Number.Size = UDim2.new(0, 41, 0, 34)
                Number.Font = Enum.Font.SourceSansBold
                Number.LineHeight = 1.130
                Number.Text = "0"
                Number.TextColor3 = Color3.fromRGB(255, 255, 255)
                Number.TextScaled = true
                Number.TextSize = 14.000
                Number.TextWrapped = true
                
                Silder_Button.Name = "Silder_Button"
                Silder_Button.Parent = SilderContainer
                Silder_Button.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
                Silder_Button.ClipsDescendants = true
                Silder_Button.Position = UDim2.new(0.455635488, 0, 0.323529422, 0)
                Silder_Button.Size = UDim2.new(0, 217, 0, 9)
                Silder_Button.AutoButtonColor = false
                Silder_Button.Font = Enum.Font.SourceSans
                Silder_Button.Text = ""
                Silder_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Silder_Button.TextSize = 14.000
                
                Bar.Name = "Bar"
                Bar.Parent = Silder_Button
                Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Bar.Position = UDim2.new(-0.00921658985, 0, 0.00710381381, 0)
                Bar.Size = UDim2.new(0.00899999961, 0, 0, 9)
                
                UICorner_3.Parent = Bar
                
                UICorner_4.Parent = Silder_Button

                Silder_Button.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 217) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(ms.X - Bar.AbsolutePosition.X, 0, 217), 0, 9)
                    moveconnection = ms.Move:Connect(function()
                        Number.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 217) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                            Number.Text = Value
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(ms.X - Bar.AbsolutePosition.X, 0, 217), 0, 9)
                    end)
                    releaseconnection = input.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 217) * Bar.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(ms.X - Bar.AbsolutePosition.X, 0, 217), 0, 9)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
            end
            
            function sections:NewButton(text, callback)
                UpdateSectionSize()

                text = text or "Button"
                callback = callback or function() end

                local ButtonContainer = Instance.new("Frame")
                local Button_Button = Instance.new("TextButton")
                local UICorner_5 = Instance.new("UICorner")
                local Icon_2 = Instance.new("ImageLabel")
                local Name_2 = Instance.new("TextLabel")
                local ButtonSample_2 = Instance.new("ImageLabel")

                ButtonContainer.Name = "ButtonContainer"
                ButtonContainer.Parent = Sections
                ButtonContainer.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                ButtonContainer.BackgroundTransparency = 1.000
                ButtonContainer.Position = UDim2.new(-0.000422947109, 0, 1.16666663, 0)
                ButtonContainer.Size = UDim2.new(0, 417, 0, 34)
                
                Button_Button.Name = "Button_Button"
                Button_Button.Parent = ButtonContainer
                Button_Button.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                Button_Button.ClipsDescendants = true
                Button_Button.Size = UDim2.new(0, 417, 0, 34)
                Button_Button.AutoButtonColor = false
                Button_Button.Font = Enum.Font.SourceSans
                Button_Button.Text = ""
                Button_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button_Button.TextScaled = true
                Button_Button.TextSize = 14.000
                Button_Button.TextWrapped = true
                
                UICorner_5.Parent = Button_Button
                
                Icon_2.Name = "Icon"
                Icon_2.Parent = Button_Button
                Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Icon_2.BackgroundTransparency = 1.000
                Icon_2.Position = UDim2.new(0.0263788961, 0, -0.0294117648, 0)
                Icon_2.Size = UDim2.new(0, 34, 0, 34)
                Icon_2.Image = "http://www.roblox.com/asset/?id=7399449509"
                
                Name_2.Name = "Name"
                Name_2.Parent = Button_Button
                Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Name_2.BackgroundTransparency = 1.000
                Name_2.Position = UDim2.new(0.12230216, 0, 0, 0)
                Name_2.Size = UDim2.new(0, 137, 0, 34)
                Name_2.Font = Enum.Font.SourceSansBold
                Name_2.LineHeight = 1.130
                Name_2.Text = text
                Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Name_2.TextScaled = true
                Name_2.TextSize = 14.000
                Name_2.TextWrapped = true
                Name_2.TextXAlignment = Enum.TextXAlignment.Left
                
                ButtonSample_2.Name = "ButtonSample"
                ButtonSample_2.Parent = Button_Button
                ButtonSample_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonSample_2.BackgroundTransparency = 1.000
                ButtonSample_2.Size = UDim2.new(0, 100, 0, 100)
                ButtonSample_2.Image = "rbxassetid://4560909609"
                ButtonSample_2.ImageTransparency = 1.000

                Button_Button.MouseButton1Click:Connect(function()
                    local c = ButtonSample_2:Clone()
                    c.ImageTransparency = 0.600
                    c.Parent = Button_Button
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if Button_Button.AbsoluteSize.X >= Button_Button.AbsoluteSize.Y then
                        size = (Button_Button.AbsoluteSize.X * 1.5)
                    else
                        size = (Button_Button.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy()

                    pcall(callback)
                end)
                
            end

            function sections:NewToggle(text, callback)
                UpdateSectionSize()

                text = text or "Toggle"
                callback = callback or function() end
                local toggled = false

                local ToggleContainer = Instance.new("Frame")
                local Toggle_Button = Instance.new("TextButton")
                local UICorner_6 = Instance.new("UICorner")
                local Name_3 = Instance.new("TextLabel")
                local Off = Instance.new("ImageLabel")
                local On = Instance.new("ImageLabel")
                local Toggle_Sample = Instance.new("ImageLabel")
                
                ToggleContainer.Name = "ToggleContainer"
                ToggleContainer.Parent = Sections
                ToggleContainer.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                ToggleContainer.BackgroundTransparency = 1.000
                ToggleContainer.Position = UDim2.new(-0.000422947109, 0, 1.16666663, 0)
                ToggleContainer.Size = UDim2.new(0, 417, 0, 34)
                
                Toggle_Button.Name = "Toggle_Button"
                Toggle_Button.Parent = ToggleContainer
                Toggle_Button.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                Toggle_Button.ClipsDescendants = true
                Toggle_Button.Size = UDim2.new(0, 417, 0, 34)
                Toggle_Button.AutoButtonColor = false
                Toggle_Button.Font = Enum.Font.SourceSans
                Toggle_Button.Text = ""
                Toggle_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Toggle_Button.TextScaled = true
                Toggle_Button.TextSize = 14.000
                Toggle_Button.TextWrapped = true
                
                UICorner_6.Parent = Toggle_Button
                
                Name_3.Name = "Name"
                Name_3.Parent = Toggle_Button
                Name_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Name_3.BackgroundTransparency = 1.000
                Name_3.Position = UDim2.new(0.12230216, 0, 0, 0)
                Name_3.Size = UDim2.new(0, 137, 0, 34)
                Name_3.Font = Enum.Font.SourceSansBold
                Name_3.LineHeight = 1.130
                Name_3.Text = text
                Name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                Name_3.TextScaled = true
                Name_3.TextSize = 14.000
                Name_3.TextWrapped = true
                Name_3.TextXAlignment = Enum.TextXAlignment.Left
                
                Off.Name = "Off"
                Off.Parent = Toggle_Button
                Off.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Off.BackgroundTransparency = 1.000
                Off.Position = UDim2.new(0.0263788961, 0, -0.0294117648, 0)
                Off.Size = UDim2.new(0, 34, 0, 34)
                Off.Image = "http://www.roblox.com/asset/?id=7399450545"
                
                On.Name = "On"
                On.Parent = Toggle_Button
                On.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                On.BackgroundTransparency = 1.000
                On.Position = UDim2.new(0.0263788961, 0, -0.0294117648, 0)
                On.Size = UDim2.new(0, 34, 0, 34)
                On.Visible = false
                On.Image = "http://www.roblox.com/asset/?id=7399450227"
                
                Toggle_Sample.Name = "Toggle_Sample"
                Toggle_Sample.Parent = Toggle_Button
                Toggle_Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Toggle_Sample.BackgroundTransparency = 1.000
                Toggle_Sample.Size = UDim2.new(0, 100, 0, 100)
                Toggle_Sample.Image = "rbxassetid://4560909609"
                Toggle_Sample.ImageTransparency = 1.000

                Toggle_Button.MouseButton1Click:Connect(function()
                    local c = Toggle_Sample:Clone()
                    c.ImageTransparency = 0.600
                    c.Parent = Toggle_Button
                    local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                    c.Position = UDim2.new(0, x, 0, y)
                    local len, size = 0.35, nil
                    if Toggle_Button.AbsoluteSize.X >= Toggle_Button.AbsoluteSize.Y then
                        size = (Toggle_Button.AbsoluteSize.X * 1.5)
                    else
                        size = (Toggle_Button.AbsoluteSize.Y * 1.5)
                    end
                    c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                    for i = 1, 10 do
                        c.ImageTransparency = c.ImageTransparency + 0.05
                        wait(len / 12)
                    end
                    c:Destroy()

                    if Off.Visible == true then
                        Off.Visible = false
                        On.Visible = true
                        toggled = not toggled
                        spawn(function() callback(toggled) end)
                    else
                        Off.Visible = true
                        On.Visible = false
                        spawn(function() callback(toggled) end)
                    end
                end)
            end

            function sections:NewDropdown(text)
                UpdateSectionSize()

                local options = {}
                text = text or "Dropdown"
                
                local DropdownContainer = Instance.new("Frame")
                local DropdownButton = Instance.new("TextButton")
                local UICorner_7 = Instance.new("UICorner")
                local Icon_3 = Instance.new("ImageLabel")
                local Name_4 = Instance.new("TextLabel")
                local CloseIcon = Instance.new("TextLabel")
                local Dropdown_Sample = Instance.new("ImageLabel")

                DropdownContainer.Name = "DropdownContainer"
                DropdownContainer.Parent = Sections
                DropdownContainer.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                DropdownContainer.BackgroundTransparency = 1.000
                DropdownContainer.Position = UDim2.new(-0.000422947109, 0, 1.16666663, 0)
                DropdownContainer.Size = UDim2.new(0, 417, 0, 34)

                DropdownButton.Name = "DropdownButton"
                DropdownButton.Parent = DropdownContainer
                DropdownButton.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
                DropdownButton.ClipsDescendants = true
                DropdownButton.Size = UDim2.new(0, 417, 0, 34)
                DropdownButton.ZIndex = 11
                DropdownButton.AutoButtonColor = false
                DropdownButton.Font = Enum.Font.SourceSans
                DropdownButton.Text = ""
                DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                DropdownButton.TextScaled = true
                DropdownButton.TextSize = 14.000
                DropdownButton.TextWrapped = true
                
                UICorner_7.Parent = DropdownButton

                Icon_3.Name = "Icon"
                Icon_3.Parent = DropdownButton
                Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Icon_3.BackgroundTransparency = 1.000
                Icon_3.Position = UDim2.new(0.0263788961, 0, -0.0294117648, 0)
                Icon_3.Size = UDim2.new(0, 34, 0, 34)
                Icon_3.Image = "http://www.roblox.com/asset/?id=7399527219"
                
                Name_4.Name = "Name"
                Name_4.Parent = DropdownButton
                Name_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Name_4.BackgroundTransparency = 1.000
                Name_4.Position = UDim2.new(0.12230216, 0, 0, 0)
                Name_4.Size = UDim2.new(0, 137, 0, 34)
                Name_4.Font = Enum.Font.SourceSansBold
                Name_4.LineHeight = 1.130
                Name_4.Text = "Dropdown"
                Name_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                Name_4.TextScaled = true
                Name_4.TextSize = 14.000
                Name_4.TextWrapped = true
                Name_4.TextXAlignment = Enum.TextXAlignment.Left

                CloseIcon.Name = "CloseIcon"
                CloseIcon.Parent = DropdownButton
                CloseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CloseIcon.BackgroundTransparency = 1.000
                CloseIcon.Position = UDim2.new(0.92086339, 0, 0.166844532, 0)
                CloseIcon.Size = UDim2.new(0, 23, 0, 19)
                CloseIcon.Font = Enum.Font.SourceSans
                CloseIcon.Text = "▲"
                CloseIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
                CloseIcon.TextScaled = true
                CloseIcon.TextSize = 14.000
                CloseIcon.TextWrapped = true

                Dropdown_Sample.Name = "Dropdown_Sample"
                Dropdown_Sample.Parent = DropdownButton
                Dropdown_Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown_Sample.BackgroundTransparency = 1.000
                Dropdown_Sample.Size = UDim2.new(0, 100, 0, 100)
                Dropdown_Sample.Image = "rbxassetid://4560909609"
                Dropdown_Sample.ImageTransparency = 0.600

                function options:NewOption(text, callback)
                    text = text or "Option"
                    callback = callback or function() end

                    local OptionContainer = Instance.new("Frame")
                    local UICorner_8 = Instance.new("UICorner")
                    local OptionFrame = Instance.new("ScrollingFrame")
                    local OptionButton = Instance.new("TextButton")
                    local UICorner_9 = Instance.new("UICorner")
                    local Option_Sample = Instance.new("ImageLabel")
                    local UIListLayout_3 = Instance.new("UIListLayout")

                    OptionContainer.Name = "OptionContainer"
                    OptionContainer.Parent = DropdownContainer
                    OptionContainer.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    OptionContainer.Position = UDim2.new(0.0167865716, 0, 0.735294104, 0)
                    OptionContainer.Size = UDim2.new(0, 402, 0, 121)
                    
                    UICorner_8.Parent = OptionContainer
                    
                    OptionFrame.Name = "OptionFrame"
                    OptionFrame.Parent = OptionContainer
                    OptionFrame.Active = true
                    OptionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    OptionFrame.BackgroundTransparency = 1.000
                    OptionFrame.BorderSizePixel = 0
                    OptionFrame.Position = UDim2.new(0, 0, 0.12396694, 0)
                    OptionFrame.Size = UDim2.new(0, 400, 0, 106)
                    OptionFrame.ScrollBarThickness = 6
                    
                    OptionButton.Name = "OptionButton"
                    OptionButton.Parent = OptionFrame
                    OptionButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                    OptionButton.ClipsDescendants = true
                    OptionButton.Position = UDim2.new(0.0387500003, 0, 0, 0)
                    OptionButton.Size = UDim2.new(0, 377, 0, 34)
                    OptionButton.AutoButtonColor = false
                    OptionButton.Font = Enum.Font.SourceSansSemibold
                    OptionButton.LineHeight = 1.120
                    OptionButton.Text = "Option 1"
                    OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    OptionButton.TextScaled = true
                    OptionButton.TextSize = 14.000
                    OptionButton.TextWrapped = true
                    
                    UICorner_9.Parent = OptionButton

                    Option_Sample.Name = "Option_Sample"
                    Option_Sample.Parent = OptionButton
                    Option_Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Option_Sample.BackgroundTransparency = 1.000
                    Option_Sample.Size = UDim2.new(0, 100, 0, 100)
                    Option_Sample.Image = "rbxassetid://4560909609"
                    Option_Sample.ImageTransparency = 0.600
                    
                    UIListLayout_3.Parent = OptionFrame
                    UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout_3.Padding = UDim.new(0, 4)
                end


                return options
            end

            return sections
        end

        return tabs
    end
    
    CFAUiLib.Parent = coreGui
    return window
end

return library
