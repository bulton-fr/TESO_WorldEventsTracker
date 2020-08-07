-- FRENCH LANGUAGE LOCALIZATION

-- GUI message

-- When we know dragon repop time
-- %d : Number of hour/minute/second before repop
-- %s : Time unit (see "GUI Timer" translations)
ZO_CreateStringId("SI_DRAGON_TRACKER_GUI_REPOP", ": Revient dans ~%d %s")

-- When we don't know repop time, we display killed since...
-- %s : Dragon status (flying/waiting/in fight/...)
-- %d : Number of hour/minute/second since the kill
-- %s : Time unit (see "GUI Timer" translations)
ZO_CreateStringId("SI_DRAGON_TRACKER_GUI_STATUS", ": %s depuis %d %s")

-- When we don't since how long a dragon has a status
-- %s : Dragon status (flying/waiting/in fight/...)
ZO_CreateStringId("SI_DRAGON_TRACKER_GUI_SIMPLE", ": %s")


-- GUI Timer

-- Times unit
ZO_CreateStringId("SI_DRAGON_TRACKER_TIMER_SECOND", "sec")
ZO_CreateStringId("SI_DRAGON_TRACKER_TIMER_MINUTE", "min")
ZO_CreateStringId("SI_DRAGON_TRACKER_TIMER_HOUR",   "h")


-- Bindings
ZO_CreateStringId("SI_BINDING_NAME_DRAGON_TRACKER_TOGGLE", "Afficher/Masquer")


-- Settings
ZO_CreateStringId("SI_DRAGON_TRACKER_SETTINGS_LOCK_UI", "Verrouiller l'interface")