local CFAHubLib = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local players = game:GetService("Players")
local player = players.LocalPlayer
local coreGui = game:GetService("CoreGui")
local ms = player:GetMouse()

function CFAHubLib:DraggingEnabled(frame, parent)
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

local currentTheme = {
    Background = Color3.fromRGB(67, 67, 67),
    TopbarColor = Color3.fromRGB(50, 50, 50),
    TabColor = Color3.fromRGB(58, 58, 58),
    TextColor = Color3.fromRGB(255, 255, 255),
    Button1Color = Color3.fromRGB(81, 81, 81),
    Button2Color = Color3.fromRGB(58, 58, 58),
    Icon = Color3.fromRGB(255, 255, 255),
}

local themeStyle = {
    DarkTheme = {
        Background = Color3.fromRGB(30, 30, 30),
        TopbarColor = Color3.fromRGB(0, 0, 0),
        TabColor = Color3.fromRGB(20, 20, 20),
        TextColor = Color3.fromRGB(255, 255, 255),
        Button1Color = Color3.fromRGB(61, 61, 61),
        Button2Color = Color3.fromRGB(20, 20, 20), 
        Icon = Color3.fromRGB(255, 255, 255),
    },
    LightTheme = {
        Background = Color3.fromRGB(255, 255, 255),
        TopbarColor = Color3.fromRGB(227,229,232),
        TabColor = Color3.fromRGB(242, 243, 245),
        TextColor = Color3.fromRGB(0, 0, 0),
        Button1Color = Color3.fromRGB(194, 194, 194),
        Button2Color = Color3.fromRGB(225, 225, 225),
        Icon = Color3.fromRGB(0, 0, 0),
    },
    Ocean = {
        Background = Color3.fromRGB(26, 32, 58),
        TopbarColor = Color3.fromRGB(20, 24, 38),
        TabColor = Color3.fromRGB(38, 45, 71),
        TextColor = Color3.fromRGB(255, 255, 255),
        Button1Color = Color3.fromRGB(49, 59, 93),
        Button2Color = Color3.fromRGB(38, 45, 71),
        Icon = Color3.fromRGB(49, 59, 93),
    },
    Midnight = {
        Background = Color3.fromRGB(44, 62, 82),
        TopbarColor = Color3.fromRGB(57, 81, 105),
        TabColor = Color3.fromRGB(52, 74, 95),
        TextColor = Color3.fromRGB(255, 255, 255),
        Button1Color = Color3.fromRGB(79, 113, 144),
        Button2Color = Color3.fromRGB(52, 74, 95), 
        Icon = Color3.fromRGB(79, 113, 144),
    },
    Synapse = {
        Background = Color3.fromRGB(13, 15, 12),
        TopbarColor = Color3.fromRGB(36, 38, 35),
        TabColor = Color3.fromRGB(24, 24, 24),
        TextColor = Color3.fromRGB(152, 99, 53),
        Button1Color = Color3.fromRGB(46, 48, 43),
        Button2Color = Color3.fromRGB(24, 24, 24), 
        Icon = Color3.fromRGB(255, 255, 255),
    },
}

local libName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

function CFAHubLib:ToggleUI()
    if game.CoreGui[libName].Enabled then
        game.CoreGui[libName].Enabled = false
    else
        game.CoreGui[libName].Enabled = true
    end
end

