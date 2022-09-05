local originalSortAuctionSetSort = SortAuctionSetSort
hooksecurefunc("SortAuctionSetSort", function()
  originalSortAuctionSetSort("list", "unitprice")
end)

hooksecurefunc("MoneyFrame_Update", function(frameName, money)
  local buyoutMoneyFrameName = "BrowseButton1BuyoutFrameMoney"
  if frameName == buyoutMoneyFrameName or _G[buyoutMoneyFrameName] == frameName  then
    local count = 1
    if BrowseButton1ItemCount:IsShown() then
      count = tonumber(BrowseButton1ItemCount:GetText())
    end
    print("unit price", GetMoneyString(math.floor(money / count)))
  end
end)


AuctionHouseFixesMixin = {}

function AuctionHouseFixesMixin:OnLoad()
  self:RegisterEvent("AUCTION_HOUSE_SHOW")
end

function AuctionHouseFixesMixin:OnEvent()
  self:UnregisterEvent("AUCTION_HOUSE_SHOW")
  BrowseBuyoutButton:HookScript("OnClick", function()
    StaticPopup1Button1:Click()
  end)
end
