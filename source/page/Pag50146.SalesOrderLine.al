page 50146 "Sales Order Line"
{
    APIGroup = 'SalesOrderLine';
    APIPublisher = 'Sales';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'salesOrderLine';
    DelayedInsert = true;
    EntityName = 'SalesOrderLineQN';
    EntitySetName = 'SalesOrderLineQN';
    PageType = API;
    SourceTable = "Sales Line";
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                }
                field(documentNo; Rec."Document No.")
                {
                }
                field(documentType; Rec."Document Type")
                {
                }
                field(quantity; Rec.Quantity)
                {
                }
                field(lineAmount; Rec."Line Amount")
                {
                }
                field(description; Rec.Description)
                {
                }
            }
        }
    }
}
