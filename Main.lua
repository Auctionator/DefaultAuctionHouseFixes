local prev = SortAuctionSetSort
hooksecurefunc("SortAuctionSetSort", function()
  prev("list", "unitprice")
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
