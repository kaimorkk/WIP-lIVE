

page 95017 "Risk Categories"
{
    CardPageID = "Risk Category";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Category";
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
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic Pillar';
                }
                field("Addditiona Comments"; Rec."Addditiona Comments")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Triggers"; Rec."No. of Risk Triggers")
                {
                    ApplicationArea = Basic;
                }
                field("No of Strategic Risks"; Rec."No of Strategic Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Operational Risks"; Rec."No of Operational Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Project Risks"; Rec."No of Project Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Incidents"; Rec."No. of Incidents")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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

