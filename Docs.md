# CFA UI Library
**Warning: The UI Library not done yet!**
*UI Library version: 3.5*

## Methods

### Getting Loadstring
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/hieuhieu743/CFAHub/main/main.lua"))
```

### Creating UI Library Window
```lua
local Window = Library:CreateWindow("title")
```
require: Library

### Creating Tabs
```lua
local Tab = Window:CreateTab("TabName")
```
require: Window

### Creating Section
```lua
local Section = Tab:CreateSection("SectionName")
```
require: Tab

### Creating Buttons
```lua
local Button = Section:CreateButton("ButtonText", function()
    -- Function here
end)
```
#### Or
```lua
Section:CreateButton("ButtonText", function()
    -- Function here
end)
```
require: Section
**STATUS:** Done

### Creating Toggles
```lua
local Toggle = Section:CreateToggle("ToggleText", function(state)
    if state then
        -- On Function here
    else
        -- Off Function here
    end
end)
```
#### Or
```lua
Section:CreateToggle("ToggleText", function(state)
    if state then
        -- On Function here
    else
        -- Off Function here
    end
end)
```
require: Section
**STATUS:** Done

### Creating Sliders
```lua
local Slider = Section:CreateSlider("SilderText", minValue, maxValue, function()
    -- Function here
end)
```
#### Or
```lua
Section:CreateSlider(("SilderText", minValue, maxValue, function()
    -- Function here
end)
```
require: Section
**STATUS:** Not Done

### Creating Dropdowns
#### Coming Soon
