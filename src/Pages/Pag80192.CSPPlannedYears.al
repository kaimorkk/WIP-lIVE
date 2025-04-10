page 80192 "CSP Planned Years"
{
    PageType = List;
    SourceTable = "CSP Planned Years";
    Caption = 'Implementation Years';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Annual Year Code"; Rec."Annual Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Year Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Current"; Rec.Current)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
    }
}


