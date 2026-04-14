return {
  "4tyone/snek-nvim",
  config = function()
    require("snek-nvim").setup({
      api_key = "csk-yk49ty9xkd9mjnxxt9f96vwkk44vr55ndthep4xptf5pd9k3",  -- Get from https://cloud.cerebras.ai
      model="llama3.1-8b",
      keymaps = {
        accept_suggestion = "<C-f>",
      },
    })
  end,
}
