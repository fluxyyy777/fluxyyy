-- [[ HOSHIN HUB - HỆ THỐNG GET KEY & SCRIPT HUB TỔNG HỢP ]] --

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Cấu hình dữ liệu
local CORRECT_KEY = "Hoshinhub-vn83400422"
local GETKEY_LINK = "https://gtraffic.io/G0gxSQy"
local SCRIPT_URL = "https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua"

-- Tạo ScreenGui chính
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HoshinHub_KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local parentGui = (gethui and gethui()) or game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Parent = parentGui

-- Hàm sao chép link an toàn
local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
    elseif toclipboard then
        toclipboard(text)
    elseif syn and syn.write_clipboard then
        syn.write_clipboard(text)
    end
end

-- Hệ thống thông báo nổi trên màn hình (Toast Notification)
local function showNotification(msg)
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 300, 0, 42)
    NotifFrame.Position = UDim2.new(0.5, -150, 0.08, -50)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(22, 18, 36)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.ZIndex = 20
    NotifFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner", NotifFrame)
    UICorner.CornerRadius = UDim.new(0, 8)

    local UIStroke = Instance.new("UIStroke", NotifFrame)
    UIStroke.Thickness = 1.5
    UIStroke.Color = Color3.fromRGB(0, 240, 255)

    local Icon = Instance.new("TextLabel", NotifFrame)
    Icon.Size = UDim2.new(0, 30, 1, 0)
    Icon.Position = UDim2.new(0, 8, 0, 0)
    Icon.BackgroundTransparency = 1
    Icon.Text = "📋"
    Icon.TextSize = 16
    Icon.ZIndex = 21

    local Label = Instance.new("TextLabel", NotifFrame)
    Label.Size = UDim2.new(1, -45, 1, 0)
    Label.Position = UDim2.new(0, 40, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = msg
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextWrapped = true
    Label.ZIndex = 21

    -- Animation trượt xuống và biến mất
    TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -150, 0.08, 0)}):Play()
    task.delay(3, function()
        local tweenOut = TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, 0.02, -50)})
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            NotifFrame:Destroy()
        end)
    end)
end

-- Khung Menu GetKey chính (Đã thu nhỏ kích thước cho cân đối)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 350)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(11, 8, 19) -- #0B0813
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 14)

-- Viền cầu vồng phát sáng (Rainbow Stroke)
local RainbowStroke = Instance.new("UIStroke", MainFrame)
RainbowStroke.Thickness = 2
RainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Hiệu ứng hạt 3D lấp lánh (Sparkle Background)
local SparkleContainer = Instance.new("Frame", MainFrame)
SparkleContainer.Size = UDim2.new(1, 0, 1, 0)
SparkleContainer.BackgroundTransparency = 1
SparkleContainer.ZIndex = 1

task.spawn(function()
    while MainFrame.Parent do
        local sparkle = Instance.new("TextLabel")
        sparkle.BackgroundTransparency = 1
        sparkle.Text = ({"✦", "★", "✧", "•"})[math.random(1, 4)]
        sparkle.TextColor3 = Color3.fromHSV(math.random(), 0.6, 1)
        sparkle.TextSize = math.random(8, 14)
        sparkle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        sparkle.ZIndex = 2
        sparkle.Parent = SparkleContainer

        TweenService:Create(sparkle, TweenInfo.new(1.8, Enum.EasingStyle.Sine), {
            TextTransparency = 1,
            Position = sparkle.Position + UDim2.new(0, math.random(-20, 20), 0, math.random(-20, 20))
        }):Play()

        game:GetService("Debris"):AddItem(sparkle, 1.8)
        task.wait(0.25)
    end
end)

-- Vòng lặp viền chuyển màu Rainbow RGB
RunService.RenderStepped:Connect(function()
    local hue = (tick() % 4) / 4
    RainbowStroke.Color = Color3.fromHSV(hue, 0.85, 1)
end)

