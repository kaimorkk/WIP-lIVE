

page 70011 "Procurement Financial Ceilings"
{
    PageType = List;
    SourceTable = "Procurement Financial ceilings";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Method of Procurement"; Rec."Method of Procurement")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Ceiling"; Rec."Minimum Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Ceiling"; Rec."Maximum Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Procument Description"; Rec."Procument Description")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Class"; Rec."Procurement Class")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Effective date"; Rec."Effective date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Effective Date';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

