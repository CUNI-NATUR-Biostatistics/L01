-- rn-shorthand.lua
-- Pandoc Lua filter: expands .rn-{type}-{color} shorthand classes into
-- roughnotation attributes understood by the roughnotation Quarto extension.
--
-- Shorthand class pattern: rn-{type}-{color}
-- Example: {.rn-underline-indigo} expands to:
--   class: rn-fragment fragment
--   attributes: rn-type="underline" rn-color="#5D2890"
--
-- Supported types: underline, box, circle, highlight, cross, bracket
-- Supported colors: indigo, orange, amethyst, olive, graphite, red

local color_map = {
  indigo   = "#5D2890",
  orange   = "#F3A712",
  amethyst = "#86579E",
  olive    = "#8A8A8A",
  graphite = "#2E2E2E",
  red      = "#C94C4C"
}

local type_map = {
  underline = "underline",
  box       = "box",
  circle    = "circle",
  highlight = "highlight",
  cross     = "crossed-off",
  bracket   = "bracket"
}

local function expand_rn(el)
  local new_classes = {}
  local matched = false

  for _, cls in ipairs(el.classes) do
    local rn_type, rn_color = cls:match("^rn%-([a-z]+)%-([a-z]+)$")
    if rn_type and type_map[rn_type] and color_map[rn_color] then
      matched = true
      el.attributes["rn-type"]  = type_map[rn_type]
      el.attributes["rn-color"] = color_map[rn_color]
      -- Add required roughnotation classes (avoid duplicates)
      table.insert(new_classes, "rn-fragment")
      table.insert(new_classes, "fragment")
    else
      table.insert(new_classes, cls)
    end
  end

  if matched then
    el.classes = new_classes
    return el
  end
end

return {
  { Span = expand_rn },
  { Div  = expand_rn }
}
