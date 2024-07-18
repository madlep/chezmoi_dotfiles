return {
    settings = {
        yaml = {
            maxItemsComputed = 50000, -- default 5000 is too small
            validate = true,
            schemas = {
                ["file:///Users/jdoherty/src/opensource/darkf/darkf-schema.json"] = "*.darkf.{yml,yaml}"
            }
        }
    },
}
