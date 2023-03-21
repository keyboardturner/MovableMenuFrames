--MoveMenusF_DB
--StatusTrackingBarManager

local defaultsTable = {
	MicromenuFrame = {show = true, checked = true, scale = 1, x = 0, y = 0, point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT"},
	BagbuttonsFrame = {show = true, checked = true, scale = 1, x = 0, y = 37, point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT"},
	XPBarFrame = {show = true, checked = true, scale = 1, x = 0, y = 0, point = "BOTTOM", relativePoint = "BOTTOM"},
	QueueButton = {show = true, checked = true, scale = 1, x = 0, y = 0, point = "BOTTOM", relativePoint = "BOTTOM"},
	locked = false,
	account = true,
}

local MenuEventFrame = CreateFrame("Frame");

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
MenuFramePanel.Version:SetText("Version: " .. GetAddOnMetadata("MovableMenuFrames", "Version"));

MenuFramePanel.Update = MenuFramePanel:CreateFontString(nil, "OVERLAY", "GameFontNormal");
MenuFramePanel.Update:SetFont(MenuFramePanel.Update:GetFont(), 14);
MenuFramePanel.Update:SetTextColor(1,1,1,1);
MenuFramePanel.Update:ClearAllPoints();
MenuFramePanel.Update:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",12,-200);
MenuFramePanel.Update:SetText("Patch 10.0.5 Edit Mode now mostly handles scaling and placement of frames!");


------------------------------------------------------------------------------------------------------------------

--menu slider
--[[ -- defunct in 10.0.5
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
	MoveMenusALL_DB.MicromenuFrame.scale = scaleValue;
	MicroButtonAndBagsBar:SetScale(scaleValue);
end)
]]

--buttons slider
--[[ -- defunct in 10.0.5
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
	MoveMenusALL_DB.BagbuttonsFrame.scale = scaleValue;
	MainMenuBarBackpackButton:SetScale(scaleValue);
end)
]]

--xp bar slider
MenuFramePanel.XPBarSlider = CreateFrame("Slider", "XPBarSlider", MenuFramePanel, "OptionsSliderTemplate");
MenuFramePanel.XPBarSlider:SetWidth(300);
MenuFramePanel.XPBarSlider:SetHeight(15);
MenuFramePanel.XPBarSlider:SetMinMaxValues(50,150);
MenuFramePanel.XPBarSlider:SetValueStep(1);
MenuFramePanel.XPBarSlider:ClearAllPoints();
MenuFramePanel.XPBarSlider:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",12,-53);
getglobal(MenuFramePanel.XPBarSlider:GetName() .. 'Low'):SetText('50');
getglobal(MenuFramePanel.XPBarSlider:GetName() .. 'High'):SetText('150');
getglobal(MenuFramePanel.XPBarSlider:GetName() .. 'Text'):SetText('XP Bar Frame Size');
MenuFramePanel.XPBarSlider:SetScript("OnValueChanged", function()
	local scaleValue = getglobal(MenuFramePanel.XPBarSlider:GetName()):GetValue() / 100;
	MoveMenusF_DB.XPBarFrame.scale = scaleValue;
	MoveMenusALL_DB.XPBarFrame.scale = scaleValue;
	StatusTrackingBarManager:SetScale(scaleValue);
end)

--Queue Status slider
MenuFramePanel.QueueSlider = CreateFrame("Slider", "QueueSlider", MenuFramePanel, "OptionsSliderTemplate");
MenuFramePanel.QueueSlider:SetWidth(300);
MenuFramePanel.QueueSlider:SetHeight(15);
MenuFramePanel.QueueSlider:SetMinMaxValues(50,150);
MenuFramePanel.QueueSlider:SetValueStep(1);
MenuFramePanel.QueueSlider:ClearAllPoints();
MenuFramePanel.QueueSlider:SetPoint("TOPLEFT", MenuFramePanel, "TOPLEFT",12,-53*2);
getglobal(MenuFramePanel.QueueSlider:GetName() .. 'Low'):SetText('50');
getglobal(MenuFramePanel.QueueSlider:GetName() .. 'High'):SetText('150');
getglobal(MenuFramePanel.QueueSlider:GetName() .. 'Text'):SetText('Queue Status Frame Size');
MenuFramePanel.QueueSlider:SetScript("OnValueChanged", function()
	local scaleValue = getglobal(MenuFramePanel.QueueSlider:GetName()):GetValue() / 100;
	MoveMenusF_DB.QueueButton.scale = scaleValue;
	MoveMenusALL_DB.QueueButton.scale = scaleValue;
	QueueStatusButton:SetScale(scaleValue);
end)

