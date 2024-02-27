local function si(icon, color, name)
  return {
    icon = icon,
    color = color,
    name = name
  }
end
return {
  "nvim-tree/nvim-web-devicons",
  config = function ()
    require("nvim-web-devicons").setup({
      color_icons = true;
      strict = true;
      override_by_extension = {
        java = si("", "#e46368", "java"),
        gitignore = si("", "#428850", "GitIgnore"),
        js = si("", "#f7cd6d", "JavaScript"),
        json = si("", "#f7cd6d", "JSON"),
        ts = si("󰛦", "#87b2e2", "TypeScript"),
        html = si("", "#de7558", "HTML"),
        rb = si("", "#ef757c", "Ruby"),
        rake = si("", "#ef757c", "Rake"),
        rakefile = si("", "#ef757c", "RakeFile"),
        jbuilder = si("", "#f7cd6d", "Jbuilder"),
      };
    })
  end
}
