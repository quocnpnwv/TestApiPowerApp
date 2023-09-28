/// <summary>
/// Page MyPage (ID 50100).
/// </summary>
page 50120 TestingEmail
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send Email")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    email: Codeunit Email;
                    emailMess: codeunit "Email Message";
                begin
                    emailMess.Create('trinc@naviworld.com.vn', 'Header', 'Body');
                    email.Send(emailMess, enum::"Email Scenario"::Default);
                end;
            }
            action("Testing PDF")
            {
                ApplicationArea = All;

                trigger OnAction()
                var

                    TempBlob_lRec: Codeunit "Temp Blob";
                    Out: OutStream;
                    RecRef: RecordRef;
                    FileManagement_lCdu: Codeunit "File Management";
                    SalesHeader_lRec: Record "Sales Header";
                begin
                    TempBlob_lRec.CreateOutStream(Out, TEXTENCODING::UTF8);  // Create Outstream
                    // Record filter
                    SalesHeader_lRec.Reset;
                    SalesHeader_lRec.Setrange("Document Type", Rec."Document Type"::Order);
                    SalesHeader_lRec.FindFirst();
                    RecRef.GetTable(SalesHeader_lRec);

                    // REPORT “SAVEAS” and BLOBExport
                    REPORT.SAVEAS(report::"Sales Document - Test", '', REPORTFORMAT::Pdf, Out, RecRef);    // save report in TempBlob di recRef
                    FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('Proforma_%1.Pdf', Rec."No."), TRUE);   // export report in PDF format
                end;
            }
        }
    }

    var
        myInt: Integer;

    procedure SendEasiestEMail()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create('', 'This is the subject', 'This is the body');
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailWithAttachment()
    var
        ReportExample: Report "Standard Sales - Invoice";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        InStr: Instream;
        OutStr: OutStream;
        ReportParameters: Text;
    begin
        ReportParameters := ReportExample.RunRequestPage();
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Standard Sales - Invoice", ReportParameters, ReportFormat::Pdf, OutStr);
        TempBlob.CreateInStream(InStr);

        EmailMessage.Create('your email goes here', 'This is the subject', 'This is the body');
        EmailMessage.AddAttachment('FileName.pdf', 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailWithPreviewWindow()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create('your email goes here', 'This is the subject', 'This is the body');
        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailWithPreviewWindowHtmlFormatBody()
    var
        Customer: Record Customer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text;
    begin
        Customer.FindFirst();
        Customer.CalcFields(Balance);
        Body := '<h3>TO MESSRS: ' + Customer.Name + '</h3>ATT : ACCOUNTING DEPARTMENT </br> </h3> <hr></br>Your current balance with us is:</br></br><strong>' + format(Customer.Balance) + '</strong></br></br><hr></br>Best regards,</br></br>Financial Department</br></br>Spain</br> <img src="https://businesscentralgeek.com/wp-content/uploads/2022/06/Imagen3.jpg" />';

        EmailMessage.Create('your email goes here', 'This is the subject', Body, true);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEMail()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Cancelled: Boolean;
        MailSent: Boolean;
        Selection: Integer;
        OptionsLbl: Label 'Send,Open Preview';
        ListTo: List of [Text];
    begin
        Selection := Dialog.StrMenu(OptionsLbl);
        ListTo.Add('your email goes here');
        EmailMessage.Create(ListTo, 'This is the subject', 'This is the body', true);
        Cancelled := false;
        if Selection = 1 then
            MailSent := Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        if Selection = 2 then begin

            MailSent := Email.OpenInEditorModally(
                EmailMessage, Enum::"Email Scenario"::Default) = Enum::"Email Action"::Sent;
            Cancelled := not MailSent;
        end;

        if (Selection <> 0) and not MailSent and not Cancelled then
            Error(GetLastErrorText());
    end;
}