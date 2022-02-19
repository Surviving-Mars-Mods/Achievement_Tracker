-- See license.md for copyright info
local function Log(...)
    FFL_LogMessage(CurrentModDef.title, "OSD", ...)
end

--locals
local UpdateThread

function CreateTextStyles()
    if not TextStyles then
        Log("ERROR", "No text styles!")
        return false
    end

    if not TextStyles.FF_AT_PA_Title then
        PlaceObj("TextStyle", {
            DisabledRolloverTextColor = -10197916,
            DisabledTextColor = -10197916,
            RolloverTextColor = -727947,
            TextColor = -727947,
            TextFont = FFL_Translate("LibelSuitRg, 18, aa"),
            group = "Game",
            id = "FF_AT_PA_Title",
            save_in = "common"
        })
    end

    if not TextStyles.FF_AT_PA_Description then
        PlaceObj("TextStyle", {
            DisabledRolloverTextColor = -7566196,
            DisabledTextColor = -7566196,
            RolloverTextColor = -1,
            TextColor = -1,
            TextFont = FFL_Translate("LibelSuitRg, 16, aa"),
            group = "Game",
            id = "FF_AT_PA_Description",
            save_in = "common"
        })
    end

    if not TextStyles.FF_AT_PA_Progress then
        PlaceObj("TextStyle", {
            DisabledRolloverTextColor = -7566196,
            DisabledTextColor = -7566196,
            RolloverTextColor = -1,
            TextColor = -1, --2do: find a better colour
            TextFont = FFL_Translate("LibelSuitRg, 18, aa"),
            group = "Game",
            id = "FF_AT_PA_Progress",
            save_in = "common"
        })
    end
    return true
end

function CreateOSD()
    local ShowMAWindow = SharedModEnv["FF_AT_ShowMainAchievementWindow"]

    local function OnClick(...)
        --2do: change achieve
    end

    local function OnDoubleClick(...)
        ShowMAWindow = false
        Dialogs.InGameInterface.FF_AT_PrimaryAchievement:Close()
    end

    local Parent = Dialogs.InGameInterface
    if not Parent then
        Log("ERROR", "No InGameInterface!")
        return
    end

    if not CreateTextStyles() then
        Log("ERROR", "Failed to create Text Styles!")
        return
    end

    if Parent.FFAT_PrimaryAchievement then --backwards compatibility
        Parent.FFAT_PrimaryAchievement:DeleteChildren()
        Parent.FFAT_PrimaryAchievement:delete()
    end

    if Parent.FF_AT_PrimaryAchievement then
        Parent.FF_AT_PrimaryAchievement:DeleteChildren()
        Parent.FF_AT_PrimaryAchievement:delete()
    end

    if not ShowMAWindow then
        return
    end

    local OSD = XWindow:new({
        Background = 1677750783,
        BorderColor = -16187200,
        BorderWidth = 2,
        ChildrenHandleMouse = false,
        Dock = "box",
        FoldWhenHidden = true, --how to hide?
        HAlign = "center",
        HandleKeyboard = false,
        HandleMouse = true,
        Id = "FF_AT_PrimaryAchievement",
        IdNode = true,
        Margins = box(0, 85, 0, 0), --below InfoBar
        OnMouseButtonDoubleClick = OnDoubleClick,
        OnMouseButtonDown = OnClick,
        RolloverHint = FFL_Translate("Keep up the good work! =)"),
        RolloverTemplate = "Rollover",
        RolloverText = FFL_Translate("<image UI/Infopanel/left_click.tga 1400>*2 Close"),
        RolloverTitle = FFL_Translate("Primary Achievement"),
        transparency = 50,
        VAlign = "top",
    }, Parent)

    XText:new({
        Dock = "top",
        HandleKeyboard = "false",
        Id = "FF_AT_PA_Title",
        TextStyle = "FF_AT_PA_Title",
        TextHAlign = "center",
    }, OSD)

    XText:new({
        Dock = "top",
        HandleKeyboard = "false",
        Id = "FF_AT_PA_Description",
        TextStyle = "FF_AT_PA_Description",
    }, OSD)

    XText:new({
        Dock = "top",
        HandleKeyboard = "false",
        Id = "FF_AT_PA_Progress",
        TextStyle = "FF_AT_PA_Progress",
    }, OSD)

    OSD:SetParent(Parent)
    UpdateOSD()
end

function UpdateOSD()

    local function UpdateText()
        local Title, Description, Progress

        for _, A in pairs(MainCity.labels.TrackedAchievement) do
            if A.Name == CurrentModOptions:GetProperty("ShowOnScreen") then

                local OSD = Dialogs.InGameInterface.FF_AT_PrimaryAchievement
                if not OSD then
                    Log("No OSD")
                    return
                end

                Title = A.Name
                Description = A.Description
                Progress = "Current Progress: " .. FFL_FormatNumber(A.Value) .. " / " .. FFL_FormatNumber(A.Target)

                if not OSD.FF_AT_PA_Title or not OSD.FF_AT_PA_Description or not OSD.FF_AT_PA_Progress then
                    Log("ERROR", "Primary Achievement children don't exist!")
                    return
                end
                OSD.FF_AT_PA_Title:SetText(FFL_Translate(Title))
                OSD.FF_AT_PA_Description:SetText(FFL_Translate(Description))
                OSD.FF_AT_PA_Progress:SetText(FFL_Translate(Progress))
                UpdateThread = nil
            end
        end
    end

    if not UpdateThread then
            UpdateThread = CreateGameTimeThread(UpdateText)
    end
end