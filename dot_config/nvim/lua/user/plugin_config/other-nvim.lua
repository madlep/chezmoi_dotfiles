local other = require("other-nvim")

local elixir = {
    -- Elixir umbrella apps
    -- file to test
    {
        pattern = "/apps/(.*)/lib/(.*)%.ex$",
        target = "/apps/%1/test/%2_test.exs",
        context = "test",
    },

    -- test to file
    {
        pattern = "/apps/(.*)/test/(.*)_test%.exs$",
        target = "/apps/%1/lib/%2.ex",
        context = "source",
    },

    -- test to self
    {
        pattern = "/apps/(.*)/test/(.*)_test%.exs$",
        target = "/apps/%1/test/%2_test.exs",
        context = "test",
    },

    -- Elixir regular app
    -- file to test
    {
        pattern = "/lib/(.*).ex$",
        target = "/test/%1_test%.exs",
        context = "test",
    },

    -- test to file
    {
        pattern = "/test/(.*)_test%.exs$",
        target = "/lib/%1.ex",
        context = "source",
    },

    -- test to self
    {
        pattern = "/test/(.*)_test%.exs$",
        target = "/test/%1_test%.exs",
        context = "test",
    },
}

local go = {
    -- file to test
    {
        pattern = "(.*)%.go$",
        target = "%1_test.go",
        context = "test",
    },

    -- test to file
    {
        pattern = "(.*)_test%.go$",
        target = "%1.go",
        context = "source",
    },
}

local function concat_mappings(mappings, mapping)
    for i = 1, #mapping do
        mappings[#mappings + 1] = mapping[i]
    end
end

local mappings = {}
concat_mappings(mappings, elixir)
concat_mappings(mappings, go)

other.setup({
    mappings = mappings,
    showMissingFiles = false,
})
