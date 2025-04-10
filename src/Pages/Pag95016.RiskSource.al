

page 95016 "Risk Source"
{
    Caption = 'Strategic Pillar';
    PageType = Card;
    SourceTable = "Risk Source";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Source ID"; Rec."Source ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic Pillar';
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

