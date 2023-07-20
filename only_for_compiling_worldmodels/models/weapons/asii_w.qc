$cd "Your_Data\only_for_compiling_worldmodels\models\weapons"
$modelname "w_asiimow_awp_fixed"
$scale 1.00
$cdmaterials "models\weapons\v_models\awp_csgo\"

$texturegroup "skinfamilies"
{
	{
		"awp"
		"NAWM"
	}
}
$hboxset "default"
$attachment "muzzle" "ValveBiped.Bip01_R_Hand" 44.50 -0.50 -11.25 rotate 10 0 -180
$attachment "eject" "ValveBiped.Bip01_R_Hand" 7.50 -0.50 -5.75 rotate 10 0 180
$body "Body" "asii_w.smd"

$illumposition -0.111 12.495 -2.464

$sequence "Idle" "asii_w.smd" fps 30 ACT_IDLE 1

$surfaceprop "metal"

$collisionmodel "w_asii_awp_physics.smd" {
	$mass 5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}

$keyvalues
{
	prop_data 
	{
		"base" "Metal.Small"
	}
}