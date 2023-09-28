page 50125 "File Handler"
{
    ApplicationArea = All;
    Caption = 'File Handler';
    PageType = Worksheet;
    SourceTable = "File Handler";
    UsageCategory = Tasks;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("File Name"; Rec."File Name")
                {
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("File Extenstion"; Rec."File Extension")
                {
                    ToolTip = 'Specifies the value of the File Extenstion field.';
                }
                field("Attach Date"; Rec."Attach Date")
                {
                    ToolTip = 'Specifies the value of the Attach Date field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportFile)
            {
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    filePath: Text;
                    inStream: InStream;
                begin
                    if UploadIntoStream('Choose File', '', '', filePath, inStream) then
                        Rec.UploadFile(inStream, filePath);
                end;
            }
            action(ExportFile)
            {
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                begin
                    Rec.DownloadFile();
                end;
            }
        }
    }

}
