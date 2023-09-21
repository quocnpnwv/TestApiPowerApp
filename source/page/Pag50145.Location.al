page 50145 Location
{
    APIGroup = 'apiGroup';
    APIPublisher = 'location';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'location';
    DelayedInsert = true;
    EntityName = 'location';
    EntitySetName = 'location';
    PageType = API;
    SourceTable = Location;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
            }
        }
    }
}
