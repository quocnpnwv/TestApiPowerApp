page 50101 "Item Ledger Entry List"
{
    ApplicationArea = All;
    Caption = 'Item Ledger Entry List';
    PageType = List;
    SourceTable = ItemInventory;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Quantity; Rec.Quantity)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        lQue_ItemInventory: Query ItemInventory;
    begin
        lQue_ItemInventory.Open();
        while lQue_ItemInventory.Read() do begin
            Rec.Quantity := lQue_ItemInventory.Sum_Quantity;
            Rec."Item No." := lQue_ItemInventory.Item_No;
            Rec."Location Code" := lQue_ItemInventory.Location_Code;
        end;
        Rec.Insert(true);
    end;
}
