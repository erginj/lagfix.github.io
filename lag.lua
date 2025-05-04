_G.Settings = {
    Players = {
        ["Ignore Me"] = true,
        ["Ignore Others"] = true
    },
    Meshes = {
        Destroy = false,
        LowDetail = true
    },
    Images = {
        Invisible = true,
        LowDetail = false,
        Destroy = false
    },
    ["No Particles"] = true,
    ["No Camera Effects"] = true,
    ["No Explosions"] = true,
    ["No Clothes"] = true,
    ["Low Water Graphics"] = true,
    ["No Shadows"] = true,
    ["Low Rendering"] = true,
    ["Low Quality Parts"] = true
}

local function applySettings()
    if _G.Settings["No Particles"] then
        for _, v in ipairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    end

    if _G.Settings["No Clothes"] then
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character then
                for _, obj in ipairs(player.Character:GetChildren()) do
                    if obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("GraphicTee") then
                        obj:Destroy()
                    end
                end
            end
        end
    end

    if _G.Settings["No Explosions"] then
        game.DescendantAdded:Connect(function(obj)
            if obj:IsA("Explosion") then
                obj.Visible = false
            end
        end)
    end

    if _G.Settings["No Camera Effects"] then
        for _, v in ipairs(game.Lighting:GetChildren()) do
            if v:IsA("PostEffect") then
                v.Enabled = false
            end
        end
    end

    if _G.Settings["No Shadows"] then
        game.Lighting.GlobalShadows = false
    end

    if _G.Settings["Low Rendering"] then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level1
    end

    if _G.Settings["Low Water Graphics"] then
        game.Lighting.WaterWaveSize = 0
        game.Lighting.WaterWaveSpeed = 0
    end
end

applySettings()
