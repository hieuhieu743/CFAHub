--[[

 Version: 3.2

--]]

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
    local window = {}

    --Sample
    local Sample = Instance.new("ImageLabel")

    Sample.Name = "Sample"
    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sample.BackgroundTransparency = 1.000
    Sample.Position = UDim2.new(0.0128205121, 0, 0.327840537, 0)
    Sample.Size = UDim2.new(0, 50, 0, 50)
    Sample.Image = "rbxassetid://4560909609"
    Sample.ImageTransparency = 0.600

    local CFAHub = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Tab = Instance.new("Frame")
    local TabFrame = Instance.new("ScrollingFrame")
    local tabListLayout = Instance.new("UIListLayout")

    local Topbar = Instance.new("Frame")
    local hubText = Instance.new("TextLabel")
    local hubLogo = Instance.new("ImageLabel")
    local closeButton = Instance.new("ImageButton")
    local MinButton = Instance.new("ImageButton")
    

    local pageFrame = Instance.new("Frame")
    local Pages = Instance.new("Folder")

    local function UpdateSize()
        local cS = tabListLayout.AbsoluteContentSize

        game.TweenService:Create(TabFrame, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            CanvasSize = UDim2.new(0,0,0,cS.Y)
        }):Play()
    end

    UpdateSize()

    library:DraggingEnabled(Topbar, Background)

    CFAHub.Name = "CFA Hub"
    CFAHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Background.Name = "Background"
    Background.Parent = CFAHub
    Background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Background.BorderSizePixel = 0
    Background.ClipsDescendants = true
    Background.Position = UDim2.new(0.0499999858, 0, 0.0500000119, 0)
    Background.Size = UDim2.new(0, 566, 0, 329)
    
    Tab.Name = "Tab"
    Tab.Parent = Background
    Tab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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

    -- Topbar
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
    hubText.Text = "CFA Hub Upgrade"
    hubText.TextColor3 = Color3.fromRGB(255, 255, 255)
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
    hubLogo.Image = "http://www.roblox.com/asset/?id=7409401226"
    
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

    -- Pages
    pageFrame.Name = "pageFrame"
    pageFrame.Parent = Background
    pageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    pageFrame.BackgroundTransparency = 1.000
    pageFrame.BorderSizePixel = 0
    pageFrame.Position = UDim2.new(0.280918717, 0, 0.0577507615, 0)
    pageFrame.Size = UDim2.new(0, 407, 0, 310)
    
    Pages.Name = "Pages"
    Pages.Parent = pageFrame

    local first = true

    function window:NewTab(tabName)
        tabName = tabName or "Tab"
        local tabElements = {}

        local tabButton = Instance.new("TextButton")
        local TabBtnCorner = Instance.new("UICorner")

        local pageContainer = Instance.new("ScrollingFrame")

        UpdateSize()

        tabButton.Name = tabName.."Button"
        tabButton.Parent = TabFrame
        tabButton.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
        tabButton.Position = UDim2.new(0.0754716992, 0, 0, 0)
        tabButton.Size = UDim2.new(0, 144, 0, 28)
        tabButton.Font = Enum.Font.SourceSansSemibold
        tabButton.LineHeight = 1.120
        tabButton.Text = tabName
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.TextScaled = true
        tabButton.TextSize = 14.000
        tabButton.AutoButtonColor = false
        tabButton.TextWrapped = true
        
        TabBtnCorner.Name = "TabBtnCorner"
        TabBtnCorner.Parent = tabButton

        -- PageContainer
        pageContainer.Name = tabName.."Container"
        pageContainer.Parent = Pages
        pageContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        pageContainer.BackgroundTransparency = 1.000
        pageContainer.BorderSizePixel = 0
        pageContainer.Position = UDim2.new(0, 0, 0.0193548389, 0)
        pageContainer.Size = UDim2.new(1, 0, 0.954838693, 0)
        pageContainer.ScrollBarThickness = 5

        local pageListLayout = Instance.new("UIListLayout")
        
        pageListLayout.Name = "pageListLayout"
        pageListLayout.Parent = pageContainer
        pageListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        pageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        pageListLayout.Padding = UDim.new(0, 4)

        if first then
            first = false
            pageContainer.Visible = true
            tabButton.BackgroundTransparency = 0
            UpdateSize()
        else
            pageContainer.Visible = false
            tabButton.BackgroundTransparency = 1
        end

        tabButton.MouseButton1Click:Connect(function()
            for i, v in next, Pages:GetChildren() do
                v.Visible = false
            end
            pageContainer.Visible = true
            for i, v in next, TabFrame:GetChildren() do
                if v:IsA("TextButton") then
                    Utility:TweenObject(v, {BackgroundTransparency = 1}, 0.2)
                end
            end
            Utility:TweenObject(tabButton, {BackgroundTransparency = 0}, 0.2)
        end)

        function tabElements:NewSection(secName)
            UpdateSize()
            secName = secName or "Section"
            local sectionElements = {}
            
            -- Frame
            local SectionFrame = Instance.new("Frame")
            local sListLayout = Instance.new("UIListLayout")

            SectionFrame.Name = "SectionFrame"
            SectionFrame.Parent = pageContainer
            SectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionFrame.BackgroundTransparency = 1.000
            SectionFrame.Position = UDim2.new(0.03071253, 0, 0, 0)
            SectionFrame.Size = UDim2.new(0, 378, 0, 323)

            sListLayout.Name = "sListLayout"
            sListLayout.Parent = SectionFrame
            sListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            sListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            sListLayout.Padding = UDim.new(0, 4)

            -- Header
            local SectionHeader = Instance.new("Frame")
            local SectionTitle = Instance.new("TextLabel")
            local sCorner = Instance.new("UICorner")

            SectionHeader.Name = "SectionHeader"
            SectionHeader.Parent = SectionFrame
            SectionHeader.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
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
            SectionTitle.Text = " "..secName
            SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.TextScaled = true
            SectionTitle.TextSize = 14.000
            SectionTitle.TextWrapped = true
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

            sCorner.Name = "sCorner"
            sCorner.Parent = SectionHeader

            -- Inners
            local SectionInners = Instance.new("Frame")
            local sInnersListLayout = Instance.new("UIListLayout")

            local function UpdateSection()
                local innerLayout = sInnersListLayout.AbsoluteContentSize
                SectionInners.Size = UDim2.new(1, 0, 0, innerLayout.Y)
                local sectionFrameLayout = sListLayout.AbsoluteContentSize
                SectionFrame.Size = UDim2.new(0, 378, 0, sectionFrameLayout.Y)
            end

            UpdateSection()

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

            function sectionElements:CreateButton(title, callback)
                UpdateSection()
                title = title or "Button"
                callback = callback or function() end

                local Button = Instance.new("TextButton")
                local ButtonCorner = Instance.new("UICorner")
                local ButtonIcon = Instance.new("ImageLabel")
                local ButtonTittle = Instance.new("TextLabel")

                Button.Name = "Button"
                Button.Parent = SectionInners
                Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                Button.Size = UDim2.new(0, 378, 0, 33)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.SourceSans
                Button.Text = ""
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.TextScaled = true
                Button.TextSize = 14.000
                Button.TextWrapped = true
                Button.ClipsDescendants = true
                
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.Parent = Button
                
                ButtonIcon.Name = "ButtonIcon"
                ButtonIcon.Parent = Button
                ButtonIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
                ButtonTittle.Text = title
                ButtonTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonTittle.TextScaled = true
                ButtonTittle.TextSize = 14.000
                ButtonTittle.TextWrapped = true
                ButtonTittle.TextXAlignment = Enum.TextXAlignment.Left

                local focusing = false
                local hovering

                Button.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                        }):Play()
                        hovering = true
                    end
                end)
                Button.MouseLeave:Connect(function()
                    if not focusing then 
                        game.TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        }):Play()
                        hovering = false
                    end
                end)


                UpdateSize()
                
                Button.MouseButton1Click:Connect(function()
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

                    pcall(callback)
                end)
            end -- Done

            function sectionElements:CreateToggle(togName, callback)
                UpdateSection()
                togName = togName or "Toggle"
                callback = callback or function() end

                local Toggle = Instance.new("TextButton")
                local ToggleCorner = Instance.new("UICorner")
                local ToggleEnabled = Instance.new("ImageLabel")
                local ToggleTittle = Instance.new("TextLabel")
                local ToggleDisabled = Instance.new("ImageLabel")

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
                Toggle.ClipsDescendants = true
                
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.Parent = Toggle
                
                ToggleEnabled.Name = "ToggleEnabled"
                ToggleEnabled.Parent = Toggle
                ToggleEnabled.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleEnabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleEnabled.BackgroundTransparency = 1.000
                ToggleEnabled.Position = UDim2.new(0.0502645522, 0, 0.4909091, 0)
                ToggleEnabled.Size = UDim2.new(0, 21, 0, 21)
                ToggleEnabled.ImageTransparency = 1
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
                ToggleTittle.Text = togName
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

                local focusing = false
                local hovering

                Toggle.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(Toggle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                        }):Play()
                        hovering = true
                    end
                end)
                Toggle.MouseLeave:Connect(function()
                    if not focusing then 
                        game.TweenService:Create(Toggle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        }):Play()
                        hovering = false
                    end
                end)

                local toggled = false

                local img = ToggleEnabled

                UpdateSize()

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
                            ImageTransparency = 1
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
            end -- Done

            function sectionElements:CreateSlider(silName, minvalue, maxvalue, callback)
                UpdateSection()
                silName = silName or "Slider"
                maxvalue = maxvalue or 100
                minvalue = minvalue or 1
                callback = callback or function() end

                local Slider = Instance.new("TextButton")
                local SliderCorner = Instance.new("UICorner")
                local SliderIcon = Instance.new("ImageLabel")
                local SliderTittle = Instance.new("TextLabel")
                local SliderVal = Instance.new("TextLabel")
                local SliderBtn = Instance.new("TextButton")
                local SliderBtnCorner = Instance.new("UICorner")
                local SliderBar = Instance.new("Frame")
                local BarCorner = Instance.new("UICorner")

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
                SliderTittle.Text = silName
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
                SliderVal.Text = minvalue
                SliderVal.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderVal.TextScaled = true
                SliderVal.TextSize = 14.000
                SliderVal.TextWrapped = true
                
                SliderBtn.Name = "SliderBtn"
                SliderBtn.Parent = Slider
                SliderBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                SliderBtn.Position = UDim2.new(0.505290985, 0, 0.363636374, 0)
                SliderBtn.Size = UDim2.new(0, 178, 0, 8)
                SliderBtn.AutoButtonColor = false
                SliderBtn.Font = Enum.Font.SourceSans
                SliderBtn.Text = ""
                SliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderBtn.TextSize = 14.000
                
                SliderBtnCorner.Name = "SliderBtnCorner"
                SliderBtnCorner.Parent = SliderBtn
                
                SliderBar.Name = "SliderBar"
                SliderBar.Parent = SliderBtn
                SliderBar.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
                SliderBar.Size = UDim2.new(0, 0, 0, 8)
                
                BarCorner.Name = "BarCorner"
                BarCorner.Parent = SliderBar


                local focusing = false
                local hovering

                Slider.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(Slider, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                        }):Play()
                        hovering = true
                    end
                end)
                Slider.MouseLeave:Connect(function()
                    if not focusing then 
                        game.TweenService:Create(Slider, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        }):Play()
                        hovering = false
                    end
                end)

                local Value
                local moveconnection
                local releaseconnection

                SliderBtn.MouseButton1Down:Connect(function()
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 178) * SliderBar.AbsoluteSize.X) + tonumber(minvalue)) or 0
                        pcall(function()
                            callback(Value)
                        end)
                        SliderBar.Size = UDim2.new(0, math.clamp(ms.X - SliderBar.AbsolutePosition.X, 0, 178), 0, 8)
                        moveconnection = ms.Move:Connect(function()
                            SliderVal.Text = Value
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 178) * SliderBar.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                        callback(Value)
                    end)
                    SliderBar.Size = UDim2.new(0, math.clamp(ms.X - SliderBar.AbsolutePosition.X, 0, 178), 0, 8)
                    end)
                    releaseconnection = input.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 178) * SliderBar.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                            callback(Value)
                        end)
                        SliderBar.Size = UDim2.new(0, math.clamp(ms.X - SliderBar.AbsolutePosition.X, 0, 178), 0, 8)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
            end -- Number Issues 178, 8

            function sectionElements:CreateTextbox(textName, callback)
                UpdateSection()
                textName = textName or "Textbox"
                callback = callback or function() end

                local Textbox = Instance.new("TextButton")
                local TextboxCorner = Instance.new("UICorner")
                local TextboxIcon = Instance.new("ImageLabel")
                local TextboxTittle = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                local UICorner = Instance.new("UICorner")

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
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.TextSize = 14.000

                local focusing = false
                local hovering

                Textbox.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(Textbox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                        }):Play()
                        hovering = true
                    end
                end)
                Textbox.MouseLeave:Connect(function()
                    if not focusing then 
                        game.TweenService:Create(Textbox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        }):Play()
                        hovering = false
                    end
                end)

                TextBox.FocusLost:Connect(function(enterPressed)
                    if not enterPressed then
                        return
                    else
                        callback(TextBox.Text)
                        wait(0.18)
                        TextBox.Text = ""
                    end
                end)
                
                UICorner.Parent = TextBox
            end -- Done

            function sectionElements:CreateKeybind(keyName, key, callback)
                UpdateSection()
                keyName = keyName or "Keybind"
                callback = callback or function() end

                local oldKey = key.Name

                local Keybind = Instance.new("TextButton")
                local kBindCorner = Instance.new("UICorner")
                local kBindIcon = Instance.new("ImageLabel")
                local kBindTitle = Instance.new("TextLabel")
                local kBindKey = Instance.new("TextLabel")

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
                Keybind.ClipsDescendants = true
                
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
                kBindTitle.Text = keyName
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
                kBindKey.Text = oldKey
                kBindKey.TextColor3 = Color3.fromRGB(255, 255, 255)
                kBindKey.TextSize = 23.000
                kBindKey.TextWrapped = true
                kBindKey.TextXAlignment = Enum.TextXAlignment.Right

                local focusing = false
                local hovering

                Keybind.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(Keybind, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                        }):Play()
                        hovering = true
                    end
                end)
                Keybind.MouseLeave:Connect(function()
                    if not focusing then 
                        game.TweenService:Create(Keybind, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        }):Play()
                        hovering = false
                    end
                end)

                Keybind.MouseButton1Click:Connect(function()
                    kBindKey.Text = ". . ."
                    local a, b = game:GetService("UserInputService").InputBegan:wait()
                    if a.KeyCode.Name ~= "Unknown" then
                        kBindKey.Text = a.KeyCode.Name
                        oldKey = a.KeyCode.Name;
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

                game:GetService("UserInputService").InputBegan:connect(function(input, ok) 
                    if not ok then 
                        if input.KeyCode.Name == oldKey then 
                            callback()
                        end
                    end
                end)

            end -- Done

            function sectionElements:CreateDropdown(dropName, list, callback)
                UpdateSection()
                dropName = dropName or "Dropdown"
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
                Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown.BackgroundTransparency = 1.000
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(1, 0, 0, 33)
                
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
                DropButton.ClipsDescendants = true
                
                DropCorner.Name = "DropCorner"
                DropCorner.Parent = DropButton
                
                DropIcon.Name = "DropIcon"
                DropIcon.Parent = DropButton
                DropIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropIcon.BackgroundTransparency = 1.000
                DropIcon.Position = UDim2.new(0.0208994709, 0, 0.157666653, 0)
                DropIcon.Size = UDim2.new(0, 21, 0, 21)
                DropIcon.Image = "rbxassetid://3926305904"
                DropIcon.ImageRectOffset = Vector2.new(284, 684)
                DropIcon.ImageRectSize = Vector2.new(36, 36)
                
                DropTittle.Name = "DropTitle"
                DropTittle.Parent = DropButton
                DropTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropTittle.BackgroundTransparency = 1.000
                DropTittle.Position = UDim2.new(0.100529097, 0, 0.0303030312, 0)
                DropTittle.Size = UDim2.new(0, 145, 0, 30)
                DropTittle.Font = Enum.Font.SourceSansSemibold
                DropTittle.LineHeight = 1.120
                DropTittle.Text = dropName
                DropTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
                DropTittle.TextScaled = true
                DropTittle.TextSize = 14.000
                DropTittle.TextWrapped = true
                DropTittle.TextXAlignment = Enum.TextXAlignment.Left

                local focusing = false
                local hovering

                DropButton.MouseEnter:Connect(function()
                    if not focusing then
                        game.TweenService:Create(DropButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                        }):Play()
                        hovering = true
                    end
                end)
                DropButton.MouseLeave:Connect(function()
                    if not focusing then 
                        game.TweenService:Create(DropButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        }):Play()
                        hovering = false
                    end
                end)

                local isDropping = false

                DropButton.MouseButton1Click:Connect(function()
                    if isDropping then
                        isDropping = false

                        Dropdown:TweenSize(UDim2.new(1, 0, 0, 33), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                        wait(0.1)
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



                        UpdateSize()
                    else
                        isDropping = true

                        Dropdown:TweenSize(UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                        wait(0.1)
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
        
                        UpdateSize()
                    end
                end)

                for i, v in next, list do
                    local OptionSelect = Instance.new("TextButton")
                    local OptionCorner = Instance.new("UICorner")
                    
                    OptionSelect.Name = "OptionSelect"
                    OptionSelect.Parent = Dropdown
                    OptionSelect.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    OptionSelect.Position = UDim2.new(0.0119047621, 0, 0.342857152, 0)
                    OptionSelect.Size = UDim2.new(0, 356, 0, 33)
                    OptionSelect.AutoButtonColor = false
                    OptionSelect.Font = Enum.Font.SourceSansSemibold
                    OptionSelect.LineHeight = 1.120
                    OptionSelect.Text = " "..v
                    OptionSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
                    OptionSelect.TextSize = 28.000
                    OptionSelect.TextWrapped = true
                    OptionSelect.TextXAlignment = Enum.TextXAlignment.Left
                    
                    OptionCorner.Name = "OptionCorner"
                    OptionCorner.Parent = OptionSelect

                    local focusing = false
                    local hovering
    
                    OptionSelect.MouseEnter:Connect(function()
                        if not focusing then
                            game.TweenService:Create(OptionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                            }):Play()
                            hovering = true
                        end
                    end)
                    OptionSelect.MouseLeave:Connect(function()
                        if not focusing then 
                            game.TweenService:Create(OptionSelect, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            }):Play()
                            hovering = false
                        end
                    end)

                    OptionSelect.MouseButton1Click:Connect(function()
                        UpdateSize()

                        isDropping = false
                        callback(v)
                        DropTittle.Text = v

                        Dropdown:TweenSize(UDim2.new(1, 0, 0, 33), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                        wait(0.1)
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
                
                

            end -- Done

            return sectionElements
        end

        return tabElements
    end

    CFAHub.Parent = coreGui
    return window
end


return library