function CFAHubLib:NewWindow(title, theme)
    if not theme then
        theme = currentTheme
    end

    if theme == "DarkTheme" or "darktheme" then
        theme = themeStyle.DarkTheme
    elseif theme == "LightTheme" or "lighttheme" then
        theme = themeStyle.LightTheme
    elseif theme == "Ocean" or "ocean" then
        theme = themeStyle.Ocean
    elseif theme == "Midnight" or "midnight" then
        theme = themeStyle.Midnight
    elseif theme == "Synapse" or "synapse" then
        theme = themeStyle.Synapse
    else
        if theme.Background == nil then
            theme.Background = Color3.fromRGB(67, 67, 67)
        elseif theme.TopbarColor == nil then
            theme.TopbarColor = Color3.fromRGB(50, 50, 50)
        elseif theme.TabColor == nil then
            theme.TabColor = Color3.fromRGB(58, 58, 58)
        elseif theme.TextColor == nil then
            theme.TextColor = Color3.fromRGB(255, 255, 255)
        elseif theme.Button1Color == nil then
            theme.Button1Color = Color3.fromRGB(81, 81, 81)
        elseif theme.Button2Color == nil then
            theme.Button2Color = Color3.fromRGB(58, 58, 58)
        elseif theme.Icon == nil then
            theme.Icon = Color3.fromRGB(255, 255, 255)
        end
    end

    theme = theme or {}
    title = title or "CFA Hub Plus"
    local window = {}

    local CFAHub = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Tab = Instance.new("Frame")
    local TabFrame = Instance.new("ScrollingFrame")
    local tabListLayout = Instance.new("UIListLayout")

    local pageFrame = Instance.new("Frame")
    local Pages = Instance.new("Folder")
    local pageListLayout = Instance.new("UIListLayout")

    local Topbar = Instance.new("Frame")
    local hubText = Instance.new("TextLabel")
    local hubLogo = Instance.new("ImageLabel")
    local closeButton = Instance.new("ImageButton")
    local MinButton = Instance.new("ImageButton")

    local function UpdateSize()
        local cS = tabListLayout.AbsoluteContentSize

        game.TweenService:Create(TabFrame, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            CanvasSize = UDim2.new(0,0,0,cS.Y)
        }):Play()
    end

    UpdateSize()

    CFAHubLib:DraggingEnabled(Topbar, Background)

    CFAHub.Name = libName
    CFAHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    CFAHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Background.Name = "Background"
    Background.Parent = CFAHub
    Background.BackgroundColor3 = theme.Background
    Background.BorderSizePixel = 0
    Background.ClipsDescendants = true
    Background.Position = UDim2.new(0.0499999858, 0, 0.0500000119, 0)
    Background.Size = UDim2.new(0, 566, 0, 329)
    
    Tab.Name = "Tab"
    Tab.Parent = Background
    Tab.BackgroundColor3 = theme.TabColor
    Tab.BorderSizePixel = 0
    Tab.Position = UDim2.new(0, 0, 0.0577507615, 0)
    Tab.Size = UDim2.new(0, 159, 0, 310)
    
    TabFrame.Name = "TabFrame"
    TabFrame.Parent = Tab
    TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabFrame.BackgroundTransparency = 1.000
    TabFrame.BorderSizePixel = 0
    TabFrame.Position = UDim2.new(0, 0, 0.0193548389, 0)
    TabFrame.Size = UDim2.new(0, 159, 0, 295)
    TabFrame.ScrollBarThickness = 0

    tabListLayout.Name = "tabListLayout"
    tabListLayout.Parent = TabFrame
    tabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Padding = UDim.new(0, 4)


    pageFrame.Name = "pageFrame"
    pageFrame.Parent = Background
    pageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    pageFrame.BackgroundTransparency = 1.000
    pageFrame.BorderSizePixel = 0
    pageFrame.Position = UDim2.new(0.280918717, 0, 0.0577507615, 0)
    pageFrame.Size = UDim2.new(0, 407, 0, 310)
    
    Pages.Name = "Pages"
    Pages.Parent = pageFrame
    

    Topbar.Name = "Topbar"
    Topbar.Parent = Background
    Topbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(0, 566, 0, 19)
    
    hubText.Name = "hubText"
    hubText.Parent = Topbar
    hubText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    hubText.BackgroundTransparency = 1.000
    hubText.BorderSizePixel = 0
    hubText.Position = UDim2.new(0.0565370992, 0, 0, 0)
    hubText.Size = UDim2.new(0, 154, 0, 19)
    hubText.Font = Enum.Font.SourceSansBold
    hubText.LineHeight = 1.120
    hubText.Text = title
    hubText.TextColor3 = theme.TextColor
    hubText.TextScaled = true
    hubText.TextSize = 14.000
    hubText.TextWrapped = true
    hubText.TextXAlignment = Enum.TextXAlignment.Left
    
    hubLogo.Name = "hubLogo"
    hubLogo.Parent = Topbar
    hubLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    hubLogo.BorderSizePixel = 0
    hubLogo.Position = UDim2.new(0.0123674907, 0, 0, 0)
    hubLogo.Size = UDim2.new(0, 19, 0, 19)
    hubLogo.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    
    closeButton.Name = "closeButton"
    closeButton.Parent = Topbar
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundTransparency = 1.000
    closeButton.BorderSizePixel = 0
    closeButton.Position = UDim2.new(0.944008768, 0, 0, 0)
    closeButton.Size = UDim2.new(0, 19, 0, 19)
    closeButton.Image = "http://www.roblox.com/asset/?id=7409394566"
    closeButton.MouseButton1Click:Connect(function()
        CFAHub:Destroy()
    end)
    
    MinButton.Name = "MinButton"
    MinButton.Parent = Topbar
    MinButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinButton.BorderSizePixel = 0
    MinButton.Position = UDim2.new(0.898072362, 0, 0, 0)
    MinButton.Size = UDim2.new(0, 19, 0, 19)
    MinButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

    coroutine.wrap(function()
        while wait() do
            Background.BackgroundColor3 = theme.Background
            hubText.TextColor3 = theme.TextColor
            Tab.BackgroundColor3 = theme.Button1Color
        end
    end)()
    
    function window:NewTab(tabName)
        tabName = tabName or "Tab"
        local tabs = {}

        local tabButton = Instance.new("TextButton")
        local TabBtnCorner = Instance.new("UICorner")

        local pageContainer = Instance.new("ScrollingFrame")

        tabButton.Name = tabName.."Button"
        tabButton.Parent = TabFrame
        tabButton.BackgroundColor3 = theme.Button1Color
        tabButton.Position = UDim2.new(0.0754716992, 0, 0, 0)
        tabButton.Size = UDim2.new(0, 144, 0, 28)
        tabButton.Font = Enum.Font.SourceSansSemibold
        tabButton.LineHeight = 1.120
        tabButton.Text = tabName
        tabButton.TextColor3 = theme.TextColor
        tabButton.TextScaled = true
        tabButton.TextSize = 14.000
        tabButton.AutoButtonColor = false
        tabButton.TextWrapped = true
        
        TabBtnCorner.Name = "TabBtnCorner"
        TabBtnCorner.Parent = tabButton

        pageContainer.Name = tabName.."Container"
        pageContainer.Parent = Pages
        pageContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        pageContainer.BackgroundTransparency = 1.000
        pageContainer.BorderSizePixel = 0
        pageContainer.Position = UDim2.new(0, 0, 0.0193548389, 0)
        pageContainer.Size = UDim2.new(1, 0, 0.954838693, 0)
        pageContainer.ScrollBarThickness = 5

        pageListLayout.Name = "pageListLayout"
        pageListLayout.Parent = pageContainer
        pageListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        pageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        pageListLayout.Padding = UDim.new(0, 4)

        coroutine.wrap(function()
            while wait() do
                tabButton.TextColor3 = theme.TextColor
                tabButton.BackgroundColor3 = theme.Button1Color
            end
        end)()

        function tabs:NewSection(sectionName)
            sectionName = sectionName or "Section"
            local functions = {}

            local SectionFrame = Instance.new("Frame")
            local SectionHeader = Instance.new("Frame")
            local SectionTitle = Instance.new("TextLabel")
            local sCorner = Instance.new("UICorner")
            local SectionInners = Instance.new("Frame")
            local sInnersListLayout = Instance.new("UIListLayout")
            local sListLayout = Instance.new("UIListLayout")

            SectionFrame.Name = "SectionFrame"
            SectionFrame.Parent = pageContainer
            SectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionFrame.BackgroundTransparency = 1.000
            SectionFrame.Position = UDim2.new(0.03071253, 0, 0, 0)
            SectionFrame.Size = UDim2.new(0, 378, 0, 323)
            
            SectionHeader.Name = "SectionHeader"
            SectionHeader.Parent = SectionFrame
            SectionHeader.BackgroundColor3 = theme.Button1Color
            SectionHeader.Position = UDim2.new(0, 0, -0.0184298772, 0)
            SectionHeader.Size = UDim2.new(1, 0, 0, 33)
            SectionHeader.ZIndex = 2
            
            SectionTitle.Name = "SectionTitle"
            SectionTitle.Parent = SectionHeader
            SectionTitle.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
            SectionTitle.BackgroundTransparency = 1.000
            SectionTitle.Size = UDim2.new(1, 0, 1, 0)
            SectionTitle.Font = Enum.Font.SourceSansSemibold
            SectionTitle.LineHeight = 1.120
            SectionTitle.Text = " "..sectionName
            SectionTitle.TextColor3 = theme.TextColor
            SectionTitle.TextScaled = true
            SectionTitle.TextSize = 14.000
            SectionTitle.TextWrapped = true
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            sCorner.Name = "sCorner"
            sCorner.Parent = SectionHeader
            
            SectionInners.Name = "SectionInners"
            SectionInners.Parent = SectionFrame
            SectionInners.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionInners.BackgroundTransparency = 1.000
            SectionInners.Position = UDim2.new(0, 0, 0.114551082, 0)
            SectionInners.Size = UDim2.new(1, 0, 0, 285)

            sInnersListLayout.Name = "sInnersListLayout"
            sInnersListLayout.Parent = SectionInners
            sInnersListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            sInnersListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            sInnersListLayout.Padding = UDim.new(0, 4)

            sListLayout.Name = "sListLayout"
            sListLayout.Parent = SectionFrame
            sListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            sListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            sListLayout.Padding = UDim.new(0, 4)

            function functions:CreateButton(btnTitle, callback)
                btnTitle = btnTitle or "Button"
                callback = callback or function() end

                local Button = Instance.new("TextButton")
                local ButtonCorner = Instance.new("UICorner")
                local ButtonIcon = Instance.new("ImageLabel")
                local ButtonTittle = Instance.new("TextLabel")

                Button.Name = "Button"
                Button.Parent = SectionInners
                Button.BackgroundColor3 = theme.Button2Color
                Button.Size = UDim2.new(0, 378, 0, 33)
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
                ButtonIcon.BackgroundColor3 = theme.Icon
                ButtonIcon.BackgroundTransparency = 1.000
                ButtonIcon.Position = UDim2.new(0.0502645522, 0, 0.4909091, 0)
                ButtonIcon.Size = UDim2.new(0, 21, 0, 21)
                ButtonIcon.Image = "rbxassetid://3926305904"
                ButtonIcon.ImageRectOffset = Vector2.new(84, 204)
                ButtonIcon.ImageRectSize = Vector2.new(36, 36)
                
                ButtonTittle.Name = "ButtonTittle"
                ButtonTittle.Parent = Button
                ButtonTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonTittle.BackgroundTransparency = 1.000
                ButtonTittle.Position = UDim2.new(0.100529104, 0, 0.0303030312, 0)
                ButtonTittle.Size = UDim2.new(0, 145, 0, 30)
                ButtonTittle.Font = Enum.Font.SourceSansSemibold
                ButtonTittle.LineHeight = 1.120
                ButtonTittle.Text = btnTitle
                ButtonTittle.TextColor3 = theme.TextColor
                ButtonTittle.TextScaled = true
                ButtonTittle.TextSize = 14.000
                ButtonTittle.TextWrapped = true
                ButtonTittle.TextXAlignment = Enum.TextXAlignment.Left

                Button.MouseButton1Click:Connect(function()
                    pcall(callback)
                end)

            end

            function functions:CreateDropdown(dropdownTitle, list, callback)
                dropdownTitle = dropdownTitle or "Dropdown"
                list = list or {}
                callback = callback or function() end

                local Dropdown = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local DropButton = Instance.new("TextButton")
                local DropCorner = Instance.new("UICorner")
                local DropIcon = Instance.new("ImageLabel")
                local DropTittle = Instance.new("TextLabel")

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = SectionInners
                Dropdown.BackgroundColor3 = theme.Button2Color
                Dropdown.BackgroundTransparency = 1.000
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(1, 0, 0, 68)
                
                UIListLayout.Parent = Dropdown
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 3)
                
                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                DropButton.Size = UDim2.new(0, 378, 0, 33)
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
                DropIcon.BackgroundColor3 = theme.Icon
                DropIcon.BackgroundTransparency = 1.000
                DropIcon.Position = UDim2.new(0.0208994709, 0, 0.157666653, 0)
                DropIcon.Size = UDim2.new(0, 21, 0, 21)
                DropIcon.Image = "rbxassetid://3926305904"
                DropIcon.ImageRectOffset = Vector2.new(284, 684)
                DropIcon.ImageRectSize = Vector2.new(36, 36)
                
                DropTittle.Name = "DropTittle"
                DropTittle.Parent = DropButton
                DropTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropTittle.BackgroundTransparency = 1.000
                DropTittle.Position = UDim2.new(0.100529097, 0, 0.0303030312, 0)
                DropTittle.Size = UDim2.new(0, 145, 0, 30)
                DropTittle.Font = Enum.Font.SourceSansSemibold
                DropTittle.LineHeight = 1.120
                DropTittle.Text = dropdownTitle
                DropTittle.TextColor3 = theme.TextColor
                DropTittle.TextScaled = true
                DropTittle.TextSize = 14.000
                DropTittle.TextWrapped = true
                DropTittle.TextXAlignment = Enum.TextXAlignment.Left
                
                

                for i, v in next, list do
                    local OptionSelect = Instance.new("TextButton")
                    local OptionCorner = Instance.new("UICorner")

                    OptionSelect.Name = "OptionSelect"
                    OptionSelect.Parent = Dropdown
                    OptionSelect.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    OptionSelect.Position = UDim2.new(0.0119047621, 0, 0.342857152, 0)
                    OptionSelect.Size = UDim2.new(0, 356, 0, 33)
                    OptionSelect.Font = Enum.Font.SourceSansSemibold
                    OptionSelect.LineHeight = 1.120
                    OptionSelect.Text = " "..v
                    OptionSelect.TextColor3 = theme.TextColor
                    OptionSelect.TextSize = 28.000
                    OptionSelect.TextWrapped = true
                    OptionSelect.AutoButtonColor = false
                    OptionSelect.TextXAlignment = Enum.TextXAlignment.Left
                    
                    OptionCorner.Name = "OptionCorner"
                    OptionCorner.Parent = OptionSelect
                end

            end

            return functions
        end

        return tabs
    end

    CFAHub.Parent = coreGui
    return window
