-- Barbarian hard cap: trim newest units if over cap
do
  local DEBUG = true
  local MAX_BARB_UNITS = 250  -- 필요하면 200~400 사이로 조절

  local function TrimBarbarians(pBarb)
    -- 유닛 목록 모으기
    local list, count = {}, 0
    for u in pBarb:Units() do
      count = count + 1
      list[#list+1] = u
    end
    if count <= MAX_BARB_UNITS then
      if DEBUG then print(string.format("[BarbCap] ok: %d/%d", count, MAX_BARB_UNITS)) end
      return
    end

    -- ID 큰 순(=새로 생긴 순)으로 정렬해서 최근분부터 제거
    table.sort(list, function(a,b) return a:GetID() > b:GetID() end)

    local toKill = count - MAX_BARB_UNITS
    local killed = 0
    for i = 1, #list do
      if toKill <= 0 then break end
      local u = list[i]
      if u and not u:IsDelayedDeath() then
        u:Kill(true)
        killed = killed + 1
        toKill = toKill - 1
      end
    end
    if DEBUG then
      print(string.format("[BarbCap] trimmed %d -> now <= %d", killed, MAX_BARB_UNITS))
    end
  end

  GameEvents.PlayerDoTurn.Add(function(iPlayer)
    local p = Players[iPlayer]
    if p and p:IsBarbarian() then
      TrimBarbarians(p)
    end
  end)
end
