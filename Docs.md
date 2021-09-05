# CFA UI Library
## Warning: The UI Library not done yet!

## Methods

### Getting Loadstring
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/hieuhieu743/CFAHub/main/main.lua"))
```

### Creating UI Library Window
```lua
local Window = Library:NewWindow("title")
```
require: Library

### Creating Tabs
```lua
local Tab = Window:NewTab("TabName")
```
require: Window

### Creating Section
```lua
local Section = Tab:NewSection("SectionName")
```
require: Tab

### Creating Buttons
```lua
local Button = Section:NewButton("ButtonText", function()
    -- Function here
end)
```
#### Or
```lua
Section:NewButton("ButtonText", function()
    -- Function here
end)
```
require: Section

### Creating Toggles
```lua
local Toggle = Section:NewToggle("ToggleText", function(state)
    if state then
        -- On Function here
    else
        -- Off Function here
    end
end)
```
#### Or
```lua
Section:NewToggle("ToggleText", function(state)
    if state then
        -- On Function here
    else
        -- Off Function here
    end
end)
```
require: Section

### Creating Sliders
```lua
local Slider = Section:NewSlider("SilderText", minValue, maxValue, function()
    -- Function here
end)
```
#### Or
```lua
Section:NewSlider(("SilderText", minValue, maxValue, function()
    -- Function here
end)
```
require: Section

### Creating Dropdowns
#### Coming Soon
