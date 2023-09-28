tableextension 50122 Customer_Ext extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Attach Template"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "File Name"; Text[250])
        {
            Caption = 'File Name';
            DataClassification = ToBeClassified;
        }
        field(50102; "File Extension"; Text[250])
        {
            Caption = 'File Extenstion';
            DataClassification = ToBeClassified;
        }
        field(50103; "Attach Date"; DateTime)
        {
            Caption = 'Attach Date';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnBeforeModify()
    begin
        Validate("Attach Date", CurrentDateTime);
    end;

    procedure DownloadFile()
    var
        inStream: InStream;
        exportFileName: Text;
    begin
        exportFileName := rec."File Name".Split('.').Get(1) + '.' + "File Extension";
        Rec.CalcFields("Attach Template");
        if not "Attach Template".HasValue then exit;
        Rec."Attach Template".CreateInStream(inStream);
        DownloadFromStream(inStream, '', '', '', exportFileName);
    end;

    var
        myInt: Integer;

}