------------------------------------------------------------------------------------------------------------------

--frames movable
MenuFramePanel.LockedCheckbox = CreateFrame("CheckButton", "LockedCheckbox", MenuFramePanel, "UICheckButtonTemplate");
MenuFramePanel.LockedCheckbox:ClearAllPoints();
MenuFramePanel.LockedCheckbox:SetPoint("TOPLEFT", 350, -53);
getglobal(MenuFramePanel.LockedCheckbox:GetName().."Text"):SetText("Frames Locked");

MenuFramePanel.LockedCheckbox:SetScript("OnClick", function(self)
	if MenuFramePanel.LockedCheckbox:GetChecked() then
		MoveMenusALL_DB.locked = true;
		MicroButtonAndBagsBar:EnableMouse(false)
		QueueStatusButton:Hide()
	else
		MoveMenusALL_DB.locked = false;
		MicroButtonAndBagsBar:EnableMouse(true)
		QueueStatusButton:Show()
	end
end);

------------------------------------------------------------------------------------------------------------------

--frames movable
MenuFramePanel.AccountCheckbox = CreateFrame("CheckButton", "AccountCheckbox", MenuFramePanel, "UICheckButtonTemplate");
MenuFramePanel.AccountCheckbox:ClearAllPoints();
MenuFramePanel.AccountCheckbox:SetPoint("TOPLEFT", 350, -53*2);
getglobal(MenuFramePanel.AccountCheckbox:GetName().."Text"):SetText("Account-Wide Settings");

