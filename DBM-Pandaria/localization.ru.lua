﻿if GetLocale() ~= "ruRU" then return end

local L

-----------------------
-- Sha of Anger --
-----------------------
L= DBM:GetModLocalization(691)

L:SetOptionLocalization({
	RangeFrame			= "Показывать динамическое окно проверки дистанции, основанное<br/>на статусе игроков с дебаффом $spell:119622",
	ReadyCheck			= "Проигрывать звук проверки готовности когда пулят мирового босса (даже если он не является целью)"
})

L:SetMiscLocalization({
	Pull				= "Да… да! Дайте волю своей ярости! Попробуйте меня убить!"
})

-----------------------
-- Salyis --
-----------------------
L= DBM:GetModLocalization(725)

L:SetOptionLocalization({
	ReadyCheck			= "Проигрывать звук проверки готовности когда пулят мирового босса (даже если он не является целью)"
})

L:SetMiscLocalization({
	Pull				= "Принесите мне их трупы!"
})

--------------
-- Oondasta --
--------------
L= DBM:GetModLocalization(826)

L:SetOptionLocalization({
	ReadyCheck			= "Проигрывать звук проверки готовности когда пулят мирового босса (даже если он не является целью)"
})

L:SetMiscLocalization({
	Pull				= "Как вы смеете вмешиваться в наши планы! На этот раз зандаларов не остановить!"
})

---------------------------
-- Nalak, The Storm Lord --
---------------------------
L= DBM:GetModLocalization(814)

L:SetOptionLocalization({
	ReadyCheck			= "Проигрывать звук проверки готовности когда пулят мирового босса (даже если он не является целью)"
})

L:SetMiscLocalization({
	Pull				= "Чувствуете порывы холодного ветра?"
})

---------------------------
-- Chi-ji, The Red Crane --
---------------------------
L= DBM:GetModLocalization(857)

L:SetOptionLocalization({
	BeaconArrow				= "Показывать стрелку DBM когда на ком-то $spell:144473"
})

L:SetMiscLocalization({
	Pull					= "Тогда начнем.",
	Victory					= "Вас озаряет свет надежды, и он становится ярче, когда вы объединяетесь для свершений! Он будет светить вам даже в кромешной тьме."
})

------------------------------
-- Yu'lon, The Jade Serpent --
------------------------------
L= DBM:GetModLocalization(858)

L:SetMiscLocalization({
	Pull					= "Начнем схватку!",
	Wave1					= "Думайте о последствиях своих действий!",
	Wave2					= "Слушайте внутренний голос и стремитесь к истине!",
	Victory					= "Мудрость помогла вам пройти испытание. Пусть она всегда ведет вас к свету."
})

--------------------------
-- Niuzao, The Black Ox --
--------------------------
L= DBM:GetModLocalization(859)

L:SetMiscLocalization({
	Pull					= "Увидим.",
	Victory					= "Вас будут окружать враги невероятной силы. Большей, чем вы можете представить. Но вы все выдержите благодаря своей стойкости. Помните об этом!"
})

---------------------------
-- Xuen, The White Tiger --
---------------------------
L= DBM:GetModLocalization(860)

L:SetMiscLocalization({
	Pull					= "Ха-ха. Испытание начинается!",
	Victory					= "Вы сильны, даже сильнее, чем представляете! Ступайте с этим знанием во тьму, и оно защитит вас."
})

------------------------------------
-- Ordos, Fire-God of the Yaungol --
------------------------------------
L= DBM:GetModLocalization(861)
