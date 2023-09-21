page 50147 SalesLine
{
    ApplicationArea = All;
    Caption = 'salesLine';
    DelayedInsert = true;
    InsertAllowed = true;
    ODataKeyFields = SystemId;
    PageType = ListPart;
    SourceTable = "Sales Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field(lineAmount; Rec."Line Amount")
                {
                    ApplicationArea = All;
                }
                field(systemID; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