MenuFramePanel.AccountCheckbox:SetScript("OnClick", function(self)
	if MenuFramePanel.AccountCheckbox:GetChecked() then
		MoveMenusALL_DB.account = true;
		MenuEventFrame.ReMoveStuff()
	else
		MoveMenusALL_DB.account = false;
		MenuEventFrame.ReMoveStuff()
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

MenuEventFrame:RegisterEvent("ADDON_LOADED");
MenuEventFrame:RegisterEvent("PLAYER_LOGOUT");
MenuEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");


function MenuEventFrame.ReMoveStuff()

	MenuFramePanel.LockedCheckbox:SetChecked(MoveMenusALL_DB.locked);
	MenuFramePanel.AccountCheckbox:SetChecked(MoveMenusALL_DB.account);

	if MoveMenusALL_DB.account == true then -- account settings

		--MenuFramePanel.MicroMenuSlider:SetValue(MoveMenusALL_DB.MicromenuFrame.scale*100);
		--MenuFramePanel.BagButtonsSlider:SetValue(MoveMenusALL_DB.BagbuttonsFrame.scale*100);
		MenuFramePanel.XPBarSlider:SetValue(MoveMenusALL_DB.XPBarFrame.scale*100);
		MenuFramePanel.QueueSlider:SetValue(MoveMenusALL_DB.QueueButton.scale*100);
		
		--[[ -- defunct in 10.0.5
		MicroButtonAndBagsBar:ClearAllPoints()
		MicroButtonAndBagsBar:SetPoint(MoveMenusALL_DB.MicromenuFrame.point, UIParent, MoveMenusALL_DB.MicromenuFrame.relativePoint, MoveMenusALL_DB.MicromenuFrame.x, MoveMenusALL_DB.MicromenuFrame.y);
		MicroButtonAndBagsBar:SetScale(MoveMenusALL_DB.MicromenuFrame.scale);
		MainMenuBarBackpackButton:ClearAllPoints()
		MainMenuBarBackpackButton:SetPoint(MoveMenusALL_DB.BagbuttonsFrame.point, UIParent, MoveMenusALL_DB.BagbuttonsFrame.relativePoint, MoveMenusALL_DB.BagbuttonsFrame.x, MoveMenusALL_DB.BagbuttonsFrame.y);
		MainMenuBarBackpackButton:SetScale(MoveMenusALL_DB.BagbuttonsFrame.scale);
		StatusTrackingBarManager:ClearAllPoints()
		StatusTrackingBarManager:SetPoint(MoveMenusALL_DB.XPBarFrame.point, UIParent, MoveMenusALL_DB.XPBarFrame.relativePoint, MoveMenusALL_DB.XPBarFrame.x, MoveMenusALL_DB.XPBarFrame.y);
		]]
		QueueStatusButton:ClearAllPoints()
		QueueStatusButton:SetPoint(MoveMenusALL_DB.QueueButton.point, UIParent, MoveMenusALL_DB.QueueButton.relativePoint, MoveMenusALL_DB.QueueButton.x, MoveMenusALL_DB.QueueButton.y);
		QueueStatusButton:SetScale(MoveMenusALL_DB.QueueButton.scale);

		StatusTrackingBarManager:SetScale(MoveMenusALL_DB.XPBarFrame.scale);

	end

	if MoveMenusALL_DB.account == false then -- character specific settings

		--MenuFramePanel.MicroMenuSlider:SetValue(MoveMenusF_DB.MicromenuFrame.scale*100);
		--MenuFramePanel.BagButtonsSlider:SetValue(MoveMenusF_DB.BagbuttonsFrame.scale*100);
		MenuFramePanel.XPBarSlider:SetValue(MoveMenusF_DB.XPBarFrame.scale*100);
		--MenuFramePanel.QueueSlider:SetValue(MoveMenusF_DB.QueueButton.scale*100);

		--[[ -- defunct in 10.0.5
		MicroButtonAndBagsBar:ClearAllPoints()
		MicroButtonAndBagsBar:SetPoint(MoveMenusF_DB.MicromenuFrame.point, UIParent, MoveMenusF_DB.MicromenuFrame.relativePoint, MoveMenusF_DB.MicromenuFrame.x, MoveMenusF_DB.MicromenuFrame.y);
		MicroButtonAndBagsBar:SetScale(MoveMenusF_DB.MicromenuFrame.scale);
		MainMenuBarBackpackButton:ClearAllPoints()
		MainMenuBarBackpackButton:SetPoint(MoveMenusF_DB.BagbuttonsFrame.point, UIParent, MoveMenusF_DB.BagbuttonsFrame.relativePoint, MoveMenusF_DB.BagbuttonsFrame.x, MoveMenusF_DB.BagbuttonsFrame.y);
		MainMenuBarBackpackButton:SetScale(MoveMenusF_DB.BagbuttonsFrame.scale);
		StatusTrackingBarManager:ClearAllPoints()
		StatusTrackingBarManager:SetPoint(MoveMenusF_DB.XPBarFrame.point, UIParent, MoveMenusF_DB.XPBarFrame.relativePoint, MoveMenusF_DB.XPBarFrame.x, MoveMenusF_DB.XPBarFrame.y);
		]]
		QueueStatusButton:ClearAllPoints()
		QueueStatusButton:SetPoint(MoveMenusF_DB.QueueButton.point, UIParent, MoveMenusF_DB.QueueButton.relativePoint, MoveMenusF_DB.QueueButton.x, MoveMenusF_DB.QueueButton.y);
		QueueStatusButton:SetScale(MoveMenusF_DB.QueueButton.scale);

		StatusTrackingBarManager:SetScale(MoveMenusF_DB.XPBarFrame.scale);

	end

end


function MenuEventFrame.Stuff(frame,button)
	frame:SetMovable(true);
	if not MicroButtonAndBagsBar then
		frame:EnableMouse(true);
	end
	frame:SetUserPlaced(true);
	frame:RegisterForDrag("LeftButton", "RightButton");
	frame:SetClampedToScreen(true)

	frame:SetScript("OnMouseDown", function(self, button)
		if MoveMenusALL_DB.locked == false then
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
		--[[ -- defunct in 10.0.5
		if frame == MicroButtonAndBagsBar then
			Mixin(self, BackdropTemplateMixin);
			frame:SetBackdropColor(0,0,0,0);
			self:StopMovingOrSizing();
			self.isMoving = false;
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint();

			if MoveMenusALL_DB.account == true then

				MoveMenusALL_DB.MicromenuFrame.point = point
				MoveMenusALL_DB.MicromenuFrame.relativePoint = relativePoint
				MoveMenusALL_DB.MicromenuFrame.x = xOfs
				MoveMenusALL_DB.MicromenuFrame.y = yOfs
				
			end

			if MoveMenusALL_DB.account == false then

				MoveMenusF_DB.MicromenuFrame.point = point
				MoveMenusF_DB.MicromenuFrame.relativePoint = relativePoint
				MoveMenusF_DB.MicromenuFrame.x = xOfs
				MoveMenusF_DB.MicromenuFrame.y = yOfs

			end
		end
		if frame == MainMenuBarBackpackButton then
			Mixin(self, BackdropTemplateMixin);
			frame:SetBackdropColor(0,0,0,0);
			self:StopMovingOrSizing();
			self.isMoving = false;
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint();

			if MoveMenusALL_DB.account == true then

				MoveMenusALL_DB.BagbuttonsFrame.point = point
				MoveMenusALL_DB.BagbuttonsFrame.relativePoint = relativePoint
				MoveMenusALL_DB.BagbuttonsFrame.x = xOfs
				MoveMenusALL_DB.BagbuttonsFrame.y = yOfs

			end

			if MoveMenusALL_DB.account == false then

				MoveMenusF_DB.BagbuttonsFrame.point = point
				MoveMenusF_DB.BagbuttonsFrame.relativePoint = relativePoint
				MoveMenusF_DB.BagbuttonsFrame.x = xOfs
				MoveMenusF_DB.BagbuttonsFrame.y = yOfs

			end

		end
		]]
		if frame == StatusTrackingBarManager then
			Mixin(self, BackdropTemplateMixin);
			frame:SetBackdropColor(0,0,0,0);
			self:StopMovingOrSizing();
			self.isMoving = false;
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint();

			if MoveMenusALL_DB.account == true then

				MoveMenusALL_DB.XPBarFrame.point = point
				MoveMenusALL_DB.XPBarFrame.relativePoint = relativePoint
				MoveMenusALL_DB.XPBarFrame.x = xOfs
				MoveMenusALL_DB.XPBarFrame.y = yOfs

			end

			if MoveMenusALL_DB.account == false then

				MoveMenusF_DB.XPBarFrame.point = point
				MoveMenusF_DB.XPBarFrame.relativePoint = relativePoint
				MoveMenusF_DB.XPBarFrame.x = xOfs
				MoveMenusF_DB.XPBarFrame.y = yOfs
			end
		end
		if frame == QueueStatusButton then
			Mixin(self, BackdropTemplateMixin);
			frame:SetBackdropColor(0,0,0,0);
			self:StopMovingOrSizing();
			self.isMoving = false;
			local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint();

			if MoveMenusALL_DB.account == true then

				MoveMenusALL_DB.QueueButton.point = point
				MoveMenusALL_DB.QueueButton.relativePoint = relativePoint
				MoveMenusALL_DB.QueueButton.x = xOfs
				MoveMenusALL_DB.QueueButton.y = yOfs

			end

			if MoveMenusALL_DB.account == false then

				MoveMenusF_DB.QueueButton.point = point
				MoveMenusF_DB.QueueButton.relativePoint = relativePoint
				MoveMenusF_DB.QueueButton.x = xOfs
				MoveMenusF_DB.QueueButton.y = yOfs
			end
		end
	end);
end

function MenuEventFrame:OnEvent(event,arg1)
	if event == "ADDON_LOADED" and arg1 == "MovableMenuFrames" then
		if not MoveMenusALL_DB then
			if MoveMenusF_DB then
				MoveMenusALL_DB = MoveMenusF_DB;
			end
		end
		if not MoveMenusF_DB then
			MoveMenusF_DB = defaultsTable;
		end
		if not MoveMenusALL_DB then
			MoveMenusALL_DB = defaultsTable;
		end
		if not MoveMenusALL_DB.account then
			MoveMenusALL_DB.account = true
		end

		if not MoveMenusF_DB.MicromenuFrame.scale then
			MoveMenusF_DB.MicromenuFrame.scale = defaultsTable.MicromenuFrame.scale;
			MoveMenusF_DB.BagbuttonsFrame.scale = defaultsTable.BagbuttonsFrame.scale;
			MoveMenusF_DB.XPBarFrame.scale = defaultsTable.XPBarFrame.scale;
		end
		if not MoveMenusALL_DB.locked then
			MoveMenusALL_DB.locked = defaultsTable.locked;
		end
		if MoveMenusALL_DB.locked == false then
			MicroButtonAndBagsBar:EnableMouse(true)
			QueueStatusButton:Show()
		end
		--MicroButtonAndBagsBar:EnableMouse(not MoveMenusALL_DB.locked); -- this could maybe cause issues later, we'll see
		--MenuEventFrame.Stuff(MicroButtonAndBagsBar);
		--MenuEventFrame.Stuff(MainMenuBarBackpackButton);
		--MenuEventFrame.Stuff(StatusTrackingBarManager); --(movement is now handled by default UI)
		MenuEventFrame.Stuff(QueueStatusButton);

		MenuEventFrame.ReMoveStuff()
		
	end
	if event == "PLAYER_LOGOUT" then
		MicroButtonAndBagsBar:ClearAllPoints();
		MainMenuBarBackpackButton:ClearAllPoints();
		StatusTrackingBarManager:ClearAllPoints();
	end
	if event == "PLAYER_ENTERING_WORLD" then
		MicroButtonAndBagsBar:EnableMouse(false)
		if MoveMenusALL_DB.locked == false then
			MicroButtonAndBagsBar:EnableMouse(true)
			QueueStatusButton:Show()
		end
	end
end
MenuEventFrame:SetScript("OnEvent",MenuEventFrame.OnEvent);