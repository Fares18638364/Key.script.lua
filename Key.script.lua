-- إنشاء الواجهة برمجياً
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemUI"
ScreenGui.Parent = PlayerGui

-- إطار القائمة الرئيسي
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 220)
Frame.Position = UDim2.new(0.5, -175, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner", Frame)
FrameCorner.CornerRadius = UDim.new(0, 15)

-- العنوان
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "نظام التحقق - Fares"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.BackgroundTransparency = 1

-- خانة الإدخال
local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0, 300, 0, 45)
TextBox.Position = UDim2.new(0, 25, 0, 60)
TextBox.PlaceholderText = "أدخل المفتاح هنا..."
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 16
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 10)

-- زر الدخول
local CheckButton = Instance.new("TextButton", Frame)
CheckButton.Size = UDim2.new(0, 140, 0, 40)
CheckButton.Position = UDim2.new(0, 25, 0, 130)
CheckButton.Text = "دخول"
CheckButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckButton.Font = Enum.Font.GothamBold
Instance.new("UICorner", CheckButton).CornerRadius = UDim.new(0, 10)

-- زر الإغلاق
local CloseButton = Instance.new("TextButton", Frame)
CloseButton.Size = UDim2.new(0, 140, 0, 40)
CloseButton.Position = UDim2.new(0, 185, 0, 130)
CloseButton.Text = "إغلاق"
CloseButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 10)

-- منطق التشغيل
local correctKey = "fares111"
local targetScript = "https://raw.githubusercontent.com/Fares18638364/gui.Admin.script.lua/refs/heads/main/GuI.Admin.script.lua"

CheckButton.MouseButton1Click:Connect(function()
    if TextBox.Text == correctKey then
        -- إخفاء القائمة عند النجاح
        Frame.Visible = false
        
        -- تنفيذ السكربت الخاص بك
        local success, result = pcall(function()
            loadstring(game:HttpGet(targetScript))()
        end)
        
        if not success then
            warn("خطأ في تشغيل السكربت: " .. tostring(result))
        end
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "مفتاح خاطئ!"
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- إزالة الواجهة تماماً عند الإغلاق
end)
