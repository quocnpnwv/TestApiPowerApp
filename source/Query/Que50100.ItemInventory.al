query 50100 ItemInventory
{
    APIGroup = 'item';
    APIPublisher = 'itemLedgerEntry';
    APIVersion = 'v2.0';
    EntityName = 'itemInventory';
    EntitySetName = 'itemInventory';
    QueryType = API;
    
    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Location Code" = filter(<> '');
            
            column(Item_No; "Item No.")
            {

            }
            column(Location_Code; "Location Code")
            {
                
            }
            column(Sum_Quantity; Quantity)
            {
                Method = Sum;
            }
            dataitem(itemsQuery; Item)
            {
                DataItemLink = "No." = Item_Ledger_Entry."Item No.";
                SqlJoinType = LeftOuterJoin;
                column(Picture; Picture)
                {

                }
                column(Category; "Item Category Code")
                {

                }
                column(Description; Description)
                {

                }
                column(unitPrice; "Unit Price")
                {

                }
            }
        }
    }
}
