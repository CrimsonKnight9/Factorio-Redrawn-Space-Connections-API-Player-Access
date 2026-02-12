data:extend({
    {
        setting_type = "startup",
        type = "string-setting",
        name = "choosing-connections-to-keep",
        default_value = "nauvis-vulcanus, nauvis-fulgora, nauvis-gleba",
        allow_blank = true
    },
    {
        setting_type = "startup",
        type = "string-setting",
        name = "planets-to-ignore",
        default_value = "",
        allow_blank = true
    },
    {
        setting_type = "startup",
        type = "string-setting",
        name = "progression-fix-dyson-sphere",
        default_value = "Full",
        allowed_values = {"Full", "Close Sun Orbit", "None"}
    }
})