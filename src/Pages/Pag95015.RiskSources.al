

page 95015 "Risk Sources"
{
    Caption = 'Strategic Pillars';
    CardPageID = "Risk Source";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Source";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("<Source_ID>"; Rec."Source ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic_Pillar';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Risk Categories"; Rec."No. Of Risk Categories")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Risks"; Rec."No. Of Risks")
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

