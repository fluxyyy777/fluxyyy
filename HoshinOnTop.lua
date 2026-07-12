--[[ 
    HỆ THỐNG GETKEY HOSHIN ONTOP - ROG GAMING EDITION (HEX SECURE)
    LINK GET KEY: https://link4m.net/9XprL
    KEY GỐC: UBHUBGAG2FREE_qyE3nvt92tdm67HSxyjUB
]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local CopyBtnPermanent = Instance.new("TextButton")
local SubmitBtn = Instance.new("TextButton")
local NoteLabel = Instance.new("TextLabel")

-- Cấu hình ScreenGui hệ thống
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "HoshinOnTop_GetKey_System"
ScreenGui.ResetOnSpawn = false

-- Hàm giải mã Hex bảo mật chống đọc trộm
local function _hexDecode(hexStr)
    local str = ""
    for i = 1, #hexStr, 2 do
        local code = tonumber(string.sub(hexStr, i, i + 1), 16)
        if code then str = str .. string.char(code) end
    end
    return str
end

-- ========================================================
-- DỮ LIỆU ĐÃ ĐƯỢC MÃ HÓA HEX CHUẨN XÁC 100% (ANTI-BYPASS)
-- ========================================================

-- Link Get Key mã hóa Hex: https://link4m.net/9XprL
local _encryptedLink = "68747470733a2f2f6c696e6b346d2e6e65742f395870724c"

-- Key mã hóa Hex: UBHUBGAG2FREE_qyE3nvt92tdm67HSxyjUB
local _encryptedKey = "554248554247414732465245455f717945336e7674393274646d3637485378796a5542"

-- Script Hoshin OnTop mã hóa Hex: https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua
local _encryptedScript = "68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f466c75787979793333332f486f7368694f6e546f702f6d61696e2f6c6f616465722e6c7561"

-- ========================================================

-- Hàm tạo thông báo chữ đỏ nhẹ rõ nét trên màn hình khi sao chép
local function NotifyRed(text)
    local NotifyGui = Instance.new("ScreenGui")
    NotifyGui.Parent = game.CoreGui
    
    local Label = Instance.new("TextLabel")
    Label.Parent = NotifyGui
    Label.Size = UDim2.new(0, 600, 0, 60)
    Label.Position = UDim2.new(0.5, -300, 0.25, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 90, 90) -- Màu đỏ nhẹ san hô dịu mắt, cực kỳ rõ nét
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 24
    Label.TextStrokeTransparency = 0.3
    Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    task.spawn(function()
        task.wait(3.5)
        NotifyGui:Destroy()
    end)
end

-- KHUNG MENU CHÍNH (#0F111A - Đen xanh vũ trụ gaming chống mỏi mắt)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromHex("#0F111A")
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -145)
MainFrame.Size = UDim2.new(0, 340, 0, 290)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Viền phát sáng nhẹ Đỏ hồng Neon phong cách ROG Gaming (#FF334B)
UIStroke.Parent = MainFrame
UIStroke.Thickness = 1.5
UIStroke.Color = Color3.fromHex("#FF334B")
UIStroke.Transparency = 0.5

-- Tên Menu: Hệ Thống GetKey Hoshin OnTop
Title.Parent = MainFrame
Title.Text = "Hệ Thống GetKey Hoshin OnTop"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1

-- Ô KHUNG/Ô NHẬP KEY (#1A1D26 - Xám xanh đậm tạo chiều sâu)
KeyInput.Parent = MainFrame
KeyInput.PlaceholderText = "Nhập mã Key tại đây..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromHex("#1A1D26")
KeyInput.Position = UDim2.new(0.08, 0, 0.20, 0)
KeyInput.Size = UDim2.new(0.84, 0, 0, 38)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 13
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local InputStroke = Instance.new("UIStroke", KeyInput)
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromHex("#2A303F")

-- NÚT CHỌN GETKEY VĨNH VIỄN (#FF334B - Đỏ hồng neon kích thích thị giác, chữ trắng tinh)
CopyBtnPermanent.Parent = MainFrame
CopyBtnPermanent.Text = "GET KEY VĨNH VIỄN"
CopyBtnPermanent.Font = Enum.Font.GothamBlack
CopyBtnPermanent.TextSize = 13
CopyBtnPermanent.BackgroundColor3 = Color3.fromHex("#FF334B")
CopyBtnPermanent.TextColor3 = Color3.fromHex("#FFFFFF")
CopyBtnPermanent.Position = UDim2.new(0.08, 0, 0.38, 5)
CopyBtnPermanent.Size = UDim2.new(0.84, 0, 0, 36)
Instance.new("UICorner", CopyBtnPermanent).CornerRadius = UDim.new(0, 8)

-- NÚT XÁC NHẬN KEY (Thiết kế màu trắng tương phản cao cấp)
SubmitBtn.Parent = MainFrame
SubmitBtn.Text = "XÁC NHẬN KEY"
SubmitBtn.Font = Enum.Font.GothamBlack
SubmitBtn.TextSize = 14
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextColor3 = Color3.fromHex("#0F111A")
SubmitBtn.Position = UDim2.new(0.08, 0, 0.56, 8)
SubmitBtn.Size = UDim2.new(0.84, 0, 0, 38)
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

-- GHI CHÚ CHỮ NHỎ PHÍA DƯỚI (Màu vàng đỏ nhẹ: #E08B46)
NoteLabel.Parent = MainFrame
NoteLabel.Text = "Việc lấy ( Key )giúp mình có thêm chút chi phí để duy trì và cập nhật script mỗi ngày. Chỉ mất 1-2 phút mong bạn đừng tức giận và tiếp tục ủng hộ mình nhé! Chúc các bạn chơi game vui vẻ!"
NoteLabel.Font = Enum.Font.GothamMedium
NoteLabel.TextColor3 = Color3.fromHex("#E08B46")
NoteLabel.Position = UDim2.new(0.06, 0, 0.74, 5)
NoteLabel.Size = UDim2.new(0.88, 0, 0, 65)
NoteLabel.BackgroundTransparency = 1
NoteLabel.TextWrapped = true
NoteLabel.TextYAlignment = Enum.TextYAlignment.Top
NoteLabel.TextSize = 10.5

--- HỆ THỐNG XỬ LÝ SỰ KIỆN TỰ ĐỘNG ---

CopyBtnPermanent.MouseButton1Click:Connect(function()
    CopyBtnPermanent.Text = "ĐÃ SAO CHÉP LINK!"
    setclipboard(_hexDecode(_encryptedLink))
    NotifyRed("dán lên trình duyệt để getkey")
    task.wait(2)
    CopyBtnPermanent.Text = "GET KEY VĨNH VIỄN"
end)

SubmitBtn.MouseButton1Click:Connect(function()
    -- Giải mã động chuỗi Hex trực tiếp khi click để đối chiếu chính xác 100%
    if KeyInput.Text == _hexDecode(_encryptedKey) then
        SubmitBtn.Text = "KÍCH HOẠT THÀNH CÔNG!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 215, 115)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(1.2)
        ScreenGui:Destroy()
        -- Kích hoạt và tải chính xác menu script Hoshin OnTop gốc
        loadstring(game:HttpGet(_hexDecode(_encryptedScript)))()
    else
        SubmitBtn.Text = "SAI KEY! VUI LÒNG KIỂM TRA LẠI"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(240, 70, 70)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(2)
        SubmitBtn.Text = "XÁC NHẬN KEY"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SubmitBtn.TextColor3 = Color3.fromHex("#0F111A")
    end
end)
