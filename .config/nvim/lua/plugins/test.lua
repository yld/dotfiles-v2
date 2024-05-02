-- https://www.lazyvim.org/extras/test/core
return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-jest",
    },
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-rspec",
        "neotest-elixir",
        "neotest-jest",
      },
    },
  },
}
