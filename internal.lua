-- Script Executor GUI
local CoreGui = game:GetService("CoreGui")

-- Remove old executor if it exists
if CoreGui:FindFirstChild("MyScriptExecutor") then
    CoreGui:FindFirstChild("MyScriptExecutor"):Destroy()
end

-- GUI setup
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "MyScriptExecutor"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 500, 0, 300)
Frame.Position = UDim2.new(0.5, -250, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.Active = true
Frame.Draggable = true
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "⚙️ Internal Script Executor"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextScaled = true

-- Code editor
local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -20, 1, -100)
TextBox.Position = UDim2.new(0, 10, 0, 50)
TextBox.MultiLine = true
TextBox.ClearTextOnFocus = false
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 16
TextBox.TextColor3 = Color3.fromRGB(0, 255, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TextBox.Text = "-- Paste or type your script here"
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 4)

-- Execute button
local Execute = Instance.new("TextButton", Frame)
Execute.Text = "▶ Execute"
Execute.Size = UDim2.new(0.5, -15, 0, 40)
Execute.Position = UDim2.new(0, 10, 1, -50)
Execute.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
Execute.TextColor3 = Color3.new(1, 1, 1)
Execute.Font = Enum.Font.SourceSansBold
Execute.TextScaled = true
Instance.new("UICorner", Execute).CornerRadius = UDim.new(0, 4)

-- Close button
local Close = Instance.new("TextButton", Frame)
Close.Text = "❌ Close"
Close.Size = UDim2.new(0.5, -15, 0, 40)
Close.Position = UDim2.new(0.5, 5, 1, -50)
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Font = Enum.Font.SourceSansBold
Close.TextScaled = true
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 4)

-- Execute logic
Execute.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    local success, err = pcall(function()
        loadstring(code)()
    end)
    if not success then
        warn("[Executor Error]: " .. tostring(err))
    end
end)

-- Close logic
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
