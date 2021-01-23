-- ACTIONBARS --

--Gryphons
MainMenuBarArtFrame.LeftEndCap:Hide()
MainMenuBarArtFrame.RightEndCap:Hide()


--Macro Names
for i=1, 12 do
_G["ActionButton"..i.."Name"]:SetAlpha(0) -- main bar
_G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0) -- bottom right bar
_G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0) -- bottom left bar
_G["MultiBarRightButton"..i.."Name"]:SetAlpha(0) -- right bar
_G["MultiBarLeftButton"..i.."Name"]:SetAlpha(0) -- left bar
end


--Keybinds
for i=1, 12 do
_G["ActionButton"..i.."HotKey"]:SetAlpha(0) -- main bar
_G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0) -- bottom right bar
_G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0) -- bottom left bar
_G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0) -- right bar
_G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0) -- left bar
end


-- UNIT FRAMES --

--Class Colors
local frame = CreateFrame("FRAME")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")

local function eventHandler(self, event, ...)
    if UnitIsPlayer("target") then
        c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
        TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
    end
    if UnitIsPlayer("focus") then
        c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
        FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
    end
end

frame:SetScript("OnEvent", eventHandler)

for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
    BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end


--HIDE PRESTIGE + HONOR BADGES
PlayerPrestigeBadge:SetAlpha(0)
PlayerPrestigePortrait:SetAlpha(0)
TargetFrameTextureFramePrestigeBadge:SetAlpha(0)
TargetFrameTextureFramePrestigePortrait:SetAlpha(0)
FocusFrameTextureFramePrestigeBadge:SetAlpha(0)
FocusFrameTextureFramePrestigePortrait:SetAlpha(0)


--CLASS ICONS
hooksecurefunc("UnitFramePortrait_Update",function(self)
    if self.unit == "player" or self.unit == "pet" then
        return
    end
    if self.portrait then
        if UnitIsPlayer(self.unit) then
            local x = CLASS_ICON_TCOORDS[select(2,UnitClass(self.unit))]
            if x then
                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                self.portrait:SetTexCoord(unpack(x))
            end
        else
            self.portrait:SetTexCoord(0,1,0,1)
        end
    end
end);


-- MINIMAP --

MinimapBorderTop:Hide()
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MiniMapWorldMapButton:Hide()




-- MISC --

MicroButtonAndBagsBar:Hide()

local t,f={"Character","Spellbook","Talent","Achievement","QuestLog","Guild","LFD","Collections","EJ","Store","MainMenu"}
for i=1,#t do f=_G[t[i].."MicroButton"]f:SetScale(.001)end;MicroButtonAndBagsBar:Hide()



-- CHAT BOX --

--SOCIAL BUTTON
QuickJoinToastButton:Hide()


--EXTRA CHAT FONTS
CHAT_FONT_HEIGHTS = {
      [1] = 8,
      [2] = 9,
      [3] = 10,
      [4] = 11,
      [5] = 12,
      [6] = 13,
      [7] = 14,
      [8] = 15,
      [9] = 16,
      [10] = 17,
      [11] = 18,
      [12] = 19,
      [13] = 20,
      [14] = 21,
      [15] = 22
   };	


--IN PROGRESS
--Bar Art Frame
--MainMenuBarArtFrameBackground:Hide()


--Action Bar Arrows
--ActionBarUpButton:Hide()
--ActionBarDownButton:Hide()
--MainMenuBarArtFrame.PageNumber:Hide()