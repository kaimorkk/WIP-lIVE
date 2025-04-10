

page 69755 "Referee Recommendation"
{
    CardPageID = "Referee Recommendation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Referee Recommendation";
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Background Checks Invitation"; Rec."Background Checks Invitation")
                {
                    ApplicationArea = Basic;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Referee Id"; Rec."Referee Id")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation"; Rec."Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Known From"; Rec."Known From")
                {
                    ApplicationArea = Basic;
                }
                field("Known To"; Rec."Known To")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate Last Job Title"; Rec."Candidate Last Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Exit Reason Code"; Rec."Staff Exit Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Recommend For Hire"; Rec."Recommend For Hire")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

