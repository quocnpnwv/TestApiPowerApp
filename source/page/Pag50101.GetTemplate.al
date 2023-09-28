page 50130 GetTemplate
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Trinc';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'getTemplate';
    DelayedInsert = true;
    EntityName = 'GetTemplate';
    EntitySetName = 'getTemplates';
    PageType = API;
    SourceTable = "File Handler";
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
                field(ContectTemp; Rec.Content)
                {
                    Caption = 'Content';
                }
                field(fileExtension; Rec."File Extension")
                {
                    Caption = 'File Extenstion';
                }
                field(fileName; Rec."File Name")
                {
                    Caption = 'File Name';
                }
                field(id; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(lenght; lenght)
                {
                    Caption = 'ID';
                }
                field(text2; text2)
                {
                    Caption = 'ID';
                }
                field(text3; text3)
                {
                    Caption = 'ID';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Content);
        if not Rec.Content.HasValue then Message('Dont have Content');
        lenght := Rec.Content.Length();
        text2 := Format(rec.Content);
    end;

    // trigger OnAfterGetRecord()
    // var
    //     TypeHelper: Codeunit "Type Helper";
    //     InStream: InStream;
    // begin
    //     Rec.CalcFields(Content);
    //     Rec.Content.CreateInStream(InStream, TEXTENCODING::UTF8);
    //     TypeHelper.TryReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator(), text3);
    // end;

    var
        lenght: Integer;
        text2: text;
        text3: text;
}
