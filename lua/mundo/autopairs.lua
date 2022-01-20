local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end
autopairs.setup({
  check_ts = true,
  fast_wrap = {
    map = '<M-l>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    end_key = 'l',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
})
