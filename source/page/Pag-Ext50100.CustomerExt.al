pageextension 50100 Customer_Ext extends "Customer Card"
{
    layout
    {
        addfirst(General)
        {
            field("File Name"; Rec."File Name")
            {
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the File Name field.';
                trigger OnDrillDown()
                var
                    myInt: Integer;
                begin
                    Rec.DownloadFile();
                end;
            }
            field("File Extenstion"; Rec."File Extension")
            {
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the File Extenstion field.';
            }
            field("Attach Date"; Rec."Attach Date")
            {
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Attach Date field.';
            }
        }
    }
}
