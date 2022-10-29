--MoveMenusF_DB
--StatusTrackingBarManager

local defaultsTable = {
	MicromenuFrame = {show = true, checked = true, scale = 1, x = 0, y = 0, point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT"},
	BagbuttonsFrame = {show = true, checked = true, scale = 1, x = 0, y = 37, point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT"},
	XPBarFrame = {show = true, checked = true, scale = 1, x = 0, y = 0, point = "BOTTOM", relativePoint = "BOTTOM"},
	locked = false,
}

MoveMenusF_DB = MoveMenusF_DB or defaultsTable

local MenuFramePanel = CreateFrame("FRAME", "BagStuff");
MenuFramePanel.name = "Movable Menu Frames";

MenuFramePanel.Headline = MenuFramePanel:CreateFontString(nil, "OVERLAY", "GameFontNormal");
MenuFramePanel.Headline:SetFont(MenuFramePanel.Headline:GetFont(), 23);
MenuFramePanel.Headline:SetTextColor(0,1,0,1);
MenuFramePanel.Headline:ClearAllPoints();
MenuFramePanel.Headline:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",12,-12);
MenuFramePanel.Headline:SetText("Movable Menu Frames & XP Bar");

MenuFramePanel.Version = MenuFramePanel:CreateFontString(nil, "OVERLAY", "GameFontNormal");
MenuFramePanel.Version:SetFont(MenuFramePanel.Version:GetFont(), 12);
MenuFramePanel.Version:SetTextColor(1,1,1,1);
MenuFramePanel.Version:ClearAllPoints();
MenuFramePanel.Version:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",400,-21);
MenuFramePanel.Version:SetText("Version: " .. GetAddOnMetadata("MovableMenuFRames", "Version"));


------------------------------------------------------------------------------------------------------------------

--menu slider
MenuFramePanel.MicroMenuSlider = CreateFrame("Slider", "MenuFrameScaleSlider", MenuFramePanel, "OptionsSliderTemplate");
MenuFramePanel.MicroMenuSlider:SetWidth(300);
MenuFramePanel.MicroMenuSlider:SetHeight(15);
MenuFramePanel.MicroMenuSlider:SetMinMaxValues(50,150);
MenuFramePanel.MicroMenuSlider:SetValueStep(1);
MenuFramePanel.MicroMenuSlider:ClearAllPoints();
MenuFramePanel.MicroMenuSlider:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",12,-53);
getglobal(MenuFramePanel.MicroMenuSlider:GetName() .. 'Low'):SetText('50');
getglobal(MenuFramePanel.MicroMenuSlider:GetName() .. 'High'):SetText('150');
getglobal(MenuFramePanel.MicroMenuSlider:GetName() .. 'Text'):SetText('Micromenu Frame Size');
MenuFramePanel.MicroMenuSlider:SetScript("OnValueChanged", function()
	local scaleValue = getglobal(MenuFramePanel.MicroMenuSlider:GetName()):GetValue() / 100;
	MoveMenusF_DB.MicromenuFrame.scale = scaleValue;
	MicroButtonAndBagsBar:SetScale(scaleValue);
end)


--buttons slider
MenuFramePanel.BagButtonsSlider = CreateFrame("Slider", "BagButtonsSlider", MenuFramePanel, "OptionsSliderTemplate");
MenuFramePanel.BagButtonsSlider:SetWidth(300);
MenuFramePanel.BagButtonsSlider:SetHeight(15);
MenuFramePanel.BagButtonsSlider:SetMinMaxValues(50,150);
MenuFramePanel.BagButtonsSlider:SetValueStep(1);
MenuFramePanel.BagButtonsSlider:ClearAllPoints();
MenuFramePanel.BagButtonsSlider:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",12,-53*2);
getglobal(MenuFramePanel.BagButtonsSlider:GetName() .. 'Low'):SetText('50');
getglobal(MenuFramePanel.BagButtonsSlider:GetName() .. 'High'):SetText('150');
getglobal(MenuFramePanel.BagButtonsSlider:GetName() .. 'Text'):SetText('Bag Buttons Size');
MenuFramePanel.BagButtonsSlider:SetScript("OnValueChanged", function()
	local scaleValue = getglobal(MenuFramePanel.BagButtonsSlider:GetName()):GetValue() / 100;
	MoveMenusF_DB.BagbuttonsFrame.scale = scaleValue;
	MoveMenusF_DB.BagbuttonsFrame.scale = scaleValue;
	MainMenuBarBackpackButton:SetScale(scaleValue);
end)

--xp bar slider
MenuFramePanel.XPBarSlider = CreateFrame("Slider", "XPBarSlider", MenuFramePanel, "OptionsSliderTemplate");
MenuFramePanel.XPBarSlider:SetWidth(300);
MenuFramePanel.XPBarSlider:SetHeight(15);
MenuFramePanel.XPBarSlider:SetMinMaxValues(50,150);
MenuFramePanel.XPBarSlider:SetValueStep(1);
MenuFramePanel.XPBarSlider:ClearAllPoints();
MenuFramePanel.XPBarSlider:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",12,-53*3);
getglobal(MenuFramePanel.XPBarSlider:GetName() .. 'Low'):SetText('50');
getglobal(MenuFramePanel.XPBarSlider:GetName() .. 'High'):SetText('150');
getglobal(MenuFramePanel.XPBarSlider:GetName() .. 'Text'):SetText('XP Bar Frame Size');
MenuFramePanel.XPBarSlider:SetScript("OnValueChanged", function()
	local scaleValue = getglobal(MenuFramePanel.XPBarSlider:GetName()):GetValue() / 100;
	MoveMenusF_DB.XPBarFrame.scale = scaleValue;
	MoveMenusF_DB.XPBarFrame.scale = scaleValue;
	StatusTrackingBarManager:SetScale(scaleValue);
end)

------------------------------------------------------------------------------------------------------------------

--frames movable
MenuFramePanel.LockedCheckbox = CreateFrame("CheckButton", "LockedCheckbox", MenuFramePanel, "UICheckButtonTemplate");
MenuFramePanel.LockedCheckbox:ClearAllPoints();
MenuFramePanel.LockedCheckbox:SetPoint("TOPLEFT", 350, -53);
getglobal(MenuFramePanel.LockedCheckbox:GetName().."Text"):SetText("Frames Locked");

MenuFramePanel.LockedCheckbox:SetScript("OnClick", function(self)
	if MenuFramePanel.LockedCheckbox:GetChecked() then
		MoveMenusF_DB.locked = true;
	else
		MoveMenusF_DB.locked = false;
	end
end);



------------------------------------------------------------------------------------------------------------------

--final
InterfaceOptions_AddCategory(MenuFramePanel);

--MicroButtonAndBagsBar
--defaults: BOTTOMRIGHT UIParent BOTTOMRIGHT 0 0
--MainMenuBarBackpackButton
--defaults: TOPRIGHT MicroButtonAndBagsBar TOPRIGHT -4 2
--new default: BOTTOMRIGHT UIParent BOTTOMRIGHT 0 37
--StatusTrackingBarManager
--defaults: BOTTOM UIParent BOTTOM 0 0


local MenuEventFrame = CreateFrame("Frame");
MenuEventFrame:RegisterEvent("ADDON_LOADED");
MenuEventFrame:RegisterEvent("PLAYER_LOGOUT");


function MenuEventFrame.ReMoveStuff()

	MenuFramePanel.LockedCheckbox:SetChecked(MoveMenusF_DB.locked);

	MicroButtonAndBagsBar:ClearAllPoints()
	MicroButtonAndBagsBar:SetPoint(MoveMenusF_DB.MicromenuFrame.point, nil, MoveMenusF_DB.MicromenuFrame.relativePoint, MoveMenusF_DB.MicromenuFrame.x, MoveMenusF_DB.MicromenuFrame.y);
	MicroButtonAndBagsBar:SetScale(MoveMenusF_DB.MicromenuFrame.scale);
	MainMenuBarBackpackButton:ClearAllPoints()
	MainMenuBarBackpackButton:SetPoint(MoveMenusF_DB.BagbuttonsFrame.point, UIParent, MoveMenusF_DB.BagbuttonsFrame.relativePoint, MoveMenusF_DB.BagbuttonsFrame.x, MoveMenusF_DB.BagbuttonsFrame.y);
	MainMenuBarBackpackButton:SetScale(MoveMenusF_DB.BagbuttonsFrame.scale);
	StatusTrackingBarManager:ClearAllPoints()
	StatusTrackingBarManager:SetPoint(MoveMenusF_DB.XPBarFrame.point, nil, MoveMenusF_DB.XPBarFrame.relativePoint, MoveMenusF_DB.XPBarFrame.x, MoveMenusF_DB.XPBarFrame.y);
	StatusTrackingBarManager:SetScale(MoveMenusF_DB.XPBarFrame.scale);
end


function MenuEventFrame.Stuff(frame,button)
	frame:SetMovable(true);
	MicroButtonAndBagsBar:EnableMouse(not MoveMenusF_DB.locked);
	frame:SetUserPlaced(true);
	frame:RegisterForDrag("LeftButton", "RightButton");
	frame:SetClampedToScreen(true)

	frame:SetScript("OnMouseDown", function(self, button)
		if MoveMenusF_DB.locked == false then
			if button == "LeftButton" and not self.isMoving then
				Mixin(self, BackdropTemplateMixin);
				frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", insets = { left = -30, right = -1, top = -1, bottom = -1 }});
				frame:SetBackdropColor(1,.71,.75,.5);
				self:StartMoving();
				self.isMoving = true;
			end
		else
			return
		end
	end);
	frame:SetScript("OnMouseUp", function(self)
		if MicroButtonAndBagsBar then
			Mixin(self, BackdropTemplateMixin);
			frame:SetBackdropColor(0,0,0,0);
			self:StopMovingOrSizing();
			self.isMoving = false;
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint();

			MoveMenusF_DB.MicromenuFrame.point = point
			MoveMenusF_DB.MicromenuFrame.relativePoint = relativePoint
			MoveMenusF_DB.MicromenuFrame.x = xOfs
			MoveMenusF_DB.MicromenuFrame.y = yOfs
		end
		if MainMenuBarBackpackButton then
			Mixin(self, BackdropTemplateMixin);
			frame:SetBackdropColor(0,0,0,0);
			self:StopMovingOrSizing();
			self.isMoving = false;
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint();

			MoveMenusF_DB.BagbuttonsFrame.point = point
			MoveMenusF_DB.BagbuttonsFrame.relativePoint = relativePoint
			MoveMenusF_DB.BagbuttonsFrame.x = xOfs
			MoveMenusF_DB.BagbuttonsFrame.y = yOfs

		end
		if StatusTrackingBarManager then
			Mixin(self, BackdropTemplateMixin);
			frame:SetBackdropColor(0,0,0,0);
			self:StopMovingOrSizing();
			self.isMoving = false;
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint();

			MoveMenusF_DB.XPBarFrame.point = point
			MoveMenusF_DB.XPBarFrame.relativePoint = relativePoint
			MoveMenusF_DB.XPBarFrame.x = xOfs
			MoveMenusF_DB.XPBarFrame.y = yOfs
		end
	end);
end

function MenuEventFrame:OnEvent(event,arg1)
	if event == "ADDON_LOADED" and arg1 == "MovableMenuFrames" then
		if not MoveMenusF_DB then
			MoveMenusF_DB = defaultsTable;
		end
		if not MoveMenusF_DB.MicromenuFrame.scale then
			MoveMenusF_DB.MicromenuFrame.scale = defaultsTable.MicromenuFrame.scale;
			MoveMenusF_DB.BagbuttonsFrame.scale = defaultsTable.BagbuttonsFrame.scale;
			MoveMenusF_DB.XPBarFrame.scale = defaultsTable.XPBarFrame.scale;
		end
		if not MoveMenusF_DB.locked then
			MoveMenusF_DB.locked = defaultsTable.locked;
		end
		MenuFramePanel.MicroMenuSlider:SetValue(MoveMenusF_DB.MicromenuFrame.scale*100);
		MenuFramePanel.BagButtonsSlider:SetValue(MoveMenusF_DB.BagbuttonsFrame.scale*100);
		MenuFramePanel.XPBarSlider:SetValue(MoveMenusF_DB.XPBarFrame.scale*100);
		MenuEventFrame.ReMoveStuff();
		MenuEventFrame.Stuff(MicroButtonAndBagsBar);
		MenuEventFrame.Stuff(MainMenuBarBackpackButton);
		MenuEventFrame.Stuff(StatusTrackingBarManager);
	end
	if event == "PLAYER_LOGOUT" then
		MicroButtonAndBagsBar:ClearAllPoints();
		MainMenuBarBackpackButton:ClearAllPoints();
		StatusTrackingBarManager:ClearAllPoints();
	end
end
MenuEventFrame:SetScript("OnEvent",MenuEventFrame.OnEvent);