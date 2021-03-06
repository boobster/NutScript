local PLUGIN = PLUGIN

if (CLIENT) then
	SWEP.PrintName = "Keys"
	SWEP.Slot = 1
	SWEP.SlotPos = 2
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "Chessnut"
SWEP.Instructions = "Primary Fire: Lock\nSecondary Fire: Unlock"
SWEP.Purpose = "Keys to doors you own."
SWEP.Drop = false

SWEP.ViewModelFOV = 36
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.ViewTranslation = 4

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Primary.Damage = 15
SWEP.Primary.Delay = 0.75

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.ViewModel = Model("models/props_junk/watermelon01.mdl")
SWEP.WorldModel = ""

SWEP.AlwaysRaised = true
SWEP.DrawViewModel = false

function SWEP:Precache()
	util.PrecacheSound("npc/vort/claw_swing1.wav")
	util.PrecacheSound("npc/vort/claw_swing2.wav")
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard1.wav")	
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard2.wav")	
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard3.wav")	
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard4.wav")
	util.PrecacheSound("doors/door_latch1.wav")
	util.PrecacheSound("doors/door_latch3.wav")
end

function SWEP:Initialize()
	self:SetWeaponHoldType("fist")
	self.LastHand = 0
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)

	if (CLIENT) then
		return
	end

	self:EmitSound("npc/vort/claw_swing"..math.random(1, 2)..".wav")
	
	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector() * 84
		data.filter = self.Owner
	local trace = util.TraceLine(data)
	local entity = trace.Entity

	if (IsValid(entity)) then
		if (!PLUGIN:IsDoor(entity)) then
			nut.util.Notify("This is not a valid door.", self.Owner)

			return
		end

		if (entity:GetNetVar("owner") != self.Owner) then
			nut.util.Notify("You are not the owner of this door.", self.Owner)

			return
		end
		
		entity:EmitSound("doors/door_latch1.wav")
		PLUGIN:LockDoor(entity)
	end
end

function SWEP:SecondaryAttack()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	
	if (CLIENT) then
		return
	end

	self:EmitSound("npc/vort/claw_swing"..math.random(1, 2)..".wav")
	
	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector() * 84
		data.filter = self.Owner
	local trace = util.TraceLine(data)
	local entity = trace.Entity

	if (SERVER and IsValid(entity)) then
		if (!PLUGIN:IsDoor(entity)) then
			nut.util.Notify("This is not a valid door.", self.Owner)

			return
		end

		if (entity:GetNetVar("owner") != self.Owner) then
			nut.util.Notify("You are not the owner of this door.", self.Owner)

			return
		end

		entity:EmitSound("doors/door_latch3.wav")
		PLUGIN:UnlockDoor(entity)
	end
end