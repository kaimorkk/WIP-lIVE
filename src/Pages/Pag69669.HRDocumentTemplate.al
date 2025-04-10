

page 69669 "HR-Document Template"
{
    PageType = Card;
    SourceTable = "HR Document Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part("Profile Registration"; "Document Template Lines")
            {
                Caption = 'Profile Registration';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Profile Registration"));
                ApplicationArea = Basic;
            }
            part("Job Application"; "Document Template Lines")
            {
                Caption = 'Job Application';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Job Application"));
                ApplicationArea = Basic;
            }
            part("Contract Issuance"; "Document Template Lines")
            {
                Caption = 'Contract Issuance';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Contract Issuance"));
                ApplicationArea = Basic;
            }
            part("Promotions & Transfers"; "Document Template Lines")
            {
                Caption = 'Promotions & Transfers';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Promotion/Transfers"));
                ApplicationArea = Basic;
            }
            part("Disciplinary Matters"; "Document Template Lines")
            {
                Caption = 'Disciplinary Matters';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter(Disciplinary));
                ApplicationArea = Basic;
            }
            part("Staff Exit"; "Document Template Lines")
            {
                Caption = 'Staff Exit';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Staff Exit"));
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