-- Tiêu đề Menu
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -40, 0, 24)
Title.Position = UDim2.new(0, 20, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "⚡ HỆ THỐNG GETKEY HOSHIN HUB ⚡"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.ZIndex = 3

local SubTitle = Instance.new("TextLabel", MainFrame)
SubTitle.Size = UDim2.new(1, 0, 0, 16)
SubTitle.Position = UDim2.new(0, 0, 0, 34)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Hệ thống bảo vệ key nhanh gọn • Tự động xác minh"
SubTitle.TextColor3 = Color3.fromRGB(140, 130, 170)
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.TextSize = 10
SubTitle.ZIndex = 3

-- Ô nhập Key (#161224)
local InputContainer = Instance.new("Frame", MainFrame)
InputContainer.Size = UDim2.new(1, -32, 0, 36)
InputContainer.Position = UDim2.new(0, 16, 0, 56)
InputContainer.BackgroundColor3 = Color3.fromRGB(22, 18, 36) -- #161224
InputContainer.BorderSizePixel = 0
InputContainer.ZIndex = 3

local InputCorner = Instance.new("UICorner", InputContainer)
InputCorner.CornerRadius = UDim.new(0, 8)

local InputStroke = Instance.new("UIStroke", InputContainer)
InputStroke.Color = Color3.fromRGB(45, 38, 70)
InputStroke.Thickness = 1

local KeyTextBox = Instance.new("TextBox", InputContainer)
KeyTextBox.Size = UDim2.new(1, -16, 1, 0)
KeyTextBox.Position = UDim2.new(0, 8, 0, 0)
KeyTextBox.BackgroundTransparency = 1
KeyTextBox.PlaceholderText = "Nhập mã Key của bạn vào đây..."
KeyTextBox.PlaceholderColor3 = Color3.fromRGB(110, 105, 135)
KeyTextBox.Text = ""
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextBox.Font = Enum.Font.Gotham
KeyTextBox.TextSize = 12
KeyTextBox.ClearTextOnFocus = false
KeyTextBox.ZIndex = 4

-- Nút GET KEY (#00F0FF - Xanh Cyan Neon)
local GetKeyBtn = Instance.new("TextButton", MainFrame)
GetKeyBtn.Size = UDim2.new(1, -32, 0, 36)
GetKeyBtn.Position = UDim2.new(0, 16, 0, 98)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 240, 255) -- #00F0FF
GetKeyBtn.Text = "🔗 GET KEY (SAO CHÉP LINK)"
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 12
GetKeyBtn.BorderSizePixel = 0
GetKeyBtn.ZIndex = 3

local GetKeyCorner = Instance.new("UICorner", GetKeyBtn)
GetKeyCorner.CornerRadius = UDim.new(0, 8)

-- Nút KIỂM TRA / XÁC NHẬN KEY
local SubmitBtn = Instance.new("TextButton", MainFrame)
SubmitBtn.Size = UDim2.new(1, -32, 0, 36)
SubmitBtn.Position = UDim2.new(0, 16, 0, 140)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
SubmitBtn.Text = "🚀 XÁC MINH VÀ VÀO SCRIPT"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 12
SubmitBtn.BorderSizePixel = 0
SubmitBtn.ZIndex = 3

local SubmitCorner = Instance.new("UICorner", SubmitBtn)
SubmitCorner.CornerRadius = UDim.new(0, 8)

-- Khung Note chữ nhỏ dưới bảng (Màu vàng đỏ nhẹ)
local NoteFrame = Instance.new("Frame", MainFrame)
NoteFrame.Size = UDim2.new(1, -32, 0, 150)
NoteFrame.Position = UDim2.new(0, 16, 0, 184)
NoteFrame.BackgroundColor3 = Color3.fromRGB(18, 14, 28)
NoteFrame.BorderSizePixel = 0
NoteFrame.ZIndex = 3

local NoteCorner = Instance.new("UICorner", NoteFrame)
NoteCorner.CornerRadius = UDim.new(0, 8)

local NoteStroke = Instance.new("UIStroke", NoteFrame)
NoteStroke.Color = Color3.fromRGB(50, 35, 40)
NoteStroke.Thickness = 1

local NoteLabel = Instance.new("TextLabel", NoteFrame)
NoteLabel.Size = UDim2.new(1, -16, 1, -10)
NoteLabel.Position = UDim2.new(0, 8, 0, 5)
NoteLabel.BackgroundTransparency = 1
NoteLabel.Text = "script chỉ nokey trong 2 tiếng từ khi video được đăng lên đã quá 2 tiếng kể từ khi video được đăng lên nên mình xin phép được thêm key vào nhé\n\nViệc lấy Key Chỉ mất 1-2 phút mong bạn đừng tức giận và tiếp tục ủng hộ mình nhé! Chúc các bạn chơi game vui vẻ!"
NoteLabel.TextColor3 = Color3.fromRGB(255, 145, 105) -- Vàng đỏ nhẹ
NoteLabel.Font = Enum.Font.Gotham
NoteLabel.TextSize = 10
NoteLabel.TextWrapped = true
NoteLabel.TextYAlignment = Enum.TextYAlignment.Center
NoteLabel.ZIndex = 4

-- Nút Đóng Key System
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -32, 0, 8)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(180, 170, 200)
CloseBtn.TextSize = 15
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.ZIndex = 5

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Gán sự kiện cho Nút GET KEY
GetKeyBtn.MouseButton1Click:Connect(function()
    copyToClipboard(GETKEY_LINK)
    showNotification("Đã sao chép Link! Dán lên trình duyệt để getkey")
end)

-- ======================================================= --
-- TẠO MENU SCRIPT BLOX TỔNG HỢP (KHI NHẬP KEY THÀNH CÔNG)
-- ======================================================= --
local function openHubMenu()
    MainFrame:Destroy()

    local HubFrame = Instance.new("Frame")
    HubFrame.Name = "HoshinHub_MainMenu"
    HubFrame.Size = UDim2.new(0, 380, 0, 220)
    HubFrame.Position = UDim2.new(0.5, -190, 0.5, -110)
    HubFrame.BackgroundColor3 = Color3.fromRGB(11, 8, 19)
    HubFrame.BorderSizePixel = 0
    HubFrame.Active = true
    HubFrame.Draggable = true
    HubFrame.ClipsDescendants = true
    HubFrame.Parent = ScreenGui

    local HubCorner = Instance.new("UICorner", HubFrame)
    HubCorner.CornerRadius = UDim.new(0, 14)

    local HubStroke = Instance.new("UIStroke", HubFrame)
    HubStroke.Thickness = 2
    HubStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    RunService.RenderStepped:Connect(function()
        local hue = (tick() % 4) / 4
        HubStroke.Color = Color3.fromHSV(hue, 0.85, 1)
    end)

    -- Header Hub
    local HubTitle = Instance.new("TextLabel", HubFrame)
    HubTitle.Size = UDim2.new(1, 0, 0, 35)
    HubTitle.Position = UDim2.new(0, 0, 0, 12)
    HubTitle.BackgroundTransparency = 1
    HubTitle.Text = "🌸 HOSHIN HUB - BLOX FRUITS TỔNG HỢP 🌸"
    HubTitle.TextColor3 = Color3.fromRGB(0, 240, 255)
    HubTitle.Font = Enum.Font.GothamBold
    HubTitle.TextSize = 13

    local HubDesc = Instance.new("TextLabel", HubFrame)
    HubDesc.Size = UDim2.new(1, 0, 0, 16)
    HubDesc.Position = UDim2.new(0, 0, 0, 42)
    HubDesc.BackgroundTransparency = 1
    HubDesc.Text = "Xác minh Key thành công! Chào mừng bạn đến với Hoshin Hub"
    HubDesc.TextColor3 = Color3.fromRGB(180, 255, 180)
    HubDesc.Font = Enum.Font.Gotham
    HubDesc.TextSize = 10

    -- Nút Chạy Loader Script Blox Tổng Hợp
    local ExecuteBtn = Instance.new("TextButton", HubFrame)
    ExecuteBtn.Size = UDim2.new(1, -40, 0, 45)
    ExecuteBtn.Position = UDim2.new(0, 20, 0, 78)
    ExecuteBtn.BackgroundColor3 = Color3.fromRGB(22, 18, 36)
    ExecuteBtn.Text = "▶ KHỞI ĐỘNG SCRIPT BLOX TỔNG HỢP"
    ExecuteBtn.TextColor3 = Color3.fromRGB(0, 240, 255)
    ExecuteBtn.Font = Enum.Font.GothamBold
    ExecuteBtn.TextSize = 12
    ExecuteBtn.BorderSizePixel = 0

    local ExecCorner = Instance.new("UICorner", ExecuteBtn)
    ExecCorner.CornerRadius = UDim.new(0, 8)

    local ExecStroke = Instance.new("UIStroke", ExecuteBtn)
    ExecStroke.Color = Color3.fromRGB(0, 240, 255)
    ExecStroke.Thickness = 1.2

    local StatusText = Instance.new("TextLabel", HubFrame)
    StatusText.Size = UDim2.new(1, -20, 0, 40)
    StatusText.Position = UDim2.new(0, 10, 0, 135)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "Trạng thái: Sẵn sàng thực thi"
    StatusText.TextColor3 = Color3.fromRGB(160, 150, 180)
    StatusText.Font = Enum.Font.Gotham
    StatusText.TextSize = 11
    StatusText.TextWrapped = true

    -- Sự kiện nhấn nút tải script
    ExecuteBtn.MouseButton1Click:Connect(function()
        StatusText.Text = "Đang tải Script... Vui lòng đợi!"
        StatusText.TextColor3 = Color3.fromRGB(255, 215, 0)
        task.wait(0.5)

        local success, err = pcall(function()
            loadstring(game:HttpGet(SCRIPT_URL))()
        end)

        if success then
            StatusText.Text = "✓ Đã tải Script thành công!"
            StatusText.TextColor3 = Color3.fromRGB(0, 255, 150)
            task.wait(1.5)
            ScreenGui:Destroy()
        else
            StatusText.Text = "Lỗi khi tải script: " .. tostring(err)
            StatusText.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
    end)

    -- Nút đóng Hub
    local HubClose = Instance.new("TextButton", HubFrame)
    HubClose.Size = UDim2.new(0, 26, 0, 26)
    HubClose.Position = UDim2.new(1, -30, 0, 8)
    HubClose.BackgroundTransparency = 1
    HubClose.Text = "✕"
    HubClose.TextColor3 = Color3.fromRGB(200, 200, 200)
    HubClose.TextSize = 15
    HubClose.Font = Enum.Font.GothamBold

    HubClose.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

-- Xử lý xác nhận Key
SubmitBtn.MouseButton1Click:Connect(function()
    local enteredKey = string.gsub(KeyTextBox.Text, "%s+", "")
    if enteredKey == CORRECT_KEY then
        showNotification("✓ Key chính xác! Đang mở menu...")
        task.wait(0.8)
        openHubMenu()
    else
        showNotification("✕ Sai Key! Hãy bấm nút GET KEY để lấy link.")
        KeyTextBox.Text = ""
    end
end)
