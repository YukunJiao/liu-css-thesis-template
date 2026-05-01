local function stringify(x)
  if x == nil then
    return ""
  end
  return pandoc.utils.stringify(x)
end

local function latex_escape(str)
  if str == nil then
    return ""
  end
  str = tostring(str)
  str = str:gsub("\\", "\\textbackslash{}")
  str = str:gsub("([%%#&_$])", "\\%1")
  str = str:gsub("{", "\\{")
  str = str:gsub("}", "\\}")
  str = str:gsub("%^", "\\textasciicircum{}")
  str = str:gsub("~", "\\textasciitilde{}")
  return str
end

local function cmd(name, value)
  return "\\" .. name .. "{" .. latex_escape(value) .. "}"
end

local function bool_meta(x, default)
    if x == nil then
      return default
    end
    if type(x) == "boolean" then
      return x
    end
    local s = stringify(x):lower()
    if s == "false" or s == "no" or s == "0" then
      return false
    end
    if s == "true" or s == "yes" or s == "1" then
      return true
    end
    return default
  end

function Meta(meta)
  local thesis = meta["msc-thesis"] or {}

  local author = stringify(thesis["author-name"])
  local publication_year       = stringify(thesis["publication-year"])
  local thesis_number          = stringify(thesis["thesis-number"])
  local department             = stringify(thesis["department"])
  local department_english     = stringify(thesis["department-english"])
  local department_short       = stringify(thesis["department-short"])
  local area                   = stringify(thesis["area"])
  local thesis_subject         = stringify(thesis["thesis-subject"])
  local thesis_subject_english = stringify(thesis["thesis-subject-english"])
  local keywords               = stringify(thesis["keywords"])
  local keywords_swedish       = stringify(thesis["keywords-swedish"])
  local title_english          = stringify(thesis["title-english"])
  local title_swedish          = stringify(thesis["title-swedish"])
  local subtitle_english       = stringify(thesis["subtitle-english"])
  local subtitle_swedish       = stringify(thesis["subtitle-swedish"])
  local supervisor             = stringify(thesis["supervisor"])
  local examiner               = stringify(thesis["examiner"])

  local show_acknowledgments = thesis["show-acknowledgments"]
  local ack = bool_meta(show_acknowledgments, true)

  local lines = {}

  table.insert(lines, "%%% settings.tex --- auto-generated; do not edit by hand")
  table.insert(lines, "")
  table.insert(lines, "")
  table.insert(lines, "\\ifxetex")
  table.insert(lines, "%\\setmainfont [Scale=1]{Georgia}")
  table.insert(lines, "\\fi")
  table.insert(lines, "")
  table.insert(lines, "\\setcounter{secnumdepth}{3}")
  table.insert(lines, "\\setcounter{tocdepth}{1}")
  table.insert(lines, "")
  table.insert(lines, "")

  table.insert(lines, cmd("author", author))
  table.insert(lines, "\\makeatletter")
  table.insert(lines, "\\AtBeginDocument{%")
  table.insert(lines, "  \\gdef\\@author{" .. latex_escape(author) .. "}%")
  table.insert(lines, "}")
  table.insert(lines, "\\makeatother")
  table.insert(lines, "")
  table.insert(lines, cmd("publicationyear", publication_year))
  table.insert(lines, cmd("currentyearthesisnumber", thesis_number))
  table.insert(lines, cmd("department", department))
  table.insert(lines, cmd("departmentenglish", department_english))
  table.insert(lines, cmd("departmentshort", department_short))
  table.insert(lines, cmd("area", area))
  table.insert(lines, cmd("thesissubject", thesis_subject))
  table.insert(lines, cmd("thesissubjectenglish", thesis_subject_english))
  table.insert(lines, cmd("keywords", keywords))
  table.insert(lines, cmd("keywordsswedish", keywords_swedish))
  table.insert(lines, cmd("titleenglish", title_english))
  table.insert(lines, cmd("titleswedish", title_swedish))
  table.insert(lines, cmd("subtitleenglish", subtitle_english))
  table.insert(lines, cmd("subtitleswedish", subtitle_swedish))
  table.insert(lines, cmd("supervisor", supervisor))
  table.insert(lines, cmd("examiner", examiner))
  table.insert(lines, "")
  
  table.insert(lines, "\\newif\\ifshowacknowledgments")
  table.insert(lines, ack and "\\showacknowledgmentstrue" or "\\showacknowledgmentsfalse")
  table.insert(lines, "")

  local out = io.open("settings.tex", "w")
  if not out then
    io.stderr:write("ERROR: could not write settings.tex\n")
    return meta
  end

  out:write(table.concat(lines, "\n"))
  out:close()

  return meta
end