end


-- Gui to Lua
-- Version: 3.2

-- Instances:
--[[


local Toggle = Instance.new("TextButton")
local ToggleCorner = Instance.new("UICorner")
local ToggleEnabled = Instance.new("ImageLabel")
local ToggleTittle = Instance.new("TextLabel")
local ToggleDisabled = Instance.new("ImageLabel")
local Keybind = Instance.new("TextButton")
local kBindCorner = Instance.new("UICorner")
local kBindIcon = Instance.new("ImageLabel")
local kBindTitle = Instance.new("TextLabel")
local kBindKey = Instance.new("TextLabel")
local Textbox = Instance.new("TextButton")
local TextboxCorner = Instance.new("UICorner")
local TextboxIcon = Instance.new("ImageLabel")
local TextboxTittle = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local Slider = Instance.new("TextButton")
local SliderCorner = Instance.new("UICorner")
local SliderIcon = Instance.new("ImageLabel")
local SliderTittle = Instance.new("TextLabel")
local SliderVal = Instance.new("TextLabel")
local SliderBtn = Instance.new("TextButton")
local SliderBtnCorner = Instance.new("UICorner")
local SliderBar = Instance.new("Frame")
local BarCorner = Instance.new("UICorner")

--Properties:





Toggle.Name = "Toggle"
Toggle.Parent = SectionInners
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Toggle.Size = UDim2.new(0, 378, 0, 33)
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
ToggleEnabled.Position = UDim2.new(0.0502645522, 0, 0.4909091, 0)
ToggleEnabled.Size = UDim2.new(0, 21, 0, 21)
ToggleEnabled.Visible = false
ToggleEnabled.Image = "rbxassetid://3926309567"
ToggleEnabled.ImageRectOffset = Vector2.new(784, 420)
ToggleEnabled.ImageRectSize = Vector2.new(48, 48)

ToggleTittle.Name = "ToggleTittle"
ToggleTittle.Parent = Toggle
ToggleTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleTittle.BackgroundTransparency = 1.000
ToggleTittle.Position = UDim2.new(0.100529104, 0, 0.0303030312, 0)
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
ToggleDisabled.Position = UDim2.new(0.0502645522, 0, 0.4909091, 0)
ToggleDisabled.Size = UDim2.new(0, 21, 0, 21)
ToggleDisabled.Image = "rbxassetid://3926309567"
ToggleDisabled.ImageRectOffset = Vector2.new(628, 420)
ToggleDisabled.ImageRectSize = Vector2.new(48, 48)

Keybind.Name = "Keybind"
Keybind.Parent = SectionInners
Keybind.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Keybind.Size = UDim2.new(0, 378, 0, 33)
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
kBindIcon.Position = UDim2.new(0.0502645522, 0, 0.4909091, 0)
kBindIcon.Size = UDim2.new(0, 21, 0, 21)
kBindIcon.Image = "rbxassetid://3926305904"
kBindIcon.ImageRectOffset = Vector2.new(724, 444)
kBindIcon.ImageRectSize = Vector2.new(36, 36)

kBindTitle.Name = "kBindTitle"
kBindTitle.Parent = Keybind
kBindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
kBindTitle.BackgroundTransparency = 1.000
kBindTitle.Position = UDim2.new(0.100529104, 0, 0.0303030312, 0)
kBindTitle.Size = UDim2.new(0, 145, 0, 30)
kBindTitle.Font = Enum.Font.SourceSansSemibold
kBindTitle.LineHeight = 1.120
kBindTitle.Text = "Keybind"
kBindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
kBindTitle.TextScaled = true
kBindTitle.TextSize = 14.000
kBindTitle.TextWrapped = true
kBindTitle.TextXAlignment = Enum.TextXAlignment.Left

kBindKey.Name = "kBindKey"
kBindKey.Parent = Keybind
kBindKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
kBindKey.BackgroundTransparency = 1.000
kBindKey.Position = UDim2.new(0.592592597, 0, 0.0303030312, 0)
kBindKey.Size = UDim2.new(0, 145, 0, 30)
kBindKey.Font = Enum.Font.SourceSansSemibold
kBindKey.LineHeight = 1.120
kBindKey.Text = "F "
kBindKey.TextColor3 = Color3.fromRGB(255, 255, 255)
kBindKey.TextSize = 23.000
kBindKey.TextWrapped = true
kBindKey.TextXAlignment = Enum.TextXAlignment.Right

Textbox.Name = "Textbox"
Textbox.Parent = SectionInners
Textbox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Textbox.Size = UDim2.new(0, 378, 0, 33)
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
TextboxIcon.Position = UDim2.new(0.0502645522, 0, 0.4909091, 0)
TextboxIcon.Size = UDim2.new(0, 21, 0, 21)
TextboxIcon.Image = "rbxassetid://3926305904"
TextboxIcon.ImageRectOffset = Vector2.new(284, 644)
TextboxIcon.ImageRectSize = Vector2.new(36, 36)

TextboxTittle.Name = "TextboxTittle"
TextboxTittle.Parent = Textbox
TextboxTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextboxTittle.BackgroundTransparency = 1.000
TextboxTittle.Position = UDim2.new(0.100529104, 0, 0.0303030312, 0)
TextboxTittle.Size = UDim2.new(0, 145, 0, 30)
TextboxTittle.Font = Enum.Font.SourceSansSemibold
TextboxTittle.LineHeight = 1.120
TextboxTittle.Text = "Textbox"
TextboxTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
TextboxTittle.TextScaled = true
TextboxTittle.TextSize = 14.000
TextboxTittle.TextWrapped = true
TextboxTittle.TextXAlignment = Enum.TextXAlignment.Left

TextBox.Parent = Textbox
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.Position = UDim2.new(0.449708998, 0, 0.242696971, 0)
TextBox.Size = UDim2.new(0, 200, 0, 14)
TextBox.Font = Enum.Font.SourceSans
TextBox.LineHeight = 1.120
TextBox.PlaceholderText = "Type here!"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

UICorner.Parent = TextBox

Slider.Name = "Slider"
Slider.Parent = SectionInners
Slider.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Slider.Size = UDim2.new(0, 378, 0, 33)
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
SliderIcon.Position = UDim2.new(0.0502645522, 0, 0.4909091, 0)
SliderIcon.Size = UDim2.new(0, 21, 0, 21)
SliderIcon.Image = "rbxassetid://3926307971"
SliderIcon.ImageRectOffset = Vector2.new(404, 164)
SliderIcon.ImageRectSize = Vector2.new(36, 36)

SliderTittle.Name = "SliderTittle"
SliderTittle.Parent = Slider
SliderTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderTittle.BackgroundTransparency = 1.000
SliderTittle.Position = UDim2.new(0.100529097, 0, 0.0303030312, 0)
SliderTittle.Size = UDim2.new(0, 119, 0, 30)
SliderTittle.Font = Enum.Font.SourceSansSemibold
SliderTittle.LineHeight = 1.120
SliderTittle.Text = "Slider"
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
SliderVal.Text = "0"
SliderVal.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderVal.TextScaled = true
SliderVal.TextSize = 14.000
SliderVal.TextTransparency = 0.580
SliderVal.TextWrapped = true

SliderBtn.Name = "SliderBtn"
SliderBtn.Parent = Slider
SliderBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SliderBtn.Position = UDim2.new(0.505290985, 0, 0.363636374, 0)
SliderBtn.Size = UDim2.new(0, 178, 0, 8)
SliderBtn.Font = Enum.Font.SourceSans
SliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
SliderBtn.TextSize = 14.000

SliderBtnCorner.Name = "SliderBtnCorner"
SliderBtnCorner.Parent = SliderBtn

SliderBar.Name = "SliderBar"
SliderBar.Parent = SliderBtn
SliderBar.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
SliderBar.Size = UDim2.new(0, 178, 0, 8)

BarCorner.Name = "BarCorner"
BarCorner.Parent = SliderBar


]]

return CFAHubLib