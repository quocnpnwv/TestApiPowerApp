page 50149 "Api Sales Order v2."
{
    APIGroup = 'apiSalesOrder';
    APIPublisher = 'Sales';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiSalesOrderV2';
    DelayedInsert = true;
    EntityName = 'SalesOrderQN';
    EntitySetName = 'SalesOrderQN';
    PageType = API;
    SourceTable = "Sales Header";
    InsertAllowed = true;
    ModifyAllowed = true;
    SourceTableView = WHERE("Document Type" = FILTER(Order));
    ODataKeyFields = "No.";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No"; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'no';
                }
                field(orderDate; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'customerNo';
                }
                field(documentType; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field(noSeries;Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                part(salesLine; "SalesLine")
                {
                    SubPageLink = "Document No."= FIELD("No.");
                    EntityName = 'salesLine';
                    EntitySetName = 'salesLine';
                }
            }
        }
    }
}
