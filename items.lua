return {
PlaceObj('ModItemCode', {
	'name', "Achievement",
	'comment', "Class Def",
	'FileName', "Code/TrackedAchievement.lua",
}),
PlaceObj('ModItemCode', {
	'name', "AchievementTracker",
	'comment', "Tracking Code",
	'FileName', "Code/AchievementTracker.lua",
}),
PlaceObj('ModItemCode', {
	'name', "On Screen Display",
	'comment', "OSD for Primary Achievement",
	'FileName', "Code/OSD.lua",
}),
PlaceObj('ModItemCode', {
	'name', "Colony Control Center",
	'comment', "CCC (Command Center) Additions for Achievements",
	'FileName', "Code/CCC.lua",
}),
PlaceObj('ModItemOptionToggle', {
	'name', "ShowFailures",
	'DisplayName', "Show Failure Messages",
	'Help', "Show a message when an achievement is failed",
	'DefaultValue', true,
}),
PlaceObj('ModItemOptionToggle', {
	'name', "ShowMainAchievementWindow",
	'DisplayName', "Show Main Achievement Window",
	'Help', "Show the main achievement window in the top center of the screen, just below the infopanel.",
	'DefaultValue', true,
}),
PlaceObj('ModItemOptionNumber', {
	'name', "MessageLength",
	'DisplayName', "Message Length (Real-Time Seconds)",
	'Help', "How long the message will show on the screen in seconds.",
	'DefaultValue', 10,
	'MinValue', 1,
	'MaxValue', 60,
}),
PlaceObj('ModItemOptionNumber', {
	'name', "HourDelay",
	'DisplayName', "Message Delay (Hours)",
	'Help', "Delay in hours before showing another achievement progress message",
	'DefaultValue', 1,
	'MinValue', 0,
	'MaxValue', 25,
}),
PlaceObj('ModItemOptionNumber', {
	'name', "SolDelay",
	'DisplayName', "Message Delay (Sol)",
	'Help', "Delay in sols before showing another achievement progress message",
	'DefaultValue', 0,
	'MinValue', 0,
	'MaxValue', 7,
}),
PlaceObj('ModItemOptionChoice', {
	'name', "ShowOnScreen",
	'DisplayName', "Primary Achievement",
	'Help', "The primary achievement is always tracked on the top right of the screen",
	'DefaultValue', "Space Communism",
	'ChoiceList', {
		"Building a Better Future",
		"Asteroid Hopping",
		"You can't take the Sky from Me!",
		"Space Explorer",
		"For the Benefit of All",
		"Will they hold?",
		"Europa Universalis",
		"No Pain, No Gain",
		"Waste Not, Want Not",
		"Posthuman",
		"S.P.E.C.I.A.L.",
		"Dream of a Green Mars",
		"Can't Stop the Signal",
		"The Final Frontier",
		"Wubba, lubba, dub, dub!",
		"In the Service of Humankind",
		"The New Wonders of the World",
		"Gagarin's Legacy",
		"Interesting Times",
		"Multiplanet Species",
		"Space Communism",
		"The New Ark",
		"Assisted Self-Improvement",
		"Marsopolis",
		"Do Androids Dream of Electric Sheep?",
	},
}),
}