table 50101 "File Handler"
{
    Caption = 'File Handler';
    DataClassification = ToBeClassified;
    Permissions = tabledata "File Handler" = RIMD;

    fields
    {
        field(1; ID; Text[250])
        {
            Caption = 'ID';
            Editable = false;
        }
        field(2; "File Name"; Text[250])
        {
            Editable = false;
            Caption = 'File Name';
        }
        field(3; "File Extension"; Text[250])
        {
            Editable = false;
            Caption = 'File Extenstion';
        }
        field(4; "Attach Date"; DateTime)
        {
            Editable = false;
            Caption = 'Attach Date';
        }
        field(5; Content; Blob)
        {
            Caption = 'Content';
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        Validate("Attach Date", CurrentDateTime);
    end;

    procedure UploadFile(DocumentInStream: instream; FileName: Text)
    var
        fileMgnt: Codeunit "File Management";
        outStream: OutStream;
        RecFileHandler: Record "File Handler";
        intID: Integer;
    begin
        if not RecFileHandler.FindLast() then
            Rec.ID := '1'
        else begin
            Evaluate(intID, RecFileHandler.ID);
            Rec.id := Format(intID + 1);
        end;
        Validate("File Extension", fileMgnt.GetExtension(FileName));
        Validate("File Name", fileMgnt.GetFileNameWithoutExtension(FileName));
        Rec.Content.CreateOutStream(outStream);
        CopyStream(outStream, DocumentInStream);
        Insert(true);
    end;

    procedure DownloadFile()
    var
        inStream: InStream;
        exportFileName: Text;
    begin
        exportFileName := rec."File Name" + '.' + "File Extension";
        Rec.CalcFields(Content);
        if not Content.HasValue then exit;
        Rec.Content.CreateInStream(inStream);
        DownloadFromStream(inStream, '', '', '', exportFileName);
    end;
}
