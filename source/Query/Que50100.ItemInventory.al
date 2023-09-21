query 50100 ItemInventory
{
    APIGroup = 'item';
    APIPublisher = 'itemLedgerEntry';
    APIVersion = 'v2.0';
    EntityName = 'itemInventory';
    EntitySetName = 'itemInventory';
    QueryType = API;
    //SourceTableView = where("Location Code" = filter(<> ''), Quantity = filter( > 0));
    //QueryCategory 

    elements
    {
        dataitem(itemLocation; Location)
        {
            column(LocationCode; Code)
            {
            }
            dataitem(itemsQuery; item)
            {
                DataItemLink = "Location Filter" = itemLocation.code;
                SqlJoinType = InnerJoin;
                column(No; "No.")
                {
                }
                column(Picture; Picture)
                {
                }
                column(Description; Description)
                {
                }
                column(categoryCode; "Item Category Code")
                {
                }
                column(Inventory; Inventory)
                {
                }
                column(Price; "Unit Price")
                {
                }
             
            }
        }
    }


}
