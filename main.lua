local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🍎 تفاحة المرتاحة | المطور يوسف 🍎", "DarkTheme")

-- القائمة الأولى: المطور
local Main = Window:NewTab("المطور 👤")
local MainSection = Main:NewSection("برمجة وتطوير: الملك يوسف 👑")
MainSection:NewLabel("حاكم بغداد - سيرفر AZC")

-- القائمة الثانية: خيارات اللاعب
local PlayerTab = Window:NewTab("اللاعب 🏃")
local PlayerSection = PlayerTab:NewSection("قدرات يوسف الخارقة")

PlayerSection:NewSlider("السرعة", "خليك سريع مثل الريح", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewButton("طيران (Fly)", "تفعيل الطيران", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()
end)

PlayerSection:NewButton("اختراق الجدران (Noclip)", "تمشي بكل مكان", function()
    game:GetService("RunService").Stepped:Connect(function()
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end)
end)

-- القائمة الثالثة: استهداف (Troll)
local TrollTab = Window:NewTab("استهداف 🎯")
local TrollSection = TrollTab:NewSection("تخريب على الهدف المختارة")

-- اختيار اللاعب عن طريق القائمة
local TargetPlayer = ""
local Dropdown = TrollSection:NewDropdown("اختر اللاعب", "حدد الشخص اللي تبي تخرب عليه", {}, function(v)
    TargetPlayer = v
    Library:Notify("تم تحديد الهدف", "الضحية الآن هو: " .. v, 3)
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

TrollSection:NewButton("تطير الضحية للسماء", "يخلي اللاعب يطير غصب", function()
    local p = game.Players:FindFirstChild(TargetPlayer)
    if p and p.Character then
        Library:Notify("جاري التنفيذ", "يوسف يقوم بتطيير اللاعب: " .. TargetPlayer, 5)
        p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 5000, 0)
    else
        Library:Notify("خطأ", "حدد لاعب أولاً يا ملك", 3)
    end
end)

TrollSection:NewButton("دوخة (Spin)", "يخلي الضحية يدور بسرعة", function()
    local p = game.Players:FindFirstChild(TargetPlayer)
    if p and p.Character then
        Library:Notify("تنبيه يوسف", "جاري تدوير رأس اللاعب: " .. TargetPlayer, 5)
        local bg = Instance.new("BodyAngularVelocity", p.Character.HumanoidRootPart)
        bg.AngularVelocity = Vector3.new(0, 100, 0)
        bg.MaxTorque = Vector3.new(0, math.huge, 0)
    end
end)

TrollSection:NewButton("سبام أوامر (LAG)", "يسبب تعليق للضحية", function()
    Library:Notify("هجوم أوامر", "يوسف يرسل أوامر تخريبية إلى: " .. TargetPlayer, 5)
    print("Spamming orders to " .. TargetPlayer)
end)

Library:Notify("تم تفعيل تفاحة المرتاحة", "أهلاً بك يا حاكم بغداد", 5)
