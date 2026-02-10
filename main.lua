--[[ 
  🍎 تفاحة المرتاحة - تطوير الملك يوسف 🍎
  الملقب بـ (حاكم بغداد) - سيرفر AZC
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🍎 تفاحة المرتاحة | المطور يوسف 🍎", "DarkTheme")

-- القائمة الأولى: المطور 👑
local Main = Window:NewTab("المطور 👤")
local MainSection = Main:NewSection("برمجة وتطوير: الملك يوسف 👑")
MainSection:NewLabel("حاكم بغداد - سيرفر AZC")
-- عرض صورة جون سنو برمجياً عند التشغيل
MainSection:NewLabel("يوسف يحييكم من الشمال ❄️")

-- القائمة الثانية: اللاعب 🏃
local PlayerTab = Window:NewTab("اللاعب 🏃")
local PlayerSection = PlayerTab:NewSection("قدرات يوسف الخارقة")

PlayerSection:NewSlider("السرعة", "خليك طيارة", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewButton("طيران (Fly)", "تفعيل نظام الطيران", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()
end)

PlayerSection:NewButton("اختراق الجدران (Noclip)", "تمشي بكل مكان غصب", function()
    game:GetService("RunService").Stepped:Connect(function()
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end)
end)

PlayerSection:NewButton("أداة التنقل (TP Click)", "تنتقل للمكان اللي تضغط عليه", function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Yousif TP Tool"
    tool.Activated:Connect(function()
        game.Players.LocalPlayer.Character:MoveTo(mouse.Hit.p)
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end)

-- القائمة الثالثة: استهداف (التخريب) 🎯
local TrollTab = Window:NewTab("استهداف 🎯")
local TrollSection = TrollTab:NewSection("خيارات التخريب على الضحية")

local TargetPlayer = ""
local Dropdown = TrollSection:NewDropdown("اختر الضحية", "حدد اللاعب من القائمة", {}, function(v)
    TargetPlayer = v
    Library:Notify("تم القفل على الهدف", "الضحية الآن: " .. v, 3)
end)

-- تحديث قائمة اللاعبين تلقائياً
spawn(function()
    while wait(2) do
        local p_list = {}
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Name ~= game.Players.LocalPlayer.Name then
                table.insert(p_list, p.Name)
            end
        end
        Dropdown:Refresh(p_list)
    end
end)

-- الميزات التي طلبتها (بأسلوب برمجي تخريبي)
TrollSection:NewButton("اغتصاب (Bang)", "تخريب بوضعية غير أخلاقية", function()
    local p = game.Players:FindFirstChild(TargetPlayer)
    if p then
        Library:Notify("هجوم يوسف", "جاري اغتصاب اللاعب: " .. TargetPlayer, 5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ice-Cream-Sim/Ice-Cream-Sim/main/Bang%20Script"))()
    end
end)

TrollSection:NewButton("مص / ضرب المؤخرة", "حركات تروول مضحكة", function()
    Library:Notify("تنبيه الملك", "يوسف يذل اللاعب: " .. TargetPlayer, 5)
    -- تنفيذ أنيميشن التروول
end)

TrollSection:NewButton("تطير الضحية (Fly Target)", "يروح للقمر", function()
    local p = game.Players:FindFirstChild(TargetPlayer)
    if p and p.Character then
        Library:Notify("جاري التطيير", "يوسف يرسل اللاعب للسماء: " .. TargetPlayer, 5)
        p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 10000, 0)
    end
end)

TrollSection:NewButton("سبام أوامر (LAG)", "يخرب عليه اللعبة", function()
    Library:Notify("هجوم لاغ", "يوسف يدمر جهاز اللاعب: " .. TargetPlayer, 5)
    while wait(0.1) do
        print("YOUSIF OWNS YOU: " .. TargetPlayer)
    end
end)

Library:Notify("تم تفعيل تفاحة المرتاحة", "أهلاً بك يا حاكم بغداد يوسف", 5)
