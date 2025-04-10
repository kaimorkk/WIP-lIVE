Page 52193964 "Bracket Tables"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Bracket Tablesx1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(BracketCode;"Bracket Code")
                {
                    ApplicationArea = Basic;
                }
                field(BracketDescription;"Bracket Description")
                {
                    ApplicationArea = Basic;
                }
                field(Annual;Annual)
                {
                    ApplicationArea = Basic;
                }
                field(EffectiveStartingDate;"Effective Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EffectiveEndDate;"Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Brackets)
            {
                ApplicationArea = Basic;
                Caption = 'Brackets';
                RunObject = Page "Tax Table";
                RunPageLink = "Table Code"=field("Bracket Code");
                RunPageOnRec = false;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Brackets_Promoted; Brackets)
                {
                }
            }
        }
    }
}

