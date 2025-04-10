

page 75014 "Procurement Document Type"
{
    PageType = List;
    SourceTable = "Procurement Document Type";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Class"; Rec."Document Class")
                {
                    ApplicationArea = Basic;
                }
                field("Document Category"; Rec."Document Category")
                {
                    ApplicationArea = Basic;
                }
                field("Track Certificate Expiry"; Rec."Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                }
                field("Issuing Agency Code"; Rec."Issuing Agency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Local Verification URL"; Rec."Local Verification URL")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Requirement"; Rec."Special Group Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed RFI-Response"; Rec."No. of Filed RFI-Response")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Bid Response"; Rec."No. of Filed Bid Response")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Vendor Registration Document")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                RunObject = Page "Vendor Registration Document";
                RunPageLink = Code = field(Code);
                Visible = false;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Vendor Registration Document_Promoted"; "Vendor Registration Document")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

