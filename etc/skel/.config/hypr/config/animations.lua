hl.config({
	animations = {
		enabled = true,
	},
})

-- Animation curves
hl.curve("specialWorkSwitch", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })

--Animazioni personalizzate
hl.curve("overshootPop", { type = "bezier", points = { { 0.175, 0.885 }, { 0.32, 1.05 } } })

-- 2. Swift Out / Fast Decel: perfetta per chiusure o dissolvenze fade-out rapide
-- Parte istantaneamente e decelera in modo molto pulito senza rimbalzi
hl.curve("swiftOut", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })

-- 3. Dramatic Accel: ideale per finestre che vengono mandate fuori schermo (windowsOut)
-- Parte lenta e schizza via velocissima prima di sparire
hl.curve("dramaticAccel", { type = "bezier", points = { { 0.7, 0 }, { 0.84, 0 } } })

--Animazioni spring

hl.curve("bouncySpring", {
	type = "spring",
	mass = 1,
	stiffness = 100, --Più è alto il numero più è veloce
	dampening = 15, --Più è alto MINORE sarà il rimbalzo
})

-- Molla scattante e controllata con micro-rimbalzo per i workspace
hl.curve("workspaceSpring", {
	type = "spring",
	mass = 1,
	stiffness = 140,
	dampening = 13,
})

-- Molla morbida e smorzata (zero rimbalzi) per chiusure e fade
hl.curve("settleSpring", {
	type = "spring",
	mass = 1,
	stiffness = 140,
	dampening = 24,
})

-- Animation configs
hl.animation({ leaf = "layersIn", enabled = true, speed = 2, bezier = "overshootPop", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2, bezier = "swiftOut", style = "slide" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 3, bezier = "overshootPop" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, spring = "bouncySpring" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, spring = "settleSpring" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, spring = "bouncySpring" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 2, spring = "workspaceSpring" })

hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = 2,
	spring = "workspaceSpring",
	style = "slidefadevert 15%",
})
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "standard" })
