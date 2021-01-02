LibDeflate = require "lua/vendor/LibDeflate"

function parse(original)
  local output = {}

  local clean = original:gsub("\n", " "):gsub("\t", " ")
  for match in (clean.." "):gmatch("(.-) ") do
    table.insert(output, match)
  end
  
  return output
end

function encode(gdocString)
  local players = {}

  -- Remove line breaks and tabs, and collapse multiple white spaces into a single one
  local cleanGdocString = gdocString:gsub("\n", " "):gsub("\t", " "):gsub(" +", " ")
  -- Iterate over space-delimited items
  for player in (cleanGdocString.." "):gmatch("(.-) ") do
    -- Insert each item in table, ignoring empty items
    if string.len(player) > 0 and player ~= " " then
      table.insert(players, player)
    end
  end

  -- Build ERT plaintext import string
  local ertString = "0,{"

  for k, player in pairs(players) do
    ertString = ertString .. "\"" .. player .. "\""
    if k < #players then
      ertString = ertString .. ","
    end
  end

  ertString = ertString .. "}"

  print(ertString)

  local compressed = LibDeflate:CompressDeflate(ertString, { level = 5 })

  local encoded = "EXRTRGR1" .. LibDeflate:EncodeForPrint(compressed)

  return encoded

end

local input = io.read("*all")

encoded = encode(input)

print(encoded)