--[[Author informations]]--
SWEP.Author = "KernCraft"
SWEP.Contact = "http://steamcommunity.com/profiles/76561198801100765"

-- team  "Alexander K."
-- contact "http://steamcommunity.com/profiles/76561198178624881"

local traitorVar = CreateConVar("ttt_awp_asiimov_traitor", 1, { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE }, "Should the AWP Asiimov be available for Traitors?", 0, 1)
local detectiveVar = CreateConVar("ttt_awp_asiimov_detective", 0, { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE }, "Should the AWP Asiimov be available for Detectives?", 0, 1)
local defaultClipSize = CreateConVar("ttt_awp_asiimov_bullets", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Amount of bullets you receive, when you buy a AWP Asiimov.", 1)
local clipSize = CreateConVar("ttt_awp_asiimov_max_bullets", 2, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Maximum magazine size of the AWP Asiimov.", 1)
local defaultdamage = CreateConVar("ttt_awp_asiimov_damage", 400, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Damage of the AWP Asiimov.", 1)
local headshotmulti = CreateConVar("ttt_awp_asiimov_headshotmultiplier", 2, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Headshot Multiplier Damage of the AWP Asiimov.", 1)

local hasLimitedStock = CreateConVar("ttt_awp_asiimov_limited_stock", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Can you buy the AWP Asiimov multiple times?", 0, 1)

local canBuy = {}
if traitorVar:GetBool() && detectiveVar:GetBool() then
  canBuy = {ROLE_TRAITOR, ROLE_DETECTIVE}
elseif traitorVar:GetBool() then
  canBuy = {ROLE_TRAITOR}
elseif detectiveVar:GetBool() then
  canBuy = {ROLE_DETECTIVE}
end

if SERVER then
	AddCSLuaFile()
else
	SWEP.PrintName = "AWP Asiimov"
	SWEP.Slot = 7
	SWEP.ViewModelFOV			= 70
	SWEP.ViewModelFlip			= true
end

-- Variables that are used on both client and server
SWEP.Gun = ("awp_asiimov") -- must be the name of your swep but NO CAPITALS!
SWEP.PrintName				= "AWP Asiimov"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 7				-- Slot in the weapon selection menu
SWEP.SlotPos				= 2			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.Weight				= 30			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair				= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.BoltAction				= true         -- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_asii_awp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_asiimow_awp_fixed.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true

SWEP.Primary.Sound			= Sound("awp_asiimov.shot")		-- script that calls the primary fire sound
SWEP.Primary.Damage			 = defaultdamage:GetInt()
SWEP.Primary.TakeAmmo		 = 1
--SWEP.Primary.Ammo 			= "357" 
SWEP.Primary.Delay			= 1.7
SWEP.Primary.Spread 		= 0.0001
SWEP.Primary.Cone			= 0.0001
SWEP.Primary.NumberofShots 	= 1
SWEP.Primary.Automatic		 = false
SWEP.HeadshotMultiplier 		= headshotmulti:GetInt()
SWEP.Primary.Force			 = 50 
SWEP.Primary.RPM			= 32		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= clipSize:GetInt()		-- Size of a clip
SWEP.Primary.DefaultClip		= defaultClipSize:GetInt()	-- Bullets you start with
SWEP.Primary.KickUp				= 1.0				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4 		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo				= "null"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

-- TTT settings
SWEP.Spawnable		= false
SWEP.AdminSpawnable = false
SWEP.Kind			= WEAPON_EQUIP1
--SWEP.AmmoEnt 		= "item_ammo_revolver_ttt"
SWEP.IsSilent 		= false
SWEP.NoSights 		= false
SWEP.Base 			= "weapon_tttbase"
SWEP.AllowDrop 		= true
SWEP.LimitedStock   = hasLimitedStock:GetBool()
SWEP.CanBuy = canBuy --{ ROLE_DETECTIVE , ROLE_TRAITOR }
-- needed Weapons Settings TTT settings

SWEP.Secondary.ScopeZoom		= 4
SWEP.Secondary.UseAWP			= true
SWEP.data 				= {}
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 0.51
SWEP.ReticleScale 			= 0.6

SWEP.Primary.IronAccuracy 		= 0.00001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector (0, 0, 0)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (0, 0, 0)

function SWEP:PreDrop()
    self:SetZoom(false)
    self:SetIronsights(false)
    return self.BaseClass.PreDrop(self)
end

function SWEP:Reload()
    self.Weapon:DefaultReload( ACT_VM_RELOAD );
    self:SetIronsights( false )
    self:SetZoom(false)
end


function SWEP:Holster()
    self:SetIronsights(false)
    self:SetZoom(false)
    return true
end

/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/

if CLIENT then
   SWEP.Icon = "vgui/ttt/icon_asiimov"
end

function SWEP:PreDrop()
    self:SetIronsights(false)
    self:SetZoom( false )
    return self.BaseClass.PreDrop(self)
end

function SWEP:SetZoom(state)
    if CLIENT then
       return
    elseif IsValid(self.Owner) and self.Owner:IsPlayer() then
       if state then
          self.Owner:SetFOV(20, 0.3)
       else
          self.Owner:SetFOV(0, 0.2)
       end
    end
end

function SWEP:SecondaryAttack()
    if not self.IronSightsPos then return end
    if self:GetNextSecondaryFire() > CurTime() then return end

    bIronsights = not self:GetIronsights()

    self:SetIronsights( bIronsights )

    if SERVER then
        self:SetZoom(bIronsights)
     else
        --self:EmitSound(self.Secondary.Sound)
    end

    self:SetNextSecondaryFire( CurTime() + 0.3)
	
	resource.AddFile("materials/vgui/ttt/icon_asiimov.vmt")
end

if CLIENT then
   local scope = surface.GetTextureID("sprites/scope")
   function SWEP:DrawHUD()
      if self:GetIronsights() then
         surface.SetDrawColor( 0, 0, 0, 255 )
         
         local x = ScrW() / 2.00
         local y = ScrH() / 2.00
         local scope_size = ScrH()

         -- crosshair
         local gap = 80
         local length = scope_size
         surface.DrawLine( x - length, y, x - gap, y )
         surface.DrawLine( x + length, y, x + gap, y )
         surface.DrawLine( x, y - length, x, y - gap )
         surface.DrawLine( x, y + length, x, y + gap )

         gap = 0
         length = 50
         surface.DrawLine( x - length, y, x - gap, y )
         surface.DrawLine( x + length, y, x + gap, y )
         surface.DrawLine( x, y - length, x, y - gap )
         surface.DrawLine( x, y + length, x, y + gap )


         -- cover edges
         local sh = scope_size / 2
         local w = (x - sh) + 2
         surface.DrawRect(0, 0, w, scope_size)
         surface.DrawRect(x + sh - 2, 0, w, scope_size)

         surface.SetDrawColor(255, 0, 0, 255)
         surface.DrawLine(x, y, x + 1, y + 1)

         -- scope
         surface.SetTexture(scope)
         surface.SetDrawColor(255, 255, 255, 255)

         surface.DrawTexturedRectRotated(x, y, scope_size, scope_size, 0)

      else
         return self.BaseClass.DrawHUD(self)
      end
   end

   function SWEP:AdjustMouseSensitivity()
      return (self:GetIronsights() and 0.2) or nil
   end
	  
	  SWEP.Icon = "VGUI/ttt/icon_asiimov"
   
      SWEP.EquipMenuData = {
      type = "Weapon",
      desc = "Blow someone away with your 500$ Asiimov"
   };
end

/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/


