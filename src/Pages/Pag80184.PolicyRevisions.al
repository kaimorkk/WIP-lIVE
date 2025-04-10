

page 80184 "Policy Revisions"
{
    CardPageID = "Policy Revision";
    Editable = false;
    PageType = List;
    SourceTable = "Policy Revision";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Revision No."; Rec."Revision No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Type"; Rec."Revision Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Dev Institution ID"; Rec."Policy Dev Institution ID")
                {
                    ApplicationArea = Basic;
                }
                field(Summary; Rec.Summary)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Goal"; Rec."Policy Goal")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-To"; Rec."Applies-To")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person"; Rec."Responsible Person")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Revision Date"; Rec."Revision Date")
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

