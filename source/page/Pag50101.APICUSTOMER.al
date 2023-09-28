page 50127 APICUSTOMER
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Trinc';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apicustomer';
    DelayedInsert = true;
    EntityName = 'entityCustomer';
    EntitySetName = 'entityCustomers';
    PageType = API;
    SourceTable = Customer;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(attachDate; Rec."Attach Date")
                {
                    Caption = 'Attach Date';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                }
                field(attachTemplate; Rec."Attach Template")
                {
                    Caption = 'Attach Template';
                }
                field(fileExtension; Rec."File Extension")
                {
                    Caption = 'File Extenstion';
                }
                field(fileName; Rec."File Name")
                {
                    Caption = 'File Name';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Attach Template");
        if not Rec."Attach Template".HasValue then Message('Dont have Content');
        lenght := Rec."Attach Template".Length();
        text2 := Format(rec."Attach Template");
    end;

    var
        lenght: Integer;
        text2: text;
        text3: text;
}
