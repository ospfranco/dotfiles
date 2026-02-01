local function get_system_theme()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result:match("Dark") then
      return "github_dark"
    end
  end
  return "github_light"
end

return {
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = get_system_theme(),
    },
  },
}
