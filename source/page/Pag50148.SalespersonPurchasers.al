page 50148 SalespersonPurchasers
{
    APIGroup = 'Salesperson';
    APIPublisher = 'SalespersonPurchasers';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'salespersonPurchasers';
    DelayedInsert = true;
    EntityName = 'SalespersonPurchasers';
    EntitySetName = 'SalespersonPurchasers';
    PageType = API;
    SourceTable = "Salesperson/Purchaser";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(avgEstimatedValueLCY; Rec."Avg. Estimated Value (LCY)")
                {
                    Caption = 'Avg. Estimated Value (LCY)';
                }
                field(avgCalcdCurrentValueLCY; Rec."Avg.Calcd. Current Value (LCY)")
                {
                    Caption = 'Avg.Calcd. Current Value (LCY)';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(calcdCurrentValueLCY; Rec."Calcd. Current Value (LCY)")
                {
                    Caption = 'Calcd. Current Value (LCY)';
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(commission; Rec."Commission %")
                {
                    Caption = 'Commission %';
                }
                field(costLCY; Rec."Cost (LCY)")
                {
                    Caption = 'Cost (LCY)';
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                }
                field(durationMin; Rec."Duration (Min.)")
                {
                    Caption = 'Duration (Min.)';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(eMail2; Rec."E-Mail 2")
                {
                    Caption = 'Email 2';
                }
                field(estimatedValueLCY; Rec."Estimated Value (LCY)")
                {
                    Caption = 'Estimated Value (LCY)';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(nextTaskDate; Rec."Next Task Date")
                {
                    Caption = 'Next Task Date';
                }
                field(noOfInteractions; Rec."No. of Interactions")
                {
                    Caption = 'No. of Interactions';
                }
                field(noOfOpportunities; Rec."No. of Opportunities")
                {
                    Caption = 'No. of Opportunities';
                }
                field(opportunityEntryExists; Rec."Opportunity Entry Exists")
                {
                    Caption = 'Opportunity Entry Exists';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                }
                field(searchEMail; Rec."Search E-Mail")
                {
                    Caption = 'Search Email';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(taskEntryExists; Rec."Task Entry Exists")
                {
                    Caption = 'Task Entry Exists';
                }
            }
        }
    }
}
